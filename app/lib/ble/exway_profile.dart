import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'board_profile.dart';
import '../models/telemetry.dart';
import '../models/commands.dart';

class ExwayProfile implements BoardProfile {
  // TODO: Replace with real UUIDs when provided.
  static final Guid _serviceId = Guid('AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA');
  static final Guid _telemetryChar =
      Guid('AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAA1');
  static final Guid _commandChar =
      Guid('AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAA2');

  // Lighting service UUIDs to be provided by vendor.
  static final Guid _lightingService =
      Guid('AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAB0B0');
  static final Guid _lightingChar =
      Guid('AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAB001');

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
  Telemetry parseTelemetry(Uint8List bytes) {
    // TODO: parse little-endian floats from bytes according to vendor spec.
    return Telemetry(
      ts: DateTime.now(),
      speedMps: 0,
      volts: 0,
      amps: 0,
      escTempC: 0,
      motorTempC: 0,
      throttlePct: 0,
      brakePct: 0,
      rideMode: 0,
      faultsBits: 0,
    );
  }

  @override
  Future<void> sendRiderCommand(
      BluetoothDevice device, RiderCommand cmd) async {
    // TODO: encode JSON/CBOR into bytes and write to characteristic.
  }

  @override
  Future<void> sendLightingCommand(
      BluetoothDevice device, LightingCommand cmd) async {
    // TODO: encode JSON/CBOR into bytes and write to lighting characteristic.
  }
}
