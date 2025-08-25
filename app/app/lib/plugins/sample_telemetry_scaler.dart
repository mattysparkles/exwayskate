import 'dart:async';

import '../models/telemetry.dart';
import 'api.dart';

/// Plugin that scales telemetry values for demo calibration.
class SampleTelemetryScalerPlugin implements XrayPlugin {
  @override
  String get id => 'sample_telemetry_scaler';

  @override
  String get name => 'Telemetry Scaler';

  StreamSubscription<Telemetry>? _sub;

  @override
  /// Listens for telemetry and prints a scaled version.
  @override
  Future<void> init(PluginContext ctx) async {
    _sub = ctx.telemetry.listen((t) {
      final scaled = Telemetry(
        ts: t.ts,
        msSinceBoot: t.msSinceBoot,
        speedMps: t.speedMps * 0.8,
        volts: t.volts,
        amps: t.amps,
        escTempC: t.escTempC,
        motorTempC: t.motorTempC,
        throttlePct: t.throttlePct,
        brakePct: t.brakePct,
        rideMode: t.rideMode,
        faultsBits: t.faultsBits,
      );
      // ignore: avoid_print
      print('Scaled speed: ${scaled.speedMps}');
    });
  }

  /// Cancels the stream subscription when no longer needed.
  void dispose() {
    _sub?.cancel();
  }
}
