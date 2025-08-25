import 'package:flutter_test/flutter_test.dart';
import 'package:xray_companion/cloud/dto.dart';
import 'package:xray_companion/cloud/leaderboard.dart';

void main() {
  test('local leaderboard computes totals', () {
    final rides = [
      RideDTO(
          id: '1',
          startedAt: 0,
          endedAt: 1,
          distanceM: 1609.34,
          avgSpeedMps: 1,
          maxSpeedMps: 2,
          updatedAt: 1)
    ];
    final entry = computeLocalLeaderboard('u', rides);
    expect(entry.milesTotal, closeTo(1.0, 0.0001));
    expect(entry.ridesCount, 1);
  });
}
