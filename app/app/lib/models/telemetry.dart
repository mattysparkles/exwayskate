class Telemetry {
  final DateTime ts;
  final int msSinceBoot;
  final double speedMps;
  final double volts;
  final double amps;
  final double escTempC;
  final double motorTempC;
  final double throttlePct;
  final double brakePct;
  final int rideMode;
  final int faultsBits;

  const Telemetry({
    required this.ts,
    required this.msSinceBoot,
    required this.speedMps,
    required this.volts,
    required this.amps,
    required this.escTempC,
    required this.motorTempC,
    required this.throttlePct,
    required this.brakePct,
    required this.rideMode,
    required this.faultsBits,
  });
}
