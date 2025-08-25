# Plugin System

The app exposes a simple static plugin API. Plugins implement `XrayPlugin`
and are registered in `lib/plugins/registry.dart`.

```dart
abstract class XrayPlugin {
  String get id;
  String get name;
  Future<void> init(PluginContext ctx);
}
```

`PluginContext` provides streams for telemetry and safety events and allows
plugins to register commands or add menu items.

Sample plugins live in `lib/plugins/`:
* `sample_led_breathe.dart` – adds a menu item that triggers a mock LED
  "breathe" effect.
* `sample_telemetry_scaler.dart` – listens to telemetry and prints scaled
  speed values for demo calibration.

Plugins are discovered through the static list in `registry.dart`.
Versioning follows semantic versioning aligned with the app version.
