/// External feed interfaces for optional predictive range enhancements.
abstract class ElevationFeed {
  Future<List<double>> getProfile(String polyline);
}

abstract class WindFeed {
  Future<double?> getForecast(double lat, double lon, int timestamp);
}

abstract class TrafficFeed {
  Future<double?> getRiskScore(String polyline);
}
