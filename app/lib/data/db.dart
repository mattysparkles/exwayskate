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

class Routes extends Table {
  IntColumn get id => integer().autoIncrement();
  IntColumn get rideId => integer()();
  TextColumn get polyline => text()();
}

class MileageTotals extends Table {
  IntColumn get id => integer().autoIncrement();
  RealColumn get totalMiles => real().withDefault(const Constant(0))();
}

class FirmwareHistory extends Table {
  IntColumn get id => integer().autoIncrement();
  TextColumn get version => text()();
  DateTimeColumn get ts => dateTime()();
}

class Badges extends Table {
  IntColumn get id => integer().autoIncrement();
  TextColumn get key => text()();
  BoolColumn get earned => boolean().withDefault(const Constant(false))();
  DateTimeColumn get earnedTs => dateTime().nullable()();
}

@DriftDatabase(
    tables: [
  Rides,
  Samples,
  Alerts,
  Routes,
  MileageTotals,
  FirmwareHistory,
  Badges
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async {
        await m.createAll();
        await batch((b) {
          b.insertAll(badges, [
            BadgesCompanion.insert(key: 'first_10'),
            BadgesCompanion.insert(key: 'century'),
            BadgesCompanion.insert(key: 'commute_streak'),
            BadgesCompanion.insert(key: 'top_speed_20'),
            BadgesCompanion.insert(key: 'night_rider'),
          ]);
        });
      }, onUpgrade: (m, from, to) async {
        if (from == 1) {
          await m.createTable(routes);
          await m.createTable(mileageTotals);
          await m.createTable(firmwareHistory);
          await m.createTable(badges);
          await batch((b) {
            b.insertAll(badges, [
              BadgesCompanion.insert(key: 'first_10'),
              BadgesCompanion.insert(key: 'century'),
              BadgesCompanion.insert(key: 'commute_streak'),
              BadgesCompanion.insert(key: 'top_speed_20'),
              BadgesCompanion.insert(key: 'night_rider'),
            ]);
          });
        }
      });
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
