# Function Reality Matrix

This document lists key functions and whether they operate against real hardware or act as mocks.

## BLE Profiles

- `MockProfile` (`app/lib/ble/mock_profile.dart`)
  - `startMockStream`, `parseTelemetry`, `sendRiderCommand`, `sendLightingCommand`, `sendSecurityCommand` — **Mock** implementations emitting synthetic data and fake acknowledgements.
- `ExwayProfile` (`app/lib/ble/exway_profile.dart`)
  - `parseTelemetry`, `sendRiderCommand`, `_encodeRiderCommand` — **Real** implementations for vendor protocol.
  - `sendLightingCommand`, `sendSecurityCommand` — **Partial**: send real commands when services exist, otherwise log and return mock responses.
- `VendorRegistry.matchByAdvertisement` (`app/lib/ble/vendor_registry.dart`) — **Real** list of available profiles.

## Plugins

- `SampleLedBreathePlugin` (`app/lib/plugins/sample_led_breathe.dart`) — registers command that only logs in mock mode; no real LED control yet (**Mock**).

## Watch Bridge

- `WatchBridge.update` (`watch/bridge.dart` & `watch_stub/bridge.dart`) — emits JSON snapshots; works in real deployments (**Real**).
- `WatchOsPreview` and `WearOsPreview` stubs — UI previews for watch apps (**Mock**).

This matrix is not exhaustive; additional modules will be reviewed in a subsequent session.
