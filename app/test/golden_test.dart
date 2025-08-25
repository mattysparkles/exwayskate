import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() async => await loadAppFonts());

  testGoldens('feature goldens', (tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario('leaderboards', const Text('Leaderboards'))
      ..addScenario('community', const Text('Community Events'))
      ..addScenario('hazard', const Text('Report Hazard'))
      ..addScenario('settings', const Text('Cloud Sync Toggle'))
      ..addScenario('range', const Text('Range Warning'));

    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'feature_scenarios');
  }, skip: true);
}
