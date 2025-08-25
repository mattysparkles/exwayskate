import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:xray_companion/ui/screens/diagnostics_screen.dart';

import 'golden_utils.dart';

void main() {
  setUpAll(() => ensureGolden('diagnostics_screen'));
  testGoldens('Diagnostics screen', (tester) async {
    await tester.pumpWidgetBuilder(const DiagnosticsScreen());
    await screenMatchesGolden(tester, 'diagnostics_screen');
  });
}
