import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../l10n/generated/l10n.dart';
import '../../settings/accessibility.dart';
import '../../settings/app_settings.dart';
import '../../security/theft_monitor.dart';
import '../../security/crowd_find.dart';
import '../bottom_nav_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final app = context.watch<AppSettings>();
    final a11y = context.watch<AccessibilitySettings>();
    final theft = context.read<TheftMonitor>();
    final crowd = context.read<CrowdFindService>();
    return BottomNavScaffold(
      index: 4,
      title: s.settings,
      body: ListView(
        children: [
          SwitchListTile(
            secondary: SvgPicture.asset('assets/icons/ble_board.svg', width: 24, height: 24),
            title: const Text('Enable Demo Mode'),
            value: app.demoMode,
            onChanged: app.setDemoMode,
          ),
          SwitchListTile(
            secondary: SvgPicture.asset('assets/icons/location.svg', width: 24, height: 24),
            title: const Text('Use metric units'),
            value: app.metricUnits,
            onChanged: app.setMetricUnits,
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme'),
            trailing: DropdownButton<ThemeMode>(
              value: app.themeMode,
              items: const [
                DropdownMenuItem(value: ThemeMode.system, child: Text('System')),
                DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
                DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
              ],
              onChanged: (m) {
                if (m != null) app.setThemeMode(m);
              },
            ),
          ),
          SwitchListTile(
            secondary: SvgPicture.asset('assets/icons/accessibility.svg', width: 24, height: 24),
            title: const Text('Larger text'),
            value: a11y.largeText,
            onChanged: a11y.setLargeText,
          ),
          SwitchListTile(
            secondary: SvgPicture.asset('assets/icons/contrast.svg', width: 24, height: 24),
            title: s.highContrast,
            value: a11y.highContrast,
            onChanged: a11y.setHighContrast,
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/diagnostics.svg', width: 24, height: 24),
            title: Text(s.diagnostics),
            onTap: () => Navigator.of(context).pushNamed('/diagnostics'),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/theft_ping.svg', width: 24, height: 24),
            title: Text(s.simulateTheftPing),
            onTap: () => theft.simulatePing(),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/crowd_find.svg', width: 24, height: 24),
            title: Text(s.generateMockSighting),
            onTap: () => crowd.addSighting('MOCK', 37.0, -122.0),
          ),
          ListTile(
            leading: const Icon(Icons.bluetooth),
            title: const Text('Request BLE permissions'),
            onTap: () => [
              Permission.bluetoothScan,
              Permission.bluetoothConnect,
              Permission.locationWhenInUse,
            ].request(),
          ),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snap) {
              final ver = snap.data?.version ?? '';
              return ListTile(
                title: const Text('App Version'),
                subtitle: Text(ver),
              );
            },
          ),
        ],
      ),
    );
  }
}
