package com.mattysparkles.exwayble

import android.Manifest
import android.bluetooth.*
import android.bluetooth.le.ScanCallback
import android.bluetooth.le.ScanFilter
import android.bluetooth.le.ScanResult
import android.bluetooth.le.ScanSettings
import android.content.Context
import android.content.pm.PackageManager
import android.os.Handler
import android.os.Looper
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.callbackFlow
import kotlinx.coroutines.channels.awaitClose
import java.util.UUID
import com.mattysparkles.exwayble.models.BatteryStatus
import com.mattysparkles.exwayble.models.SpeedTelemetry
import com.mattysparkles.exwayble.utils.enableNotifications
import com.mattysparkles.exwayble.utils.toHexString

/**
 * High level helper that scans for Exway skateboards, establishes a
 * connection and exposes telemetry streams.  The class is intentionally
 * stateful and designed for a single device connection at a time.
 */
class ExwayBleManager(private val context: Context, private val logger: BleLogger = BleLogger()) {

    companion object {
        val EXWAY_GATT_SERVICE_UUID: UUID = UUID.fromString("0000fee7-0000-1000-8000-00805f9b34fb")
        val EXWAY_WRITE_CHAR_UUID: UUID = UUID.fromString("000036f5-0000-1000-8000-00805f9b34fb")
        val EXWAY_NOTIFY_CHAR_UUID: UUID = UUID.fromString("000036f6-0000-1000-8000-00805f9b34fb")
    }

    private val bluetoothManager = context.getSystemService(BluetoothManager::class.java)
    private val bluetoothAdapter = bluetoothManager?.adapter
    private val scanner get() = bluetoothAdapter?.bluetoothLeScanner

    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private var gatt: BluetoothGatt? = null
    private var notifyChar: BluetoothGattCharacteristic? = null
    private var writeChar: BluetoothGattCharacteristic? = null
    private var reconnectAttempts = 0
    private var reconnectJob: Job? = null

    private val _telemetry = MutableSharedFlow<SpeedTelemetry>(replay = 1)
    val telemetry: SharedFlow<SpeedTelemetry> = _telemetry.asSharedFlow()

    private val _batteryStatus = MutableStateFlow<BatteryStatus?>(null)
    val batteryStatus: StateFlow<BatteryStatus?> = _batteryStatus.asStateFlow()

    private val handler = Handler(Looper.getMainLooper())

    /**
     * Begins scanning for Exway devices advertising the known service UUID.
     * The resulting [BluetoothDevice]s are emitted through a cold
     * [kotlinx.coroutines.flow.Flow].
     */
    fun startScan() = callbackFlow {
        if (!context.packageManager.hasSystemFeature(PackageManager.FEATURE_BLUETOOTH_LE)) {
            close(IllegalStateException("BLE not supported"))
            return@callbackFlow
        }
        if (bluetoothAdapter?.isEnabled != true) {
            close(IllegalStateException("Bluetooth disabled"))
            return@callbackFlow
        }
        val perm = context.checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION)
        if (perm != PackageManager.PERMISSION_GRANTED) {
            close(IllegalStateException("Location permission missing"))
            return@callbackFlow
        }
        val filter = ScanFilter.Builder().setServiceUuid(android.os.ParcelUuid(EXWAY_GATT_SERVICE_UUID)).build()
        val cb = object : ScanCallback() {
            override fun onScanResult(callbackType: Int, result: ScanResult) {
                trySend(result.device)
            }
        }
        scanner?.startScan(listOf(filter), ScanSettings.Builder().build(), cb)
        awaitClose { scanner?.stopScan(cb) }
    }

    /** Connects to [device] cancelling any existing connection. */
    fun connect(device: BluetoothDevice) {
        reconnectJob?.cancel()
        gatt?.close()
        logger.log("Connecting to ${device.address}")
        gatt = device.connectGatt(context, false, gattCallback, BluetoothDevice.TRANSPORT_LE)
    }

    /** Terminates the active GATT connection if present. */
    fun disconnect() {
        reconnectJob?.cancel()
        gatt?.disconnect()
        gatt?.close()
        gatt = null
    }

    /** Sends a raw vendor command to the skateboard. */
    fun writeCommand(data: ByteArray) {
        val char = writeChar ?: return
        char.value = data
        gatt?.writeCharacteristic(char)
        logger.log("Write: ${data.toHexString()}")
    }

    /** Core GATT callback wiring connection and notification events. */
    private val gattCallback = object : BluetoothGattCallback() {
        override fun onConnectionStateChange(gatt: BluetoothGatt, status: Int, newState: Int) {
            if (status == BluetoothGatt.GATT_SUCCESS && newState == BluetoothProfile.STATE_CONNECTED) {
                logger.log("Connected, discovering services")
                handler.post { gatt.discoverServices() }
            } else if (newState == BluetoothProfile.STATE_DISCONNECTED) {
                logger.log("Disconnected: $status")
                scheduleReconnect(gatt.device)
            }
        }

        override fun onServicesDiscovered(gatt: BluetoothGatt, status: Int) {
            val service = gatt.getService(EXWAY_GATT_SERVICE_UUID) ?: return
            notifyChar = service.getCharacteristic(EXWAY_NOTIFY_CHAR_UUID)
            writeChar = service.getCharacteristic(EXWAY_WRITE_CHAR_UUID)
            notifyChar?.enableNotifications(gatt)
            logger.log("Services discovered")
        }

        override fun onCharacteristicChanged(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic) {
            if (characteristic.uuid == EXWAY_NOTIFY_CHAR_UUID) {
                parseTelemetry(characteristic.value)
            }
        }
    }

    /**
     * Very small helper that decodes a vendor packet into strongly typed
     * [SpeedTelemetry] and [BatteryStatus] models.
     */
    private fun parseTelemetry(data: ByteArray) {
        if (data.size < 4) return
        val speed = (data[0].toInt() and 0xFF) / 10f
        val battery = data[1].toInt() and 0xFF
        val temp = data[2].toInt()
        val fault = data[3].toInt() and 0xFF
        val telemetry = SpeedTelemetry(speed, battery, temp.toFloat(), fault)
        scope.launch {
            _telemetry.emit(telemetry)
            _batteryStatus.emit(BatteryStatus(battery, temp.toFloat(), fault))
        }
    }

    /**
     * Exponential backoff reconnect used whenever the link drops.  This keeps
     * trying until [connect] succeeds again or [close] is invoked.
     */
    private fun scheduleReconnect(device: BluetoothDevice) {
        reconnectJob?.cancel()
        val delayMs = (1 shl reconnectAttempts).coerceAtMost(64) * 1000L
        reconnectJob = scope.launch {
            delay(delayMs)
            reconnectAttempts++
            logger.log("Reconnect attempt $reconnectAttempts")
            connect(device)
        }
    }

    /** Disposes of any resources and cancels coroutines. */
    fun close() {
        disconnect()
        scope.cancel()
    }
}

