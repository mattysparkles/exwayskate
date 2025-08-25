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

- Control Service UUID: 0xA0A0
  - Telemetry Char: 0xA001 (notify)
  - Command Char: 0xA002 (write JSON)
- Lighting Service UUID: 0xB0B0
  - Command Char: 0xB001 (write JSON/CBOR)
    - `{ "cmd":"headlight","state":"on"|"off"|"auto" }`
    - `{ "cmd":"rear","pattern":"solid_red"|"brake"|"brake_strobe","intensity":0..100 }`
    - `{ "cmd":"ws2811","channel":0|1,"pattern":"custom","data":[...] }`

## Curves Encoding
- Accel/decel curves are piecewise Bezier defined by 5 normalized control points
- Utility samples curve to 0..1 lookup table before transmit

## Brake Detection
- Uses two consecutive telemetry samples
- Compute `a = Δv/Δt`; brake event when `a <= −0.8 m/s²`

## Sun Time Algorithm
- NOAA solar position equations computed on-device
- Inputs: date, latitude, longitude, timezone offset
- Outputs: sunrise and sunset in local time

## Database Schema
Tables: rides, samples, alerts, routes, mileage_totals, firmware_history, badges.
Default badges seeded on first run.

## Safety Heuristics
Simple thermal headroom and voltage sag estimators.

## OTA Notes
Uses Nordic DFU / MCUBoot when vendor provides details.
