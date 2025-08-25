import 'package:flutter/material.dart';

class ModesScreen extends StatelessWidget {
  const ModesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modes')),
      body: ListView(
        children: const [
          // TODO: Add Eco mode icon (e.g. assets/icons/mode_eco.svg)
          ListTile(title: Text('Eco')),
          // TODO: Add Sport mode icon (e.g. assets/icons/mode_sport.svg)
          ListTile(title: Text('Sport')),
          // TODO: Add Pro mode icon (e.g. assets/icons/mode_pro.svg)
          ListTile(title: Text('Pro')),
        ],
      ),
    );
  }
}
