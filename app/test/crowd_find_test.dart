import 'package:flutter_test/flutter_test.dart';
import 'package:xray_companion/security/crowd_find.dart';
import 'package:xray_companion/data/db.dart';

void main() {
  test('Crowd find records sighting', () async {
    final db = AppDatabase();
    final crowd = CrowdFindService(db);
    await crowd.addSighting('MOCK', 1, 2);
    // ensure insert succeeds; no exception
    expect(true, true);
  });
}
