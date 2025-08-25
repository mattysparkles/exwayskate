import 'package:http/http.dart' as http;

import '../data/db.dart';

class CrowdFindService {
  CrowdFindService(this.db, {this.endpoint});

  final AppDatabase db;
  final String? endpoint;

  Future<void> addSighting(String boardHash, double lat, double lon) async {
    await db.customStatement(
        'INSERT INTO crowd_sightings(board_hash, lat, lon, ts) VALUES(?,?,?,?)',
        [boardHash, lat, lon, DateTime.now().toIso8601String()]);
    if (endpoint != null) {
      final url = Uri.parse(endpoint!);
      final body = {
        'board_hash': boardHash.substring(0, 6),
        'lat': (lat).toStringAsFixed(2),
        'lon': (lon).toStringAsFixed(2),
      };
      await http.post(url, body: body);
    }
  }
}
