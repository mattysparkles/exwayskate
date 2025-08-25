# Technical Specification

## Telemetry Schema
| Field | Unit |
| --- | --- |
| speed_mps | m/s |
| battery_volts | V |
| battery_amps | A |
| esc_temp_c | °C |
| motor_temp_c | °C |
| throttle_pct | % |
| brake_pct | % |
| ride_mode | enum |
| faults_bitfield | bits |

## BLE Contract
- Service UUID: 0xA0A0
- Telemetry Char: 0xA001 (notify)
- Command Char: 0xA002 (write JSON)

## Database Schema
Tables: rides, samples, alerts. Data retained locally.

## Safety Heuristics
Simple thermal headroom and voltage sag estimators.

## OTA Notes
Uses Nordic DFU / MCUBoot when vendor provides details.
