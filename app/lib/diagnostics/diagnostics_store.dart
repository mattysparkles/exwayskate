import '../data/db.dart';
import '../utils/diagnostics_math.dart';

/// Stores diagnostic metrics and faults using the Drift database.
class DiagnosticsStore {
  DiagnosticsStore(this.db);

  final AppDatabase db;

  Future<void> logFault(String code, String message) async {
    await db.customStatement(
      'INSERT INTO faults(ts, code, message) VALUES(?,?,?)',
      [DateTime.now().toIso8601String(), code, message],
    );
  }

  Future<void> recordPackMetric(double volts, double amps) async {
    final soh = computeSoh(50, volts); // placeholder capacity computation
    final sag = computeSagIndex([volts]);
    await db.customStatement(
      'INSERT INTO pack_metrics(ts, soh, sag_index) VALUES(?,?,?)',
      [DateTime.now().toIso8601String(), soh, sag],
    );
  }

  Future<void> recordEscTemp(double temp, double limit, double risePerMin) async {
    final eta = thermalEta(temp, limit, risePerMin).inMinutes.toDouble();
    await db.customStatement(
      'INSERT INTO esc_metrics(ts, temp_c, eta_min) VALUES(?,?,?)',
      [DateTime.now().toIso8601String(), temp, eta],
    );
  }
}
