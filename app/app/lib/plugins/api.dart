import 'dart:async';
import 'package:flutter/foundation.dart';

import '../models/telemetry.dart';
import '../models/safety_event.dart';

/// Base interface for plugins.
abstract class XrayPlugin {
  String get id;
  String get name;
  Future<void> init(PluginContext ctx);
}

/// Context provided to plugins on initialization.
class PluginContext {
  final Stream<Telemetry> telemetry;
  final Stream<SafetyEvent> safety;
  final void Function(String id, Future<void> Function(Map<String, dynamic>) handler) registerCommand;
  final void Function(PluginMenuItem item) addMenuItem;

  PluginContext({
    required this.telemetry,
    required this.safety,
    required this.registerCommand,
    required this.addMenuItem,
  });
}

/// Represents a simple menu item plugins may expose.
class PluginMenuItem {
  final String id;
  final String title;
  final VoidCallback onSelected;

  const PluginMenuItem({
    required this.id,
    required this.title,
    required this.onSelected,
  });
}
