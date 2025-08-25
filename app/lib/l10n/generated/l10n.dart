import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class S {
  S(this.locale);

  final Locale locale;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S) ?? S(const Locale('en'));
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  static const List<Locale> supportedLocales = [Locale('en')];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Future<S> load(Locale locale) async => S(locale);

  String get appTitle => 'X-Ray';
  String get diagnostics => 'Diagnostics';
  String get batteryHealth => 'Battery Health';
  String get sagRisk => 'Sag Risk';
  String get escTemps => 'ESC Temps';
  String get faultsLog => 'Faults Log';
  String get maintenanceTips => 'Maintenance Tips';
  String get settings => 'Settings';
  String get accessibility => 'Accessibility';
  String get highContrast => 'High Contrast';
  String get developer => 'Developer';
  String get simulateTheftPing => 'Simulate theft ping';
  String get generateMockSighting => 'Generate mock sighting';
  String get lastSeenNear => 'Last seen near';
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<S> load(Locale locale) => S.load(locale);

  @override
  bool shouldReload(_SDelegate old) => false;
}
