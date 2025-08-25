import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:xray_companion/ui/screens/ownership_screen.dart';

import 'golden_utils.dart';

void main() {
  setUpAll(() => ensureGolden('crowd_find_banner'));
  testGoldens('Crowd find banner', (tester) async {
    await tester.pumpWidgetBuilder(const OwnershipScreen());
    await screenMatchesGolden(tester, 'crowd_find_banner');
  });
}
