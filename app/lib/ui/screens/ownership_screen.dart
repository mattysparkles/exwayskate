import 'package:flutter/material.dart';
import '../../l10n/generated/l10n.dart';

class OwnershipScreen extends StatelessWidget {
  const OwnershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Ownership')),
      body: Center(
        child: Text('${s.lastSeenNear} Main St'),
      ),
    );
  }
}
