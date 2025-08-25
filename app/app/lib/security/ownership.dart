import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardOwnershipRecord {
  final String boardId;
  final String opk; // base64 encoded public key
  final int createdAt; // epoch millis
  final String? nickname;

  BoardOwnershipRecord({
    required this.boardId,
    required this.opk,
    required this.createdAt,
    this.nickname,
  });

  Map<String, dynamic> toJson() => {
        'board_id': boardId,
        'opk': opk,
        'created_at': createdAt,
        if (nickname != null) 'nickname': nickname,
      };

  static BoardOwnershipRecord fromJson(Map<String, dynamic> json) =>
      BoardOwnershipRecord(
        boardId: json['board_id'] as String,
        opk: json['opk'] as String,
        createdAt: json['created_at'] as int,
        nickname: json['nickname'] as String?,
      );
}

class OwnershipManager {
  static const _privKeyKey = 'ownership_privkey';
  static const _borKey = 'ownership_records';

  final Ed25519 _ed = Ed25519();

  Future<KeyPair> _loadOrCreateKeyPair() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_privKeyKey);
    if (stored != null) {
      final seed = base64.decode(stored);
      final keyPair = await _ed.newKeyPairFromSeed(seed);
      return keyPair;
    }
    final keyPair = await _ed.newKeyPair();
    final data = await keyPair.extractPrivateKeyBytes();
    await prefs.setString(_privKeyKey, base64.encode(data));
    return keyPair;
  }

  Future<SimplePublicKey> getPublicKey() async {
    final kp = await _loadOrCreateKeyPair();
    return await kp.extractPublicKey();
  }

  Future<String> sign(Uint8List message) async {
    final kp = await _loadOrCreateKeyPair();
    final sig = await _ed.sign(message, keyPair: kp);
    return base64.encode(sig.bytes);
  }

  Future<bool> verify(
      Uint8List message, String signature, String publicKeyBase64) async {
    final pkBytes = base64.decode(publicKeyBase64);
    final pk = SimplePublicKey(pkBytes, type: KeyPairType.ed25519);
    final sig = Signature(base64.decode(signature), publicKey: pk);
    return _ed.verify(message, signature: sig);
  }

  Future<BoardOwnershipRecord> createBor(String boardId,
      {String? nickname}) async {
    final pk = await getPublicKey();
    final opk = base64.encode(pk.bytes);
    final bor = BoardOwnershipRecord(
        boardId: boardId,
        opk: opk,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        nickname: nickname);
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getStringList(_borKey) ?? [];
    existing.add(jsonEncode(bor.toJson()));
    await prefs.setStringList(_borKey, existing);
    return bor;
  }

  Future<List<BoardOwnershipRecord>> loadRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_borKey) ?? [];
    return list
        .map((e) => BoardOwnershipRecord.fromJson(jsonDecode(e)))
        .toList();
  }
}
