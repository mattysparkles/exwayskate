import 'package:flutter/material.dart';
import 'bridge.dart';

/// Simple preview widget for watchOS build.
class WatchOsPreview extends StatelessWidget {
  const WatchOsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final bridge = WatchBridge()
      ..update(speedMps: 4.2, batteryPct: 75, distTodayKm: 1.0, locked: true);
    return StreamBuilder<String>(
      stream: bridge.stream,
      builder: (context, snap) => Center(child: Text(snap.data ?? '')),
    );
  }
}
