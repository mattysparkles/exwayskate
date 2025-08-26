import 'package:flutter/foundation.dart';

class AccessibilitySettings extends ChangeNotifier {
  bool highContrast = false;
  bool largeText = false;

  void setHighContrast(bool value) {
    highContrast = value;
    notifyListeners();
  }

  void setLargeText(bool value) {
    largeText = value;
    notifyListeners();
  }
}
