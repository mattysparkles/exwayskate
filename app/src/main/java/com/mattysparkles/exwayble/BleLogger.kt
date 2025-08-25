package com.mattysparkles.exwayble

import android.util.Log

/** Simple wrapper around [Log] so calls can be mocked in tests. */
class BleLogger(private val tag: String = "ExwayBle") {
    /** Emits a debug log with the configured [tag]. */
    fun log(message: String) {
        Log.d(tag, message)
    }
}
