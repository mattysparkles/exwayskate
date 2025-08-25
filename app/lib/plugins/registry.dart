import 'api.dart';
import 'sample_led_breathe.dart';
import 'sample_telemetry_scaler.dart';

/// Static plugin registry.
final List<XrayPlugin> plugins = [
  SampleLedBreathePlugin(),
  SampleTelemetryScalerPlugin(),
];
