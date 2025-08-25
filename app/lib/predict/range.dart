import 'dart:math';

/// Estimates remaining range (in km) based on average Wh/km and battery energy left.
/// Optionally adjust for slope using grades list where each entry is a percent grade
/// (eg 0.03 for 3% uphill). Every 3% uphill adds 15% energy cost.
double estimateRange({
  required double batteryWh,
  required double whPerKm,
  List<double> grades = const [],
}) {
  double adjWhPerKm = whPerKm;
  for (final g in grades) {
    if (g > 0) {
      final factor = 1 + (g / 0.03) * 0.15; // uphill cost
      adjWhPerKm *= factor;
    } else {
      final factor = max(0.0, 1 + (g / 0.03) * 0.1); // downhill reclaim
      adjWhPerKm *= factor;
    }
  }
  if (adjWhPerKm <= 0) return 0;
  return batteryWh / adjWhPerKm;
}
