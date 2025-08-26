import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global application settings including demo mode and theming.
class AppSettings extends ChangeNotifier {
  AppSettings(this._prefs)
      : demoMode = _prefs.getBool('demoMode') ?? kDebugMode,
        lastTab = _prefs.getInt('lastTab') ?? 0,
        metricUnits = _prefs.getBool('metricUnits') ?? true,
        themeMode = ThemeMode.values[_prefs.getInt('themeMode') ?? 0];

  final SharedPreferences _prefs;

  bool demoMode;
  int lastTab;
  bool metricUnits;
  ThemeMode themeMode;

  void setDemoMode(bool v) {
    demoMode = v;
    _prefs.setBool('demoMode', v);
    notifyListeners();
  }

  void setLastTab(int i) {
    lastTab = i;
    _prefs.setInt('lastTab', i);
    notifyListeners();
  }

  void setMetricUnits(bool v) {
    metricUnits = v;
    _prefs.setBool('metricUnits', v);
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    _prefs.setInt('themeMode', mode.index);
    notifyListeners();
  }
}
