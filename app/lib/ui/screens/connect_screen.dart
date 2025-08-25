import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            SvgPicture.asset(
              'assets/icons/ble_board.svg',
              width: 48,
              height: 48,
            ),
            const SizedBox(height: 8),
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
