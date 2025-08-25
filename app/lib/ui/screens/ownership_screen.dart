import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../l10n/generated/l10n.dart';

class OwnershipScreen extends StatelessWidget {
  const OwnershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Ownership')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 8),
            Text('${s.lastSeenNear} Main St'),
          ],
        ),
      ),
    );
  }
}
