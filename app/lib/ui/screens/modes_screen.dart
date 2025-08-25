import 'package:flutter/material.dart';

class ModesScreen extends StatelessWidget {
  const ModesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modes')),
      body: ListView(
        children: const [
          ListTile(title: Text('Eco')),
          ListTile(title: Text('Sport')),
          ListTile(title: Text('Pro')),
        ],
      ),
    );
  }
}
