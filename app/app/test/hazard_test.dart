import 'package:flutter_test/flutter_test.dart';
import 'package:xray_companion/hazards/hazards.dart';

void main() {
  test('hazard rounding to 3 decimals', () {
    final h = Hazard(
        id: '1',
        type: 'pothole',
        ts: 0,
        lat: 12.34567,
        lon: 98.76543,
        severity: 3,
        createdByHash: 'u',
        updatedAt: 1);
    final rounded = coarseHazard(h);
    expect(rounded.lat, 12.346);
    expect(rounded.lon, 98.765);
  });
}
