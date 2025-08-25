import 'package:flutter_test/flutter_test.dart';
import 'package:xray_companion/plugins/registry.dart';

void main() {
  test('sample plugins are registered', () {
    expect(plugins.any((p) => p.id == 'sample_led_breathe'), isTrue);
    expect(plugins.any((p) => p.id == 'sample_telemetry_scaler'), isTrue);
  });
}
