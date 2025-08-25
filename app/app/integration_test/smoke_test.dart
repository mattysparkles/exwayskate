import 'package:flutter_test/flutter_test.dart';
import 'package:xray_companion/main.dart';

void main() {
  testWidgets('app builds', (tester) async {
    await tester.pumpWidget(const XRayApp());
    expect(find.byType(XRayApp), findsOneWidget);
  });
}
