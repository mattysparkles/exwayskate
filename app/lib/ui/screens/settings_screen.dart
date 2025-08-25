import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            leading: SvgPicture.asset(
              'assets/icons/diagnostics.svg',
              width: 24,
              height: 24,
            ),
            title: Text(s.diagnostics),
            onTap: () => Navigator.of(context).pushNamed('/diagnostics'),
          ),
          const Divider(),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/accessibility.svg',
              width: 24,
              height: 24,
            ),
            title: Text(s.accessibility),
          ),
          SwitchListTile(
            secondary: SvgPicture.asset(
              'assets/icons/contrast.svg',
              width: 24,
              height: 24,
            ),
            title: Text(s.highContrast),
            value: a11y.highContrast,
            onChanged: (v) => a11y.setHighContrast(v),
          ),
          const Divider(),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/developer.svg',
              width: 24,
              height: 24,
            ),
            title: Text(s.developer),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/theft_ping.svg',
              width: 24,
              height: 24,
            ),
            title: Text(s.simulateTheftPing),
            onTap: () => theft.simulatePing(),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/crowd_find.svg',
              width: 24,
              height: 24,
            ),
            title: Text(s.generateMockSighting),
            onTap: () => crowd.addSighting('MOCK', 37.0, -122.0),
          ),
        ],
      ),
    );
  }
}
