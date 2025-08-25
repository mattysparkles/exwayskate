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
import 'ui/screens/diagnostics_screen.dart';
import 'ui/screens/ownership_screen.dart';
import 'ui/theme.dart';
import 'l10n/generated/l10n.dart';
import 'settings/accessibility.dart';
import 'security/notifications.dart';
import 'security/theft_monitor.dart';
import 'security/crowd_find.dart';
import 'data/db.dart';

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
    final db = AppDatabase();
    final notif = NotificationService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccessibilitySettings()),
        Provider(create: (_) => TheftMonitor(notif)),
        Provider(create: (_) => CrowdFindService(db,
            endpoint: const String.fromEnvironment('XRAY_CROWD_URL'))),
        Provider(create: (_) => db),
      ],
      child: Consumer<AccessibilitySettings>(
        builder: (context, a11y, _) {
          return MaterialApp(
            title: S.of(context).appTitle,
            theme:
                a11y.highContrast ? buildHighContrastTheme() : buildTheme(),
            localizationsDelegates: S.localizationsDelegates,
            supportedLocales: S.supportedLocales,
            initialRoute: '/',
            builder: (ctx, child) {
              final media = MediaQuery.of(ctx);
              return MediaQuery(
                data: media.copyWith(
                    textScaleFactor:
                        media.textScaleFactor.clamp(1.0, 2.0)),
                child: child!,
              );
            },
            routes: {
              '/': (_) => const ConnectScreen(),
              '/ride': (_) => const RideScreen(),
              '/rides': (_) => const RidesScreen(),
              '/modes': (_) => const ModesScreen(),
              '/updates': (_) => const UpdatesScreen(),
              '/settings': (_) => const SettingsScreen(),
              '/diagnostics': (_) => const DiagnosticsScreen(),
              '/ownership': (_) => const OwnershipScreen(),
            },
          );
        },
      ),
    );
  }
}
