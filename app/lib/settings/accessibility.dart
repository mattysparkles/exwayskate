import 'package:flutter/foundation.dart';

class AccessibilitySettings extends ChangeNotifier {
  bool highContrast = false;

  void setHighContrast(bool value) {
    highContrast = value;
    notifyListeners();
  }
}
