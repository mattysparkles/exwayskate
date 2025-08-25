import 'dto.dart';

/// Computes a single user leaderboard entry from local rides.
LeaderboardEntryDTO computeLocalLeaderboard(String idHash, List<RideDTO> rides) {
  final totalMiles = rides.fold<double>(0, (p, r) => p + r.distanceM / 1609.34);
  rides.sort((a, b) => a.startedAt.compareTo(b.startedAt));
  final lastRideAt = rides.isEmpty ? 0 : rides.last.startedAt;
  return LeaderboardEntryDTO(
      idHash: idHash,
      milesTotal: totalMiles,
      ridesCount: rides.length,
      lastRideAt: lastRideAt);
}
