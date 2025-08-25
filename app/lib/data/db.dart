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
  TextColumn get cloudStatus =>
      text().withDefault(const Constant('pending'))();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
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

class CloudMeta extends Table {
  TextColumn get key => text()();
  TextColumn get value => text().nullable()();

  @override
  Set<Column> get primaryKey => {key};
}

class CommunityEvents extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get startTs => dateTime()();
  DateTimeColumn get endTs => dateTime()();
  TextColumn get locationName => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get createdByHash => text()();
  TextColumn get cloudStatus =>
      text().withDefault(const Constant('pending'))();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Hazards extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  DateTimeColumn get ts => dateTime()();
  RealColumn get lat => real()();
  RealColumn get lon => real()();
  IntColumn get severity => integer()();
  TextColumn get note => text().nullable()();
  TextColumn get createdByHash => text()();
  TextColumn get cloudStatus =>
      text().withDefault(const Constant('pending'))();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
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

class Faults extends Table {
  IntColumn get id => integer().autoIncrement();
  DateTimeColumn get ts => dateTime()();
  TextColumn get code => text()();
  TextColumn get message => text()();
}

class PackMetrics extends Table {
  IntColumn get id => integer().autoIncrement();
  DateTimeColumn get ts => dateTime()();
  RealColumn get soh => real()();
  RealColumn get sagIndex => real()();
}

class EscMetrics extends Table {
  IntColumn get id => integer().autoIncrement();
  DateTimeColumn get ts => dateTime()();
  RealColumn get tempC => real()();
  RealColumn get etaMin => real()();
}

class CrowdSightings extends Table {
  IntColumn get id => integer().autoIncrement();
  TextColumn get boardHash => text()();
  RealColumn get lat => real()();
  RealColumn get lon => real()();
  DateTimeColumn get ts => dateTime()();
}

class Ownership extends Table {
  IntColumn get id => integer().autoIncrement();
  TextColumn get boardHash => text()();
  TextColumn get ownerKey => text()();
  DateTimeColumn get ts => dateTime()();
}

class Audit extends Table {
  IntColumn get id => integer().autoIncrement();
  TextColumn get action => text()();
  TextColumn get meta => text().nullable()();
  DateTimeColumn get ts => dateTime()();
}

@DriftDatabase(
    tables: [
  Rides,
  Samples,
  Alerts,
  Routes,
  MileageTotals,
  FirmwareHistory,
  Badges,
  CloudMeta,
  CommunityEvents,
  Hazards,
  Faults,
  PackMetrics,
  EscMetrics,
  CrowdSightings,
  Ownership,
  Audit
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());

  @override
  int get schemaVersion => 4;

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
        var start = from;
        if (start == 1) {
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
          start = 2;
        }
        if (start == 2) {
          await m.addColumn(rides, rides.cloudStatus);
          await m.addColumn(rides, rides.updatedAt);
          await m.createTable(cloudMeta);
          await m.createTable(communityEvents);
          await m.createTable(hazards);
          start = 3;
        }
        if (start == 3) {
          // New diagnostics and crowd find tables
          await m.createTable(faults);
          await m.createTable(packMetrics);
          await m.createTable(escMetrics);
          await m.createTable(crowdSightings);
          await m.createTable(ownership);
          await m.createTable(audit);
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
