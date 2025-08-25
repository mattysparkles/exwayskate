import 'dart:math' as math;

/// Computes state of health percentage from nominal and current capacity.
/// Values are clamped to 0-100.
double computeSoh(double designAh, double currentAh) {
  if (designAh <= 0) return 0;
  final pct = (currentAh / designAh) * 100;
  return pct.clamp(0, 100);
}

/// Simple sag index based on voltage spread.
double computeSagIndex(List<double> volts) {
  if (volts.isEmpty) return 0;
  final maxV = volts.reduce(math.max);
  final minV = volts.reduce(math.min);
  return maxV == 0 ? 0 : ((maxV - minV) / maxV) * 100;
}

/// Estimates time until thermal limit is reached.
Duration thermalEta(double currentTemp, double limitTemp, double risePerMin) {
  final remaining = limitTemp - currentTemp;
  if (remaining <= 0 || risePerMin <= 0) return Duration.zero;
  final minutes = remaining / risePerMin;
  return Duration(minutes: minutes.round());
}
