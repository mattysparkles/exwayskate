package com.mattysparkles.exwayble.models

data class SpeedTelemetry(
    val speedKph: Float,
    val batteryPercent: Int,
    val temperatureC: Float,
    val faultCode: Int
)
