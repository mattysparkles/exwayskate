import 'package:flutter_test/flutter_test.dart';
import 'package:xray_companion/utils/diagnostics_math.dart';

void main() {
  test('SOH calculation', () {
    expect(computeSoh(50, 45), closeTo(90, 0.1));
  });

  test('Sag index', () {
    expect(computeSagIndex([50, 48]), closeTo(4, 0.1));
  });

  test('Thermal ETA', () {
    expect(thermalEta(30, 60, 5), const Duration(minutes: 6));
  });
}
