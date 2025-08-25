import 'package:flutter/material.dart';
import '../../ble/mock_profile.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  void _demo(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/ride');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connect')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Add illustration asset (e.g. assets/images/no_connection.png)
            const Text('No boards connected'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _demo(context),
              child: const Text('Demo Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
