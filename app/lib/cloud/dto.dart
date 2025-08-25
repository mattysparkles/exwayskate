import 'dart:convert';

/// Data transfer object for ride synchronization.
class RideDTO {
  RideDTO({
    required this.id,
    required this.startedAt,
    required this.endedAt,
    required this.distanceM,
    required this.avgSpeedMps,
    required this.maxSpeedMps,
    this.energyWh,
    this.samples,
    required this.updatedAt,
  });

  final String id;
  final int startedAt;
  final int? endedAt;
  final double distanceM;
  final double avgSpeedMps;
  final double maxSpeedMps;
  final double? energyWh;
  final String? samples;
  final int updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'started_at': startedAt,
        'ended_at': endedAt,
        'distance_m': distanceM,
        'avg_speed_mps': avgSpeedMps,
        'max_speed_mps': maxSpeedMps,
        if (energyWh != null) 'energy_wh': energyWh,
        if (samples != null) 'samples': samples,
        'updated_at': updatedAt,
      };

  static RideDTO fromJson(Map<String, dynamic> json) => RideDTO(
        id: json['id'] as String,
        startedAt: json['started_at'] as int,
        endedAt: json['ended_at'] as int?,
        distanceM: (json['distance_m'] as num).toDouble(),
        avgSpeedMps: (json['avg_speed_mps'] as num).toDouble(),
        maxSpeedMps: (json['max_speed_mps'] as num).toDouble(),
        energyWh: (json['energy_wh'] as num?)?.toDouble(),
        samples: json['samples'] as String?,
        updatedAt: json['updated_at'] as int,
      );
}

class UserDTO {
  UserDTO({required this.idHash, this.displayName});
  final String idHash;
  final String? displayName;

  Map<String, dynamic> toJson() => {
        'id_hash': idHash,
        if (displayName != null) 'display_name': displayName,
      };

  static UserDTO fromJson(Map<String, dynamic> json) =>
      UserDTO(idHash: json['id_hash'] as String, displayName: json['display_name'] as String?);
}

class LeaderboardEntryDTO {
  LeaderboardEntryDTO({
    required this.idHash,
    required this.milesTotal,
    required this.ridesCount,
    required this.lastRideAt,
  });
  final String idHash;
  final double milesTotal;
  final int ridesCount;
  final int lastRideAt;

  Map<String, dynamic> toJson() => {
        'id_hash': idHash,
        'miles_total': milesTotal,
        'rides_count': ridesCount,
        'last_ride_at': lastRideAt,
      };

  static LeaderboardEntryDTO fromJson(Map<String, dynamic> json) => LeaderboardEntryDTO(
        idHash: json['id_hash'] as String,
        milesTotal: (json['miles_total'] as num).toDouble(),
        ridesCount: json['rides_count'] as int,
        lastRideAt: json['last_ride_at'] as int,
      );
}

/// Utility used by tests to pretty print JSON structures.
String encodePretty(Object? data) => const JsonEncoder.withIndent('  ').convert(data);
