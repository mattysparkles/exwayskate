import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../settings/app_settings.dart';
import '../bottom_nav_scaffold.dart';

class ModesScreen extends StatefulWidget {
  const ModesScreen({super.key});

  @override
  State<ModesScreen> createState() => _ModesScreenState();
}

class _ModesScreenState extends State<ModesScreen> {
  int _mode = 0;

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppSettings>();
    void select(int m) {
      setState(() => _mode = m);
      if (app.demoMode) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Mode set to $m')),
        );
      }
    }

    return BottomNavScaffold(
      index: 2,
      title: 'Modes',
      body: ListView(
        children: [
          _tile('Eco', 'assets/icons/mode_eco.svg', 0, select),
          _tile('Sport', 'assets/icons/mode_sport.svg', 1, select),
          _tile('Pro', 'assets/icons/mode_pro.svg', 2, select),
          _tile('Turbo', 'assets/icons/turbo.svg', 3, select),
        ],
      ),
    );
  }

  Widget _tile(String title, String asset, int value, void Function(int) onTap) {
    return ListTile(
      leading: SvgPicture.asset(asset, width: 24, height: 24),
      title: Text(title),
      trailing: Radio<int>(value: value, groupValue: _mode, onChanged: (_) => onTap(value)),
      onTap: () => onTap(value),
    );
  }
}
