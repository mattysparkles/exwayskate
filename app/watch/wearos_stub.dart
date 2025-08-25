import 'package:flutter/material.dart';
import 'bridge.dart';

/// Simple preview widget for WearOS build.
class WearOsPreview extends StatefulWidget {
  const WearOsPreview({super.key});

  @override
  State<WearOsPreview> createState() => _WearOsPreviewState();
}

class _WearOsPreviewState extends State<WearOsPreview> {
  final bridge = WatchBridge();

  @override
  void initState() {
    super.initState();
    bridge.update(speedMps: 5, batteryPct: 80, distTodayKm: 2.5, locked: false);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: bridge.stream,
      builder: (context, snap) {
        return Center(child: Text(snap.data ?? '')); 
      },
    );
  }

  @override
  void dispose() {
    bridge.dispose();
    super.dispose();
  }
}
