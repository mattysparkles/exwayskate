import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:exwayapp/settings/app_settings.dart';
import 'package:exwayapp/settings/accessibility.dart';
import 'package:exwayapp/ui/screens/ride_screen.dart';
import 'package:exwayapp/ui/screens/diagnostics_screen.dart';

void main() {
  testWidgets('Ride screen shows demo chip', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final app = AppSettings(prefs)..setDemoMode(true);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: app),
          ChangeNotifierProvider(create: (_) => AccessibilitySettings()),
        ],
        child: const MaterialApp(home: RideScreen()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('Demo board connected'), findsOneWidget);
  });

  testWidgets('Diagnostics screen renders cards', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final app = AppSettings(prefs);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: app),
          ChangeNotifierProvider(create: (_) => AccessibilitySettings()),
        ],
        child: const MaterialApp(home: DiagnosticsScreen()),
      ),
    );
    expect(find.text('Battery Health'), findsOneWidget);
  });
}
