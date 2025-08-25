import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ble/vendor_registry.dart';
import 'ui/screens/connect_screen.dart';
import 'ui/screens/ride_screen.dart';
import 'ui/screens/rides_screen.dart';
import 'ui/screens/modes_screen.dart';
import 'ui/screens/updates_screen.dart';
import 'ui/screens/settings_screen.dart';
import 'ui/theme.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const XRayApp());
  }, (error, stack) {
    // Sentry would go here if DSN configured.
  });
}

class XRayApp extends StatelessWidget {
  const XRayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: MaterialApp(
        title: 'X-Ray',
        theme: buildTheme(),
        initialRoute: '/',
        routes: {
          '/': (_) => const ConnectScreen(),
          '/ride': (_) => const RideScreen(),
          '/rides': (_) => const RidesScreen(),
          '/modes': (_) => const ModesScreen(),
          '/updates': (_) => const UpdatesScreen(),
          '/settings': (_) => const SettingsScreen(),
        },
      ),
    );
  }
}
