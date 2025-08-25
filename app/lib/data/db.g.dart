// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $RidesTable extends Rides with TableInfo<$RidesTable, Ride> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RidesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _startTsMeta =
      const VerificationMeta('startTs');
  @override
  late final GeneratedColumn<DateTime> startTs = GeneratedColumn<DateTime>(
      'start_ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTsMeta = const VerificationMeta('endTs');
  @override
  late final GeneratedColumn<DateTime> endTs = GeneratedColumn<DateTime>(
      'end_ts', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _distKmMeta = const VerificationMeta('distKm');
  @override
  late final GeneratedColumn<double> distKm = GeneratedColumn<double>(
      'dist_km', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _avgSpeedMeta =
      const VerificationMeta('avgSpeed');
  @override
  late final GeneratedColumn<double> avgSpeed = GeneratedColumn<double>(
      'avg_speed', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _maxSpeedMeta =
      const VerificationMeta('maxSpeed');
  @override
  late final GeneratedColumn<double> maxSpeed = GeneratedColumn<double>(
      'max_speed', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _energyWhMeta =
      const VerificationMeta('energyWh');
  @override
  late final GeneratedColumn<double> energyWh = GeneratedColumn<double>(
      'energy_wh', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cloudStatusMeta =
      const VerificationMeta('cloudStatus');
  @override
  late final GeneratedColumn<String> cloudStatus = GeneratedColumn<String>(
      'cloud_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        startTs,
        endTs,
        distKm,
        avgSpeed,
        maxSpeed,
        energyWh,
        notes,
        cloudStatus,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rides';
  @override
  VerificationContext validateIntegrity(Insertable<Ride> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_ts')) {
      context.handle(_startTsMeta,
          startTs.isAcceptableOrUnknown(data['start_ts']!, _startTsMeta));
    } else if (isInserting) {
      context.missing(_startTsMeta);
    }
    if (data.containsKey('end_ts')) {
      context.handle(
          _endTsMeta, endTs.isAcceptableOrUnknown(data['end_ts']!, _endTsMeta));
    }
    if (data.containsKey('dist_km')) {
      context.handle(_distKmMeta,
          distKm.isAcceptableOrUnknown(data['dist_km']!, _distKmMeta));
    }
    if (data.containsKey('avg_speed')) {
      context.handle(_avgSpeedMeta,
          avgSpeed.isAcceptableOrUnknown(data['avg_speed']!, _avgSpeedMeta));
    }
    if (data.containsKey('max_speed')) {
      context.handle(_maxSpeedMeta,
          maxSpeed.isAcceptableOrUnknown(data['max_speed']!, _maxSpeedMeta));
    }
    if (data.containsKey('energy_wh')) {
      context.handle(_energyWhMeta,
          energyWh.isAcceptableOrUnknown(data['energy_wh']!, _energyWhMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('cloud_status')) {
      context.handle(
          _cloudStatusMeta,
          cloudStatus.isAcceptableOrUnknown(
              data['cloud_status']!, _cloudStatusMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ride map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ride(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      startTs: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_ts'])!,
      endTs: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_ts']),
      distKm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dist_km'])!,
      avgSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}avg_speed'])!,
      maxSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_speed'])!,
      energyWh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}energy_wh'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      cloudStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cloud_status'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RidesTable createAlias(String alias) {
    return $RidesTable(attachedDatabase, alias);
  }
}

class Ride extends DataClass implements Insertable<Ride> {
  final int id;
  final DateTime startTs;
  final DateTime? endTs;
  final double distKm;
  final double avgSpeed;
  final double maxSpeed;
  final double energyWh;
  final String? notes;
  final String cloudStatus;
  final DateTime updatedAt;
  const Ride(
      {required this.id,
      required this.startTs,
      this.endTs,
      required this.distKm,
      required this.avgSpeed,
      required this.maxSpeed,
      required this.energyWh,
      this.notes,
      required this.cloudStatus,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start_ts'] = Variable<DateTime>(startTs);
    if (!nullToAbsent || endTs != null) {
      map['end_ts'] = Variable<DateTime>(endTs);
    }
    map['dist_km'] = Variable<double>(distKm);
    map['avg_speed'] = Variable<double>(avgSpeed);
    map['max_speed'] = Variable<double>(maxSpeed);
    map['energy_wh'] = Variable<double>(energyWh);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['cloud_status'] = Variable<String>(cloudStatus);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RidesCompanion toCompanion(bool nullToAbsent) {
    return RidesCompanion(
      id: Value(id),
      startTs: Value(startTs),
      endTs:
          endTs == null && nullToAbsent ? const Value.absent() : Value(endTs),
      distKm: Value(distKm),
      avgSpeed: Value(avgSpeed),
      maxSpeed: Value(maxSpeed),
      energyWh: Value(energyWh),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      cloudStatus: Value(cloudStatus),
      updatedAt: Value(updatedAt),
    );
  }

  factory Ride.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ride(
      id: serializer.fromJson<int>(json['id']),
      startTs: serializer.fromJson<DateTime>(json['startTs']),
      endTs: serializer.fromJson<DateTime?>(json['endTs']),
      distKm: serializer.fromJson<double>(json['distKm']),
      avgSpeed: serializer.fromJson<double>(json['avgSpeed']),
      maxSpeed: serializer.fromJson<double>(json['maxSpeed']),
      energyWh: serializer.fromJson<double>(json['energyWh']),
      notes: serializer.fromJson<String?>(json['notes']),
      cloudStatus: serializer.fromJson<String>(json['cloudStatus']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startTs': serializer.toJson<DateTime>(startTs),
      'endTs': serializer.toJson<DateTime?>(endTs),
      'distKm': serializer.toJson<double>(distKm),
      'avgSpeed': serializer.toJson<double>(avgSpeed),
      'maxSpeed': serializer.toJson<double>(maxSpeed),
      'energyWh': serializer.toJson<double>(energyWh),
      'notes': serializer.toJson<String?>(notes),
      'cloudStatus': serializer.toJson<String>(cloudStatus),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Ride copyWith(
          {int? id,
          DateTime? startTs,
          Value<DateTime?> endTs = const Value.absent(),
          double? distKm,
          double? avgSpeed,
          double? maxSpeed,
          double? energyWh,
          Value<String?> notes = const Value.absent(),
          String? cloudStatus,
          DateTime? updatedAt}) =>
      Ride(
        id: id ?? this.id,
        startTs: startTs ?? this.startTs,
        endTs: endTs.present ? endTs.value : this.endTs,
        distKm: distKm ?? this.distKm,
        avgSpeed: avgSpeed ?? this.avgSpeed,
        maxSpeed: maxSpeed ?? this.maxSpeed,
        energyWh: energyWh ?? this.energyWh,
        notes: notes.present ? notes.value : this.notes,
        cloudStatus: cloudStatus ?? this.cloudStatus,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Ride copyWithCompanion(RidesCompanion data) {
    return Ride(
      id: data.id.present ? data.id.value : this.id,
      startTs: data.startTs.present ? data.startTs.value : this.startTs,
      endTs: data.endTs.present ? data.endTs.value : this.endTs,
      distKm: data.distKm.present ? data.distKm.value : this.distKm,
      avgSpeed: data.avgSpeed.present ? data.avgSpeed.value : this.avgSpeed,
      maxSpeed: data.maxSpeed.present ? data.maxSpeed.value : this.maxSpeed,
      energyWh: data.energyWh.present ? data.energyWh.value : this.energyWh,
      notes: data.notes.present ? data.notes.value : this.notes,
      cloudStatus:
          data.cloudStatus.present ? data.cloudStatus.value : this.cloudStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ride(')
          ..write('id: $id, ')
          ..write('startTs: $startTs, ')
          ..write('endTs: $endTs, ')
          ..write('distKm: $distKm, ')
          ..write('avgSpeed: $avgSpeed, ')
          ..write('maxSpeed: $maxSpeed, ')
          ..write('energyWh: $energyWh, ')
          ..write('notes: $notes, ')
          ..write('cloudStatus: $cloudStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, startTs, endTs, distKm, avgSpeed,
      maxSpeed, energyWh, notes, cloudStatus, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ride &&
          other.id == this.id &&
          other.startTs == this.startTs &&
          other.endTs == this.endTs &&
          other.distKm == this.distKm &&
          other.avgSpeed == this.avgSpeed &&
          other.maxSpeed == this.maxSpeed &&
          other.energyWh == this.energyWh &&
          other.notes == this.notes &&
          other.cloudStatus == this.cloudStatus &&
          other.updatedAt == this.updatedAt);
}

class RidesCompanion extends UpdateCompanion<Ride> {
  final Value<int> id;
  final Value<DateTime> startTs;
  final Value<DateTime?> endTs;
  final Value<double> distKm;
  final Value<double> avgSpeed;
  final Value<double> maxSpeed;
  final Value<double> energyWh;
  final Value<String?> notes;
  final Value<String> cloudStatus;
  final Value<DateTime> updatedAt;
  const RidesCompanion({
    this.id = const Value.absent(),
    this.startTs = const Value.absent(),
    this.endTs = const Value.absent(),
    this.distKm = const Value.absent(),
    this.avgSpeed = const Value.absent(),
    this.maxSpeed = const Value.absent(),
    this.energyWh = const Value.absent(),
    this.notes = const Value.absent(),
    this.cloudStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RidesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime startTs,
    this.endTs = const Value.absent(),
    this.distKm = const Value.absent(),
    this.avgSpeed = const Value.absent(),
    this.maxSpeed = const Value.absent(),
    this.energyWh = const Value.absent(),
    this.notes = const Value.absent(),
    this.cloudStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : startTs = Value(startTs);
  static Insertable<Ride> custom({
    Expression<int>? id,
    Expression<DateTime>? startTs,
    Expression<DateTime>? endTs,
    Expression<double>? distKm,
    Expression<double>? avgSpeed,
    Expression<double>? maxSpeed,
    Expression<double>? energyWh,
    Expression<String>? notes,
    Expression<String>? cloudStatus,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startTs != null) 'start_ts': startTs,
      if (endTs != null) 'end_ts': endTs,
      if (distKm != null) 'dist_km': distKm,
      if (avgSpeed != null) 'avg_speed': avgSpeed,
      if (maxSpeed != null) 'max_speed': maxSpeed,
      if (energyWh != null) 'energy_wh': energyWh,
      if (notes != null) 'notes': notes,
      if (cloudStatus != null) 'cloud_status': cloudStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RidesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? startTs,
      Value<DateTime?>? endTs,
      Value<double>? distKm,
      Value<double>? avgSpeed,
      Value<double>? maxSpeed,
      Value<double>? energyWh,
      Value<String?>? notes,
      Value<String>? cloudStatus,
      Value<DateTime>? updatedAt}) {
    return RidesCompanion(
      id: id ?? this.id,
      startTs: startTs ?? this.startTs,
      endTs: endTs ?? this.endTs,
      distKm: distKm ?? this.distKm,
      avgSpeed: avgSpeed ?? this.avgSpeed,
      maxSpeed: maxSpeed ?? this.maxSpeed,
      energyWh: energyWh ?? this.energyWh,
      notes: notes ?? this.notes,
      cloudStatus: cloudStatus ?? this.cloudStatus,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startTs.present) {
      map['start_ts'] = Variable<DateTime>(startTs.value);
    }
    if (endTs.present) {
      map['end_ts'] = Variable<DateTime>(endTs.value);
    }
    if (distKm.present) {
      map['dist_km'] = Variable<double>(distKm.value);
    }
    if (avgSpeed.present) {
      map['avg_speed'] = Variable<double>(avgSpeed.value);
    }
    if (maxSpeed.present) {
      map['max_speed'] = Variable<double>(maxSpeed.value);
    }
    if (energyWh.present) {
      map['energy_wh'] = Variable<double>(energyWh.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (cloudStatus.present) {
      map['cloud_status'] = Variable<String>(cloudStatus.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RidesCompanion(')
          ..write('id: $id, ')
          ..write('startTs: $startTs, ')
          ..write('endTs: $endTs, ')
          ..write('distKm: $distKm, ')
          ..write('avgSpeed: $avgSpeed, ')
          ..write('maxSpeed: $maxSpeed, ')
          ..write('energyWh: $energyWh, ')
          ..write('notes: $notes, ')
          ..write('cloudStatus: $cloudStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SamplesTable extends Samples with TableInfo<$SamplesTable, Sample> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SamplesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _rideIdMeta = const VerificationMeta('rideId');
  @override
  late final GeneratedColumn<int> rideId = GeneratedColumn<int>(
      'ride_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
      'speed', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _voltsMeta = const VerificationMeta('volts');
  @override
  late final GeneratedColumn<double> volts = GeneratedColumn<double>(
      'volts', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _ampsMeta = const VerificationMeta('amps');
  @override
  late final GeneratedColumn<double> amps = GeneratedColumn<double>(
      'amps', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _escTempMeta =
      const VerificationMeta('escTemp');
  @override
  late final GeneratedColumn<double> escTemp = GeneratedColumn<double>(
      'esc_temp', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _motorTempMeta =
      const VerificationMeta('motorTemp');
  @override
  late final GeneratedColumn<double> motorTemp = GeneratedColumn<double>(
      'motor_temp', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _throttleMeta =
      const VerificationMeta('throttle');
  @override
  late final GeneratedColumn<double> throttle = GeneratedColumn<double>(
      'throttle', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _brakeMeta = const VerificationMeta('brake');
  @override
  late final GeneratedColumn<double> brake = GeneratedColumn<double>(
      'brake', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, rideId, ts, speed, volts, amps, escTemp, motorTemp, throttle, brake];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'samples';
  @override
  VerificationContext validateIntegrity(Insertable<Sample> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ride_id')) {
      context.handle(_rideIdMeta,
          rideId.isAcceptableOrUnknown(data['ride_id']!, _rideIdMeta));
    } else if (isInserting) {
      context.missing(_rideIdMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('volts')) {
      context.handle(
          _voltsMeta, volts.isAcceptableOrUnknown(data['volts']!, _voltsMeta));
    } else if (isInserting) {
      context.missing(_voltsMeta);
    }
    if (data.containsKey('amps')) {
      context.handle(
          _ampsMeta, amps.isAcceptableOrUnknown(data['amps']!, _ampsMeta));
    } else if (isInserting) {
      context.missing(_ampsMeta);
    }
    if (data.containsKey('esc_temp')) {
      context.handle(_escTempMeta,
          escTemp.isAcceptableOrUnknown(data['esc_temp']!, _escTempMeta));
    } else if (isInserting) {
      context.missing(_escTempMeta);
    }
    if (data.containsKey('motor_temp')) {
      context.handle(_motorTempMeta,
          motorTemp.isAcceptableOrUnknown(data['motor_temp']!, _motorTempMeta));
    } else if (isInserting) {
      context.missing(_motorTempMeta);
    }
    if (data.containsKey('throttle')) {
      context.handle(_throttleMeta,
          throttle.isAcceptableOrUnknown(data['throttle']!, _throttleMeta));
    } else if (isInserting) {
      context.missing(_throttleMeta);
    }
    if (data.containsKey('brake')) {
      context.handle(
          _brakeMeta, brake.isAcceptableOrUnknown(data['brake']!, _brakeMeta));
    } else if (isInserting) {
      context.missing(_brakeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Sample map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sample(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rideId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ride_id'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      speed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}speed'])!,
      volts: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}volts'])!,
      amps: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amps'])!,
      escTemp: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}esc_temp'])!,
      motorTemp: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}motor_temp'])!,
      throttle: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}throttle'])!,
      brake: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}brake'])!,
    );
  }

  @override
  $SamplesTable createAlias(String alias) {
    return $SamplesTable(attachedDatabase, alias);
  }
}

class Sample extends DataClass implements Insertable<Sample> {
  final int id;
  final int rideId;
  final DateTime ts;
  final double speed;
  final double volts;
  final double amps;
  final double escTemp;
  final double motorTemp;
  final double throttle;
  final double brake;
  const Sample(
      {required this.id,
      required this.rideId,
      required this.ts,
      required this.speed,
      required this.volts,
      required this.amps,
      required this.escTemp,
      required this.motorTemp,
      required this.throttle,
      required this.brake});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ride_id'] = Variable<int>(rideId);
    map['ts'] = Variable<DateTime>(ts);
    map['speed'] = Variable<double>(speed);
    map['volts'] = Variable<double>(volts);
    map['amps'] = Variable<double>(amps);
    map['esc_temp'] = Variable<double>(escTemp);
    map['motor_temp'] = Variable<double>(motorTemp);
    map['throttle'] = Variable<double>(throttle);
    map['brake'] = Variable<double>(brake);
    return map;
  }

  SamplesCompanion toCompanion(bool nullToAbsent) {
    return SamplesCompanion(
      id: Value(id),
      rideId: Value(rideId),
      ts: Value(ts),
      speed: Value(speed),
      volts: Value(volts),
      amps: Value(amps),
      escTemp: Value(escTemp),
      motorTemp: Value(motorTemp),
      throttle: Value(throttle),
      brake: Value(brake),
    );
  }

  factory Sample.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sample(
      id: serializer.fromJson<int>(json['id']),
      rideId: serializer.fromJson<int>(json['rideId']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      speed: serializer.fromJson<double>(json['speed']),
      volts: serializer.fromJson<double>(json['volts']),
      amps: serializer.fromJson<double>(json['amps']),
      escTemp: serializer.fromJson<double>(json['escTemp']),
      motorTemp: serializer.fromJson<double>(json['motorTemp']),
      throttle: serializer.fromJson<double>(json['throttle']),
      brake: serializer.fromJson<double>(json['brake']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rideId': serializer.toJson<int>(rideId),
      'ts': serializer.toJson<DateTime>(ts),
      'speed': serializer.toJson<double>(speed),
      'volts': serializer.toJson<double>(volts),
      'amps': serializer.toJson<double>(amps),
      'escTemp': serializer.toJson<double>(escTemp),
      'motorTemp': serializer.toJson<double>(motorTemp),
      'throttle': serializer.toJson<double>(throttle),
      'brake': serializer.toJson<double>(brake),
    };
  }

  Sample copyWith(
          {int? id,
          int? rideId,
          DateTime? ts,
          double? speed,
          double? volts,
          double? amps,
          double? escTemp,
          double? motorTemp,
          double? throttle,
          double? brake}) =>
      Sample(
        id: id ?? this.id,
        rideId: rideId ?? this.rideId,
        ts: ts ?? this.ts,
        speed: speed ?? this.speed,
        volts: volts ?? this.volts,
        amps: amps ?? this.amps,
        escTemp: escTemp ?? this.escTemp,
        motorTemp: motorTemp ?? this.motorTemp,
        throttle: throttle ?? this.throttle,
        brake: brake ?? this.brake,
      );
  Sample copyWithCompanion(SamplesCompanion data) {
    return Sample(
      id: data.id.present ? data.id.value : this.id,
      rideId: data.rideId.present ? data.rideId.value : this.rideId,
      ts: data.ts.present ? data.ts.value : this.ts,
      speed: data.speed.present ? data.speed.value : this.speed,
      volts: data.volts.present ? data.volts.value : this.volts,
      amps: data.amps.present ? data.amps.value : this.amps,
      escTemp: data.escTemp.present ? data.escTemp.value : this.escTemp,
      motorTemp: data.motorTemp.present ? data.motorTemp.value : this.motorTemp,
      throttle: data.throttle.present ? data.throttle.value : this.throttle,
      brake: data.brake.present ? data.brake.value : this.brake,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Sample(')
          ..write('id: $id, ')
          ..write('rideId: $rideId, ')
          ..write('ts: $ts, ')
          ..write('speed: $speed, ')
          ..write('volts: $volts, ')
          ..write('amps: $amps, ')
          ..write('escTemp: $escTemp, ')
          ..write('motorTemp: $motorTemp, ')
          ..write('throttle: $throttle, ')
          ..write('brake: $brake')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, rideId, ts, speed, volts, amps, escTemp, motorTemp, throttle, brake);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sample &&
          other.id == this.id &&
          other.rideId == this.rideId &&
          other.ts == this.ts &&
          other.speed == this.speed &&
          other.volts == this.volts &&
          other.amps == this.amps &&
          other.escTemp == this.escTemp &&
          other.motorTemp == this.motorTemp &&
          other.throttle == this.throttle &&
          other.brake == this.brake);
}

class SamplesCompanion extends UpdateCompanion<Sample> {
  final Value<int> id;
  final Value<int> rideId;
  final Value<DateTime> ts;
  final Value<double> speed;
  final Value<double> volts;
  final Value<double> amps;
  final Value<double> escTemp;
  final Value<double> motorTemp;
  final Value<double> throttle;
  final Value<double> brake;
  const SamplesCompanion({
    this.id = const Value.absent(),
    this.rideId = const Value.absent(),
    this.ts = const Value.absent(),
    this.speed = const Value.absent(),
    this.volts = const Value.absent(),
    this.amps = const Value.absent(),
    this.escTemp = const Value.absent(),
    this.motorTemp = const Value.absent(),
    this.throttle = const Value.absent(),
    this.brake = const Value.absent(),
  });
  SamplesCompanion.insert({
    this.id = const Value.absent(),
    required int rideId,
    required DateTime ts,
    required double speed,
    required double volts,
    required double amps,
    required double escTemp,
    required double motorTemp,
    required double throttle,
    required double brake,
  })  : rideId = Value(rideId),
        ts = Value(ts),
        speed = Value(speed),
        volts = Value(volts),
        amps = Value(amps),
        escTemp = Value(escTemp),
        motorTemp = Value(motorTemp),
        throttle = Value(throttle),
        brake = Value(brake);
  static Insertable<Sample> custom({
    Expression<int>? id,
    Expression<int>? rideId,
    Expression<DateTime>? ts,
    Expression<double>? speed,
    Expression<double>? volts,
    Expression<double>? amps,
    Expression<double>? escTemp,
    Expression<double>? motorTemp,
    Expression<double>? throttle,
    Expression<double>? brake,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rideId != null) 'ride_id': rideId,
      if (ts != null) 'ts': ts,
      if (speed != null) 'speed': speed,
      if (volts != null) 'volts': volts,
      if (amps != null) 'amps': amps,
      if (escTemp != null) 'esc_temp': escTemp,
      if (motorTemp != null) 'motor_temp': motorTemp,
      if (throttle != null) 'throttle': throttle,
      if (brake != null) 'brake': brake,
    });
  }

  SamplesCompanion copyWith(
      {Value<int>? id,
      Value<int>? rideId,
      Value<DateTime>? ts,
      Value<double>? speed,
      Value<double>? volts,
      Value<double>? amps,
      Value<double>? escTemp,
      Value<double>? motorTemp,
      Value<double>? throttle,
      Value<double>? brake}) {
    return SamplesCompanion(
      id: id ?? this.id,
      rideId: rideId ?? this.rideId,
      ts: ts ?? this.ts,
      speed: speed ?? this.speed,
      volts: volts ?? this.volts,
      amps: amps ?? this.amps,
      escTemp: escTemp ?? this.escTemp,
      motorTemp: motorTemp ?? this.motorTemp,
      throttle: throttle ?? this.throttle,
      brake: brake ?? this.brake,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rideId.present) {
      map['ride_id'] = Variable<int>(rideId.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (volts.present) {
      map['volts'] = Variable<double>(volts.value);
    }
    if (amps.present) {
      map['amps'] = Variable<double>(amps.value);
    }
    if (escTemp.present) {
      map['esc_temp'] = Variable<double>(escTemp.value);
    }
    if (motorTemp.present) {
      map['motor_temp'] = Variable<double>(motorTemp.value);
    }
    if (throttle.present) {
      map['throttle'] = Variable<double>(throttle.value);
    }
    if (brake.present) {
      map['brake'] = Variable<double>(brake.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SamplesCompanion(')
          ..write('id: $id, ')
          ..write('rideId: $rideId, ')
          ..write('ts: $ts, ')
          ..write('speed: $speed, ')
          ..write('volts: $volts, ')
          ..write('amps: $amps, ')
          ..write('escTemp: $escTemp, ')
          ..write('motorTemp: $motorTemp, ')
          ..write('throttle: $throttle, ')
          ..write('brake: $brake')
          ..write(')'))
        .toString();
  }
}

class $AlertsTable extends Alerts with TableInfo<$AlertsTable, Alert> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlertsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _rideIdMeta = const VerificationMeta('rideId');
  @override
  late final GeneratedColumn<int> rideId = GeneratedColumn<int>(
      'ride_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _metaMeta = const VerificationMeta('meta');
  @override
  late final GeneratedColumn<String> meta = GeneratedColumn<String>(
      'meta', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, rideId, ts, type, meta];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alerts';
  @override
  VerificationContext validateIntegrity(Insertable<Alert> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ride_id')) {
      context.handle(_rideIdMeta,
          rideId.isAcceptableOrUnknown(data['ride_id']!, _rideIdMeta));
    } else if (isInserting) {
      context.missing(_rideIdMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('meta')) {
      context.handle(
          _metaMeta, meta.isAcceptableOrUnknown(data['meta']!, _metaMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Alert map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Alert(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rideId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ride_id'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      meta: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meta']),
    );
  }

  @override
  $AlertsTable createAlias(String alias) {
    return $AlertsTable(attachedDatabase, alias);
  }
}

class Alert extends DataClass implements Insertable<Alert> {
  final int id;
  final int rideId;
  final DateTime ts;
  final String type;
  final String? meta;
  const Alert(
      {required this.id,
      required this.rideId,
      required this.ts,
      required this.type,
      this.meta});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ride_id'] = Variable<int>(rideId);
    map['ts'] = Variable<DateTime>(ts);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || meta != null) {
      map['meta'] = Variable<String>(meta);
    }
    return map;
  }

  AlertsCompanion toCompanion(bool nullToAbsent) {
    return AlertsCompanion(
      id: Value(id),
      rideId: Value(rideId),
      ts: Value(ts),
      type: Value(type),
      meta: meta == null && nullToAbsent ? const Value.absent() : Value(meta),
    );
  }

  factory Alert.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Alert(
      id: serializer.fromJson<int>(json['id']),
      rideId: serializer.fromJson<int>(json['rideId']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      type: serializer.fromJson<String>(json['type']),
      meta: serializer.fromJson<String?>(json['meta']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rideId': serializer.toJson<int>(rideId),
      'ts': serializer.toJson<DateTime>(ts),
      'type': serializer.toJson<String>(type),
      'meta': serializer.toJson<String?>(meta),
    };
  }

  Alert copyWith(
          {int? id,
          int? rideId,
          DateTime? ts,
          String? type,
          Value<String?> meta = const Value.absent()}) =>
      Alert(
        id: id ?? this.id,
        rideId: rideId ?? this.rideId,
        ts: ts ?? this.ts,
        type: type ?? this.type,
        meta: meta.present ? meta.value : this.meta,
      );
  Alert copyWithCompanion(AlertsCompanion data) {
    return Alert(
      id: data.id.present ? data.id.value : this.id,
      rideId: data.rideId.present ? data.rideId.value : this.rideId,
      ts: data.ts.present ? data.ts.value : this.ts,
      type: data.type.present ? data.type.value : this.type,
      meta: data.meta.present ? data.meta.value : this.meta,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Alert(')
          ..write('id: $id, ')
          ..write('rideId: $rideId, ')
          ..write('ts: $ts, ')
          ..write('type: $type, ')
          ..write('meta: $meta')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, rideId, ts, type, meta);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alert &&
          other.id == this.id &&
          other.rideId == this.rideId &&
          other.ts == this.ts &&
          other.type == this.type &&
          other.meta == this.meta);
}

class AlertsCompanion extends UpdateCompanion<Alert> {
  final Value<int> id;
  final Value<int> rideId;
  final Value<DateTime> ts;
  final Value<String> type;
  final Value<String?> meta;
  const AlertsCompanion({
    this.id = const Value.absent(),
    this.rideId = const Value.absent(),
    this.ts = const Value.absent(),
    this.type = const Value.absent(),
    this.meta = const Value.absent(),
  });
  AlertsCompanion.insert({
    this.id = const Value.absent(),
    required int rideId,
    required DateTime ts,
    required String type,
    this.meta = const Value.absent(),
  })  : rideId = Value(rideId),
        ts = Value(ts),
        type = Value(type);
  static Insertable<Alert> custom({
    Expression<int>? id,
    Expression<int>? rideId,
    Expression<DateTime>? ts,
    Expression<String>? type,
    Expression<String>? meta,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rideId != null) 'ride_id': rideId,
      if (ts != null) 'ts': ts,
      if (type != null) 'type': type,
      if (meta != null) 'meta': meta,
    });
  }

  AlertsCompanion copyWith(
      {Value<int>? id,
      Value<int>? rideId,
      Value<DateTime>? ts,
      Value<String>? type,
      Value<String?>? meta}) {
    return AlertsCompanion(
      id: id ?? this.id,
      rideId: rideId ?? this.rideId,
      ts: ts ?? this.ts,
      type: type ?? this.type,
      meta: meta ?? this.meta,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rideId.present) {
      map['ride_id'] = Variable<int>(rideId.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (meta.present) {
      map['meta'] = Variable<String>(meta.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlertsCompanion(')
          ..write('id: $id, ')
          ..write('rideId: $rideId, ')
          ..write('ts: $ts, ')
          ..write('type: $type, ')
          ..write('meta: $meta')
          ..write(')'))
        .toString();
  }
}

class $RoutesTable extends Routes with TableInfo<$RoutesTable, Route> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _rideIdMeta = const VerificationMeta('rideId');
  @override
  late final GeneratedColumn<int> rideId = GeneratedColumn<int>(
      'ride_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _polylineMeta =
      const VerificationMeta('polyline');
  @override
  late final GeneratedColumn<String> polyline = GeneratedColumn<String>(
      'polyline', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, rideId, polyline];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routes';
  @override
  VerificationContext validateIntegrity(Insertable<Route> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ride_id')) {
      context.handle(_rideIdMeta,
          rideId.isAcceptableOrUnknown(data['ride_id']!, _rideIdMeta));
    } else if (isInserting) {
      context.missing(_rideIdMeta);
    }
    if (data.containsKey('polyline')) {
      context.handle(_polylineMeta,
          polyline.isAcceptableOrUnknown(data['polyline']!, _polylineMeta));
    } else if (isInserting) {
      context.missing(_polylineMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Route map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Route(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rideId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ride_id'])!,
      polyline: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}polyline'])!,
    );
  }

  @override
  $RoutesTable createAlias(String alias) {
    return $RoutesTable(attachedDatabase, alias);
  }
}

class Route extends DataClass implements Insertable<Route> {
  final int id;
  final int rideId;
  final String polyline;
  const Route({required this.id, required this.rideId, required this.polyline});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ride_id'] = Variable<int>(rideId);
    map['polyline'] = Variable<String>(polyline);
    return map;
  }

  RoutesCompanion toCompanion(bool nullToAbsent) {
    return RoutesCompanion(
      id: Value(id),
      rideId: Value(rideId),
      polyline: Value(polyline),
    );
  }

  factory Route.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Route(
      id: serializer.fromJson<int>(json['id']),
      rideId: serializer.fromJson<int>(json['rideId']),
      polyline: serializer.fromJson<String>(json['polyline']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rideId': serializer.toJson<int>(rideId),
      'polyline': serializer.toJson<String>(polyline),
    };
  }

  Route copyWith({int? id, int? rideId, String? polyline}) => Route(
        id: id ?? this.id,
        rideId: rideId ?? this.rideId,
        polyline: polyline ?? this.polyline,
      );
  Route copyWithCompanion(RoutesCompanion data) {
    return Route(
      id: data.id.present ? data.id.value : this.id,
      rideId: data.rideId.present ? data.rideId.value : this.rideId,
      polyline: data.polyline.present ? data.polyline.value : this.polyline,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Route(')
          ..write('id: $id, ')
          ..write('rideId: $rideId, ')
          ..write('polyline: $polyline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, rideId, polyline);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Route &&
          other.id == this.id &&
          other.rideId == this.rideId &&
          other.polyline == this.polyline);
}

class RoutesCompanion extends UpdateCompanion<Route> {
  final Value<int> id;
  final Value<int> rideId;
  final Value<String> polyline;
  const RoutesCompanion({
    this.id = const Value.absent(),
    this.rideId = const Value.absent(),
    this.polyline = const Value.absent(),
  });
  RoutesCompanion.insert({
    this.id = const Value.absent(),
    required int rideId,
    required String polyline,
  })  : rideId = Value(rideId),
        polyline = Value(polyline);
  static Insertable<Route> custom({
    Expression<int>? id,
    Expression<int>? rideId,
    Expression<String>? polyline,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rideId != null) 'ride_id': rideId,
      if (polyline != null) 'polyline': polyline,
    });
  }

  RoutesCompanion copyWith(
      {Value<int>? id, Value<int>? rideId, Value<String>? polyline}) {
    return RoutesCompanion(
      id: id ?? this.id,
      rideId: rideId ?? this.rideId,
      polyline: polyline ?? this.polyline,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rideId.present) {
      map['ride_id'] = Variable<int>(rideId.value);
    }
    if (polyline.present) {
      map['polyline'] = Variable<String>(polyline.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutesCompanion(')
          ..write('id: $id, ')
          ..write('rideId: $rideId, ')
          ..write('polyline: $polyline')
          ..write(')'))
        .toString();
  }
}

class $MileageTotalsTable extends MileageTotals
    with TableInfo<$MileageTotalsTable, MileageTotal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MileageTotalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _totalMilesMeta =
      const VerificationMeta('totalMiles');
  @override
  late final GeneratedColumn<double> totalMiles = GeneratedColumn<double>(
      'total_miles', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, totalMiles];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mileage_totals';
  @override
  VerificationContext validateIntegrity(Insertable<MileageTotal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('total_miles')) {
      context.handle(
          _totalMilesMeta,
          totalMiles.isAcceptableOrUnknown(
              data['total_miles']!, _totalMilesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MileageTotal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MileageTotal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      totalMiles: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_miles'])!,
    );
  }

  @override
  $MileageTotalsTable createAlias(String alias) {
    return $MileageTotalsTable(attachedDatabase, alias);
  }
}

class MileageTotal extends DataClass implements Insertable<MileageTotal> {
  final int id;
  final double totalMiles;
  const MileageTotal({required this.id, required this.totalMiles});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['total_miles'] = Variable<double>(totalMiles);
    return map;
  }

  MileageTotalsCompanion toCompanion(bool nullToAbsent) {
    return MileageTotalsCompanion(
      id: Value(id),
      totalMiles: Value(totalMiles),
    );
  }

  factory MileageTotal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MileageTotal(
      id: serializer.fromJson<int>(json['id']),
      totalMiles: serializer.fromJson<double>(json['totalMiles']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'totalMiles': serializer.toJson<double>(totalMiles),
    };
  }

  MileageTotal copyWith({int? id, double? totalMiles}) => MileageTotal(
        id: id ?? this.id,
        totalMiles: totalMiles ?? this.totalMiles,
      );
  MileageTotal copyWithCompanion(MileageTotalsCompanion data) {
    return MileageTotal(
      id: data.id.present ? data.id.value : this.id,
      totalMiles:
          data.totalMiles.present ? data.totalMiles.value : this.totalMiles,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MileageTotal(')
          ..write('id: $id, ')
          ..write('totalMiles: $totalMiles')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, totalMiles);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MileageTotal &&
          other.id == this.id &&
          other.totalMiles == this.totalMiles);
}

class MileageTotalsCompanion extends UpdateCompanion<MileageTotal> {
  final Value<int> id;
  final Value<double> totalMiles;
  const MileageTotalsCompanion({
    this.id = const Value.absent(),
    this.totalMiles = const Value.absent(),
  });
  MileageTotalsCompanion.insert({
    this.id = const Value.absent(),
    this.totalMiles = const Value.absent(),
  });
  static Insertable<MileageTotal> custom({
    Expression<int>? id,
    Expression<double>? totalMiles,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (totalMiles != null) 'total_miles': totalMiles,
    });
  }

  MileageTotalsCompanion copyWith({Value<int>? id, Value<double>? totalMiles}) {
    return MileageTotalsCompanion(
      id: id ?? this.id,
      totalMiles: totalMiles ?? this.totalMiles,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (totalMiles.present) {
      map['total_miles'] = Variable<double>(totalMiles.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MileageTotalsCompanion(')
          ..write('id: $id, ')
          ..write('totalMiles: $totalMiles')
          ..write(')'))
        .toString();
  }
}

class $FirmwareHistoryTable extends FirmwareHistory
    with TableInfo<$FirmwareHistoryTable, FirmwareHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FirmwareHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, version, ts];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'firmware_history';
  @override
  VerificationContext validateIntegrity(
      Insertable<FirmwareHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FirmwareHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FirmwareHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
    );
  }

  @override
  $FirmwareHistoryTable createAlias(String alias) {
    return $FirmwareHistoryTable(attachedDatabase, alias);
  }
}

class FirmwareHistoryData extends DataClass
    implements Insertable<FirmwareHistoryData> {
  final int id;
  final String version;
  final DateTime ts;
  const FirmwareHistoryData(
      {required this.id, required this.version, required this.ts});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['version'] = Variable<String>(version);
    map['ts'] = Variable<DateTime>(ts);
    return map;
  }

  FirmwareHistoryCompanion toCompanion(bool nullToAbsent) {
    return FirmwareHistoryCompanion(
      id: Value(id),
      version: Value(version),
      ts: Value(ts),
    );
  }

  factory FirmwareHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FirmwareHistoryData(
      id: serializer.fromJson<int>(json['id']),
      version: serializer.fromJson<String>(json['version']),
      ts: serializer.fromJson<DateTime>(json['ts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'version': serializer.toJson<String>(version),
      'ts': serializer.toJson<DateTime>(ts),
    };
  }

  FirmwareHistoryData copyWith({int? id, String? version, DateTime? ts}) =>
      FirmwareHistoryData(
        id: id ?? this.id,
        version: version ?? this.version,
        ts: ts ?? this.ts,
      );
  FirmwareHistoryData copyWithCompanion(FirmwareHistoryCompanion data) {
    return FirmwareHistoryData(
      id: data.id.present ? data.id.value : this.id,
      version: data.version.present ? data.version.value : this.version,
      ts: data.ts.present ? data.ts.value : this.ts,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FirmwareHistoryData(')
          ..write('id: $id, ')
          ..write('version: $version, ')
          ..write('ts: $ts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, version, ts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FirmwareHistoryData &&
          other.id == this.id &&
          other.version == this.version &&
          other.ts == this.ts);
}

class FirmwareHistoryCompanion extends UpdateCompanion<FirmwareHistoryData> {
  final Value<int> id;
  final Value<String> version;
  final Value<DateTime> ts;
  const FirmwareHistoryCompanion({
    this.id = const Value.absent(),
    this.version = const Value.absent(),
    this.ts = const Value.absent(),
  });
  FirmwareHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String version,
    required DateTime ts,
  })  : version = Value(version),
        ts = Value(ts);
  static Insertable<FirmwareHistoryData> custom({
    Expression<int>? id,
    Expression<String>? version,
    Expression<DateTime>? ts,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (version != null) 'version': version,
      if (ts != null) 'ts': ts,
    });
  }

  FirmwareHistoryCompanion copyWith(
      {Value<int>? id, Value<String>? version, Value<DateTime>? ts}) {
    return FirmwareHistoryCompanion(
      id: id ?? this.id,
      version: version ?? this.version,
      ts: ts ?? this.ts,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FirmwareHistoryCompanion(')
          ..write('id: $id, ')
          ..write('version: $version, ')
          ..write('ts: $ts')
          ..write(')'))
        .toString();
  }
}

class $BadgesTable extends Badges with TableInfo<$BadgesTable, Badge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BadgesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _earnedMeta = const VerificationMeta('earned');
  @override
  late final GeneratedColumn<bool> earned = GeneratedColumn<bool>(
      'earned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("earned" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _earnedTsMeta =
      const VerificationMeta('earnedTs');
  @override
  late final GeneratedColumn<DateTime> earnedTs = GeneratedColumn<DateTime>(
      'earned_ts', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, key, earned, earnedTs];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'badges';
  @override
  VerificationContext validateIntegrity(Insertable<Badge> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('earned')) {
      context.handle(_earnedMeta,
          earned.isAcceptableOrUnknown(data['earned']!, _earnedMeta));
    }
    if (data.containsKey('earned_ts')) {
      context.handle(_earnedTsMeta,
          earnedTs.isAcceptableOrUnknown(data['earned_ts']!, _earnedTsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Badge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Badge(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      earned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}earned'])!,
      earnedTs: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}earned_ts']),
    );
  }

  @override
  $BadgesTable createAlias(String alias) {
    return $BadgesTable(attachedDatabase, alias);
  }
}

class Badge extends DataClass implements Insertable<Badge> {
  final int id;
  final String key;
  final bool earned;
  final DateTime? earnedTs;
  const Badge(
      {required this.id,
      required this.key,
      required this.earned,
      this.earnedTs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['earned'] = Variable<bool>(earned);
    if (!nullToAbsent || earnedTs != null) {
      map['earned_ts'] = Variable<DateTime>(earnedTs);
    }
    return map;
  }

  BadgesCompanion toCompanion(bool nullToAbsent) {
    return BadgesCompanion(
      id: Value(id),
      key: Value(key),
      earned: Value(earned),
      earnedTs: earnedTs == null && nullToAbsent
          ? const Value.absent()
          : Value(earnedTs),
    );
  }

  factory Badge.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Badge(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      earned: serializer.fromJson<bool>(json['earned']),
      earnedTs: serializer.fromJson<DateTime?>(json['earnedTs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'earned': serializer.toJson<bool>(earned),
      'earnedTs': serializer.toJson<DateTime?>(earnedTs),
    };
  }

  Badge copyWith(
          {int? id,
          String? key,
          bool? earned,
          Value<DateTime?> earnedTs = const Value.absent()}) =>
      Badge(
        id: id ?? this.id,
        key: key ?? this.key,
        earned: earned ?? this.earned,
        earnedTs: earnedTs.present ? earnedTs.value : this.earnedTs,
      );
  Badge copyWithCompanion(BadgesCompanion data) {
    return Badge(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      earned: data.earned.present ? data.earned.value : this.earned,
      earnedTs: data.earnedTs.present ? data.earnedTs.value : this.earnedTs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Badge(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('earned: $earned, ')
          ..write('earnedTs: $earnedTs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, earned, earnedTs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Badge &&
          other.id == this.id &&
          other.key == this.key &&
          other.earned == this.earned &&
          other.earnedTs == this.earnedTs);
}

class BadgesCompanion extends UpdateCompanion<Badge> {
  final Value<int> id;
  final Value<String> key;
  final Value<bool> earned;
  final Value<DateTime?> earnedTs;
  const BadgesCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.earned = const Value.absent(),
    this.earnedTs = const Value.absent(),
  });
  BadgesCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    this.earned = const Value.absent(),
    this.earnedTs = const Value.absent(),
  }) : key = Value(key);
  static Insertable<Badge> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<bool>? earned,
    Expression<DateTime>? earnedTs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (earned != null) 'earned': earned,
      if (earnedTs != null) 'earned_ts': earnedTs,
    });
  }

  BadgesCompanion copyWith(
      {Value<int>? id,
      Value<String>? key,
      Value<bool>? earned,
      Value<DateTime?>? earnedTs}) {
    return BadgesCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      earned: earned ?? this.earned,
      earnedTs: earnedTs ?? this.earnedTs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (earned.present) {
      map['earned'] = Variable<bool>(earned.value);
    }
    if (earnedTs.present) {
      map['earned_ts'] = Variable<DateTime>(earnedTs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BadgesCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('earned: $earned, ')
          ..write('earnedTs: $earnedTs')
          ..write(')'))
        .toString();
  }
}

class $CloudMetaTable extends CloudMeta
    with TableInfo<$CloudMetaTable, CloudMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CloudMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_meta';
  @override
  VerificationContext validateIntegrity(Insertable<CloudMetaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  CloudMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudMetaData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value']),
    );
  }

  @override
  $CloudMetaTable createAlias(String alias) {
    return $CloudMetaTable(attachedDatabase, alias);
  }
}

class CloudMetaData extends DataClass implements Insertable<CloudMetaData> {
  final String key;
  final String? value;
  const CloudMetaData({required this.key, this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  CloudMetaCompanion toCompanion(bool nullToAbsent) {
    return CloudMetaCompanion(
      key: Value(key),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory CloudMetaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudMetaData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String?>(value),
    };
  }

  CloudMetaData copyWith(
          {String? key, Value<String?> value = const Value.absent()}) =>
      CloudMetaData(
        key: key ?? this.key,
        value: value.present ? value.value : this.value,
      );
  CloudMetaData copyWithCompanion(CloudMetaCompanion data) {
    return CloudMetaData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudMetaData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudMetaData &&
          other.key == this.key &&
          other.value == this.value);
}

class CloudMetaCompanion extends UpdateCompanion<CloudMetaData> {
  final Value<String> key;
  final Value<String?> value;
  final Value<int> rowid;
  const CloudMetaCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CloudMetaCompanion.insert({
    required String key,
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key);
  static Insertable<CloudMetaData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CloudMetaCompanion copyWith(
      {Value<String>? key, Value<String?>? value, Value<int>? rowid}) {
    return CloudMetaCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudMetaCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CommunityEventsTable extends CommunityEvents
    with TableInfo<$CommunityEventsTable, CommunityEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommunityEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startTsMeta =
      const VerificationMeta('startTs');
  @override
  late final GeneratedColumn<DateTime> startTs = GeneratedColumn<DateTime>(
      'start_ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTsMeta = const VerificationMeta('endTs');
  @override
  late final GeneratedColumn<DateTime> endTs = GeneratedColumn<DateTime>(
      'end_ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
      'location_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
      'lon', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByHashMeta =
      const VerificationMeta('createdByHash');
  @override
  late final GeneratedColumn<String> createdByHash = GeneratedColumn<String>(
      'created_by_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cloudStatusMeta =
      const VerificationMeta('cloudStatus');
  @override
  late final GeneratedColumn<String> cloudStatus = GeneratedColumn<String>(
      'cloud_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        startTs,
        endTs,
        locationName,
        lat,
        lon,
        description,
        createdByHash,
        cloudStatus,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'community_events';
  @override
  VerificationContext validateIntegrity(Insertable<CommunityEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start_ts')) {
      context.handle(_startTsMeta,
          startTs.isAcceptableOrUnknown(data['start_ts']!, _startTsMeta));
    } else if (isInserting) {
      context.missing(_startTsMeta);
    }
    if (data.containsKey('end_ts')) {
      context.handle(
          _endTsMeta, endTs.isAcceptableOrUnknown(data['end_ts']!, _endTsMeta));
    } else if (isInserting) {
      context.missing(_endTsMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    }
    if (data.containsKey('lon')) {
      context.handle(
          _lonMeta, lon.isAcceptableOrUnknown(data['lon']!, _lonMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_by_hash')) {
      context.handle(
          _createdByHashMeta,
          createdByHash.isAcceptableOrUnknown(
              data['created_by_hash']!, _createdByHashMeta));
    } else if (isInserting) {
      context.missing(_createdByHashMeta);
    }
    if (data.containsKey('cloud_status')) {
      context.handle(
          _cloudStatusMeta,
          cloudStatus.isAcceptableOrUnknown(
              data['cloud_status']!, _cloudStatusMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommunityEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommunityEvent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      startTs: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_ts'])!,
      endTs: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_ts'])!,
      locationName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_name']),
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat']),
      lon: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lon']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdByHash: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_hash'])!,
      cloudStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cloud_status'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CommunityEventsTable createAlias(String alias) {
    return $CommunityEventsTable(attachedDatabase, alias);
  }
}

class CommunityEvent extends DataClass implements Insertable<CommunityEvent> {
  final String id;
  final String title;
  final DateTime startTs;
  final DateTime endTs;
  final String? locationName;
  final double? lat;
  final double? lon;
  final String? description;
  final String createdByHash;
  final String cloudStatus;
  final DateTime updatedAt;
  const CommunityEvent(
      {required this.id,
      required this.title,
      required this.startTs,
      required this.endTs,
      this.locationName,
      this.lat,
      this.lon,
      this.description,
      required this.createdByHash,
      required this.cloudStatus,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['start_ts'] = Variable<DateTime>(startTs);
    map['end_ts'] = Variable<DateTime>(endTs);
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lon != null) {
      map['lon'] = Variable<double>(lon);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_by_hash'] = Variable<String>(createdByHash);
    map['cloud_status'] = Variable<String>(cloudStatus);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CommunityEventsCompanion toCompanion(bool nullToAbsent) {
    return CommunityEventsCompanion(
      id: Value(id),
      title: Value(title),
      startTs: Value(startTs),
      endTs: Value(endTs),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lon: lon == null && nullToAbsent ? const Value.absent() : Value(lon),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdByHash: Value(createdByHash),
      cloudStatus: Value(cloudStatus),
      updatedAt: Value(updatedAt),
    );
  }

  factory CommunityEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommunityEvent(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      startTs: serializer.fromJson<DateTime>(json['startTs']),
      endTs: serializer.fromJson<DateTime>(json['endTs']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      lat: serializer.fromJson<double?>(json['lat']),
      lon: serializer.fromJson<double?>(json['lon']),
      description: serializer.fromJson<String?>(json['description']),
      createdByHash: serializer.fromJson<String>(json['createdByHash']),
      cloudStatus: serializer.fromJson<String>(json['cloudStatus']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'startTs': serializer.toJson<DateTime>(startTs),
      'endTs': serializer.toJson<DateTime>(endTs),
      'locationName': serializer.toJson<String?>(locationName),
      'lat': serializer.toJson<double?>(lat),
      'lon': serializer.toJson<double?>(lon),
      'description': serializer.toJson<String?>(description),
      'createdByHash': serializer.toJson<String>(createdByHash),
      'cloudStatus': serializer.toJson<String>(cloudStatus),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CommunityEvent copyWith(
          {String? id,
          String? title,
          DateTime? startTs,
          DateTime? endTs,
          Value<String?> locationName = const Value.absent(),
          Value<double?> lat = const Value.absent(),
          Value<double?> lon = const Value.absent(),
          Value<String?> description = const Value.absent(),
          String? createdByHash,
          String? cloudStatus,
          DateTime? updatedAt}) =>
      CommunityEvent(
        id: id ?? this.id,
        title: title ?? this.title,
        startTs: startTs ?? this.startTs,
        endTs: endTs ?? this.endTs,
        locationName:
            locationName.present ? locationName.value : this.locationName,
        lat: lat.present ? lat.value : this.lat,
        lon: lon.present ? lon.value : this.lon,
        description: description.present ? description.value : this.description,
        createdByHash: createdByHash ?? this.createdByHash,
        cloudStatus: cloudStatus ?? this.cloudStatus,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CommunityEvent copyWithCompanion(CommunityEventsCompanion data) {
    return CommunityEvent(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      startTs: data.startTs.present ? data.startTs.value : this.startTs,
      endTs: data.endTs.present ? data.endTs.value : this.endTs,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      description:
          data.description.present ? data.description.value : this.description,
      createdByHash: data.createdByHash.present
          ? data.createdByHash.value
          : this.createdByHash,
      cloudStatus:
          data.cloudStatus.present ? data.cloudStatus.value : this.cloudStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommunityEvent(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startTs: $startTs, ')
          ..write('endTs: $endTs, ')
          ..write('locationName: $locationName, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('description: $description, ')
          ..write('createdByHash: $createdByHash, ')
          ..write('cloudStatus: $cloudStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, startTs, endTs, locationName, lat,
      lon, description, createdByHash, cloudStatus, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommunityEvent &&
          other.id == this.id &&
          other.title == this.title &&
          other.startTs == this.startTs &&
          other.endTs == this.endTs &&
          other.locationName == this.locationName &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.description == this.description &&
          other.createdByHash == this.createdByHash &&
          other.cloudStatus == this.cloudStatus &&
          other.updatedAt == this.updatedAt);
}

class CommunityEventsCompanion extends UpdateCompanion<CommunityEvent> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> startTs;
  final Value<DateTime> endTs;
  final Value<String?> locationName;
  final Value<double?> lat;
  final Value<double?> lon;
  final Value<String?> description;
  final Value<String> createdByHash;
  final Value<String> cloudStatus;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CommunityEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.startTs = const Value.absent(),
    this.endTs = const Value.absent(),
    this.locationName = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.description = const Value.absent(),
    this.createdByHash = const Value.absent(),
    this.cloudStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CommunityEventsCompanion.insert({
    required String id,
    required String title,
    required DateTime startTs,
    required DateTime endTs,
    this.locationName = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.description = const Value.absent(),
    required String createdByHash,
    this.cloudStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        startTs = Value(startTs),
        endTs = Value(endTs),
        createdByHash = Value(createdByHash);
  static Insertable<CommunityEvent> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? startTs,
    Expression<DateTime>? endTs,
    Expression<String>? locationName,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<String>? description,
    Expression<String>? createdByHash,
    Expression<String>? cloudStatus,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (startTs != null) 'start_ts': startTs,
      if (endTs != null) 'end_ts': endTs,
      if (locationName != null) 'location_name': locationName,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (description != null) 'description': description,
      if (createdByHash != null) 'created_by_hash': createdByHash,
      if (cloudStatus != null) 'cloud_status': cloudStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CommunityEventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<DateTime>? startTs,
      Value<DateTime>? endTs,
      Value<String?>? locationName,
      Value<double?>? lat,
      Value<double?>? lon,
      Value<String?>? description,
      Value<String>? createdByHash,
      Value<String>? cloudStatus,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CommunityEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      startTs: startTs ?? this.startTs,
      endTs: endTs ?? this.endTs,
      locationName: locationName ?? this.locationName,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      description: description ?? this.description,
      createdByHash: createdByHash ?? this.createdByHash,
      cloudStatus: cloudStatus ?? this.cloudStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startTs.present) {
      map['start_ts'] = Variable<DateTime>(startTs.value);
    }
    if (endTs.present) {
      map['end_ts'] = Variable<DateTime>(endTs.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdByHash.present) {
      map['created_by_hash'] = Variable<String>(createdByHash.value);
    }
    if (cloudStatus.present) {
      map['cloud_status'] = Variable<String>(cloudStatus.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommunityEventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startTs: $startTs, ')
          ..write('endTs: $endTs, ')
          ..write('locationName: $locationName, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('description: $description, ')
          ..write('createdByHash: $createdByHash, ')
          ..write('cloudStatus: $cloudStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HazardsTable extends Hazards with TableInfo<$HazardsTable, Hazard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HazardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
      'lon', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumn<int> severity = GeneratedColumn<int>(
      'severity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByHashMeta =
      const VerificationMeta('createdByHash');
  @override
  late final GeneratedColumn<String> createdByHash = GeneratedColumn<String>(
      'created_by_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cloudStatusMeta =
      const VerificationMeta('cloudStatus');
  @override
  late final GeneratedColumn<String> cloudStatus = GeneratedColumn<String>(
      'cloud_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        ts,
        lat,
        lon,
        severity,
        note,
        createdByHash,
        cloudStatus,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hazards';
  @override
  VerificationContext validateIntegrity(Insertable<Hazard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
          _lonMeta, lon.isAcceptableOrUnknown(data['lon']!, _lonMeta));
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(_severityMeta,
          severity.isAcceptableOrUnknown(data['severity']!, _severityMeta));
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_by_hash')) {
      context.handle(
          _createdByHashMeta,
          createdByHash.isAcceptableOrUnknown(
              data['created_by_hash']!, _createdByHashMeta));
    } else if (isInserting) {
      context.missing(_createdByHashMeta);
    }
    if (data.containsKey('cloud_status')) {
      context.handle(
          _cloudStatusMeta,
          cloudStatus.isAcceptableOrUnknown(
              data['cloud_status']!, _cloudStatusMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Hazard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Hazard(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lon: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lon'])!,
      severity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}severity'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdByHash: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_hash'])!,
      cloudStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cloud_status'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $HazardsTable createAlias(String alias) {
    return $HazardsTable(attachedDatabase, alias);
  }
}

class Hazard extends DataClass implements Insertable<Hazard> {
  final String id;
  final String type;
  final DateTime ts;
  final double lat;
  final double lon;
  final int severity;
  final String? note;
  final String createdByHash;
  final String cloudStatus;
  final DateTime updatedAt;
  const Hazard(
      {required this.id,
      required this.type,
      required this.ts,
      required this.lat,
      required this.lon,
      required this.severity,
      this.note,
      required this.createdByHash,
      required this.cloudStatus,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['ts'] = Variable<DateTime>(ts);
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    map['severity'] = Variable<int>(severity);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_by_hash'] = Variable<String>(createdByHash);
    map['cloud_status'] = Variable<String>(cloudStatus);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  HazardsCompanion toCompanion(bool nullToAbsent) {
    return HazardsCompanion(
      id: Value(id),
      type: Value(type),
      ts: Value(ts),
      lat: Value(lat),
      lon: Value(lon),
      severity: Value(severity),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdByHash: Value(createdByHash),
      cloudStatus: Value(cloudStatus),
      updatedAt: Value(updatedAt),
    );
  }

  factory Hazard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hazard(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
      severity: serializer.fromJson<int>(json['severity']),
      note: serializer.fromJson<String?>(json['note']),
      createdByHash: serializer.fromJson<String>(json['createdByHash']),
      cloudStatus: serializer.fromJson<String>(json['cloudStatus']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'ts': serializer.toJson<DateTime>(ts),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'severity': serializer.toJson<int>(severity),
      'note': serializer.toJson<String?>(note),
      'createdByHash': serializer.toJson<String>(createdByHash),
      'cloudStatus': serializer.toJson<String>(cloudStatus),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Hazard copyWith(
          {String? id,
          String? type,
          DateTime? ts,
          double? lat,
          double? lon,
          int? severity,
          Value<String?> note = const Value.absent(),
          String? createdByHash,
          String? cloudStatus,
          DateTime? updatedAt}) =>
      Hazard(
        id: id ?? this.id,
        type: type ?? this.type,
        ts: ts ?? this.ts,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        severity: severity ?? this.severity,
        note: note.present ? note.value : this.note,
        createdByHash: createdByHash ?? this.createdByHash,
        cloudStatus: cloudStatus ?? this.cloudStatus,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Hazard copyWithCompanion(HazardsCompanion data) {
    return Hazard(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      ts: data.ts.present ? data.ts.value : this.ts,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      severity: data.severity.present ? data.severity.value : this.severity,
      note: data.note.present ? data.note.value : this.note,
      createdByHash: data.createdByHash.present
          ? data.createdByHash.value
          : this.createdByHash,
      cloudStatus:
          data.cloudStatus.present ? data.cloudStatus.value : this.cloudStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Hazard(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('ts: $ts, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('severity: $severity, ')
          ..write('note: $note, ')
          ..write('createdByHash: $createdByHash, ')
          ..write('cloudStatus: $cloudStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, ts, lat, lon, severity, note,
      createdByHash, cloudStatus, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hazard &&
          other.id == this.id &&
          other.type == this.type &&
          other.ts == this.ts &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.severity == this.severity &&
          other.note == this.note &&
          other.createdByHash == this.createdByHash &&
          other.cloudStatus == this.cloudStatus &&
          other.updatedAt == this.updatedAt);
}

class HazardsCompanion extends UpdateCompanion<Hazard> {
  final Value<String> id;
  final Value<String> type;
  final Value<DateTime> ts;
  final Value<double> lat;
  final Value<double> lon;
  final Value<int> severity;
  final Value<String?> note;
  final Value<String> createdByHash;
  final Value<String> cloudStatus;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const HazardsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.ts = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.severity = const Value.absent(),
    this.note = const Value.absent(),
    this.createdByHash = const Value.absent(),
    this.cloudStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HazardsCompanion.insert({
    required String id,
    required String type,
    required DateTime ts,
    required double lat,
    required double lon,
    required int severity,
    this.note = const Value.absent(),
    required String createdByHash,
    this.cloudStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        ts = Value(ts),
        lat = Value(lat),
        lon = Value(lon),
        severity = Value(severity),
        createdByHash = Value(createdByHash);
  static Insertable<Hazard> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<DateTime>? ts,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<int>? severity,
    Expression<String>? note,
    Expression<String>? createdByHash,
    Expression<String>? cloudStatus,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (ts != null) 'ts': ts,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (severity != null) 'severity': severity,
      if (note != null) 'note': note,
      if (createdByHash != null) 'created_by_hash': createdByHash,
      if (cloudStatus != null) 'cloud_status': cloudStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HazardsCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<DateTime>? ts,
      Value<double>? lat,
      Value<double>? lon,
      Value<int>? severity,
      Value<String?>? note,
      Value<String>? createdByHash,
      Value<String>? cloudStatus,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return HazardsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      ts: ts ?? this.ts,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      severity: severity ?? this.severity,
      note: note ?? this.note,
      createdByHash: createdByHash ?? this.createdByHash,
      cloudStatus: cloudStatus ?? this.cloudStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (severity.present) {
      map['severity'] = Variable<int>(severity.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdByHash.present) {
      map['created_by_hash'] = Variable<String>(createdByHash.value);
    }
    if (cloudStatus.present) {
      map['cloud_status'] = Variable<String>(cloudStatus.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HazardsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('ts: $ts, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('severity: $severity, ')
          ..write('note: $note, ')
          ..write('createdByHash: $createdByHash, ')
          ..write('cloudStatus: $cloudStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FaultsTable extends Faults with TableInfo<$FaultsTable, Fault> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FaultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, ts, code, message];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'faults';
  @override
  VerificationContext validateIntegrity(Insertable<Fault> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Fault map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Fault(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
    );
  }

  @override
  $FaultsTable createAlias(String alias) {
    return $FaultsTable(attachedDatabase, alias);
  }
}

class Fault extends DataClass implements Insertable<Fault> {
  final int id;
  final DateTime ts;
  final String code;
  final String message;
  const Fault(
      {required this.id,
      required this.ts,
      required this.code,
      required this.message});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ts'] = Variable<DateTime>(ts);
    map['code'] = Variable<String>(code);
    map['message'] = Variable<String>(message);
    return map;
  }

  FaultsCompanion toCompanion(bool nullToAbsent) {
    return FaultsCompanion(
      id: Value(id),
      ts: Value(ts),
      code: Value(code),
      message: Value(message),
    );
  }

  factory Fault.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Fault(
      id: serializer.fromJson<int>(json['id']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      code: serializer.fromJson<String>(json['code']),
      message: serializer.fromJson<String>(json['message']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ts': serializer.toJson<DateTime>(ts),
      'code': serializer.toJson<String>(code),
      'message': serializer.toJson<String>(message),
    };
  }

  Fault copyWith({int? id, DateTime? ts, String? code, String? message}) =>
      Fault(
        id: id ?? this.id,
        ts: ts ?? this.ts,
        code: code ?? this.code,
        message: message ?? this.message,
      );
  Fault copyWithCompanion(FaultsCompanion data) {
    return Fault(
      id: data.id.present ? data.id.value : this.id,
      ts: data.ts.present ? data.ts.value : this.ts,
      code: data.code.present ? data.code.value : this.code,
      message: data.message.present ? data.message.value : this.message,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Fault(')
          ..write('id: $id, ')
          ..write('ts: $ts, ')
          ..write('code: $code, ')
          ..write('message: $message')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ts, code, message);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fault &&
          other.id == this.id &&
          other.ts == this.ts &&
          other.code == this.code &&
          other.message == this.message);
}

class FaultsCompanion extends UpdateCompanion<Fault> {
  final Value<int> id;
  final Value<DateTime> ts;
  final Value<String> code;
  final Value<String> message;
  const FaultsCompanion({
    this.id = const Value.absent(),
    this.ts = const Value.absent(),
    this.code = const Value.absent(),
    this.message = const Value.absent(),
  });
  FaultsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime ts,
    required String code,
    required String message,
  })  : ts = Value(ts),
        code = Value(code),
        message = Value(message);
  static Insertable<Fault> custom({
    Expression<int>? id,
    Expression<DateTime>? ts,
    Expression<String>? code,
    Expression<String>? message,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ts != null) 'ts': ts,
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    });
  }

  FaultsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? ts,
      Value<String>? code,
      Value<String>? message}) {
    return FaultsCompanion(
      id: id ?? this.id,
      ts: ts ?? this.ts,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FaultsCompanion(')
          ..write('id: $id, ')
          ..write('ts: $ts, ')
          ..write('code: $code, ')
          ..write('message: $message')
          ..write(')'))
        .toString();
  }
}

class $PackMetricsTable extends PackMetrics
    with TableInfo<$PackMetricsTable, PackMetric> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PackMetricsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sohMeta = const VerificationMeta('soh');
  @override
  late final GeneratedColumn<double> soh = GeneratedColumn<double>(
      'soh', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _sagIndexMeta =
      const VerificationMeta('sagIndex');
  @override
  late final GeneratedColumn<double> sagIndex = GeneratedColumn<double>(
      'sag_index', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, ts, soh, sagIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pack_metrics';
  @override
  VerificationContext validateIntegrity(Insertable<PackMetric> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('soh')) {
      context.handle(
          _sohMeta, soh.isAcceptableOrUnknown(data['soh']!, _sohMeta));
    } else if (isInserting) {
      context.missing(_sohMeta);
    }
    if (data.containsKey('sag_index')) {
      context.handle(_sagIndexMeta,
          sagIndex.isAcceptableOrUnknown(data['sag_index']!, _sagIndexMeta));
    } else if (isInserting) {
      context.missing(_sagIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PackMetric map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PackMetric(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      soh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}soh'])!,
      sagIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sag_index'])!,
    );
  }

  @override
  $PackMetricsTable createAlias(String alias) {
    return $PackMetricsTable(attachedDatabase, alias);
  }
}

class PackMetric extends DataClass implements Insertable<PackMetric> {
  final int id;
  final DateTime ts;
  final double soh;
  final double sagIndex;
  const PackMetric(
      {required this.id,
      required this.ts,
      required this.soh,
      required this.sagIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ts'] = Variable<DateTime>(ts);
    map['soh'] = Variable<double>(soh);
    map['sag_index'] = Variable<double>(sagIndex);
    return map;
  }

  PackMetricsCompanion toCompanion(bool nullToAbsent) {
    return PackMetricsCompanion(
      id: Value(id),
      ts: Value(ts),
      soh: Value(soh),
      sagIndex: Value(sagIndex),
    );
  }

  factory PackMetric.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PackMetric(
      id: serializer.fromJson<int>(json['id']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      soh: serializer.fromJson<double>(json['soh']),
      sagIndex: serializer.fromJson<double>(json['sagIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ts': serializer.toJson<DateTime>(ts),
      'soh': serializer.toJson<double>(soh),
      'sagIndex': serializer.toJson<double>(sagIndex),
    };
  }

  PackMetric copyWith({int? id, DateTime? ts, double? soh, double? sagIndex}) =>
      PackMetric(
        id: id ?? this.id,
        ts: ts ?? this.ts,
        soh: soh ?? this.soh,
        sagIndex: sagIndex ?? this.sagIndex,
      );
  PackMetric copyWithCompanion(PackMetricsCompanion data) {
    return PackMetric(
      id: data.id.present ? data.id.value : this.id,
      ts: data.ts.present ? data.ts.value : this.ts,
      soh: data.soh.present ? data.soh.value : this.soh,
      sagIndex: data.sagIndex.present ? data.sagIndex.value : this.sagIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PackMetric(')
          ..write('id: $id, ')
          ..write('ts: $ts, ')
          ..write('soh: $soh, ')
          ..write('sagIndex: $sagIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ts, soh, sagIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PackMetric &&
          other.id == this.id &&
          other.ts == this.ts &&
          other.soh == this.soh &&
          other.sagIndex == this.sagIndex);
}

class PackMetricsCompanion extends UpdateCompanion<PackMetric> {
  final Value<int> id;
  final Value<DateTime> ts;
  final Value<double> soh;
  final Value<double> sagIndex;
  const PackMetricsCompanion({
    this.id = const Value.absent(),
    this.ts = const Value.absent(),
    this.soh = const Value.absent(),
    this.sagIndex = const Value.absent(),
  });
  PackMetricsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime ts,
    required double soh,
    required double sagIndex,
  })  : ts = Value(ts),
        soh = Value(soh),
        sagIndex = Value(sagIndex);
  static Insertable<PackMetric> custom({
    Expression<int>? id,
    Expression<DateTime>? ts,
    Expression<double>? soh,
    Expression<double>? sagIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ts != null) 'ts': ts,
      if (soh != null) 'soh': soh,
      if (sagIndex != null) 'sag_index': sagIndex,
    });
  }

  PackMetricsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? ts,
      Value<double>? soh,
      Value<double>? sagIndex}) {
    return PackMetricsCompanion(
      id: id ?? this.id,
      ts: ts ?? this.ts,
      soh: soh ?? this.soh,
      sagIndex: sagIndex ?? this.sagIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (soh.present) {
      map['soh'] = Variable<double>(soh.value);
    }
    if (sagIndex.present) {
      map['sag_index'] = Variable<double>(sagIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PackMetricsCompanion(')
          ..write('id: $id, ')
          ..write('ts: $ts, ')
          ..write('soh: $soh, ')
          ..write('sagIndex: $sagIndex')
          ..write(')'))
        .toString();
  }
}

class $EscMetricsTable extends EscMetrics
    with TableInfo<$EscMetricsTable, EscMetric> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EscMetricsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _tempCMeta = const VerificationMeta('tempC');
  @override
  late final GeneratedColumn<double> tempC = GeneratedColumn<double>(
      'temp_c', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _etaMinMeta = const VerificationMeta('etaMin');
  @override
  late final GeneratedColumn<double> etaMin = GeneratedColumn<double>(
      'eta_min', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, ts, tempC, etaMin];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'esc_metrics';
  @override
  VerificationContext validateIntegrity(Insertable<EscMetric> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('temp_c')) {
      context.handle(
          _tempCMeta, tempC.isAcceptableOrUnknown(data['temp_c']!, _tempCMeta));
    } else if (isInserting) {
      context.missing(_tempCMeta);
    }
    if (data.containsKey('eta_min')) {
      context.handle(_etaMinMeta,
          etaMin.isAcceptableOrUnknown(data['eta_min']!, _etaMinMeta));
    } else if (isInserting) {
      context.missing(_etaMinMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EscMetric map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EscMetric(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      tempC: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}temp_c'])!,
      etaMin: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eta_min'])!,
    );
  }

  @override
  $EscMetricsTable createAlias(String alias) {
    return $EscMetricsTable(attachedDatabase, alias);
  }
}

class EscMetric extends DataClass implements Insertable<EscMetric> {
  final int id;
  final DateTime ts;
  final double tempC;
  final double etaMin;
  const EscMetric(
      {required this.id,
      required this.ts,
      required this.tempC,
      required this.etaMin});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ts'] = Variable<DateTime>(ts);
    map['temp_c'] = Variable<double>(tempC);
    map['eta_min'] = Variable<double>(etaMin);
    return map;
  }

  EscMetricsCompanion toCompanion(bool nullToAbsent) {
    return EscMetricsCompanion(
      id: Value(id),
      ts: Value(ts),
      tempC: Value(tempC),
      etaMin: Value(etaMin),
    );
  }

  factory EscMetric.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EscMetric(
      id: serializer.fromJson<int>(json['id']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      tempC: serializer.fromJson<double>(json['tempC']),
      etaMin: serializer.fromJson<double>(json['etaMin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ts': serializer.toJson<DateTime>(ts),
      'tempC': serializer.toJson<double>(tempC),
      'etaMin': serializer.toJson<double>(etaMin),
    };
  }

  EscMetric copyWith({int? id, DateTime? ts, double? tempC, double? etaMin}) =>
      EscMetric(
        id: id ?? this.id,
        ts: ts ?? this.ts,
        tempC: tempC ?? this.tempC,
        etaMin: etaMin ?? this.etaMin,
      );
  EscMetric copyWithCompanion(EscMetricsCompanion data) {
    return EscMetric(
      id: data.id.present ? data.id.value : this.id,
      ts: data.ts.present ? data.ts.value : this.ts,
      tempC: data.tempC.present ? data.tempC.value : this.tempC,
      etaMin: data.etaMin.present ? data.etaMin.value : this.etaMin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EscMetric(')
          ..write('id: $id, ')
          ..write('ts: $ts, ')
          ..write('tempC: $tempC, ')
          ..write('etaMin: $etaMin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ts, tempC, etaMin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EscMetric &&
          other.id == this.id &&
          other.ts == this.ts &&
          other.tempC == this.tempC &&
          other.etaMin == this.etaMin);
}

class EscMetricsCompanion extends UpdateCompanion<EscMetric> {
  final Value<int> id;
  final Value<DateTime> ts;
  final Value<double> tempC;
  final Value<double> etaMin;
  const EscMetricsCompanion({
    this.id = const Value.absent(),
    this.ts = const Value.absent(),
    this.tempC = const Value.absent(),
    this.etaMin = const Value.absent(),
  });
  EscMetricsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime ts,
    required double tempC,
    required double etaMin,
  })  : ts = Value(ts),
        tempC = Value(tempC),
        etaMin = Value(etaMin);
  static Insertable<EscMetric> custom({
    Expression<int>? id,
    Expression<DateTime>? ts,
    Expression<double>? tempC,
    Expression<double>? etaMin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ts != null) 'ts': ts,
      if (tempC != null) 'temp_c': tempC,
      if (etaMin != null) 'eta_min': etaMin,
    });
  }

  EscMetricsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? ts,
      Value<double>? tempC,
      Value<double>? etaMin}) {
    return EscMetricsCompanion(
      id: id ?? this.id,
      ts: ts ?? this.ts,
      tempC: tempC ?? this.tempC,
      etaMin: etaMin ?? this.etaMin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (tempC.present) {
      map['temp_c'] = Variable<double>(tempC.value);
    }
    if (etaMin.present) {
      map['eta_min'] = Variable<double>(etaMin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EscMetricsCompanion(')
          ..write('id: $id, ')
          ..write('ts: $ts, ')
          ..write('tempC: $tempC, ')
          ..write('etaMin: $etaMin')
          ..write(')'))
        .toString();
  }
}

class $CrowdSightingsTable extends CrowdSightings
    with TableInfo<$CrowdSightingsTable, CrowdSighting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CrowdSightingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _boardHashMeta =
      const VerificationMeta('boardHash');
  @override
  late final GeneratedColumn<String> boardHash = GeneratedColumn<String>(
      'board_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
      'lon', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, boardHash, lat, lon, ts];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crowd_sightings';
  @override
  VerificationContext validateIntegrity(Insertable<CrowdSighting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('board_hash')) {
      context.handle(_boardHashMeta,
          boardHash.isAcceptableOrUnknown(data['board_hash']!, _boardHashMeta));
    } else if (isInserting) {
      context.missing(_boardHashMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
          _lonMeta, lon.isAcceptableOrUnknown(data['lon']!, _lonMeta));
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CrowdSighting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CrowdSighting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      boardHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_hash'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lon: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lon'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
    );
  }

  @override
  $CrowdSightingsTable createAlias(String alias) {
    return $CrowdSightingsTable(attachedDatabase, alias);
  }
}

class CrowdSighting extends DataClass implements Insertable<CrowdSighting> {
  final int id;
  final String boardHash;
  final double lat;
  final double lon;
  final DateTime ts;
  const CrowdSighting(
      {required this.id,
      required this.boardHash,
      required this.lat,
      required this.lon,
      required this.ts});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['board_hash'] = Variable<String>(boardHash);
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    map['ts'] = Variable<DateTime>(ts);
    return map;
  }

  CrowdSightingsCompanion toCompanion(bool nullToAbsent) {
    return CrowdSightingsCompanion(
      id: Value(id),
      boardHash: Value(boardHash),
      lat: Value(lat),
      lon: Value(lon),
      ts: Value(ts),
    );
  }

  factory CrowdSighting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CrowdSighting(
      id: serializer.fromJson<int>(json['id']),
      boardHash: serializer.fromJson<String>(json['boardHash']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
      ts: serializer.fromJson<DateTime>(json['ts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'boardHash': serializer.toJson<String>(boardHash),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'ts': serializer.toJson<DateTime>(ts),
    };
  }

  CrowdSighting copyWith(
          {int? id,
          String? boardHash,
          double? lat,
          double? lon,
          DateTime? ts}) =>
      CrowdSighting(
        id: id ?? this.id,
        boardHash: boardHash ?? this.boardHash,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        ts: ts ?? this.ts,
      );
  CrowdSighting copyWithCompanion(CrowdSightingsCompanion data) {
    return CrowdSighting(
      id: data.id.present ? data.id.value : this.id,
      boardHash: data.boardHash.present ? data.boardHash.value : this.boardHash,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      ts: data.ts.present ? data.ts.value : this.ts,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CrowdSighting(')
          ..write('id: $id, ')
          ..write('boardHash: $boardHash, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('ts: $ts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, boardHash, lat, lon, ts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CrowdSighting &&
          other.id == this.id &&
          other.boardHash == this.boardHash &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.ts == this.ts);
}

class CrowdSightingsCompanion extends UpdateCompanion<CrowdSighting> {
  final Value<int> id;
  final Value<String> boardHash;
  final Value<double> lat;
  final Value<double> lon;
  final Value<DateTime> ts;
  const CrowdSightingsCompanion({
    this.id = const Value.absent(),
    this.boardHash = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.ts = const Value.absent(),
  });
  CrowdSightingsCompanion.insert({
    this.id = const Value.absent(),
    required String boardHash,
    required double lat,
    required double lon,
    required DateTime ts,
  })  : boardHash = Value(boardHash),
        lat = Value(lat),
        lon = Value(lon),
        ts = Value(ts);
  static Insertable<CrowdSighting> custom({
    Expression<int>? id,
    Expression<String>? boardHash,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<DateTime>? ts,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (boardHash != null) 'board_hash': boardHash,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (ts != null) 'ts': ts,
    });
  }

  CrowdSightingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? boardHash,
      Value<double>? lat,
      Value<double>? lon,
      Value<DateTime>? ts}) {
    return CrowdSightingsCompanion(
      id: id ?? this.id,
      boardHash: boardHash ?? this.boardHash,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      ts: ts ?? this.ts,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (boardHash.present) {
      map['board_hash'] = Variable<String>(boardHash.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CrowdSightingsCompanion(')
          ..write('id: $id, ')
          ..write('boardHash: $boardHash, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('ts: $ts')
          ..write(')'))
        .toString();
  }
}

class $OwnershipTable extends Ownership
    with TableInfo<$OwnershipTable, OwnershipData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OwnershipTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _boardHashMeta =
      const VerificationMeta('boardHash');
  @override
  late final GeneratedColumn<String> boardHash = GeneratedColumn<String>(
      'board_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerKeyMeta =
      const VerificationMeta('ownerKey');
  @override
  late final GeneratedColumn<String> ownerKey = GeneratedColumn<String>(
      'owner_key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, boardHash, ownerKey, ts];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ownership';
  @override
  VerificationContext validateIntegrity(Insertable<OwnershipData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('board_hash')) {
      context.handle(_boardHashMeta,
          boardHash.isAcceptableOrUnknown(data['board_hash']!, _boardHashMeta));
    } else if (isInserting) {
      context.missing(_boardHashMeta);
    }
    if (data.containsKey('owner_key')) {
      context.handle(_ownerKeyMeta,
          ownerKey.isAcceptableOrUnknown(data['owner_key']!, _ownerKeyMeta));
    } else if (isInserting) {
      context.missing(_ownerKeyMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OwnershipData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OwnershipData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      boardHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_hash'])!,
      ownerKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_key'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
    );
  }

  @override
  $OwnershipTable createAlias(String alias) {
    return $OwnershipTable(attachedDatabase, alias);
  }
}

class OwnershipData extends DataClass implements Insertable<OwnershipData> {
  final int id;
  final String boardHash;
  final String ownerKey;
  final DateTime ts;
  const OwnershipData(
      {required this.id,
      required this.boardHash,
      required this.ownerKey,
      required this.ts});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['board_hash'] = Variable<String>(boardHash);
    map['owner_key'] = Variable<String>(ownerKey);
    map['ts'] = Variable<DateTime>(ts);
    return map;
  }

  OwnershipCompanion toCompanion(bool nullToAbsent) {
    return OwnershipCompanion(
      id: Value(id),
      boardHash: Value(boardHash),
      ownerKey: Value(ownerKey),
      ts: Value(ts),
    );
  }

  factory OwnershipData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OwnershipData(
      id: serializer.fromJson<int>(json['id']),
      boardHash: serializer.fromJson<String>(json['boardHash']),
      ownerKey: serializer.fromJson<String>(json['ownerKey']),
      ts: serializer.fromJson<DateTime>(json['ts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'boardHash': serializer.toJson<String>(boardHash),
      'ownerKey': serializer.toJson<String>(ownerKey),
      'ts': serializer.toJson<DateTime>(ts),
    };
  }

  OwnershipData copyWith(
          {int? id, String? boardHash, String? ownerKey, DateTime? ts}) =>
      OwnershipData(
        id: id ?? this.id,
        boardHash: boardHash ?? this.boardHash,
        ownerKey: ownerKey ?? this.ownerKey,
        ts: ts ?? this.ts,
      );
  OwnershipData copyWithCompanion(OwnershipCompanion data) {
    return OwnershipData(
      id: data.id.present ? data.id.value : this.id,
      boardHash: data.boardHash.present ? data.boardHash.value : this.boardHash,
      ownerKey: data.ownerKey.present ? data.ownerKey.value : this.ownerKey,
      ts: data.ts.present ? data.ts.value : this.ts,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OwnershipData(')
          ..write('id: $id, ')
          ..write('boardHash: $boardHash, ')
          ..write('ownerKey: $ownerKey, ')
          ..write('ts: $ts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, boardHash, ownerKey, ts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OwnershipData &&
          other.id == this.id &&
          other.boardHash == this.boardHash &&
          other.ownerKey == this.ownerKey &&
          other.ts == this.ts);
}

class OwnershipCompanion extends UpdateCompanion<OwnershipData> {
  final Value<int> id;
  final Value<String> boardHash;
  final Value<String> ownerKey;
  final Value<DateTime> ts;
  const OwnershipCompanion({
    this.id = const Value.absent(),
    this.boardHash = const Value.absent(),
    this.ownerKey = const Value.absent(),
    this.ts = const Value.absent(),
  });
  OwnershipCompanion.insert({
    this.id = const Value.absent(),
    required String boardHash,
    required String ownerKey,
    required DateTime ts,
  })  : boardHash = Value(boardHash),
        ownerKey = Value(ownerKey),
        ts = Value(ts);
  static Insertable<OwnershipData> custom({
    Expression<int>? id,
    Expression<String>? boardHash,
    Expression<String>? ownerKey,
    Expression<DateTime>? ts,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (boardHash != null) 'board_hash': boardHash,
      if (ownerKey != null) 'owner_key': ownerKey,
      if (ts != null) 'ts': ts,
    });
  }

  OwnershipCompanion copyWith(
      {Value<int>? id,
      Value<String>? boardHash,
      Value<String>? ownerKey,
      Value<DateTime>? ts}) {
    return OwnershipCompanion(
      id: id ?? this.id,
      boardHash: boardHash ?? this.boardHash,
      ownerKey: ownerKey ?? this.ownerKey,
      ts: ts ?? this.ts,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (boardHash.present) {
      map['board_hash'] = Variable<String>(boardHash.value);
    }
    if (ownerKey.present) {
      map['owner_key'] = Variable<String>(ownerKey.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OwnershipCompanion(')
          ..write('id: $id, ')
          ..write('boardHash: $boardHash, ')
          ..write('ownerKey: $ownerKey, ')
          ..write('ts: $ts')
          ..write(')'))
        .toString();
  }
}

class $AuditTable extends Audit with TableInfo<$AuditTable, AuditData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _metaMeta = const VerificationMeta('meta');
  @override
  late final GeneratedColumn<String> meta = GeneratedColumn<String>(
      'meta', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, action, meta, ts];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit';
  @override
  VerificationContext validateIntegrity(Insertable<AuditData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('meta')) {
      context.handle(
          _metaMeta, meta.isAcceptableOrUnknown(data['meta']!, _metaMeta));
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      meta: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meta']),
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
    );
  }

  @override
  $AuditTable createAlias(String alias) {
    return $AuditTable(attachedDatabase, alias);
  }
}

class AuditData extends DataClass implements Insertable<AuditData> {
  final int id;
  final String action;
  final String? meta;
  final DateTime ts;
  const AuditData(
      {required this.id, required this.action, this.meta, required this.ts});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['action'] = Variable<String>(action);
    if (!nullToAbsent || meta != null) {
      map['meta'] = Variable<String>(meta);
    }
    map['ts'] = Variable<DateTime>(ts);
    return map;
  }

  AuditCompanion toCompanion(bool nullToAbsent) {
    return AuditCompanion(
      id: Value(id),
      action: Value(action),
      meta: meta == null && nullToAbsent ? const Value.absent() : Value(meta),
      ts: Value(ts),
    );
  }

  factory AuditData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditData(
      id: serializer.fromJson<int>(json['id']),
      action: serializer.fromJson<String>(json['action']),
      meta: serializer.fromJson<String?>(json['meta']),
      ts: serializer.fromJson<DateTime>(json['ts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'action': serializer.toJson<String>(action),
      'meta': serializer.toJson<String?>(meta),
      'ts': serializer.toJson<DateTime>(ts),
    };
  }

  AuditData copyWith(
          {int? id,
          String? action,
          Value<String?> meta = const Value.absent(),
          DateTime? ts}) =>
      AuditData(
        id: id ?? this.id,
        action: action ?? this.action,
        meta: meta.present ? meta.value : this.meta,
        ts: ts ?? this.ts,
      );
  AuditData copyWithCompanion(AuditCompanion data) {
    return AuditData(
      id: data.id.present ? data.id.value : this.id,
      action: data.action.present ? data.action.value : this.action,
      meta: data.meta.present ? data.meta.value : this.meta,
      ts: data.ts.present ? data.ts.value : this.ts,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditData(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('meta: $meta, ')
          ..write('ts: $ts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, action, meta, ts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditData &&
          other.id == this.id &&
          other.action == this.action &&
          other.meta == this.meta &&
          other.ts == this.ts);
}

class AuditCompanion extends UpdateCompanion<AuditData> {
  final Value<int> id;
  final Value<String> action;
  final Value<String?> meta;
  final Value<DateTime> ts;
  const AuditCompanion({
    this.id = const Value.absent(),
    this.action = const Value.absent(),
    this.meta = const Value.absent(),
    this.ts = const Value.absent(),
  });
  AuditCompanion.insert({
    this.id = const Value.absent(),
    required String action,
    this.meta = const Value.absent(),
    required DateTime ts,
  })  : action = Value(action),
        ts = Value(ts);
  static Insertable<AuditData> custom({
    Expression<int>? id,
    Expression<String>? action,
    Expression<String>? meta,
    Expression<DateTime>? ts,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (action != null) 'action': action,
      if (meta != null) 'meta': meta,
      if (ts != null) 'ts': ts,
    });
  }

  AuditCompanion copyWith(
      {Value<int>? id,
      Value<String>? action,
      Value<String?>? meta,
      Value<DateTime>? ts}) {
    return AuditCompanion(
      id: id ?? this.id,
      action: action ?? this.action,
      meta: meta ?? this.meta,
      ts: ts ?? this.ts,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (meta.present) {
      map['meta'] = Variable<String>(meta.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditCompanion(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('meta: $meta, ')
          ..write('ts: $ts')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RidesTable rides = $RidesTable(this);
  late final $SamplesTable samples = $SamplesTable(this);
  late final $AlertsTable alerts = $AlertsTable(this);
  late final $RoutesTable routes = $RoutesTable(this);
  late final $MileageTotalsTable mileageTotals = $MileageTotalsTable(this);
  late final $FirmwareHistoryTable firmwareHistory =
      $FirmwareHistoryTable(this);
  late final $BadgesTable badges = $BadgesTable(this);
  late final $CloudMetaTable cloudMeta = $CloudMetaTable(this);
  late final $CommunityEventsTable communityEvents =
      $CommunityEventsTable(this);
  late final $HazardsTable hazards = $HazardsTable(this);
  late final $FaultsTable faults = $FaultsTable(this);
  late final $PackMetricsTable packMetrics = $PackMetricsTable(this);
  late final $EscMetricsTable escMetrics = $EscMetricsTable(this);
  late final $CrowdSightingsTable crowdSightings = $CrowdSightingsTable(this);
  late final $OwnershipTable ownership = $OwnershipTable(this);
  late final $AuditTable audit = $AuditTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        rides,
        samples,
        alerts,
        routes,
        mileageTotals,
        firmwareHistory,
        badges,
        cloudMeta,
        communityEvents,
        hazards,
        faults,
        packMetrics,
        escMetrics,
        crowdSightings,
        ownership,
        audit
      ];
}

typedef $$RidesTableCreateCompanionBuilder = RidesCompanion Function({
  Value<int> id,
  required DateTime startTs,
  Value<DateTime?> endTs,
  Value<double> distKm,
  Value<double> avgSpeed,
  Value<double> maxSpeed,
  Value<double> energyWh,
  Value<String?> notes,
  Value<String> cloudStatus,
  Value<DateTime> updatedAt,
});
typedef $$RidesTableUpdateCompanionBuilder = RidesCompanion Function({
  Value<int> id,
  Value<DateTime> startTs,
  Value<DateTime?> endTs,
  Value<double> distKm,
  Value<double> avgSpeed,
  Value<double> maxSpeed,
  Value<double> energyWh,
  Value<String?> notes,
  Value<String> cloudStatus,
  Value<DateTime> updatedAt,
});

class $$RidesTableFilterComposer extends Composer<_$AppDatabase, $RidesTable> {
  $$RidesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTs => $composableBuilder(
      column: $table.startTs, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTs => $composableBuilder(
      column: $table.endTs, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get distKm => $composableBuilder(
      column: $table.distKm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get avgSpeed => $composableBuilder(
      column: $table.avgSpeed, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxSpeed => $composableBuilder(
      column: $table.maxSpeed, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get energyWh => $composableBuilder(
      column: $table.energyWh, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cloudStatus => $composableBuilder(
      column: $table.cloudStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$RidesTableOrderingComposer
    extends Composer<_$AppDatabase, $RidesTable> {
  $$RidesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTs => $composableBuilder(
      column: $table.startTs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTs => $composableBuilder(
      column: $table.endTs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get distKm => $composableBuilder(
      column: $table.distKm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get avgSpeed => $composableBuilder(
      column: $table.avgSpeed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxSpeed => $composableBuilder(
      column: $table.maxSpeed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get energyWh => $composableBuilder(
      column: $table.energyWh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cloudStatus => $composableBuilder(
      column: $table.cloudStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$RidesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RidesTable> {
  $$RidesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startTs =>
      $composableBuilder(column: $table.startTs, builder: (column) => column);

  GeneratedColumn<DateTime> get endTs =>
      $composableBuilder(column: $table.endTs, builder: (column) => column);

  GeneratedColumn<double> get distKm =>
      $composableBuilder(column: $table.distKm, builder: (column) => column);

  GeneratedColumn<double> get avgSpeed =>
      $composableBuilder(column: $table.avgSpeed, builder: (column) => column);

  GeneratedColumn<double> get maxSpeed =>
      $composableBuilder(column: $table.maxSpeed, builder: (column) => column);

  GeneratedColumn<double> get energyWh =>
      $composableBuilder(column: $table.energyWh, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get cloudStatus => $composableBuilder(
      column: $table.cloudStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RidesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RidesTable,
    Ride,
    $$RidesTableFilterComposer,
    $$RidesTableOrderingComposer,
    $$RidesTableAnnotationComposer,
    $$RidesTableCreateCompanionBuilder,
    $$RidesTableUpdateCompanionBuilder,
    (Ride, BaseReferences<_$AppDatabase, $RidesTable, Ride>),
    Ride,
    PrefetchHooks Function()> {
  $$RidesTableTableManager(_$AppDatabase db, $RidesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RidesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RidesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RidesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> startTs = const Value.absent(),
            Value<DateTime?> endTs = const Value.absent(),
            Value<double> distKm = const Value.absent(),
            Value<double> avgSpeed = const Value.absent(),
            Value<double> maxSpeed = const Value.absent(),
            Value<double> energyWh = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> cloudStatus = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RidesCompanion(
            id: id,
            startTs: startTs,
            endTs: endTs,
            distKm: distKm,
            avgSpeed: avgSpeed,
            maxSpeed: maxSpeed,
            energyWh: energyWh,
            notes: notes,
            cloudStatus: cloudStatus,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime startTs,
            Value<DateTime?> endTs = const Value.absent(),
            Value<double> distKm = const Value.absent(),
            Value<double> avgSpeed = const Value.absent(),
            Value<double> maxSpeed = const Value.absent(),
            Value<double> energyWh = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> cloudStatus = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RidesCompanion.insert(
            id: id,
            startTs: startTs,
            endTs: endTs,
            distKm: distKm,
            avgSpeed: avgSpeed,
            maxSpeed: maxSpeed,
            energyWh: energyWh,
            notes: notes,
            cloudStatus: cloudStatus,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RidesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RidesTable,
    Ride,
    $$RidesTableFilterComposer,
    $$RidesTableOrderingComposer,
    $$RidesTableAnnotationComposer,
    $$RidesTableCreateCompanionBuilder,
    $$RidesTableUpdateCompanionBuilder,
    (Ride, BaseReferences<_$AppDatabase, $RidesTable, Ride>),
    Ride,
    PrefetchHooks Function()>;
typedef $$SamplesTableCreateCompanionBuilder = SamplesCompanion Function({
  Value<int> id,
  required int rideId,
  required DateTime ts,
  required double speed,
  required double volts,
  required double amps,
  required double escTemp,
  required double motorTemp,
  required double throttle,
  required double brake,
});
typedef $$SamplesTableUpdateCompanionBuilder = SamplesCompanion Function({
  Value<int> id,
  Value<int> rideId,
  Value<DateTime> ts,
  Value<double> speed,
  Value<double> volts,
  Value<double> amps,
  Value<double> escTemp,
  Value<double> motorTemp,
  Value<double> throttle,
  Value<double> brake,
});

class $$SamplesTableFilterComposer
    extends Composer<_$AppDatabase, $SamplesTable> {
  $$SamplesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rideId => $composableBuilder(
      column: $table.rideId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get volts => $composableBuilder(
      column: $table.volts, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amps => $composableBuilder(
      column: $table.amps, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get escTemp => $composableBuilder(
      column: $table.escTemp, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get motorTemp => $composableBuilder(
      column: $table.motorTemp, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get throttle => $composableBuilder(
      column: $table.throttle, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get brake => $composableBuilder(
      column: $table.brake, builder: (column) => ColumnFilters(column));
}

class $$SamplesTableOrderingComposer
    extends Composer<_$AppDatabase, $SamplesTable> {
  $$SamplesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rideId => $composableBuilder(
      column: $table.rideId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get volts => $composableBuilder(
      column: $table.volts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amps => $composableBuilder(
      column: $table.amps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get escTemp => $composableBuilder(
      column: $table.escTemp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get motorTemp => $composableBuilder(
      column: $table.motorTemp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get throttle => $composableBuilder(
      column: $table.throttle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get brake => $composableBuilder(
      column: $table.brake, builder: (column) => ColumnOrderings(column));
}

class $$SamplesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SamplesTable> {
  $$SamplesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get rideId =>
      $composableBuilder(column: $table.rideId, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<double> get volts =>
      $composableBuilder(column: $table.volts, builder: (column) => column);

  GeneratedColumn<double> get amps =>
      $composableBuilder(column: $table.amps, builder: (column) => column);

  GeneratedColumn<double> get escTemp =>
      $composableBuilder(column: $table.escTemp, builder: (column) => column);

  GeneratedColumn<double> get motorTemp =>
      $composableBuilder(column: $table.motorTemp, builder: (column) => column);

  GeneratedColumn<double> get throttle =>
      $composableBuilder(column: $table.throttle, builder: (column) => column);

  GeneratedColumn<double> get brake =>
      $composableBuilder(column: $table.brake, builder: (column) => column);
}

class $$SamplesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SamplesTable,
    Sample,
    $$SamplesTableFilterComposer,
    $$SamplesTableOrderingComposer,
    $$SamplesTableAnnotationComposer,
    $$SamplesTableCreateCompanionBuilder,
    $$SamplesTableUpdateCompanionBuilder,
    (Sample, BaseReferences<_$AppDatabase, $SamplesTable, Sample>),
    Sample,
    PrefetchHooks Function()> {
  $$SamplesTableTableManager(_$AppDatabase db, $SamplesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SamplesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SamplesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SamplesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> rideId = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<double> speed = const Value.absent(),
            Value<double> volts = const Value.absent(),
            Value<double> amps = const Value.absent(),
            Value<double> escTemp = const Value.absent(),
            Value<double> motorTemp = const Value.absent(),
            Value<double> throttle = const Value.absent(),
            Value<double> brake = const Value.absent(),
          }) =>
              SamplesCompanion(
            id: id,
            rideId: rideId,
            ts: ts,
            speed: speed,
            volts: volts,
            amps: amps,
            escTemp: escTemp,
            motorTemp: motorTemp,
            throttle: throttle,
            brake: brake,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int rideId,
            required DateTime ts,
            required double speed,
            required double volts,
            required double amps,
            required double escTemp,
            required double motorTemp,
            required double throttle,
            required double brake,
          }) =>
              SamplesCompanion.insert(
            id: id,
            rideId: rideId,
            ts: ts,
            speed: speed,
            volts: volts,
            amps: amps,
            escTemp: escTemp,
            motorTemp: motorTemp,
            throttle: throttle,
            brake: brake,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SamplesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SamplesTable,
    Sample,
    $$SamplesTableFilterComposer,
    $$SamplesTableOrderingComposer,
    $$SamplesTableAnnotationComposer,
    $$SamplesTableCreateCompanionBuilder,
    $$SamplesTableUpdateCompanionBuilder,
    (Sample, BaseReferences<_$AppDatabase, $SamplesTable, Sample>),
    Sample,
    PrefetchHooks Function()>;
typedef $$AlertsTableCreateCompanionBuilder = AlertsCompanion Function({
  Value<int> id,
  required int rideId,
  required DateTime ts,
  required String type,
  Value<String?> meta,
});
typedef $$AlertsTableUpdateCompanionBuilder = AlertsCompanion Function({
  Value<int> id,
  Value<int> rideId,
  Value<DateTime> ts,
  Value<String> type,
  Value<String?> meta,
});

class $$AlertsTableFilterComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rideId => $composableBuilder(
      column: $table.rideId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meta => $composableBuilder(
      column: $table.meta, builder: (column) => ColumnFilters(column));
}

class $$AlertsTableOrderingComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rideId => $composableBuilder(
      column: $table.rideId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meta => $composableBuilder(
      column: $table.meta, builder: (column) => ColumnOrderings(column));
}

class $$AlertsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get rideId =>
      $composableBuilder(column: $table.rideId, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get meta =>
      $composableBuilder(column: $table.meta, builder: (column) => column);
}

class $$AlertsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AlertsTable,
    Alert,
    $$AlertsTableFilterComposer,
    $$AlertsTableOrderingComposer,
    $$AlertsTableAnnotationComposer,
    $$AlertsTableCreateCompanionBuilder,
    $$AlertsTableUpdateCompanionBuilder,
    (Alert, BaseReferences<_$AppDatabase, $AlertsTable, Alert>),
    Alert,
    PrefetchHooks Function()> {
  $$AlertsTableTableManager(_$AppDatabase db, $AlertsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlertsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlertsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlertsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> rideId = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> meta = const Value.absent(),
          }) =>
              AlertsCompanion(
            id: id,
            rideId: rideId,
            ts: ts,
            type: type,
            meta: meta,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int rideId,
            required DateTime ts,
            required String type,
            Value<String?> meta = const Value.absent(),
          }) =>
              AlertsCompanion.insert(
            id: id,
            rideId: rideId,
            ts: ts,
            type: type,
            meta: meta,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AlertsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AlertsTable,
    Alert,
    $$AlertsTableFilterComposer,
    $$AlertsTableOrderingComposer,
    $$AlertsTableAnnotationComposer,
    $$AlertsTableCreateCompanionBuilder,
    $$AlertsTableUpdateCompanionBuilder,
    (Alert, BaseReferences<_$AppDatabase, $AlertsTable, Alert>),
    Alert,
    PrefetchHooks Function()>;
typedef $$RoutesTableCreateCompanionBuilder = RoutesCompanion Function({
  Value<int> id,
  required int rideId,
  required String polyline,
});
typedef $$RoutesTableUpdateCompanionBuilder = RoutesCompanion Function({
  Value<int> id,
  Value<int> rideId,
  Value<String> polyline,
});

class $$RoutesTableFilterComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rideId => $composableBuilder(
      column: $table.rideId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get polyline => $composableBuilder(
      column: $table.polyline, builder: (column) => ColumnFilters(column));
}

class $$RoutesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rideId => $composableBuilder(
      column: $table.rideId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get polyline => $composableBuilder(
      column: $table.polyline, builder: (column) => ColumnOrderings(column));
}

class $$RoutesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get rideId =>
      $composableBuilder(column: $table.rideId, builder: (column) => column);

  GeneratedColumn<String> get polyline =>
      $composableBuilder(column: $table.polyline, builder: (column) => column);
}

class $$RoutesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutesTable,
    Route,
    $$RoutesTableFilterComposer,
    $$RoutesTableOrderingComposer,
    $$RoutesTableAnnotationComposer,
    $$RoutesTableCreateCompanionBuilder,
    $$RoutesTableUpdateCompanionBuilder,
    (Route, BaseReferences<_$AppDatabase, $RoutesTable, Route>),
    Route,
    PrefetchHooks Function()> {
  $$RoutesTableTableManager(_$AppDatabase db, $RoutesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> rideId = const Value.absent(),
            Value<String> polyline = const Value.absent(),
          }) =>
              RoutesCompanion(
            id: id,
            rideId: rideId,
            polyline: polyline,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int rideId,
            required String polyline,
          }) =>
              RoutesCompanion.insert(
            id: id,
            rideId: rideId,
            polyline: polyline,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RoutesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoutesTable,
    Route,
    $$RoutesTableFilterComposer,
    $$RoutesTableOrderingComposer,
    $$RoutesTableAnnotationComposer,
    $$RoutesTableCreateCompanionBuilder,
    $$RoutesTableUpdateCompanionBuilder,
    (Route, BaseReferences<_$AppDatabase, $RoutesTable, Route>),
    Route,
    PrefetchHooks Function()>;
typedef $$MileageTotalsTableCreateCompanionBuilder = MileageTotalsCompanion
    Function({
  Value<int> id,
  Value<double> totalMiles,
});
typedef $$MileageTotalsTableUpdateCompanionBuilder = MileageTotalsCompanion
    Function({
  Value<int> id,
  Value<double> totalMiles,
});

class $$MileageTotalsTableFilterComposer
    extends Composer<_$AppDatabase, $MileageTotalsTable> {
  $$MileageTotalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalMiles => $composableBuilder(
      column: $table.totalMiles, builder: (column) => ColumnFilters(column));
}

class $$MileageTotalsTableOrderingComposer
    extends Composer<_$AppDatabase, $MileageTotalsTable> {
  $$MileageTotalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalMiles => $composableBuilder(
      column: $table.totalMiles, builder: (column) => ColumnOrderings(column));
}

class $$MileageTotalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MileageTotalsTable> {
  $$MileageTotalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get totalMiles => $composableBuilder(
      column: $table.totalMiles, builder: (column) => column);
}

class $$MileageTotalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MileageTotalsTable,
    MileageTotal,
    $$MileageTotalsTableFilterComposer,
    $$MileageTotalsTableOrderingComposer,
    $$MileageTotalsTableAnnotationComposer,
    $$MileageTotalsTableCreateCompanionBuilder,
    $$MileageTotalsTableUpdateCompanionBuilder,
    (
      MileageTotal,
      BaseReferences<_$AppDatabase, $MileageTotalsTable, MileageTotal>
    ),
    MileageTotal,
    PrefetchHooks Function()> {
  $$MileageTotalsTableTableManager(_$AppDatabase db, $MileageTotalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MileageTotalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MileageTotalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MileageTotalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> totalMiles = const Value.absent(),
          }) =>
              MileageTotalsCompanion(
            id: id,
            totalMiles: totalMiles,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> totalMiles = const Value.absent(),
          }) =>
              MileageTotalsCompanion.insert(
            id: id,
            totalMiles: totalMiles,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MileageTotalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MileageTotalsTable,
    MileageTotal,
    $$MileageTotalsTableFilterComposer,
    $$MileageTotalsTableOrderingComposer,
    $$MileageTotalsTableAnnotationComposer,
    $$MileageTotalsTableCreateCompanionBuilder,
    $$MileageTotalsTableUpdateCompanionBuilder,
    (
      MileageTotal,
      BaseReferences<_$AppDatabase, $MileageTotalsTable, MileageTotal>
    ),
    MileageTotal,
    PrefetchHooks Function()>;
typedef $$FirmwareHistoryTableCreateCompanionBuilder = FirmwareHistoryCompanion
    Function({
  Value<int> id,
  required String version,
  required DateTime ts,
});
typedef $$FirmwareHistoryTableUpdateCompanionBuilder = FirmwareHistoryCompanion
    Function({
  Value<int> id,
  Value<String> version,
  Value<DateTime> ts,
});

class $$FirmwareHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $FirmwareHistoryTable> {
  $$FirmwareHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));
}

class $$FirmwareHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $FirmwareHistoryTable> {
  $$FirmwareHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));
}

class $$FirmwareHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $FirmwareHistoryTable> {
  $$FirmwareHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);
}

class $$FirmwareHistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FirmwareHistoryTable,
    FirmwareHistoryData,
    $$FirmwareHistoryTableFilterComposer,
    $$FirmwareHistoryTableOrderingComposer,
    $$FirmwareHistoryTableAnnotationComposer,
    $$FirmwareHistoryTableCreateCompanionBuilder,
    $$FirmwareHistoryTableUpdateCompanionBuilder,
    (
      FirmwareHistoryData,
      BaseReferences<_$AppDatabase, $FirmwareHistoryTable, FirmwareHistoryData>
    ),
    FirmwareHistoryData,
    PrefetchHooks Function()> {
  $$FirmwareHistoryTableTableManager(
      _$AppDatabase db, $FirmwareHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FirmwareHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FirmwareHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FirmwareHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> version = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
          }) =>
              FirmwareHistoryCompanion(
            id: id,
            version: version,
            ts: ts,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String version,
            required DateTime ts,
          }) =>
              FirmwareHistoryCompanion.insert(
            id: id,
            version: version,
            ts: ts,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FirmwareHistoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FirmwareHistoryTable,
    FirmwareHistoryData,
    $$FirmwareHistoryTableFilterComposer,
    $$FirmwareHistoryTableOrderingComposer,
    $$FirmwareHistoryTableAnnotationComposer,
    $$FirmwareHistoryTableCreateCompanionBuilder,
    $$FirmwareHistoryTableUpdateCompanionBuilder,
    (
      FirmwareHistoryData,
      BaseReferences<_$AppDatabase, $FirmwareHistoryTable, FirmwareHistoryData>
    ),
    FirmwareHistoryData,
    PrefetchHooks Function()>;
typedef $$BadgesTableCreateCompanionBuilder = BadgesCompanion Function({
  Value<int> id,
  required String key,
  Value<bool> earned,
  Value<DateTime?> earnedTs,
});
typedef $$BadgesTableUpdateCompanionBuilder = BadgesCompanion Function({
  Value<int> id,
  Value<String> key,
  Value<bool> earned,
  Value<DateTime?> earnedTs,
});

class $$BadgesTableFilterComposer
    extends Composer<_$AppDatabase, $BadgesTable> {
  $$BadgesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get earned => $composableBuilder(
      column: $table.earned, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get earnedTs => $composableBuilder(
      column: $table.earnedTs, builder: (column) => ColumnFilters(column));
}

class $$BadgesTableOrderingComposer
    extends Composer<_$AppDatabase, $BadgesTable> {
  $$BadgesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get earned => $composableBuilder(
      column: $table.earned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get earnedTs => $composableBuilder(
      column: $table.earnedTs, builder: (column) => ColumnOrderings(column));
}

class $$BadgesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BadgesTable> {
  $$BadgesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<bool> get earned =>
      $composableBuilder(column: $table.earned, builder: (column) => column);

  GeneratedColumn<DateTime> get earnedTs =>
      $composableBuilder(column: $table.earnedTs, builder: (column) => column);
}

class $$BadgesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BadgesTable,
    Badge,
    $$BadgesTableFilterComposer,
    $$BadgesTableOrderingComposer,
    $$BadgesTableAnnotationComposer,
    $$BadgesTableCreateCompanionBuilder,
    $$BadgesTableUpdateCompanionBuilder,
    (Badge, BaseReferences<_$AppDatabase, $BadgesTable, Badge>),
    Badge,
    PrefetchHooks Function()> {
  $$BadgesTableTableManager(_$AppDatabase db, $BadgesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BadgesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BadgesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BadgesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<bool> earned = const Value.absent(),
            Value<DateTime?> earnedTs = const Value.absent(),
          }) =>
              BadgesCompanion(
            id: id,
            key: key,
            earned: earned,
            earnedTs: earnedTs,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String key,
            Value<bool> earned = const Value.absent(),
            Value<DateTime?> earnedTs = const Value.absent(),
          }) =>
              BadgesCompanion.insert(
            id: id,
            key: key,
            earned: earned,
            earnedTs: earnedTs,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BadgesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BadgesTable,
    Badge,
    $$BadgesTableFilterComposer,
    $$BadgesTableOrderingComposer,
    $$BadgesTableAnnotationComposer,
    $$BadgesTableCreateCompanionBuilder,
    $$BadgesTableUpdateCompanionBuilder,
    (Badge, BaseReferences<_$AppDatabase, $BadgesTable, Badge>),
    Badge,
    PrefetchHooks Function()>;
typedef $$CloudMetaTableCreateCompanionBuilder = CloudMetaCompanion Function({
  required String key,
  Value<String?> value,
  Value<int> rowid,
});
typedef $$CloudMetaTableUpdateCompanionBuilder = CloudMetaCompanion Function({
  Value<String> key,
  Value<String?> value,
  Value<int> rowid,
});

class $$CloudMetaTableFilterComposer
    extends Composer<_$AppDatabase, $CloudMetaTable> {
  $$CloudMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$CloudMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $CloudMetaTable> {
  $$CloudMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$CloudMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $CloudMetaTable> {
  $$CloudMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$CloudMetaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CloudMetaTable,
    CloudMetaData,
    $$CloudMetaTableFilterComposer,
    $$CloudMetaTableOrderingComposer,
    $$CloudMetaTableAnnotationComposer,
    $$CloudMetaTableCreateCompanionBuilder,
    $$CloudMetaTableUpdateCompanionBuilder,
    (
      CloudMetaData,
      BaseReferences<_$AppDatabase, $CloudMetaTable, CloudMetaData>
    ),
    CloudMetaData,
    PrefetchHooks Function()> {
  $$CloudMetaTableTableManager(_$AppDatabase db, $CloudMetaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CloudMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CloudMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CloudMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String?> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CloudMetaCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            Value<String?> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CloudMetaCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CloudMetaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CloudMetaTable,
    CloudMetaData,
    $$CloudMetaTableFilterComposer,
    $$CloudMetaTableOrderingComposer,
    $$CloudMetaTableAnnotationComposer,
    $$CloudMetaTableCreateCompanionBuilder,
    $$CloudMetaTableUpdateCompanionBuilder,
    (
      CloudMetaData,
      BaseReferences<_$AppDatabase, $CloudMetaTable, CloudMetaData>
    ),
    CloudMetaData,
    PrefetchHooks Function()>;
typedef $$CommunityEventsTableCreateCompanionBuilder = CommunityEventsCompanion
    Function({
  required String id,
  required String title,
  required DateTime startTs,
  required DateTime endTs,
  Value<String?> locationName,
  Value<double?> lat,
  Value<double?> lon,
  Value<String?> description,
  required String createdByHash,
  Value<String> cloudStatus,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CommunityEventsTableUpdateCompanionBuilder = CommunityEventsCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<DateTime> startTs,
  Value<DateTime> endTs,
  Value<String?> locationName,
  Value<double?> lat,
  Value<double?> lon,
  Value<String?> description,
  Value<String> createdByHash,
  Value<String> cloudStatus,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$CommunityEventsTableFilterComposer
    extends Composer<_$AppDatabase, $CommunityEventsTable> {
  $$CommunityEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTs => $composableBuilder(
      column: $table.startTs, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTs => $composableBuilder(
      column: $table.endTs, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationName => $composableBuilder(
      column: $table.locationName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lon => $composableBuilder(
      column: $table.lon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdByHash => $composableBuilder(
      column: $table.createdByHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cloudStatus => $composableBuilder(
      column: $table.cloudStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CommunityEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $CommunityEventsTable> {
  $$CommunityEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTs => $composableBuilder(
      column: $table.startTs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTs => $composableBuilder(
      column: $table.endTs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationName => $composableBuilder(
      column: $table.locationName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lon => $composableBuilder(
      column: $table.lon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdByHash => $composableBuilder(
      column: $table.createdByHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cloudStatus => $composableBuilder(
      column: $table.cloudStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CommunityEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommunityEventsTable> {
  $$CommunityEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startTs =>
      $composableBuilder(column: $table.startTs, builder: (column) => column);

  GeneratedColumn<DateTime> get endTs =>
      $composableBuilder(column: $table.endTs, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
      column: $table.locationName, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get createdByHash => $composableBuilder(
      column: $table.createdByHash, builder: (column) => column);

  GeneratedColumn<String> get cloudStatus => $composableBuilder(
      column: $table.cloudStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CommunityEventsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CommunityEventsTable,
    CommunityEvent,
    $$CommunityEventsTableFilterComposer,
    $$CommunityEventsTableOrderingComposer,
    $$CommunityEventsTableAnnotationComposer,
    $$CommunityEventsTableCreateCompanionBuilder,
    $$CommunityEventsTableUpdateCompanionBuilder,
    (
      CommunityEvent,
      BaseReferences<_$AppDatabase, $CommunityEventsTable, CommunityEvent>
    ),
    CommunityEvent,
    PrefetchHooks Function()> {
  $$CommunityEventsTableTableManager(
      _$AppDatabase db, $CommunityEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommunityEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommunityEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommunityEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> startTs = const Value.absent(),
            Value<DateTime> endTs = const Value.absent(),
            Value<String?> locationName = const Value.absent(),
            Value<double?> lat = const Value.absent(),
            Value<double?> lon = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> createdByHash = const Value.absent(),
            Value<String> cloudStatus = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CommunityEventsCompanion(
            id: id,
            title: title,
            startTs: startTs,
            endTs: endTs,
            locationName: locationName,
            lat: lat,
            lon: lon,
            description: description,
            createdByHash: createdByHash,
            cloudStatus: cloudStatus,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required DateTime startTs,
            required DateTime endTs,
            Value<String?> locationName = const Value.absent(),
            Value<double?> lat = const Value.absent(),
            Value<double?> lon = const Value.absent(),
            Value<String?> description = const Value.absent(),
            required String createdByHash,
            Value<String> cloudStatus = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CommunityEventsCompanion.insert(
            id: id,
            title: title,
            startTs: startTs,
            endTs: endTs,
            locationName: locationName,
            lat: lat,
            lon: lon,
            description: description,
            createdByHash: createdByHash,
            cloudStatus: cloudStatus,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CommunityEventsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CommunityEventsTable,
    CommunityEvent,
    $$CommunityEventsTableFilterComposer,
    $$CommunityEventsTableOrderingComposer,
    $$CommunityEventsTableAnnotationComposer,
    $$CommunityEventsTableCreateCompanionBuilder,
    $$CommunityEventsTableUpdateCompanionBuilder,
    (
      CommunityEvent,
      BaseReferences<_$AppDatabase, $CommunityEventsTable, CommunityEvent>
    ),
    CommunityEvent,
    PrefetchHooks Function()>;
typedef $$HazardsTableCreateCompanionBuilder = HazardsCompanion Function({
  required String id,
  required String type,
  required DateTime ts,
  required double lat,
  required double lon,
  required int severity,
  Value<String?> note,
  required String createdByHash,
  Value<String> cloudStatus,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$HazardsTableUpdateCompanionBuilder = HazardsCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<DateTime> ts,
  Value<double> lat,
  Value<double> lon,
  Value<int> severity,
  Value<String?> note,
  Value<String> createdByHash,
  Value<String> cloudStatus,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$HazardsTableFilterComposer
    extends Composer<_$AppDatabase, $HazardsTable> {
  $$HazardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lon => $composableBuilder(
      column: $table.lon, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdByHash => $composableBuilder(
      column: $table.createdByHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cloudStatus => $composableBuilder(
      column: $table.cloudStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$HazardsTableOrderingComposer
    extends Composer<_$AppDatabase, $HazardsTable> {
  $$HazardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lon => $composableBuilder(
      column: $table.lon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdByHash => $composableBuilder(
      column: $table.createdByHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cloudStatus => $composableBuilder(
      column: $table.cloudStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$HazardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HazardsTable> {
  $$HazardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  GeneratedColumn<int> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get createdByHash => $composableBuilder(
      column: $table.createdByHash, builder: (column) => column);

  GeneratedColumn<String> get cloudStatus => $composableBuilder(
      column: $table.cloudStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$HazardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HazardsTable,
    Hazard,
    $$HazardsTableFilterComposer,
    $$HazardsTableOrderingComposer,
    $$HazardsTableAnnotationComposer,
    $$HazardsTableCreateCompanionBuilder,
    $$HazardsTableUpdateCompanionBuilder,
    (Hazard, BaseReferences<_$AppDatabase, $HazardsTable, Hazard>),
    Hazard,
    PrefetchHooks Function()> {
  $$HazardsTableTableManager(_$AppDatabase db, $HazardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HazardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HazardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HazardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<double> lat = const Value.absent(),
            Value<double> lon = const Value.absent(),
            Value<int> severity = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String> createdByHash = const Value.absent(),
            Value<String> cloudStatus = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HazardsCompanion(
            id: id,
            type: type,
            ts: ts,
            lat: lat,
            lon: lon,
            severity: severity,
            note: note,
            createdByHash: createdByHash,
            cloudStatus: cloudStatus,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required DateTime ts,
            required double lat,
            required double lon,
            required int severity,
            Value<String?> note = const Value.absent(),
            required String createdByHash,
            Value<String> cloudStatus = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HazardsCompanion.insert(
            id: id,
            type: type,
            ts: ts,
            lat: lat,
            lon: lon,
            severity: severity,
            note: note,
            createdByHash: createdByHash,
            cloudStatus: cloudStatus,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HazardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HazardsTable,
    Hazard,
    $$HazardsTableFilterComposer,
    $$HazardsTableOrderingComposer,
    $$HazardsTableAnnotationComposer,
    $$HazardsTableCreateCompanionBuilder,
    $$HazardsTableUpdateCompanionBuilder,
    (Hazard, BaseReferences<_$AppDatabase, $HazardsTable, Hazard>),
    Hazard,
    PrefetchHooks Function()>;
typedef $$FaultsTableCreateCompanionBuilder = FaultsCompanion Function({
  Value<int> id,
  required DateTime ts,
  required String code,
  required String message,
});
typedef $$FaultsTableUpdateCompanionBuilder = FaultsCompanion Function({
  Value<int> id,
  Value<DateTime> ts,
  Value<String> code,
  Value<String> message,
});

class $$FaultsTableFilterComposer
    extends Composer<_$AppDatabase, $FaultsTable> {
  $$FaultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));
}

class $$FaultsTableOrderingComposer
    extends Composer<_$AppDatabase, $FaultsTable> {
  $$FaultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));
}

class $$FaultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FaultsTable> {
  $$FaultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);
}

class $$FaultsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FaultsTable,
    Fault,
    $$FaultsTableFilterComposer,
    $$FaultsTableOrderingComposer,
    $$FaultsTableAnnotationComposer,
    $$FaultsTableCreateCompanionBuilder,
    $$FaultsTableUpdateCompanionBuilder,
    (Fault, BaseReferences<_$AppDatabase, $FaultsTable, Fault>),
    Fault,
    PrefetchHooks Function()> {
  $$FaultsTableTableManager(_$AppDatabase db, $FaultsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FaultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FaultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FaultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<String> message = const Value.absent(),
          }) =>
              FaultsCompanion(
            id: id,
            ts: ts,
            code: code,
            message: message,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime ts,
            required String code,
            required String message,
          }) =>
              FaultsCompanion.insert(
            id: id,
            ts: ts,
            code: code,
            message: message,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FaultsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FaultsTable,
    Fault,
    $$FaultsTableFilterComposer,
    $$FaultsTableOrderingComposer,
    $$FaultsTableAnnotationComposer,
    $$FaultsTableCreateCompanionBuilder,
    $$FaultsTableUpdateCompanionBuilder,
    (Fault, BaseReferences<_$AppDatabase, $FaultsTable, Fault>),
    Fault,
    PrefetchHooks Function()>;
typedef $$PackMetricsTableCreateCompanionBuilder = PackMetricsCompanion
    Function({
  Value<int> id,
  required DateTime ts,
  required double soh,
  required double sagIndex,
});
typedef $$PackMetricsTableUpdateCompanionBuilder = PackMetricsCompanion
    Function({
  Value<int> id,
  Value<DateTime> ts,
  Value<double> soh,
  Value<double> sagIndex,
});

class $$PackMetricsTableFilterComposer
    extends Composer<_$AppDatabase, $PackMetricsTable> {
  $$PackMetricsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get soh => $composableBuilder(
      column: $table.soh, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sagIndex => $composableBuilder(
      column: $table.sagIndex, builder: (column) => ColumnFilters(column));
}

class $$PackMetricsTableOrderingComposer
    extends Composer<_$AppDatabase, $PackMetricsTable> {
  $$PackMetricsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get soh => $composableBuilder(
      column: $table.soh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sagIndex => $composableBuilder(
      column: $table.sagIndex, builder: (column) => ColumnOrderings(column));
}

class $$PackMetricsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PackMetricsTable> {
  $$PackMetricsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<double> get soh =>
      $composableBuilder(column: $table.soh, builder: (column) => column);

  GeneratedColumn<double> get sagIndex =>
      $composableBuilder(column: $table.sagIndex, builder: (column) => column);
}

class $$PackMetricsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PackMetricsTable,
    PackMetric,
    $$PackMetricsTableFilterComposer,
    $$PackMetricsTableOrderingComposer,
    $$PackMetricsTableAnnotationComposer,
    $$PackMetricsTableCreateCompanionBuilder,
    $$PackMetricsTableUpdateCompanionBuilder,
    (PackMetric, BaseReferences<_$AppDatabase, $PackMetricsTable, PackMetric>),
    PackMetric,
    PrefetchHooks Function()> {
  $$PackMetricsTableTableManager(_$AppDatabase db, $PackMetricsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PackMetricsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PackMetricsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PackMetricsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<double> soh = const Value.absent(),
            Value<double> sagIndex = const Value.absent(),
          }) =>
              PackMetricsCompanion(
            id: id,
            ts: ts,
            soh: soh,
            sagIndex: sagIndex,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime ts,
            required double soh,
            required double sagIndex,
          }) =>
              PackMetricsCompanion.insert(
            id: id,
            ts: ts,
            soh: soh,
            sagIndex: sagIndex,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PackMetricsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PackMetricsTable,
    PackMetric,
    $$PackMetricsTableFilterComposer,
    $$PackMetricsTableOrderingComposer,
    $$PackMetricsTableAnnotationComposer,
    $$PackMetricsTableCreateCompanionBuilder,
    $$PackMetricsTableUpdateCompanionBuilder,
    (PackMetric, BaseReferences<_$AppDatabase, $PackMetricsTable, PackMetric>),
    PackMetric,
    PrefetchHooks Function()>;
typedef $$EscMetricsTableCreateCompanionBuilder = EscMetricsCompanion Function({
  Value<int> id,
  required DateTime ts,
  required double tempC,
  required double etaMin,
});
typedef $$EscMetricsTableUpdateCompanionBuilder = EscMetricsCompanion Function({
  Value<int> id,
  Value<DateTime> ts,
  Value<double> tempC,
  Value<double> etaMin,
});

class $$EscMetricsTableFilterComposer
    extends Composer<_$AppDatabase, $EscMetricsTable> {
  $$EscMetricsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get tempC => $composableBuilder(
      column: $table.tempC, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get etaMin => $composableBuilder(
      column: $table.etaMin, builder: (column) => ColumnFilters(column));
}

class $$EscMetricsTableOrderingComposer
    extends Composer<_$AppDatabase, $EscMetricsTable> {
  $$EscMetricsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get tempC => $composableBuilder(
      column: $table.tempC, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get etaMin => $composableBuilder(
      column: $table.etaMin, builder: (column) => ColumnOrderings(column));
}

class $$EscMetricsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EscMetricsTable> {
  $$EscMetricsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<double> get tempC =>
      $composableBuilder(column: $table.tempC, builder: (column) => column);

  GeneratedColumn<double> get etaMin =>
      $composableBuilder(column: $table.etaMin, builder: (column) => column);
}

class $$EscMetricsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EscMetricsTable,
    EscMetric,
    $$EscMetricsTableFilterComposer,
    $$EscMetricsTableOrderingComposer,
    $$EscMetricsTableAnnotationComposer,
    $$EscMetricsTableCreateCompanionBuilder,
    $$EscMetricsTableUpdateCompanionBuilder,
    (EscMetric, BaseReferences<_$AppDatabase, $EscMetricsTable, EscMetric>),
    EscMetric,
    PrefetchHooks Function()> {
  $$EscMetricsTableTableManager(_$AppDatabase db, $EscMetricsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EscMetricsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EscMetricsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EscMetricsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<double> tempC = const Value.absent(),
            Value<double> etaMin = const Value.absent(),
          }) =>
              EscMetricsCompanion(
            id: id,
            ts: ts,
            tempC: tempC,
            etaMin: etaMin,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime ts,
            required double tempC,
            required double etaMin,
          }) =>
              EscMetricsCompanion.insert(
            id: id,
            ts: ts,
            tempC: tempC,
            etaMin: etaMin,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EscMetricsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EscMetricsTable,
    EscMetric,
    $$EscMetricsTableFilterComposer,
    $$EscMetricsTableOrderingComposer,
    $$EscMetricsTableAnnotationComposer,
    $$EscMetricsTableCreateCompanionBuilder,
    $$EscMetricsTableUpdateCompanionBuilder,
    (EscMetric, BaseReferences<_$AppDatabase, $EscMetricsTable, EscMetric>),
    EscMetric,
    PrefetchHooks Function()>;
typedef $$CrowdSightingsTableCreateCompanionBuilder = CrowdSightingsCompanion
    Function({
  Value<int> id,
  required String boardHash,
  required double lat,
  required double lon,
  required DateTime ts,
});
typedef $$CrowdSightingsTableUpdateCompanionBuilder = CrowdSightingsCompanion
    Function({
  Value<int> id,
  Value<String> boardHash,
  Value<double> lat,
  Value<double> lon,
  Value<DateTime> ts,
});

class $$CrowdSightingsTableFilterComposer
    extends Composer<_$AppDatabase, $CrowdSightingsTable> {
  $$CrowdSightingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get boardHash => $composableBuilder(
      column: $table.boardHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lon => $composableBuilder(
      column: $table.lon, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));
}

class $$CrowdSightingsTableOrderingComposer
    extends Composer<_$AppDatabase, $CrowdSightingsTable> {
  $$CrowdSightingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get boardHash => $composableBuilder(
      column: $table.boardHash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lon => $composableBuilder(
      column: $table.lon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));
}

class $$CrowdSightingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CrowdSightingsTable> {
  $$CrowdSightingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get boardHash =>
      $composableBuilder(column: $table.boardHash, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);
}

class $$CrowdSightingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CrowdSightingsTable,
    CrowdSighting,
    $$CrowdSightingsTableFilterComposer,
    $$CrowdSightingsTableOrderingComposer,
    $$CrowdSightingsTableAnnotationComposer,
    $$CrowdSightingsTableCreateCompanionBuilder,
    $$CrowdSightingsTableUpdateCompanionBuilder,
    (
      CrowdSighting,
      BaseReferences<_$AppDatabase, $CrowdSightingsTable, CrowdSighting>
    ),
    CrowdSighting,
    PrefetchHooks Function()> {
  $$CrowdSightingsTableTableManager(
      _$AppDatabase db, $CrowdSightingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CrowdSightingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CrowdSightingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CrowdSightingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> boardHash = const Value.absent(),
            Value<double> lat = const Value.absent(),
            Value<double> lon = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
          }) =>
              CrowdSightingsCompanion(
            id: id,
            boardHash: boardHash,
            lat: lat,
            lon: lon,
            ts: ts,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String boardHash,
            required double lat,
            required double lon,
            required DateTime ts,
          }) =>
              CrowdSightingsCompanion.insert(
            id: id,
            boardHash: boardHash,
            lat: lat,
            lon: lon,
            ts: ts,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CrowdSightingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CrowdSightingsTable,
    CrowdSighting,
    $$CrowdSightingsTableFilterComposer,
    $$CrowdSightingsTableOrderingComposer,
    $$CrowdSightingsTableAnnotationComposer,
    $$CrowdSightingsTableCreateCompanionBuilder,
    $$CrowdSightingsTableUpdateCompanionBuilder,
    (
      CrowdSighting,
      BaseReferences<_$AppDatabase, $CrowdSightingsTable, CrowdSighting>
    ),
    CrowdSighting,
    PrefetchHooks Function()>;
typedef $$OwnershipTableCreateCompanionBuilder = OwnershipCompanion Function({
  Value<int> id,
  required String boardHash,
  required String ownerKey,
  required DateTime ts,
});
typedef $$OwnershipTableUpdateCompanionBuilder = OwnershipCompanion Function({
  Value<int> id,
  Value<String> boardHash,
  Value<String> ownerKey,
  Value<DateTime> ts,
});

class $$OwnershipTableFilterComposer
    extends Composer<_$AppDatabase, $OwnershipTable> {
  $$OwnershipTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get boardHash => $composableBuilder(
      column: $table.boardHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerKey => $composableBuilder(
      column: $table.ownerKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));
}

class $$OwnershipTableOrderingComposer
    extends Composer<_$AppDatabase, $OwnershipTable> {
  $$OwnershipTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get boardHash => $composableBuilder(
      column: $table.boardHash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerKey => $composableBuilder(
      column: $table.ownerKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));
}

class $$OwnershipTableAnnotationComposer
    extends Composer<_$AppDatabase, $OwnershipTable> {
  $$OwnershipTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get boardHash =>
      $composableBuilder(column: $table.boardHash, builder: (column) => column);

  GeneratedColumn<String> get ownerKey =>
      $composableBuilder(column: $table.ownerKey, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);
}

class $$OwnershipTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OwnershipTable,
    OwnershipData,
    $$OwnershipTableFilterComposer,
    $$OwnershipTableOrderingComposer,
    $$OwnershipTableAnnotationComposer,
    $$OwnershipTableCreateCompanionBuilder,
    $$OwnershipTableUpdateCompanionBuilder,
    (
      OwnershipData,
      BaseReferences<_$AppDatabase, $OwnershipTable, OwnershipData>
    ),
    OwnershipData,
    PrefetchHooks Function()> {
  $$OwnershipTableTableManager(_$AppDatabase db, $OwnershipTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OwnershipTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OwnershipTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OwnershipTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> boardHash = const Value.absent(),
            Value<String> ownerKey = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
          }) =>
              OwnershipCompanion(
            id: id,
            boardHash: boardHash,
            ownerKey: ownerKey,
            ts: ts,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String boardHash,
            required String ownerKey,
            required DateTime ts,
          }) =>
              OwnershipCompanion.insert(
            id: id,
            boardHash: boardHash,
            ownerKey: ownerKey,
            ts: ts,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OwnershipTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OwnershipTable,
    OwnershipData,
    $$OwnershipTableFilterComposer,
    $$OwnershipTableOrderingComposer,
    $$OwnershipTableAnnotationComposer,
    $$OwnershipTableCreateCompanionBuilder,
    $$OwnershipTableUpdateCompanionBuilder,
    (
      OwnershipData,
      BaseReferences<_$AppDatabase, $OwnershipTable, OwnershipData>
    ),
    OwnershipData,
    PrefetchHooks Function()>;
typedef $$AuditTableCreateCompanionBuilder = AuditCompanion Function({
  Value<int> id,
  required String action,
  Value<String?> meta,
  required DateTime ts,
});
typedef $$AuditTableUpdateCompanionBuilder = AuditCompanion Function({
  Value<int> id,
  Value<String> action,
  Value<String?> meta,
  Value<DateTime> ts,
});

class $$AuditTableFilterComposer extends Composer<_$AppDatabase, $AuditTable> {
  $$AuditTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meta => $composableBuilder(
      column: $table.meta, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));
}

class $$AuditTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditTable> {
  $$AuditTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meta => $composableBuilder(
      column: $table.meta, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));
}

class $$AuditTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditTable> {
  $$AuditTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get meta =>
      $composableBuilder(column: $table.meta, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);
}

class $$AuditTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AuditTable,
    AuditData,
    $$AuditTableFilterComposer,
    $$AuditTableOrderingComposer,
    $$AuditTableAnnotationComposer,
    $$AuditTableCreateCompanionBuilder,
    $$AuditTableUpdateCompanionBuilder,
    (AuditData, BaseReferences<_$AppDatabase, $AuditTable, AuditData>),
    AuditData,
    PrefetchHooks Function()> {
  $$AuditTableTableManager(_$AppDatabase db, $AuditTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<String?> meta = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
          }) =>
              AuditCompanion(
            id: id,
            action: action,
            meta: meta,
            ts: ts,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String action,
            Value<String?> meta = const Value.absent(),
            required DateTime ts,
          }) =>
              AuditCompanion.insert(
            id: id,
            action: action,
            meta: meta,
            ts: ts,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuditTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AuditTable,
    AuditData,
    $$AuditTableFilterComposer,
    $$AuditTableOrderingComposer,
    $$AuditTableAnnotationComposer,
    $$AuditTableCreateCompanionBuilder,
    $$AuditTableUpdateCompanionBuilder,
    (AuditData, BaseReferences<_$AppDatabase, $AuditTable, AuditData>),
    AuditData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RidesTableTableManager get rides =>
      $$RidesTableTableManager(_db, _db.rides);
  $$SamplesTableTableManager get samples =>
      $$SamplesTableTableManager(_db, _db.samples);
  $$AlertsTableTableManager get alerts =>
      $$AlertsTableTableManager(_db, _db.alerts);
  $$RoutesTableTableManager get routes =>
      $$RoutesTableTableManager(_db, _db.routes);
  $$MileageTotalsTableTableManager get mileageTotals =>
      $$MileageTotalsTableTableManager(_db, _db.mileageTotals);
  $$FirmwareHistoryTableTableManager get firmwareHistory =>
      $$FirmwareHistoryTableTableManager(_db, _db.firmwareHistory);
  $$BadgesTableTableManager get badges =>
      $$BadgesTableTableManager(_db, _db.badges);
  $$CloudMetaTableTableManager get cloudMeta =>
      $$CloudMetaTableTableManager(_db, _db.cloudMeta);
  $$CommunityEventsTableTableManager get communityEvents =>
      $$CommunityEventsTableTableManager(_db, _db.communityEvents);
  $$HazardsTableTableManager get hazards =>
      $$HazardsTableTableManager(_db, _db.hazards);
  $$FaultsTableTableManager get faults =>
      $$FaultsTableTableManager(_db, _db.faults);
  $$PackMetricsTableTableManager get packMetrics =>
      $$PackMetricsTableTableManager(_db, _db.packMetrics);
  $$EscMetricsTableTableManager get escMetrics =>
      $$EscMetricsTableTableManager(_db, _db.escMetrics);
  $$CrowdSightingsTableTableManager get crowdSightings =>
      $$CrowdSightingsTableTableManager(_db, _db.crowdSightings);
  $$OwnershipTableTableManager get ownership =>
      $$OwnershipTableTableManager(_db, _db.ownership);
  $$AuditTableTableManager get audit =>
      $$AuditTableTableManager(_db, _db.audit);
}
