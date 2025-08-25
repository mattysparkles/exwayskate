import 'package:flutter/material.dart';
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
                // TODO: Add battery icon asset (e.g. assets/icons/battery.svg)
                title: Text(s.batteryHealth),
                subtitle: const Text('SOH: 95%'),
              ),
            ),
          ),
          Semantics(
            label: s.sagRisk,
            child: Card(
              child: ListTile(
                // TODO: Add voltage sag icon (e.g. assets/icons/sag_risk.svg)
                title: Text(s.sagRisk),
                subtitle: const Text('Low'),
              ),
            ),
          ),
          Semantics(
            label: s.escTemps,
            child: Card(
              child: ListTile(
                // TODO: Add temperature icon (e.g. assets/icons/esc_temp.svg)
                title: Text(s.escTemps),
                subtitle: const Text('ETA 10m'),
              ),
            ),
          ),
          Semantics(
            label: s.faultsLog,
            child: Card(
              child: ListTile(
                // TODO: Add fault log icon (e.g. assets/icons/fault.svg)
                title: Text(s.faultsLog),
                subtitle: const Text('No recent faults'),
              ),
            ),
          ),
          Semantics(
            label: s.maintenanceTips,
            child: Card(
              child: ListTile(
                // TODO: Add maintenance icon (e.g. assets/icons/maintenance.svg)
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
