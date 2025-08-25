import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'board_profile.dart';
import '../models/telemetry.dart';
import '../models/commands.dart';

/// Real profile for Exway boards with partial lighting/security support.
class ExwayProfile implements BoardProfile {
  // Service and characteristic UUIDs provided by vendor.
  static final Guid _serviceId = Guid('0000fee7-0000-1000-8000-00805f9b34fb');
  static final Guid _telemetryChar =
      Guid('000036f6-0000-1000-8000-00805f9b34fb');
  static final Guid _commandChar =
      Guid('000036f5-0000-1000-8000-00805f9b34fb');

  // Lighting service UUIDs (mock placeholders until vendor provides real ones).
  static final Guid _lightingService =
      Guid('AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAB0B0');
  static final Guid _lightingChar =
      Guid('AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAB001');

  // Security service (mock placeholders).
  static final Guid _securityService =
      Guid('AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAC0C0');
  static final Guid _securityChar =
      Guid('AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAC001');

  @override
  String get brand => 'Exway';

  @override
  String get model => 'X-Ray';

  @override
  Guid get serviceId => _serviceId;

  @override
  Guid get telemetryChar => _telemetryChar;

  @override
  Guid get commandChar => _commandChar;

  @override
  Guid? get configChar => null;

  @override
  Guid? get lightingServiceId => _lightingService;

  @override
  Guid? get lightingChar => _lightingChar;

  @override
  Guid? get securityServiceId => _securityService;

  @override
  Guid? get securityChar => _securityChar;

  @override
  /// Parses binary packets emitted by the ESC into [Telemetry].
  Telemetry parseTelemetry(Uint8List bytes) {
    final bd = ByteData.sublistView(bytes);
    int offset = 0;

    final ms = bd.getUint32(offset, Endian.little);
    offset += 4;

    double readF32() {
      final v = bd.getFloat32(offset, Endian.little);
      offset += 4;
      return v;
    }

    final speed = readF32();
    final volts = readF32();
    final amps = readF32();
    final esc = readF32();
    final motor = readF32();
    final throttle = readF32();
    final brake = readF32();
    final rideMode = bd.getUint8(offset++);
    final faults = bd.getUint8(offset++);

    return Telemetry(
      ts: DateTime.now(),
      msSinceBoot: ms,
      speedMps: speed,
      volts: volts,
      amps: amps,
      escTempC: esc,
      motorTempC: motor,
      throttlePct: throttle,
      brakePct: brake,
      rideMode: rideMode,
      faultsBits: faults,
    );
  }

  @override
  /// Writes a rider control command over the primary service.
  @override
  Future<void> sendRiderCommand(
      BluetoothDevice device, RiderCommand cmd) async {
    final data = _encodeRiderCommand(cmd);
    final services = await device.discoverServices();
    final service = services.firstWhere((s) => s.uuid == serviceId);
    final char =
        service.characteristics.firstWhere((c) => c.uuid == commandChar);
    await char.write(data, withoutResponse: true);
  }

  @override
  /// Attempts to send a lighting command; falls back to logging when the
  /// lighting service is missing.
  @override
  Future<void> sendLightingCommand(
      BluetoothDevice device, LightingCommand cmd) async {
    final data = Uint8List.fromList(utf8.encode(jsonEncode(cmd.toJson())));
    final services = await device.discoverServices();

    BluetoothService? service;
    for (final s in services) {
      if (s.uuid == lightingServiceId) {
        service = s;
        break;
      }
    }
    if (service == null) {
      // Mock response when lighting service is unavailable.
      print('Mock lighting command: ${jsonEncode(cmd.toJson())}');
      return;
    }

    BluetoothCharacteristic? char;
    for (final c in service.characteristics) {
      if (c.uuid == lightingChar) {
        char = c;
        break;
      }
    }
    if (char == null) {
      print('Mock lighting command: ${jsonEncode(cmd.toJson())}');
      return;
    }

    await char.write(data, withoutResponse: true);
  }

  /// Serializes [RiderCommand] into the vendor JSON format.
  Uint8List _encodeRiderCommand(RiderCommand cmd) {
    Map<String, dynamic> map;
    if (cmd is SetLevel) {
      map = {'cmd': 'set_level', 'level': cmd.level};
    } else if (cmd is SetTurbo) {
      map = {'cmd': 'set_turbo', 'enabled': cmd.enabled};
    } else if (cmd is SetLimits) {
      map = {
        'cmd': 'set_limits',
        'top_mph': cmd.topMph,
        'accel_curve': cmd.accelCurve,
        'decel_curve': cmd.decelCurve,
      };
    } else {
      map = {'cmd': 'unknown'};
    }
    return Uint8List.fromList(utf8.encode(jsonEncode(map)));
  }

  @override
  /// Sends a security JSON command. Returns a mock response when not
  /// supported by the connected board.
  @override
  Future<Map<String, dynamic>?> sendSecurityCommand(
      BluetoothDevice device, Map<String, dynamic> cmd) async {
    final data = Uint8List.fromList(utf8.encode(jsonEncode(cmd)));
    final services = await device.discoverServices();

    BluetoothService? service;
    for (final s in services) {
      if (s.uuid == securityServiceId) {
        service = s;
        break;
      }
    }
    if (service == null) {
      print('Mock security command: ${jsonEncode(cmd)}');
      return {'status': 'mock'};
    }

    BluetoothCharacteristic? char;
    for (final c in service.characteristics) {
      if (c.uuid == securityChar) {
        char = c;
        break;
      }
    }
    if (char == null) {
      print('Mock security command: ${jsonEncode(cmd)}');
      return {'status': 'mock'};
    }

    await char.write(data, withoutResponse: true);
    return null; // no response expected by default
  }
}
