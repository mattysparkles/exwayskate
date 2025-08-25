import 'package:test/test.dart';
import 'package:xray_companion/models/telemetry.dart';
import 'package:xray_companion/utils/brake_detection.dart';

void main() {
  test('detects braking when decel below threshold', () {
    final prev = Telemetry(
      ts: DateTime.now(),
      msSinceBoot: 0,
      speedMps: 5,
      volts: 40,
      amps: 0,
      escTempC: 0,
      motorTempC: 0,
      throttlePct: 0,
      brakePct: 0,
      rideMode: 0,
      faultsBits: 0,
    );
    final curr = Telemetry(
      ts: prev.ts.add(const Duration(seconds: 1)),
      msSinceBoot: 1000,
      speedMps: 4,
      volts: prev.volts,
      amps: prev.amps,
      escTempC: prev.escTempC,
      motorTempC: prev.motorTempC,
      throttlePct: prev.throttlePct,
      brakePct: prev.brakePct,
      rideMode: prev.rideMode,
      faultsBits: prev.faultsBits,
    );
    expect(detectBrake(prev, curr, threshold: -0.5), isTrue);
  });
}
