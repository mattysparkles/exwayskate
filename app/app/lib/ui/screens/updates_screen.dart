import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Updates')),
      body: const Center(
        // TODO: Add firmware update illustration (e.g. assets/images/update.png)
        child: Text('Firmware update coming soon.'),
      ),
    );
  }
}
