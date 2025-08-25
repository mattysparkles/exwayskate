# exway Companion

A Flutter companion app for Exway electric skateboards. It connects over BLE to provide live telemetry, ride logging, rider levels, lighting control, and firmware updates. The app ships with a mock profile so you can explore the UI without hardware.

## Features

- Rider levels L1–L4 with turbo and custom curves
- Lighting commands for headlight, brake light and addressable LEDs
- Route logging and ride analytics (speed, distance, energy)
- Badge engine for milestones
- Support chat and accessories shop links
- Mock profile simulating telemetry and LED acknowledgements
- Optional cloud backup with leaderboards
- Local community events and crowdsourced hazards
- Offline-first predictive range estimation
- Lightweight watch bridge emitting JSON snapshots (`watch_stub/bridge.dart`)


## Quick Start

```bash
flutter pub get && flutter run
```

By default the app starts in **Mock Mode** with synthetic telemetry. To integrate with real hardware, implement a `BoardProfile` with the vendor's GATT UUIDs and packet layout.

See [PARTNER_BRIEF.md](PARTNER_BRIEF.md) and [TECH_SPEC.md](TECH_SPEC.md) for collaboration details.

## Environment Variables

| Key | Purpose |
| --- | --- |
| `XRAY_CLOUD_URL` | Base URL for ride sync APIs |
| `XRAY_API_KEY` | Bearer token for cloud sync |
| `XRAY_COMMUNITY_URL` | Endpoint for group ride events |
| `XRAY_HAZARDS_URL` | Crowdsourced hazard endpoint |
| `XRAY_PREDICT_URL` | Optional range/hazard feed aggregator |

If a variable is missing the app falls back to local-only behaviour.

## Wearables

A lightweight JSON bridge streams telemetry for watch companions. See
[docs/WEARABLES.md](docs/WEARABLES.md) for details and example stub widgets.

## Plugin System

Developers can extend the app using the static plugin API. Sample plugins are
included under `lib/plugins`. See [PLUGINS.md](PLUGINS.md) for guidance.
