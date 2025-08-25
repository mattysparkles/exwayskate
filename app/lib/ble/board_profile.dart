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

  Telemetry parseTelemetry(Uint8List bytes);
  Future<void> encodeAndWriteCommand(
      BluetoothDevice device, BoardCommand cmd);
}
