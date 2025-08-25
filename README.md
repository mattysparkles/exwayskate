# exway Companion

A Flutter companion app for Exway electric skateboards. It connects over BLE to provide live telemetry, ride logging, and firmware updates. The app ships with a mock profile so you can explore the UI without hardware.


## Quick Start

```bash
flutter pub get && flutter run
```

By default the app starts in **Mock Mode** with synthetic telemetry. To integrate with real hardware, implement a `BoardProfile` with the vendor's GATT UUIDs and packet layout.

See [PARTNER_BRIEF.md](PARTNER_BRIEF.md) and [TECH_SPEC.md](TECH_SPEC.md) for collaboration details.
