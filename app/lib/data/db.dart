import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';

part 'db.g.dart';

class Rides extends Table {
  IntColumn get id => integer().autoIncrement();
  DateTimeColumn get startTs => dateTime()();
  DateTimeColumn get endTs => dateTime().nullable()();
  RealColumn get distKm => real().withDefault(const Constant(0))();
  RealColumn get avgSpeed => real().withDefault(const Constant(0))();
  RealColumn get maxSpeed => real().withDefault(const Constant(0))();
  RealColumn get energyWh => real().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
}

class Samples extends Table {
  IntColumn get id => integer().autoIncrement();
  IntColumn get rideId => integer()();
  DateTimeColumn get ts => dateTime()();
  RealColumn get speed => real()();
  RealColumn get volts => real()();
  RealColumn get amps => real()();
  RealColumn get escTemp => real()();
  RealColumn get motorTemp => real()();
  RealColumn get throttle => real()();
  RealColumn get brake => real()();
}

class Alerts extends Table {
  IntColumn get id => integer().autoIncrement();
  IntColumn get rideId => integer()();
  DateTimeColumn get ts => dateTime()();
  TextColumn get type => text()();
  TextColumn get meta => text().nullable()();
}

@DriftDatabase(tables: [Rides, Samples, Alerts])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _open() {
  return LazyDatabase(() async {
    final executor = await SqfliteQueryExecutor.inDatabaseFolder(
      path: 'xray.db',
      logStatements: false,
    );
    return executor;
  });
}
