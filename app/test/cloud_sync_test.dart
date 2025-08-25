import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:xray_companion/cloud/cloud_sync.dart';
import 'package:xray_companion/cloud/dto.dart';

void main() {
  test('conflict uses last updated', () {
    final a = RideDTO(
        id: '1',
        startedAt: 0,
        endedAt: 1,
        distanceM: 10,
        avgSpeedMps: 1,
        maxSpeedMps: 2,
        updatedAt: 1);
    final b = RideDTO(
        id: '1',
        startedAt: 0,
        endedAt: 1,
        distanceM: 10,
        avgSpeedMps: 1,
        maxSpeedMps: 2,
        updatedAt: 2);
    final m = resolveConflict(a, b);
    expect(m.updatedAt, 2);
  });

  test('push sends rides', () async {
    final client = MockClient((req) async {
      expect(req.method, 'POST');
      final decoded = jsonDecode(req.body) as Map<String, dynamic>;
      expect(decoded['rides'].length, 1);
      return http.Response('{}', 200);
    });
    final sync = CloudSync(
        client: client, baseUrl: 'https://example.com', apiKey: 'k');
    await sync.pushRides([
      RideDTO(
          id: '1',
          startedAt: 0,
          endedAt: 1,
          distanceM: 10,
          avgSpeedMps: 1,
          maxSpeedMps: 2,
          updatedAt: 1)
    ]);
  });

  test('pull parses rides', () async {
    final client = MockClient((req) async {
      return http.Response(
          jsonEncode({
            'rides': [
              {
                'id': '1',
                'started_at': 0,
                'ended_at': 1,
                'distance_m': 10,
                'avg_speed_mps': 1,
                'max_speed_mps': 2,
                'updated_at': 1
              }
            ]
          }),
          200);
    });
    final sync = CloudSync(
        client: client, baseUrl: 'https://example.com', apiKey: 'k');
    final rides = await sync.pullRides(0);
    expect(rides, hasLength(1));
    expect(rides.first.id, '1');
  });
}
