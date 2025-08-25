import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xray_companion/security/ownership.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('keygen and BOR round trip', () async {
    final mgr = OwnershipManager();
    final bor = await mgr.createBor('board123', nickname: 'My Board');
    final records = await mgr.loadRecords();
    expect(records.first.boardId, 'board123');
    expect(records.first.nickname, 'My Board');
    final msg = Uint8List.fromList([1, 2, 3]);
    final sig = await mgr.sign(msg);
    final ok = await mgr.verify(msg, sig, bor.opk);
    expect(ok, isTrue);
    final tampered = Uint8List.fromList([1, 2, 4]);
    final bad = await mgr.verify(tampered, sig, bor.opk);
    expect(bad, isFalse);
  });
}
