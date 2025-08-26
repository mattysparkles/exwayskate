import 'package:flutter/foundation.dart';
import '../models/telemetry.dart';
import 'dart:async';
import 'dart:math' as math;

/// Provides mock data streams and fixtures for demo mode.
class DemoRepository {
  DemoRepository();

  /// Stream of synthetic telemetry at 10 Hz.
  Stream<Telemetry> telemetryStream() {
    int ms = 0;
    double volts = 42.0;
    double esc = 30.0;
    double motor = 35.0;
    return Stream.periodic(const Duration(milliseconds: 100), (_) {
      ms += 100;
      final t = ms / 1000.0;
      volts = math.max(30.0, volts - 0.0005);
      esc = math.min(100.0, esc + 0.01);
      motor = math.min(120.0, motor + 0.015);
      final fault = (ms ~/ 5000) % 2 == 0 ? 0 : 1;
      return Telemetry(
        ts: DateTime.now(),
        msSinceBoot: ms,
        speedMps: 8 + 2 * math.sin(t),
        volts: volts,
        amps: 12 + 6 * math.cos(t),
        escTempC: esc,
        motorTempC: motor,
        throttlePct: 60,
        brakePct: 0,
        rideMode: 1,
        faultsBits: fault,
      );
    });
  }

  /// Recent mock ride summaries.
  List<RideSummary> recentRides = const [
    RideSummary(distanceKm: 5.2, durationMin: 18, topSpeedKph: 28, date: '2024-05-01'),
    RideSummary(distanceKm: 12.4, durationMin: 42, topSpeedKph: 34, date: '2024-04-27'),
    RideSummary(distanceKm: 3.1, durationMin: 10, topSpeedKph: 20, date: '2024-04-20'),
  ];
}

@immutable
class RideSummary {
  final double distanceKm;
  final int durationMin;
  final double topSpeedKph;
  final String date;
  const RideSummary({
    required this.distanceKm,
    required this.durationMin,
    required this.topSpeedKph,
    required this.date,
  });
}
