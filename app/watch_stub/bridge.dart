import 'dart:async';
import 'dart:convert';

/// Exposes a broadcast stream of compact JSON snapshots for watch clients.
class WatchBridge {
  final _controller = StreamController<String>.broadcast();
  Stream<String> get stream => _controller.stream;

  void update({required double speedMps, required double batteryPct, required double distanceKm}) {
    final payload = jsonEncode({
      'speed_mps': speedMps,
      'battery_pct': batteryPct,
      'distance_km': distanceKm,
    });
    _controller.add(payload);
  }

  void dispose() => _controller.close();
}
