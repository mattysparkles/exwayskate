import 'package:test/test.dart';
import 'package:xray_companion/utils/sun_times.dart';

void main() {
  test('computes sunrise and sunset roughly', () {
    final date = DateTime.utc(2024, 6, 1);
    final times = computeSunTimes(date, 37.7749, -122.4194, 0);
    expect(times.sunrise.isBefore(times.sunset), isTrue);
  });
}
