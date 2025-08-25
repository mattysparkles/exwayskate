import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../l10n/generated/l10n.dart';

class DiagnosticsScreen extends StatelessWidget {
  const DiagnosticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(s.diagnostics)),
      body: ListView(
        children: [
          Semantics(
            label: s.batteryHealth,
            child: Card(
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/battery.svg',
                  width: 24,
                  height: 24,
                ),
                title: Text(s.batteryHealth),
                subtitle: const Text('SOH: 95%'),
              ),
            ),
          )
          Semantics(
            label: s.sagRisk,
            child: Card(
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/sag_risk.svg',
                  width: 24,
                  height: 24,
                ),
                title: Text(s.sagRisk),
                subtitle: const Text('Low'),
              ),
            ),
          ),
          Semantics(
            label: s.escTemps,
            child: Card(
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/esc_temp.svg',
                  width: 24,
                  height: 24,
                ),
                title: Text(s.escTemps),
                subtitle: const Text('ETA 10m'),
              ),
            ),
          ),
          Semantics(
            label: s.faultsLog,
            child: Card(
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/fault.svg',
                  width: 24,
                  height: 24,
                ),
                title: Text(s.faultsLog),
                subtitle: const Text('No recent faults'),
              ),
            ),
          ),
          Semantics(
            label: s.maintenanceTips,
            child: Card(
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/maintenance.svg',
                  width: 24,
                  height: 24,
                ),
                title: Text(s.maintenanceTips),
                subtitle: const Text('Keep tires inflated.'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
