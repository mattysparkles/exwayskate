import 'dart:math' as math;

class SunTimes {
  final DateTime sunrise;
  final DateTime sunset;
  const SunTimes(this.sunrise, this.sunset);
}

double _degToRad(double deg) => deg * math.pi / 180.0;
double _radToDeg(double rad) => rad * 180.0 / math.pi;

/// Computes sunrise and sunset for [date] at [lat]/[lon].
/// [tzOffsetMinutes] is the timezone offset from UTC in minutes.
SunTimes computeSunTimes(
    DateTime date, double lat, double lon, int tzOffsetMinutes) {
  // Algorithm based on NOAA solar calculations.
  final day = date.toUtc().difference(DateTime.utc(date.year, 1, 1)).inDays + 1;
  final gamma = 2 * math.pi / 365 * (day - 1 + ((date.hour - 12) / 24));

  final eqtime = 229.18 *
      (0.000075 +
          0.001868 * math.cos(gamma) -
          0.032077 * math.sin(gamma) -
          0.014615 * math.cos(2 * gamma) -
          0.040849 * math.sin(2 * gamma));

  final decl = 0.006918 -
      0.399912 * math.cos(gamma) +
      0.070257 * math.sin(gamma) -
      0.006758 * math.cos(2 * gamma) +
      0.000907 * math.sin(2 * gamma) -
      0.002697 * math.cos(3 * gamma) +
      0.00148 * math.sin(3 * gamma);

  final haSunrise = math.acos(
      math.cos(_degToRad(90.833)) /
              (math.cos(_degToRad(lat)) * math.cos(decl)) -
          math.tan(_degToRad(lat)) * math.tan(decl));

  final sunriseT = 720 - 4 * (lon + _radToDeg(haSunrise)) - eqtime;
  final sunsetT = 720 - 4 * (lon - _radToDeg(haSunrise)) - eqtime;

  DateTime sunriseUtc =
      DateTime.utc(date.year, date.month, date.day).add(Duration(minutes: sunriseT.round()));
  DateTime sunsetUtc =
      DateTime.utc(date.year, date.month, date.day).add(Duration(minutes: sunsetT.round()));

  final sunrise = sunriseUtc.add(Duration(minutes: tzOffsetMinutes));
  final sunset = sunsetUtc.add(Duration(minutes: tzOffsetMinutes));
  return SunTimes(sunrise, sunset);
}
