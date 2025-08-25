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
            title: Text(s.diagnostics),
            onTap: () => Navigator.of(context).pushNamed('/diagnostics'),
          ),
          const Divider(),
          ListTile(title: Text(s.accessibility)),
          SwitchListTile(
            title: Text(s.highContrast),
            value: a11y.highContrast,
            onChanged: (v) => a11y.setHighContrast(v),
          ),
          const Divider(),
          ListTile(title: Text(s.developer)),
          ListTile(
            title: Text(s.simulateTheftPing),
            onTap: () => theft.simulatePing(),
          ),
          ListTile(
            title: Text(s.generateMockSighting),
            onTap: () => crowd.addSighting('MOCK', 37.0, -122.0),
          ),
        ],
      ),
    );
  }
}
