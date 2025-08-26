import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../l10n/generated/l10n.dart';
import '../bottom_nav_scaffold.dart';

class DiagnosticsScreen extends StatelessWidget {
  const DiagnosticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BottomNavScaffold(
      index: 3,
      title: s.diagnostics,
      body: ListView(
        children: [
          _card('assets/icons/battery.svg', s.batteryHealth, 'SOH: 95%'),
          _card('assets/icons/sag_risk.svg', s.sagRisk, 'Low'),
          _card('assets/icons/esc_temp.svg', s.escTemps, 'ETA 10m'),
          _card('assets/icons/fault.svg', s.faultsLog, 'No recent faults'),
          _card('assets/icons/maintenance.svg', s.maintenanceTips, 'Keep tires inflated.'),
        ],
      ),
    );
  }

  Widget _card(String asset, String title, String subtitle) {
    return Semantics(
      label: title,
      child: Card(
        child: ListTile(
          leading: SvgPicture.asset(asset, width: 24, height: 24),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
