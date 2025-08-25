import 'dart:convert';

class CommunityEvent {
  CommunityEvent({
    required this.id,
    required this.title,
    required this.startTs,
    required this.endTs,
    this.locationName,
    this.lat,
    this.lon,
    this.description,
    required this.createdByHash,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final int startTs;
  final int endTs;
  final String? locationName;
  final double? lat;
  final double? lon;
  final String? description;
  final String createdByHash;
  final int updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'start_ts': startTs,
        'end_ts': endTs,
        if (locationName != null) 'location_name': locationName,
        if (lat != null) 'lat': lat,
        if (lon != null) 'lon': lon,
        if (description != null) 'description': description,
        'created_by_hash': createdByHash,
        'updated_at': updatedAt,
      };

  static CommunityEvent fromJson(Map<String, dynamic> json) => CommunityEvent(
        id: json['id'] as String,
        title: json['title'] as String,
        startTs: json['start_ts'] as int,
        endTs: json['end_ts'] as int,
        locationName: json['location_name'] as String?,
        lat: (json['lat'] as num?)?.toDouble(),
        lon: (json['lon'] as num?)?.toDouble(),
        description: json['description'] as String?,
        createdByHash: json['created_by_hash'] as String,
        updatedAt: json['updated_at'] as int,
      );
}

/// Simple in-memory store used for tests and offline mode.
class CommunityStore {
  final Map<String, CommunityEvent> _events = {};

  List<CommunityEvent> get events => _events.values.toList();

  void upsert(CommunityEvent e) {
    final existing = _events[e.id];
    if (existing == null || e.updatedAt >= existing.updatedAt) {
      _events[e.id] = e;
    }
  }
}

String encodePretty(Object? data) => const JsonEncoder.withIndent('  ').convert(data);
