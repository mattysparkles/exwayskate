import 'package:flutter_test/flutter_test.dart';
import 'package:xray_companion/predict/range.dart';

void main() {
  test('slope correction reduces range uphill', () {
    final flat = estimateRange(batteryWh: 500, whPerKm: 20);
    final uphill = estimateRange(
        batteryWh: 500, whPerKm: 20, grades: [0.06]); // 6% grade
    expect(uphill, lessThan(flat));
  });
}
