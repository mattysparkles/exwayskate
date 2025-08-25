import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:xray_companion/ui/screens/settings_screen.dart';

import 'golden_utils.dart';

void main() {
  setUpAll(() => ensureGolden('high_contrast_settings'));
  testGoldens('High contrast settings', (tester) async {
    await tester.pumpWidgetBuilder(const SettingsScreen(),
        surfaceSize: const Size(400, 800),
        textScaleSize: 2.0);
    await screenMatchesGolden(tester, 'high_contrast_settings');
  });
}
