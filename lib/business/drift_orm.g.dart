// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_orm.dart';

// ignore_for_file: type=lint
class $NienKhoaTable extends NienKhoa
    with TableInfo<$NienKhoaTable, NienKhoaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NienKhoaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _dateUpdatedMeta =
      const VerificationMeta('dateUpdated');
  @override
  late final GeneratedColumn<DateTime> dateUpdated = GeneratedColumn<DateTime>(
      'date_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tenNienKhoaMeta =
      const VerificationMeta('tenNienKhoa');
  @override
  late final GeneratedColumn<String> tenNienKhoa = GeneratedColumn<String>(
      'ten_nien_khoa', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _batDauMeta = const VerificationMeta('batDau');
  @override
  late final GeneratedColumn<DateTime> batDau = GeneratedColumn<DateTime>(
      'bat_dau', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _ketThucMeta =
      const VerificationMeta('ketThuc');
  @override
  late final GeneratedColumn<DateTime> ketThuc = GeneratedColumn<DateTime>(
      'ket_thuc', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [dateCreated, dateUpdated, id, tenNienKhoa, batDau, ketThuc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nien_khoa';
  @override
  VerificationContext validateIntegrity(Insertable<NienKhoaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_updated')) {
      context.handle(
          _dateUpdatedMeta,
          dateUpdated.isAcceptableOrUnknown(
              data['date_updated']!, _dateUpdatedMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ten_nien_khoa')) {
      context.handle(
          _tenNienKhoaMeta,
          tenNienKhoa.isAcceptableOrUnknown(
              data['ten_nien_khoa']!, _tenNienKhoaMeta));
    } else if (isInserting) {
      context.missing(_tenNienKhoaMeta);
    }
    if (data.containsKey('bat_dau')) {
      context.handle(_batDauMeta,
          batDau.isAcceptableOrUnknown(data['bat_dau']!, _batDauMeta));
    }
    if (data.containsKey('ket_thuc')) {
      context.handle(_ketThucMeta,
          ketThuc.isAcceptableOrUnknown(data['ket_thuc']!, _ketThucMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NienKhoaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NienKhoaData(
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_updated'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tenNienKhoa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ten_nien_khoa'])!,
      batDau: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}bat_dau']),
      ketThuc: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ket_thuc']),
    );
  }

  @override
  $NienKhoaTable createAlias(String alias) {
    return $NienKhoaTable(attachedDatabase, alias);
  }
}

class NienKhoaData extends DataClass implements Insertable<NienKhoaData> {
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final int id;
  final String tenNienKhoa;
  final DateTime? batDau;
  final DateTime? ketThuc;
  const NienKhoaData(
      {required this.dateCreated,
      required this.dateUpdated,
      required this.id,
      required this.tenNienKhoa,
      this.batDau,
      this.ketThuc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['date_updated'] = Variable<DateTime>(dateUpdated);
    map['id'] = Variable<int>(id);
    map['ten_nien_khoa'] = Variable<String>(tenNienKhoa);
    if (!nullToAbsent || batDau != null) {
      map['bat_dau'] = Variable<DateTime>(batDau);
    }
    if (!nullToAbsent || ketThuc != null) {
      map['ket_thuc'] = Variable<DateTime>(ketThuc);
    }
    return map;
  }

  NienKhoaCompanion toCompanion(bool nullToAbsent) {
    return NienKhoaCompanion(
      dateCreated: Value(dateCreated),
      dateUpdated: Value(dateUpdated),
      id: Value(id),
      tenNienKhoa: Value(tenNienKhoa),
      batDau:
          batDau == null && nullToAbsent ? const Value.absent() : Value(batDau),
      ketThuc: ketThuc == null && nullToAbsent
          ? const Value.absent()
          : Value(ketThuc),
    );
  }

  factory NienKhoaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NienKhoaData(
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateUpdated: serializer.fromJson<DateTime>(json['dateUpdated']),
      id: serializer.fromJson<int>(json['id']),
      tenNienKhoa: serializer.fromJson<String>(json['tenNienKhoa']),
      batDau: serializer.fromJson<DateTime?>(json['batDau']),
      ketThuc: serializer.fromJson<DateTime?>(json['ketThuc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateUpdated': serializer.toJson<DateTime>(dateUpdated),
      'id': serializer.toJson<int>(id),
      'tenNienKhoa': serializer.toJson<String>(tenNienKhoa),
      'batDau': serializer.toJson<DateTime?>(batDau),
      'ketThuc': serializer.toJson<DateTime?>(ketThuc),
    };
  }

  NienKhoaData copyWith(
          {DateTime? dateCreated,
          DateTime? dateUpdated,
          int? id,
          String? tenNienKhoa,
          Value<DateTime?> batDau = const Value.absent(),
          Value<DateTime?> ketThuc = const Value.absent()}) =>
      NienKhoaData(
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        id: id ?? this.id,
        tenNienKhoa: tenNienKhoa ?? this.tenNienKhoa,
        batDau: batDau.present ? batDau.value : this.batDau,
        ketThuc: ketThuc.present ? ketThuc.value : this.ketThuc,
      );
  NienKhoaData copyWithCompanion(NienKhoaCompanion data) {
    return NienKhoaData(
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateUpdated:
          data.dateUpdated.present ? data.dateUpdated.value : this.dateUpdated,
      id: data.id.present ? data.id.value : this.id,
      tenNienKhoa:
          data.tenNienKhoa.present ? data.tenNienKhoa.value : this.tenNienKhoa,
      batDau: data.batDau.present ? data.batDau.value : this.batDau,
      ketThuc: data.ketThuc.present ? data.ketThuc.value : this.ketThuc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NienKhoaData(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('tenNienKhoa: $tenNienKhoa, ')
          ..write('batDau: $batDau, ')
          ..write('ketThuc: $ketThuc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(dateCreated, dateUpdated, id, tenNienKhoa, batDau, ketThuc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NienKhoaData &&
          other.dateCreated == this.dateCreated &&
          other.dateUpdated == this.dateUpdated &&
          other.id == this.id &&
          other.tenNienKhoa == this.tenNienKhoa &&
          other.batDau == this.batDau &&
          other.ketThuc == this.ketThuc);
}

class NienKhoaCompanion extends UpdateCompanion<NienKhoaData> {
  final Value<DateTime> dateCreated;
  final Value<DateTime> dateUpdated;
  final Value<int> id;
  final Value<String> tenNienKhoa;
  final Value<DateTime?> batDau;
  final Value<DateTime?> ketThuc;
  const NienKhoaCompanion({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    this.tenNienKhoa = const Value.absent(),
    this.batDau = const Value.absent(),
    this.ketThuc = const Value.absent(),
  });
  NienKhoaCompanion.insert({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    required String tenNienKhoa,
    this.batDau = const Value.absent(),
    this.ketThuc = const Value.absent(),
  }) : tenNienKhoa = Value(tenNienKhoa);
  static Insertable<NienKhoaData> custom({
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateUpdated,
    Expression<int>? id,
    Expression<String>? tenNienKhoa,
    Expression<DateTime>? batDau,
    Expression<DateTime>? ketThuc,
  }) {
    return RawValuesInsertable({
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateUpdated != null) 'date_updated': dateUpdated,
      if (id != null) 'id': id,
      if (tenNienKhoa != null) 'ten_nien_khoa': tenNienKhoa,
      if (batDau != null) 'bat_dau': batDau,
      if (ketThuc != null) 'ket_thuc': ketThuc,
    });
  }

  NienKhoaCompanion copyWith(
      {Value<DateTime>? dateCreated,
      Value<DateTime>? dateUpdated,
      Value<int>? id,
      Value<String>? tenNienKhoa,
      Value<DateTime?>? batDau,
      Value<DateTime?>? ketThuc}) {
    return NienKhoaCompanion(
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      id: id ?? this.id,
      tenNienKhoa: tenNienKhoa ?? this.tenNienKhoa,
      batDau: batDau ?? this.batDau,
      ketThuc: ketThuc ?? this.ketThuc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateUpdated.present) {
      map['date_updated'] = Variable<DateTime>(dateUpdated.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tenNienKhoa.present) {
      map['ten_nien_khoa'] = Variable<String>(tenNienKhoa.value);
    }
    if (batDau.present) {
      map['bat_dau'] = Variable<DateTime>(batDau.value);
    }
    if (ketThuc.present) {
      map['ket_thuc'] = Variable<DateTime>(ketThuc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NienKhoaCompanion(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('tenNienKhoa: $tenNienKhoa, ')
          ..write('batDau: $batDau, ')
          ..write('ketThuc: $ketThuc')
          ..write(')'))
        .toString();
  }
}

class $NhomChuyenMonTable extends NhomChuyenMon
    with TableInfo<$NhomChuyenMonTable, NhomChuyenMonData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NhomChuyenMonTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _dateUpdatedMeta =
      const VerificationMeta('dateUpdated');
  @override
  late final GeneratedColumn<DateTime> dateUpdated = GeneratedColumn<DateTime>(
      'date_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tenNhomMeta =
      const VerificationMeta('tenNhom');
  @override
  late final GeneratedColumn<String> tenNhom = GeneratedColumn<String>(
      'ten_nhom', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [dateCreated, dateUpdated, id, tenNhom];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nhom_chuyen_mon';
  @override
  VerificationContext validateIntegrity(Insertable<NhomChuyenMonData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_updated')) {
      context.handle(
          _dateUpdatedMeta,
          dateUpdated.isAcceptableOrUnknown(
              data['date_updated']!, _dateUpdatedMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ten_nhom')) {
      context.handle(_tenNhomMeta,
          tenNhom.isAcceptableOrUnknown(data['ten_nhom']!, _tenNhomMeta));
    } else if (isInserting) {
      context.missing(_tenNhomMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NhomChuyenMonData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NhomChuyenMonData(
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_updated'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tenNhom: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ten_nhom'])!,
    );
  }

  @override
  $NhomChuyenMonTable createAlias(String alias) {
    return $NhomChuyenMonTable(attachedDatabase, alias);
  }
}

class NhomChuyenMonData extends DataClass
    implements Insertable<NhomChuyenMonData> {
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final int id;
  final String tenNhom;
  const NhomChuyenMonData(
      {required this.dateCreated,
      required this.dateUpdated,
      required this.id,
      required this.tenNhom});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['date_updated'] = Variable<DateTime>(dateUpdated);
    map['id'] = Variable<int>(id);
    map['ten_nhom'] = Variable<String>(tenNhom);
    return map;
  }

  NhomChuyenMonCompanion toCompanion(bool nullToAbsent) {
    return NhomChuyenMonCompanion(
      dateCreated: Value(dateCreated),
      dateUpdated: Value(dateUpdated),
      id: Value(id),
      tenNhom: Value(tenNhom),
    );
  }

  factory NhomChuyenMonData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NhomChuyenMonData(
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateUpdated: serializer.fromJson<DateTime>(json['dateUpdated']),
      id: serializer.fromJson<int>(json['id']),
      tenNhom: serializer.fromJson<String>(json['tenNhom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateUpdated': serializer.toJson<DateTime>(dateUpdated),
      'id': serializer.toJson<int>(id),
      'tenNhom': serializer.toJson<String>(tenNhom),
    };
  }

  NhomChuyenMonData copyWith(
          {DateTime? dateCreated,
          DateTime? dateUpdated,
          int? id,
          String? tenNhom}) =>
      NhomChuyenMonData(
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        id: id ?? this.id,
        tenNhom: tenNhom ?? this.tenNhom,
      );
  NhomChuyenMonData copyWithCompanion(NhomChuyenMonCompanion data) {
    return NhomChuyenMonData(
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateUpdated:
          data.dateUpdated.present ? data.dateUpdated.value : this.dateUpdated,
      id: data.id.present ? data.id.value : this.id,
      tenNhom: data.tenNhom.present ? data.tenNhom.value : this.tenNhom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NhomChuyenMonData(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('tenNhom: $tenNhom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dateCreated, dateUpdated, id, tenNhom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NhomChuyenMonData &&
          other.dateCreated == this.dateCreated &&
          other.dateUpdated == this.dateUpdated &&
          other.id == this.id &&
          other.tenNhom == this.tenNhom);
}

class NhomChuyenMonCompanion extends UpdateCompanion<NhomChuyenMonData> {
  final Value<DateTime> dateCreated;
  final Value<DateTime> dateUpdated;
  final Value<int> id;
  final Value<String> tenNhom;
  const NhomChuyenMonCompanion({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    this.tenNhom = const Value.absent(),
  });
  NhomChuyenMonCompanion.insert({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    required String tenNhom,
  }) : tenNhom = Value(tenNhom);
  static Insertable<NhomChuyenMonData> custom({
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateUpdated,
    Expression<int>? id,
    Expression<String>? tenNhom,
  }) {
    return RawValuesInsertable({
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateUpdated != null) 'date_updated': dateUpdated,
      if (id != null) 'id': id,
      if (tenNhom != null) 'ten_nhom': tenNhom,
    });
  }

  NhomChuyenMonCompanion copyWith(
      {Value<DateTime>? dateCreated,
      Value<DateTime>? dateUpdated,
      Value<int>? id,
      Value<String>? tenNhom}) {
    return NhomChuyenMonCompanion(
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      id: id ?? this.id,
      tenNhom: tenNhom ?? this.tenNhom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateUpdated.present) {
      map['date_updated'] = Variable<DateTime>(dateUpdated.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tenNhom.present) {
      map['ten_nhom'] = Variable<String>(tenNhom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NhomChuyenMonCompanion(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('tenNhom: $tenNhom')
          ..write(')'))
        .toString();
  }
}

class $GiangVienTable extends GiangVien
    with TableInfo<$GiangVienTable, GiangVienData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GiangVienTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _dateUpdatedMeta =
      const VerificationMeta('dateUpdated');
  @override
  late final GeneratedColumn<DateTime> dateUpdated = GeneratedColumn<DateTime>(
      'date_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _hocHamMeta = const VerificationMeta('hocHam');
  @override
  late final GeneratedColumn<String> hocHam = GeneratedColumn<String>(
      'hoc_ham', aliasedName, true,
      check: () => hocHam.isIn(["gs", "pgs"]),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _hocViMeta = const VerificationMeta('hocVi');
  @override
  late final GeneratedColumn<String> hocVi = GeneratedColumn<String>(
      'hoc_vi', aliasedName, true,
      check: () => hocVi.isIn(["cn", "ths", "ts", "tskh"]),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _hoTenMeta = const VerificationMeta('hoTen');
  @override
  late final GeneratedColumn<String> hoTen = GeneratedColumn<String>(
      'ho_ten', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _maCanBoMeta =
      const VerificationMeta('maCanBo');
  @override
  late final GeneratedColumn<String> maCanBo = GeneratedColumn<String>(
      'ma_can_bo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _daiHocMeta = const VerificationMeta('daiHoc');
  @override
  late final GeneratedColumn<String> daiHoc = GeneratedColumn<String>(
      'dai_hoc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _donViMeta = const VerificationMeta('donVi');
  @override
  late final GeneratedColumn<String> donVi = GeneratedColumn<String>(
      'don_vi', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ngoaiTruongMeta =
      const VerificationMeta('ngoaiTruong');
  @override
  late final GeneratedColumn<bool> ngoaiTruong = GeneratedColumn<bool>(
      'ngoai_truong', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("ngoai_truong" IN (0, 1))'),
      defaultValue: trueExpr);
  static const VerificationMeta _chuyenNganhMeta =
      const VerificationMeta('chuyenNganh');
  @override
  late final GeneratedColumn<String> chuyenNganh = GeneratedColumn<String>(
      'chuyen_nganh', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<GioiTinh, String> gioiTinh =
      GeneratedColumn<String>('gioi_tinh', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(GioiTinh.khac.value))
          .withConverter<GioiTinh>($GiangVienTable.$convertergioiTinh);
  static const VerificationMeta _namNhanTsMeta =
      const VerificationMeta('namNhanTs');
  @override
  late final GeneratedColumn<int> namNhanTs = GeneratedColumn<int>(
      'nam_nhan_ts', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sdtMeta = const VerificationMeta('sdt');
  @override
  late final GeneratedColumn<String> sdt = GeneratedColumn<String>(
      'sdt', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cccdMeta = const VerificationMeta('cccd');
  @override
  late final GeneratedColumn<String> cccd = GeneratedColumn<String>(
      'cccd', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ngaySinhMeta =
      const VerificationMeta('ngaySinh');
  @override
  late final GeneratedColumn<DateTime> ngaySinh = GeneratedColumn<DateTime>(
      'ngay_sinh', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _stkMeta = const VerificationMeta('stk');
  @override
  late final GeneratedColumn<String> stk = GeneratedColumn<String>(
      'stk', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nganHangMeta =
      const VerificationMeta('nganHang');
  @override
  late final GeneratedColumn<String> nganHang = GeneratedColumn<String>(
      'ngan_hang', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mstMeta = const VerificationMeta('mst');
  @override
  late final GeneratedColumn<String> mst = GeneratedColumn<String>(
      'mst', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _idNhomChuyenMonMeta =
      const VerificationMeta('idNhomChuyenMon');
  @override
  late final GeneratedColumn<int> idNhomChuyenMon = GeneratedColumn<int>(
      'id_nhom_chuyen_mon', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES nhom_chuyen_mon (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        dateCreated,
        dateUpdated,
        hocHam,
        hocVi,
        id,
        hoTen,
        maCanBo,
        daiHoc,
        donVi,
        ngoaiTruong,
        chuyenNganh,
        gioiTinh,
        namNhanTs,
        sdt,
        email,
        cccd,
        ngaySinh,
        stk,
        nganHang,
        mst,
        note,
        idNhomChuyenMon
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'giang_vien';
  @override
  VerificationContext validateIntegrity(Insertable<GiangVienData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_updated')) {
      context.handle(
          _dateUpdatedMeta,
          dateUpdated.isAcceptableOrUnknown(
              data['date_updated']!, _dateUpdatedMeta));
    }
    if (data.containsKey('hoc_ham')) {
      context.handle(_hocHamMeta,
          hocHam.isAcceptableOrUnknown(data['hoc_ham']!, _hocHamMeta));
    }
    if (data.containsKey('hoc_vi')) {
      context.handle(
          _hocViMeta, hocVi.isAcceptableOrUnknown(data['hoc_vi']!, _hocViMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ho_ten')) {
      context.handle(
          _hoTenMeta, hoTen.isAcceptableOrUnknown(data['ho_ten']!, _hoTenMeta));
    } else if (isInserting) {
      context.missing(_hoTenMeta);
    }
    if (data.containsKey('ma_can_bo')) {
      context.handle(_maCanBoMeta,
          maCanBo.isAcceptableOrUnknown(data['ma_can_bo']!, _maCanBoMeta));
    }
    if (data.containsKey('dai_hoc')) {
      context.handle(_daiHocMeta,
          daiHoc.isAcceptableOrUnknown(data['dai_hoc']!, _daiHocMeta));
    }
    if (data.containsKey('don_vi')) {
      context.handle(
          _donViMeta, donVi.isAcceptableOrUnknown(data['don_vi']!, _donViMeta));
    }
    if (data.containsKey('ngoai_truong')) {
      context.handle(
          _ngoaiTruongMeta,
          ngoaiTruong.isAcceptableOrUnknown(
              data['ngoai_truong']!, _ngoaiTruongMeta));
    }
    if (data.containsKey('chuyen_nganh')) {
      context.handle(
          _chuyenNganhMeta,
          chuyenNganh.isAcceptableOrUnknown(
              data['chuyen_nganh']!, _chuyenNganhMeta));
    }
    if (data.containsKey('nam_nhan_ts')) {
      context.handle(
          _namNhanTsMeta,
          namNhanTs.isAcceptableOrUnknown(
              data['nam_nhan_ts']!, _namNhanTsMeta));
    }
    if (data.containsKey('sdt')) {
      context.handle(
          _sdtMeta, sdt.isAcceptableOrUnknown(data['sdt']!, _sdtMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('cccd')) {
      context.handle(
          _cccdMeta, cccd.isAcceptableOrUnknown(data['cccd']!, _cccdMeta));
    }
    if (data.containsKey('ngay_sinh')) {
      context.handle(_ngaySinhMeta,
          ngaySinh.isAcceptableOrUnknown(data['ngay_sinh']!, _ngaySinhMeta));
    }
    if (data.containsKey('stk')) {
      context.handle(
          _stkMeta, stk.isAcceptableOrUnknown(data['stk']!, _stkMeta));
    }
    if (data.containsKey('ngan_hang')) {
      context.handle(_nganHangMeta,
          nganHang.isAcceptableOrUnknown(data['ngan_hang']!, _nganHangMeta));
    }
    if (data.containsKey('mst')) {
      context.handle(
          _mstMeta, mst.isAcceptableOrUnknown(data['mst']!, _mstMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('id_nhom_chuyen_mon')) {
      context.handle(
          _idNhomChuyenMonMeta,
          idNhomChuyenMon.isAcceptableOrUnknown(
              data['id_nhom_chuyen_mon']!, _idNhomChuyenMonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GiangVienData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GiangVienData(
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_updated'])!,
      hocHam: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hoc_ham']),
      hocVi: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hoc_vi']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hoTen: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ho_ten'])!,
      maCanBo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ma_can_bo']),
      daiHoc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dai_hoc']),
      donVi: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}don_vi']),
      ngoaiTruong: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ngoai_truong'])!,
      chuyenNganh: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chuyen_nganh']),
      gioiTinh: $GiangVienTable.$convertergioiTinh.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gioi_tinh'])!),
      namNhanTs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nam_nhan_ts']),
      sdt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sdt']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      cccd: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cccd']),
      ngaySinh: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ngay_sinh']),
      stk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stk']),
      nganHang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ngan_hang']),
      mst: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mst']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      idNhomChuyenMon: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_nhom_chuyen_mon']),
    );
  }

  @override
  $GiangVienTable createAlias(String alias) {
    return $GiangVienTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<GioiTinh, String, String> $convertergioiTinh =
      const EnumNameConverter<GioiTinh>(GioiTinh.values);
}

class GiangVienData extends DataClass implements Insertable<GiangVienData> {
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final String? hocHam;
  final String? hocVi;
  final int id;
  final String hoTen;
  final String? maCanBo;
  final String? daiHoc;
  final String? donVi;
  final bool ngoaiTruong;
  final String? chuyenNganh;
  final GioiTinh gioiTinh;
  final int? namNhanTs;
  final String? sdt;
  final String? email;
  final String? cccd;
  final DateTime? ngaySinh;
  final String? stk;
  final String? nganHang;
  final String? mst;
  final String note;
  final int? idNhomChuyenMon;
  const GiangVienData(
      {required this.dateCreated,
      required this.dateUpdated,
      this.hocHam,
      this.hocVi,
      required this.id,
      required this.hoTen,
      this.maCanBo,
      this.daiHoc,
      this.donVi,
      required this.ngoaiTruong,
      this.chuyenNganh,
      required this.gioiTinh,
      this.namNhanTs,
      this.sdt,
      this.email,
      this.cccd,
      this.ngaySinh,
      this.stk,
      this.nganHang,
      this.mst,
      required this.note,
      this.idNhomChuyenMon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['date_updated'] = Variable<DateTime>(dateUpdated);
    if (!nullToAbsent || hocHam != null) {
      map['hoc_ham'] = Variable<String>(hocHam);
    }
    if (!nullToAbsent || hocVi != null) {
      map['hoc_vi'] = Variable<String>(hocVi);
    }
    map['id'] = Variable<int>(id);
    map['ho_ten'] = Variable<String>(hoTen);
    if (!nullToAbsent || maCanBo != null) {
      map['ma_can_bo'] = Variable<String>(maCanBo);
    }
    if (!nullToAbsent || daiHoc != null) {
      map['dai_hoc'] = Variable<String>(daiHoc);
    }
    if (!nullToAbsent || donVi != null) {
      map['don_vi'] = Variable<String>(donVi);
    }
    map['ngoai_truong'] = Variable<bool>(ngoaiTruong);
    if (!nullToAbsent || chuyenNganh != null) {
      map['chuyen_nganh'] = Variable<String>(chuyenNganh);
    }
    {
      map['gioi_tinh'] =
          Variable<String>($GiangVienTable.$convertergioiTinh.toSql(gioiTinh));
    }
    if (!nullToAbsent || namNhanTs != null) {
      map['nam_nhan_ts'] = Variable<int>(namNhanTs);
    }
    if (!nullToAbsent || sdt != null) {
      map['sdt'] = Variable<String>(sdt);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || cccd != null) {
      map['cccd'] = Variable<String>(cccd);
    }
    if (!nullToAbsent || ngaySinh != null) {
      map['ngay_sinh'] = Variable<DateTime>(ngaySinh);
    }
    if (!nullToAbsent || stk != null) {
      map['stk'] = Variable<String>(stk);
    }
    if (!nullToAbsent || nganHang != null) {
      map['ngan_hang'] = Variable<String>(nganHang);
    }
    if (!nullToAbsent || mst != null) {
      map['mst'] = Variable<String>(mst);
    }
    map['note'] = Variable<String>(note);
    if (!nullToAbsent || idNhomChuyenMon != null) {
      map['id_nhom_chuyen_mon'] = Variable<int>(idNhomChuyenMon);
    }
    return map;
  }

  GiangVienCompanion toCompanion(bool nullToAbsent) {
    return GiangVienCompanion(
      dateCreated: Value(dateCreated),
      dateUpdated: Value(dateUpdated),
      hocHam:
          hocHam == null && nullToAbsent ? const Value.absent() : Value(hocHam),
      hocVi:
          hocVi == null && nullToAbsent ? const Value.absent() : Value(hocVi),
      id: Value(id),
      hoTen: Value(hoTen),
      maCanBo: maCanBo == null && nullToAbsent
          ? const Value.absent()
          : Value(maCanBo),
      daiHoc:
          daiHoc == null && nullToAbsent ? const Value.absent() : Value(daiHoc),
      donVi:
          donVi == null && nullToAbsent ? const Value.absent() : Value(donVi),
      ngoaiTruong: Value(ngoaiTruong),
      chuyenNganh: chuyenNganh == null && nullToAbsent
          ? const Value.absent()
          : Value(chuyenNganh),
      gioiTinh: Value(gioiTinh),
      namNhanTs: namNhanTs == null && nullToAbsent
          ? const Value.absent()
          : Value(namNhanTs),
      sdt: sdt == null && nullToAbsent ? const Value.absent() : Value(sdt),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      cccd: cccd == null && nullToAbsent ? const Value.absent() : Value(cccd),
      ngaySinh: ngaySinh == null && nullToAbsent
          ? const Value.absent()
          : Value(ngaySinh),
      stk: stk == null && nullToAbsent ? const Value.absent() : Value(stk),
      nganHang: nganHang == null && nullToAbsent
          ? const Value.absent()
          : Value(nganHang),
      mst: mst == null && nullToAbsent ? const Value.absent() : Value(mst),
      note: Value(note),
      idNhomChuyenMon: idNhomChuyenMon == null && nullToAbsent
          ? const Value.absent()
          : Value(idNhomChuyenMon),
    );
  }

  factory GiangVienData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GiangVienData(
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateUpdated: serializer.fromJson<DateTime>(json['dateUpdated']),
      hocHam: serializer.fromJson<String?>(json['hocHam']),
      hocVi: serializer.fromJson<String?>(json['hocVi']),
      id: serializer.fromJson<int>(json['id']),
      hoTen: serializer.fromJson<String>(json['hoTen']),
      maCanBo: serializer.fromJson<String?>(json['maCanBo']),
      daiHoc: serializer.fromJson<String?>(json['daiHoc']),
      donVi: serializer.fromJson<String?>(json['donVi']),
      ngoaiTruong: serializer.fromJson<bool>(json['ngoaiTruong']),
      chuyenNganh: serializer.fromJson<String?>(json['chuyenNganh']),
      gioiTinh: $GiangVienTable.$convertergioiTinh
          .fromJson(serializer.fromJson<String>(json['gioiTinh'])),
      namNhanTs: serializer.fromJson<int?>(json['namNhanTs']),
      sdt: serializer.fromJson<String?>(json['sdt']),
      email: serializer.fromJson<String?>(json['email']),
      cccd: serializer.fromJson<String?>(json['cccd']),
      ngaySinh: serializer.fromJson<DateTime?>(json['ngaySinh']),
      stk: serializer.fromJson<String?>(json['stk']),
      nganHang: serializer.fromJson<String?>(json['nganHang']),
      mst: serializer.fromJson<String?>(json['mst']),
      note: serializer.fromJson<String>(json['note']),
      idNhomChuyenMon: serializer.fromJson<int?>(json['idNhomChuyenMon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateUpdated': serializer.toJson<DateTime>(dateUpdated),
      'hocHam': serializer.toJson<String?>(hocHam),
      'hocVi': serializer.toJson<String?>(hocVi),
      'id': serializer.toJson<int>(id),
      'hoTen': serializer.toJson<String>(hoTen),
      'maCanBo': serializer.toJson<String?>(maCanBo),
      'daiHoc': serializer.toJson<String?>(daiHoc),
      'donVi': serializer.toJson<String?>(donVi),
      'ngoaiTruong': serializer.toJson<bool>(ngoaiTruong),
      'chuyenNganh': serializer.toJson<String?>(chuyenNganh),
      'gioiTinh': serializer
          .toJson<String>($GiangVienTable.$convertergioiTinh.toJson(gioiTinh)),
      'namNhanTs': serializer.toJson<int?>(namNhanTs),
      'sdt': serializer.toJson<String?>(sdt),
      'email': serializer.toJson<String?>(email),
      'cccd': serializer.toJson<String?>(cccd),
      'ngaySinh': serializer.toJson<DateTime?>(ngaySinh),
      'stk': serializer.toJson<String?>(stk),
      'nganHang': serializer.toJson<String?>(nganHang),
      'mst': serializer.toJson<String?>(mst),
      'note': serializer.toJson<String>(note),
      'idNhomChuyenMon': serializer.toJson<int?>(idNhomChuyenMon),
    };
  }

  GiangVienData copyWith(
          {DateTime? dateCreated,
          DateTime? dateUpdated,
          Value<String?> hocHam = const Value.absent(),
          Value<String?> hocVi = const Value.absent(),
          int? id,
          String? hoTen,
          Value<String?> maCanBo = const Value.absent(),
          Value<String?> daiHoc = const Value.absent(),
          Value<String?> donVi = const Value.absent(),
          bool? ngoaiTruong,
          Value<String?> chuyenNganh = const Value.absent(),
          GioiTinh? gioiTinh,
          Value<int?> namNhanTs = const Value.absent(),
          Value<String?> sdt = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> cccd = const Value.absent(),
          Value<DateTime?> ngaySinh = const Value.absent(),
          Value<String?> stk = const Value.absent(),
          Value<String?> nganHang = const Value.absent(),
          Value<String?> mst = const Value.absent(),
          String? note,
          Value<int?> idNhomChuyenMon = const Value.absent()}) =>
      GiangVienData(
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        hocHam: hocHam.present ? hocHam.value : this.hocHam,
        hocVi: hocVi.present ? hocVi.value : this.hocVi,
        id: id ?? this.id,
        hoTen: hoTen ?? this.hoTen,
        maCanBo: maCanBo.present ? maCanBo.value : this.maCanBo,
        daiHoc: daiHoc.present ? daiHoc.value : this.daiHoc,
        donVi: donVi.present ? donVi.value : this.donVi,
        ngoaiTruong: ngoaiTruong ?? this.ngoaiTruong,
        chuyenNganh: chuyenNganh.present ? chuyenNganh.value : this.chuyenNganh,
        gioiTinh: gioiTinh ?? this.gioiTinh,
        namNhanTs: namNhanTs.present ? namNhanTs.value : this.namNhanTs,
        sdt: sdt.present ? sdt.value : this.sdt,
        email: email.present ? email.value : this.email,
        cccd: cccd.present ? cccd.value : this.cccd,
        ngaySinh: ngaySinh.present ? ngaySinh.value : this.ngaySinh,
        stk: stk.present ? stk.value : this.stk,
        nganHang: nganHang.present ? nganHang.value : this.nganHang,
        mst: mst.present ? mst.value : this.mst,
        note: note ?? this.note,
        idNhomChuyenMon: idNhomChuyenMon.present
            ? idNhomChuyenMon.value
            : this.idNhomChuyenMon,
      );
  GiangVienData copyWithCompanion(GiangVienCompanion data) {
    return GiangVienData(
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateUpdated:
          data.dateUpdated.present ? data.dateUpdated.value : this.dateUpdated,
      hocHam: data.hocHam.present ? data.hocHam.value : this.hocHam,
      hocVi: data.hocVi.present ? data.hocVi.value : this.hocVi,
      id: data.id.present ? data.id.value : this.id,
      hoTen: data.hoTen.present ? data.hoTen.value : this.hoTen,
      maCanBo: data.maCanBo.present ? data.maCanBo.value : this.maCanBo,
      daiHoc: data.daiHoc.present ? data.daiHoc.value : this.daiHoc,
      donVi: data.donVi.present ? data.donVi.value : this.donVi,
      ngoaiTruong:
          data.ngoaiTruong.present ? data.ngoaiTruong.value : this.ngoaiTruong,
      chuyenNganh:
          data.chuyenNganh.present ? data.chuyenNganh.value : this.chuyenNganh,
      gioiTinh: data.gioiTinh.present ? data.gioiTinh.value : this.gioiTinh,
      namNhanTs: data.namNhanTs.present ? data.namNhanTs.value : this.namNhanTs,
      sdt: data.sdt.present ? data.sdt.value : this.sdt,
      email: data.email.present ? data.email.value : this.email,
      cccd: data.cccd.present ? data.cccd.value : this.cccd,
      ngaySinh: data.ngaySinh.present ? data.ngaySinh.value : this.ngaySinh,
      stk: data.stk.present ? data.stk.value : this.stk,
      nganHang: data.nganHang.present ? data.nganHang.value : this.nganHang,
      mst: data.mst.present ? data.mst.value : this.mst,
      note: data.note.present ? data.note.value : this.note,
      idNhomChuyenMon: data.idNhomChuyenMon.present
          ? data.idNhomChuyenMon.value
          : this.idNhomChuyenMon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GiangVienData(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('hocHam: $hocHam, ')
          ..write('hocVi: $hocVi, ')
          ..write('id: $id, ')
          ..write('hoTen: $hoTen, ')
          ..write('maCanBo: $maCanBo, ')
          ..write('daiHoc: $daiHoc, ')
          ..write('donVi: $donVi, ')
          ..write('ngoaiTruong: $ngoaiTruong, ')
          ..write('chuyenNganh: $chuyenNganh, ')
          ..write('gioiTinh: $gioiTinh, ')
          ..write('namNhanTs: $namNhanTs, ')
          ..write('sdt: $sdt, ')
          ..write('email: $email, ')
          ..write('cccd: $cccd, ')
          ..write('ngaySinh: $ngaySinh, ')
          ..write('stk: $stk, ')
          ..write('nganHang: $nganHang, ')
          ..write('mst: $mst, ')
          ..write('note: $note, ')
          ..write('idNhomChuyenMon: $idNhomChuyenMon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        dateCreated,
        dateUpdated,
        hocHam,
        hocVi,
        id,
        hoTen,
        maCanBo,
        daiHoc,
        donVi,
        ngoaiTruong,
        chuyenNganh,
        gioiTinh,
        namNhanTs,
        sdt,
        email,
        cccd,
        ngaySinh,
        stk,
        nganHang,
        mst,
        note,
        idNhomChuyenMon
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GiangVienData &&
          other.dateCreated == this.dateCreated &&
          other.dateUpdated == this.dateUpdated &&
          other.hocHam == this.hocHam &&
          other.hocVi == this.hocVi &&
          other.id == this.id &&
          other.hoTen == this.hoTen &&
          other.maCanBo == this.maCanBo &&
          other.daiHoc == this.daiHoc &&
          other.donVi == this.donVi &&
          other.ngoaiTruong == this.ngoaiTruong &&
          other.chuyenNganh == this.chuyenNganh &&
          other.gioiTinh == this.gioiTinh &&
          other.namNhanTs == this.namNhanTs &&
          other.sdt == this.sdt &&
          other.email == this.email &&
          other.cccd == this.cccd &&
          other.ngaySinh == this.ngaySinh &&
          other.stk == this.stk &&
          other.nganHang == this.nganHang &&
          other.mst == this.mst &&
          other.note == this.note &&
          other.idNhomChuyenMon == this.idNhomChuyenMon);
}

class GiangVienCompanion extends UpdateCompanion<GiangVienData> {
  final Value<DateTime> dateCreated;
  final Value<DateTime> dateUpdated;
  final Value<String?> hocHam;
  final Value<String?> hocVi;
  final Value<int> id;
  final Value<String> hoTen;
  final Value<String?> maCanBo;
  final Value<String?> daiHoc;
  final Value<String?> donVi;
  final Value<bool> ngoaiTruong;
  final Value<String?> chuyenNganh;
  final Value<GioiTinh> gioiTinh;
  final Value<int?> namNhanTs;
  final Value<String?> sdt;
  final Value<String?> email;
  final Value<String?> cccd;
  final Value<DateTime?> ngaySinh;
  final Value<String?> stk;
  final Value<String?> nganHang;
  final Value<String?> mst;
  final Value<String> note;
  final Value<int?> idNhomChuyenMon;
  const GiangVienCompanion({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.hocHam = const Value.absent(),
    this.hocVi = const Value.absent(),
    this.id = const Value.absent(),
    this.hoTen = const Value.absent(),
    this.maCanBo = const Value.absent(),
    this.daiHoc = const Value.absent(),
    this.donVi = const Value.absent(),
    this.ngoaiTruong = const Value.absent(),
    this.chuyenNganh = const Value.absent(),
    this.gioiTinh = const Value.absent(),
    this.namNhanTs = const Value.absent(),
    this.sdt = const Value.absent(),
    this.email = const Value.absent(),
    this.cccd = const Value.absent(),
    this.ngaySinh = const Value.absent(),
    this.stk = const Value.absent(),
    this.nganHang = const Value.absent(),
    this.mst = const Value.absent(),
    this.note = const Value.absent(),
    this.idNhomChuyenMon = const Value.absent(),
  });
  GiangVienCompanion.insert({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.hocHam = const Value.absent(),
    this.hocVi = const Value.absent(),
    this.id = const Value.absent(),
    required String hoTen,
    this.maCanBo = const Value.absent(),
    this.daiHoc = const Value.absent(),
    this.donVi = const Value.absent(),
    this.ngoaiTruong = const Value.absent(),
    this.chuyenNganh = const Value.absent(),
    this.gioiTinh = const Value.absent(),
    this.namNhanTs = const Value.absent(),
    this.sdt = const Value.absent(),
    this.email = const Value.absent(),
    this.cccd = const Value.absent(),
    this.ngaySinh = const Value.absent(),
    this.stk = const Value.absent(),
    this.nganHang = const Value.absent(),
    this.mst = const Value.absent(),
    this.note = const Value.absent(),
    this.idNhomChuyenMon = const Value.absent(),
  }) : hoTen = Value(hoTen);
  static Insertable<GiangVienData> custom({
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateUpdated,
    Expression<String>? hocHam,
    Expression<String>? hocVi,
    Expression<int>? id,
    Expression<String>? hoTen,
    Expression<String>? maCanBo,
    Expression<String>? daiHoc,
    Expression<String>? donVi,
    Expression<bool>? ngoaiTruong,
    Expression<String>? chuyenNganh,
    Expression<String>? gioiTinh,
    Expression<int>? namNhanTs,
    Expression<String>? sdt,
    Expression<String>? email,
    Expression<String>? cccd,
    Expression<DateTime>? ngaySinh,
    Expression<String>? stk,
    Expression<String>? nganHang,
    Expression<String>? mst,
    Expression<String>? note,
    Expression<int>? idNhomChuyenMon,
  }) {
    return RawValuesInsertable({
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateUpdated != null) 'date_updated': dateUpdated,
      if (hocHam != null) 'hoc_ham': hocHam,
      if (hocVi != null) 'hoc_vi': hocVi,
      if (id != null) 'id': id,
      if (hoTen != null) 'ho_ten': hoTen,
      if (maCanBo != null) 'ma_can_bo': maCanBo,
      if (daiHoc != null) 'dai_hoc': daiHoc,
      if (donVi != null) 'don_vi': donVi,
      if (ngoaiTruong != null) 'ngoai_truong': ngoaiTruong,
      if (chuyenNganh != null) 'chuyen_nganh': chuyenNganh,
      if (gioiTinh != null) 'gioi_tinh': gioiTinh,
      if (namNhanTs != null) 'nam_nhan_ts': namNhanTs,
      if (sdt != null) 'sdt': sdt,
      if (email != null) 'email': email,
      if (cccd != null) 'cccd': cccd,
      if (ngaySinh != null) 'ngay_sinh': ngaySinh,
      if (stk != null) 'stk': stk,
      if (nganHang != null) 'ngan_hang': nganHang,
      if (mst != null) 'mst': mst,
      if (note != null) 'note': note,
      if (idNhomChuyenMon != null) 'id_nhom_chuyen_mon': idNhomChuyenMon,
    });
  }

  GiangVienCompanion copyWith(
      {Value<DateTime>? dateCreated,
      Value<DateTime>? dateUpdated,
      Value<String?>? hocHam,
      Value<String?>? hocVi,
      Value<int>? id,
      Value<String>? hoTen,
      Value<String?>? maCanBo,
      Value<String?>? daiHoc,
      Value<String?>? donVi,
      Value<bool>? ngoaiTruong,
      Value<String?>? chuyenNganh,
      Value<GioiTinh>? gioiTinh,
      Value<int?>? namNhanTs,
      Value<String?>? sdt,
      Value<String?>? email,
      Value<String?>? cccd,
      Value<DateTime?>? ngaySinh,
      Value<String?>? stk,
      Value<String?>? nganHang,
      Value<String?>? mst,
      Value<String>? note,
      Value<int?>? idNhomChuyenMon}) {
    return GiangVienCompanion(
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      hocHam: hocHam ?? this.hocHam,
      hocVi: hocVi ?? this.hocVi,
      id: id ?? this.id,
      hoTen: hoTen ?? this.hoTen,
      maCanBo: maCanBo ?? this.maCanBo,
      daiHoc: daiHoc ?? this.daiHoc,
      donVi: donVi ?? this.donVi,
      ngoaiTruong: ngoaiTruong ?? this.ngoaiTruong,
      chuyenNganh: chuyenNganh ?? this.chuyenNganh,
      gioiTinh: gioiTinh ?? this.gioiTinh,
      namNhanTs: namNhanTs ?? this.namNhanTs,
      sdt: sdt ?? this.sdt,
      email: email ?? this.email,
      cccd: cccd ?? this.cccd,
      ngaySinh: ngaySinh ?? this.ngaySinh,
      stk: stk ?? this.stk,
      nganHang: nganHang ?? this.nganHang,
      mst: mst ?? this.mst,
      note: note ?? this.note,
      idNhomChuyenMon: idNhomChuyenMon ?? this.idNhomChuyenMon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateUpdated.present) {
      map['date_updated'] = Variable<DateTime>(dateUpdated.value);
    }
    if (hocHam.present) {
      map['hoc_ham'] = Variable<String>(hocHam.value);
    }
    if (hocVi.present) {
      map['hoc_vi'] = Variable<String>(hocVi.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hoTen.present) {
      map['ho_ten'] = Variable<String>(hoTen.value);
    }
    if (maCanBo.present) {
      map['ma_can_bo'] = Variable<String>(maCanBo.value);
    }
    if (daiHoc.present) {
      map['dai_hoc'] = Variable<String>(daiHoc.value);
    }
    if (donVi.present) {
      map['don_vi'] = Variable<String>(donVi.value);
    }
    if (ngoaiTruong.present) {
      map['ngoai_truong'] = Variable<bool>(ngoaiTruong.value);
    }
    if (chuyenNganh.present) {
      map['chuyen_nganh'] = Variable<String>(chuyenNganh.value);
    }
    if (gioiTinh.present) {
      map['gioi_tinh'] = Variable<String>(
          $GiangVienTable.$convertergioiTinh.toSql(gioiTinh.value));
    }
    if (namNhanTs.present) {
      map['nam_nhan_ts'] = Variable<int>(namNhanTs.value);
    }
    if (sdt.present) {
      map['sdt'] = Variable<String>(sdt.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (cccd.present) {
      map['cccd'] = Variable<String>(cccd.value);
    }
    if (ngaySinh.present) {
      map['ngay_sinh'] = Variable<DateTime>(ngaySinh.value);
    }
    if (stk.present) {
      map['stk'] = Variable<String>(stk.value);
    }
    if (nganHang.present) {
      map['ngan_hang'] = Variable<String>(nganHang.value);
    }
    if (mst.present) {
      map['mst'] = Variable<String>(mst.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (idNhomChuyenMon.present) {
      map['id_nhom_chuyen_mon'] = Variable<int>(idNhomChuyenMon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GiangVienCompanion(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('hocHam: $hocHam, ')
          ..write('hocVi: $hocVi, ')
          ..write('id: $id, ')
          ..write('hoTen: $hoTen, ')
          ..write('maCanBo: $maCanBo, ')
          ..write('daiHoc: $daiHoc, ')
          ..write('donVi: $donVi, ')
          ..write('ngoaiTruong: $ngoaiTruong, ')
          ..write('chuyenNganh: $chuyenNganh, ')
          ..write('gioiTinh: $gioiTinh, ')
          ..write('namNhanTs: $namNhanTs, ')
          ..write('sdt: $sdt, ')
          ..write('email: $email, ')
          ..write('cccd: $cccd, ')
          ..write('ngaySinh: $ngaySinh, ')
          ..write('stk: $stk, ')
          ..write('nganHang: $nganHang, ')
          ..write('mst: $mst, ')
          ..write('note: $note, ')
          ..write('idNhomChuyenMon: $idNhomChuyenMon')
          ..write(')'))
        .toString();
  }
}

class $TieuBanXetTuyenTable extends TieuBanXetTuyen
    with TableInfo<$TieuBanXetTuyenTable, TieuBanXetTuyenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TieuBanXetTuyenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _dateUpdatedMeta =
      const VerificationMeta('dateUpdated');
  @override
  late final GeneratedColumn<DateTime> dateUpdated = GeneratedColumn<DateTime>(
      'date_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idChuTichMeta =
      const VerificationMeta('idChuTich');
  @override
  late final GeneratedColumn<int> idChuTich = GeneratedColumn<int>(
      'id_chu_tich', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _idThuKyMeta =
      const VerificationMeta('idThuKy');
  @override
  late final GeneratedColumn<int> idThuKy = GeneratedColumn<int>(
      'id_thu_ky', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _idUyVien1Meta =
      const VerificationMeta('idUyVien1');
  @override
  late final GeneratedColumn<int> idUyVien1 = GeneratedColumn<int>(
      'id_uy_vien1', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _idUyVien2Meta =
      const VerificationMeta('idUyVien2');
  @override
  late final GeneratedColumn<int> idUyVien2 = GeneratedColumn<int>(
      'id_uy_vien2', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _idUyVien3Meta =
      const VerificationMeta('idUyVien3');
  @override
  late final GeneratedColumn<int> idUyVien3 = GeneratedColumn<int>(
      'id_uy_vien3', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _tienChuTichMeta =
      const VerificationMeta('tienChuTich');
  @override
  late final GeneratedColumn<int> tienChuTich = GeneratedColumn<int>(
      'tien_chu_tich', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tienThuKyMeta =
      const VerificationMeta('tienThuKy');
  @override
  late final GeneratedColumn<int> tienThuKy = GeneratedColumn<int>(
      'tien_thu_ky', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tienUyVienMeta =
      const VerificationMeta('tienUyVien');
  @override
  late final GeneratedColumn<int> tienUyVien = GeneratedColumn<int>(
      'tien_uy_vien', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        dateCreated,
        dateUpdated,
        id,
        idChuTich,
        idThuKy,
        idUyVien1,
        idUyVien2,
        idUyVien3,
        tienChuTich,
        tienThuKy,
        tienUyVien
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tieu_ban_xet_tuyen';
  @override
  VerificationContext validateIntegrity(
      Insertable<TieuBanXetTuyenData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_updated')) {
      context.handle(
          _dateUpdatedMeta,
          dateUpdated.isAcceptableOrUnknown(
              data['date_updated']!, _dateUpdatedMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_chu_tich')) {
      context.handle(
          _idChuTichMeta,
          idChuTich.isAcceptableOrUnknown(
              data['id_chu_tich']!, _idChuTichMeta));
    } else if (isInserting) {
      context.missing(_idChuTichMeta);
    }
    if (data.containsKey('id_thu_ky')) {
      context.handle(_idThuKyMeta,
          idThuKy.isAcceptableOrUnknown(data['id_thu_ky']!, _idThuKyMeta));
    } else if (isInserting) {
      context.missing(_idThuKyMeta);
    }
    if (data.containsKey('id_uy_vien1')) {
      context.handle(
          _idUyVien1Meta,
          idUyVien1.isAcceptableOrUnknown(
              data['id_uy_vien1']!, _idUyVien1Meta));
    } else if (isInserting) {
      context.missing(_idUyVien1Meta);
    }
    if (data.containsKey('id_uy_vien2')) {
      context.handle(
          _idUyVien2Meta,
          idUyVien2.isAcceptableOrUnknown(
              data['id_uy_vien2']!, _idUyVien2Meta));
    } else if (isInserting) {
      context.missing(_idUyVien2Meta);
    }
    if (data.containsKey('id_uy_vien3')) {
      context.handle(
          _idUyVien3Meta,
          idUyVien3.isAcceptableOrUnknown(
              data['id_uy_vien3']!, _idUyVien3Meta));
    } else if (isInserting) {
      context.missing(_idUyVien3Meta);
    }
    if (data.containsKey('tien_chu_tich')) {
      context.handle(
          _tienChuTichMeta,
          tienChuTich.isAcceptableOrUnknown(
              data['tien_chu_tich']!, _tienChuTichMeta));
    }
    if (data.containsKey('tien_thu_ky')) {
      context.handle(
          _tienThuKyMeta,
          tienThuKy.isAcceptableOrUnknown(
              data['tien_thu_ky']!, _tienThuKyMeta));
    }
    if (data.containsKey('tien_uy_vien')) {
      context.handle(
          _tienUyVienMeta,
          tienUyVien.isAcceptableOrUnknown(
              data['tien_uy_vien']!, _tienUyVienMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TieuBanXetTuyenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TieuBanXetTuyenData(
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_updated'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idChuTich: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_chu_tich'])!,
      idThuKy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_thu_ky'])!,
      idUyVien1: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_uy_vien1'])!,
      idUyVien2: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_uy_vien2'])!,
      idUyVien3: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_uy_vien3'])!,
      tienChuTich: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tien_chu_tich']),
      tienThuKy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tien_thu_ky']),
      tienUyVien: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tien_uy_vien']),
    );
  }

  @override
  $TieuBanXetTuyenTable createAlias(String alias) {
    return $TieuBanXetTuyenTable(attachedDatabase, alias);
  }
}

class TieuBanXetTuyenData extends DataClass
    implements Insertable<TieuBanXetTuyenData> {
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final int id;
  final int idChuTich;
  final int idThuKy;
  final int idUyVien1;
  final int idUyVien2;
  final int idUyVien3;
  final int? tienChuTich;
  final int? tienThuKy;
  final int? tienUyVien;
  const TieuBanXetTuyenData(
      {required this.dateCreated,
      required this.dateUpdated,
      required this.id,
      required this.idChuTich,
      required this.idThuKy,
      required this.idUyVien1,
      required this.idUyVien2,
      required this.idUyVien3,
      this.tienChuTich,
      this.tienThuKy,
      this.tienUyVien});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['date_updated'] = Variable<DateTime>(dateUpdated);
    map['id'] = Variable<int>(id);
    map['id_chu_tich'] = Variable<int>(idChuTich);
    map['id_thu_ky'] = Variable<int>(idThuKy);
    map['id_uy_vien1'] = Variable<int>(idUyVien1);
    map['id_uy_vien2'] = Variable<int>(idUyVien2);
    map['id_uy_vien3'] = Variable<int>(idUyVien3);
    if (!nullToAbsent || tienChuTich != null) {
      map['tien_chu_tich'] = Variable<int>(tienChuTich);
    }
    if (!nullToAbsent || tienThuKy != null) {
      map['tien_thu_ky'] = Variable<int>(tienThuKy);
    }
    if (!nullToAbsent || tienUyVien != null) {
      map['tien_uy_vien'] = Variable<int>(tienUyVien);
    }
    return map;
  }

  TieuBanXetTuyenCompanion toCompanion(bool nullToAbsent) {
    return TieuBanXetTuyenCompanion(
      dateCreated: Value(dateCreated),
      dateUpdated: Value(dateUpdated),
      id: Value(id),
      idChuTich: Value(idChuTich),
      idThuKy: Value(idThuKy),
      idUyVien1: Value(idUyVien1),
      idUyVien2: Value(idUyVien2),
      idUyVien3: Value(idUyVien3),
      tienChuTich: tienChuTich == null && nullToAbsent
          ? const Value.absent()
          : Value(tienChuTich),
      tienThuKy: tienThuKy == null && nullToAbsent
          ? const Value.absent()
          : Value(tienThuKy),
      tienUyVien: tienUyVien == null && nullToAbsent
          ? const Value.absent()
          : Value(tienUyVien),
    );
  }

  factory TieuBanXetTuyenData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TieuBanXetTuyenData(
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateUpdated: serializer.fromJson<DateTime>(json['dateUpdated']),
      id: serializer.fromJson<int>(json['id']),
      idChuTich: serializer.fromJson<int>(json['idChuTich']),
      idThuKy: serializer.fromJson<int>(json['idThuKy']),
      idUyVien1: serializer.fromJson<int>(json['idUyVien1']),
      idUyVien2: serializer.fromJson<int>(json['idUyVien2']),
      idUyVien3: serializer.fromJson<int>(json['idUyVien3']),
      tienChuTich: serializer.fromJson<int?>(json['tienChuTich']),
      tienThuKy: serializer.fromJson<int?>(json['tienThuKy']),
      tienUyVien: serializer.fromJson<int?>(json['tienUyVien']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateUpdated': serializer.toJson<DateTime>(dateUpdated),
      'id': serializer.toJson<int>(id),
      'idChuTich': serializer.toJson<int>(idChuTich),
      'idThuKy': serializer.toJson<int>(idThuKy),
      'idUyVien1': serializer.toJson<int>(idUyVien1),
      'idUyVien2': serializer.toJson<int>(idUyVien2),
      'idUyVien3': serializer.toJson<int>(idUyVien3),
      'tienChuTich': serializer.toJson<int?>(tienChuTich),
      'tienThuKy': serializer.toJson<int?>(tienThuKy),
      'tienUyVien': serializer.toJson<int?>(tienUyVien),
    };
  }

  TieuBanXetTuyenData copyWith(
          {DateTime? dateCreated,
          DateTime? dateUpdated,
          int? id,
          int? idChuTich,
          int? idThuKy,
          int? idUyVien1,
          int? idUyVien2,
          int? idUyVien3,
          Value<int?> tienChuTich = const Value.absent(),
          Value<int?> tienThuKy = const Value.absent(),
          Value<int?> tienUyVien = const Value.absent()}) =>
      TieuBanXetTuyenData(
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        id: id ?? this.id,
        idChuTich: idChuTich ?? this.idChuTich,
        idThuKy: idThuKy ?? this.idThuKy,
        idUyVien1: idUyVien1 ?? this.idUyVien1,
        idUyVien2: idUyVien2 ?? this.idUyVien2,
        idUyVien3: idUyVien3 ?? this.idUyVien3,
        tienChuTich: tienChuTich.present ? tienChuTich.value : this.tienChuTich,
        tienThuKy: tienThuKy.present ? tienThuKy.value : this.tienThuKy,
        tienUyVien: tienUyVien.present ? tienUyVien.value : this.tienUyVien,
      );
  TieuBanXetTuyenData copyWithCompanion(TieuBanXetTuyenCompanion data) {
    return TieuBanXetTuyenData(
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateUpdated:
          data.dateUpdated.present ? data.dateUpdated.value : this.dateUpdated,
      id: data.id.present ? data.id.value : this.id,
      idChuTich: data.idChuTich.present ? data.idChuTich.value : this.idChuTich,
      idThuKy: data.idThuKy.present ? data.idThuKy.value : this.idThuKy,
      idUyVien1: data.idUyVien1.present ? data.idUyVien1.value : this.idUyVien1,
      idUyVien2: data.idUyVien2.present ? data.idUyVien2.value : this.idUyVien2,
      idUyVien3: data.idUyVien3.present ? data.idUyVien3.value : this.idUyVien3,
      tienChuTich:
          data.tienChuTich.present ? data.tienChuTich.value : this.tienChuTich,
      tienThuKy: data.tienThuKy.present ? data.tienThuKy.value : this.tienThuKy,
      tienUyVien:
          data.tienUyVien.present ? data.tienUyVien.value : this.tienUyVien,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TieuBanXetTuyenData(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('idChuTich: $idChuTich, ')
          ..write('idThuKy: $idThuKy, ')
          ..write('idUyVien1: $idUyVien1, ')
          ..write('idUyVien2: $idUyVien2, ')
          ..write('idUyVien3: $idUyVien3, ')
          ..write('tienChuTich: $tienChuTich, ')
          ..write('tienThuKy: $tienThuKy, ')
          ..write('tienUyVien: $tienUyVien')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      dateCreated,
      dateUpdated,
      id,
      idChuTich,
      idThuKy,
      idUyVien1,
      idUyVien2,
      idUyVien3,
      tienChuTich,
      tienThuKy,
      tienUyVien);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TieuBanXetTuyenData &&
          other.dateCreated == this.dateCreated &&
          other.dateUpdated == this.dateUpdated &&
          other.id == this.id &&
          other.idChuTich == this.idChuTich &&
          other.idThuKy == this.idThuKy &&
          other.idUyVien1 == this.idUyVien1 &&
          other.idUyVien2 == this.idUyVien2 &&
          other.idUyVien3 == this.idUyVien3 &&
          other.tienChuTich == this.tienChuTich &&
          other.tienThuKy == this.tienThuKy &&
          other.tienUyVien == this.tienUyVien);
}

class TieuBanXetTuyenCompanion extends UpdateCompanion<TieuBanXetTuyenData> {
  final Value<DateTime> dateCreated;
  final Value<DateTime> dateUpdated;
  final Value<int> id;
  final Value<int> idChuTich;
  final Value<int> idThuKy;
  final Value<int> idUyVien1;
  final Value<int> idUyVien2;
  final Value<int> idUyVien3;
  final Value<int?> tienChuTich;
  final Value<int?> tienThuKy;
  final Value<int?> tienUyVien;
  const TieuBanXetTuyenCompanion({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    this.idChuTich = const Value.absent(),
    this.idThuKy = const Value.absent(),
    this.idUyVien1 = const Value.absent(),
    this.idUyVien2 = const Value.absent(),
    this.idUyVien3 = const Value.absent(),
    this.tienChuTich = const Value.absent(),
    this.tienThuKy = const Value.absent(),
    this.tienUyVien = const Value.absent(),
  });
  TieuBanXetTuyenCompanion.insert({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    required int idChuTich,
    required int idThuKy,
    required int idUyVien1,
    required int idUyVien2,
    required int idUyVien3,
    this.tienChuTich = const Value.absent(),
    this.tienThuKy = const Value.absent(),
    this.tienUyVien = const Value.absent(),
  })  : idChuTich = Value(idChuTich),
        idThuKy = Value(idThuKy),
        idUyVien1 = Value(idUyVien1),
        idUyVien2 = Value(idUyVien2),
        idUyVien3 = Value(idUyVien3);
  static Insertable<TieuBanXetTuyenData> custom({
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateUpdated,
    Expression<int>? id,
    Expression<int>? idChuTich,
    Expression<int>? idThuKy,
    Expression<int>? idUyVien1,
    Expression<int>? idUyVien2,
    Expression<int>? idUyVien3,
    Expression<int>? tienChuTich,
    Expression<int>? tienThuKy,
    Expression<int>? tienUyVien,
  }) {
    return RawValuesInsertable({
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateUpdated != null) 'date_updated': dateUpdated,
      if (id != null) 'id': id,
      if (idChuTich != null) 'id_chu_tich': idChuTich,
      if (idThuKy != null) 'id_thu_ky': idThuKy,
      if (idUyVien1 != null) 'id_uy_vien1': idUyVien1,
      if (idUyVien2 != null) 'id_uy_vien2': idUyVien2,
      if (idUyVien3 != null) 'id_uy_vien3': idUyVien3,
      if (tienChuTich != null) 'tien_chu_tich': tienChuTich,
      if (tienThuKy != null) 'tien_thu_ky': tienThuKy,
      if (tienUyVien != null) 'tien_uy_vien': tienUyVien,
    });
  }

  TieuBanXetTuyenCompanion copyWith(
      {Value<DateTime>? dateCreated,
      Value<DateTime>? dateUpdated,
      Value<int>? id,
      Value<int>? idChuTich,
      Value<int>? idThuKy,
      Value<int>? idUyVien1,
      Value<int>? idUyVien2,
      Value<int>? idUyVien3,
      Value<int?>? tienChuTich,
      Value<int?>? tienThuKy,
      Value<int?>? tienUyVien}) {
    return TieuBanXetTuyenCompanion(
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      id: id ?? this.id,
      idChuTich: idChuTich ?? this.idChuTich,
      idThuKy: idThuKy ?? this.idThuKy,
      idUyVien1: idUyVien1 ?? this.idUyVien1,
      idUyVien2: idUyVien2 ?? this.idUyVien2,
      idUyVien3: idUyVien3 ?? this.idUyVien3,
      tienChuTich: tienChuTich ?? this.tienChuTich,
      tienThuKy: tienThuKy ?? this.tienThuKy,
      tienUyVien: tienUyVien ?? this.tienUyVien,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateUpdated.present) {
      map['date_updated'] = Variable<DateTime>(dateUpdated.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idChuTich.present) {
      map['id_chu_tich'] = Variable<int>(idChuTich.value);
    }
    if (idThuKy.present) {
      map['id_thu_ky'] = Variable<int>(idThuKy.value);
    }
    if (idUyVien1.present) {
      map['id_uy_vien1'] = Variable<int>(idUyVien1.value);
    }
    if (idUyVien2.present) {
      map['id_uy_vien2'] = Variable<int>(idUyVien2.value);
    }
    if (idUyVien3.present) {
      map['id_uy_vien3'] = Variable<int>(idUyVien3.value);
    }
    if (tienChuTich.present) {
      map['tien_chu_tich'] = Variable<int>(tienChuTich.value);
    }
    if (tienThuKy.present) {
      map['tien_thu_ky'] = Variable<int>(tienThuKy.value);
    }
    if (tienUyVien.present) {
      map['tien_uy_vien'] = Variable<int>(tienUyVien.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TieuBanXetTuyenCompanion(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('idChuTich: $idChuTich, ')
          ..write('idThuKy: $idThuKy, ')
          ..write('idUyVien1: $idUyVien1, ')
          ..write('idUyVien2: $idUyVien2, ')
          ..write('idUyVien3: $idUyVien3, ')
          ..write('tienChuTich: $tienChuTich, ')
          ..write('tienThuKy: $tienThuKy, ')
          ..write('tienUyVien: $tienUyVien')
          ..write(')'))
        .toString();
  }
}

class $HocVienTable extends HocVien with TableInfo<$HocVienTable, HocVienData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HocVienTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _dateUpdatedMeta =
      const VerificationMeta('dateUpdated');
  @override
  late final GeneratedColumn<DateTime> dateUpdated = GeneratedColumn<DateTime>(
      'date_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idHoSoXetTuyenMeta =
      const VerificationMeta('idHoSoXetTuyen');
  @override
  late final GeneratedColumn<String> idHoSoXetTuyen = GeneratedColumn<String>(
      'id_ho_so_xet_tuyen', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nienKhoaMeta =
      const VerificationMeta('nienKhoa');
  @override
  late final GeneratedColumn<String> nienKhoa = GeneratedColumn<String>(
      'nien_khoa', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES nien_khoa (ten_nien_khoa)'));
  static const VerificationMeta _maHocVienMeta =
      const VerificationMeta('maHocVien');
  @override
  late final GeneratedColumn<String> maHocVien = GeneratedColumn<String>(
      'ma_hoc_vien', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _hoTenMeta = const VerificationMeta('hoTen');
  @override
  late final GeneratedColumn<String> hoTen = GeneratedColumn<String>(
      'ho_ten', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ngaySinhMeta =
      const VerificationMeta('ngaySinh');
  @override
  late final GeneratedColumn<DateTime> ngaySinh = GeneratedColumn<DateTime>(
      'ngay_sinh', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _gioiTinhMeta =
      const VerificationMeta('gioiTinh');
  @override
  late final GeneratedColumn<String> gioiTinh = GeneratedColumn<String>(
      'gioi_tinh', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noiSinhMeta =
      const VerificationMeta('noiSinh');
  @override
  late final GeneratedColumn<String> noiSinh = GeneratedColumn<String>(
      'noi_sinh', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sdtMeta = const VerificationMeta('sdt');
  @override
  late final GeneratedColumn<String> sdt = GeneratedColumn<String>(
      'sdt', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailHustMeta =
      const VerificationMeta('emailHust');
  @override
  late final GeneratedColumn<String> emailHust = GeneratedColumn<String>(
      'email_hust', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _truongTotNghiepDaiHocMeta =
      const VerificationMeta('truongTotNghiepDaiHoc');
  @override
  late final GeneratedColumn<String> truongTotNghiepDaiHoc =
      GeneratedColumn<String>('truong_tot_nghiep_dai_hoc', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nganhTotNghiepDaiHocMeta =
      const VerificationMeta('nganhTotNghiepDaiHoc');
  @override
  late final GeneratedColumn<String> nganhTotNghiepDaiHoc =
      GeneratedColumn<String>('nganh_tot_nghiep_dai_hoc', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _heTotNghiepDaiHocMeta =
      const VerificationMeta('heTotNghiepDaiHoc');
  @override
  late final GeneratedColumn<String> heTotNghiepDaiHoc =
      GeneratedColumn<String>('he_tot_nghiep_dai_hoc', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _xepLoaiTotNghiepDaiHocMeta =
      const VerificationMeta('xepLoaiTotNghiepDaiHoc');
  @override
  late final GeneratedColumn<String> xepLoaiTotNghiepDaiHoc =
      GeneratedColumn<String>('xep_loai_tot_nghiep_dai_hoc', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ngayTotNghiepDaiHocMeta =
      const VerificationMeta('ngayTotNghiepDaiHoc');
  @override
  late final GeneratedColumn<DateTime> ngayTotNghiepDaiHoc =
      GeneratedColumn<DateTime>('ngay_tot_nghiep_dai_hoc', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dinhHuongChuyenSauMeta =
      const VerificationMeta('dinhHuongChuyenSau');
  @override
  late final GeneratedColumn<String> dinhHuongChuyenSau =
      GeneratedColumn<String>('dinh_huong_chuyen_sau', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hocPhanDuocMienMeta =
      const VerificationMeta('hocPhanDuocMien');
  @override
  late final GeneratedColumn<String> hocPhanDuocMien = GeneratedColumn<String>(
      'hoc_phan_duoc_mien', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nganhDaoTaoThacSiMeta =
      const VerificationMeta('nganhDaoTaoThacSi');
  @override
  late final GeneratedColumn<String> nganhDaoTaoThacSi =
      GeneratedColumn<String>('nganh_dao_tao_thac_si', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _flagGiaHanLan1Meta =
      const VerificationMeta('flagGiaHanLan1');
  @override
  late final GeneratedColumn<bool> flagGiaHanLan1 = GeneratedColumn<bool>(
      'flag_gia_han_lan1', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("flag_gia_han_lan1" IN (0, 1))'),
      defaultValue: falseExpr);
  static const VerificationMeta _flagGiaHanLan2Meta =
      const VerificationMeta('flagGiaHanLan2');
  @override
  late final GeneratedColumn<bool> flagGiaHanLan2 = GeneratedColumn<bool>(
      'flag_gia_han_lan2', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("flag_gia_han_lan2" IN (0, 1))'),
      defaultValue: falseExpr);
  static const VerificationMeta _flagThanhToanXetTuyenMeta =
      const VerificationMeta('flagThanhToanXetTuyen');
  @override
  late final GeneratedColumn<bool> flagThanhToanXetTuyen =
      GeneratedColumn<bool>('flag_thanh_toan_xet_tuyen', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("flag_thanh_toan_xet_tuyen" IN (0, 1))'),
          defaultValue: falseExpr);
  @override
  late final GeneratedColumnWithTypeConverter<TrangThaiHocVien?, String>
      trangThai = GeneratedColumn<String>('trang_thai', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<TrangThaiHocVien?>($HocVienTable.$convertertrangThain);
  static const VerificationMeta _idTieuBanXetTuyenMeta =
      const VerificationMeta('idTieuBanXetTuyen');
  @override
  late final GeneratedColumn<int> idTieuBanXetTuyen = GeneratedColumn<int>(
      'id_tieu_ban_xet_tuyen', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES tieu_ban_xet_tuyen (id)'));
  static const VerificationMeta _idDienTuyenSinhMeta =
      const VerificationMeta('idDienTuyenSinh');
  @override
  late final GeneratedColumn<String> idDienTuyenSinh = GeneratedColumn<String>(
      'id_dien_tuyen_sinh', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        dateCreated,
        dateUpdated,
        id,
        idHoSoXetTuyen,
        nienKhoa,
        maHocVien,
        hoTen,
        ngaySinh,
        gioiTinh,
        noiSinh,
        sdt,
        email,
        emailHust,
        truongTotNghiepDaiHoc,
        nganhTotNghiepDaiHoc,
        heTotNghiepDaiHoc,
        xepLoaiTotNghiepDaiHoc,
        ngayTotNghiepDaiHoc,
        dinhHuongChuyenSau,
        hocPhanDuocMien,
        nganhDaoTaoThacSi,
        flagGiaHanLan1,
        flagGiaHanLan2,
        flagThanhToanXetTuyen,
        trangThai,
        idTieuBanXetTuyen,
        idDienTuyenSinh
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hoc_vien';
  @override
  VerificationContext validateIntegrity(Insertable<HocVienData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_updated')) {
      context.handle(
          _dateUpdatedMeta,
          dateUpdated.isAcceptableOrUnknown(
              data['date_updated']!, _dateUpdatedMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_ho_so_xet_tuyen')) {
      context.handle(
          _idHoSoXetTuyenMeta,
          idHoSoXetTuyen.isAcceptableOrUnknown(
              data['id_ho_so_xet_tuyen']!, _idHoSoXetTuyenMeta));
    }
    if (data.containsKey('nien_khoa')) {
      context.handle(_nienKhoaMeta,
          nienKhoa.isAcceptableOrUnknown(data['nien_khoa']!, _nienKhoaMeta));
    } else if (isInserting) {
      context.missing(_nienKhoaMeta);
    }
    if (data.containsKey('ma_hoc_vien')) {
      context.handle(
          _maHocVienMeta,
          maHocVien.isAcceptableOrUnknown(
              data['ma_hoc_vien']!, _maHocVienMeta));
    } else if (isInserting) {
      context.missing(_maHocVienMeta);
    }
    if (data.containsKey('ho_ten')) {
      context.handle(
          _hoTenMeta, hoTen.isAcceptableOrUnknown(data['ho_ten']!, _hoTenMeta));
    } else if (isInserting) {
      context.missing(_hoTenMeta);
    }
    if (data.containsKey('ngay_sinh')) {
      context.handle(_ngaySinhMeta,
          ngaySinh.isAcceptableOrUnknown(data['ngay_sinh']!, _ngaySinhMeta));
    }
    if (data.containsKey('gioi_tinh')) {
      context.handle(_gioiTinhMeta,
          gioiTinh.isAcceptableOrUnknown(data['gioi_tinh']!, _gioiTinhMeta));
    }
    if (data.containsKey('noi_sinh')) {
      context.handle(_noiSinhMeta,
          noiSinh.isAcceptableOrUnknown(data['noi_sinh']!, _noiSinhMeta));
    }
    if (data.containsKey('sdt')) {
      context.handle(
          _sdtMeta, sdt.isAcceptableOrUnknown(data['sdt']!, _sdtMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('email_hust')) {
      context.handle(_emailHustMeta,
          emailHust.isAcceptableOrUnknown(data['email_hust']!, _emailHustMeta));
    }
    if (data.containsKey('truong_tot_nghiep_dai_hoc')) {
      context.handle(
          _truongTotNghiepDaiHocMeta,
          truongTotNghiepDaiHoc.isAcceptableOrUnknown(
              data['truong_tot_nghiep_dai_hoc']!, _truongTotNghiepDaiHocMeta));
    }
    if (data.containsKey('nganh_tot_nghiep_dai_hoc')) {
      context.handle(
          _nganhTotNghiepDaiHocMeta,
          nganhTotNghiepDaiHoc.isAcceptableOrUnknown(
              data['nganh_tot_nghiep_dai_hoc']!, _nganhTotNghiepDaiHocMeta));
    }
    if (data.containsKey('he_tot_nghiep_dai_hoc')) {
      context.handle(
          _heTotNghiepDaiHocMeta,
          heTotNghiepDaiHoc.isAcceptableOrUnknown(
              data['he_tot_nghiep_dai_hoc']!, _heTotNghiepDaiHocMeta));
    }
    if (data.containsKey('xep_loai_tot_nghiep_dai_hoc')) {
      context.handle(
          _xepLoaiTotNghiepDaiHocMeta,
          xepLoaiTotNghiepDaiHoc.isAcceptableOrUnknown(
              data['xep_loai_tot_nghiep_dai_hoc']!,
              _xepLoaiTotNghiepDaiHocMeta));
    }
    if (data.containsKey('ngay_tot_nghiep_dai_hoc')) {
      context.handle(
          _ngayTotNghiepDaiHocMeta,
          ngayTotNghiepDaiHoc.isAcceptableOrUnknown(
              data['ngay_tot_nghiep_dai_hoc']!, _ngayTotNghiepDaiHocMeta));
    }
    if (data.containsKey('dinh_huong_chuyen_sau')) {
      context.handle(
          _dinhHuongChuyenSauMeta,
          dinhHuongChuyenSau.isAcceptableOrUnknown(
              data['dinh_huong_chuyen_sau']!, _dinhHuongChuyenSauMeta));
    }
    if (data.containsKey('hoc_phan_duoc_mien')) {
      context.handle(
          _hocPhanDuocMienMeta,
          hocPhanDuocMien.isAcceptableOrUnknown(
              data['hoc_phan_duoc_mien']!, _hocPhanDuocMienMeta));
    }
    if (data.containsKey('nganh_dao_tao_thac_si')) {
      context.handle(
          _nganhDaoTaoThacSiMeta,
          nganhDaoTaoThacSi.isAcceptableOrUnknown(
              data['nganh_dao_tao_thac_si']!, _nganhDaoTaoThacSiMeta));
    }
    if (data.containsKey('flag_gia_han_lan1')) {
      context.handle(
          _flagGiaHanLan1Meta,
          flagGiaHanLan1.isAcceptableOrUnknown(
              data['flag_gia_han_lan1']!, _flagGiaHanLan1Meta));
    }
    if (data.containsKey('flag_gia_han_lan2')) {
      context.handle(
          _flagGiaHanLan2Meta,
          flagGiaHanLan2.isAcceptableOrUnknown(
              data['flag_gia_han_lan2']!, _flagGiaHanLan2Meta));
    }
    if (data.containsKey('flag_thanh_toan_xet_tuyen')) {
      context.handle(
          _flagThanhToanXetTuyenMeta,
          flagThanhToanXetTuyen.isAcceptableOrUnknown(
              data['flag_thanh_toan_xet_tuyen']!, _flagThanhToanXetTuyenMeta));
    }
    if (data.containsKey('id_tieu_ban_xet_tuyen')) {
      context.handle(
          _idTieuBanXetTuyenMeta,
          idTieuBanXetTuyen.isAcceptableOrUnknown(
              data['id_tieu_ban_xet_tuyen']!, _idTieuBanXetTuyenMeta));
    }
    if (data.containsKey('id_dien_tuyen_sinh')) {
      context.handle(
          _idDienTuyenSinhMeta,
          idDienTuyenSinh.isAcceptableOrUnknown(
              data['id_dien_tuyen_sinh']!, _idDienTuyenSinhMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HocVienData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HocVienData(
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_updated'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idHoSoXetTuyen: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_ho_so_xet_tuyen']),
      nienKhoa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nien_khoa'])!,
      maHocVien: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ma_hoc_vien'])!,
      hoTen: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ho_ten'])!,
      ngaySinh: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ngay_sinh']),
      gioiTinh: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gioi_tinh']),
      noiSinh: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}noi_sinh']),
      sdt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sdt']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      emailHust: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email_hust']),
      truongTotNghiepDaiHoc: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}truong_tot_nghiep_dai_hoc']),
      nganhTotNghiepDaiHoc: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}nganh_tot_nghiep_dai_hoc']),
      heTotNghiepDaiHoc: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}he_tot_nghiep_dai_hoc']),
      xepLoaiTotNghiepDaiHoc: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}xep_loai_tot_nghiep_dai_hoc']),
      ngayTotNghiepDaiHoc: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}ngay_tot_nghiep_dai_hoc']),
      dinhHuongChuyenSau: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}dinh_huong_chuyen_sau']),
      hocPhanDuocMien: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}hoc_phan_duoc_mien']),
      nganhDaoTaoThacSi: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nganh_dao_tao_thac_si']),
      flagGiaHanLan1: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}flag_gia_han_lan1'])!,
      flagGiaHanLan2: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}flag_gia_han_lan2'])!,
      flagThanhToanXetTuyen: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}flag_thanh_toan_xet_tuyen'])!,
      trangThai: $HocVienTable.$convertertrangThain.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trang_thai'])),
      idTieuBanXetTuyen: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_tieu_ban_xet_tuyen']),
      idDienTuyenSinh: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_dien_tuyen_sinh']),
    );
  }

  @override
  $HocVienTable createAlias(String alias) {
    return $HocVienTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TrangThaiHocVien, String, String>
      $convertertrangThai =
      const EnumNameConverter<TrangThaiHocVien>(TrangThaiHocVien.values);
  static JsonTypeConverter2<TrangThaiHocVien?, String?, String?>
      $convertertrangThain = JsonTypeConverter2.asNullable($convertertrangThai);
}

class HocVienData extends DataClass implements Insertable<HocVienData> {
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final int id;
  final String? idHoSoXetTuyen;
  final String nienKhoa;
  final String maHocVien;
  final String hoTen;
  final DateTime? ngaySinh;
  final String? gioiTinh;
  final String? noiSinh;
  final String? sdt;
  final String? email;
  final String? emailHust;
  final String? truongTotNghiepDaiHoc;
  final String? nganhTotNghiepDaiHoc;
  final String? heTotNghiepDaiHoc;
  final String? xepLoaiTotNghiepDaiHoc;
  final DateTime? ngayTotNghiepDaiHoc;
  final String? dinhHuongChuyenSau;
  final String? hocPhanDuocMien;
  final String? nganhDaoTaoThacSi;
  final bool flagGiaHanLan1;
  final bool flagGiaHanLan2;
  final bool flagThanhToanXetTuyen;
  final TrangThaiHocVien? trangThai;
  final int? idTieuBanXetTuyen;
  final String? idDienTuyenSinh;
  const HocVienData(
      {required this.dateCreated,
      required this.dateUpdated,
      required this.id,
      this.idHoSoXetTuyen,
      required this.nienKhoa,
      required this.maHocVien,
      required this.hoTen,
      this.ngaySinh,
      this.gioiTinh,
      this.noiSinh,
      this.sdt,
      this.email,
      this.emailHust,
      this.truongTotNghiepDaiHoc,
      this.nganhTotNghiepDaiHoc,
      this.heTotNghiepDaiHoc,
      this.xepLoaiTotNghiepDaiHoc,
      this.ngayTotNghiepDaiHoc,
      this.dinhHuongChuyenSau,
      this.hocPhanDuocMien,
      this.nganhDaoTaoThacSi,
      required this.flagGiaHanLan1,
      required this.flagGiaHanLan2,
      required this.flagThanhToanXetTuyen,
      this.trangThai,
      this.idTieuBanXetTuyen,
      this.idDienTuyenSinh});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['date_updated'] = Variable<DateTime>(dateUpdated);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idHoSoXetTuyen != null) {
      map['id_ho_so_xet_tuyen'] = Variable<String>(idHoSoXetTuyen);
    }
    map['nien_khoa'] = Variable<String>(nienKhoa);
    map['ma_hoc_vien'] = Variable<String>(maHocVien);
    map['ho_ten'] = Variable<String>(hoTen);
    if (!nullToAbsent || ngaySinh != null) {
      map['ngay_sinh'] = Variable<DateTime>(ngaySinh);
    }
    if (!nullToAbsent || gioiTinh != null) {
      map['gioi_tinh'] = Variable<String>(gioiTinh);
    }
    if (!nullToAbsent || noiSinh != null) {
      map['noi_sinh'] = Variable<String>(noiSinh);
    }
    if (!nullToAbsent || sdt != null) {
      map['sdt'] = Variable<String>(sdt);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || emailHust != null) {
      map['email_hust'] = Variable<String>(emailHust);
    }
    if (!nullToAbsent || truongTotNghiepDaiHoc != null) {
      map['truong_tot_nghiep_dai_hoc'] =
          Variable<String>(truongTotNghiepDaiHoc);
    }
    if (!nullToAbsent || nganhTotNghiepDaiHoc != null) {
      map['nganh_tot_nghiep_dai_hoc'] = Variable<String>(nganhTotNghiepDaiHoc);
    }
    if (!nullToAbsent || heTotNghiepDaiHoc != null) {
      map['he_tot_nghiep_dai_hoc'] = Variable<String>(heTotNghiepDaiHoc);
    }
    if (!nullToAbsent || xepLoaiTotNghiepDaiHoc != null) {
      map['xep_loai_tot_nghiep_dai_hoc'] =
          Variable<String>(xepLoaiTotNghiepDaiHoc);
    }
    if (!nullToAbsent || ngayTotNghiepDaiHoc != null) {
      map['ngay_tot_nghiep_dai_hoc'] = Variable<DateTime>(ngayTotNghiepDaiHoc);
    }
    if (!nullToAbsent || dinhHuongChuyenSau != null) {
      map['dinh_huong_chuyen_sau'] = Variable<String>(dinhHuongChuyenSau);
    }
    if (!nullToAbsent || hocPhanDuocMien != null) {
      map['hoc_phan_duoc_mien'] = Variable<String>(hocPhanDuocMien);
    }
    if (!nullToAbsent || nganhDaoTaoThacSi != null) {
      map['nganh_dao_tao_thac_si'] = Variable<String>(nganhDaoTaoThacSi);
    }
    map['flag_gia_han_lan1'] = Variable<bool>(flagGiaHanLan1);
    map['flag_gia_han_lan2'] = Variable<bool>(flagGiaHanLan2);
    map['flag_thanh_toan_xet_tuyen'] = Variable<bool>(flagThanhToanXetTuyen);
    if (!nullToAbsent || trangThai != null) {
      map['trang_thai'] =
          Variable<String>($HocVienTable.$convertertrangThain.toSql(trangThai));
    }
    if (!nullToAbsent || idTieuBanXetTuyen != null) {
      map['id_tieu_ban_xet_tuyen'] = Variable<int>(idTieuBanXetTuyen);
    }
    if (!nullToAbsent || idDienTuyenSinh != null) {
      map['id_dien_tuyen_sinh'] = Variable<String>(idDienTuyenSinh);
    }
    return map;
  }

  HocVienCompanion toCompanion(bool nullToAbsent) {
    return HocVienCompanion(
      dateCreated: Value(dateCreated),
      dateUpdated: Value(dateUpdated),
      id: Value(id),
      idHoSoXetTuyen: idHoSoXetTuyen == null && nullToAbsent
          ? const Value.absent()
          : Value(idHoSoXetTuyen),
      nienKhoa: Value(nienKhoa),
      maHocVien: Value(maHocVien),
      hoTen: Value(hoTen),
      ngaySinh: ngaySinh == null && nullToAbsent
          ? const Value.absent()
          : Value(ngaySinh),
      gioiTinh: gioiTinh == null && nullToAbsent
          ? const Value.absent()
          : Value(gioiTinh),
      noiSinh: noiSinh == null && nullToAbsent
          ? const Value.absent()
          : Value(noiSinh),
      sdt: sdt == null && nullToAbsent ? const Value.absent() : Value(sdt),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      emailHust: emailHust == null && nullToAbsent
          ? const Value.absent()
          : Value(emailHust),
      truongTotNghiepDaiHoc: truongTotNghiepDaiHoc == null && nullToAbsent
          ? const Value.absent()
          : Value(truongTotNghiepDaiHoc),
      nganhTotNghiepDaiHoc: nganhTotNghiepDaiHoc == null && nullToAbsent
          ? const Value.absent()
          : Value(nganhTotNghiepDaiHoc),
      heTotNghiepDaiHoc: heTotNghiepDaiHoc == null && nullToAbsent
          ? const Value.absent()
          : Value(heTotNghiepDaiHoc),
      xepLoaiTotNghiepDaiHoc: xepLoaiTotNghiepDaiHoc == null && nullToAbsent
          ? const Value.absent()
          : Value(xepLoaiTotNghiepDaiHoc),
      ngayTotNghiepDaiHoc: ngayTotNghiepDaiHoc == null && nullToAbsent
          ? const Value.absent()
          : Value(ngayTotNghiepDaiHoc),
      dinhHuongChuyenSau: dinhHuongChuyenSau == null && nullToAbsent
          ? const Value.absent()
          : Value(dinhHuongChuyenSau),
      hocPhanDuocMien: hocPhanDuocMien == null && nullToAbsent
          ? const Value.absent()
          : Value(hocPhanDuocMien),
      nganhDaoTaoThacSi: nganhDaoTaoThacSi == null && nullToAbsent
          ? const Value.absent()
          : Value(nganhDaoTaoThacSi),
      flagGiaHanLan1: Value(flagGiaHanLan1),
      flagGiaHanLan2: Value(flagGiaHanLan2),
      flagThanhToanXetTuyen: Value(flagThanhToanXetTuyen),
      trangThai: trangThai == null && nullToAbsent
          ? const Value.absent()
          : Value(trangThai),
      idTieuBanXetTuyen: idTieuBanXetTuyen == null && nullToAbsent
          ? const Value.absent()
          : Value(idTieuBanXetTuyen),
      idDienTuyenSinh: idDienTuyenSinh == null && nullToAbsent
          ? const Value.absent()
          : Value(idDienTuyenSinh),
    );
  }

  factory HocVienData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HocVienData(
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateUpdated: serializer.fromJson<DateTime>(json['dateUpdated']),
      id: serializer.fromJson<int>(json['id']),
      idHoSoXetTuyen: serializer.fromJson<String?>(json['idHoSoXetTuyen']),
      nienKhoa: serializer.fromJson<String>(json['nienKhoa']),
      maHocVien: serializer.fromJson<String>(json['maHocVien']),
      hoTen: serializer.fromJson<String>(json['hoTen']),
      ngaySinh: serializer.fromJson<DateTime?>(json['ngaySinh']),
      gioiTinh: serializer.fromJson<String?>(json['gioiTinh']),
      noiSinh: serializer.fromJson<String?>(json['noiSinh']),
      sdt: serializer.fromJson<String?>(json['sdt']),
      email: serializer.fromJson<String?>(json['email']),
      emailHust: serializer.fromJson<String?>(json['emailHust']),
      truongTotNghiepDaiHoc:
          serializer.fromJson<String?>(json['truongTotNghiepDaiHoc']),
      nganhTotNghiepDaiHoc:
          serializer.fromJson<String?>(json['nganhTotNghiepDaiHoc']),
      heTotNghiepDaiHoc:
          serializer.fromJson<String?>(json['heTotNghiepDaiHoc']),
      xepLoaiTotNghiepDaiHoc:
          serializer.fromJson<String?>(json['xepLoaiTotNghiepDaiHoc']),
      ngayTotNghiepDaiHoc:
          serializer.fromJson<DateTime?>(json['ngayTotNghiepDaiHoc']),
      dinhHuongChuyenSau:
          serializer.fromJson<String?>(json['dinhHuongChuyenSau']),
      hocPhanDuocMien: serializer.fromJson<String?>(json['hocPhanDuocMien']),
      nganhDaoTaoThacSi:
          serializer.fromJson<String?>(json['nganhDaoTaoThacSi']),
      flagGiaHanLan1: serializer.fromJson<bool>(json['flagGiaHanLan1']),
      flagGiaHanLan2: serializer.fromJson<bool>(json['flagGiaHanLan2']),
      flagThanhToanXetTuyen:
          serializer.fromJson<bool>(json['flagThanhToanXetTuyen']),
      trangThai: $HocVienTable.$convertertrangThain
          .fromJson(serializer.fromJson<String?>(json['trangThai'])),
      idTieuBanXetTuyen: serializer.fromJson<int?>(json['idTieuBanXetTuyen']),
      idDienTuyenSinh: serializer.fromJson<String?>(json['idDienTuyenSinh']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateUpdated': serializer.toJson<DateTime>(dateUpdated),
      'id': serializer.toJson<int>(id),
      'idHoSoXetTuyen': serializer.toJson<String?>(idHoSoXetTuyen),
      'nienKhoa': serializer.toJson<String>(nienKhoa),
      'maHocVien': serializer.toJson<String>(maHocVien),
      'hoTen': serializer.toJson<String>(hoTen),
      'ngaySinh': serializer.toJson<DateTime?>(ngaySinh),
      'gioiTinh': serializer.toJson<String?>(gioiTinh),
      'noiSinh': serializer.toJson<String?>(noiSinh),
      'sdt': serializer.toJson<String?>(sdt),
      'email': serializer.toJson<String?>(email),
      'emailHust': serializer.toJson<String?>(emailHust),
      'truongTotNghiepDaiHoc':
          serializer.toJson<String?>(truongTotNghiepDaiHoc),
      'nganhTotNghiepDaiHoc': serializer.toJson<String?>(nganhTotNghiepDaiHoc),
      'heTotNghiepDaiHoc': serializer.toJson<String?>(heTotNghiepDaiHoc),
      'xepLoaiTotNghiepDaiHoc':
          serializer.toJson<String?>(xepLoaiTotNghiepDaiHoc),
      'ngayTotNghiepDaiHoc': serializer.toJson<DateTime?>(ngayTotNghiepDaiHoc),
      'dinhHuongChuyenSau': serializer.toJson<String?>(dinhHuongChuyenSau),
      'hocPhanDuocMien': serializer.toJson<String?>(hocPhanDuocMien),
      'nganhDaoTaoThacSi': serializer.toJson<String?>(nganhDaoTaoThacSi),
      'flagGiaHanLan1': serializer.toJson<bool>(flagGiaHanLan1),
      'flagGiaHanLan2': serializer.toJson<bool>(flagGiaHanLan2),
      'flagThanhToanXetTuyen': serializer.toJson<bool>(flagThanhToanXetTuyen),
      'trangThai': serializer.toJson<String?>(
          $HocVienTable.$convertertrangThain.toJson(trangThai)),
      'idTieuBanXetTuyen': serializer.toJson<int?>(idTieuBanXetTuyen),
      'idDienTuyenSinh': serializer.toJson<String?>(idDienTuyenSinh),
    };
  }

  HocVienData copyWith(
          {DateTime? dateCreated,
          DateTime? dateUpdated,
          int? id,
          Value<String?> idHoSoXetTuyen = const Value.absent(),
          String? nienKhoa,
          String? maHocVien,
          String? hoTen,
          Value<DateTime?> ngaySinh = const Value.absent(),
          Value<String?> gioiTinh = const Value.absent(),
          Value<String?> noiSinh = const Value.absent(),
          Value<String?> sdt = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> emailHust = const Value.absent(),
          Value<String?> truongTotNghiepDaiHoc = const Value.absent(),
          Value<String?> nganhTotNghiepDaiHoc = const Value.absent(),
          Value<String?> heTotNghiepDaiHoc = const Value.absent(),
          Value<String?> xepLoaiTotNghiepDaiHoc = const Value.absent(),
          Value<DateTime?> ngayTotNghiepDaiHoc = const Value.absent(),
          Value<String?> dinhHuongChuyenSau = const Value.absent(),
          Value<String?> hocPhanDuocMien = const Value.absent(),
          Value<String?> nganhDaoTaoThacSi = const Value.absent(),
          bool? flagGiaHanLan1,
          bool? flagGiaHanLan2,
          bool? flagThanhToanXetTuyen,
          Value<TrangThaiHocVien?> trangThai = const Value.absent(),
          Value<int?> idTieuBanXetTuyen = const Value.absent(),
          Value<String?> idDienTuyenSinh = const Value.absent()}) =>
      HocVienData(
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        id: id ?? this.id,
        idHoSoXetTuyen:
            idHoSoXetTuyen.present ? idHoSoXetTuyen.value : this.idHoSoXetTuyen,
        nienKhoa: nienKhoa ?? this.nienKhoa,
        maHocVien: maHocVien ?? this.maHocVien,
        hoTen: hoTen ?? this.hoTen,
        ngaySinh: ngaySinh.present ? ngaySinh.value : this.ngaySinh,
        gioiTinh: gioiTinh.present ? gioiTinh.value : this.gioiTinh,
        noiSinh: noiSinh.present ? noiSinh.value : this.noiSinh,
        sdt: sdt.present ? sdt.value : this.sdt,
        email: email.present ? email.value : this.email,
        emailHust: emailHust.present ? emailHust.value : this.emailHust,
        truongTotNghiepDaiHoc: truongTotNghiepDaiHoc.present
            ? truongTotNghiepDaiHoc.value
            : this.truongTotNghiepDaiHoc,
        nganhTotNghiepDaiHoc: nganhTotNghiepDaiHoc.present
            ? nganhTotNghiepDaiHoc.value
            : this.nganhTotNghiepDaiHoc,
        heTotNghiepDaiHoc: heTotNghiepDaiHoc.present
            ? heTotNghiepDaiHoc.value
            : this.heTotNghiepDaiHoc,
        xepLoaiTotNghiepDaiHoc: xepLoaiTotNghiepDaiHoc.present
            ? xepLoaiTotNghiepDaiHoc.value
            : this.xepLoaiTotNghiepDaiHoc,
        ngayTotNghiepDaiHoc: ngayTotNghiepDaiHoc.present
            ? ngayTotNghiepDaiHoc.value
            : this.ngayTotNghiepDaiHoc,
        dinhHuongChuyenSau: dinhHuongChuyenSau.present
            ? dinhHuongChuyenSau.value
            : this.dinhHuongChuyenSau,
        hocPhanDuocMien: hocPhanDuocMien.present
            ? hocPhanDuocMien.value
            : this.hocPhanDuocMien,
        nganhDaoTaoThacSi: nganhDaoTaoThacSi.present
            ? nganhDaoTaoThacSi.value
            : this.nganhDaoTaoThacSi,
        flagGiaHanLan1: flagGiaHanLan1 ?? this.flagGiaHanLan1,
        flagGiaHanLan2: flagGiaHanLan2 ?? this.flagGiaHanLan2,
        flagThanhToanXetTuyen:
            flagThanhToanXetTuyen ?? this.flagThanhToanXetTuyen,
        trangThai: trangThai.present ? trangThai.value : this.trangThai,
        idTieuBanXetTuyen: idTieuBanXetTuyen.present
            ? idTieuBanXetTuyen.value
            : this.idTieuBanXetTuyen,
        idDienTuyenSinh: idDienTuyenSinh.present
            ? idDienTuyenSinh.value
            : this.idDienTuyenSinh,
      );
  HocVienData copyWithCompanion(HocVienCompanion data) {
    return HocVienData(
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateUpdated:
          data.dateUpdated.present ? data.dateUpdated.value : this.dateUpdated,
      id: data.id.present ? data.id.value : this.id,
      idHoSoXetTuyen: data.idHoSoXetTuyen.present
          ? data.idHoSoXetTuyen.value
          : this.idHoSoXetTuyen,
      nienKhoa: data.nienKhoa.present ? data.nienKhoa.value : this.nienKhoa,
      maHocVien: data.maHocVien.present ? data.maHocVien.value : this.maHocVien,
      hoTen: data.hoTen.present ? data.hoTen.value : this.hoTen,
      ngaySinh: data.ngaySinh.present ? data.ngaySinh.value : this.ngaySinh,
      gioiTinh: data.gioiTinh.present ? data.gioiTinh.value : this.gioiTinh,
      noiSinh: data.noiSinh.present ? data.noiSinh.value : this.noiSinh,
      sdt: data.sdt.present ? data.sdt.value : this.sdt,
      email: data.email.present ? data.email.value : this.email,
      emailHust: data.emailHust.present ? data.emailHust.value : this.emailHust,
      truongTotNghiepDaiHoc: data.truongTotNghiepDaiHoc.present
          ? data.truongTotNghiepDaiHoc.value
          : this.truongTotNghiepDaiHoc,
      nganhTotNghiepDaiHoc: data.nganhTotNghiepDaiHoc.present
          ? data.nganhTotNghiepDaiHoc.value
          : this.nganhTotNghiepDaiHoc,
      heTotNghiepDaiHoc: data.heTotNghiepDaiHoc.present
          ? data.heTotNghiepDaiHoc.value
          : this.heTotNghiepDaiHoc,
      xepLoaiTotNghiepDaiHoc: data.xepLoaiTotNghiepDaiHoc.present
          ? data.xepLoaiTotNghiepDaiHoc.value
          : this.xepLoaiTotNghiepDaiHoc,
      ngayTotNghiepDaiHoc: data.ngayTotNghiepDaiHoc.present
          ? data.ngayTotNghiepDaiHoc.value
          : this.ngayTotNghiepDaiHoc,
      dinhHuongChuyenSau: data.dinhHuongChuyenSau.present
          ? data.dinhHuongChuyenSau.value
          : this.dinhHuongChuyenSau,
      hocPhanDuocMien: data.hocPhanDuocMien.present
          ? data.hocPhanDuocMien.value
          : this.hocPhanDuocMien,
      nganhDaoTaoThacSi: data.nganhDaoTaoThacSi.present
          ? data.nganhDaoTaoThacSi.value
          : this.nganhDaoTaoThacSi,
      flagGiaHanLan1: data.flagGiaHanLan1.present
          ? data.flagGiaHanLan1.value
          : this.flagGiaHanLan1,
      flagGiaHanLan2: data.flagGiaHanLan2.present
          ? data.flagGiaHanLan2.value
          : this.flagGiaHanLan2,
      flagThanhToanXetTuyen: data.flagThanhToanXetTuyen.present
          ? data.flagThanhToanXetTuyen.value
          : this.flagThanhToanXetTuyen,
      trangThai: data.trangThai.present ? data.trangThai.value : this.trangThai,
      idTieuBanXetTuyen: data.idTieuBanXetTuyen.present
          ? data.idTieuBanXetTuyen.value
          : this.idTieuBanXetTuyen,
      idDienTuyenSinh: data.idDienTuyenSinh.present
          ? data.idDienTuyenSinh.value
          : this.idDienTuyenSinh,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HocVienData(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('idHoSoXetTuyen: $idHoSoXetTuyen, ')
          ..write('nienKhoa: $nienKhoa, ')
          ..write('maHocVien: $maHocVien, ')
          ..write('hoTen: $hoTen, ')
          ..write('ngaySinh: $ngaySinh, ')
          ..write('gioiTinh: $gioiTinh, ')
          ..write('noiSinh: $noiSinh, ')
          ..write('sdt: $sdt, ')
          ..write('email: $email, ')
          ..write('emailHust: $emailHust, ')
          ..write('truongTotNghiepDaiHoc: $truongTotNghiepDaiHoc, ')
          ..write('nganhTotNghiepDaiHoc: $nganhTotNghiepDaiHoc, ')
          ..write('heTotNghiepDaiHoc: $heTotNghiepDaiHoc, ')
          ..write('xepLoaiTotNghiepDaiHoc: $xepLoaiTotNghiepDaiHoc, ')
          ..write('ngayTotNghiepDaiHoc: $ngayTotNghiepDaiHoc, ')
          ..write('dinhHuongChuyenSau: $dinhHuongChuyenSau, ')
          ..write('hocPhanDuocMien: $hocPhanDuocMien, ')
          ..write('nganhDaoTaoThacSi: $nganhDaoTaoThacSi, ')
          ..write('flagGiaHanLan1: $flagGiaHanLan1, ')
          ..write('flagGiaHanLan2: $flagGiaHanLan2, ')
          ..write('flagThanhToanXetTuyen: $flagThanhToanXetTuyen, ')
          ..write('trangThai: $trangThai, ')
          ..write('idTieuBanXetTuyen: $idTieuBanXetTuyen, ')
          ..write('idDienTuyenSinh: $idDienTuyenSinh')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        dateCreated,
        dateUpdated,
        id,
        idHoSoXetTuyen,
        nienKhoa,
        maHocVien,
        hoTen,
        ngaySinh,
        gioiTinh,
        noiSinh,
        sdt,
        email,
        emailHust,
        truongTotNghiepDaiHoc,
        nganhTotNghiepDaiHoc,
        heTotNghiepDaiHoc,
        xepLoaiTotNghiepDaiHoc,
        ngayTotNghiepDaiHoc,
        dinhHuongChuyenSau,
        hocPhanDuocMien,
        nganhDaoTaoThacSi,
        flagGiaHanLan1,
        flagGiaHanLan2,
        flagThanhToanXetTuyen,
        trangThai,
        idTieuBanXetTuyen,
        idDienTuyenSinh
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HocVienData &&
          other.dateCreated == this.dateCreated &&
          other.dateUpdated == this.dateUpdated &&
          other.id == this.id &&
          other.idHoSoXetTuyen == this.idHoSoXetTuyen &&
          other.nienKhoa == this.nienKhoa &&
          other.maHocVien == this.maHocVien &&
          other.hoTen == this.hoTen &&
          other.ngaySinh == this.ngaySinh &&
          other.gioiTinh == this.gioiTinh &&
          other.noiSinh == this.noiSinh &&
          other.sdt == this.sdt &&
          other.email == this.email &&
          other.emailHust == this.emailHust &&
          other.truongTotNghiepDaiHoc == this.truongTotNghiepDaiHoc &&
          other.nganhTotNghiepDaiHoc == this.nganhTotNghiepDaiHoc &&
          other.heTotNghiepDaiHoc == this.heTotNghiepDaiHoc &&
          other.xepLoaiTotNghiepDaiHoc == this.xepLoaiTotNghiepDaiHoc &&
          other.ngayTotNghiepDaiHoc == this.ngayTotNghiepDaiHoc &&
          other.dinhHuongChuyenSau == this.dinhHuongChuyenSau &&
          other.hocPhanDuocMien == this.hocPhanDuocMien &&
          other.nganhDaoTaoThacSi == this.nganhDaoTaoThacSi &&
          other.flagGiaHanLan1 == this.flagGiaHanLan1 &&
          other.flagGiaHanLan2 == this.flagGiaHanLan2 &&
          other.flagThanhToanXetTuyen == this.flagThanhToanXetTuyen &&
          other.trangThai == this.trangThai &&
          other.idTieuBanXetTuyen == this.idTieuBanXetTuyen &&
          other.idDienTuyenSinh == this.idDienTuyenSinh);
}

class HocVienCompanion extends UpdateCompanion<HocVienData> {
  final Value<DateTime> dateCreated;
  final Value<DateTime> dateUpdated;
  final Value<int> id;
  final Value<String?> idHoSoXetTuyen;
  final Value<String> nienKhoa;
  final Value<String> maHocVien;
  final Value<String> hoTen;
  final Value<DateTime?> ngaySinh;
  final Value<String?> gioiTinh;
  final Value<String?> noiSinh;
  final Value<String?> sdt;
  final Value<String?> email;
  final Value<String?> emailHust;
  final Value<String?> truongTotNghiepDaiHoc;
  final Value<String?> nganhTotNghiepDaiHoc;
  final Value<String?> heTotNghiepDaiHoc;
  final Value<String?> xepLoaiTotNghiepDaiHoc;
  final Value<DateTime?> ngayTotNghiepDaiHoc;
  final Value<String?> dinhHuongChuyenSau;
  final Value<String?> hocPhanDuocMien;
  final Value<String?> nganhDaoTaoThacSi;
  final Value<bool> flagGiaHanLan1;
  final Value<bool> flagGiaHanLan2;
  final Value<bool> flagThanhToanXetTuyen;
  final Value<TrangThaiHocVien?> trangThai;
  final Value<int?> idTieuBanXetTuyen;
  final Value<String?> idDienTuyenSinh;
  const HocVienCompanion({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    this.idHoSoXetTuyen = const Value.absent(),
    this.nienKhoa = const Value.absent(),
    this.maHocVien = const Value.absent(),
    this.hoTen = const Value.absent(),
    this.ngaySinh = const Value.absent(),
    this.gioiTinh = const Value.absent(),
    this.noiSinh = const Value.absent(),
    this.sdt = const Value.absent(),
    this.email = const Value.absent(),
    this.emailHust = const Value.absent(),
    this.truongTotNghiepDaiHoc = const Value.absent(),
    this.nganhTotNghiepDaiHoc = const Value.absent(),
    this.heTotNghiepDaiHoc = const Value.absent(),
    this.xepLoaiTotNghiepDaiHoc = const Value.absent(),
    this.ngayTotNghiepDaiHoc = const Value.absent(),
    this.dinhHuongChuyenSau = const Value.absent(),
    this.hocPhanDuocMien = const Value.absent(),
    this.nganhDaoTaoThacSi = const Value.absent(),
    this.flagGiaHanLan1 = const Value.absent(),
    this.flagGiaHanLan2 = const Value.absent(),
    this.flagThanhToanXetTuyen = const Value.absent(),
    this.trangThai = const Value.absent(),
    this.idTieuBanXetTuyen = const Value.absent(),
    this.idDienTuyenSinh = const Value.absent(),
  });
  HocVienCompanion.insert({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    this.idHoSoXetTuyen = const Value.absent(),
    required String nienKhoa,
    required String maHocVien,
    required String hoTen,
    this.ngaySinh = const Value.absent(),
    this.gioiTinh = const Value.absent(),
    this.noiSinh = const Value.absent(),
    this.sdt = const Value.absent(),
    this.email = const Value.absent(),
    this.emailHust = const Value.absent(),
    this.truongTotNghiepDaiHoc = const Value.absent(),
    this.nganhTotNghiepDaiHoc = const Value.absent(),
    this.heTotNghiepDaiHoc = const Value.absent(),
    this.xepLoaiTotNghiepDaiHoc = const Value.absent(),
    this.ngayTotNghiepDaiHoc = const Value.absent(),
    this.dinhHuongChuyenSau = const Value.absent(),
    this.hocPhanDuocMien = const Value.absent(),
    this.nganhDaoTaoThacSi = const Value.absent(),
    this.flagGiaHanLan1 = const Value.absent(),
    this.flagGiaHanLan2 = const Value.absent(),
    this.flagThanhToanXetTuyen = const Value.absent(),
    this.trangThai = const Value.absent(),
    this.idTieuBanXetTuyen = const Value.absent(),
    this.idDienTuyenSinh = const Value.absent(),
  })  : nienKhoa = Value(nienKhoa),
        maHocVien = Value(maHocVien),
        hoTen = Value(hoTen);
  static Insertable<HocVienData> custom({
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateUpdated,
    Expression<int>? id,
    Expression<String>? idHoSoXetTuyen,
    Expression<String>? nienKhoa,
    Expression<String>? maHocVien,
    Expression<String>? hoTen,
    Expression<DateTime>? ngaySinh,
    Expression<String>? gioiTinh,
    Expression<String>? noiSinh,
    Expression<String>? sdt,
    Expression<String>? email,
    Expression<String>? emailHust,
    Expression<String>? truongTotNghiepDaiHoc,
    Expression<String>? nganhTotNghiepDaiHoc,
    Expression<String>? heTotNghiepDaiHoc,
    Expression<String>? xepLoaiTotNghiepDaiHoc,
    Expression<DateTime>? ngayTotNghiepDaiHoc,
    Expression<String>? dinhHuongChuyenSau,
    Expression<String>? hocPhanDuocMien,
    Expression<String>? nganhDaoTaoThacSi,
    Expression<bool>? flagGiaHanLan1,
    Expression<bool>? flagGiaHanLan2,
    Expression<bool>? flagThanhToanXetTuyen,
    Expression<String>? trangThai,
    Expression<int>? idTieuBanXetTuyen,
    Expression<String>? idDienTuyenSinh,
  }) {
    return RawValuesInsertable({
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateUpdated != null) 'date_updated': dateUpdated,
      if (id != null) 'id': id,
      if (idHoSoXetTuyen != null) 'id_ho_so_xet_tuyen': idHoSoXetTuyen,
      if (nienKhoa != null) 'nien_khoa': nienKhoa,
      if (maHocVien != null) 'ma_hoc_vien': maHocVien,
      if (hoTen != null) 'ho_ten': hoTen,
      if (ngaySinh != null) 'ngay_sinh': ngaySinh,
      if (gioiTinh != null) 'gioi_tinh': gioiTinh,
      if (noiSinh != null) 'noi_sinh': noiSinh,
      if (sdt != null) 'sdt': sdt,
      if (email != null) 'email': email,
      if (emailHust != null) 'email_hust': emailHust,
      if (truongTotNghiepDaiHoc != null)
        'truong_tot_nghiep_dai_hoc': truongTotNghiepDaiHoc,
      if (nganhTotNghiepDaiHoc != null)
        'nganh_tot_nghiep_dai_hoc': nganhTotNghiepDaiHoc,
      if (heTotNghiepDaiHoc != null) 'he_tot_nghiep_dai_hoc': heTotNghiepDaiHoc,
      if (xepLoaiTotNghiepDaiHoc != null)
        'xep_loai_tot_nghiep_dai_hoc': xepLoaiTotNghiepDaiHoc,
      if (ngayTotNghiepDaiHoc != null)
        'ngay_tot_nghiep_dai_hoc': ngayTotNghiepDaiHoc,
      if (dinhHuongChuyenSau != null)
        'dinh_huong_chuyen_sau': dinhHuongChuyenSau,
      if (hocPhanDuocMien != null) 'hoc_phan_duoc_mien': hocPhanDuocMien,
      if (nganhDaoTaoThacSi != null) 'nganh_dao_tao_thac_si': nganhDaoTaoThacSi,
      if (flagGiaHanLan1 != null) 'flag_gia_han_lan1': flagGiaHanLan1,
      if (flagGiaHanLan2 != null) 'flag_gia_han_lan2': flagGiaHanLan2,
      if (flagThanhToanXetTuyen != null)
        'flag_thanh_toan_xet_tuyen': flagThanhToanXetTuyen,
      if (trangThai != null) 'trang_thai': trangThai,
      if (idTieuBanXetTuyen != null) 'id_tieu_ban_xet_tuyen': idTieuBanXetTuyen,
      if (idDienTuyenSinh != null) 'id_dien_tuyen_sinh': idDienTuyenSinh,
    });
  }

  HocVienCompanion copyWith(
      {Value<DateTime>? dateCreated,
      Value<DateTime>? dateUpdated,
      Value<int>? id,
      Value<String?>? idHoSoXetTuyen,
      Value<String>? nienKhoa,
      Value<String>? maHocVien,
      Value<String>? hoTen,
      Value<DateTime?>? ngaySinh,
      Value<String?>? gioiTinh,
      Value<String?>? noiSinh,
      Value<String?>? sdt,
      Value<String?>? email,
      Value<String?>? emailHust,
      Value<String?>? truongTotNghiepDaiHoc,
      Value<String?>? nganhTotNghiepDaiHoc,
      Value<String?>? heTotNghiepDaiHoc,
      Value<String?>? xepLoaiTotNghiepDaiHoc,
      Value<DateTime?>? ngayTotNghiepDaiHoc,
      Value<String?>? dinhHuongChuyenSau,
      Value<String?>? hocPhanDuocMien,
      Value<String?>? nganhDaoTaoThacSi,
      Value<bool>? flagGiaHanLan1,
      Value<bool>? flagGiaHanLan2,
      Value<bool>? flagThanhToanXetTuyen,
      Value<TrangThaiHocVien?>? trangThai,
      Value<int?>? idTieuBanXetTuyen,
      Value<String?>? idDienTuyenSinh}) {
    return HocVienCompanion(
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      id: id ?? this.id,
      idHoSoXetTuyen: idHoSoXetTuyen ?? this.idHoSoXetTuyen,
      nienKhoa: nienKhoa ?? this.nienKhoa,
      maHocVien: maHocVien ?? this.maHocVien,
      hoTen: hoTen ?? this.hoTen,
      ngaySinh: ngaySinh ?? this.ngaySinh,
      gioiTinh: gioiTinh ?? this.gioiTinh,
      noiSinh: noiSinh ?? this.noiSinh,
      sdt: sdt ?? this.sdt,
      email: email ?? this.email,
      emailHust: emailHust ?? this.emailHust,
      truongTotNghiepDaiHoc:
          truongTotNghiepDaiHoc ?? this.truongTotNghiepDaiHoc,
      nganhTotNghiepDaiHoc: nganhTotNghiepDaiHoc ?? this.nganhTotNghiepDaiHoc,
      heTotNghiepDaiHoc: heTotNghiepDaiHoc ?? this.heTotNghiepDaiHoc,
      xepLoaiTotNghiepDaiHoc:
          xepLoaiTotNghiepDaiHoc ?? this.xepLoaiTotNghiepDaiHoc,
      ngayTotNghiepDaiHoc: ngayTotNghiepDaiHoc ?? this.ngayTotNghiepDaiHoc,
      dinhHuongChuyenSau: dinhHuongChuyenSau ?? this.dinhHuongChuyenSau,
      hocPhanDuocMien: hocPhanDuocMien ?? this.hocPhanDuocMien,
      nganhDaoTaoThacSi: nganhDaoTaoThacSi ?? this.nganhDaoTaoThacSi,
      flagGiaHanLan1: flagGiaHanLan1 ?? this.flagGiaHanLan1,
      flagGiaHanLan2: flagGiaHanLan2 ?? this.flagGiaHanLan2,
      flagThanhToanXetTuyen:
          flagThanhToanXetTuyen ?? this.flagThanhToanXetTuyen,
      trangThai: trangThai ?? this.trangThai,
      idTieuBanXetTuyen: idTieuBanXetTuyen ?? this.idTieuBanXetTuyen,
      idDienTuyenSinh: idDienTuyenSinh ?? this.idDienTuyenSinh,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateUpdated.present) {
      map['date_updated'] = Variable<DateTime>(dateUpdated.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idHoSoXetTuyen.present) {
      map['id_ho_so_xet_tuyen'] = Variable<String>(idHoSoXetTuyen.value);
    }
    if (nienKhoa.present) {
      map['nien_khoa'] = Variable<String>(nienKhoa.value);
    }
    if (maHocVien.present) {
      map['ma_hoc_vien'] = Variable<String>(maHocVien.value);
    }
    if (hoTen.present) {
      map['ho_ten'] = Variable<String>(hoTen.value);
    }
    if (ngaySinh.present) {
      map['ngay_sinh'] = Variable<DateTime>(ngaySinh.value);
    }
    if (gioiTinh.present) {
      map['gioi_tinh'] = Variable<String>(gioiTinh.value);
    }
    if (noiSinh.present) {
      map['noi_sinh'] = Variable<String>(noiSinh.value);
    }
    if (sdt.present) {
      map['sdt'] = Variable<String>(sdt.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (emailHust.present) {
      map['email_hust'] = Variable<String>(emailHust.value);
    }
    if (truongTotNghiepDaiHoc.present) {
      map['truong_tot_nghiep_dai_hoc'] =
          Variable<String>(truongTotNghiepDaiHoc.value);
    }
    if (nganhTotNghiepDaiHoc.present) {
      map['nganh_tot_nghiep_dai_hoc'] =
          Variable<String>(nganhTotNghiepDaiHoc.value);
    }
    if (heTotNghiepDaiHoc.present) {
      map['he_tot_nghiep_dai_hoc'] = Variable<String>(heTotNghiepDaiHoc.value);
    }
    if (xepLoaiTotNghiepDaiHoc.present) {
      map['xep_loai_tot_nghiep_dai_hoc'] =
          Variable<String>(xepLoaiTotNghiepDaiHoc.value);
    }
    if (ngayTotNghiepDaiHoc.present) {
      map['ngay_tot_nghiep_dai_hoc'] =
          Variable<DateTime>(ngayTotNghiepDaiHoc.value);
    }
    if (dinhHuongChuyenSau.present) {
      map['dinh_huong_chuyen_sau'] = Variable<String>(dinhHuongChuyenSau.value);
    }
    if (hocPhanDuocMien.present) {
      map['hoc_phan_duoc_mien'] = Variable<String>(hocPhanDuocMien.value);
    }
    if (nganhDaoTaoThacSi.present) {
      map['nganh_dao_tao_thac_si'] = Variable<String>(nganhDaoTaoThacSi.value);
    }
    if (flagGiaHanLan1.present) {
      map['flag_gia_han_lan1'] = Variable<bool>(flagGiaHanLan1.value);
    }
    if (flagGiaHanLan2.present) {
      map['flag_gia_han_lan2'] = Variable<bool>(flagGiaHanLan2.value);
    }
    if (flagThanhToanXetTuyen.present) {
      map['flag_thanh_toan_xet_tuyen'] =
          Variable<bool>(flagThanhToanXetTuyen.value);
    }
    if (trangThai.present) {
      map['trang_thai'] = Variable<String>(
          $HocVienTable.$convertertrangThain.toSql(trangThai.value));
    }
    if (idTieuBanXetTuyen.present) {
      map['id_tieu_ban_xet_tuyen'] = Variable<int>(idTieuBanXetTuyen.value);
    }
    if (idDienTuyenSinh.present) {
      map['id_dien_tuyen_sinh'] = Variable<String>(idDienTuyenSinh.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HocVienCompanion(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('idHoSoXetTuyen: $idHoSoXetTuyen, ')
          ..write('nienKhoa: $nienKhoa, ')
          ..write('maHocVien: $maHocVien, ')
          ..write('hoTen: $hoTen, ')
          ..write('ngaySinh: $ngaySinh, ')
          ..write('gioiTinh: $gioiTinh, ')
          ..write('noiSinh: $noiSinh, ')
          ..write('sdt: $sdt, ')
          ..write('email: $email, ')
          ..write('emailHust: $emailHust, ')
          ..write('truongTotNghiepDaiHoc: $truongTotNghiepDaiHoc, ')
          ..write('nganhTotNghiepDaiHoc: $nganhTotNghiepDaiHoc, ')
          ..write('heTotNghiepDaiHoc: $heTotNghiepDaiHoc, ')
          ..write('xepLoaiTotNghiepDaiHoc: $xepLoaiTotNghiepDaiHoc, ')
          ..write('ngayTotNghiepDaiHoc: $ngayTotNghiepDaiHoc, ')
          ..write('dinhHuongChuyenSau: $dinhHuongChuyenSau, ')
          ..write('hocPhanDuocMien: $hocPhanDuocMien, ')
          ..write('nganhDaoTaoThacSi: $nganhDaoTaoThacSi, ')
          ..write('flagGiaHanLan1: $flagGiaHanLan1, ')
          ..write('flagGiaHanLan2: $flagGiaHanLan2, ')
          ..write('flagThanhToanXetTuyen: $flagThanhToanXetTuyen, ')
          ..write('trangThai: $trangThai, ')
          ..write('idTieuBanXetTuyen: $idTieuBanXetTuyen, ')
          ..write('idDienTuyenSinh: $idDienTuyenSinh')
          ..write(')'))
        .toString();
  }
}

class $DeTaiThacSiTable extends DeTaiThacSi
    with TableInfo<$DeTaiThacSiTable, DeTaiThacSiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeTaiThacSiTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idGiangVienMeta =
      const VerificationMeta('idGiangVien');
  @override
  late final GeneratedColumn<int> idGiangVien = GeneratedColumn<int>(
      'id_giang_vien', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _tenTiengVietMeta =
      const VerificationMeta('tenTiengViet');
  @override
  late final GeneratedColumn<String> tenTiengViet = GeneratedColumn<String>(
      'ten_tieng_viet', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tenTiengAnhMeta =
      const VerificationMeta('tenTiengAnh');
  @override
  late final GeneratedColumn<String> tenTiengAnh = GeneratedColumn<String>(
      'ten_tieng_anh', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ghiChuMeta = const VerificationMeta('ghiChu');
  @override
  late final GeneratedColumn<String> ghiChu = GeneratedColumn<String>(
      'ghi_chu', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _idHocVienMeta =
      const VerificationMeta('idHocVien');
  @override
  late final GeneratedColumn<int> idHocVien = GeneratedColumn<int>(
      'id_hoc_vien', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES hoc_vien (id)'));
  static const VerificationMeta _ngayGiaoMeta =
      const VerificationMeta('ngayGiao');
  @override
  late final GeneratedColumn<DateTime> ngayGiao = GeneratedColumn<DateTime>(
      'ngay_giao', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _soQdGiaoMeta =
      const VerificationMeta('soQdGiao');
  @override
  late final GeneratedColumn<String> soQdGiao = GeneratedColumn<String>(
      'so_qd_giao', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hanBaoVeMeta =
      const VerificationMeta('hanBaoVe');
  @override
  late final GeneratedColumn<DateTime> hanBaoVe = GeneratedColumn<DateTime>(
      'han_bao_ve', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _soQdBaoVeMeta =
      const VerificationMeta('soQdBaoVe');
  @override
  late final GeneratedColumn<String> soQdBaoVe = GeneratedColumn<String>(
      'so_qd_bao_ve', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ngayBaoVeMeta =
      const VerificationMeta('ngayBaoVe');
  @override
  late final GeneratedColumn<DateTime> ngayBaoVe = GeneratedColumn<DateTime>(
      'ngay_bao_ve', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _idChuTichMeta =
      const VerificationMeta('idChuTich');
  @override
  late final GeneratedColumn<int> idChuTich = GeneratedColumn<int>(
      'id_chu_tich', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _idPhanBien1Meta =
      const VerificationMeta('idPhanBien1');
  @override
  late final GeneratedColumn<int> idPhanBien1 = GeneratedColumn<int>(
      'id_phan_bien1', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _idPhanBien2Meta =
      const VerificationMeta('idPhanBien2');
  @override
  late final GeneratedColumn<int> idPhanBien2 = GeneratedColumn<int>(
      'id_phan_bien2', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _idUyVienMeta =
      const VerificationMeta('idUyVien');
  @override
  late final GeneratedColumn<int> idUyVien = GeneratedColumn<int>(
      'id_uy_vien', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _idThuKyMeta =
      const VerificationMeta('idThuKy');
  @override
  late final GeneratedColumn<int> idThuKy = GeneratedColumn<int>(
      'id_thu_ky', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _namBaoVeMeta =
      const VerificationMeta('namBaoVe');
  @override
  late final GeneratedColumn<int> namBaoVe = GeneratedColumn<int>(
      'nam_bao_ve', aliasedName, true,
      generatedAs: GeneratedAs(ngayBaoVe.year, true),
      type: DriftSqlType.int,
      requiredDuringInsert: false);
  static const VerificationMeta _flagGiaoDeTaiMeta =
      const VerificationMeta('flagGiaoDeTai');
  @override
  late final GeneratedColumn<bool> flagGiaoDeTai = GeneratedColumn<bool>(
      'flag_giao_de_tai', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("flag_giao_de_tai" IN (0, 1))'),
      defaultValue: falseExpr);
  static const VerificationMeta _flagThanhToanMeta =
      const VerificationMeta('flagThanhToan');
  @override
  late final GeneratedColumn<bool> flagThanhToan = GeneratedColumn<bool>(
      'flag_thanh_toan', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("flag_thanh_toan" IN (0, 1))'),
      defaultValue: falseExpr);
  static const VerificationMeta _flagDangKyBaoVeMeta =
      const VerificationMeta('flagDangKyBaoVe');
  @override
  late final GeneratedColumn<bool> flagDangKyBaoVe = GeneratedColumn<bool>(
      'flag_dang_ky_bao_ve', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("flag_dang_ky_bao_ve" IN (0, 1))'),
      defaultValue: falseExpr);
  static const VerificationMeta _flagNopHoSoMeta =
      const VerificationMeta('flagNopHoSo');
  @override
  late final GeneratedColumn<bool> flagNopHoSo = GeneratedColumn<bool>(
      'flag_nop_ho_so', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("flag_nop_ho_so" IN (0, 1))'),
      defaultValue: falseExpr);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idGiangVien,
        tenTiengViet,
        tenTiengAnh,
        ghiChu,
        idHocVien,
        ngayGiao,
        soQdGiao,
        hanBaoVe,
        soQdBaoVe,
        ngayBaoVe,
        idChuTich,
        idPhanBien1,
        idPhanBien2,
        idUyVien,
        idThuKy,
        namBaoVe,
        flagGiaoDeTai,
        flagThanhToan,
        flagDangKyBaoVe,
        flagNopHoSo
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'de_tai_thac_si';
  @override
  VerificationContext validateIntegrity(Insertable<DeTaiThacSiData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_giang_vien')) {
      context.handle(
          _idGiangVienMeta,
          idGiangVien.isAcceptableOrUnknown(
              data['id_giang_vien']!, _idGiangVienMeta));
    } else if (isInserting) {
      context.missing(_idGiangVienMeta);
    }
    if (data.containsKey('ten_tieng_viet')) {
      context.handle(
          _tenTiengVietMeta,
          tenTiengViet.isAcceptableOrUnknown(
              data['ten_tieng_viet']!, _tenTiengVietMeta));
    } else if (isInserting) {
      context.missing(_tenTiengVietMeta);
    }
    if (data.containsKey('ten_tieng_anh')) {
      context.handle(
          _tenTiengAnhMeta,
          tenTiengAnh.isAcceptableOrUnknown(
              data['ten_tieng_anh']!, _tenTiengAnhMeta));
    } else if (isInserting) {
      context.missing(_tenTiengAnhMeta);
    }
    if (data.containsKey('ghi_chu')) {
      context.handle(_ghiChuMeta,
          ghiChu.isAcceptableOrUnknown(data['ghi_chu']!, _ghiChuMeta));
    }
    if (data.containsKey('id_hoc_vien')) {
      context.handle(
          _idHocVienMeta,
          idHocVien.isAcceptableOrUnknown(
              data['id_hoc_vien']!, _idHocVienMeta));
    }
    if (data.containsKey('ngay_giao')) {
      context.handle(_ngayGiaoMeta,
          ngayGiao.isAcceptableOrUnknown(data['ngay_giao']!, _ngayGiaoMeta));
    }
    if (data.containsKey('so_qd_giao')) {
      context.handle(_soQdGiaoMeta,
          soQdGiao.isAcceptableOrUnknown(data['so_qd_giao']!, _soQdGiaoMeta));
    }
    if (data.containsKey('han_bao_ve')) {
      context.handle(_hanBaoVeMeta,
          hanBaoVe.isAcceptableOrUnknown(data['han_bao_ve']!, _hanBaoVeMeta));
    }
    if (data.containsKey('so_qd_bao_ve')) {
      context.handle(
          _soQdBaoVeMeta,
          soQdBaoVe.isAcceptableOrUnknown(
              data['so_qd_bao_ve']!, _soQdBaoVeMeta));
    }
    if (data.containsKey('ngay_bao_ve')) {
      context.handle(
          _ngayBaoVeMeta,
          ngayBaoVe.isAcceptableOrUnknown(
              data['ngay_bao_ve']!, _ngayBaoVeMeta));
    }
    if (data.containsKey('id_chu_tich')) {
      context.handle(
          _idChuTichMeta,
          idChuTich.isAcceptableOrUnknown(
              data['id_chu_tich']!, _idChuTichMeta));
    }
    if (data.containsKey('id_phan_bien1')) {
      context.handle(
          _idPhanBien1Meta,
          idPhanBien1.isAcceptableOrUnknown(
              data['id_phan_bien1']!, _idPhanBien1Meta));
    }
    if (data.containsKey('id_phan_bien2')) {
      context.handle(
          _idPhanBien2Meta,
          idPhanBien2.isAcceptableOrUnknown(
              data['id_phan_bien2']!, _idPhanBien2Meta));
    }
    if (data.containsKey('id_uy_vien')) {
      context.handle(_idUyVienMeta,
          idUyVien.isAcceptableOrUnknown(data['id_uy_vien']!, _idUyVienMeta));
    }
    if (data.containsKey('id_thu_ky')) {
      context.handle(_idThuKyMeta,
          idThuKy.isAcceptableOrUnknown(data['id_thu_ky']!, _idThuKyMeta));
    }
    if (data.containsKey('nam_bao_ve')) {
      context.handle(_namBaoVeMeta,
          namBaoVe.isAcceptableOrUnknown(data['nam_bao_ve']!, _namBaoVeMeta));
    }
    if (data.containsKey('flag_giao_de_tai')) {
      context.handle(
          _flagGiaoDeTaiMeta,
          flagGiaoDeTai.isAcceptableOrUnknown(
              data['flag_giao_de_tai']!, _flagGiaoDeTaiMeta));
    }
    if (data.containsKey('flag_thanh_toan')) {
      context.handle(
          _flagThanhToanMeta,
          flagThanhToan.isAcceptableOrUnknown(
              data['flag_thanh_toan']!, _flagThanhToanMeta));
    }
    if (data.containsKey('flag_dang_ky_bao_ve')) {
      context.handle(
          _flagDangKyBaoVeMeta,
          flagDangKyBaoVe.isAcceptableOrUnknown(
              data['flag_dang_ky_bao_ve']!, _flagDangKyBaoVeMeta));
    }
    if (data.containsKey('flag_nop_ho_so')) {
      context.handle(
          _flagNopHoSoMeta,
          flagNopHoSo.isAcceptableOrUnknown(
              data['flag_nop_ho_so']!, _flagNopHoSoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeTaiThacSiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeTaiThacSiData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idGiangVien: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_giang_vien'])!,
      tenTiengViet: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ten_tieng_viet'])!,
      tenTiengAnh: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ten_tieng_anh'])!,
      ghiChu: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ghi_chu'])!,
      idHocVien: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_hoc_vien']),
      ngayGiao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ngay_giao']),
      soQdGiao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}so_qd_giao']),
      hanBaoVe: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}han_bao_ve']),
      soQdBaoVe: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}so_qd_bao_ve']),
      ngayBaoVe: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ngay_bao_ve']),
      idChuTich: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_chu_tich']),
      idPhanBien1: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_phan_bien1']),
      idPhanBien2: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_phan_bien2']),
      idUyVien: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_uy_vien']),
      idThuKy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_thu_ky']),
      namBaoVe: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nam_bao_ve']),
      flagGiaoDeTai: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}flag_giao_de_tai'])!,
      flagThanhToan: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}flag_thanh_toan'])!,
      flagDangKyBaoVe: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}flag_dang_ky_bao_ve'])!,
      flagNopHoSo: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}flag_nop_ho_so'])!,
    );
  }

  @override
  $DeTaiThacSiTable createAlias(String alias) {
    return $DeTaiThacSiTable(attachedDatabase, alias);
  }
}

class DeTaiThacSiData extends DataClass implements Insertable<DeTaiThacSiData> {
  final int id;
  final int idGiangVien;
  final String tenTiengViet;
  final String tenTiengAnh;
  final String ghiChu;
  final int? idHocVien;
  final DateTime? ngayGiao;
  final String? soQdGiao;
  final DateTime? hanBaoVe;
  final String? soQdBaoVe;
  final DateTime? ngayBaoVe;
  final int? idChuTich;
  final int? idPhanBien1;
  final int? idPhanBien2;
  final int? idUyVien;
  final int? idThuKy;
  final int? namBaoVe;
  final bool flagGiaoDeTai;
  final bool flagThanhToan;
  final bool flagDangKyBaoVe;
  final bool flagNopHoSo;
  const DeTaiThacSiData(
      {required this.id,
      required this.idGiangVien,
      required this.tenTiengViet,
      required this.tenTiengAnh,
      required this.ghiChu,
      this.idHocVien,
      this.ngayGiao,
      this.soQdGiao,
      this.hanBaoVe,
      this.soQdBaoVe,
      this.ngayBaoVe,
      this.idChuTich,
      this.idPhanBien1,
      this.idPhanBien2,
      this.idUyVien,
      this.idThuKy,
      this.namBaoVe,
      required this.flagGiaoDeTai,
      required this.flagThanhToan,
      required this.flagDangKyBaoVe,
      required this.flagNopHoSo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_giang_vien'] = Variable<int>(idGiangVien);
    map['ten_tieng_viet'] = Variable<String>(tenTiengViet);
    map['ten_tieng_anh'] = Variable<String>(tenTiengAnh);
    map['ghi_chu'] = Variable<String>(ghiChu);
    if (!nullToAbsent || idHocVien != null) {
      map['id_hoc_vien'] = Variable<int>(idHocVien);
    }
    if (!nullToAbsent || ngayGiao != null) {
      map['ngay_giao'] = Variable<DateTime>(ngayGiao);
    }
    if (!nullToAbsent || soQdGiao != null) {
      map['so_qd_giao'] = Variable<String>(soQdGiao);
    }
    if (!nullToAbsent || hanBaoVe != null) {
      map['han_bao_ve'] = Variable<DateTime>(hanBaoVe);
    }
    if (!nullToAbsent || soQdBaoVe != null) {
      map['so_qd_bao_ve'] = Variable<String>(soQdBaoVe);
    }
    if (!nullToAbsent || ngayBaoVe != null) {
      map['ngay_bao_ve'] = Variable<DateTime>(ngayBaoVe);
    }
    if (!nullToAbsent || idChuTich != null) {
      map['id_chu_tich'] = Variable<int>(idChuTich);
    }
    if (!nullToAbsent || idPhanBien1 != null) {
      map['id_phan_bien1'] = Variable<int>(idPhanBien1);
    }
    if (!nullToAbsent || idPhanBien2 != null) {
      map['id_phan_bien2'] = Variable<int>(idPhanBien2);
    }
    if (!nullToAbsent || idUyVien != null) {
      map['id_uy_vien'] = Variable<int>(idUyVien);
    }
    if (!nullToAbsent || idThuKy != null) {
      map['id_thu_ky'] = Variable<int>(idThuKy);
    }
    map['flag_giao_de_tai'] = Variable<bool>(flagGiaoDeTai);
    map['flag_thanh_toan'] = Variable<bool>(flagThanhToan);
    map['flag_dang_ky_bao_ve'] = Variable<bool>(flagDangKyBaoVe);
    map['flag_nop_ho_so'] = Variable<bool>(flagNopHoSo);
    return map;
  }

  DeTaiThacSiCompanion toCompanion(bool nullToAbsent) {
    return DeTaiThacSiCompanion(
      id: Value(id),
      idGiangVien: Value(idGiangVien),
      tenTiengViet: Value(tenTiengViet),
      tenTiengAnh: Value(tenTiengAnh),
      ghiChu: Value(ghiChu),
      idHocVien: idHocVien == null && nullToAbsent
          ? const Value.absent()
          : Value(idHocVien),
      ngayGiao: ngayGiao == null && nullToAbsent
          ? const Value.absent()
          : Value(ngayGiao),
      soQdGiao: soQdGiao == null && nullToAbsent
          ? const Value.absent()
          : Value(soQdGiao),
      hanBaoVe: hanBaoVe == null && nullToAbsent
          ? const Value.absent()
          : Value(hanBaoVe),
      soQdBaoVe: soQdBaoVe == null && nullToAbsent
          ? const Value.absent()
          : Value(soQdBaoVe),
      ngayBaoVe: ngayBaoVe == null && nullToAbsent
          ? const Value.absent()
          : Value(ngayBaoVe),
      idChuTich: idChuTich == null && nullToAbsent
          ? const Value.absent()
          : Value(idChuTich),
      idPhanBien1: idPhanBien1 == null && nullToAbsent
          ? const Value.absent()
          : Value(idPhanBien1),
      idPhanBien2: idPhanBien2 == null && nullToAbsent
          ? const Value.absent()
          : Value(idPhanBien2),
      idUyVien: idUyVien == null && nullToAbsent
          ? const Value.absent()
          : Value(idUyVien),
      idThuKy: idThuKy == null && nullToAbsent
          ? const Value.absent()
          : Value(idThuKy),
      flagGiaoDeTai: Value(flagGiaoDeTai),
      flagThanhToan: Value(flagThanhToan),
      flagDangKyBaoVe: Value(flagDangKyBaoVe),
      flagNopHoSo: Value(flagNopHoSo),
    );
  }

  factory DeTaiThacSiData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeTaiThacSiData(
      id: serializer.fromJson<int>(json['id']),
      idGiangVien: serializer.fromJson<int>(json['idGiangVien']),
      tenTiengViet: serializer.fromJson<String>(json['tenTiengViet']),
      tenTiengAnh: serializer.fromJson<String>(json['tenTiengAnh']),
      ghiChu: serializer.fromJson<String>(json['ghiChu']),
      idHocVien: serializer.fromJson<int?>(json['idHocVien']),
      ngayGiao: serializer.fromJson<DateTime?>(json['ngayGiao']),
      soQdGiao: serializer.fromJson<String?>(json['soQdGiao']),
      hanBaoVe: serializer.fromJson<DateTime?>(json['hanBaoVe']),
      soQdBaoVe: serializer.fromJson<String?>(json['soQdBaoVe']),
      ngayBaoVe: serializer.fromJson<DateTime?>(json['ngayBaoVe']),
      idChuTich: serializer.fromJson<int?>(json['idChuTich']),
      idPhanBien1: serializer.fromJson<int?>(json['idPhanBien1']),
      idPhanBien2: serializer.fromJson<int?>(json['idPhanBien2']),
      idUyVien: serializer.fromJson<int?>(json['idUyVien']),
      idThuKy: serializer.fromJson<int?>(json['idThuKy']),
      namBaoVe: serializer.fromJson<int?>(json['namBaoVe']),
      flagGiaoDeTai: serializer.fromJson<bool>(json['flagGiaoDeTai']),
      flagThanhToan: serializer.fromJson<bool>(json['flagThanhToan']),
      flagDangKyBaoVe: serializer.fromJson<bool>(json['flagDangKyBaoVe']),
      flagNopHoSo: serializer.fromJson<bool>(json['flagNopHoSo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idGiangVien': serializer.toJson<int>(idGiangVien),
      'tenTiengViet': serializer.toJson<String>(tenTiengViet),
      'tenTiengAnh': serializer.toJson<String>(tenTiengAnh),
      'ghiChu': serializer.toJson<String>(ghiChu),
      'idHocVien': serializer.toJson<int?>(idHocVien),
      'ngayGiao': serializer.toJson<DateTime?>(ngayGiao),
      'soQdGiao': serializer.toJson<String?>(soQdGiao),
      'hanBaoVe': serializer.toJson<DateTime?>(hanBaoVe),
      'soQdBaoVe': serializer.toJson<String?>(soQdBaoVe),
      'ngayBaoVe': serializer.toJson<DateTime?>(ngayBaoVe),
      'idChuTich': serializer.toJson<int?>(idChuTich),
      'idPhanBien1': serializer.toJson<int?>(idPhanBien1),
      'idPhanBien2': serializer.toJson<int?>(idPhanBien2),
      'idUyVien': serializer.toJson<int?>(idUyVien),
      'idThuKy': serializer.toJson<int?>(idThuKy),
      'namBaoVe': serializer.toJson<int?>(namBaoVe),
      'flagGiaoDeTai': serializer.toJson<bool>(flagGiaoDeTai),
      'flagThanhToan': serializer.toJson<bool>(flagThanhToan),
      'flagDangKyBaoVe': serializer.toJson<bool>(flagDangKyBaoVe),
      'flagNopHoSo': serializer.toJson<bool>(flagNopHoSo),
    };
  }

  DeTaiThacSiData copyWith(
          {int? id,
          int? idGiangVien,
          String? tenTiengViet,
          String? tenTiengAnh,
          String? ghiChu,
          Value<int?> idHocVien = const Value.absent(),
          Value<DateTime?> ngayGiao = const Value.absent(),
          Value<String?> soQdGiao = const Value.absent(),
          Value<DateTime?> hanBaoVe = const Value.absent(),
          Value<String?> soQdBaoVe = const Value.absent(),
          Value<DateTime?> ngayBaoVe = const Value.absent(),
          Value<int?> idChuTich = const Value.absent(),
          Value<int?> idPhanBien1 = const Value.absent(),
          Value<int?> idPhanBien2 = const Value.absent(),
          Value<int?> idUyVien = const Value.absent(),
          Value<int?> idThuKy = const Value.absent(),
          Value<int?> namBaoVe = const Value.absent(),
          bool? flagGiaoDeTai,
          bool? flagThanhToan,
          bool? flagDangKyBaoVe,
          bool? flagNopHoSo}) =>
      DeTaiThacSiData(
        id: id ?? this.id,
        idGiangVien: idGiangVien ?? this.idGiangVien,
        tenTiengViet: tenTiengViet ?? this.tenTiengViet,
        tenTiengAnh: tenTiengAnh ?? this.tenTiengAnh,
        ghiChu: ghiChu ?? this.ghiChu,
        idHocVien: idHocVien.present ? idHocVien.value : this.idHocVien,
        ngayGiao: ngayGiao.present ? ngayGiao.value : this.ngayGiao,
        soQdGiao: soQdGiao.present ? soQdGiao.value : this.soQdGiao,
        hanBaoVe: hanBaoVe.present ? hanBaoVe.value : this.hanBaoVe,
        soQdBaoVe: soQdBaoVe.present ? soQdBaoVe.value : this.soQdBaoVe,
        ngayBaoVe: ngayBaoVe.present ? ngayBaoVe.value : this.ngayBaoVe,
        idChuTich: idChuTich.present ? idChuTich.value : this.idChuTich,
        idPhanBien1: idPhanBien1.present ? idPhanBien1.value : this.idPhanBien1,
        idPhanBien2: idPhanBien2.present ? idPhanBien2.value : this.idPhanBien2,
        idUyVien: idUyVien.present ? idUyVien.value : this.idUyVien,
        idThuKy: idThuKy.present ? idThuKy.value : this.idThuKy,
        namBaoVe: namBaoVe.present ? namBaoVe.value : this.namBaoVe,
        flagGiaoDeTai: flagGiaoDeTai ?? this.flagGiaoDeTai,
        flagThanhToan: flagThanhToan ?? this.flagThanhToan,
        flagDangKyBaoVe: flagDangKyBaoVe ?? this.flagDangKyBaoVe,
        flagNopHoSo: flagNopHoSo ?? this.flagNopHoSo,
      );
  @override
  String toString() {
    return (StringBuffer('DeTaiThacSiData(')
          ..write('id: $id, ')
          ..write('idGiangVien: $idGiangVien, ')
          ..write('tenTiengViet: $tenTiengViet, ')
          ..write('tenTiengAnh: $tenTiengAnh, ')
          ..write('ghiChu: $ghiChu, ')
          ..write('idHocVien: $idHocVien, ')
          ..write('ngayGiao: $ngayGiao, ')
          ..write('soQdGiao: $soQdGiao, ')
          ..write('hanBaoVe: $hanBaoVe, ')
          ..write('soQdBaoVe: $soQdBaoVe, ')
          ..write('ngayBaoVe: $ngayBaoVe, ')
          ..write('idChuTich: $idChuTich, ')
          ..write('idPhanBien1: $idPhanBien1, ')
          ..write('idPhanBien2: $idPhanBien2, ')
          ..write('idUyVien: $idUyVien, ')
          ..write('idThuKy: $idThuKy, ')
          ..write('namBaoVe: $namBaoVe, ')
          ..write('flagGiaoDeTai: $flagGiaoDeTai, ')
          ..write('flagThanhToan: $flagThanhToan, ')
          ..write('flagDangKyBaoVe: $flagDangKyBaoVe, ')
          ..write('flagNopHoSo: $flagNopHoSo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        idGiangVien,
        tenTiengViet,
        tenTiengAnh,
        ghiChu,
        idHocVien,
        ngayGiao,
        soQdGiao,
        hanBaoVe,
        soQdBaoVe,
        ngayBaoVe,
        idChuTich,
        idPhanBien1,
        idPhanBien2,
        idUyVien,
        idThuKy,
        namBaoVe,
        flagGiaoDeTai,
        flagThanhToan,
        flagDangKyBaoVe,
        flagNopHoSo
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeTaiThacSiData &&
          other.id == this.id &&
          other.idGiangVien == this.idGiangVien &&
          other.tenTiengViet == this.tenTiengViet &&
          other.tenTiengAnh == this.tenTiengAnh &&
          other.ghiChu == this.ghiChu &&
          other.idHocVien == this.idHocVien &&
          other.ngayGiao == this.ngayGiao &&
          other.soQdGiao == this.soQdGiao &&
          other.hanBaoVe == this.hanBaoVe &&
          other.soQdBaoVe == this.soQdBaoVe &&
          other.ngayBaoVe == this.ngayBaoVe &&
          other.idChuTich == this.idChuTich &&
          other.idPhanBien1 == this.idPhanBien1 &&
          other.idPhanBien2 == this.idPhanBien2 &&
          other.idUyVien == this.idUyVien &&
          other.idThuKy == this.idThuKy &&
          other.namBaoVe == this.namBaoVe &&
          other.flagGiaoDeTai == this.flagGiaoDeTai &&
          other.flagThanhToan == this.flagThanhToan &&
          other.flagDangKyBaoVe == this.flagDangKyBaoVe &&
          other.flagNopHoSo == this.flagNopHoSo);
}

class DeTaiThacSiCompanion extends UpdateCompanion<DeTaiThacSiData> {
  final Value<int> id;
  final Value<int> idGiangVien;
  final Value<String> tenTiengViet;
  final Value<String> tenTiengAnh;
  final Value<String> ghiChu;
  final Value<int?> idHocVien;
  final Value<DateTime?> ngayGiao;
  final Value<String?> soQdGiao;
  final Value<DateTime?> hanBaoVe;
  final Value<String?> soQdBaoVe;
  final Value<DateTime?> ngayBaoVe;
  final Value<int?> idChuTich;
  final Value<int?> idPhanBien1;
  final Value<int?> idPhanBien2;
  final Value<int?> idUyVien;
  final Value<int?> idThuKy;
  final Value<bool> flagGiaoDeTai;
  final Value<bool> flagThanhToan;
  final Value<bool> flagDangKyBaoVe;
  final Value<bool> flagNopHoSo;
  const DeTaiThacSiCompanion({
    this.id = const Value.absent(),
    this.idGiangVien = const Value.absent(),
    this.tenTiengViet = const Value.absent(),
    this.tenTiengAnh = const Value.absent(),
    this.ghiChu = const Value.absent(),
    this.idHocVien = const Value.absent(),
    this.ngayGiao = const Value.absent(),
    this.soQdGiao = const Value.absent(),
    this.hanBaoVe = const Value.absent(),
    this.soQdBaoVe = const Value.absent(),
    this.ngayBaoVe = const Value.absent(),
    this.idChuTich = const Value.absent(),
    this.idPhanBien1 = const Value.absent(),
    this.idPhanBien2 = const Value.absent(),
    this.idUyVien = const Value.absent(),
    this.idThuKy = const Value.absent(),
    this.flagGiaoDeTai = const Value.absent(),
    this.flagThanhToan = const Value.absent(),
    this.flagDangKyBaoVe = const Value.absent(),
    this.flagNopHoSo = const Value.absent(),
  });
  DeTaiThacSiCompanion.insert({
    this.id = const Value.absent(),
    required int idGiangVien,
    required String tenTiengViet,
    required String tenTiengAnh,
    this.ghiChu = const Value.absent(),
    this.idHocVien = const Value.absent(),
    this.ngayGiao = const Value.absent(),
    this.soQdGiao = const Value.absent(),
    this.hanBaoVe = const Value.absent(),
    this.soQdBaoVe = const Value.absent(),
    this.ngayBaoVe = const Value.absent(),
    this.idChuTich = const Value.absent(),
    this.idPhanBien1 = const Value.absent(),
    this.idPhanBien2 = const Value.absent(),
    this.idUyVien = const Value.absent(),
    this.idThuKy = const Value.absent(),
    this.flagGiaoDeTai = const Value.absent(),
    this.flagThanhToan = const Value.absent(),
    this.flagDangKyBaoVe = const Value.absent(),
    this.flagNopHoSo = const Value.absent(),
  })  : idGiangVien = Value(idGiangVien),
        tenTiengViet = Value(tenTiengViet),
        tenTiengAnh = Value(tenTiengAnh);
  static Insertable<DeTaiThacSiData> custom({
    Expression<int>? id,
    Expression<int>? idGiangVien,
    Expression<String>? tenTiengViet,
    Expression<String>? tenTiengAnh,
    Expression<String>? ghiChu,
    Expression<int>? idHocVien,
    Expression<DateTime>? ngayGiao,
    Expression<String>? soQdGiao,
    Expression<DateTime>? hanBaoVe,
    Expression<String>? soQdBaoVe,
    Expression<DateTime>? ngayBaoVe,
    Expression<int>? idChuTich,
    Expression<int>? idPhanBien1,
    Expression<int>? idPhanBien2,
    Expression<int>? idUyVien,
    Expression<int>? idThuKy,
    Expression<bool>? flagGiaoDeTai,
    Expression<bool>? flagThanhToan,
    Expression<bool>? flagDangKyBaoVe,
    Expression<bool>? flagNopHoSo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idGiangVien != null) 'id_giang_vien': idGiangVien,
      if (tenTiengViet != null) 'ten_tieng_viet': tenTiengViet,
      if (tenTiengAnh != null) 'ten_tieng_anh': tenTiengAnh,
      if (ghiChu != null) 'ghi_chu': ghiChu,
      if (idHocVien != null) 'id_hoc_vien': idHocVien,
      if (ngayGiao != null) 'ngay_giao': ngayGiao,
      if (soQdGiao != null) 'so_qd_giao': soQdGiao,
      if (hanBaoVe != null) 'han_bao_ve': hanBaoVe,
      if (soQdBaoVe != null) 'so_qd_bao_ve': soQdBaoVe,
      if (ngayBaoVe != null) 'ngay_bao_ve': ngayBaoVe,
      if (idChuTich != null) 'id_chu_tich': idChuTich,
      if (idPhanBien1 != null) 'id_phan_bien1': idPhanBien1,
      if (idPhanBien2 != null) 'id_phan_bien2': idPhanBien2,
      if (idUyVien != null) 'id_uy_vien': idUyVien,
      if (idThuKy != null) 'id_thu_ky': idThuKy,
      if (flagGiaoDeTai != null) 'flag_giao_de_tai': flagGiaoDeTai,
      if (flagThanhToan != null) 'flag_thanh_toan': flagThanhToan,
      if (flagDangKyBaoVe != null) 'flag_dang_ky_bao_ve': flagDangKyBaoVe,
      if (flagNopHoSo != null) 'flag_nop_ho_so': flagNopHoSo,
    });
  }

  DeTaiThacSiCompanion copyWith(
      {Value<int>? id,
      Value<int>? idGiangVien,
      Value<String>? tenTiengViet,
      Value<String>? tenTiengAnh,
      Value<String>? ghiChu,
      Value<int?>? idHocVien,
      Value<DateTime?>? ngayGiao,
      Value<String?>? soQdGiao,
      Value<DateTime?>? hanBaoVe,
      Value<String?>? soQdBaoVe,
      Value<DateTime?>? ngayBaoVe,
      Value<int?>? idChuTich,
      Value<int?>? idPhanBien1,
      Value<int?>? idPhanBien2,
      Value<int?>? idUyVien,
      Value<int?>? idThuKy,
      Value<bool>? flagGiaoDeTai,
      Value<bool>? flagThanhToan,
      Value<bool>? flagDangKyBaoVe,
      Value<bool>? flagNopHoSo}) {
    return DeTaiThacSiCompanion(
      id: id ?? this.id,
      idGiangVien: idGiangVien ?? this.idGiangVien,
      tenTiengViet: tenTiengViet ?? this.tenTiengViet,
      tenTiengAnh: tenTiengAnh ?? this.tenTiengAnh,
      ghiChu: ghiChu ?? this.ghiChu,
      idHocVien: idHocVien ?? this.idHocVien,
      ngayGiao: ngayGiao ?? this.ngayGiao,
      soQdGiao: soQdGiao ?? this.soQdGiao,
      hanBaoVe: hanBaoVe ?? this.hanBaoVe,
      soQdBaoVe: soQdBaoVe ?? this.soQdBaoVe,
      ngayBaoVe: ngayBaoVe ?? this.ngayBaoVe,
      idChuTich: idChuTich ?? this.idChuTich,
      idPhanBien1: idPhanBien1 ?? this.idPhanBien1,
      idPhanBien2: idPhanBien2 ?? this.idPhanBien2,
      idUyVien: idUyVien ?? this.idUyVien,
      idThuKy: idThuKy ?? this.idThuKy,
      flagGiaoDeTai: flagGiaoDeTai ?? this.flagGiaoDeTai,
      flagThanhToan: flagThanhToan ?? this.flagThanhToan,
      flagDangKyBaoVe: flagDangKyBaoVe ?? this.flagDangKyBaoVe,
      flagNopHoSo: flagNopHoSo ?? this.flagNopHoSo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idGiangVien.present) {
      map['id_giang_vien'] = Variable<int>(idGiangVien.value);
    }
    if (tenTiengViet.present) {
      map['ten_tieng_viet'] = Variable<String>(tenTiengViet.value);
    }
    if (tenTiengAnh.present) {
      map['ten_tieng_anh'] = Variable<String>(tenTiengAnh.value);
    }
    if (ghiChu.present) {
      map['ghi_chu'] = Variable<String>(ghiChu.value);
    }
    if (idHocVien.present) {
      map['id_hoc_vien'] = Variable<int>(idHocVien.value);
    }
    if (ngayGiao.present) {
      map['ngay_giao'] = Variable<DateTime>(ngayGiao.value);
    }
    if (soQdGiao.present) {
      map['so_qd_giao'] = Variable<String>(soQdGiao.value);
    }
    if (hanBaoVe.present) {
      map['han_bao_ve'] = Variable<DateTime>(hanBaoVe.value);
    }
    if (soQdBaoVe.present) {
      map['so_qd_bao_ve'] = Variable<String>(soQdBaoVe.value);
    }
    if (ngayBaoVe.present) {
      map['ngay_bao_ve'] = Variable<DateTime>(ngayBaoVe.value);
    }
    if (idChuTich.present) {
      map['id_chu_tich'] = Variable<int>(idChuTich.value);
    }
    if (idPhanBien1.present) {
      map['id_phan_bien1'] = Variable<int>(idPhanBien1.value);
    }
    if (idPhanBien2.present) {
      map['id_phan_bien2'] = Variable<int>(idPhanBien2.value);
    }
    if (idUyVien.present) {
      map['id_uy_vien'] = Variable<int>(idUyVien.value);
    }
    if (idThuKy.present) {
      map['id_thu_ky'] = Variable<int>(idThuKy.value);
    }
    if (flagGiaoDeTai.present) {
      map['flag_giao_de_tai'] = Variable<bool>(flagGiaoDeTai.value);
    }
    if (flagThanhToan.present) {
      map['flag_thanh_toan'] = Variable<bool>(flagThanhToan.value);
    }
    if (flagDangKyBaoVe.present) {
      map['flag_dang_ky_bao_ve'] = Variable<bool>(flagDangKyBaoVe.value);
    }
    if (flagNopHoSo.present) {
      map['flag_nop_ho_so'] = Variable<bool>(flagNopHoSo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeTaiThacSiCompanion(')
          ..write('id: $id, ')
          ..write('idGiangVien: $idGiangVien, ')
          ..write('tenTiengViet: $tenTiengViet, ')
          ..write('tenTiengAnh: $tenTiengAnh, ')
          ..write('ghiChu: $ghiChu, ')
          ..write('idHocVien: $idHocVien, ')
          ..write('ngayGiao: $ngayGiao, ')
          ..write('soQdGiao: $soQdGiao, ')
          ..write('hanBaoVe: $hanBaoVe, ')
          ..write('soQdBaoVe: $soQdBaoVe, ')
          ..write('ngayBaoVe: $ngayBaoVe, ')
          ..write('idChuTich: $idChuTich, ')
          ..write('idPhanBien1: $idPhanBien1, ')
          ..write('idPhanBien2: $idPhanBien2, ')
          ..write('idUyVien: $idUyVien, ')
          ..write('idThuKy: $idThuKy, ')
          ..write('flagGiaoDeTai: $flagGiaoDeTai, ')
          ..write('flagThanhToan: $flagThanhToan, ')
          ..write('flagDangKyBaoVe: $flagDangKyBaoVe, ')
          ..write('flagNopHoSo: $flagNopHoSo')
          ..write(')'))
        .toString();
  }
}

class $HocKyTable extends HocKy with TableInfo<$HocKyTable, HocKyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HocKyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _dateUpdatedMeta =
      const VerificationMeta('dateUpdated');
  @override
  late final GeneratedColumn<DateTime> dateUpdated = GeneratedColumn<DateTime>(
      'date_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _hocKyMeta = const VerificationMeta('hocKy');
  @override
  late final GeneratedColumn<String> hocKy = GeneratedColumn<String>(
      'hoc_ky', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moDangKyMeta =
      const VerificationMeta('moDangKy');
  @override
  late final GeneratedColumn<DateTime> moDangKy = GeneratedColumn<DateTime>(
      'mo_dang_ky', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dongDangKyMeta =
      const VerificationMeta('dongDangKy');
  @override
  late final GeneratedColumn<DateTime> dongDangKy = GeneratedColumn<DateTime>(
      'dong_dang_ky', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _batDauHocMeta =
      const VerificationMeta('batDauHoc');
  @override
  late final GeneratedColumn<DateTime> batDauHoc = GeneratedColumn<DateTime>(
      'bat_dau_hoc', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _ketThucHocMeta =
      const VerificationMeta('ketThucHoc');
  @override
  late final GeneratedColumn<DateTime> ketThucHoc = GeneratedColumn<DateTime>(
      'ket_thuc_hoc', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _hanNhapDiemMeta =
      const VerificationMeta('hanNhapDiem');
  @override
  late final GeneratedColumn<DateTime> hanNhapDiem = GeneratedColumn<DateTime>(
      'han_nhap_diem', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        dateCreated,
        dateUpdated,
        hocKy,
        moDangKy,
        dongDangKy,
        batDauHoc,
        ketThucHoc,
        hanNhapDiem
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hoc_ky';
  @override
  VerificationContext validateIntegrity(Insertable<HocKyData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_updated')) {
      context.handle(
          _dateUpdatedMeta,
          dateUpdated.isAcceptableOrUnknown(
              data['date_updated']!, _dateUpdatedMeta));
    }
    if (data.containsKey('hoc_ky')) {
      context.handle(
          _hocKyMeta, hocKy.isAcceptableOrUnknown(data['hoc_ky']!, _hocKyMeta));
    } else if (isInserting) {
      context.missing(_hocKyMeta);
    }
    if (data.containsKey('mo_dang_ky')) {
      context.handle(_moDangKyMeta,
          moDangKy.isAcceptableOrUnknown(data['mo_dang_ky']!, _moDangKyMeta));
    } else if (isInserting) {
      context.missing(_moDangKyMeta);
    }
    if (data.containsKey('dong_dang_ky')) {
      context.handle(
          _dongDangKyMeta,
          dongDangKy.isAcceptableOrUnknown(
              data['dong_dang_ky']!, _dongDangKyMeta));
    } else if (isInserting) {
      context.missing(_dongDangKyMeta);
    }
    if (data.containsKey('bat_dau_hoc')) {
      context.handle(
          _batDauHocMeta,
          batDauHoc.isAcceptableOrUnknown(
              data['bat_dau_hoc']!, _batDauHocMeta));
    } else if (isInserting) {
      context.missing(_batDauHocMeta);
    }
    if (data.containsKey('ket_thuc_hoc')) {
      context.handle(
          _ketThucHocMeta,
          ketThucHoc.isAcceptableOrUnknown(
              data['ket_thuc_hoc']!, _ketThucHocMeta));
    } else if (isInserting) {
      context.missing(_ketThucHocMeta);
    }
    if (data.containsKey('han_nhap_diem')) {
      context.handle(
          _hanNhapDiemMeta,
          hanNhapDiem.isAcceptableOrUnknown(
              data['han_nhap_diem']!, _hanNhapDiemMeta));
    } else if (isInserting) {
      context.missing(_hanNhapDiemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hocKy};
  @override
  HocKyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HocKyData(
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_updated'])!,
      hocKy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hoc_ky'])!,
      moDangKy: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}mo_dang_ky'])!,
      dongDangKy: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dong_dang_ky'])!,
      batDauHoc: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}bat_dau_hoc'])!,
      ketThucHoc: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ket_thuc_hoc'])!,
      hanNhapDiem: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}han_nhap_diem'])!,
    );
  }

  @override
  $HocKyTable createAlias(String alias) {
    return $HocKyTable(attachedDatabase, alias);
  }
}

class HocKyData extends DataClass implements Insertable<HocKyData> {
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final String hocKy;
  final DateTime moDangKy;
  final DateTime dongDangKy;
  final DateTime batDauHoc;
  final DateTime ketThucHoc;
  final DateTime hanNhapDiem;
  const HocKyData(
      {required this.dateCreated,
      required this.dateUpdated,
      required this.hocKy,
      required this.moDangKy,
      required this.dongDangKy,
      required this.batDauHoc,
      required this.ketThucHoc,
      required this.hanNhapDiem});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['date_updated'] = Variable<DateTime>(dateUpdated);
    map['hoc_ky'] = Variable<String>(hocKy);
    map['mo_dang_ky'] = Variable<DateTime>(moDangKy);
    map['dong_dang_ky'] = Variable<DateTime>(dongDangKy);
    map['bat_dau_hoc'] = Variable<DateTime>(batDauHoc);
    map['ket_thuc_hoc'] = Variable<DateTime>(ketThucHoc);
    map['han_nhap_diem'] = Variable<DateTime>(hanNhapDiem);
    return map;
  }

  HocKyCompanion toCompanion(bool nullToAbsent) {
    return HocKyCompanion(
      dateCreated: Value(dateCreated),
      dateUpdated: Value(dateUpdated),
      hocKy: Value(hocKy),
      moDangKy: Value(moDangKy),
      dongDangKy: Value(dongDangKy),
      batDauHoc: Value(batDauHoc),
      ketThucHoc: Value(ketThucHoc),
      hanNhapDiem: Value(hanNhapDiem),
    );
  }

  factory HocKyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HocKyData(
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateUpdated: serializer.fromJson<DateTime>(json['dateUpdated']),
      hocKy: serializer.fromJson<String>(json['hocKy']),
      moDangKy: serializer.fromJson<DateTime>(json['moDangKy']),
      dongDangKy: serializer.fromJson<DateTime>(json['dongDangKy']),
      batDauHoc: serializer.fromJson<DateTime>(json['batDauHoc']),
      ketThucHoc: serializer.fromJson<DateTime>(json['ketThucHoc']),
      hanNhapDiem: serializer.fromJson<DateTime>(json['hanNhapDiem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateUpdated': serializer.toJson<DateTime>(dateUpdated),
      'hocKy': serializer.toJson<String>(hocKy),
      'moDangKy': serializer.toJson<DateTime>(moDangKy),
      'dongDangKy': serializer.toJson<DateTime>(dongDangKy),
      'batDauHoc': serializer.toJson<DateTime>(batDauHoc),
      'ketThucHoc': serializer.toJson<DateTime>(ketThucHoc),
      'hanNhapDiem': serializer.toJson<DateTime>(hanNhapDiem),
    };
  }

  HocKyData copyWith(
          {DateTime? dateCreated,
          DateTime? dateUpdated,
          String? hocKy,
          DateTime? moDangKy,
          DateTime? dongDangKy,
          DateTime? batDauHoc,
          DateTime? ketThucHoc,
          DateTime? hanNhapDiem}) =>
      HocKyData(
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        hocKy: hocKy ?? this.hocKy,
        moDangKy: moDangKy ?? this.moDangKy,
        dongDangKy: dongDangKy ?? this.dongDangKy,
        batDauHoc: batDauHoc ?? this.batDauHoc,
        ketThucHoc: ketThucHoc ?? this.ketThucHoc,
        hanNhapDiem: hanNhapDiem ?? this.hanNhapDiem,
      );
  HocKyData copyWithCompanion(HocKyCompanion data) {
    return HocKyData(
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateUpdated:
          data.dateUpdated.present ? data.dateUpdated.value : this.dateUpdated,
      hocKy: data.hocKy.present ? data.hocKy.value : this.hocKy,
      moDangKy: data.moDangKy.present ? data.moDangKy.value : this.moDangKy,
      dongDangKy:
          data.dongDangKy.present ? data.dongDangKy.value : this.dongDangKy,
      batDauHoc: data.batDauHoc.present ? data.batDauHoc.value : this.batDauHoc,
      ketThucHoc:
          data.ketThucHoc.present ? data.ketThucHoc.value : this.ketThucHoc,
      hanNhapDiem:
          data.hanNhapDiem.present ? data.hanNhapDiem.value : this.hanNhapDiem,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HocKyData(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('hocKy: $hocKy, ')
          ..write('moDangKy: $moDangKy, ')
          ..write('dongDangKy: $dongDangKy, ')
          ..write('batDauHoc: $batDauHoc, ')
          ..write('ketThucHoc: $ketThucHoc, ')
          ..write('hanNhapDiem: $hanNhapDiem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dateCreated, dateUpdated, hocKy, moDangKy,
      dongDangKy, batDauHoc, ketThucHoc, hanNhapDiem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HocKyData &&
          other.dateCreated == this.dateCreated &&
          other.dateUpdated == this.dateUpdated &&
          other.hocKy == this.hocKy &&
          other.moDangKy == this.moDangKy &&
          other.dongDangKy == this.dongDangKy &&
          other.batDauHoc == this.batDauHoc &&
          other.ketThucHoc == this.ketThucHoc &&
          other.hanNhapDiem == this.hanNhapDiem);
}

class HocKyCompanion extends UpdateCompanion<HocKyData> {
  final Value<DateTime> dateCreated;
  final Value<DateTime> dateUpdated;
  final Value<String> hocKy;
  final Value<DateTime> moDangKy;
  final Value<DateTime> dongDangKy;
  final Value<DateTime> batDauHoc;
  final Value<DateTime> ketThucHoc;
  final Value<DateTime> hanNhapDiem;
  final Value<int> rowid;
  const HocKyCompanion({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.hocKy = const Value.absent(),
    this.moDangKy = const Value.absent(),
    this.dongDangKy = const Value.absent(),
    this.batDauHoc = const Value.absent(),
    this.ketThucHoc = const Value.absent(),
    this.hanNhapDiem = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HocKyCompanion.insert({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    required String hocKy,
    required DateTime moDangKy,
    required DateTime dongDangKy,
    required DateTime batDauHoc,
    required DateTime ketThucHoc,
    required DateTime hanNhapDiem,
    this.rowid = const Value.absent(),
  })  : hocKy = Value(hocKy),
        moDangKy = Value(moDangKy),
        dongDangKy = Value(dongDangKy),
        batDauHoc = Value(batDauHoc),
        ketThucHoc = Value(ketThucHoc),
        hanNhapDiem = Value(hanNhapDiem);
  static Insertable<HocKyData> custom({
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateUpdated,
    Expression<String>? hocKy,
    Expression<DateTime>? moDangKy,
    Expression<DateTime>? dongDangKy,
    Expression<DateTime>? batDauHoc,
    Expression<DateTime>? ketThucHoc,
    Expression<DateTime>? hanNhapDiem,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateUpdated != null) 'date_updated': dateUpdated,
      if (hocKy != null) 'hoc_ky': hocKy,
      if (moDangKy != null) 'mo_dang_ky': moDangKy,
      if (dongDangKy != null) 'dong_dang_ky': dongDangKy,
      if (batDauHoc != null) 'bat_dau_hoc': batDauHoc,
      if (ketThucHoc != null) 'ket_thuc_hoc': ketThucHoc,
      if (hanNhapDiem != null) 'han_nhap_diem': hanNhapDiem,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HocKyCompanion copyWith(
      {Value<DateTime>? dateCreated,
      Value<DateTime>? dateUpdated,
      Value<String>? hocKy,
      Value<DateTime>? moDangKy,
      Value<DateTime>? dongDangKy,
      Value<DateTime>? batDauHoc,
      Value<DateTime>? ketThucHoc,
      Value<DateTime>? hanNhapDiem,
      Value<int>? rowid}) {
    return HocKyCompanion(
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      hocKy: hocKy ?? this.hocKy,
      moDangKy: moDangKy ?? this.moDangKy,
      dongDangKy: dongDangKy ?? this.dongDangKy,
      batDauHoc: batDauHoc ?? this.batDauHoc,
      ketThucHoc: ketThucHoc ?? this.ketThucHoc,
      hanNhapDiem: hanNhapDiem ?? this.hanNhapDiem,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateUpdated.present) {
      map['date_updated'] = Variable<DateTime>(dateUpdated.value);
    }
    if (hocKy.present) {
      map['hoc_ky'] = Variable<String>(hocKy.value);
    }
    if (moDangKy.present) {
      map['mo_dang_ky'] = Variable<DateTime>(moDangKy.value);
    }
    if (dongDangKy.present) {
      map['dong_dang_ky'] = Variable<DateTime>(dongDangKy.value);
    }
    if (batDauHoc.present) {
      map['bat_dau_hoc'] = Variable<DateTime>(batDauHoc.value);
    }
    if (ketThucHoc.present) {
      map['ket_thuc_hoc'] = Variable<DateTime>(ketThucHoc.value);
    }
    if (hanNhapDiem.present) {
      map['han_nhap_diem'] = Variable<DateTime>(hanNhapDiem.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HocKyCompanion(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('hocKy: $hocKy, ')
          ..write('moDangKy: $moDangKy, ')
          ..write('dongDangKy: $dongDangKy, ')
          ..write('batDauHoc: $batDauHoc, ')
          ..write('ketThucHoc: $ketThucHoc, ')
          ..write('hanNhapDiem: $hanNhapDiem, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HocPhanTable extends HocPhan with TableInfo<$HocPhanTable, HocPhanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HocPhanTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _dateUpdatedMeta =
      const VerificationMeta('dateUpdated');
  @override
  late final GeneratedColumn<DateTime> dateUpdated = GeneratedColumn<DateTime>(
      'date_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _maHocPhanMeta =
      const VerificationMeta('maHocPhan');
  @override
  late final GeneratedColumn<String> maHocPhan = GeneratedColumn<String>(
      'ma_hoc_phan', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenTiengVietMeta =
      const VerificationMeta('tenTiengViet');
  @override
  late final GeneratedColumn<String> tenTiengViet = GeneratedColumn<String>(
      'ten_tieng_viet', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenTiengAnhMeta =
      const VerificationMeta('tenTiengAnh');
  @override
  late final GeneratedColumn<String> tenTiengAnh = GeneratedColumn<String>(
      'ten_tieng_anh', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _soTinChiMeta =
      const VerificationMeta('soTinChi');
  @override
  late final GeneratedColumn<int> soTinChi = GeneratedColumn<int>(
      'so_tin_chi', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _khoiLuongMeta =
      const VerificationMeta('khoiLuong');
  @override
  late final GeneratedColumn<String> khoiLuong = GeneratedColumn<String>(
      'khoi_luong', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<KhoiKienThuc, String>
      khoiKienThuc = GeneratedColumn<String>(
              'khoi_kien_thuc', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(KhoiKienThuc.khac.value))
          .withConverter<KhoiKienThuc>($HocPhanTable.$converterkhoiKienThuc);
  @override
  List<GeneratedColumn> get $columns => [
        dateCreated,
        dateUpdated,
        maHocPhan,
        tenTiengViet,
        tenTiengAnh,
        soTinChi,
        khoiLuong,
        khoiKienThuc
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hoc_phan';
  @override
  VerificationContext validateIntegrity(Insertable<HocPhanData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_updated')) {
      context.handle(
          _dateUpdatedMeta,
          dateUpdated.isAcceptableOrUnknown(
              data['date_updated']!, _dateUpdatedMeta));
    }
    if (data.containsKey('ma_hoc_phan')) {
      context.handle(
          _maHocPhanMeta,
          maHocPhan.isAcceptableOrUnknown(
              data['ma_hoc_phan']!, _maHocPhanMeta));
    } else if (isInserting) {
      context.missing(_maHocPhanMeta);
    }
    if (data.containsKey('ten_tieng_viet')) {
      context.handle(
          _tenTiengVietMeta,
          tenTiengViet.isAcceptableOrUnknown(
              data['ten_tieng_viet']!, _tenTiengVietMeta));
    } else if (isInserting) {
      context.missing(_tenTiengVietMeta);
    }
    if (data.containsKey('ten_tieng_anh')) {
      context.handle(
          _tenTiengAnhMeta,
          tenTiengAnh.isAcceptableOrUnknown(
              data['ten_tieng_anh']!, _tenTiengAnhMeta));
    } else if (isInserting) {
      context.missing(_tenTiengAnhMeta);
    }
    if (data.containsKey('so_tin_chi')) {
      context.handle(_soTinChiMeta,
          soTinChi.isAcceptableOrUnknown(data['so_tin_chi']!, _soTinChiMeta));
    } else if (isInserting) {
      context.missing(_soTinChiMeta);
    }
    if (data.containsKey('khoi_luong')) {
      context.handle(_khoiLuongMeta,
          khoiLuong.isAcceptableOrUnknown(data['khoi_luong']!, _khoiLuongMeta));
    } else if (isInserting) {
      context.missing(_khoiLuongMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {maHocPhan};
  @override
  HocPhanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HocPhanData(
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_updated'])!,
      maHocPhan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ma_hoc_phan'])!,
      tenTiengViet: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ten_tieng_viet'])!,
      tenTiengAnh: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ten_tieng_anh'])!,
      soTinChi: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}so_tin_chi'])!,
      khoiLuong: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}khoi_luong'])!,
      khoiKienThuc: $HocPhanTable.$converterkhoiKienThuc.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}khoi_kien_thuc'])!),
    );
  }

  @override
  $HocPhanTable createAlias(String alias) {
    return $HocPhanTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<KhoiKienThuc, String, String>
      $converterkhoiKienThuc =
      const EnumNameConverter<KhoiKienThuc>(KhoiKienThuc.values);
}

class HocPhanData extends DataClass implements Insertable<HocPhanData> {
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final String maHocPhan;
  final String tenTiengViet;
  final String tenTiengAnh;
  final int soTinChi;
  final String khoiLuong;
  final KhoiKienThuc khoiKienThuc;
  const HocPhanData(
      {required this.dateCreated,
      required this.dateUpdated,
      required this.maHocPhan,
      required this.tenTiengViet,
      required this.tenTiengAnh,
      required this.soTinChi,
      required this.khoiLuong,
      required this.khoiKienThuc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['date_updated'] = Variable<DateTime>(dateUpdated);
    map['ma_hoc_phan'] = Variable<String>(maHocPhan);
    map['ten_tieng_viet'] = Variable<String>(tenTiengViet);
    map['ten_tieng_anh'] = Variable<String>(tenTiengAnh);
    map['so_tin_chi'] = Variable<int>(soTinChi);
    map['khoi_luong'] = Variable<String>(khoiLuong);
    {
      map['khoi_kien_thuc'] = Variable<String>(
          $HocPhanTable.$converterkhoiKienThuc.toSql(khoiKienThuc));
    }
    return map;
  }

  HocPhanCompanion toCompanion(bool nullToAbsent) {
    return HocPhanCompanion(
      dateCreated: Value(dateCreated),
      dateUpdated: Value(dateUpdated),
      maHocPhan: Value(maHocPhan),
      tenTiengViet: Value(tenTiengViet),
      tenTiengAnh: Value(tenTiengAnh),
      soTinChi: Value(soTinChi),
      khoiLuong: Value(khoiLuong),
      khoiKienThuc: Value(khoiKienThuc),
    );
  }

  factory HocPhanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HocPhanData(
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateUpdated: serializer.fromJson<DateTime>(json['dateUpdated']),
      maHocPhan: serializer.fromJson<String>(json['maHocPhan']),
      tenTiengViet: serializer.fromJson<String>(json['tenTiengViet']),
      tenTiengAnh: serializer.fromJson<String>(json['tenTiengAnh']),
      soTinChi: serializer.fromJson<int>(json['soTinChi']),
      khoiLuong: serializer.fromJson<String>(json['khoiLuong']),
      khoiKienThuc: $HocPhanTable.$converterkhoiKienThuc
          .fromJson(serializer.fromJson<String>(json['khoiKienThuc'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateUpdated': serializer.toJson<DateTime>(dateUpdated),
      'maHocPhan': serializer.toJson<String>(maHocPhan),
      'tenTiengViet': serializer.toJson<String>(tenTiengViet),
      'tenTiengAnh': serializer.toJson<String>(tenTiengAnh),
      'soTinChi': serializer.toJson<int>(soTinChi),
      'khoiLuong': serializer.toJson<String>(khoiLuong),
      'khoiKienThuc': serializer.toJson<String>(
          $HocPhanTable.$converterkhoiKienThuc.toJson(khoiKienThuc)),
    };
  }

  HocPhanData copyWith(
          {DateTime? dateCreated,
          DateTime? dateUpdated,
          String? maHocPhan,
          String? tenTiengViet,
          String? tenTiengAnh,
          int? soTinChi,
          String? khoiLuong,
          KhoiKienThuc? khoiKienThuc}) =>
      HocPhanData(
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        maHocPhan: maHocPhan ?? this.maHocPhan,
        tenTiengViet: tenTiengViet ?? this.tenTiengViet,
        tenTiengAnh: tenTiengAnh ?? this.tenTiengAnh,
        soTinChi: soTinChi ?? this.soTinChi,
        khoiLuong: khoiLuong ?? this.khoiLuong,
        khoiKienThuc: khoiKienThuc ?? this.khoiKienThuc,
      );
  HocPhanData copyWithCompanion(HocPhanCompanion data) {
    return HocPhanData(
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateUpdated:
          data.dateUpdated.present ? data.dateUpdated.value : this.dateUpdated,
      maHocPhan: data.maHocPhan.present ? data.maHocPhan.value : this.maHocPhan,
      tenTiengViet: data.tenTiengViet.present
          ? data.tenTiengViet.value
          : this.tenTiengViet,
      tenTiengAnh:
          data.tenTiengAnh.present ? data.tenTiengAnh.value : this.tenTiengAnh,
      soTinChi: data.soTinChi.present ? data.soTinChi.value : this.soTinChi,
      khoiLuong: data.khoiLuong.present ? data.khoiLuong.value : this.khoiLuong,
      khoiKienThuc: data.khoiKienThuc.present
          ? data.khoiKienThuc.value
          : this.khoiKienThuc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HocPhanData(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('maHocPhan: $maHocPhan, ')
          ..write('tenTiengViet: $tenTiengViet, ')
          ..write('tenTiengAnh: $tenTiengAnh, ')
          ..write('soTinChi: $soTinChi, ')
          ..write('khoiLuong: $khoiLuong, ')
          ..write('khoiKienThuc: $khoiKienThuc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dateCreated, dateUpdated, maHocPhan,
      tenTiengViet, tenTiengAnh, soTinChi, khoiLuong, khoiKienThuc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HocPhanData &&
          other.dateCreated == this.dateCreated &&
          other.dateUpdated == this.dateUpdated &&
          other.maHocPhan == this.maHocPhan &&
          other.tenTiengViet == this.tenTiengViet &&
          other.tenTiengAnh == this.tenTiengAnh &&
          other.soTinChi == this.soTinChi &&
          other.khoiLuong == this.khoiLuong &&
          other.khoiKienThuc == this.khoiKienThuc);
}

class HocPhanCompanion extends UpdateCompanion<HocPhanData> {
  final Value<DateTime> dateCreated;
  final Value<DateTime> dateUpdated;
  final Value<String> maHocPhan;
  final Value<String> tenTiengViet;
  final Value<String> tenTiengAnh;
  final Value<int> soTinChi;
  final Value<String> khoiLuong;
  final Value<KhoiKienThuc> khoiKienThuc;
  final Value<int> rowid;
  const HocPhanCompanion({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.maHocPhan = const Value.absent(),
    this.tenTiengViet = const Value.absent(),
    this.tenTiengAnh = const Value.absent(),
    this.soTinChi = const Value.absent(),
    this.khoiLuong = const Value.absent(),
    this.khoiKienThuc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HocPhanCompanion.insert({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    required String maHocPhan,
    required String tenTiengViet,
    required String tenTiengAnh,
    required int soTinChi,
    required String khoiLuong,
    this.khoiKienThuc = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : maHocPhan = Value(maHocPhan),
        tenTiengViet = Value(tenTiengViet),
        tenTiengAnh = Value(tenTiengAnh),
        soTinChi = Value(soTinChi),
        khoiLuong = Value(khoiLuong);
  static Insertable<HocPhanData> custom({
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateUpdated,
    Expression<String>? maHocPhan,
    Expression<String>? tenTiengViet,
    Expression<String>? tenTiengAnh,
    Expression<int>? soTinChi,
    Expression<String>? khoiLuong,
    Expression<String>? khoiKienThuc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateUpdated != null) 'date_updated': dateUpdated,
      if (maHocPhan != null) 'ma_hoc_phan': maHocPhan,
      if (tenTiengViet != null) 'ten_tieng_viet': tenTiengViet,
      if (tenTiengAnh != null) 'ten_tieng_anh': tenTiengAnh,
      if (soTinChi != null) 'so_tin_chi': soTinChi,
      if (khoiLuong != null) 'khoi_luong': khoiLuong,
      if (khoiKienThuc != null) 'khoi_kien_thuc': khoiKienThuc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HocPhanCompanion copyWith(
      {Value<DateTime>? dateCreated,
      Value<DateTime>? dateUpdated,
      Value<String>? maHocPhan,
      Value<String>? tenTiengViet,
      Value<String>? tenTiengAnh,
      Value<int>? soTinChi,
      Value<String>? khoiLuong,
      Value<KhoiKienThuc>? khoiKienThuc,
      Value<int>? rowid}) {
    return HocPhanCompanion(
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      maHocPhan: maHocPhan ?? this.maHocPhan,
      tenTiengViet: tenTiengViet ?? this.tenTiengViet,
      tenTiengAnh: tenTiengAnh ?? this.tenTiengAnh,
      soTinChi: soTinChi ?? this.soTinChi,
      khoiLuong: khoiLuong ?? this.khoiLuong,
      khoiKienThuc: khoiKienThuc ?? this.khoiKienThuc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateUpdated.present) {
      map['date_updated'] = Variable<DateTime>(dateUpdated.value);
    }
    if (maHocPhan.present) {
      map['ma_hoc_phan'] = Variable<String>(maHocPhan.value);
    }
    if (tenTiengViet.present) {
      map['ten_tieng_viet'] = Variable<String>(tenTiengViet.value);
    }
    if (tenTiengAnh.present) {
      map['ten_tieng_anh'] = Variable<String>(tenTiengAnh.value);
    }
    if (soTinChi.present) {
      map['so_tin_chi'] = Variable<int>(soTinChi.value);
    }
    if (khoiLuong.present) {
      map['khoi_luong'] = Variable<String>(khoiLuong.value);
    }
    if (khoiKienThuc.present) {
      map['khoi_kien_thuc'] = Variable<String>(
          $HocPhanTable.$converterkhoiKienThuc.toSql(khoiKienThuc.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HocPhanCompanion(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('maHocPhan: $maHocPhan, ')
          ..write('tenTiengViet: $tenTiengViet, ')
          ..write('tenTiengAnh: $tenTiengAnh, ')
          ..write('soTinChi: $soTinChi, ')
          ..write('khoiLuong: $khoiLuong, ')
          ..write('khoiKienThuc: $khoiKienThuc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LopTinChiTable extends LopTinChi
    with TableInfo<$LopTinChiTable, LopTinChiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LopTinChiTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _dateUpdatedMeta =
      const VerificationMeta('dateUpdated');
  @override
  late final GeneratedColumn<DateTime> dateUpdated = GeneratedColumn<DateTime>(
      'date_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _maLopHocMeta =
      const VerificationMeta('maLopHoc');
  @override
  late final GeneratedColumn<String> maLopHoc = GeneratedColumn<String>(
      'ma_lop_hoc', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _maHocPhanMeta =
      const VerificationMeta('maHocPhan');
  @override
  late final GeneratedColumn<String> maHocPhan = GeneratedColumn<String>(
      'ma_hoc_phan', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES hoc_phan (ma_hoc_phan)'));
  static const VerificationMeta _idGiangVienMeta =
      const VerificationMeta('idGiangVien');
  @override
  late final GeneratedColumn<int> idGiangVien = GeneratedColumn<int>(
      'id_giang_vien', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES giang_vien (id)'));
  static const VerificationMeta _idLopTruongMeta =
      const VerificationMeta('idLopTruong');
  @override
  late final GeneratedColumn<int> idLopTruong = GeneratedColumn<int>(
      'id_lop_truong', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES hoc_vien (id)'));
  static const VerificationMeta _urlTruyCapMeta =
      const VerificationMeta('urlTruyCap');
  @override
  late final GeneratedColumn<String> urlTruyCap = GeneratedColumn<String>(
      'url_truy_cap', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _hocKyMeta = const VerificationMeta('hocKy');
  @override
  late final GeneratedColumn<String> hocKy = GeneratedColumn<String>(
      'hoc_ky', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES hoc_ky (hoc_ky)'));
  static const VerificationMeta _phongHocMeta =
      const VerificationMeta('phongHoc');
  @override
  late final GeneratedColumn<String> phongHoc = GeneratedColumn<String>(
      'phong_hoc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ngayHocMeta =
      const VerificationMeta('ngayHoc');
  @override
  late final GeneratedColumn<int> ngayHoc = GeneratedColumn<int>(
      'ngay_hoc', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tietBatDauMeta =
      const VerificationMeta('tietBatDau');
  @override
  late final GeneratedColumn<int> tietBatDau = GeneratedColumn<int>(
      'tiet_bat_dau', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tietKetThucMeta =
      const VerificationMeta('tietKetThuc');
  @override
  late final GeneratedColumn<int> tietKetThuc = GeneratedColumn<int>(
      'tiet_ket_thuc', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _flagHuyMeta =
      const VerificationMeta('flagHuy');
  @override
  late final GeneratedColumn<bool> flagHuy = GeneratedColumn<bool>(
      'flag_huy', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("flag_huy" IN (0, 1))'),
      defaultValue: falseExpr);
  @override
  List<GeneratedColumn> get $columns => [
        dateCreated,
        dateUpdated,
        id,
        maLopHoc,
        maHocPhan,
        idGiangVien,
        idLopTruong,
        urlTruyCap,
        hocKy,
        phongHoc,
        ngayHoc,
        tietBatDau,
        tietKetThuc,
        flagHuy
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lop_tin_chi';
  @override
  VerificationContext validateIntegrity(Insertable<LopTinChiData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_updated')) {
      context.handle(
          _dateUpdatedMeta,
          dateUpdated.isAcceptableOrUnknown(
              data['date_updated']!, _dateUpdatedMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ma_lop_hoc')) {
      context.handle(_maLopHocMeta,
          maLopHoc.isAcceptableOrUnknown(data['ma_lop_hoc']!, _maLopHocMeta));
    } else if (isInserting) {
      context.missing(_maLopHocMeta);
    }
    if (data.containsKey('ma_hoc_phan')) {
      context.handle(
          _maHocPhanMeta,
          maHocPhan.isAcceptableOrUnknown(
              data['ma_hoc_phan']!, _maHocPhanMeta));
    } else if (isInserting) {
      context.missing(_maHocPhanMeta);
    }
    if (data.containsKey('id_giang_vien')) {
      context.handle(
          _idGiangVienMeta,
          idGiangVien.isAcceptableOrUnknown(
              data['id_giang_vien']!, _idGiangVienMeta));
    }
    if (data.containsKey('id_lop_truong')) {
      context.handle(
          _idLopTruongMeta,
          idLopTruong.isAcceptableOrUnknown(
              data['id_lop_truong']!, _idLopTruongMeta));
    }
    if (data.containsKey('url_truy_cap')) {
      context.handle(
          _urlTruyCapMeta,
          urlTruyCap.isAcceptableOrUnknown(
              data['url_truy_cap']!, _urlTruyCapMeta));
    } else if (isInserting) {
      context.missing(_urlTruyCapMeta);
    }
    if (data.containsKey('hoc_ky')) {
      context.handle(
          _hocKyMeta, hocKy.isAcceptableOrUnknown(data['hoc_ky']!, _hocKyMeta));
    } else if (isInserting) {
      context.missing(_hocKyMeta);
    }
    if (data.containsKey('phong_hoc')) {
      context.handle(_phongHocMeta,
          phongHoc.isAcceptableOrUnknown(data['phong_hoc']!, _phongHocMeta));
    }
    if (data.containsKey('ngay_hoc')) {
      context.handle(_ngayHocMeta,
          ngayHoc.isAcceptableOrUnknown(data['ngay_hoc']!, _ngayHocMeta));
    }
    if (data.containsKey('tiet_bat_dau')) {
      context.handle(
          _tietBatDauMeta,
          tietBatDau.isAcceptableOrUnknown(
              data['tiet_bat_dau']!, _tietBatDauMeta));
    }
    if (data.containsKey('tiet_ket_thuc')) {
      context.handle(
          _tietKetThucMeta,
          tietKetThuc.isAcceptableOrUnknown(
              data['tiet_ket_thuc']!, _tietKetThucMeta));
    }
    if (data.containsKey('flag_huy')) {
      context.handle(_flagHuyMeta,
          flagHuy.isAcceptableOrUnknown(data['flag_huy']!, _flagHuyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LopTinChiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LopTinChiData(
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_updated'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      maLopHoc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ma_lop_hoc'])!,
      maHocPhan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ma_hoc_phan'])!,
      idGiangVien: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_giang_vien']),
      idLopTruong: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_lop_truong']),
      urlTruyCap: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_truy_cap'])!,
      hocKy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hoc_ky'])!,
      phongHoc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phong_hoc']),
      ngayHoc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ngay_hoc']),
      tietBatDau: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tiet_bat_dau']),
      tietKetThuc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tiet_ket_thuc']),
      flagHuy: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}flag_huy'])!,
    );
  }

  @override
  $LopTinChiTable createAlias(String alias) {
    return $LopTinChiTable(attachedDatabase, alias);
  }
}

class LopTinChiData extends DataClass implements Insertable<LopTinChiData> {
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final int id;
  final String maLopHoc;
  final String maHocPhan;
  final int? idGiangVien;
  final int? idLopTruong;
  final String urlTruyCap;
  final String hocKy;
  final String? phongHoc;
  final int? ngayHoc;
  final int? tietBatDau;
  final int? tietKetThuc;
  final bool flagHuy;
  const LopTinChiData(
      {required this.dateCreated,
      required this.dateUpdated,
      required this.id,
      required this.maLopHoc,
      required this.maHocPhan,
      this.idGiangVien,
      this.idLopTruong,
      required this.urlTruyCap,
      required this.hocKy,
      this.phongHoc,
      this.ngayHoc,
      this.tietBatDau,
      this.tietKetThuc,
      required this.flagHuy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['date_updated'] = Variable<DateTime>(dateUpdated);
    map['id'] = Variable<int>(id);
    map['ma_lop_hoc'] = Variable<String>(maLopHoc);
    map['ma_hoc_phan'] = Variable<String>(maHocPhan);
    if (!nullToAbsent || idGiangVien != null) {
      map['id_giang_vien'] = Variable<int>(idGiangVien);
    }
    if (!nullToAbsent || idLopTruong != null) {
      map['id_lop_truong'] = Variable<int>(idLopTruong);
    }
    map['url_truy_cap'] = Variable<String>(urlTruyCap);
    map['hoc_ky'] = Variable<String>(hocKy);
    if (!nullToAbsent || phongHoc != null) {
      map['phong_hoc'] = Variable<String>(phongHoc);
    }
    if (!nullToAbsent || ngayHoc != null) {
      map['ngay_hoc'] = Variable<int>(ngayHoc);
    }
    if (!nullToAbsent || tietBatDau != null) {
      map['tiet_bat_dau'] = Variable<int>(tietBatDau);
    }
    if (!nullToAbsent || tietKetThuc != null) {
      map['tiet_ket_thuc'] = Variable<int>(tietKetThuc);
    }
    map['flag_huy'] = Variable<bool>(flagHuy);
    return map;
  }

  LopTinChiCompanion toCompanion(bool nullToAbsent) {
    return LopTinChiCompanion(
      dateCreated: Value(dateCreated),
      dateUpdated: Value(dateUpdated),
      id: Value(id),
      maLopHoc: Value(maLopHoc),
      maHocPhan: Value(maHocPhan),
      idGiangVien: idGiangVien == null && nullToAbsent
          ? const Value.absent()
          : Value(idGiangVien),
      idLopTruong: idLopTruong == null && nullToAbsent
          ? const Value.absent()
          : Value(idLopTruong),
      urlTruyCap: Value(urlTruyCap),
      hocKy: Value(hocKy),
      phongHoc: phongHoc == null && nullToAbsent
          ? const Value.absent()
          : Value(phongHoc),
      ngayHoc: ngayHoc == null && nullToAbsent
          ? const Value.absent()
          : Value(ngayHoc),
      tietBatDau: tietBatDau == null && nullToAbsent
          ? const Value.absent()
          : Value(tietBatDau),
      tietKetThuc: tietKetThuc == null && nullToAbsent
          ? const Value.absent()
          : Value(tietKetThuc),
      flagHuy: Value(flagHuy),
    );
  }

  factory LopTinChiData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LopTinChiData(
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateUpdated: serializer.fromJson<DateTime>(json['dateUpdated']),
      id: serializer.fromJson<int>(json['id']),
      maLopHoc: serializer.fromJson<String>(json['maLopHoc']),
      maHocPhan: serializer.fromJson<String>(json['maHocPhan']),
      idGiangVien: serializer.fromJson<int?>(json['idGiangVien']),
      idLopTruong: serializer.fromJson<int?>(json['idLopTruong']),
      urlTruyCap: serializer.fromJson<String>(json['urlTruyCap']),
      hocKy: serializer.fromJson<String>(json['hocKy']),
      phongHoc: serializer.fromJson<String?>(json['phongHoc']),
      ngayHoc: serializer.fromJson<int?>(json['ngayHoc']),
      tietBatDau: serializer.fromJson<int?>(json['tietBatDau']),
      tietKetThuc: serializer.fromJson<int?>(json['tietKetThuc']),
      flagHuy: serializer.fromJson<bool>(json['flagHuy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateUpdated': serializer.toJson<DateTime>(dateUpdated),
      'id': serializer.toJson<int>(id),
      'maLopHoc': serializer.toJson<String>(maLopHoc),
      'maHocPhan': serializer.toJson<String>(maHocPhan),
      'idGiangVien': serializer.toJson<int?>(idGiangVien),
      'idLopTruong': serializer.toJson<int?>(idLopTruong),
      'urlTruyCap': serializer.toJson<String>(urlTruyCap),
      'hocKy': serializer.toJson<String>(hocKy),
      'phongHoc': serializer.toJson<String?>(phongHoc),
      'ngayHoc': serializer.toJson<int?>(ngayHoc),
      'tietBatDau': serializer.toJson<int?>(tietBatDau),
      'tietKetThuc': serializer.toJson<int?>(tietKetThuc),
      'flagHuy': serializer.toJson<bool>(flagHuy),
    };
  }

  LopTinChiData copyWith(
          {DateTime? dateCreated,
          DateTime? dateUpdated,
          int? id,
          String? maLopHoc,
          String? maHocPhan,
          Value<int?> idGiangVien = const Value.absent(),
          Value<int?> idLopTruong = const Value.absent(),
          String? urlTruyCap,
          String? hocKy,
          Value<String?> phongHoc = const Value.absent(),
          Value<int?> ngayHoc = const Value.absent(),
          Value<int?> tietBatDau = const Value.absent(),
          Value<int?> tietKetThuc = const Value.absent(),
          bool? flagHuy}) =>
      LopTinChiData(
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        id: id ?? this.id,
        maLopHoc: maLopHoc ?? this.maLopHoc,
        maHocPhan: maHocPhan ?? this.maHocPhan,
        idGiangVien: idGiangVien.present ? idGiangVien.value : this.idGiangVien,
        idLopTruong: idLopTruong.present ? idLopTruong.value : this.idLopTruong,
        urlTruyCap: urlTruyCap ?? this.urlTruyCap,
        hocKy: hocKy ?? this.hocKy,
        phongHoc: phongHoc.present ? phongHoc.value : this.phongHoc,
        ngayHoc: ngayHoc.present ? ngayHoc.value : this.ngayHoc,
        tietBatDau: tietBatDau.present ? tietBatDau.value : this.tietBatDau,
        tietKetThuc: tietKetThuc.present ? tietKetThuc.value : this.tietKetThuc,
        flagHuy: flagHuy ?? this.flagHuy,
      );
  LopTinChiData copyWithCompanion(LopTinChiCompanion data) {
    return LopTinChiData(
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateUpdated:
          data.dateUpdated.present ? data.dateUpdated.value : this.dateUpdated,
      id: data.id.present ? data.id.value : this.id,
      maLopHoc: data.maLopHoc.present ? data.maLopHoc.value : this.maLopHoc,
      maHocPhan: data.maHocPhan.present ? data.maHocPhan.value : this.maHocPhan,
      idGiangVien:
          data.idGiangVien.present ? data.idGiangVien.value : this.idGiangVien,
      idLopTruong:
          data.idLopTruong.present ? data.idLopTruong.value : this.idLopTruong,
      urlTruyCap:
          data.urlTruyCap.present ? data.urlTruyCap.value : this.urlTruyCap,
      hocKy: data.hocKy.present ? data.hocKy.value : this.hocKy,
      phongHoc: data.phongHoc.present ? data.phongHoc.value : this.phongHoc,
      ngayHoc: data.ngayHoc.present ? data.ngayHoc.value : this.ngayHoc,
      tietBatDau:
          data.tietBatDau.present ? data.tietBatDau.value : this.tietBatDau,
      tietKetThuc:
          data.tietKetThuc.present ? data.tietKetThuc.value : this.tietKetThuc,
      flagHuy: data.flagHuy.present ? data.flagHuy.value : this.flagHuy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LopTinChiData(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('maLopHoc: $maLopHoc, ')
          ..write('maHocPhan: $maHocPhan, ')
          ..write('idGiangVien: $idGiangVien, ')
          ..write('idLopTruong: $idLopTruong, ')
          ..write('urlTruyCap: $urlTruyCap, ')
          ..write('hocKy: $hocKy, ')
          ..write('phongHoc: $phongHoc, ')
          ..write('ngayHoc: $ngayHoc, ')
          ..write('tietBatDau: $tietBatDau, ')
          ..write('tietKetThuc: $tietKetThuc, ')
          ..write('flagHuy: $flagHuy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      dateCreated,
      dateUpdated,
      id,
      maLopHoc,
      maHocPhan,
      idGiangVien,
      idLopTruong,
      urlTruyCap,
      hocKy,
      phongHoc,
      ngayHoc,
      tietBatDau,
      tietKetThuc,
      flagHuy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LopTinChiData &&
          other.dateCreated == this.dateCreated &&
          other.dateUpdated == this.dateUpdated &&
          other.id == this.id &&
          other.maLopHoc == this.maLopHoc &&
          other.maHocPhan == this.maHocPhan &&
          other.idGiangVien == this.idGiangVien &&
          other.idLopTruong == this.idLopTruong &&
          other.urlTruyCap == this.urlTruyCap &&
          other.hocKy == this.hocKy &&
          other.phongHoc == this.phongHoc &&
          other.ngayHoc == this.ngayHoc &&
          other.tietBatDau == this.tietBatDau &&
          other.tietKetThuc == this.tietKetThuc &&
          other.flagHuy == this.flagHuy);
}

class LopTinChiCompanion extends UpdateCompanion<LopTinChiData> {
  final Value<DateTime> dateCreated;
  final Value<DateTime> dateUpdated;
  final Value<int> id;
  final Value<String> maLopHoc;
  final Value<String> maHocPhan;
  final Value<int?> idGiangVien;
  final Value<int?> idLopTruong;
  final Value<String> urlTruyCap;
  final Value<String> hocKy;
  final Value<String?> phongHoc;
  final Value<int?> ngayHoc;
  final Value<int?> tietBatDau;
  final Value<int?> tietKetThuc;
  final Value<bool> flagHuy;
  const LopTinChiCompanion({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    this.maLopHoc = const Value.absent(),
    this.maHocPhan = const Value.absent(),
    this.idGiangVien = const Value.absent(),
    this.idLopTruong = const Value.absent(),
    this.urlTruyCap = const Value.absent(),
    this.hocKy = const Value.absent(),
    this.phongHoc = const Value.absent(),
    this.ngayHoc = const Value.absent(),
    this.tietBatDau = const Value.absent(),
    this.tietKetThuc = const Value.absent(),
    this.flagHuy = const Value.absent(),
  });
  LopTinChiCompanion.insert({
    this.dateCreated = const Value.absent(),
    this.dateUpdated = const Value.absent(),
    this.id = const Value.absent(),
    required String maLopHoc,
    required String maHocPhan,
    this.idGiangVien = const Value.absent(),
    this.idLopTruong = const Value.absent(),
    required String urlTruyCap,
    required String hocKy,
    this.phongHoc = const Value.absent(),
    this.ngayHoc = const Value.absent(),
    this.tietBatDau = const Value.absent(),
    this.tietKetThuc = const Value.absent(),
    this.flagHuy = const Value.absent(),
  })  : maLopHoc = Value(maLopHoc),
        maHocPhan = Value(maHocPhan),
        urlTruyCap = Value(urlTruyCap),
        hocKy = Value(hocKy);
  static Insertable<LopTinChiData> custom({
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateUpdated,
    Expression<int>? id,
    Expression<String>? maLopHoc,
    Expression<String>? maHocPhan,
    Expression<int>? idGiangVien,
    Expression<int>? idLopTruong,
    Expression<String>? urlTruyCap,
    Expression<String>? hocKy,
    Expression<String>? phongHoc,
    Expression<int>? ngayHoc,
    Expression<int>? tietBatDau,
    Expression<int>? tietKetThuc,
    Expression<bool>? flagHuy,
  }) {
    return RawValuesInsertable({
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateUpdated != null) 'date_updated': dateUpdated,
      if (id != null) 'id': id,
      if (maLopHoc != null) 'ma_lop_hoc': maLopHoc,
      if (maHocPhan != null) 'ma_hoc_phan': maHocPhan,
      if (idGiangVien != null) 'id_giang_vien': idGiangVien,
      if (idLopTruong != null) 'id_lop_truong': idLopTruong,
      if (urlTruyCap != null) 'url_truy_cap': urlTruyCap,
      if (hocKy != null) 'hoc_ky': hocKy,
      if (phongHoc != null) 'phong_hoc': phongHoc,
      if (ngayHoc != null) 'ngay_hoc': ngayHoc,
      if (tietBatDau != null) 'tiet_bat_dau': tietBatDau,
      if (tietKetThuc != null) 'tiet_ket_thuc': tietKetThuc,
      if (flagHuy != null) 'flag_huy': flagHuy,
    });
  }

  LopTinChiCompanion copyWith(
      {Value<DateTime>? dateCreated,
      Value<DateTime>? dateUpdated,
      Value<int>? id,
      Value<String>? maLopHoc,
      Value<String>? maHocPhan,
      Value<int?>? idGiangVien,
      Value<int?>? idLopTruong,
      Value<String>? urlTruyCap,
      Value<String>? hocKy,
      Value<String?>? phongHoc,
      Value<int?>? ngayHoc,
      Value<int?>? tietBatDau,
      Value<int?>? tietKetThuc,
      Value<bool>? flagHuy}) {
    return LopTinChiCompanion(
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      id: id ?? this.id,
      maLopHoc: maLopHoc ?? this.maLopHoc,
      maHocPhan: maHocPhan ?? this.maHocPhan,
      idGiangVien: idGiangVien ?? this.idGiangVien,
      idLopTruong: idLopTruong ?? this.idLopTruong,
      urlTruyCap: urlTruyCap ?? this.urlTruyCap,
      hocKy: hocKy ?? this.hocKy,
      phongHoc: phongHoc ?? this.phongHoc,
      ngayHoc: ngayHoc ?? this.ngayHoc,
      tietBatDau: tietBatDau ?? this.tietBatDau,
      tietKetThuc: tietKetThuc ?? this.tietKetThuc,
      flagHuy: flagHuy ?? this.flagHuy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateUpdated.present) {
      map['date_updated'] = Variable<DateTime>(dateUpdated.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (maLopHoc.present) {
      map['ma_lop_hoc'] = Variable<String>(maLopHoc.value);
    }
    if (maHocPhan.present) {
      map['ma_hoc_phan'] = Variable<String>(maHocPhan.value);
    }
    if (idGiangVien.present) {
      map['id_giang_vien'] = Variable<int>(idGiangVien.value);
    }
    if (idLopTruong.present) {
      map['id_lop_truong'] = Variable<int>(idLopTruong.value);
    }
    if (urlTruyCap.present) {
      map['url_truy_cap'] = Variable<String>(urlTruyCap.value);
    }
    if (hocKy.present) {
      map['hoc_ky'] = Variable<String>(hocKy.value);
    }
    if (phongHoc.present) {
      map['phong_hoc'] = Variable<String>(phongHoc.value);
    }
    if (ngayHoc.present) {
      map['ngay_hoc'] = Variable<int>(ngayHoc.value);
    }
    if (tietBatDau.present) {
      map['tiet_bat_dau'] = Variable<int>(tietBatDau.value);
    }
    if (tietKetThuc.present) {
      map['tiet_ket_thuc'] = Variable<int>(tietKetThuc.value);
    }
    if (flagHuy.present) {
      map['flag_huy'] = Variable<bool>(flagHuy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LopTinChiCompanion(')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateUpdated: $dateUpdated, ')
          ..write('id: $id, ')
          ..write('maLopHoc: $maLopHoc, ')
          ..write('maHocPhan: $maHocPhan, ')
          ..write('idGiangVien: $idGiangVien, ')
          ..write('idLopTruong: $idLopTruong, ')
          ..write('urlTruyCap: $urlTruyCap, ')
          ..write('hocKy: $hocKy, ')
          ..write('phongHoc: $phongHoc, ')
          ..write('ngayHoc: $ngayHoc, ')
          ..write('tietBatDau: $tietBatDau, ')
          ..write('tietKetThuc: $tietKetThuc, ')
          ..write('flagHuy: $flagHuy')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NienKhoaTable nienKhoa = $NienKhoaTable(this);
  late final $NhomChuyenMonTable nhomChuyenMon = $NhomChuyenMonTable(this);
  late final $GiangVienTable giangVien = $GiangVienTable(this);
  late final $TieuBanXetTuyenTable tieuBanXetTuyen =
      $TieuBanXetTuyenTable(this);
  late final $HocVienTable hocVien = $HocVienTable(this);
  late final $DeTaiThacSiTable deTaiThacSi = $DeTaiThacSiTable(this);
  late final $HocKyTable hocKy = $HocKyTable(this);
  late final $HocPhanTable hocPhan = $HocPhanTable(this);
  late final $LopTinChiTable lopTinChi = $LopTinChiTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        nienKhoa,
        nhomChuyenMon,
        giangVien,
        tieuBanXetTuyen,
        hocVien,
        deTaiThacSi,
        hocKy,
        hocPhan,
        lopTinChi
      ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$NienKhoaTableCreateCompanionBuilder = NienKhoaCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  required String tenNienKhoa,
  Value<DateTime?> batDau,
  Value<DateTime?> ketThuc,
});
typedef $$NienKhoaTableUpdateCompanionBuilder = NienKhoaCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  Value<String> tenNienKhoa,
  Value<DateTime?> batDau,
  Value<DateTime?> ketThuc,
});

final class $$NienKhoaTableReferences
    extends BaseReferences<_$AppDatabase, $NienKhoaTable, NienKhoaData> {
  $$NienKhoaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HocVienTable, List<HocVienData>>
      _hocVienRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.hocVien,
              aliasName: $_aliasNameGenerator(
                  db.nienKhoa.tenNienKhoa, db.hocVien.nienKhoa));

  $$HocVienTableProcessedTableManager get hocVienRefs {
    final manager = $$HocVienTableTableManager($_db, $_db.hocVien).filter((f) =>
        f.nienKhoa.tenNienKhoa
            .sqlEquals($_itemColumn<String>('ten_nien_khoa')!));

    final cache = $_typedResult.readTableOrNull(_hocVienRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$NienKhoaTableFilterComposer
    extends Composer<_$AppDatabase, $NienKhoaTable> {
  $$NienKhoaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tenNienKhoa => $composableBuilder(
      column: $table.tenNienKhoa, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get batDau => $composableBuilder(
      column: $table.batDau, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ketThuc => $composableBuilder(
      column: $table.ketThuc, builder: (column) => ColumnFilters(column));

  Expression<bool> hocVienRefs(
      Expression<bool> Function($$HocVienTableFilterComposer f) f) {
    final $$HocVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tenNienKhoa,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.nienKhoa,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableFilterComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NienKhoaTableOrderingComposer
    extends Composer<_$AppDatabase, $NienKhoaTable> {
  $$NienKhoaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tenNienKhoa => $composableBuilder(
      column: $table.tenNienKhoa, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get batDau => $composableBuilder(
      column: $table.batDau, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ketThuc => $composableBuilder(
      column: $table.ketThuc, builder: (column) => ColumnOrderings(column));
}

class $$NienKhoaTableAnnotationComposer
    extends Composer<_$AppDatabase, $NienKhoaTable> {
  $$NienKhoaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenNienKhoa => $composableBuilder(
      column: $table.tenNienKhoa, builder: (column) => column);

  GeneratedColumn<DateTime> get batDau =>
      $composableBuilder(column: $table.batDau, builder: (column) => column);

  GeneratedColumn<DateTime> get ketThuc =>
      $composableBuilder(column: $table.ketThuc, builder: (column) => column);

  Expression<T> hocVienRefs<T extends Object>(
      Expression<T> Function($$HocVienTableAnnotationComposer a) f) {
    final $$HocVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tenNienKhoa,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.nienKhoa,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableAnnotationComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NienKhoaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NienKhoaTable,
    NienKhoaData,
    $$NienKhoaTableFilterComposer,
    $$NienKhoaTableOrderingComposer,
    $$NienKhoaTableAnnotationComposer,
    $$NienKhoaTableCreateCompanionBuilder,
    $$NienKhoaTableUpdateCompanionBuilder,
    (NienKhoaData, $$NienKhoaTableReferences),
    NienKhoaData,
    PrefetchHooks Function({bool hocVienRefs})> {
  $$NienKhoaTableTableManager(_$AppDatabase db, $NienKhoaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NienKhoaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NienKhoaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NienKhoaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> tenNienKhoa = const Value.absent(),
            Value<DateTime?> batDau = const Value.absent(),
            Value<DateTime?> ketThuc = const Value.absent(),
          }) =>
              NienKhoaCompanion(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            tenNienKhoa: tenNienKhoa,
            batDau: batDau,
            ketThuc: ketThuc,
          ),
          createCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            required String tenNienKhoa,
            Value<DateTime?> batDau = const Value.absent(),
            Value<DateTime?> ketThuc = const Value.absent(),
          }) =>
              NienKhoaCompanion.insert(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            tenNienKhoa: tenNienKhoa,
            batDau: batDau,
            ketThuc: ketThuc,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$NienKhoaTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({hocVienRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (hocVienRefs) db.hocVien],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (hocVienRefs)
                    await $_getPrefetchedData<NienKhoaData, $NienKhoaTable,
                            HocVienData>(
                        currentTable: table,
                        referencedTable:
                            $$NienKhoaTableReferences._hocVienRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$NienKhoaTableReferences(db, table, p0)
                                .hocVienRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.nienKhoa == item.tenNienKhoa),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$NienKhoaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NienKhoaTable,
    NienKhoaData,
    $$NienKhoaTableFilterComposer,
    $$NienKhoaTableOrderingComposer,
    $$NienKhoaTableAnnotationComposer,
    $$NienKhoaTableCreateCompanionBuilder,
    $$NienKhoaTableUpdateCompanionBuilder,
    (NienKhoaData, $$NienKhoaTableReferences),
    NienKhoaData,
    PrefetchHooks Function({bool hocVienRefs})>;
typedef $$NhomChuyenMonTableCreateCompanionBuilder = NhomChuyenMonCompanion
    Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  required String tenNhom,
});
typedef $$NhomChuyenMonTableUpdateCompanionBuilder = NhomChuyenMonCompanion
    Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  Value<String> tenNhom,
});

final class $$NhomChuyenMonTableReferences extends BaseReferences<_$AppDatabase,
    $NhomChuyenMonTable, NhomChuyenMonData> {
  $$NhomChuyenMonTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GiangVienTable, List<GiangVienData>>
      _giangVienRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.giangVien,
              aliasName: $_aliasNameGenerator(
                  db.nhomChuyenMon.id, db.giangVien.idNhomChuyenMon));

  $$GiangVienTableProcessedTableManager get giangVienRefs {
    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien).filter(
        (f) => f.idNhomChuyenMon.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_giangVienRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$NhomChuyenMonTableFilterComposer
    extends Composer<_$AppDatabase, $NhomChuyenMonTable> {
  $$NhomChuyenMonTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tenNhom => $composableBuilder(
      column: $table.tenNhom, builder: (column) => ColumnFilters(column));

  Expression<bool> giangVienRefs(
      Expression<bool> Function($$GiangVienTableFilterComposer f) f) {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.idNhomChuyenMon,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NhomChuyenMonTableOrderingComposer
    extends Composer<_$AppDatabase, $NhomChuyenMonTable> {
  $$NhomChuyenMonTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tenNhom => $composableBuilder(
      column: $table.tenNhom, builder: (column) => ColumnOrderings(column));
}

class $$NhomChuyenMonTableAnnotationComposer
    extends Composer<_$AppDatabase, $NhomChuyenMonTable> {
  $$NhomChuyenMonTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenNhom =>
      $composableBuilder(column: $table.tenNhom, builder: (column) => column);

  Expression<T> giangVienRefs<T extends Object>(
      Expression<T> Function($$GiangVienTableAnnotationComposer a) f) {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.idNhomChuyenMon,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NhomChuyenMonTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NhomChuyenMonTable,
    NhomChuyenMonData,
    $$NhomChuyenMonTableFilterComposer,
    $$NhomChuyenMonTableOrderingComposer,
    $$NhomChuyenMonTableAnnotationComposer,
    $$NhomChuyenMonTableCreateCompanionBuilder,
    $$NhomChuyenMonTableUpdateCompanionBuilder,
    (NhomChuyenMonData, $$NhomChuyenMonTableReferences),
    NhomChuyenMonData,
    PrefetchHooks Function({bool giangVienRefs})> {
  $$NhomChuyenMonTableTableManager(_$AppDatabase db, $NhomChuyenMonTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NhomChuyenMonTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NhomChuyenMonTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NhomChuyenMonTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> tenNhom = const Value.absent(),
          }) =>
              NhomChuyenMonCompanion(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            tenNhom: tenNhom,
          ),
          createCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            required String tenNhom,
          }) =>
              NhomChuyenMonCompanion.insert(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            tenNhom: tenNhom,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$NhomChuyenMonTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({giangVienRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (giangVienRefs) db.giangVien],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (giangVienRefs)
                    await $_getPrefetchedData<NhomChuyenMonData,
                            $NhomChuyenMonTable, GiangVienData>(
                        currentTable: table,
                        referencedTable: $$NhomChuyenMonTableReferences
                            ._giangVienRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$NhomChuyenMonTableReferences(db, table, p0)
                                .giangVienRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.idNhomChuyenMon == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$NhomChuyenMonTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NhomChuyenMonTable,
    NhomChuyenMonData,
    $$NhomChuyenMonTableFilterComposer,
    $$NhomChuyenMonTableOrderingComposer,
    $$NhomChuyenMonTableAnnotationComposer,
    $$NhomChuyenMonTableCreateCompanionBuilder,
    $$NhomChuyenMonTableUpdateCompanionBuilder,
    (NhomChuyenMonData, $$NhomChuyenMonTableReferences),
    NhomChuyenMonData,
    PrefetchHooks Function({bool giangVienRefs})>;
typedef $$GiangVienTableCreateCompanionBuilder = GiangVienCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<String?> hocHam,
  Value<String?> hocVi,
  Value<int> id,
  required String hoTen,
  Value<String?> maCanBo,
  Value<String?> daiHoc,
  Value<String?> donVi,
  Value<bool> ngoaiTruong,
  Value<String?> chuyenNganh,
  Value<GioiTinh> gioiTinh,
  Value<int?> namNhanTs,
  Value<String?> sdt,
  Value<String?> email,
  Value<String?> cccd,
  Value<DateTime?> ngaySinh,
  Value<String?> stk,
  Value<String?> nganHang,
  Value<String?> mst,
  Value<String> note,
  Value<int?> idNhomChuyenMon,
});
typedef $$GiangVienTableUpdateCompanionBuilder = GiangVienCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<String?> hocHam,
  Value<String?> hocVi,
  Value<int> id,
  Value<String> hoTen,
  Value<String?> maCanBo,
  Value<String?> daiHoc,
  Value<String?> donVi,
  Value<bool> ngoaiTruong,
  Value<String?> chuyenNganh,
  Value<GioiTinh> gioiTinh,
  Value<int?> namNhanTs,
  Value<String?> sdt,
  Value<String?> email,
  Value<String?> cccd,
  Value<DateTime?> ngaySinh,
  Value<String?> stk,
  Value<String?> nganHang,
  Value<String?> mst,
  Value<String> note,
  Value<int?> idNhomChuyenMon,
});

final class $$GiangVienTableReferences
    extends BaseReferences<_$AppDatabase, $GiangVienTable, GiangVienData> {
  $$GiangVienTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NhomChuyenMonTable _idNhomChuyenMonTable(_$AppDatabase db) =>
      db.nhomChuyenMon.createAlias($_aliasNameGenerator(
          db.giangVien.idNhomChuyenMon, db.nhomChuyenMon.id));

  $$NhomChuyenMonTableProcessedTableManager? get idNhomChuyenMon {
    final $_column = $_itemColumn<int>('id_nhom_chuyen_mon');
    if ($_column == null) return null;
    final manager = $$NhomChuyenMonTableTableManager($_db, $_db.nhomChuyenMon)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idNhomChuyenMonTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$LopTinChiTable, List<LopTinChiData>>
      _lopTinChiRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.lopTinChi,
          aliasName:
              $_aliasNameGenerator(db.giangVien.id, db.lopTinChi.idGiangVien));

  $$LopTinChiTableProcessedTableManager get lopTinChiRefs {
    final manager = $$LopTinChiTableTableManager($_db, $_db.lopTinChi)
        .filter((f) => f.idGiangVien.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_lopTinChiRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GiangVienTableFilterComposer
    extends Composer<_$AppDatabase, $GiangVienTable> {
  $$GiangVienTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hocHam => $composableBuilder(
      column: $table.hocHam, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hocVi => $composableBuilder(
      column: $table.hocVi, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hoTen => $composableBuilder(
      column: $table.hoTen, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maCanBo => $composableBuilder(
      column: $table.maCanBo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get daiHoc => $composableBuilder(
      column: $table.daiHoc, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get donVi => $composableBuilder(
      column: $table.donVi, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ngoaiTruong => $composableBuilder(
      column: $table.ngoaiTruong, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get chuyenNganh => $composableBuilder(
      column: $table.chuyenNganh, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<GioiTinh, GioiTinh, String> get gioiTinh =>
      $composableBuilder(
          column: $table.gioiTinh,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get namNhanTs => $composableBuilder(
      column: $table.namNhanTs, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sdt => $composableBuilder(
      column: $table.sdt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cccd => $composableBuilder(
      column: $table.cccd, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ngaySinh => $composableBuilder(
      column: $table.ngaySinh, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stk => $composableBuilder(
      column: $table.stk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nganHang => $composableBuilder(
      column: $table.nganHang, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mst => $composableBuilder(
      column: $table.mst, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  $$NhomChuyenMonTableFilterComposer get idNhomChuyenMon {
    final $$NhomChuyenMonTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idNhomChuyenMon,
        referencedTable: $db.nhomChuyenMon,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NhomChuyenMonTableFilterComposer(
              $db: $db,
              $table: $db.nhomChuyenMon,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> lopTinChiRefs(
      Expression<bool> Function($$LopTinChiTableFilterComposer f) f) {
    final $$LopTinChiTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.lopTinChi,
        getReferencedColumn: (t) => t.idGiangVien,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LopTinChiTableFilterComposer(
              $db: $db,
              $table: $db.lopTinChi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GiangVienTableOrderingComposer
    extends Composer<_$AppDatabase, $GiangVienTable> {
  $$GiangVienTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hocHam => $composableBuilder(
      column: $table.hocHam, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hocVi => $composableBuilder(
      column: $table.hocVi, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hoTen => $composableBuilder(
      column: $table.hoTen, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maCanBo => $composableBuilder(
      column: $table.maCanBo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get daiHoc => $composableBuilder(
      column: $table.daiHoc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get donVi => $composableBuilder(
      column: $table.donVi, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ngoaiTruong => $composableBuilder(
      column: $table.ngoaiTruong, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get chuyenNganh => $composableBuilder(
      column: $table.chuyenNganh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gioiTinh => $composableBuilder(
      column: $table.gioiTinh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get namNhanTs => $composableBuilder(
      column: $table.namNhanTs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sdt => $composableBuilder(
      column: $table.sdt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cccd => $composableBuilder(
      column: $table.cccd, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ngaySinh => $composableBuilder(
      column: $table.ngaySinh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stk => $composableBuilder(
      column: $table.stk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nganHang => $composableBuilder(
      column: $table.nganHang, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mst => $composableBuilder(
      column: $table.mst, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  $$NhomChuyenMonTableOrderingComposer get idNhomChuyenMon {
    final $$NhomChuyenMonTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idNhomChuyenMon,
        referencedTable: $db.nhomChuyenMon,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NhomChuyenMonTableOrderingComposer(
              $db: $db,
              $table: $db.nhomChuyenMon,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GiangVienTableAnnotationComposer
    extends Composer<_$AppDatabase, $GiangVienTable> {
  $$GiangVienTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => column);

  GeneratedColumn<String> get hocHam =>
      $composableBuilder(column: $table.hocHam, builder: (column) => column);

  GeneratedColumn<String> get hocVi =>
      $composableBuilder(column: $table.hocVi, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get hoTen =>
      $composableBuilder(column: $table.hoTen, builder: (column) => column);

  GeneratedColumn<String> get maCanBo =>
      $composableBuilder(column: $table.maCanBo, builder: (column) => column);

  GeneratedColumn<String> get daiHoc =>
      $composableBuilder(column: $table.daiHoc, builder: (column) => column);

  GeneratedColumn<String> get donVi =>
      $composableBuilder(column: $table.donVi, builder: (column) => column);

  GeneratedColumn<bool> get ngoaiTruong => $composableBuilder(
      column: $table.ngoaiTruong, builder: (column) => column);

  GeneratedColumn<String> get chuyenNganh => $composableBuilder(
      column: $table.chuyenNganh, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GioiTinh, String> get gioiTinh =>
      $composableBuilder(column: $table.gioiTinh, builder: (column) => column);

  GeneratedColumn<int> get namNhanTs =>
      $composableBuilder(column: $table.namNhanTs, builder: (column) => column);

  GeneratedColumn<String> get sdt =>
      $composableBuilder(column: $table.sdt, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get cccd =>
      $composableBuilder(column: $table.cccd, builder: (column) => column);

  GeneratedColumn<DateTime> get ngaySinh =>
      $composableBuilder(column: $table.ngaySinh, builder: (column) => column);

  GeneratedColumn<String> get stk =>
      $composableBuilder(column: $table.stk, builder: (column) => column);

  GeneratedColumn<String> get nganHang =>
      $composableBuilder(column: $table.nganHang, builder: (column) => column);

  GeneratedColumn<String> get mst =>
      $composableBuilder(column: $table.mst, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$NhomChuyenMonTableAnnotationComposer get idNhomChuyenMon {
    final $$NhomChuyenMonTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idNhomChuyenMon,
        referencedTable: $db.nhomChuyenMon,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NhomChuyenMonTableAnnotationComposer(
              $db: $db,
              $table: $db.nhomChuyenMon,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> lopTinChiRefs<T extends Object>(
      Expression<T> Function($$LopTinChiTableAnnotationComposer a) f) {
    final $$LopTinChiTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.lopTinChi,
        getReferencedColumn: (t) => t.idGiangVien,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LopTinChiTableAnnotationComposer(
              $db: $db,
              $table: $db.lopTinChi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GiangVienTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GiangVienTable,
    GiangVienData,
    $$GiangVienTableFilterComposer,
    $$GiangVienTableOrderingComposer,
    $$GiangVienTableAnnotationComposer,
    $$GiangVienTableCreateCompanionBuilder,
    $$GiangVienTableUpdateCompanionBuilder,
    (GiangVienData, $$GiangVienTableReferences),
    GiangVienData,
    PrefetchHooks Function({bool idNhomChuyenMon, bool lopTinChiRefs})> {
  $$GiangVienTableTableManager(_$AppDatabase db, $GiangVienTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GiangVienTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GiangVienTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GiangVienTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<String?> hocHam = const Value.absent(),
            Value<String?> hocVi = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> hoTen = const Value.absent(),
            Value<String?> maCanBo = const Value.absent(),
            Value<String?> daiHoc = const Value.absent(),
            Value<String?> donVi = const Value.absent(),
            Value<bool> ngoaiTruong = const Value.absent(),
            Value<String?> chuyenNganh = const Value.absent(),
            Value<GioiTinh> gioiTinh = const Value.absent(),
            Value<int?> namNhanTs = const Value.absent(),
            Value<String?> sdt = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> cccd = const Value.absent(),
            Value<DateTime?> ngaySinh = const Value.absent(),
            Value<String?> stk = const Value.absent(),
            Value<String?> nganHang = const Value.absent(),
            Value<String?> mst = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<int?> idNhomChuyenMon = const Value.absent(),
          }) =>
              GiangVienCompanion(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            hocHam: hocHam,
            hocVi: hocVi,
            id: id,
            hoTen: hoTen,
            maCanBo: maCanBo,
            daiHoc: daiHoc,
            donVi: donVi,
            ngoaiTruong: ngoaiTruong,
            chuyenNganh: chuyenNganh,
            gioiTinh: gioiTinh,
            namNhanTs: namNhanTs,
            sdt: sdt,
            email: email,
            cccd: cccd,
            ngaySinh: ngaySinh,
            stk: stk,
            nganHang: nganHang,
            mst: mst,
            note: note,
            idNhomChuyenMon: idNhomChuyenMon,
          ),
          createCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<String?> hocHam = const Value.absent(),
            Value<String?> hocVi = const Value.absent(),
            Value<int> id = const Value.absent(),
            required String hoTen,
            Value<String?> maCanBo = const Value.absent(),
            Value<String?> daiHoc = const Value.absent(),
            Value<String?> donVi = const Value.absent(),
            Value<bool> ngoaiTruong = const Value.absent(),
            Value<String?> chuyenNganh = const Value.absent(),
            Value<GioiTinh> gioiTinh = const Value.absent(),
            Value<int?> namNhanTs = const Value.absent(),
            Value<String?> sdt = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> cccd = const Value.absent(),
            Value<DateTime?> ngaySinh = const Value.absent(),
            Value<String?> stk = const Value.absent(),
            Value<String?> nganHang = const Value.absent(),
            Value<String?> mst = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<int?> idNhomChuyenMon = const Value.absent(),
          }) =>
              GiangVienCompanion.insert(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            hocHam: hocHam,
            hocVi: hocVi,
            id: id,
            hoTen: hoTen,
            maCanBo: maCanBo,
            daiHoc: daiHoc,
            donVi: donVi,
            ngoaiTruong: ngoaiTruong,
            chuyenNganh: chuyenNganh,
            gioiTinh: gioiTinh,
            namNhanTs: namNhanTs,
            sdt: sdt,
            email: email,
            cccd: cccd,
            ngaySinh: ngaySinh,
            stk: stk,
            nganHang: nganHang,
            mst: mst,
            note: note,
            idNhomChuyenMon: idNhomChuyenMon,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GiangVienTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {idNhomChuyenMon = false, lopTinChiRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lopTinChiRefs) db.lopTinChi],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (idNhomChuyenMon) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idNhomChuyenMon,
                    referencedTable:
                        $$GiangVienTableReferences._idNhomChuyenMonTable(db),
                    referencedColumn:
                        $$GiangVienTableReferences._idNhomChuyenMonTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lopTinChiRefs)
                    await $_getPrefetchedData<GiangVienData, $GiangVienTable,
                            LopTinChiData>(
                        currentTable: table,
                        referencedTable:
                            $$GiangVienTableReferences._lopTinChiRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GiangVienTableReferences(db, table, p0)
                                .lopTinChiRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.idGiangVien == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GiangVienTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GiangVienTable,
    GiangVienData,
    $$GiangVienTableFilterComposer,
    $$GiangVienTableOrderingComposer,
    $$GiangVienTableAnnotationComposer,
    $$GiangVienTableCreateCompanionBuilder,
    $$GiangVienTableUpdateCompanionBuilder,
    (GiangVienData, $$GiangVienTableReferences),
    GiangVienData,
    PrefetchHooks Function({bool idNhomChuyenMon, bool lopTinChiRefs})>;
typedef $$TieuBanXetTuyenTableCreateCompanionBuilder = TieuBanXetTuyenCompanion
    Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  required int idChuTich,
  required int idThuKy,
  required int idUyVien1,
  required int idUyVien2,
  required int idUyVien3,
  Value<int?> tienChuTich,
  Value<int?> tienThuKy,
  Value<int?> tienUyVien,
});
typedef $$TieuBanXetTuyenTableUpdateCompanionBuilder = TieuBanXetTuyenCompanion
    Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  Value<int> idChuTich,
  Value<int> idThuKy,
  Value<int> idUyVien1,
  Value<int> idUyVien2,
  Value<int> idUyVien3,
  Value<int?> tienChuTich,
  Value<int?> tienThuKy,
  Value<int?> tienUyVien,
});

final class $$TieuBanXetTuyenTableReferences extends BaseReferences<
    _$AppDatabase, $TieuBanXetTuyenTable, TieuBanXetTuyenData> {
  $$TieuBanXetTuyenTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $GiangVienTable _idChuTichTable(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.tieuBanXetTuyen.idChuTich, db.giangVien.id));

  $$GiangVienTableProcessedTableManager get idChuTich {
    final $_column = $_itemColumn<int>('id_chu_tich')!;

    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idChuTichTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idThuKyTable(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.tieuBanXetTuyen.idThuKy, db.giangVien.id));

  $$GiangVienTableProcessedTableManager get idThuKy {
    final $_column = $_itemColumn<int>('id_thu_ky')!;

    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idThuKyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idUyVien1Table(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.tieuBanXetTuyen.idUyVien1, db.giangVien.id));

  $$GiangVienTableProcessedTableManager get idUyVien1 {
    final $_column = $_itemColumn<int>('id_uy_vien1')!;

    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUyVien1Table($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idUyVien2Table(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.tieuBanXetTuyen.idUyVien2, db.giangVien.id));

  $$GiangVienTableProcessedTableManager get idUyVien2 {
    final $_column = $_itemColumn<int>('id_uy_vien2')!;

    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUyVien2Table($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idUyVien3Table(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.tieuBanXetTuyen.idUyVien3, db.giangVien.id));

  $$GiangVienTableProcessedTableManager get idUyVien3 {
    final $_column = $_itemColumn<int>('id_uy_vien3')!;

    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUyVien3Table($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$HocVienTable, List<HocVienData>>
      _hocVienRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.hocVien,
              aliasName: $_aliasNameGenerator(
                  db.tieuBanXetTuyen.id, db.hocVien.idTieuBanXetTuyen));

  $$HocVienTableProcessedTableManager get hocVienRefs {
    final manager = $$HocVienTableTableManager($_db, $_db.hocVien).filter(
        (f) => f.idTieuBanXetTuyen.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_hocVienRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TieuBanXetTuyenTableFilterComposer
    extends Composer<_$AppDatabase, $TieuBanXetTuyenTable> {
  $$TieuBanXetTuyenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tienChuTich => $composableBuilder(
      column: $table.tienChuTich, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tienThuKy => $composableBuilder(
      column: $table.tienThuKy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tienUyVien => $composableBuilder(
      column: $table.tienUyVien, builder: (column) => ColumnFilters(column));

  $$GiangVienTableFilterComposer get idChuTich {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idChuTich,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idThuKy {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idThuKy,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idUyVien1 {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien1,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idUyVien2 {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien2,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idUyVien3 {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien3,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> hocVienRefs(
      Expression<bool> Function($$HocVienTableFilterComposer f) f) {
    final $$HocVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.idTieuBanXetTuyen,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableFilterComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TieuBanXetTuyenTableOrderingComposer
    extends Composer<_$AppDatabase, $TieuBanXetTuyenTable> {
  $$TieuBanXetTuyenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tienChuTich => $composableBuilder(
      column: $table.tienChuTich, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tienThuKy => $composableBuilder(
      column: $table.tienThuKy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tienUyVien => $composableBuilder(
      column: $table.tienUyVien, builder: (column) => ColumnOrderings(column));

  $$GiangVienTableOrderingComposer get idChuTich {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idChuTich,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idThuKy {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idThuKy,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idUyVien1 {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien1,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idUyVien2 {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien2,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idUyVien3 {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien3,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TieuBanXetTuyenTableAnnotationComposer
    extends Composer<_$AppDatabase, $TieuBanXetTuyenTable> {
  $$TieuBanXetTuyenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get tienChuTich => $composableBuilder(
      column: $table.tienChuTich, builder: (column) => column);

  GeneratedColumn<int> get tienThuKy =>
      $composableBuilder(column: $table.tienThuKy, builder: (column) => column);

  GeneratedColumn<int> get tienUyVien => $composableBuilder(
      column: $table.tienUyVien, builder: (column) => column);

  $$GiangVienTableAnnotationComposer get idChuTich {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idChuTich,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idThuKy {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idThuKy,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idUyVien1 {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien1,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idUyVien2 {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien2,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idUyVien3 {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien3,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> hocVienRefs<T extends Object>(
      Expression<T> Function($$HocVienTableAnnotationComposer a) f) {
    final $$HocVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.idTieuBanXetTuyen,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableAnnotationComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TieuBanXetTuyenTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TieuBanXetTuyenTable,
    TieuBanXetTuyenData,
    $$TieuBanXetTuyenTableFilterComposer,
    $$TieuBanXetTuyenTableOrderingComposer,
    $$TieuBanXetTuyenTableAnnotationComposer,
    $$TieuBanXetTuyenTableCreateCompanionBuilder,
    $$TieuBanXetTuyenTableUpdateCompanionBuilder,
    (TieuBanXetTuyenData, $$TieuBanXetTuyenTableReferences),
    TieuBanXetTuyenData,
    PrefetchHooks Function(
        {bool idChuTich,
        bool idThuKy,
        bool idUyVien1,
        bool idUyVien2,
        bool idUyVien3,
        bool hocVienRefs})> {
  $$TieuBanXetTuyenTableTableManager(
      _$AppDatabase db, $TieuBanXetTuyenTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TieuBanXetTuyenTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TieuBanXetTuyenTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TieuBanXetTuyenTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<int> idChuTich = const Value.absent(),
            Value<int> idThuKy = const Value.absent(),
            Value<int> idUyVien1 = const Value.absent(),
            Value<int> idUyVien2 = const Value.absent(),
            Value<int> idUyVien3 = const Value.absent(),
            Value<int?> tienChuTich = const Value.absent(),
            Value<int?> tienThuKy = const Value.absent(),
            Value<int?> tienUyVien = const Value.absent(),
          }) =>
              TieuBanXetTuyenCompanion(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            idChuTich: idChuTich,
            idThuKy: idThuKy,
            idUyVien1: idUyVien1,
            idUyVien2: idUyVien2,
            idUyVien3: idUyVien3,
            tienChuTich: tienChuTich,
            tienThuKy: tienThuKy,
            tienUyVien: tienUyVien,
          ),
          createCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            required int idChuTich,
            required int idThuKy,
            required int idUyVien1,
            required int idUyVien2,
            required int idUyVien3,
            Value<int?> tienChuTich = const Value.absent(),
            Value<int?> tienThuKy = const Value.absent(),
            Value<int?> tienUyVien = const Value.absent(),
          }) =>
              TieuBanXetTuyenCompanion.insert(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            idChuTich: idChuTich,
            idThuKy: idThuKy,
            idUyVien1: idUyVien1,
            idUyVien2: idUyVien2,
            idUyVien3: idUyVien3,
            tienChuTich: tienChuTich,
            tienThuKy: tienThuKy,
            tienUyVien: tienUyVien,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TieuBanXetTuyenTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {idChuTich = false,
              idThuKy = false,
              idUyVien1 = false,
              idUyVien2 = false,
              idUyVien3 = false,
              hocVienRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (hocVienRefs) db.hocVien],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (idChuTich) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idChuTich,
                    referencedTable:
                        $$TieuBanXetTuyenTableReferences._idChuTichTable(db),
                    referencedColumn:
                        $$TieuBanXetTuyenTableReferences._idChuTichTable(db).id,
                  ) as T;
                }
                if (idThuKy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idThuKy,
                    referencedTable:
                        $$TieuBanXetTuyenTableReferences._idThuKyTable(db),
                    referencedColumn:
                        $$TieuBanXetTuyenTableReferences._idThuKyTable(db).id,
                  ) as T;
                }
                if (idUyVien1) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idUyVien1,
                    referencedTable:
                        $$TieuBanXetTuyenTableReferences._idUyVien1Table(db),
                    referencedColumn:
                        $$TieuBanXetTuyenTableReferences._idUyVien1Table(db).id,
                  ) as T;
                }
                if (idUyVien2) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idUyVien2,
                    referencedTable:
                        $$TieuBanXetTuyenTableReferences._idUyVien2Table(db),
                    referencedColumn:
                        $$TieuBanXetTuyenTableReferences._idUyVien2Table(db).id,
                  ) as T;
                }
                if (idUyVien3) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idUyVien3,
                    referencedTable:
                        $$TieuBanXetTuyenTableReferences._idUyVien3Table(db),
                    referencedColumn:
                        $$TieuBanXetTuyenTableReferences._idUyVien3Table(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (hocVienRefs)
                    await $_getPrefetchedData<TieuBanXetTuyenData,
                            $TieuBanXetTuyenTable, HocVienData>(
                        currentTable: table,
                        referencedTable: $$TieuBanXetTuyenTableReferences
                            ._hocVienRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TieuBanXetTuyenTableReferences(db, table, p0)
                                .hocVienRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.idTieuBanXetTuyen == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TieuBanXetTuyenTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TieuBanXetTuyenTable,
    TieuBanXetTuyenData,
    $$TieuBanXetTuyenTableFilterComposer,
    $$TieuBanXetTuyenTableOrderingComposer,
    $$TieuBanXetTuyenTableAnnotationComposer,
    $$TieuBanXetTuyenTableCreateCompanionBuilder,
    $$TieuBanXetTuyenTableUpdateCompanionBuilder,
    (TieuBanXetTuyenData, $$TieuBanXetTuyenTableReferences),
    TieuBanXetTuyenData,
    PrefetchHooks Function(
        {bool idChuTich,
        bool idThuKy,
        bool idUyVien1,
        bool idUyVien2,
        bool idUyVien3,
        bool hocVienRefs})>;
typedef $$HocVienTableCreateCompanionBuilder = HocVienCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  Value<String?> idHoSoXetTuyen,
  required String nienKhoa,
  required String maHocVien,
  required String hoTen,
  Value<DateTime?> ngaySinh,
  Value<String?> gioiTinh,
  Value<String?> noiSinh,
  Value<String?> sdt,
  Value<String?> email,
  Value<String?> emailHust,
  Value<String?> truongTotNghiepDaiHoc,
  Value<String?> nganhTotNghiepDaiHoc,
  Value<String?> heTotNghiepDaiHoc,
  Value<String?> xepLoaiTotNghiepDaiHoc,
  Value<DateTime?> ngayTotNghiepDaiHoc,
  Value<String?> dinhHuongChuyenSau,
  Value<String?> hocPhanDuocMien,
  Value<String?> nganhDaoTaoThacSi,
  Value<bool> flagGiaHanLan1,
  Value<bool> flagGiaHanLan2,
  Value<bool> flagThanhToanXetTuyen,
  Value<TrangThaiHocVien?> trangThai,
  Value<int?> idTieuBanXetTuyen,
  Value<String?> idDienTuyenSinh,
});
typedef $$HocVienTableUpdateCompanionBuilder = HocVienCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  Value<String?> idHoSoXetTuyen,
  Value<String> nienKhoa,
  Value<String> maHocVien,
  Value<String> hoTen,
  Value<DateTime?> ngaySinh,
  Value<String?> gioiTinh,
  Value<String?> noiSinh,
  Value<String?> sdt,
  Value<String?> email,
  Value<String?> emailHust,
  Value<String?> truongTotNghiepDaiHoc,
  Value<String?> nganhTotNghiepDaiHoc,
  Value<String?> heTotNghiepDaiHoc,
  Value<String?> xepLoaiTotNghiepDaiHoc,
  Value<DateTime?> ngayTotNghiepDaiHoc,
  Value<String?> dinhHuongChuyenSau,
  Value<String?> hocPhanDuocMien,
  Value<String?> nganhDaoTaoThacSi,
  Value<bool> flagGiaHanLan1,
  Value<bool> flagGiaHanLan2,
  Value<bool> flagThanhToanXetTuyen,
  Value<TrangThaiHocVien?> trangThai,
  Value<int?> idTieuBanXetTuyen,
  Value<String?> idDienTuyenSinh,
});

final class $$HocVienTableReferences
    extends BaseReferences<_$AppDatabase, $HocVienTable, HocVienData> {
  $$HocVienTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NienKhoaTable _nienKhoaTable(_$AppDatabase db) =>
      db.nienKhoa.createAlias(
          $_aliasNameGenerator(db.hocVien.nienKhoa, db.nienKhoa.tenNienKhoa));

  $$NienKhoaTableProcessedTableManager get nienKhoa {
    final $_column = $_itemColumn<String>('nien_khoa')!;

    final manager = $$NienKhoaTableTableManager($_db, $_db.nienKhoa)
        .filter((f) => f.tenNienKhoa.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_nienKhoaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TieuBanXetTuyenTable _idTieuBanXetTuyenTable(_$AppDatabase db) =>
      db.tieuBanXetTuyen.createAlias($_aliasNameGenerator(
          db.hocVien.idTieuBanXetTuyen, db.tieuBanXetTuyen.id));

  $$TieuBanXetTuyenTableProcessedTableManager? get idTieuBanXetTuyen {
    final $_column = $_itemColumn<int>('id_tieu_ban_xet_tuyen');
    if ($_column == null) return null;
    final manager =
        $$TieuBanXetTuyenTableTableManager($_db, $_db.tieuBanXetTuyen)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTieuBanXetTuyenTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DeTaiThacSiTable, List<DeTaiThacSiData>>
      _deTaiThacSiRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.deTaiThacSi,
          aliasName:
              $_aliasNameGenerator(db.hocVien.id, db.deTaiThacSi.idHocVien));

  $$DeTaiThacSiTableProcessedTableManager get deTaiThacSiRefs {
    final manager = $$DeTaiThacSiTableTableManager($_db, $_db.deTaiThacSi)
        .filter((f) => f.idHocVien.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_deTaiThacSiRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$LopTinChiTable, List<LopTinChiData>>
      _lopTinChiRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.lopTinChi,
          aliasName:
              $_aliasNameGenerator(db.hocVien.id, db.lopTinChi.idLopTruong));

  $$LopTinChiTableProcessedTableManager get lopTinChiRefs {
    final manager = $$LopTinChiTableTableManager($_db, $_db.lopTinChi)
        .filter((f) => f.idLopTruong.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_lopTinChiRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$HocVienTableFilterComposer
    extends Composer<_$AppDatabase, $HocVienTable> {
  $$HocVienTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get idHoSoXetTuyen => $composableBuilder(
      column: $table.idHoSoXetTuyen,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maHocVien => $composableBuilder(
      column: $table.maHocVien, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hoTen => $composableBuilder(
      column: $table.hoTen, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ngaySinh => $composableBuilder(
      column: $table.ngaySinh, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gioiTinh => $composableBuilder(
      column: $table.gioiTinh, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get noiSinh => $composableBuilder(
      column: $table.noiSinh, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sdt => $composableBuilder(
      column: $table.sdt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emailHust => $composableBuilder(
      column: $table.emailHust, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get truongTotNghiepDaiHoc => $composableBuilder(
      column: $table.truongTotNghiepDaiHoc,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nganhTotNghiepDaiHoc => $composableBuilder(
      column: $table.nganhTotNghiepDaiHoc,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get heTotNghiepDaiHoc => $composableBuilder(
      column: $table.heTotNghiepDaiHoc,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get xepLoaiTotNghiepDaiHoc => $composableBuilder(
      column: $table.xepLoaiTotNghiepDaiHoc,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ngayTotNghiepDaiHoc => $composableBuilder(
      column: $table.ngayTotNghiepDaiHoc,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dinhHuongChuyenSau => $composableBuilder(
      column: $table.dinhHuongChuyenSau,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hocPhanDuocMien => $composableBuilder(
      column: $table.hocPhanDuocMien,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nganhDaoTaoThacSi => $composableBuilder(
      column: $table.nganhDaoTaoThacSi,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get flagGiaHanLan1 => $composableBuilder(
      column: $table.flagGiaHanLan1,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get flagGiaHanLan2 => $composableBuilder(
      column: $table.flagGiaHanLan2,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get flagThanhToanXetTuyen => $composableBuilder(
      column: $table.flagThanhToanXetTuyen,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TrangThaiHocVien?, TrangThaiHocVien, String>
      get trangThai => $composableBuilder(
          column: $table.trangThai,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get idDienTuyenSinh => $composableBuilder(
      column: $table.idDienTuyenSinh,
      builder: (column) => ColumnFilters(column));

  $$NienKhoaTableFilterComposer get nienKhoa {
    final $$NienKhoaTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nienKhoa,
        referencedTable: $db.nienKhoa,
        getReferencedColumn: (t) => t.tenNienKhoa,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NienKhoaTableFilterComposer(
              $db: $db,
              $table: $db.nienKhoa,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TieuBanXetTuyenTableFilterComposer get idTieuBanXetTuyen {
    final $$TieuBanXetTuyenTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idTieuBanXetTuyen,
        referencedTable: $db.tieuBanXetTuyen,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TieuBanXetTuyenTableFilterComposer(
              $db: $db,
              $table: $db.tieuBanXetTuyen,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> deTaiThacSiRefs(
      Expression<bool> Function($$DeTaiThacSiTableFilterComposer f) f) {
    final $$DeTaiThacSiTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.deTaiThacSi,
        getReferencedColumn: (t) => t.idHocVien,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DeTaiThacSiTableFilterComposer(
              $db: $db,
              $table: $db.deTaiThacSi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> lopTinChiRefs(
      Expression<bool> Function($$LopTinChiTableFilterComposer f) f) {
    final $$LopTinChiTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.lopTinChi,
        getReferencedColumn: (t) => t.idLopTruong,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LopTinChiTableFilterComposer(
              $db: $db,
              $table: $db.lopTinChi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HocVienTableOrderingComposer
    extends Composer<_$AppDatabase, $HocVienTable> {
  $$HocVienTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get idHoSoXetTuyen => $composableBuilder(
      column: $table.idHoSoXetTuyen,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maHocVien => $composableBuilder(
      column: $table.maHocVien, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hoTen => $composableBuilder(
      column: $table.hoTen, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ngaySinh => $composableBuilder(
      column: $table.ngaySinh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gioiTinh => $composableBuilder(
      column: $table.gioiTinh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get noiSinh => $composableBuilder(
      column: $table.noiSinh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sdt => $composableBuilder(
      column: $table.sdt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emailHust => $composableBuilder(
      column: $table.emailHust, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get truongTotNghiepDaiHoc => $composableBuilder(
      column: $table.truongTotNghiepDaiHoc,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nganhTotNghiepDaiHoc => $composableBuilder(
      column: $table.nganhTotNghiepDaiHoc,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get heTotNghiepDaiHoc => $composableBuilder(
      column: $table.heTotNghiepDaiHoc,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get xepLoaiTotNghiepDaiHoc => $composableBuilder(
      column: $table.xepLoaiTotNghiepDaiHoc,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ngayTotNghiepDaiHoc => $composableBuilder(
      column: $table.ngayTotNghiepDaiHoc,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dinhHuongChuyenSau => $composableBuilder(
      column: $table.dinhHuongChuyenSau,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hocPhanDuocMien => $composableBuilder(
      column: $table.hocPhanDuocMien,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nganhDaoTaoThacSi => $composableBuilder(
      column: $table.nganhDaoTaoThacSi,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get flagGiaHanLan1 => $composableBuilder(
      column: $table.flagGiaHanLan1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get flagGiaHanLan2 => $composableBuilder(
      column: $table.flagGiaHanLan2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get flagThanhToanXetTuyen => $composableBuilder(
      column: $table.flagThanhToanXetTuyen,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trangThai => $composableBuilder(
      column: $table.trangThai, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get idDienTuyenSinh => $composableBuilder(
      column: $table.idDienTuyenSinh,
      builder: (column) => ColumnOrderings(column));

  $$NienKhoaTableOrderingComposer get nienKhoa {
    final $$NienKhoaTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nienKhoa,
        referencedTable: $db.nienKhoa,
        getReferencedColumn: (t) => t.tenNienKhoa,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NienKhoaTableOrderingComposer(
              $db: $db,
              $table: $db.nienKhoa,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TieuBanXetTuyenTableOrderingComposer get idTieuBanXetTuyen {
    final $$TieuBanXetTuyenTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idTieuBanXetTuyen,
        referencedTable: $db.tieuBanXetTuyen,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TieuBanXetTuyenTableOrderingComposer(
              $db: $db,
              $table: $db.tieuBanXetTuyen,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HocVienTableAnnotationComposer
    extends Composer<_$AppDatabase, $HocVienTable> {
  $$HocVienTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get idHoSoXetTuyen => $composableBuilder(
      column: $table.idHoSoXetTuyen, builder: (column) => column);

  GeneratedColumn<String> get maHocVien =>
      $composableBuilder(column: $table.maHocVien, builder: (column) => column);

  GeneratedColumn<String> get hoTen =>
      $composableBuilder(column: $table.hoTen, builder: (column) => column);

  GeneratedColumn<DateTime> get ngaySinh =>
      $composableBuilder(column: $table.ngaySinh, builder: (column) => column);

  GeneratedColumn<String> get gioiTinh =>
      $composableBuilder(column: $table.gioiTinh, builder: (column) => column);

  GeneratedColumn<String> get noiSinh =>
      $composableBuilder(column: $table.noiSinh, builder: (column) => column);

  GeneratedColumn<String> get sdt =>
      $composableBuilder(column: $table.sdt, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get emailHust =>
      $composableBuilder(column: $table.emailHust, builder: (column) => column);

  GeneratedColumn<String> get truongTotNghiepDaiHoc => $composableBuilder(
      column: $table.truongTotNghiepDaiHoc, builder: (column) => column);

  GeneratedColumn<String> get nganhTotNghiepDaiHoc => $composableBuilder(
      column: $table.nganhTotNghiepDaiHoc, builder: (column) => column);

  GeneratedColumn<String> get heTotNghiepDaiHoc => $composableBuilder(
      column: $table.heTotNghiepDaiHoc, builder: (column) => column);

  GeneratedColumn<String> get xepLoaiTotNghiepDaiHoc => $composableBuilder(
      column: $table.xepLoaiTotNghiepDaiHoc, builder: (column) => column);

  GeneratedColumn<DateTime> get ngayTotNghiepDaiHoc => $composableBuilder(
      column: $table.ngayTotNghiepDaiHoc, builder: (column) => column);

  GeneratedColumn<String> get dinhHuongChuyenSau => $composableBuilder(
      column: $table.dinhHuongChuyenSau, builder: (column) => column);

  GeneratedColumn<String> get hocPhanDuocMien => $composableBuilder(
      column: $table.hocPhanDuocMien, builder: (column) => column);

  GeneratedColumn<String> get nganhDaoTaoThacSi => $composableBuilder(
      column: $table.nganhDaoTaoThacSi, builder: (column) => column);

  GeneratedColumn<bool> get flagGiaHanLan1 => $composableBuilder(
      column: $table.flagGiaHanLan1, builder: (column) => column);

  GeneratedColumn<bool> get flagGiaHanLan2 => $composableBuilder(
      column: $table.flagGiaHanLan2, builder: (column) => column);

  GeneratedColumn<bool> get flagThanhToanXetTuyen => $composableBuilder(
      column: $table.flagThanhToanXetTuyen, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TrangThaiHocVien?, String> get trangThai =>
      $composableBuilder(column: $table.trangThai, builder: (column) => column);

  GeneratedColumn<String> get idDienTuyenSinh => $composableBuilder(
      column: $table.idDienTuyenSinh, builder: (column) => column);

  $$NienKhoaTableAnnotationComposer get nienKhoa {
    final $$NienKhoaTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nienKhoa,
        referencedTable: $db.nienKhoa,
        getReferencedColumn: (t) => t.tenNienKhoa,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NienKhoaTableAnnotationComposer(
              $db: $db,
              $table: $db.nienKhoa,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TieuBanXetTuyenTableAnnotationComposer get idTieuBanXetTuyen {
    final $$TieuBanXetTuyenTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idTieuBanXetTuyen,
        referencedTable: $db.tieuBanXetTuyen,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TieuBanXetTuyenTableAnnotationComposer(
              $db: $db,
              $table: $db.tieuBanXetTuyen,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> deTaiThacSiRefs<T extends Object>(
      Expression<T> Function($$DeTaiThacSiTableAnnotationComposer a) f) {
    final $$DeTaiThacSiTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.deTaiThacSi,
        getReferencedColumn: (t) => t.idHocVien,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DeTaiThacSiTableAnnotationComposer(
              $db: $db,
              $table: $db.deTaiThacSi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> lopTinChiRefs<T extends Object>(
      Expression<T> Function($$LopTinChiTableAnnotationComposer a) f) {
    final $$LopTinChiTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.lopTinChi,
        getReferencedColumn: (t) => t.idLopTruong,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LopTinChiTableAnnotationComposer(
              $db: $db,
              $table: $db.lopTinChi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HocVienTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HocVienTable,
    HocVienData,
    $$HocVienTableFilterComposer,
    $$HocVienTableOrderingComposer,
    $$HocVienTableAnnotationComposer,
    $$HocVienTableCreateCompanionBuilder,
    $$HocVienTableUpdateCompanionBuilder,
    (HocVienData, $$HocVienTableReferences),
    HocVienData,
    PrefetchHooks Function(
        {bool nienKhoa,
        bool idTieuBanXetTuyen,
        bool deTaiThacSiRefs,
        bool lopTinChiRefs})> {
  $$HocVienTableTableManager(_$AppDatabase db, $HocVienTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HocVienTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HocVienTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HocVienTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String?> idHoSoXetTuyen = const Value.absent(),
            Value<String> nienKhoa = const Value.absent(),
            Value<String> maHocVien = const Value.absent(),
            Value<String> hoTen = const Value.absent(),
            Value<DateTime?> ngaySinh = const Value.absent(),
            Value<String?> gioiTinh = const Value.absent(),
            Value<String?> noiSinh = const Value.absent(),
            Value<String?> sdt = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> emailHust = const Value.absent(),
            Value<String?> truongTotNghiepDaiHoc = const Value.absent(),
            Value<String?> nganhTotNghiepDaiHoc = const Value.absent(),
            Value<String?> heTotNghiepDaiHoc = const Value.absent(),
            Value<String?> xepLoaiTotNghiepDaiHoc = const Value.absent(),
            Value<DateTime?> ngayTotNghiepDaiHoc = const Value.absent(),
            Value<String?> dinhHuongChuyenSau = const Value.absent(),
            Value<String?> hocPhanDuocMien = const Value.absent(),
            Value<String?> nganhDaoTaoThacSi = const Value.absent(),
            Value<bool> flagGiaHanLan1 = const Value.absent(),
            Value<bool> flagGiaHanLan2 = const Value.absent(),
            Value<bool> flagThanhToanXetTuyen = const Value.absent(),
            Value<TrangThaiHocVien?> trangThai = const Value.absent(),
            Value<int?> idTieuBanXetTuyen = const Value.absent(),
            Value<String?> idDienTuyenSinh = const Value.absent(),
          }) =>
              HocVienCompanion(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            idHoSoXetTuyen: idHoSoXetTuyen,
            nienKhoa: nienKhoa,
            maHocVien: maHocVien,
            hoTen: hoTen,
            ngaySinh: ngaySinh,
            gioiTinh: gioiTinh,
            noiSinh: noiSinh,
            sdt: sdt,
            email: email,
            emailHust: emailHust,
            truongTotNghiepDaiHoc: truongTotNghiepDaiHoc,
            nganhTotNghiepDaiHoc: nganhTotNghiepDaiHoc,
            heTotNghiepDaiHoc: heTotNghiepDaiHoc,
            xepLoaiTotNghiepDaiHoc: xepLoaiTotNghiepDaiHoc,
            ngayTotNghiepDaiHoc: ngayTotNghiepDaiHoc,
            dinhHuongChuyenSau: dinhHuongChuyenSau,
            hocPhanDuocMien: hocPhanDuocMien,
            nganhDaoTaoThacSi: nganhDaoTaoThacSi,
            flagGiaHanLan1: flagGiaHanLan1,
            flagGiaHanLan2: flagGiaHanLan2,
            flagThanhToanXetTuyen: flagThanhToanXetTuyen,
            trangThai: trangThai,
            idTieuBanXetTuyen: idTieuBanXetTuyen,
            idDienTuyenSinh: idDienTuyenSinh,
          ),
          createCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String?> idHoSoXetTuyen = const Value.absent(),
            required String nienKhoa,
            required String maHocVien,
            required String hoTen,
            Value<DateTime?> ngaySinh = const Value.absent(),
            Value<String?> gioiTinh = const Value.absent(),
            Value<String?> noiSinh = const Value.absent(),
            Value<String?> sdt = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> emailHust = const Value.absent(),
            Value<String?> truongTotNghiepDaiHoc = const Value.absent(),
            Value<String?> nganhTotNghiepDaiHoc = const Value.absent(),
            Value<String?> heTotNghiepDaiHoc = const Value.absent(),
            Value<String?> xepLoaiTotNghiepDaiHoc = const Value.absent(),
            Value<DateTime?> ngayTotNghiepDaiHoc = const Value.absent(),
            Value<String?> dinhHuongChuyenSau = const Value.absent(),
            Value<String?> hocPhanDuocMien = const Value.absent(),
            Value<String?> nganhDaoTaoThacSi = const Value.absent(),
            Value<bool> flagGiaHanLan1 = const Value.absent(),
            Value<bool> flagGiaHanLan2 = const Value.absent(),
            Value<bool> flagThanhToanXetTuyen = const Value.absent(),
            Value<TrangThaiHocVien?> trangThai = const Value.absent(),
            Value<int?> idTieuBanXetTuyen = const Value.absent(),
            Value<String?> idDienTuyenSinh = const Value.absent(),
          }) =>
              HocVienCompanion.insert(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            idHoSoXetTuyen: idHoSoXetTuyen,
            nienKhoa: nienKhoa,
            maHocVien: maHocVien,
            hoTen: hoTen,
            ngaySinh: ngaySinh,
            gioiTinh: gioiTinh,
            noiSinh: noiSinh,
            sdt: sdt,
            email: email,
            emailHust: emailHust,
            truongTotNghiepDaiHoc: truongTotNghiepDaiHoc,
            nganhTotNghiepDaiHoc: nganhTotNghiepDaiHoc,
            heTotNghiepDaiHoc: heTotNghiepDaiHoc,
            xepLoaiTotNghiepDaiHoc: xepLoaiTotNghiepDaiHoc,
            ngayTotNghiepDaiHoc: ngayTotNghiepDaiHoc,
            dinhHuongChuyenSau: dinhHuongChuyenSau,
            hocPhanDuocMien: hocPhanDuocMien,
            nganhDaoTaoThacSi: nganhDaoTaoThacSi,
            flagGiaHanLan1: flagGiaHanLan1,
            flagGiaHanLan2: flagGiaHanLan2,
            flagThanhToanXetTuyen: flagThanhToanXetTuyen,
            trangThai: trangThai,
            idTieuBanXetTuyen: idTieuBanXetTuyen,
            idDienTuyenSinh: idDienTuyenSinh,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$HocVienTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {nienKhoa = false,
              idTieuBanXetTuyen = false,
              deTaiThacSiRefs = false,
              lopTinChiRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (deTaiThacSiRefs) db.deTaiThacSi,
                if (lopTinChiRefs) db.lopTinChi
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (nienKhoa) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.nienKhoa,
                    referencedTable:
                        $$HocVienTableReferences._nienKhoaTable(db),
                    referencedColumn:
                        $$HocVienTableReferences._nienKhoaTable(db).tenNienKhoa,
                  ) as T;
                }
                if (idTieuBanXetTuyen) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idTieuBanXetTuyen,
                    referencedTable:
                        $$HocVienTableReferences._idTieuBanXetTuyenTable(db),
                    referencedColumn:
                        $$HocVienTableReferences._idTieuBanXetTuyenTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (deTaiThacSiRefs)
                    await $_getPrefetchedData<HocVienData, $HocVienTable,
                            DeTaiThacSiData>(
                        currentTable: table,
                        referencedTable:
                            $$HocVienTableReferences._deTaiThacSiRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$HocVienTableReferences(db, table, p0)
                                .deTaiThacSiRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.idHocVien == item.id),
                        typedResults: items),
                  if (lopTinChiRefs)
                    await $_getPrefetchedData<HocVienData, $HocVienTable,
                            LopTinChiData>(
                        currentTable: table,
                        referencedTable:
                            $$HocVienTableReferences._lopTinChiRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$HocVienTableReferences(db, table, p0)
                                .lopTinChiRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.idLopTruong == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$HocVienTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HocVienTable,
    HocVienData,
    $$HocVienTableFilterComposer,
    $$HocVienTableOrderingComposer,
    $$HocVienTableAnnotationComposer,
    $$HocVienTableCreateCompanionBuilder,
    $$HocVienTableUpdateCompanionBuilder,
    (HocVienData, $$HocVienTableReferences),
    HocVienData,
    PrefetchHooks Function(
        {bool nienKhoa,
        bool idTieuBanXetTuyen,
        bool deTaiThacSiRefs,
        bool lopTinChiRefs})>;
typedef $$DeTaiThacSiTableCreateCompanionBuilder = DeTaiThacSiCompanion
    Function({
  Value<int> id,
  required int idGiangVien,
  required String tenTiengViet,
  required String tenTiengAnh,
  Value<String> ghiChu,
  Value<int?> idHocVien,
  Value<DateTime?> ngayGiao,
  Value<String?> soQdGiao,
  Value<DateTime?> hanBaoVe,
  Value<String?> soQdBaoVe,
  Value<DateTime?> ngayBaoVe,
  Value<int?> idChuTich,
  Value<int?> idPhanBien1,
  Value<int?> idPhanBien2,
  Value<int?> idUyVien,
  Value<int?> idThuKy,
  Value<bool> flagGiaoDeTai,
  Value<bool> flagThanhToan,
  Value<bool> flagDangKyBaoVe,
  Value<bool> flagNopHoSo,
});
typedef $$DeTaiThacSiTableUpdateCompanionBuilder = DeTaiThacSiCompanion
    Function({
  Value<int> id,
  Value<int> idGiangVien,
  Value<String> tenTiengViet,
  Value<String> tenTiengAnh,
  Value<String> ghiChu,
  Value<int?> idHocVien,
  Value<DateTime?> ngayGiao,
  Value<String?> soQdGiao,
  Value<DateTime?> hanBaoVe,
  Value<String?> soQdBaoVe,
  Value<DateTime?> ngayBaoVe,
  Value<int?> idChuTich,
  Value<int?> idPhanBien1,
  Value<int?> idPhanBien2,
  Value<int?> idUyVien,
  Value<int?> idThuKy,
  Value<bool> flagGiaoDeTai,
  Value<bool> flagThanhToan,
  Value<bool> flagDangKyBaoVe,
  Value<bool> flagNopHoSo,
});

final class $$DeTaiThacSiTableReferences
    extends BaseReferences<_$AppDatabase, $DeTaiThacSiTable, DeTaiThacSiData> {
  $$DeTaiThacSiTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GiangVienTable _idGiangVienTable(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.deTaiThacSi.idGiangVien, db.giangVien.id));

  $$GiangVienTableProcessedTableManager get idGiangVien {
    final $_column = $_itemColumn<int>('id_giang_vien')!;

    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idGiangVienTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $HocVienTable _idHocVienTable(_$AppDatabase db) =>
      db.hocVien.createAlias(
          $_aliasNameGenerator(db.deTaiThacSi.idHocVien, db.hocVien.id));

  $$HocVienTableProcessedTableManager? get idHocVien {
    final $_column = $_itemColumn<int>('id_hoc_vien');
    if ($_column == null) return null;
    final manager = $$HocVienTableTableManager($_db, $_db.hocVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idHocVienTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idChuTichTable(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.deTaiThacSi.idChuTich, db.giangVien.id));

  $$GiangVienTableProcessedTableManager? get idChuTich {
    final $_column = $_itemColumn<int>('id_chu_tich');
    if ($_column == null) return null;
    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idChuTichTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idPhanBien1Table(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.deTaiThacSi.idPhanBien1, db.giangVien.id));

  $$GiangVienTableProcessedTableManager? get idPhanBien1 {
    final $_column = $_itemColumn<int>('id_phan_bien1');
    if ($_column == null) return null;
    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPhanBien1Table($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idPhanBien2Table(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.deTaiThacSi.idPhanBien2, db.giangVien.id));

  $$GiangVienTableProcessedTableManager? get idPhanBien2 {
    final $_column = $_itemColumn<int>('id_phan_bien2');
    if ($_column == null) return null;
    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPhanBien2Table($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idUyVienTable(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.deTaiThacSi.idUyVien, db.giangVien.id));

  $$GiangVienTableProcessedTableManager? get idUyVien {
    final $_column = $_itemColumn<int>('id_uy_vien');
    if ($_column == null) return null;
    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUyVienTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idThuKyTable(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.deTaiThacSi.idThuKy, db.giangVien.id));

  $$GiangVienTableProcessedTableManager? get idThuKy {
    final $_column = $_itemColumn<int>('id_thu_ky');
    if ($_column == null) return null;
    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idThuKyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DeTaiThacSiTableFilterComposer
    extends Composer<_$AppDatabase, $DeTaiThacSiTable> {
  $$DeTaiThacSiTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tenTiengViet => $composableBuilder(
      column: $table.tenTiengViet, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tenTiengAnh => $composableBuilder(
      column: $table.tenTiengAnh, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ghiChu => $composableBuilder(
      column: $table.ghiChu, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ngayGiao => $composableBuilder(
      column: $table.ngayGiao, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get soQdGiao => $composableBuilder(
      column: $table.soQdGiao, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get hanBaoVe => $composableBuilder(
      column: $table.hanBaoVe, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get soQdBaoVe => $composableBuilder(
      column: $table.soQdBaoVe, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ngayBaoVe => $composableBuilder(
      column: $table.ngayBaoVe, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get namBaoVe => $composableBuilder(
      column: $table.namBaoVe, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get flagGiaoDeTai => $composableBuilder(
      column: $table.flagGiaoDeTai, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get flagThanhToan => $composableBuilder(
      column: $table.flagThanhToan, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get flagDangKyBaoVe => $composableBuilder(
      column: $table.flagDangKyBaoVe,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get flagNopHoSo => $composableBuilder(
      column: $table.flagNopHoSo, builder: (column) => ColumnFilters(column));

  $$GiangVienTableFilterComposer get idGiangVien {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idGiangVien,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$HocVienTableFilterComposer get idHocVien {
    final $$HocVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idHocVien,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableFilterComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idChuTich {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idChuTich,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idPhanBien1 {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idPhanBien1,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idPhanBien2 {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idPhanBien2,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idUyVien {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idThuKy {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idThuKy,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DeTaiThacSiTableOrderingComposer
    extends Composer<_$AppDatabase, $DeTaiThacSiTable> {
  $$DeTaiThacSiTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tenTiengViet => $composableBuilder(
      column: $table.tenTiengViet,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tenTiengAnh => $composableBuilder(
      column: $table.tenTiengAnh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ghiChu => $composableBuilder(
      column: $table.ghiChu, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ngayGiao => $composableBuilder(
      column: $table.ngayGiao, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get soQdGiao => $composableBuilder(
      column: $table.soQdGiao, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get hanBaoVe => $composableBuilder(
      column: $table.hanBaoVe, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get soQdBaoVe => $composableBuilder(
      column: $table.soQdBaoVe, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ngayBaoVe => $composableBuilder(
      column: $table.ngayBaoVe, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get namBaoVe => $composableBuilder(
      column: $table.namBaoVe, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get flagGiaoDeTai => $composableBuilder(
      column: $table.flagGiaoDeTai,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get flagThanhToan => $composableBuilder(
      column: $table.flagThanhToan,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get flagDangKyBaoVe => $composableBuilder(
      column: $table.flagDangKyBaoVe,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get flagNopHoSo => $composableBuilder(
      column: $table.flagNopHoSo, builder: (column) => ColumnOrderings(column));

  $$GiangVienTableOrderingComposer get idGiangVien {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idGiangVien,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$HocVienTableOrderingComposer get idHocVien {
    final $$HocVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idHocVien,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableOrderingComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idChuTich {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idChuTich,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idPhanBien1 {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idPhanBien1,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idPhanBien2 {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idPhanBien2,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idUyVien {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idThuKy {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idThuKy,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DeTaiThacSiTableAnnotationComposer
    extends Composer<_$AppDatabase, $DeTaiThacSiTable> {
  $$DeTaiThacSiTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenTiengViet => $composableBuilder(
      column: $table.tenTiengViet, builder: (column) => column);

  GeneratedColumn<String> get tenTiengAnh => $composableBuilder(
      column: $table.tenTiengAnh, builder: (column) => column);

  GeneratedColumn<String> get ghiChu =>
      $composableBuilder(column: $table.ghiChu, builder: (column) => column);

  GeneratedColumn<DateTime> get ngayGiao =>
      $composableBuilder(column: $table.ngayGiao, builder: (column) => column);

  GeneratedColumn<String> get soQdGiao =>
      $composableBuilder(column: $table.soQdGiao, builder: (column) => column);

  GeneratedColumn<DateTime> get hanBaoVe =>
      $composableBuilder(column: $table.hanBaoVe, builder: (column) => column);

  GeneratedColumn<String> get soQdBaoVe =>
      $composableBuilder(column: $table.soQdBaoVe, builder: (column) => column);

  GeneratedColumn<DateTime> get ngayBaoVe =>
      $composableBuilder(column: $table.ngayBaoVe, builder: (column) => column);

  GeneratedColumn<int> get namBaoVe =>
      $composableBuilder(column: $table.namBaoVe, builder: (column) => column);

  GeneratedColumn<bool> get flagGiaoDeTai => $composableBuilder(
      column: $table.flagGiaoDeTai, builder: (column) => column);

  GeneratedColumn<bool> get flagThanhToan => $composableBuilder(
      column: $table.flagThanhToan, builder: (column) => column);

  GeneratedColumn<bool> get flagDangKyBaoVe => $composableBuilder(
      column: $table.flagDangKyBaoVe, builder: (column) => column);

  GeneratedColumn<bool> get flagNopHoSo => $composableBuilder(
      column: $table.flagNopHoSo, builder: (column) => column);

  $$GiangVienTableAnnotationComposer get idGiangVien {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idGiangVien,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$HocVienTableAnnotationComposer get idHocVien {
    final $$HocVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idHocVien,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableAnnotationComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idChuTich {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idChuTich,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idPhanBien1 {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idPhanBien1,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idPhanBien2 {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idPhanBien2,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idUyVien {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idUyVien,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idThuKy {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idThuKy,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DeTaiThacSiTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DeTaiThacSiTable,
    DeTaiThacSiData,
    $$DeTaiThacSiTableFilterComposer,
    $$DeTaiThacSiTableOrderingComposer,
    $$DeTaiThacSiTableAnnotationComposer,
    $$DeTaiThacSiTableCreateCompanionBuilder,
    $$DeTaiThacSiTableUpdateCompanionBuilder,
    (DeTaiThacSiData, $$DeTaiThacSiTableReferences),
    DeTaiThacSiData,
    PrefetchHooks Function(
        {bool idGiangVien,
        bool idHocVien,
        bool idChuTich,
        bool idPhanBien1,
        bool idPhanBien2,
        bool idUyVien,
        bool idThuKy})> {
  $$DeTaiThacSiTableTableManager(_$AppDatabase db, $DeTaiThacSiTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeTaiThacSiTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DeTaiThacSiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeTaiThacSiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> idGiangVien = const Value.absent(),
            Value<String> tenTiengViet = const Value.absent(),
            Value<String> tenTiengAnh = const Value.absent(),
            Value<String> ghiChu = const Value.absent(),
            Value<int?> idHocVien = const Value.absent(),
            Value<DateTime?> ngayGiao = const Value.absent(),
            Value<String?> soQdGiao = const Value.absent(),
            Value<DateTime?> hanBaoVe = const Value.absent(),
            Value<String?> soQdBaoVe = const Value.absent(),
            Value<DateTime?> ngayBaoVe = const Value.absent(),
            Value<int?> idChuTich = const Value.absent(),
            Value<int?> idPhanBien1 = const Value.absent(),
            Value<int?> idPhanBien2 = const Value.absent(),
            Value<int?> idUyVien = const Value.absent(),
            Value<int?> idThuKy = const Value.absent(),
            Value<bool> flagGiaoDeTai = const Value.absent(),
            Value<bool> flagThanhToan = const Value.absent(),
            Value<bool> flagDangKyBaoVe = const Value.absent(),
            Value<bool> flagNopHoSo = const Value.absent(),
          }) =>
              DeTaiThacSiCompanion(
            id: id,
            idGiangVien: idGiangVien,
            tenTiengViet: tenTiengViet,
            tenTiengAnh: tenTiengAnh,
            ghiChu: ghiChu,
            idHocVien: idHocVien,
            ngayGiao: ngayGiao,
            soQdGiao: soQdGiao,
            hanBaoVe: hanBaoVe,
            soQdBaoVe: soQdBaoVe,
            ngayBaoVe: ngayBaoVe,
            idChuTich: idChuTich,
            idPhanBien1: idPhanBien1,
            idPhanBien2: idPhanBien2,
            idUyVien: idUyVien,
            idThuKy: idThuKy,
            flagGiaoDeTai: flagGiaoDeTai,
            flagThanhToan: flagThanhToan,
            flagDangKyBaoVe: flagDangKyBaoVe,
            flagNopHoSo: flagNopHoSo,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int idGiangVien,
            required String tenTiengViet,
            required String tenTiengAnh,
            Value<String> ghiChu = const Value.absent(),
            Value<int?> idHocVien = const Value.absent(),
            Value<DateTime?> ngayGiao = const Value.absent(),
            Value<String?> soQdGiao = const Value.absent(),
            Value<DateTime?> hanBaoVe = const Value.absent(),
            Value<String?> soQdBaoVe = const Value.absent(),
            Value<DateTime?> ngayBaoVe = const Value.absent(),
            Value<int?> idChuTich = const Value.absent(),
            Value<int?> idPhanBien1 = const Value.absent(),
            Value<int?> idPhanBien2 = const Value.absent(),
            Value<int?> idUyVien = const Value.absent(),
            Value<int?> idThuKy = const Value.absent(),
            Value<bool> flagGiaoDeTai = const Value.absent(),
            Value<bool> flagThanhToan = const Value.absent(),
            Value<bool> flagDangKyBaoVe = const Value.absent(),
            Value<bool> flagNopHoSo = const Value.absent(),
          }) =>
              DeTaiThacSiCompanion.insert(
            id: id,
            idGiangVien: idGiangVien,
            tenTiengViet: tenTiengViet,
            tenTiengAnh: tenTiengAnh,
            ghiChu: ghiChu,
            idHocVien: idHocVien,
            ngayGiao: ngayGiao,
            soQdGiao: soQdGiao,
            hanBaoVe: hanBaoVe,
            soQdBaoVe: soQdBaoVe,
            ngayBaoVe: ngayBaoVe,
            idChuTich: idChuTich,
            idPhanBien1: idPhanBien1,
            idPhanBien2: idPhanBien2,
            idUyVien: idUyVien,
            idThuKy: idThuKy,
            flagGiaoDeTai: flagGiaoDeTai,
            flagThanhToan: flagThanhToan,
            flagDangKyBaoVe: flagDangKyBaoVe,
            flagNopHoSo: flagNopHoSo,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DeTaiThacSiTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {idGiangVien = false,
              idHocVien = false,
              idChuTich = false,
              idPhanBien1 = false,
              idPhanBien2 = false,
              idUyVien = false,
              idThuKy = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (idGiangVien) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idGiangVien,
                    referencedTable:
                        $$DeTaiThacSiTableReferences._idGiangVienTable(db),
                    referencedColumn:
                        $$DeTaiThacSiTableReferences._idGiangVienTable(db).id,
                  ) as T;
                }
                if (idHocVien) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idHocVien,
                    referencedTable:
                        $$DeTaiThacSiTableReferences._idHocVienTable(db),
                    referencedColumn:
                        $$DeTaiThacSiTableReferences._idHocVienTable(db).id,
                  ) as T;
                }
                if (idChuTich) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idChuTich,
                    referencedTable:
                        $$DeTaiThacSiTableReferences._idChuTichTable(db),
                    referencedColumn:
                        $$DeTaiThacSiTableReferences._idChuTichTable(db).id,
                  ) as T;
                }
                if (idPhanBien1) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idPhanBien1,
                    referencedTable:
                        $$DeTaiThacSiTableReferences._idPhanBien1Table(db),
                    referencedColumn:
                        $$DeTaiThacSiTableReferences._idPhanBien1Table(db).id,
                  ) as T;
                }
                if (idPhanBien2) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idPhanBien2,
                    referencedTable:
                        $$DeTaiThacSiTableReferences._idPhanBien2Table(db),
                    referencedColumn:
                        $$DeTaiThacSiTableReferences._idPhanBien2Table(db).id,
                  ) as T;
                }
                if (idUyVien) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idUyVien,
                    referencedTable:
                        $$DeTaiThacSiTableReferences._idUyVienTable(db),
                    referencedColumn:
                        $$DeTaiThacSiTableReferences._idUyVienTable(db).id,
                  ) as T;
                }
                if (idThuKy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idThuKy,
                    referencedTable:
                        $$DeTaiThacSiTableReferences._idThuKyTable(db),
                    referencedColumn:
                        $$DeTaiThacSiTableReferences._idThuKyTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DeTaiThacSiTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DeTaiThacSiTable,
    DeTaiThacSiData,
    $$DeTaiThacSiTableFilterComposer,
    $$DeTaiThacSiTableOrderingComposer,
    $$DeTaiThacSiTableAnnotationComposer,
    $$DeTaiThacSiTableCreateCompanionBuilder,
    $$DeTaiThacSiTableUpdateCompanionBuilder,
    (DeTaiThacSiData, $$DeTaiThacSiTableReferences),
    DeTaiThacSiData,
    PrefetchHooks Function(
        {bool idGiangVien,
        bool idHocVien,
        bool idChuTich,
        bool idPhanBien1,
        bool idPhanBien2,
        bool idUyVien,
        bool idThuKy})>;
typedef $$HocKyTableCreateCompanionBuilder = HocKyCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  required String hocKy,
  required DateTime moDangKy,
  required DateTime dongDangKy,
  required DateTime batDauHoc,
  required DateTime ketThucHoc,
  required DateTime hanNhapDiem,
  Value<int> rowid,
});
typedef $$HocKyTableUpdateCompanionBuilder = HocKyCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<String> hocKy,
  Value<DateTime> moDangKy,
  Value<DateTime> dongDangKy,
  Value<DateTime> batDauHoc,
  Value<DateTime> ketThucHoc,
  Value<DateTime> hanNhapDiem,
  Value<int> rowid,
});

final class $$HocKyTableReferences
    extends BaseReferences<_$AppDatabase, $HocKyTable, HocKyData> {
  $$HocKyTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LopTinChiTable, List<LopTinChiData>>
      _lopTinChiRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.lopTinChi,
          aliasName: $_aliasNameGenerator(db.hocKy.hocKy, db.lopTinChi.hocKy));

  $$LopTinChiTableProcessedTableManager get lopTinChiRefs {
    final manager = $$LopTinChiTableTableManager($_db, $_db.lopTinChi).filter(
        (f) => f.hocKy.hocKy.sqlEquals($_itemColumn<String>('hoc_ky')!));

    final cache = $_typedResult.readTableOrNull(_lopTinChiRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$HocKyTableFilterComposer extends Composer<_$AppDatabase, $HocKyTable> {
  $$HocKyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hocKy => $composableBuilder(
      column: $table.hocKy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get moDangKy => $composableBuilder(
      column: $table.moDangKy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dongDangKy => $composableBuilder(
      column: $table.dongDangKy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get batDauHoc => $composableBuilder(
      column: $table.batDauHoc, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ketThucHoc => $composableBuilder(
      column: $table.ketThucHoc, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get hanNhapDiem => $composableBuilder(
      column: $table.hanNhapDiem, builder: (column) => ColumnFilters(column));

  Expression<bool> lopTinChiRefs(
      Expression<bool> Function($$LopTinChiTableFilterComposer f) f) {
    final $$LopTinChiTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.hocKy,
        referencedTable: $db.lopTinChi,
        getReferencedColumn: (t) => t.hocKy,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LopTinChiTableFilterComposer(
              $db: $db,
              $table: $db.lopTinChi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HocKyTableOrderingComposer
    extends Composer<_$AppDatabase, $HocKyTable> {
  $$HocKyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hocKy => $composableBuilder(
      column: $table.hocKy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get moDangKy => $composableBuilder(
      column: $table.moDangKy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dongDangKy => $composableBuilder(
      column: $table.dongDangKy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get batDauHoc => $composableBuilder(
      column: $table.batDauHoc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ketThucHoc => $composableBuilder(
      column: $table.ketThucHoc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get hanNhapDiem => $composableBuilder(
      column: $table.hanNhapDiem, builder: (column) => ColumnOrderings(column));
}

class $$HocKyTableAnnotationComposer
    extends Composer<_$AppDatabase, $HocKyTable> {
  $$HocKyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => column);

  GeneratedColumn<String> get hocKy =>
      $composableBuilder(column: $table.hocKy, builder: (column) => column);

  GeneratedColumn<DateTime> get moDangKy =>
      $composableBuilder(column: $table.moDangKy, builder: (column) => column);

  GeneratedColumn<DateTime> get dongDangKy => $composableBuilder(
      column: $table.dongDangKy, builder: (column) => column);

  GeneratedColumn<DateTime> get batDauHoc =>
      $composableBuilder(column: $table.batDauHoc, builder: (column) => column);

  GeneratedColumn<DateTime> get ketThucHoc => $composableBuilder(
      column: $table.ketThucHoc, builder: (column) => column);

  GeneratedColumn<DateTime> get hanNhapDiem => $composableBuilder(
      column: $table.hanNhapDiem, builder: (column) => column);

  Expression<T> lopTinChiRefs<T extends Object>(
      Expression<T> Function($$LopTinChiTableAnnotationComposer a) f) {
    final $$LopTinChiTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.hocKy,
        referencedTable: $db.lopTinChi,
        getReferencedColumn: (t) => t.hocKy,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LopTinChiTableAnnotationComposer(
              $db: $db,
              $table: $db.lopTinChi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HocKyTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HocKyTable,
    HocKyData,
    $$HocKyTableFilterComposer,
    $$HocKyTableOrderingComposer,
    $$HocKyTableAnnotationComposer,
    $$HocKyTableCreateCompanionBuilder,
    $$HocKyTableUpdateCompanionBuilder,
    (HocKyData, $$HocKyTableReferences),
    HocKyData,
    PrefetchHooks Function({bool lopTinChiRefs})> {
  $$HocKyTableTableManager(_$AppDatabase db, $HocKyTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HocKyTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HocKyTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HocKyTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<String> hocKy = const Value.absent(),
            Value<DateTime> moDangKy = const Value.absent(),
            Value<DateTime> dongDangKy = const Value.absent(),
            Value<DateTime> batDauHoc = const Value.absent(),
            Value<DateTime> ketThucHoc = const Value.absent(),
            Value<DateTime> hanNhapDiem = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HocKyCompanion(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            hocKy: hocKy,
            moDangKy: moDangKy,
            dongDangKy: dongDangKy,
            batDauHoc: batDauHoc,
            ketThucHoc: ketThucHoc,
            hanNhapDiem: hanNhapDiem,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            required String hocKy,
            required DateTime moDangKy,
            required DateTime dongDangKy,
            required DateTime batDauHoc,
            required DateTime ketThucHoc,
            required DateTime hanNhapDiem,
            Value<int> rowid = const Value.absent(),
          }) =>
              HocKyCompanion.insert(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            hocKy: hocKy,
            moDangKy: moDangKy,
            dongDangKy: dongDangKy,
            batDauHoc: batDauHoc,
            ketThucHoc: ketThucHoc,
            hanNhapDiem: hanNhapDiem,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$HocKyTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({lopTinChiRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lopTinChiRefs) db.lopTinChi],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lopTinChiRefs)
                    await $_getPrefetchedData<HocKyData, $HocKyTable,
                            LopTinChiData>(
                        currentTable: table,
                        referencedTable:
                            $$HocKyTableReferences._lopTinChiRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$HocKyTableReferences(db, table, p0).lopTinChiRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.hocKy == item.hocKy),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$HocKyTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HocKyTable,
    HocKyData,
    $$HocKyTableFilterComposer,
    $$HocKyTableOrderingComposer,
    $$HocKyTableAnnotationComposer,
    $$HocKyTableCreateCompanionBuilder,
    $$HocKyTableUpdateCompanionBuilder,
    (HocKyData, $$HocKyTableReferences),
    HocKyData,
    PrefetchHooks Function({bool lopTinChiRefs})>;
typedef $$HocPhanTableCreateCompanionBuilder = HocPhanCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  required String maHocPhan,
  required String tenTiengViet,
  required String tenTiengAnh,
  required int soTinChi,
  required String khoiLuong,
  Value<KhoiKienThuc> khoiKienThuc,
  Value<int> rowid,
});
typedef $$HocPhanTableUpdateCompanionBuilder = HocPhanCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<String> maHocPhan,
  Value<String> tenTiengViet,
  Value<String> tenTiengAnh,
  Value<int> soTinChi,
  Value<String> khoiLuong,
  Value<KhoiKienThuc> khoiKienThuc,
  Value<int> rowid,
});

final class $$HocPhanTableReferences
    extends BaseReferences<_$AppDatabase, $HocPhanTable, HocPhanData> {
  $$HocPhanTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LopTinChiTable, List<LopTinChiData>>
      _lopTinChiRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.lopTinChi,
              aliasName: $_aliasNameGenerator(
                  db.hocPhan.maHocPhan, db.lopTinChi.maHocPhan));

  $$LopTinChiTableProcessedTableManager get lopTinChiRefs {
    final manager = $$LopTinChiTableTableManager($_db, $_db.lopTinChi).filter(
        (f) => f.maHocPhan.maHocPhan
            .sqlEquals($_itemColumn<String>('ma_hoc_phan')!));

    final cache = $_typedResult.readTableOrNull(_lopTinChiRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$HocPhanTableFilterComposer
    extends Composer<_$AppDatabase, $HocPhanTable> {
  $$HocPhanTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maHocPhan => $composableBuilder(
      column: $table.maHocPhan, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tenTiengViet => $composableBuilder(
      column: $table.tenTiengViet, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tenTiengAnh => $composableBuilder(
      column: $table.tenTiengAnh, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get soTinChi => $composableBuilder(
      column: $table.soTinChi, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get khoiLuong => $composableBuilder(
      column: $table.khoiLuong, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<KhoiKienThuc, KhoiKienThuc, String>
      get khoiKienThuc => $composableBuilder(
          column: $table.khoiKienThuc,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  Expression<bool> lopTinChiRefs(
      Expression<bool> Function($$LopTinChiTableFilterComposer f) f) {
    final $$LopTinChiTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maHocPhan,
        referencedTable: $db.lopTinChi,
        getReferencedColumn: (t) => t.maHocPhan,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LopTinChiTableFilterComposer(
              $db: $db,
              $table: $db.lopTinChi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HocPhanTableOrderingComposer
    extends Composer<_$AppDatabase, $HocPhanTable> {
  $$HocPhanTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maHocPhan => $composableBuilder(
      column: $table.maHocPhan, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tenTiengViet => $composableBuilder(
      column: $table.tenTiengViet,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tenTiengAnh => $composableBuilder(
      column: $table.tenTiengAnh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get soTinChi => $composableBuilder(
      column: $table.soTinChi, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get khoiLuong => $composableBuilder(
      column: $table.khoiLuong, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get khoiKienThuc => $composableBuilder(
      column: $table.khoiKienThuc,
      builder: (column) => ColumnOrderings(column));
}

class $$HocPhanTableAnnotationComposer
    extends Composer<_$AppDatabase, $HocPhanTable> {
  $$HocPhanTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => column);

  GeneratedColumn<String> get maHocPhan =>
      $composableBuilder(column: $table.maHocPhan, builder: (column) => column);

  GeneratedColumn<String> get tenTiengViet => $composableBuilder(
      column: $table.tenTiengViet, builder: (column) => column);

  GeneratedColumn<String> get tenTiengAnh => $composableBuilder(
      column: $table.tenTiengAnh, builder: (column) => column);

  GeneratedColumn<int> get soTinChi =>
      $composableBuilder(column: $table.soTinChi, builder: (column) => column);

  GeneratedColumn<String> get khoiLuong =>
      $composableBuilder(column: $table.khoiLuong, builder: (column) => column);

  GeneratedColumnWithTypeConverter<KhoiKienThuc, String> get khoiKienThuc =>
      $composableBuilder(
          column: $table.khoiKienThuc, builder: (column) => column);

  Expression<T> lopTinChiRefs<T extends Object>(
      Expression<T> Function($$LopTinChiTableAnnotationComposer a) f) {
    final $$LopTinChiTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maHocPhan,
        referencedTable: $db.lopTinChi,
        getReferencedColumn: (t) => t.maHocPhan,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LopTinChiTableAnnotationComposer(
              $db: $db,
              $table: $db.lopTinChi,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HocPhanTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HocPhanTable,
    HocPhanData,
    $$HocPhanTableFilterComposer,
    $$HocPhanTableOrderingComposer,
    $$HocPhanTableAnnotationComposer,
    $$HocPhanTableCreateCompanionBuilder,
    $$HocPhanTableUpdateCompanionBuilder,
    (HocPhanData, $$HocPhanTableReferences),
    HocPhanData,
    PrefetchHooks Function({bool lopTinChiRefs})> {
  $$HocPhanTableTableManager(_$AppDatabase db, $HocPhanTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HocPhanTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HocPhanTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HocPhanTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<String> maHocPhan = const Value.absent(),
            Value<String> tenTiengViet = const Value.absent(),
            Value<String> tenTiengAnh = const Value.absent(),
            Value<int> soTinChi = const Value.absent(),
            Value<String> khoiLuong = const Value.absent(),
            Value<KhoiKienThuc> khoiKienThuc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HocPhanCompanion(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            maHocPhan: maHocPhan,
            tenTiengViet: tenTiengViet,
            tenTiengAnh: tenTiengAnh,
            soTinChi: soTinChi,
            khoiLuong: khoiLuong,
            khoiKienThuc: khoiKienThuc,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            required String maHocPhan,
            required String tenTiengViet,
            required String tenTiengAnh,
            required int soTinChi,
            required String khoiLuong,
            Value<KhoiKienThuc> khoiKienThuc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HocPhanCompanion.insert(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            maHocPhan: maHocPhan,
            tenTiengViet: tenTiengViet,
            tenTiengAnh: tenTiengAnh,
            soTinChi: soTinChi,
            khoiLuong: khoiLuong,
            khoiKienThuc: khoiKienThuc,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$HocPhanTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({lopTinChiRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lopTinChiRefs) db.lopTinChi],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lopTinChiRefs)
                    await $_getPrefetchedData<HocPhanData, $HocPhanTable,
                            LopTinChiData>(
                        currentTable: table,
                        referencedTable:
                            $$HocPhanTableReferences._lopTinChiRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$HocPhanTableReferences(db, table, p0)
                                .lopTinChiRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.maHocPhan == item.maHocPhan),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$HocPhanTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HocPhanTable,
    HocPhanData,
    $$HocPhanTableFilterComposer,
    $$HocPhanTableOrderingComposer,
    $$HocPhanTableAnnotationComposer,
    $$HocPhanTableCreateCompanionBuilder,
    $$HocPhanTableUpdateCompanionBuilder,
    (HocPhanData, $$HocPhanTableReferences),
    HocPhanData,
    PrefetchHooks Function({bool lopTinChiRefs})>;
typedef $$LopTinChiTableCreateCompanionBuilder = LopTinChiCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  required String maLopHoc,
  required String maHocPhan,
  Value<int?> idGiangVien,
  Value<int?> idLopTruong,
  required String urlTruyCap,
  required String hocKy,
  Value<String?> phongHoc,
  Value<int?> ngayHoc,
  Value<int?> tietBatDau,
  Value<int?> tietKetThuc,
  Value<bool> flagHuy,
});
typedef $$LopTinChiTableUpdateCompanionBuilder = LopTinChiCompanion Function({
  Value<DateTime> dateCreated,
  Value<DateTime> dateUpdated,
  Value<int> id,
  Value<String> maLopHoc,
  Value<String> maHocPhan,
  Value<int?> idGiangVien,
  Value<int?> idLopTruong,
  Value<String> urlTruyCap,
  Value<String> hocKy,
  Value<String?> phongHoc,
  Value<int?> ngayHoc,
  Value<int?> tietBatDau,
  Value<int?> tietKetThuc,
  Value<bool> flagHuy,
});

final class $$LopTinChiTableReferences
    extends BaseReferences<_$AppDatabase, $LopTinChiTable, LopTinChiData> {
  $$LopTinChiTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HocPhanTable _maHocPhanTable(_$AppDatabase db) =>
      db.hocPhan.createAlias(
          $_aliasNameGenerator(db.lopTinChi.maHocPhan, db.hocPhan.maHocPhan));

  $$HocPhanTableProcessedTableManager get maHocPhan {
    final $_column = $_itemColumn<String>('ma_hoc_phan')!;

    final manager = $$HocPhanTableTableManager($_db, $_db.hocPhan)
        .filter((f) => f.maHocPhan.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_maHocPhanTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GiangVienTable _idGiangVienTable(_$AppDatabase db) =>
      db.giangVien.createAlias(
          $_aliasNameGenerator(db.lopTinChi.idGiangVien, db.giangVien.id));

  $$GiangVienTableProcessedTableManager? get idGiangVien {
    final $_column = $_itemColumn<int>('id_giang_vien');
    if ($_column == null) return null;
    final manager = $$GiangVienTableTableManager($_db, $_db.giangVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idGiangVienTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $HocVienTable _idLopTruongTable(_$AppDatabase db) =>
      db.hocVien.createAlias(
          $_aliasNameGenerator(db.lopTinChi.idLopTruong, db.hocVien.id));

  $$HocVienTableProcessedTableManager? get idLopTruong {
    final $_column = $_itemColumn<int>('id_lop_truong');
    if ($_column == null) return null;
    final manager = $$HocVienTableTableManager($_db, $_db.hocVien)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idLopTruongTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $HocKyTable _hocKyTable(_$AppDatabase db) => db.hocKy
      .createAlias($_aliasNameGenerator(db.lopTinChi.hocKy, db.hocKy.hocKy));

  $$HocKyTableProcessedTableManager get hocKy {
    final $_column = $_itemColumn<String>('hoc_ky')!;

    final manager = $$HocKyTableTableManager($_db, $_db.hocKy)
        .filter((f) => f.hocKy.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_hocKyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LopTinChiTableFilterComposer
    extends Composer<_$AppDatabase, $LopTinChiTable> {
  $$LopTinChiTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maLopHoc => $composableBuilder(
      column: $table.maLopHoc, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get urlTruyCap => $composableBuilder(
      column: $table.urlTruyCap, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phongHoc => $composableBuilder(
      column: $table.phongHoc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ngayHoc => $composableBuilder(
      column: $table.ngayHoc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tietBatDau => $composableBuilder(
      column: $table.tietBatDau, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tietKetThuc => $composableBuilder(
      column: $table.tietKetThuc, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get flagHuy => $composableBuilder(
      column: $table.flagHuy, builder: (column) => ColumnFilters(column));

  $$HocPhanTableFilterComposer get maHocPhan {
    final $$HocPhanTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maHocPhan,
        referencedTable: $db.hocPhan,
        getReferencedColumn: (t) => t.maHocPhan,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocPhanTableFilterComposer(
              $db: $db,
              $table: $db.hocPhan,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableFilterComposer get idGiangVien {
    final $$GiangVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idGiangVien,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableFilterComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$HocVienTableFilterComposer get idLopTruong {
    final $$HocVienTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idLopTruong,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableFilterComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$HocKyTableFilterComposer get hocKy {
    final $$HocKyTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.hocKy,
        referencedTable: $db.hocKy,
        getReferencedColumn: (t) => t.hocKy,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocKyTableFilterComposer(
              $db: $db,
              $table: $db.hocKy,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LopTinChiTableOrderingComposer
    extends Composer<_$AppDatabase, $LopTinChiTable> {
  $$LopTinChiTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maLopHoc => $composableBuilder(
      column: $table.maLopHoc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urlTruyCap => $composableBuilder(
      column: $table.urlTruyCap, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phongHoc => $composableBuilder(
      column: $table.phongHoc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ngayHoc => $composableBuilder(
      column: $table.ngayHoc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tietBatDau => $composableBuilder(
      column: $table.tietBatDau, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tietKetThuc => $composableBuilder(
      column: $table.tietKetThuc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get flagHuy => $composableBuilder(
      column: $table.flagHuy, builder: (column) => ColumnOrderings(column));

  $$HocPhanTableOrderingComposer get maHocPhan {
    final $$HocPhanTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maHocPhan,
        referencedTable: $db.hocPhan,
        getReferencedColumn: (t) => t.maHocPhan,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocPhanTableOrderingComposer(
              $db: $db,
              $table: $db.hocPhan,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableOrderingComposer get idGiangVien {
    final $$GiangVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idGiangVien,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableOrderingComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$HocVienTableOrderingComposer get idLopTruong {
    final $$HocVienTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idLopTruong,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableOrderingComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$HocKyTableOrderingComposer get hocKy {
    final $$HocKyTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.hocKy,
        referencedTable: $db.hocKy,
        getReferencedColumn: (t) => t.hocKy,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocKyTableOrderingComposer(
              $db: $db,
              $table: $db.hocKy,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LopTinChiTableAnnotationComposer
    extends Composer<_$AppDatabase, $LopTinChiTable> {
  $$LopTinChiTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get maLopHoc =>
      $composableBuilder(column: $table.maLopHoc, builder: (column) => column);

  GeneratedColumn<String> get urlTruyCap => $composableBuilder(
      column: $table.urlTruyCap, builder: (column) => column);

  GeneratedColumn<String> get phongHoc =>
      $composableBuilder(column: $table.phongHoc, builder: (column) => column);

  GeneratedColumn<int> get ngayHoc =>
      $composableBuilder(column: $table.ngayHoc, builder: (column) => column);

  GeneratedColumn<int> get tietBatDau => $composableBuilder(
      column: $table.tietBatDau, builder: (column) => column);

  GeneratedColumn<int> get tietKetThuc => $composableBuilder(
      column: $table.tietKetThuc, builder: (column) => column);

  GeneratedColumn<bool> get flagHuy =>
      $composableBuilder(column: $table.flagHuy, builder: (column) => column);

  $$HocPhanTableAnnotationComposer get maHocPhan {
    final $$HocPhanTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maHocPhan,
        referencedTable: $db.hocPhan,
        getReferencedColumn: (t) => t.maHocPhan,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocPhanTableAnnotationComposer(
              $db: $db,
              $table: $db.hocPhan,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GiangVienTableAnnotationComposer get idGiangVien {
    final $$GiangVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idGiangVien,
        referencedTable: $db.giangVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GiangVienTableAnnotationComposer(
              $db: $db,
              $table: $db.giangVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$HocVienTableAnnotationComposer get idLopTruong {
    final $$HocVienTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idLopTruong,
        referencedTable: $db.hocVien,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocVienTableAnnotationComposer(
              $db: $db,
              $table: $db.hocVien,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$HocKyTableAnnotationComposer get hocKy {
    final $$HocKyTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.hocKy,
        referencedTable: $db.hocKy,
        getReferencedColumn: (t) => t.hocKy,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HocKyTableAnnotationComposer(
              $db: $db,
              $table: $db.hocKy,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LopTinChiTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LopTinChiTable,
    LopTinChiData,
    $$LopTinChiTableFilterComposer,
    $$LopTinChiTableOrderingComposer,
    $$LopTinChiTableAnnotationComposer,
    $$LopTinChiTableCreateCompanionBuilder,
    $$LopTinChiTableUpdateCompanionBuilder,
    (LopTinChiData, $$LopTinChiTableReferences),
    LopTinChiData,
    PrefetchHooks Function(
        {bool maHocPhan, bool idGiangVien, bool idLopTruong, bool hocKy})> {
  $$LopTinChiTableTableManager(_$AppDatabase db, $LopTinChiTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LopTinChiTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LopTinChiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LopTinChiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> maLopHoc = const Value.absent(),
            Value<String> maHocPhan = const Value.absent(),
            Value<int?> idGiangVien = const Value.absent(),
            Value<int?> idLopTruong = const Value.absent(),
            Value<String> urlTruyCap = const Value.absent(),
            Value<String> hocKy = const Value.absent(),
            Value<String?> phongHoc = const Value.absent(),
            Value<int?> ngayHoc = const Value.absent(),
            Value<int?> tietBatDau = const Value.absent(),
            Value<int?> tietKetThuc = const Value.absent(),
            Value<bool> flagHuy = const Value.absent(),
          }) =>
              LopTinChiCompanion(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            maLopHoc: maLopHoc,
            maHocPhan: maHocPhan,
            idGiangVien: idGiangVien,
            idLopTruong: idLopTruong,
            urlTruyCap: urlTruyCap,
            hocKy: hocKy,
            phongHoc: phongHoc,
            ngayHoc: ngayHoc,
            tietBatDau: tietBatDau,
            tietKetThuc: tietKetThuc,
            flagHuy: flagHuy,
          ),
          createCompanionCallback: ({
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
            Value<int> id = const Value.absent(),
            required String maLopHoc,
            required String maHocPhan,
            Value<int?> idGiangVien = const Value.absent(),
            Value<int?> idLopTruong = const Value.absent(),
            required String urlTruyCap,
            required String hocKy,
            Value<String?> phongHoc = const Value.absent(),
            Value<int?> ngayHoc = const Value.absent(),
            Value<int?> tietBatDau = const Value.absent(),
            Value<int?> tietKetThuc = const Value.absent(),
            Value<bool> flagHuy = const Value.absent(),
          }) =>
              LopTinChiCompanion.insert(
            dateCreated: dateCreated,
            dateUpdated: dateUpdated,
            id: id,
            maLopHoc: maLopHoc,
            maHocPhan: maHocPhan,
            idGiangVien: idGiangVien,
            idLopTruong: idLopTruong,
            urlTruyCap: urlTruyCap,
            hocKy: hocKy,
            phongHoc: phongHoc,
            ngayHoc: ngayHoc,
            tietBatDau: tietBatDau,
            tietKetThuc: tietKetThuc,
            flagHuy: flagHuy,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LopTinChiTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {maHocPhan = false,
              idGiangVien = false,
              idLopTruong = false,
              hocKy = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (maHocPhan) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.maHocPhan,
                    referencedTable:
                        $$LopTinChiTableReferences._maHocPhanTable(db),
                    referencedColumn: $$LopTinChiTableReferences
                        ._maHocPhanTable(db)
                        .maHocPhan,
                  ) as T;
                }
                if (idGiangVien) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idGiangVien,
                    referencedTable:
                        $$LopTinChiTableReferences._idGiangVienTable(db),
                    referencedColumn:
                        $$LopTinChiTableReferences._idGiangVienTable(db).id,
                  ) as T;
                }
                if (idLopTruong) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idLopTruong,
                    referencedTable:
                        $$LopTinChiTableReferences._idLopTruongTable(db),
                    referencedColumn:
                        $$LopTinChiTableReferences._idLopTruongTable(db).id,
                  ) as T;
                }
                if (hocKy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.hocKy,
                    referencedTable: $$LopTinChiTableReferences._hocKyTable(db),
                    referencedColumn:
                        $$LopTinChiTableReferences._hocKyTable(db).hocKy,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$LopTinChiTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LopTinChiTable,
    LopTinChiData,
    $$LopTinChiTableFilterComposer,
    $$LopTinChiTableOrderingComposer,
    $$LopTinChiTableAnnotationComposer,
    $$LopTinChiTableCreateCompanionBuilder,
    $$LopTinChiTableUpdateCompanionBuilder,
    (LopTinChiData, $$LopTinChiTableReferences),
    LopTinChiData,
    PrefetchHooks Function(
        {bool maHocPhan, bool idGiangVien, bool idLopTruong, bool hocKy})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NienKhoaTableTableManager get nienKhoa =>
      $$NienKhoaTableTableManager(_db, _db.nienKhoa);
  $$NhomChuyenMonTableTableManager get nhomChuyenMon =>
      $$NhomChuyenMonTableTableManager(_db, _db.nhomChuyenMon);
  $$GiangVienTableTableManager get giangVien =>
      $$GiangVienTableTableManager(_db, _db.giangVien);
  $$TieuBanXetTuyenTableTableManager get tieuBanXetTuyen =>
      $$TieuBanXetTuyenTableTableManager(_db, _db.tieuBanXetTuyen);
  $$HocVienTableTableManager get hocVien =>
      $$HocVienTableTableManager(_db, _db.hocVien);
  $$DeTaiThacSiTableTableManager get deTaiThacSi =>
      $$DeTaiThacSiTableTableManager(_db, _db.deTaiThacSi);
  $$HocKyTableTableManager get hocKy =>
      $$HocKyTableTableManager(_db, _db.hocKy);
  $$HocPhanTableTableManager get hocPhan =>
      $$HocPhanTableTableManager(_db, _db.hocPhan);
  $$LopTinChiTableTableManager get lopTinChi =>
      $$LopTinChiTableTableManager(_db, _db.lopTinChi);
}
