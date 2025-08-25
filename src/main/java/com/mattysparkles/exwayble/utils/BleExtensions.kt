package com.mattysparkles.exwayble.utils

import android.bluetooth.BluetoothGatt
import android.bluetooth.BluetoothGattCharacteristic
import android.bluetooth.BluetoothGattDescriptor
import java.util.UUID

private val CLIENT_CONFIG_UUID: UUID = UUID.fromString("00002902-0000-1000-8000-00805f9b34fb")

/** Enables notifications for this characteristic by writing the CCCD. */
fun BluetoothGattCharacteristic.enableNotifications(gatt: BluetoothGatt) {
    gatt.setCharacteristicNotification(this, true)
    val ccc = getDescriptor(CLIENT_CONFIG_UUID)
    ccc?.let {
        it.value = BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE
        gatt.writeDescriptor(it)
    }
}

/** Convenience extension to render a byte array as hex bytes. */
fun ByteArray.toHexString(): String = joinToString(separator = " ") { String.format("%02X", it) }
