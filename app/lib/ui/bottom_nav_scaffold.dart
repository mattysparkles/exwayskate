import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../settings/app_settings.dart';

/// Common scaffold with bottom navigation and shared routing.
class BottomNavScaffold extends StatelessWidget {
  const BottomNavScaffold({
    super.key,
    required this.index,
    required this.title,
    required this.body,
  });

  final int index;
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final settings = context.read<AppSettings>();
    void onTap(int i) {
      if (i == index) return;
      settings.setLastTab(i);
      const routes = ['/ride', '/rides', '/modes', '/diagnostics', '/settings'];
      Navigator.pushReplacementNamed(context, routes[i]);
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.speed), label: 'Ride'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Rides'),
          BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Modes'),
          BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'Diagnostics'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
