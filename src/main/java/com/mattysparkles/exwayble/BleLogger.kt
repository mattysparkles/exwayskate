package com.mattysparkles.exwayble

import android.util.Log

class BleLogger(private val tag: String = "ExwayBle") {
    fun log(message: String) {
        Log.d(tag, message)
    }
}
