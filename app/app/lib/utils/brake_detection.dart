import '../models/telemetry.dart';

/// Returns true when the deceleration between [prev] and [curr] exceeds
/// [threshold] m/s^2.
bool detectBrake(Telemetry prev, Telemetry curr, {double threshold = -0.8}) {
  final dv = curr.speedMps - prev.speedMps;
  final dt = curr.ts.difference(prev.ts).inMilliseconds / 1000.0;
  if (dt <= 0) return false;
  final accel = dv / dt;
  return accel <= threshold;
}
