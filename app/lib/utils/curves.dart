/// Samples a curve defined by five control points into [samples] values.
/// Points must be in the range 0..1.
List<double> sampleCurve(List<double> points, {int samples = 21}) {
  if (points.length != 5) {
    throw ArgumentError('expected exactly 5 control points');
  }
  final result = <double>[];
  for (var i = 0; i < samples; i++) {
    final t = i / (samples - 1);
    final seg = (t * 4).floor().clamp(0, 3);
    final localT = t * 4 - seg;
    final p0 = points[seg];
    final p1 = points[seg + 1];
    // Simple cubic easing between p0 and p1.
    final eased = _cubicEase(p0, p1, localT);
    result.add(eased.clamp(0.0, 1.0));
  }
  return result;
}

double _cubicEase(double a, double b, double t) {
  // Smoothstep interpolation between two points.
  final tt = t * t * (3 - 2 * t);
  return a + (b - a) * tt;
}

/// Preset rider levels with top speed and default curves.
class RiderLevel {
  final double topMph;
  final List<double> accel;
  final List<double> decel;
  const RiderLevel(this.topMph, this.accel, this.decel);
}

final Map<int, RiderLevel> levelPresets = {
  1: RiderLevel(10, [0, 0.2, 0.4, 0.6, 1], [0, 0.2, 0.4, 0.6, 1]),
  2: RiderLevel(15, [0, 0.3, 0.5, 0.7, 1], [0, 0.3, 0.5, 0.7, 1]),
  3: RiderLevel(22, [0, 0.4, 0.6, 0.8, 1], [0, 0.4, 0.6, 0.8, 1]),
  4: RiderLevel(30, [0, 0.5, 0.7, 0.9, 1], [0, 0.5, 0.7, 0.9, 1]),
};

RiderLevel turboPreset(RiderLevel base) {
  return RiderLevel(base.topMph, [0, 0.6, 0.8, 0.95, 1], [0, 0.6, 0.8, 0.95, 1]);
}
