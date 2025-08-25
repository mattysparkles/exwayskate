import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModesScreen extends StatelessWidget {
  const ModesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modes')),
      body: ListView(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/mode_eco.svg',
              width: 24,
              height: 24,
            ),
            title: const Text('Eco'),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/mode_sport.svg',
              width: 24,
              height: 24,
            ),
            title: const Text('Sport'),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/mode_pro.svg',
              width: 24,
              height: 24,
            ),
            title: const Text('Pro'),
          ),
        ],
      ),
    );
  }
}
