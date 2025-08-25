package com.mattysparkles.exwayble

import android.app.Activity
import android.content.Context
import android.net.Uri
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import no.nordicsemi.android.dfu.DfuBaseService
import no.nordicsemi.android.dfu.DfuProgressListenerAdapter
import no.nordicsemi.android.dfu.DfuServiceController
import no.nordicsemi.android.dfu.DfuServiceInitiator
import no.nordicsemi.android.dfu.DfuServiceListenerHelper
import java.util.UUID

/**
 * Thin wrapper around Nordic's DFU library used to update board firmware.
 * The class exposes progress and status as [StateFlow]s for UI consumption.
 */
class FirmwareUpdater(private val context: Context, private val logger: BleLogger = BleLogger()) {

    companion object {
        val DFU_SERVICE_UUID: UUID = UUID.fromString("00001530-1212-efde-1523-785feabcd123")
        val DFU_CONTROL_POINT_UUID: UUID = UUID.fromString("00001531-1212-efde-1523-785feabcd123")
        val DFU_PACKET_UUID: UUID = UUID.fromString("00001532-1212-efde-1523-785feabcd123")
        val DFU_BUTTONLESS_CHAR_UUID: UUID = UUID.fromString("00001534-1212-efde-1523-785feabcd123")
    }

    private val _progress = MutableStateFlow(0)
    val progress: StateFlow<Int> = _progress

    private val _status = MutableStateFlow("idle")
    val status: StateFlow<String> = _status

    private var controller: DfuServiceController? = null

    private val listener = object : DfuProgressListenerAdapter() {
        override fun onDeviceConnected(deviceAddress: String) {
            _status.value = "connected"
        }
        override fun onProgressChanged(deviceAddress: String, percent: Int, speed: Float, avgSpeed: Float, currentPart: Int, partsTotal: Int) {
            _progress.value = percent
            _status.value = "updating"
        }
        override fun onDfuCompleted(deviceAddress: String) {
            _status.value = "completed"
        }
        override fun onError(deviceAddress: String, error: Int, errorType: Int, message: String) {
            _status.value = "error: $message"
        }
    }

    /** Kicks off the DFU process for [address] using the provided [file]. */
    fun start(address: String, file: Uri) {
        DfuServiceListenerHelper.registerProgressListener(context, listener)
        val initiator = DfuServiceInitiator(address)
            .setZip(file, null)
            .setKeepBond(true)
            .setDisableNotification(true)
        controller = initiator.start(context, ExwayDfuService::class.java)
        logger.log("DFU start: $address")
    }

    /** Aborts an in‑progress update if possible. */
    fun cancel() {
        controller?.abort()
        _status.value = "cancelled"
    }

    /** Sends the magic byte sequence that puts the ESC into DFU mode. */
    fun triggerDfuMode(write: (ByteArray) -> Unit) {
        write(byteArrayOf(0x01))
        logger.log("DFU mode command sent")
    }

    /** Frees listener resources; call from lifecycle "onDestroy". */
    fun release() {
        DfuServiceListenerHelper.unregisterProgressListener(context, listener)
    }
}

class ExwayDfuService : DfuBaseService() {
    override fun getNotificationTarget(): Class<out Activity> = Activity::class.java
    override fun isDebug(): Boolean = true
}

