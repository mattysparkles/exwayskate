package com.mattysparkles.exwayble.models

/** Minimal subset of telemetry required for live dashboards. */
data class SpeedTelemetry(
    val speedKph: Float,
    val batteryPercent: Int,
    val temperatureC: Float,
    val faultCode: Int
)
