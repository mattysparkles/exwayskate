import 'package:test/test.dart';
import 'package:xray_companion/utils/curves.dart';

void main() {
  test('sampling produces values from 0 to 1', () {
    final samples = sampleCurve([0, 0.5, 0.8, 0.9, 1], samples: 5);
    expect(samples.first, closeTo(0, 1e-6));
    expect(samples.last, closeTo(1, 1e-6));
  });
}
