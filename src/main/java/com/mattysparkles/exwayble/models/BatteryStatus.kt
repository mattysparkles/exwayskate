package com.mattysparkles.exwayble.models

/** Snapshot of pack information derived from telemetry packets. */
data class BatteryStatus(
    val percentage: Int,
    val temperatureC: Float,
    val faultCode: Int
)
