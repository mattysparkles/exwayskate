import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/generated/l10n.dart';
import '../../settings/accessibility.dart';
import '../../security/theft_monitor.dart';
import '../../security/crowd_find.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final a11y = context.watch<AccessibilitySettings>();
    final theft = context.read<TheftMonitor>();
    final crowd = context.read<CrowdFindService>();
    return Scaffold(
      appBar: AppBar(title: Text(s.settings)),
      body: ListView(
        children: [
          ListTile(
            // TODO: Add diagnostics icon (e.g. assets/icons/diagnostics.svg)
            title: Text(s.diagnostics),
            onTap: () => Navigator.of(context).pushNamed('/diagnostics'),
          ),
          const Divider(),
          ListTile(
            // TODO: Add accessibility icon (e.g. assets/icons/accessibility.svg)
            title: Text(s.accessibility),
          ),
          SwitchListTile(
            // TODO: Add high-contrast icon (e.g. assets/icons/contrast.svg)
            title: Text(s.highContrast),
            value: a11y.highContrast,
            onChanged: (v) => a11y.setHighContrast(v),
          ),
          const Divider(),
          ListTile(
            // TODO: Add developer icon (e.g. assets/icons/developer.svg)
            title: Text(s.developer),
          ),
          ListTile(
            // TODO: Add theft ping icon (e.g. assets/icons/theft_ping.svg)
            title: Text(s.simulateTheftPing),
            onTap: () => theft.simulatePing(),
          ),
          ListTile(
            // TODO: Add crowd find icon (e.g. assets/icons/crowd_find.svg)
            title: Text(s.generateMockSighting),
            onTap: () => crowd.addSighting('MOCK', 37.0, -122.0),
          ),
        ],
      ),
    );
  }
}
