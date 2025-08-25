import 'dart:async';
import 'dart:convert';

/// Broadcasts compact JSON snapshots for watch clients.
class WatchBridge {
  final _controller = StreamController<String>.broadcast();
  Stream<String> get stream => _controller.stream;

  void update({
    required double speedMps,
    required double batteryPct,
    required double distTodayKm,
    required bool locked,
  }) {
    final payload = jsonEncode({
      'speed': speedMps,
      'battery_pct': batteryPct,
      'dist_today_km': distTodayKm,
      'lock_state': locked ? 1 : 0,
    });
    _controller.add(payload);
  }

  void dispose() => _controller.close();
}
