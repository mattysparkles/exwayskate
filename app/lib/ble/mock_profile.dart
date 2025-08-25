import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'board_profile.dart';
import '../models/telemetry.dart';
import '../models/commands.dart';

class MockProfile implements BoardProfile {
  @override
  String get brand => 'Demo';

  @override
  String get model => 'Virtual';

  @override
  Guid get serviceId => Guid('00000000-0000-0000-0000-000000000000');

  @override
  Guid get telemetryChar => Guid('00000000-0000-0000-0000-000000000001');

  @override
  Guid get commandChar => Guid('00000000-0000-0000-0000-000000000002');

  @override
  Guid? get configChar => null;

  Stream<Telemetry> startMockStream() {
    return Stream.periodic(const Duration(milliseconds: 100), (i) {
      final t = i / 10.0;
      return Telemetry(
        ts: DateTime.now(),
        speedMps: 8 + 2 * math.sin(t),
        volts: 41.8,
        amps: 12 + 6 * math.cos(t),
        escTempC: 50 + t,
        motorTempC: 55 + t,
        throttlePct: 60,
        brakePct: 0,
        rideMode: 1,
        faultsBits: 0,
      );
    });
  }

  @override
  Telemetry parseTelemetry(Uint8List bytes) {
    final now = DateTime.now();
    final t = now.millisecond / 1000.0;
    return Telemetry(
      ts: now,
      speedMps: 8 + 2 * math.sin(t),
      volts: 41.8,
      amps: 12 + 6 * math.cos(t),
      escTempC: 50 + t,
      motorTempC: 55 + t,
      throttlePct: 60,
      brakePct: 0,
      rideMode: 1,
      faultsBits: 0,
    );
  }

  @override
  Future<void> encodeAndWriteCommand(
      BluetoothDevice device, BoardCommand cmd) async {}
}
