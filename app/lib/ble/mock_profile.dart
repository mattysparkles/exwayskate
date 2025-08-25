import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'board_profile.dart';
import '../models/telemetry.dart';
import '../models/commands.dart';

class MockProfile implements BoardProfile {
  double _volts = 42.0;
  double _escTemp = 30.0;
  double _motorTemp = 35.0;
  int _ms = 0;
  String lockState = 'unlocked';
  String? boundOpk;

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

  @override
  Guid? get lightingServiceId =>
      Guid('00000000-0000-0000-0000-00000000B0B0');

  @override
  Guid? get lightingChar =>
      Guid('00000000-0000-0000-0000-00000000B001');

  @override
  Guid? get securityServiceId =>
      Guid('00000000-0000-0000-0000-00000000C0C0');

  @override
  Guid? get securityChar =>
      Guid('00000000-0000-0000-0000-00000000C001');

  Stream<Telemetry> startMockStream() {
    return Stream.periodic(const Duration(milliseconds: 100), (_) {
      _ms += 100;
      final t = _ms / 1000.0;
      _volts = math.max(30.0, _volts - 0.0005); // slow drain, clamp at 30 V
      _escTemp = math.min(100.0, _escTemp + 0.01);
      _motorTemp = math.min(120.0, _motorTemp + 0.015);
      return Telemetry(
        ts: DateTime.now(),
        msSinceBoot: _ms,
        speedMps: 8 + 2 * math.sin(t),
        volts: _volts,
        amps: 12 + 6 * math.cos(t),
        escTempC: _escTemp,
        motorTempC: _motorTemp,
        throttlePct: 60,
        brakePct: 0,
        rideMode: 1,
        faultsBits: 0,
      );
    });
  }

  @override
  Telemetry parseTelemetry(Uint8List bytes) {
    _ms += 100;
    final t = _ms / 1000.0;
    _volts = math.max(30.0, _volts - 0.0005);
    _escTemp = math.min(100.0, _escTemp + 0.01);
    _motorTemp = math.min(120.0, _motorTemp + 0.015);
    return Telemetry(
      ts: DateTime.now(),
      msSinceBoot: _ms,
      speedMps: 8 + 2 * math.sin(t),
      volts: _volts,
      amps: 12 + 6 * math.cos(t),
      escTempC: _escTemp,
      motorTempC: _motorTemp,
      throttlePct: 60,
      brakePct: 0,
      rideMode: 1,
      faultsBits: 0,
    );
  }

  @override
  Future<void> sendRiderCommand(
      BluetoothDevice device, RiderCommand cmd) async {
    // In mock mode we simply await a short delay to simulate ACK.
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }

  @override
  Future<void> sendLightingCommand(
      BluetoothDevice device, LightingCommand cmd) async {
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }

  @override
  Future<Map<String, dynamic>?> sendSecurityCommand(
      BluetoothDevice device, Map<String, dynamic> cmd) async {
    await Future<void>.delayed(const Duration(milliseconds: 5));
    switch (cmd['cmd']) {
      case 'identify':
        return {
          'board_id': 'MOCK-BOARD',
          'fw': '0.0.1',
          'secure_elem': false,
          'lock_state': lockState,
          'opk': boundOpk,
        };
      case 'bind_owner':
        boundOpk = cmd['opk'];
        lockState = 'unlocked';
        return {'status': 'ok'};
      case 'set_lock':
        lockState = cmd['state'];
        return {'status': 'ok'};
      case 'challenge':
        final nonce = 'nonce_${DateTime.now().millisecondsSinceEpoch}';
        return {'nonce': nonce};
      default:
        return {'status': 'unknown'};
    }
  }
}
