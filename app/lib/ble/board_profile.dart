import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../models/telemetry.dart';
import '../models/commands.dart';

abstract class BoardProfile {
  String get brand;
  String get model;
  Guid get serviceId;
  Guid get telemetryChar;
  Guid get commandChar;
  Guid? get configChar;

  /// Optional lighting service for vendors that expose LED control.
  Guid? get lightingServiceId;

  /// Optional characteristic used to transmit lighting commands.
  Guid? get lightingChar;

  /// Optional security service for ownership binding / locking.
  Guid? get securityServiceId;

  /// Characteristic used for security commands (JSON payloads).
  Guid? get securityChar;

  Telemetry parseTelemetry(Uint8List bytes);

  /// Sends a rider control command such as mode or limits.
  Future<void> sendRiderCommand(
      BluetoothDevice device, RiderCommand cmd);

  /// Sends a lighting command when [lightingSupported] is true.
  Future<void> sendLightingCommand(
      BluetoothDevice device, LightingCommand cmd);

  /// Sends a security command if [securitySupported] is true and returns
  /// optional JSON response.
  Future<Map<String, dynamic>?> sendSecurityCommand(
      BluetoothDevice device, Map<String, dynamic> cmd);

  /// Whether this profile exposes the lighting service.
  bool get lightingSupported =>
      lightingServiceId != null && lightingChar != null;

  /// Whether this profile exposes the security service.
  bool get securitySupported =>
      securityServiceId != null && securityChar != null;
}
