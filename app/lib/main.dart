import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings/app_settings.dart';
import 'settings/accessibility.dart';
import 'ui/screens/ride_screen.dart';
import 'ui/screens/rides_screen.dart';
import 'ui/screens/modes_screen.dart';
import 'ui/screens/diagnostics_screen.dart';
import 'ui/screens/settings_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSettings(prefs)),
        ChangeNotifierProvider(create: (_) => AccessibilitySettings()),
      ],
      child: Consumer<AppSettings>(
        builder: (context, settings, _) {
          final theme = ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
          );
          final dark = ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
            ),
          );
          final routes = ['/ride', '/rides', '/modes', '/diagnostics', '/settings'];
          return MaterialApp(
            title: 'X-Ray',
            theme: theme,
            darkTheme: dark,
            themeMode: settings.themeMode,
            builder: (context, child) {
              final a11y = context.watch<AccessibilitySettings>();
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: a11y.largeText ? 1.3 : 1.0,
                  highContrast: a11y.highContrast,
                ),
                child: child!,
              );
            },
            routes: {
              '/ride': (_) => const RideScreen(),
              '/rides': (_) => const RidesScreen(),
              '/modes': (_) => const ModesScreen(),
              '/diagnostics': (_) => const DiagnosticsScreen(),
              '/settings': (_) => const SettingsScreen(),
            },
            initialRoute: routes[settings.lastTab],
          );
        },
      ),
    );
  }
}
