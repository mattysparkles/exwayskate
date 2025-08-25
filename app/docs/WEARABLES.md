# Wearables

A simple JSON bridge is provided for watch companions.

The bridge emits snapshots like:

```json
{"speed":4.2,"battery_pct":75,"dist_today_km":1.0,"lock_state":1}
```

Demo Flutter widgets are available in `watch/wearos_stub.dart` and
`watch/watchos_stub.dart` for WearOS and watchOS previews.
