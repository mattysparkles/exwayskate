package com.mattysparkles.exwayble.models

data class BatteryStatus(
    val percentage: Int,
    val temperatureC: Float,
    val faultCode: Int
)
