import 'dart:math';

class Hazard {
  Hazard({
    required this.id,
    required this.type,
    required this.ts,
    required this.lat,
    required this.lon,
    required this.severity,
    this.note,
    required this.createdByHash,
    required this.updatedAt,
  });

  final String id;
  final String type; // pothole|debris|traffic|police|other
  final int ts;
  final double lat;
  final double lon;
  final int severity; // 1..5
  final String? note;
  final String createdByHash;
  final int updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'ts': ts,
        'lat': lat,
        'lon': lon,
        'severity': severity,
        if (note != null) 'note': note,
        'created_by_hash': createdByHash,
        'updated_at': updatedAt,
      };

  static Hazard fromJson(Map<String, dynamic> json) => Hazard(
        id: json['id'] as String,
        type: json['type'] as String,
        ts: json['ts'] as int,
        lat: (json['lat'] as num).toDouble(),
        lon: (json['lon'] as num).toDouble(),
        severity: json['severity'] as int,
        note: json['note'] as String?,
        createdByHash: json['created_by_hash'] as String,
        updatedAt: json['updated_at'] as int,
      );
}

/// Rounds location to ~100m (~3 decimals) to protect privacy.
Hazard coarseHazard(Hazard h) {
  double round3(double v) => (v * 1000).roundToDouble() / 1000.0;
  return Hazard(
    id: h.id,
    type: h.type,
    ts: h.ts,
    lat: round3(h.lat),
    lon: round3(h.lon),
    severity: h.severity,
    note: h.note,
    createdByHash: h.createdByHash,
    updatedAt: h.updatedAt,
  );
}

class HazardStore {
  final Map<String, Hazard> _hazards = {};

  List<Hazard> get all => _hazards.values.toList();

  void upsert(Hazard h) {
    final existing = _hazards[h.id];
    if (existing == null || h.updatedAt >= existing.updatedAt) {
      _hazards[h.id] = h;
    }
  }
}
