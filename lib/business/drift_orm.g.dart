// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_orm.dart';

// ignore_for_file: type=lint
class TeacherFts extends Table
    with
        TableInfo<TeacherFts, TeacherFt>,
        VirtualTableInfo<TeacherFts, TeacherFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TeacherFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _universityMeta = const VerificationMeta(
    'university',
  );
  late final GeneratedColumn<String> university = GeneratedColumn<String>(
    'university',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _falcutyMeta = const VerificationMeta(
    'falcuty',
  );
  late final GeneratedColumn<String> falcuty = GeneratedColumn<String>(
    'falcuty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _specializationMeta = const VerificationMeta(
    'specialization',
  );
  late final GeneratedColumn<String> specialization = GeneratedColumn<String>(
    'specialization',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _workEmailMeta = const VerificationMeta(
    'workEmail',
  );
  late final GeneratedColumn<String> workEmail = GeneratedColumn<String>(
    'work_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _personalEmailMeta = const VerificationMeta(
    'personalEmail',
  );
  late final GeneratedColumn<String> personalEmail = GeneratedColumn<String>(
    'personal_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _citizenIdMeta = const VerificationMeta(
    'citizenId',
  );
  late final GeneratedColumn<String> citizenId = GeneratedColumn<String>(
    'citizen_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _bankAccountMeta = const VerificationMeta(
    'bankAccount',
  );
  late final GeneratedColumn<String> bankAccount = GeneratedColumn<String>(
    'bank_account',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    university,
    falcuty,
    specialization,
    phoneNumber,
    workEmail,
    personalEmail,
    citizenId,
    bankAccount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teacher_fts';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeacherFt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('university')) {
      context.handle(
        _universityMeta,
        university.isAcceptableOrUnknown(data['university']!, _universityMeta),
      );
    } else if (isInserting) {
      context.missing(_universityMeta);
    }
    if (data.containsKey('falcuty')) {
      context.handle(
        _falcutyMeta,
        falcuty.isAcceptableOrUnknown(data['falcuty']!, _falcutyMeta),
      );
    } else if (isInserting) {
      context.missing(_falcutyMeta);
    }
    if (data.containsKey('specialization')) {
      context.handle(
        _specializationMeta,
        specialization.isAcceptableOrUnknown(
          data['specialization']!,
          _specializationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_specializationMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('work_email')) {
      context.handle(
        _workEmailMeta,
        workEmail.isAcceptableOrUnknown(data['work_email']!, _workEmailMeta),
      );
    } else if (isInserting) {
      context.missing(_workEmailMeta);
    }
    if (data.containsKey('personal_email')) {
      context.handle(
        _personalEmailMeta,
        personalEmail.isAcceptableOrUnknown(
          data['personal_email']!,
          _personalEmailMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_personalEmailMeta);
    }
    if (data.containsKey('citizen_id')) {
      context.handle(
        _citizenIdMeta,
        citizenId.isAcceptableOrUnknown(data['citizen_id']!, _citizenIdMeta),
      );
    } else if (isInserting) {
      context.missing(_citizenIdMeta);
    }
    if (data.containsKey('bank_account')) {
      context.handle(
        _bankAccountMeta,
        bankAccount.isAcceptableOrUnknown(
          data['bank_account']!,
          _bankAccountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bankAccountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TeacherFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeacherFt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      university: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}university'],
      )!,
      falcuty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}falcuty'],
      )!,
      specialization: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specialization'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
      workEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work_email'],
      )!,
      personalEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personal_email'],
      )!,
      citizenId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}citizen_id'],
      )!,
      bankAccount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_account'],
      )!,
    );
  }

  @override
  TeacherFts createAlias(String alias) {
    return TeacherFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(id, name, university, falcuty, specialization, phone_number, work_email, personal_email, citizen_id, bank_account, prefix=\'2 3 5 7\', tokenize="trigram remove_diacritics 1 case_sensitive 0")';
}

class TeacherFt extends DataClass implements Insertable<TeacherFt> {
  final String id;
  final String name;
  final String university;
  final String falcuty;
  final String specialization;
  final String phoneNumber;
  final String workEmail;
  final String personalEmail;
  final String citizenId;
  final String bankAccount;
  const TeacherFt({
    required this.id,
    required this.name,
    required this.university,
    required this.falcuty,
    required this.specialization,
    required this.phoneNumber,
    required this.workEmail,
    required this.personalEmail,
    required this.citizenId,
    required this.bankAccount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['university'] = Variable<String>(university);
    map['falcuty'] = Variable<String>(falcuty);
    map['specialization'] = Variable<String>(specialization);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['work_email'] = Variable<String>(workEmail);
    map['personal_email'] = Variable<String>(personalEmail);
    map['citizen_id'] = Variable<String>(citizenId);
    map['bank_account'] = Variable<String>(bankAccount);
    return map;
  }

  TeacherFtsCompanion toCompanion(bool nullToAbsent) {
    return TeacherFtsCompanion(
      id: Value(id),
      name: Value(name),
      university: Value(university),
      falcuty: Value(falcuty),
      specialization: Value(specialization),
      phoneNumber: Value(phoneNumber),
      workEmail: Value(workEmail),
      personalEmail: Value(personalEmail),
      citizenId: Value(citizenId),
      bankAccount: Value(bankAccount),
    );
  }

  factory TeacherFt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeacherFt(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      university: serializer.fromJson<String>(json['university']),
      falcuty: serializer.fromJson<String>(json['falcuty']),
      specialization: serializer.fromJson<String>(json['specialization']),
      phoneNumber: serializer.fromJson<String>(json['phone_number']),
      workEmail: serializer.fromJson<String>(json['work_email']),
      personalEmail: serializer.fromJson<String>(json['personal_email']),
      citizenId: serializer.fromJson<String>(json['citizen_id']),
      bankAccount: serializer.fromJson<String>(json['bank_account']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'university': serializer.toJson<String>(university),
      'falcuty': serializer.toJson<String>(falcuty),
      'specialization': serializer.toJson<String>(specialization),
      'phone_number': serializer.toJson<String>(phoneNumber),
      'work_email': serializer.toJson<String>(workEmail),
      'personal_email': serializer.toJson<String>(personalEmail),
      'citizen_id': serializer.toJson<String>(citizenId),
      'bank_account': serializer.toJson<String>(bankAccount),
    };
  }

  TeacherFt copyWith({
    String? id,
    String? name,
    String? university,
    String? falcuty,
    String? specialization,
    String? phoneNumber,
    String? workEmail,
    String? personalEmail,
    String? citizenId,
    String? bankAccount,
  }) => TeacherFt(
    id: id ?? this.id,
    name: name ?? this.name,
    university: university ?? this.university,
    falcuty: falcuty ?? this.falcuty,
    specialization: specialization ?? this.specialization,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    workEmail: workEmail ?? this.workEmail,
    personalEmail: personalEmail ?? this.personalEmail,
    citizenId: citizenId ?? this.citizenId,
    bankAccount: bankAccount ?? this.bankAccount,
  );
  TeacherFt copyWithCompanion(TeacherFtsCompanion data) {
    return TeacherFt(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      university: data.university.present
          ? data.university.value
          : this.university,
      falcuty: data.falcuty.present ? data.falcuty.value : this.falcuty,
      specialization: data.specialization.present
          ? data.specialization.value
          : this.specialization,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      workEmail: data.workEmail.present ? data.workEmail.value : this.workEmail,
      personalEmail: data.personalEmail.present
          ? data.personalEmail.value
          : this.personalEmail,
      citizenId: data.citizenId.present ? data.citizenId.value : this.citizenId,
      bankAccount: data.bankAccount.present
          ? data.bankAccount.value
          : this.bankAccount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeacherFt(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('university: $university, ')
          ..write('falcuty: $falcuty, ')
          ..write('specialization: $specialization, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('workEmail: $workEmail, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('citizenId: $citizenId, ')
          ..write('bankAccount: $bankAccount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    university,
    falcuty,
    specialization,
    phoneNumber,
    workEmail,
    personalEmail,
    citizenId,
    bankAccount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeacherFt &&
          other.id == this.id &&
          other.name == this.name &&
          other.university == this.university &&
          other.falcuty == this.falcuty &&
          other.specialization == this.specialization &&
          other.phoneNumber == this.phoneNumber &&
          other.workEmail == this.workEmail &&
          other.personalEmail == this.personalEmail &&
          other.citizenId == this.citizenId &&
          other.bankAccount == this.bankAccount);
}

class TeacherFtsCompanion extends UpdateCompanion<TeacherFt> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> university;
  final Value<String> falcuty;
  final Value<String> specialization;
  final Value<String> phoneNumber;
  final Value<String> workEmail;
  final Value<String> personalEmail;
  final Value<String> citizenId;
  final Value<String> bankAccount;
  final Value<int> rowid;
  const TeacherFtsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.university = const Value.absent(),
    this.falcuty = const Value.absent(),
    this.specialization = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.workEmail = const Value.absent(),
    this.personalEmail = const Value.absent(),
    this.citizenId = const Value.absent(),
    this.bankAccount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TeacherFtsCompanion.insert({
    required String id,
    required String name,
    required String university,
    required String falcuty,
    required String specialization,
    required String phoneNumber,
    required String workEmail,
    required String personalEmail,
    required String citizenId,
    required String bankAccount,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       university = Value(university),
       falcuty = Value(falcuty),
       specialization = Value(specialization),
       phoneNumber = Value(phoneNumber),
       workEmail = Value(workEmail),
       personalEmail = Value(personalEmail),
       citizenId = Value(citizenId),
       bankAccount = Value(bankAccount);
  static Insertable<TeacherFt> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? university,
    Expression<String>? falcuty,
    Expression<String>? specialization,
    Expression<String>? phoneNumber,
    Expression<String>? workEmail,
    Expression<String>? personalEmail,
    Expression<String>? citizenId,
    Expression<String>? bankAccount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (university != null) 'university': university,
      if (falcuty != null) 'falcuty': falcuty,
      if (specialization != null) 'specialization': specialization,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (workEmail != null) 'work_email': workEmail,
      if (personalEmail != null) 'personal_email': personalEmail,
      if (citizenId != null) 'citizen_id': citizenId,
      if (bankAccount != null) 'bank_account': bankAccount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TeacherFtsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? university,
    Value<String>? falcuty,
    Value<String>? specialization,
    Value<String>? phoneNumber,
    Value<String>? workEmail,
    Value<String>? personalEmail,
    Value<String>? citizenId,
    Value<String>? bankAccount,
    Value<int>? rowid,
  }) {
    return TeacherFtsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      university: university ?? this.university,
      falcuty: falcuty ?? this.falcuty,
      specialization: specialization ?? this.specialization,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      workEmail: workEmail ?? this.workEmail,
      personalEmail: personalEmail ?? this.personalEmail,
      citizenId: citizenId ?? this.citizenId,
      bankAccount: bankAccount ?? this.bankAccount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (university.present) {
      map['university'] = Variable<String>(university.value);
    }
    if (falcuty.present) {
      map['falcuty'] = Variable<String>(falcuty.value);
    }
    if (specialization.present) {
      map['specialization'] = Variable<String>(specialization.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (workEmail.present) {
      map['work_email'] = Variable<String>(workEmail.value);
    }
    if (personalEmail.present) {
      map['personal_email'] = Variable<String>(personalEmail.value);
    }
    if (citizenId.present) {
      map['citizen_id'] = Variable<String>(citizenId.value);
    }
    if (bankAccount.present) {
      map['bank_account'] = Variable<String>(bankAccount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeacherFtsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('university: $university, ')
          ..write('falcuty: $falcuty, ')
          ..write('specialization: $specialization, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('workEmail: $workEmail, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('citizenId: $citizenId, ')
          ..write('bankAccount: $bankAccount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class TeacherGroup extends Table
    with TableInfo<TeacherGroup, TeacherGroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TeacherGroup(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teacher_group';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeacherGroupData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeacherGroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeacherGroupData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  TeacherGroup createAlias(String alias) {
    return TeacherGroup(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TeacherGroupData extends DataClass
    implements Insertable<TeacherGroupData> {
  final int id;
  final String name;
  const TeacherGroupData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TeacherGroupCompanion toCompanion(bool nullToAbsent) {
    return TeacherGroupCompanion(id: Value(id), name: Value(name));
  }

  factory TeacherGroupData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeacherGroupData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TeacherGroupData copyWith({int? id, String? name}) =>
      TeacherGroupData(id: id ?? this.id, name: name ?? this.name);
  TeacherGroupData copyWithCompanion(TeacherGroupCompanion data) {
    return TeacherGroupData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeacherGroupData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeacherGroupData &&
          other.id == this.id &&
          other.name == this.name);
}

class TeacherGroupCompanion extends UpdateCompanion<TeacherGroupData> {
  final Value<int> id;
  final Value<String> name;
  const TeacherGroupCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TeacherGroupCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<TeacherGroupData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TeacherGroupCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TeacherGroupCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeacherGroupCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class Teacher extends Table with TableInfo<Teacher, TeacherData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Teacher(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _staffIdMeta = const VerificationMeta(
    'staffId',
  );
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
    'staff_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'UNIQUE',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _universityMeta = const VerificationMeta(
    'university',
  );
  late final GeneratedColumn<String> university = GeneratedColumn<String>(
    'university',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _falcutyMeta = const VerificationMeta(
    'falcuty',
  );
  late final GeneratedColumn<String> falcuty = GeneratedColumn<String>(
    'falcuty',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _isOutsiderMeta = const VerificationMeta(
    'isOutsider',
  );
  late final GeneratedColumn<bool> isOutsider = GeneratedColumn<bool>(
    'is_outsider',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT TRUE',
    defaultValue: const CustomExpression('TRUE'),
  );
  late final GeneratedColumnWithTypeConverter<enums.Gender, String> gender =
      GeneratedColumn<String>(
        'gender',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<enums.Gender>(Teacher.$convertergender);
  static const VerificationMeta _specializationMeta = const VerificationMeta(
    'specialization',
  );
  late final GeneratedColumn<String> specialization = GeneratedColumn<String>(
    'specialization',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumnWithTypeConverter<enums.AcademicRank?, String>
  academicRank = GeneratedColumn<String>(
    'academic_rank',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<enums.AcademicRank?>(Teacher.$converteracademicRank);
  late final GeneratedColumnWithTypeConverter<enums.AcademicDegree?, String>
  academicDegree = GeneratedColumn<String>(
    'academic_degree',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<enums.AcademicDegree?>(Teacher.$converteracademicDegree);
  static const VerificationMeta _academicDegreeReceiveDateMeta =
      const VerificationMeta('academicDegreeReceiveDate');
  late final GeneratedColumn<DateTime> academicDegreeReceiveDate =
      GeneratedColumn<DateTime>(
        'academic_degree_receive_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _workEmailMeta = const VerificationMeta(
    'workEmail',
  );
  late final GeneratedColumn<String> workEmail = GeneratedColumn<String>(
    'work_email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _personalEmailMeta = const VerificationMeta(
    'personalEmail',
  );
  late final GeneratedColumn<String> personalEmail = GeneratedColumn<String>(
    'personal_email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _citizenIdMeta = const VerificationMeta(
    'citizenId',
  );
  late final GeneratedColumn<String> citizenId = GeneratedColumn<String>(
    'citizen_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _bankAccountMeta = const VerificationMeta(
    'bankAccount',
  );
  late final GeneratedColumn<String> bankAccount = GeneratedColumn<String>(
    'bank_account',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _deprecatedTaxCodeMeta = const VerificationMeta(
    'deprecatedTaxCode',
  );
  late final GeneratedColumn<String> deprecatedTaxCode =
      GeneratedColumn<String>(
        'deprecated_tax_code',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _teacherGroupIdMeta = const VerificationMeta(
    'teacherGroupId',
  );
  late final GeneratedColumn<int> teacherGroupId = GeneratedColumn<int>(
    'teacher_group_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES teacher_group(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    staffId,
    name,
    university,
    falcuty,
    isOutsider,
    gender,
    specialization,
    academicRank,
    academicDegree,
    academicDegreeReceiveDate,
    phoneNumber,
    workEmail,
    personalEmail,
    citizenId,
    dateOfBirth,
    bankAccount,
    bankName,
    deprecatedTaxCode,
    note,
    teacherGroupId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teacher';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeacherData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('staff_id')) {
      context.handle(
        _staffIdMeta,
        staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('university')) {
      context.handle(
        _universityMeta,
        university.isAcceptableOrUnknown(data['university']!, _universityMeta),
      );
    }
    if (data.containsKey('falcuty')) {
      context.handle(
        _falcutyMeta,
        falcuty.isAcceptableOrUnknown(data['falcuty']!, _falcutyMeta),
      );
    }
    if (data.containsKey('is_outsider')) {
      context.handle(
        _isOutsiderMeta,
        isOutsider.isAcceptableOrUnknown(data['is_outsider']!, _isOutsiderMeta),
      );
    }
    if (data.containsKey('specialization')) {
      context.handle(
        _specializationMeta,
        specialization.isAcceptableOrUnknown(
          data['specialization']!,
          _specializationMeta,
        ),
      );
    }
    if (data.containsKey('academic_degree_receive_date')) {
      context.handle(
        _academicDegreeReceiveDateMeta,
        academicDegreeReceiveDate.isAcceptableOrUnknown(
          data['academic_degree_receive_date']!,
          _academicDegreeReceiveDateMeta,
        ),
      );
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('work_email')) {
      context.handle(
        _workEmailMeta,
        workEmail.isAcceptableOrUnknown(data['work_email']!, _workEmailMeta),
      );
    }
    if (data.containsKey('personal_email')) {
      context.handle(
        _personalEmailMeta,
        personalEmail.isAcceptableOrUnknown(
          data['personal_email']!,
          _personalEmailMeta,
        ),
      );
    }
    if (data.containsKey('citizen_id')) {
      context.handle(
        _citizenIdMeta,
        citizenId.isAcceptableOrUnknown(data['citizen_id']!, _citizenIdMeta),
      );
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    }
    if (data.containsKey('bank_account')) {
      context.handle(
        _bankAccountMeta,
        bankAccount.isAcceptableOrUnknown(
          data['bank_account']!,
          _bankAccountMeta,
        ),
      );
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    }
    if (data.containsKey('deprecated_tax_code')) {
      context.handle(
        _deprecatedTaxCodeMeta,
        deprecatedTaxCode.isAcceptableOrUnknown(
          data['deprecated_tax_code']!,
          _deprecatedTaxCodeMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('teacher_group_id')) {
      context.handle(
        _teacherGroupIdMeta,
        teacherGroupId.isAcceptableOrUnknown(
          data['teacher_group_id']!,
          _teacherGroupIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeacherData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeacherData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      staffId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}staff_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      university: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}university'],
      ),
      falcuty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}falcuty'],
      ),
      isOutsider: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_outsider'],
      )!,
      gender: Teacher.$convertergender.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gender'],
        )!,
      ),
      specialization: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specialization'],
      ),
      academicRank: Teacher.$converteracademicRank.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}academic_rank'],
        ),
      ),
      academicDegree: Teacher.$converteracademicDegree.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}academic_degree'],
        ),
      ),
      academicDegreeReceiveDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}academic_degree_receive_date'],
      ),
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      workEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work_email'],
      ),
      personalEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personal_email'],
      ),
      citizenId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}citizen_id'],
      ),
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      ),
      bankAccount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_account'],
      ),
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      ),
      deprecatedTaxCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deprecated_tax_code'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      teacherGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_group_id'],
      ),
    );
  }

  @override
  Teacher createAlias(String alias) {
    return Teacher(attachedDatabase, alias);
  }

  static TypeConverter<enums.Gender, String> $convertergender =
      const enums.GenderConverter();
  static TypeConverter<enums.AcademicRank?, String?> $converteracademicRank =
      const enums.AcademicRankConverter();
  static TypeConverter<enums.AcademicDegree?, String?>
  $converteracademicDegree = const enums.AcademicDegreeConverter();
  @override
  bool get dontWriteConstraints => true;
}

class TeacherData extends DataClass implements Insertable<TeacherData> {
  final int id;
  final String? staffId;
  final String name;
  final String? university;
  final String? falcuty;
  final bool isOutsider;
  final enums.Gender gender;
  final String? specialization;
  final enums.AcademicRank? academicRank;
  final enums.AcademicDegree? academicDegree;
  final DateTime? academicDegreeReceiveDate;
  final String? phoneNumber;
  final String? workEmail;
  final String? personalEmail;
  final String? citizenId;
  final DateTime? dateOfBirth;
  final String? bankAccount;
  final String? bankName;
  final String? deprecatedTaxCode;
  final String? note;
  final int? teacherGroupId;
  const TeacherData({
    required this.id,
    this.staffId,
    required this.name,
    this.university,
    this.falcuty,
    required this.isOutsider,
    required this.gender,
    this.specialization,
    this.academicRank,
    this.academicDegree,
    this.academicDegreeReceiveDate,
    this.phoneNumber,
    this.workEmail,
    this.personalEmail,
    this.citizenId,
    this.dateOfBirth,
    this.bankAccount,
    this.bankName,
    this.deprecatedTaxCode,
    this.note,
    this.teacherGroupId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || staffId != null) {
      map['staff_id'] = Variable<String>(staffId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || university != null) {
      map['university'] = Variable<String>(university);
    }
    if (!nullToAbsent || falcuty != null) {
      map['falcuty'] = Variable<String>(falcuty);
    }
    map['is_outsider'] = Variable<bool>(isOutsider);
    {
      map['gender'] = Variable<String>(Teacher.$convertergender.toSql(gender));
    }
    if (!nullToAbsent || specialization != null) {
      map['specialization'] = Variable<String>(specialization);
    }
    if (!nullToAbsent || academicRank != null) {
      map['academic_rank'] = Variable<String>(
        Teacher.$converteracademicRank.toSql(academicRank),
      );
    }
    if (!nullToAbsent || academicDegree != null) {
      map['academic_degree'] = Variable<String>(
        Teacher.$converteracademicDegree.toSql(academicDegree),
      );
    }
    if (!nullToAbsent || academicDegreeReceiveDate != null) {
      map['academic_degree_receive_date'] = Variable<DateTime>(
        academicDegreeReceiveDate,
      );
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || workEmail != null) {
      map['work_email'] = Variable<String>(workEmail);
    }
    if (!nullToAbsent || personalEmail != null) {
      map['personal_email'] = Variable<String>(personalEmail);
    }
    if (!nullToAbsent || citizenId != null) {
      map['citizen_id'] = Variable<String>(citizenId);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || bankAccount != null) {
      map['bank_account'] = Variable<String>(bankAccount);
    }
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || deprecatedTaxCode != null) {
      map['deprecated_tax_code'] = Variable<String>(deprecatedTaxCode);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || teacherGroupId != null) {
      map['teacher_group_id'] = Variable<int>(teacherGroupId);
    }
    return map;
  }

  TeacherCompanion toCompanion(bool nullToAbsent) {
    return TeacherCompanion(
      id: Value(id),
      staffId: staffId == null && nullToAbsent
          ? const Value.absent()
          : Value(staffId),
      name: Value(name),
      university: university == null && nullToAbsent
          ? const Value.absent()
          : Value(university),
      falcuty: falcuty == null && nullToAbsent
          ? const Value.absent()
          : Value(falcuty),
      isOutsider: Value(isOutsider),
      gender: Value(gender),
      specialization: specialization == null && nullToAbsent
          ? const Value.absent()
          : Value(specialization),
      academicRank: academicRank == null && nullToAbsent
          ? const Value.absent()
          : Value(academicRank),
      academicDegree: academicDegree == null && nullToAbsent
          ? const Value.absent()
          : Value(academicDegree),
      academicDegreeReceiveDate:
          academicDegreeReceiveDate == null && nullToAbsent
          ? const Value.absent()
          : Value(academicDegreeReceiveDate),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      workEmail: workEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(workEmail),
      personalEmail: personalEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(personalEmail),
      citizenId: citizenId == null && nullToAbsent
          ? const Value.absent()
          : Value(citizenId),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      bankAccount: bankAccount == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccount),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      deprecatedTaxCode: deprecatedTaxCode == null && nullToAbsent
          ? const Value.absent()
          : Value(deprecatedTaxCode),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      teacherGroupId: teacherGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherGroupId),
    );
  }

  factory TeacherData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeacherData(
      id: serializer.fromJson<int>(json['id']),
      staffId: serializer.fromJson<String?>(json['staff_id']),
      name: serializer.fromJson<String>(json['name']),
      university: serializer.fromJson<String?>(json['university']),
      falcuty: serializer.fromJson<String?>(json['falcuty']),
      isOutsider: serializer.fromJson<bool>(json['is_outsider']),
      gender: serializer.fromJson<enums.Gender>(json['gender']),
      specialization: serializer.fromJson<String?>(json['specialization']),
      academicRank: serializer.fromJson<enums.AcademicRank?>(
        json['academic_rank'],
      ),
      academicDegree: serializer.fromJson<enums.AcademicDegree?>(
        json['academic_degree'],
      ),
      academicDegreeReceiveDate: serializer.fromJson<DateTime?>(
        json['academic_degree_receive_date'],
      ),
      phoneNumber: serializer.fromJson<String?>(json['phone_number']),
      workEmail: serializer.fromJson<String?>(json['work_email']),
      personalEmail: serializer.fromJson<String?>(json['personal_email']),
      citizenId: serializer.fromJson<String?>(json['citizen_id']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['date_of_birth']),
      bankAccount: serializer.fromJson<String?>(json['bank_account']),
      bankName: serializer.fromJson<String?>(json['bank_name']),
      deprecatedTaxCode: serializer.fromJson<String?>(
        json['deprecated_tax_code'],
      ),
      note: serializer.fromJson<String?>(json['note']),
      teacherGroupId: serializer.fromJson<int?>(json['teacher_group_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'staff_id': serializer.toJson<String?>(staffId),
      'name': serializer.toJson<String>(name),
      'university': serializer.toJson<String?>(university),
      'falcuty': serializer.toJson<String?>(falcuty),
      'is_outsider': serializer.toJson<bool>(isOutsider),
      'gender': serializer.toJson<enums.Gender>(gender),
      'specialization': serializer.toJson<String?>(specialization),
      'academic_rank': serializer.toJson<enums.AcademicRank?>(academicRank),
      'academic_degree': serializer.toJson<enums.AcademicDegree?>(
        academicDegree,
      ),
      'academic_degree_receive_date': serializer.toJson<DateTime?>(
        academicDegreeReceiveDate,
      ),
      'phone_number': serializer.toJson<String?>(phoneNumber),
      'work_email': serializer.toJson<String?>(workEmail),
      'personal_email': serializer.toJson<String?>(personalEmail),
      'citizen_id': serializer.toJson<String?>(citizenId),
      'date_of_birth': serializer.toJson<DateTime?>(dateOfBirth),
      'bank_account': serializer.toJson<String?>(bankAccount),
      'bank_name': serializer.toJson<String?>(bankName),
      'deprecated_tax_code': serializer.toJson<String?>(deprecatedTaxCode),
      'note': serializer.toJson<String?>(note),
      'teacher_group_id': serializer.toJson<int?>(teacherGroupId),
    };
  }

  TeacherData copyWith({
    int? id,
    Value<String?> staffId = const Value.absent(),
    String? name,
    Value<String?> university = const Value.absent(),
    Value<String?> falcuty = const Value.absent(),
    bool? isOutsider,
    enums.Gender? gender,
    Value<String?> specialization = const Value.absent(),
    Value<enums.AcademicRank?> academicRank = const Value.absent(),
    Value<enums.AcademicDegree?> academicDegree = const Value.absent(),
    Value<DateTime?> academicDegreeReceiveDate = const Value.absent(),
    Value<String?> phoneNumber = const Value.absent(),
    Value<String?> workEmail = const Value.absent(),
    Value<String?> personalEmail = const Value.absent(),
    Value<String?> citizenId = const Value.absent(),
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<String?> bankAccount = const Value.absent(),
    Value<String?> bankName = const Value.absent(),
    Value<String?> deprecatedTaxCode = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<int?> teacherGroupId = const Value.absent(),
  }) => TeacherData(
    id: id ?? this.id,
    staffId: staffId.present ? staffId.value : this.staffId,
    name: name ?? this.name,
    university: university.present ? university.value : this.university,
    falcuty: falcuty.present ? falcuty.value : this.falcuty,
    isOutsider: isOutsider ?? this.isOutsider,
    gender: gender ?? this.gender,
    specialization: specialization.present
        ? specialization.value
        : this.specialization,
    academicRank: academicRank.present ? academicRank.value : this.academicRank,
    academicDegree: academicDegree.present
        ? academicDegree.value
        : this.academicDegree,
    academicDegreeReceiveDate: academicDegreeReceiveDate.present
        ? academicDegreeReceiveDate.value
        : this.academicDegreeReceiveDate,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    workEmail: workEmail.present ? workEmail.value : this.workEmail,
    personalEmail: personalEmail.present
        ? personalEmail.value
        : this.personalEmail,
    citizenId: citizenId.present ? citizenId.value : this.citizenId,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    bankAccount: bankAccount.present ? bankAccount.value : this.bankAccount,
    bankName: bankName.present ? bankName.value : this.bankName,
    deprecatedTaxCode: deprecatedTaxCode.present
        ? deprecatedTaxCode.value
        : this.deprecatedTaxCode,
    note: note.present ? note.value : this.note,
    teacherGroupId: teacherGroupId.present
        ? teacherGroupId.value
        : this.teacherGroupId,
  );
  TeacherData copyWithCompanion(TeacherCompanion data) {
    return TeacherData(
      id: data.id.present ? data.id.value : this.id,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      name: data.name.present ? data.name.value : this.name,
      university: data.university.present
          ? data.university.value
          : this.university,
      falcuty: data.falcuty.present ? data.falcuty.value : this.falcuty,
      isOutsider: data.isOutsider.present
          ? data.isOutsider.value
          : this.isOutsider,
      gender: data.gender.present ? data.gender.value : this.gender,
      specialization: data.specialization.present
          ? data.specialization.value
          : this.specialization,
      academicRank: data.academicRank.present
          ? data.academicRank.value
          : this.academicRank,
      academicDegree: data.academicDegree.present
          ? data.academicDegree.value
          : this.academicDegree,
      academicDegreeReceiveDate: data.academicDegreeReceiveDate.present
          ? data.academicDegreeReceiveDate.value
          : this.academicDegreeReceiveDate,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      workEmail: data.workEmail.present ? data.workEmail.value : this.workEmail,
      personalEmail: data.personalEmail.present
          ? data.personalEmail.value
          : this.personalEmail,
      citizenId: data.citizenId.present ? data.citizenId.value : this.citizenId,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      bankAccount: data.bankAccount.present
          ? data.bankAccount.value
          : this.bankAccount,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      deprecatedTaxCode: data.deprecatedTaxCode.present
          ? data.deprecatedTaxCode.value
          : this.deprecatedTaxCode,
      note: data.note.present ? data.note.value : this.note,
      teacherGroupId: data.teacherGroupId.present
          ? data.teacherGroupId.value
          : this.teacherGroupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeacherData(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('name: $name, ')
          ..write('university: $university, ')
          ..write('falcuty: $falcuty, ')
          ..write('isOutsider: $isOutsider, ')
          ..write('gender: $gender, ')
          ..write('specialization: $specialization, ')
          ..write('academicRank: $academicRank, ')
          ..write('academicDegree: $academicDegree, ')
          ..write('academicDegreeReceiveDate: $academicDegreeReceiveDate, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('workEmail: $workEmail, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('citizenId: $citizenId, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('bankAccount: $bankAccount, ')
          ..write('bankName: $bankName, ')
          ..write('deprecatedTaxCode: $deprecatedTaxCode, ')
          ..write('note: $note, ')
          ..write('teacherGroupId: $teacherGroupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    staffId,
    name,
    university,
    falcuty,
    isOutsider,
    gender,
    specialization,
    academicRank,
    academicDegree,
    academicDegreeReceiveDate,
    phoneNumber,
    workEmail,
    personalEmail,
    citizenId,
    dateOfBirth,
    bankAccount,
    bankName,
    deprecatedTaxCode,
    note,
    teacherGroupId,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeacherData &&
          other.id == this.id &&
          other.staffId == this.staffId &&
          other.name == this.name &&
          other.university == this.university &&
          other.falcuty == this.falcuty &&
          other.isOutsider == this.isOutsider &&
          other.gender == this.gender &&
          other.specialization == this.specialization &&
          other.academicRank == this.academicRank &&
          other.academicDegree == this.academicDegree &&
          other.academicDegreeReceiveDate == this.academicDegreeReceiveDate &&
          other.phoneNumber == this.phoneNumber &&
          other.workEmail == this.workEmail &&
          other.personalEmail == this.personalEmail &&
          other.citizenId == this.citizenId &&
          other.dateOfBirth == this.dateOfBirth &&
          other.bankAccount == this.bankAccount &&
          other.bankName == this.bankName &&
          other.deprecatedTaxCode == this.deprecatedTaxCode &&
          other.note == this.note &&
          other.teacherGroupId == this.teacherGroupId);
}

class TeacherCompanion extends UpdateCompanion<TeacherData> {
  final Value<int> id;
  final Value<String?> staffId;
  final Value<String> name;
  final Value<String?> university;
  final Value<String?> falcuty;
  final Value<bool> isOutsider;
  final Value<enums.Gender> gender;
  final Value<String?> specialization;
  final Value<enums.AcademicRank?> academicRank;
  final Value<enums.AcademicDegree?> academicDegree;
  final Value<DateTime?> academicDegreeReceiveDate;
  final Value<String?> phoneNumber;
  final Value<String?> workEmail;
  final Value<String?> personalEmail;
  final Value<String?> citizenId;
  final Value<DateTime?> dateOfBirth;
  final Value<String?> bankAccount;
  final Value<String?> bankName;
  final Value<String?> deprecatedTaxCode;
  final Value<String?> note;
  final Value<int?> teacherGroupId;
  const TeacherCompanion({
    this.id = const Value.absent(),
    this.staffId = const Value.absent(),
    this.name = const Value.absent(),
    this.university = const Value.absent(),
    this.falcuty = const Value.absent(),
    this.isOutsider = const Value.absent(),
    this.gender = const Value.absent(),
    this.specialization = const Value.absent(),
    this.academicRank = const Value.absent(),
    this.academicDegree = const Value.absent(),
    this.academicDegreeReceiveDate = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.workEmail = const Value.absent(),
    this.personalEmail = const Value.absent(),
    this.citizenId = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.bankAccount = const Value.absent(),
    this.bankName = const Value.absent(),
    this.deprecatedTaxCode = const Value.absent(),
    this.note = const Value.absent(),
    this.teacherGroupId = const Value.absent(),
  });
  TeacherCompanion.insert({
    this.id = const Value.absent(),
    this.staffId = const Value.absent(),
    required String name,
    this.university = const Value.absent(),
    this.falcuty = const Value.absent(),
    this.isOutsider = const Value.absent(),
    required enums.Gender gender,
    this.specialization = const Value.absent(),
    this.academicRank = const Value.absent(),
    this.academicDegree = const Value.absent(),
    this.academicDegreeReceiveDate = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.workEmail = const Value.absent(),
    this.personalEmail = const Value.absent(),
    this.citizenId = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.bankAccount = const Value.absent(),
    this.bankName = const Value.absent(),
    this.deprecatedTaxCode = const Value.absent(),
    this.note = const Value.absent(),
    this.teacherGroupId = const Value.absent(),
  }) : name = Value(name),
       gender = Value(gender);
  static Insertable<TeacherData> custom({
    Expression<int>? id,
    Expression<String>? staffId,
    Expression<String>? name,
    Expression<String>? university,
    Expression<String>? falcuty,
    Expression<bool>? isOutsider,
    Expression<String>? gender,
    Expression<String>? specialization,
    Expression<String>? academicRank,
    Expression<String>? academicDegree,
    Expression<DateTime>? academicDegreeReceiveDate,
    Expression<String>? phoneNumber,
    Expression<String>? workEmail,
    Expression<String>? personalEmail,
    Expression<String>? citizenId,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? bankAccount,
    Expression<String>? bankName,
    Expression<String>? deprecatedTaxCode,
    Expression<String>? note,
    Expression<int>? teacherGroupId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (staffId != null) 'staff_id': staffId,
      if (name != null) 'name': name,
      if (university != null) 'university': university,
      if (falcuty != null) 'falcuty': falcuty,
      if (isOutsider != null) 'is_outsider': isOutsider,
      if (gender != null) 'gender': gender,
      if (specialization != null) 'specialization': specialization,
      if (academicRank != null) 'academic_rank': academicRank,
      if (academicDegree != null) 'academic_degree': academicDegree,
      if (academicDegreeReceiveDate != null)
        'academic_degree_receive_date': academicDegreeReceiveDate,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (workEmail != null) 'work_email': workEmail,
      if (personalEmail != null) 'personal_email': personalEmail,
      if (citizenId != null) 'citizen_id': citizenId,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (bankAccount != null) 'bank_account': bankAccount,
      if (bankName != null) 'bank_name': bankName,
      if (deprecatedTaxCode != null) 'deprecated_tax_code': deprecatedTaxCode,
      if (note != null) 'note': note,
      if (teacherGroupId != null) 'teacher_group_id': teacherGroupId,
    });
  }

  TeacherCompanion copyWith({
    Value<int>? id,
    Value<String?>? staffId,
    Value<String>? name,
    Value<String?>? university,
    Value<String?>? falcuty,
    Value<bool>? isOutsider,
    Value<enums.Gender>? gender,
    Value<String?>? specialization,
    Value<enums.AcademicRank?>? academicRank,
    Value<enums.AcademicDegree?>? academicDegree,
    Value<DateTime?>? academicDegreeReceiveDate,
    Value<String?>? phoneNumber,
    Value<String?>? workEmail,
    Value<String?>? personalEmail,
    Value<String?>? citizenId,
    Value<DateTime?>? dateOfBirth,
    Value<String?>? bankAccount,
    Value<String?>? bankName,
    Value<String?>? deprecatedTaxCode,
    Value<String?>? note,
    Value<int?>? teacherGroupId,
  }) {
    return TeacherCompanion(
      id: id ?? this.id,
      staffId: staffId ?? this.staffId,
      name: name ?? this.name,
      university: university ?? this.university,
      falcuty: falcuty ?? this.falcuty,
      isOutsider: isOutsider ?? this.isOutsider,
      gender: gender ?? this.gender,
      specialization: specialization ?? this.specialization,
      academicRank: academicRank ?? this.academicRank,
      academicDegree: academicDegree ?? this.academicDegree,
      academicDegreeReceiveDate:
          academicDegreeReceiveDate ?? this.academicDegreeReceiveDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      workEmail: workEmail ?? this.workEmail,
      personalEmail: personalEmail ?? this.personalEmail,
      citizenId: citizenId ?? this.citizenId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bankAccount: bankAccount ?? this.bankAccount,
      bankName: bankName ?? this.bankName,
      deprecatedTaxCode: deprecatedTaxCode ?? this.deprecatedTaxCode,
      note: note ?? this.note,
      teacherGroupId: teacherGroupId ?? this.teacherGroupId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<String>(staffId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (university.present) {
      map['university'] = Variable<String>(university.value);
    }
    if (falcuty.present) {
      map['falcuty'] = Variable<String>(falcuty.value);
    }
    if (isOutsider.present) {
      map['is_outsider'] = Variable<bool>(isOutsider.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(
        Teacher.$convertergender.toSql(gender.value),
      );
    }
    if (specialization.present) {
      map['specialization'] = Variable<String>(specialization.value);
    }
    if (academicRank.present) {
      map['academic_rank'] = Variable<String>(
        Teacher.$converteracademicRank.toSql(academicRank.value),
      );
    }
    if (academicDegree.present) {
      map['academic_degree'] = Variable<String>(
        Teacher.$converteracademicDegree.toSql(academicDegree.value),
      );
    }
    if (academicDegreeReceiveDate.present) {
      map['academic_degree_receive_date'] = Variable<DateTime>(
        academicDegreeReceiveDate.value,
      );
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (workEmail.present) {
      map['work_email'] = Variable<String>(workEmail.value);
    }
    if (personalEmail.present) {
      map['personal_email'] = Variable<String>(personalEmail.value);
    }
    if (citizenId.present) {
      map['citizen_id'] = Variable<String>(citizenId.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (bankAccount.present) {
      map['bank_account'] = Variable<String>(bankAccount.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (deprecatedTaxCode.present) {
      map['deprecated_tax_code'] = Variable<String>(deprecatedTaxCode.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (teacherGroupId.present) {
      map['teacher_group_id'] = Variable<int>(teacherGroupId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeacherCompanion(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('name: $name, ')
          ..write('university: $university, ')
          ..write('falcuty: $falcuty, ')
          ..write('isOutsider: $isOutsider, ')
          ..write('gender: $gender, ')
          ..write('specialization: $specialization, ')
          ..write('academicRank: $academicRank, ')
          ..write('academicDegree: $academicDegree, ')
          ..write('academicDegreeReceiveDate: $academicDegreeReceiveDate, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('workEmail: $workEmail, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('citizenId: $citizenId, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('bankAccount: $bankAccount, ')
          ..write('bankName: $bankName, ')
          ..write('deprecatedTaxCode: $deprecatedTaxCode, ')
          ..write('note: $note, ')
          ..write('teacherGroupId: $teacherGroupId')
          ..write(')'))
        .toString();
  }
}

class CourseFts extends Table
    with TableInfo<CourseFts, CourseFt>, VirtualTableInfo<CourseFts, CourseFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CourseFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _vietnameseNameMeta = const VerificationMeta(
    'vietnameseName',
  );
  late final GeneratedColumn<String> vietnameseName = GeneratedColumn<String>(
    'vietnamese_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _englishNameMeta = const VerificationMeta(
    'englishName',
  );
  late final GeneratedColumn<String> englishName = GeneratedColumn<String>(
    'english_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [id, vietnameseName, englishName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_fts';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseFt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vietnamese_name')) {
      context.handle(
        _vietnameseNameMeta,
        vietnameseName.isAcceptableOrUnknown(
          data['vietnamese_name']!,
          _vietnameseNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vietnameseNameMeta);
    }
    if (data.containsKey('english_name')) {
      context.handle(
        _englishNameMeta,
        englishName.isAcceptableOrUnknown(
          data['english_name']!,
          _englishNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CourseFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseFt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      vietnameseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vietnamese_name'],
      )!,
      englishName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english_name'],
      )!,
    );
  }

  @override
  CourseFts createAlias(String alias) {
    return CourseFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(id, vietnamese_name, english_name, prefix=3, tokenize="trigram remove_diacritics 1 case_sensitive 0")';
}

class CourseFt extends DataClass implements Insertable<CourseFt> {
  final String id;
  final String vietnameseName;
  final String englishName;
  const CourseFt({
    required this.id,
    required this.vietnameseName,
    required this.englishName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vietnamese_name'] = Variable<String>(vietnameseName);
    map['english_name'] = Variable<String>(englishName);
    return map;
  }

  CourseFtsCompanion toCompanion(bool nullToAbsent) {
    return CourseFtsCompanion(
      id: Value(id),
      vietnameseName: Value(vietnameseName),
      englishName: Value(englishName),
    );
  }

  factory CourseFt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseFt(
      id: serializer.fromJson<String>(json['id']),
      vietnameseName: serializer.fromJson<String>(json['vietnamese_name']),
      englishName: serializer.fromJson<String>(json['english_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vietnamese_name': serializer.toJson<String>(vietnameseName),
      'english_name': serializer.toJson<String>(englishName),
    };
  }

  CourseFt copyWith({
    String? id,
    String? vietnameseName,
    String? englishName,
  }) => CourseFt(
    id: id ?? this.id,
    vietnameseName: vietnameseName ?? this.vietnameseName,
    englishName: englishName ?? this.englishName,
  );
  CourseFt copyWithCompanion(CourseFtsCompanion data) {
    return CourseFt(
      id: data.id.present ? data.id.value : this.id,
      vietnameseName: data.vietnameseName.present
          ? data.vietnameseName.value
          : this.vietnameseName,
      englishName: data.englishName.present
          ? data.englishName.value
          : this.englishName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseFt(')
          ..write('id: $id, ')
          ..write('vietnameseName: $vietnameseName, ')
          ..write('englishName: $englishName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, vietnameseName, englishName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseFt &&
          other.id == this.id &&
          other.vietnameseName == this.vietnameseName &&
          other.englishName == this.englishName);
}

class CourseFtsCompanion extends UpdateCompanion<CourseFt> {
  final Value<String> id;
  final Value<String> vietnameseName;
  final Value<String> englishName;
  final Value<int> rowid;
  const CourseFtsCompanion({
    this.id = const Value.absent(),
    this.vietnameseName = const Value.absent(),
    this.englishName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseFtsCompanion.insert({
    required String id,
    required String vietnameseName,
    required String englishName,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       vietnameseName = Value(vietnameseName),
       englishName = Value(englishName);
  static Insertable<CourseFt> custom({
    Expression<String>? id,
    Expression<String>? vietnameseName,
    Expression<String>? englishName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vietnameseName != null) 'vietnamese_name': vietnameseName,
      if (englishName != null) 'english_name': englishName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseFtsCompanion copyWith({
    Value<String>? id,
    Value<String>? vietnameseName,
    Value<String>? englishName,
    Value<int>? rowid,
  }) {
    return CourseFtsCompanion(
      id: id ?? this.id,
      vietnameseName: vietnameseName ?? this.vietnameseName,
      englishName: englishName ?? this.englishName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vietnameseName.present) {
      map['vietnamese_name'] = Variable<String>(vietnameseName.value);
    }
    if (englishName.present) {
      map['english_name'] = Variable<String>(englishName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseFtsCompanion(')
          ..write('id: $id, ')
          ..write('vietnameseName: $vietnameseName, ')
          ..write('englishName: $englishName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Course extends Table with TableInfo<Course, CourseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Course(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _vietnameseNameMeta = const VerificationMeta(
    'vietnameseName',
  );
  late final GeneratedColumn<String> vietnameseName = GeneratedColumn<String>(
    'vietnamese_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _englishNameMeta = const VerificationMeta(
    'englishName',
  );
  late final GeneratedColumn<String> englishName = GeneratedColumn<String>(
    'english_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumnWithTypeConverter<enums.CourseCategory, String>
  category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<enums.CourseCategory>(Course.$convertercategory);
  static const VerificationMeta _numCreditsMeta = const VerificationMeta(
    'numCredits',
  );
  late final GeneratedColumn<int> numCredits = GeneratedColumn<int>(
    'num_credits',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _numTheoryHoursMeta = const VerificationMeta(
    'numTheoryHours',
  );
  late final GeneratedColumn<int> numTheoryHours = GeneratedColumn<int>(
    'num_theory_hours',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _numPracticeHoursMeta = const VerificationMeta(
    'numPracticeHours',
  );
  late final GeneratedColumn<int> numPracticeHours = GeneratedColumn<int>(
    'num_practice_hours',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _numLabHoursMeta = const VerificationMeta(
    'numLabHours',
  );
  late final GeneratedColumn<int> numLabHours = GeneratedColumn<int>(
    'num_lab_hours',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _numSelfStudyHoursMeta = const VerificationMeta(
    'numSelfStudyHours',
  );
  late final GeneratedColumn<int> numSelfStudyHours = GeneratedColumn<int>(
    'num_self_study_hours',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vietnameseName,
    englishName,
    category,
    numCredits,
    numTheoryHours,
    numPracticeHours,
    numLabHours,
    numSelfStudyHours,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vietnamese_name')) {
      context.handle(
        _vietnameseNameMeta,
        vietnameseName.isAcceptableOrUnknown(
          data['vietnamese_name']!,
          _vietnameseNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vietnameseNameMeta);
    }
    if (data.containsKey('english_name')) {
      context.handle(
        _englishNameMeta,
        englishName.isAcceptableOrUnknown(
          data['english_name']!,
          _englishNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishNameMeta);
    }
    if (data.containsKey('num_credits')) {
      context.handle(
        _numCreditsMeta,
        numCredits.isAcceptableOrUnknown(data['num_credits']!, _numCreditsMeta),
      );
    } else if (isInserting) {
      context.missing(_numCreditsMeta);
    }
    if (data.containsKey('num_theory_hours')) {
      context.handle(
        _numTheoryHoursMeta,
        numTheoryHours.isAcceptableOrUnknown(
          data['num_theory_hours']!,
          _numTheoryHoursMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numTheoryHoursMeta);
    }
    if (data.containsKey('num_practice_hours')) {
      context.handle(
        _numPracticeHoursMeta,
        numPracticeHours.isAcceptableOrUnknown(
          data['num_practice_hours']!,
          _numPracticeHoursMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numPracticeHoursMeta);
    }
    if (data.containsKey('num_lab_hours')) {
      context.handle(
        _numLabHoursMeta,
        numLabHours.isAcceptableOrUnknown(
          data['num_lab_hours']!,
          _numLabHoursMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numLabHoursMeta);
    }
    if (data.containsKey('num_self_study_hours')) {
      context.handle(
        _numSelfStudyHoursMeta,
        numSelfStudyHours.isAcceptableOrUnknown(
          data['num_self_study_hours']!,
          _numSelfStudyHoursMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numSelfStudyHoursMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      vietnameseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vietnamese_name'],
      )!,
      englishName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english_name'],
      )!,
      category: Course.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      numCredits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}num_credits'],
      )!,
      numTheoryHours: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}num_theory_hours'],
      )!,
      numPracticeHours: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}num_practice_hours'],
      )!,
      numLabHours: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}num_lab_hours'],
      )!,
      numSelfStudyHours: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}num_self_study_hours'],
      )!,
    );
  }

  @override
  Course createAlias(String alias) {
    return Course(attachedDatabase, alias);
  }

  static TypeConverter<enums.CourseCategory, String> $convertercategory =
      const enums.CourseCategoryConverter();
  @override
  bool get dontWriteConstraints => true;
}

class CourseData extends DataClass implements Insertable<CourseData> {
  final String id;
  final String vietnameseName;
  final String englishName;
  final enums.CourseCategory category;
  final int numCredits;
  final int numTheoryHours;
  final int numPracticeHours;
  final int numLabHours;
  final int numSelfStudyHours;
  const CourseData({
    required this.id,
    required this.vietnameseName,
    required this.englishName,
    required this.category,
    required this.numCredits,
    required this.numTheoryHours,
    required this.numPracticeHours,
    required this.numLabHours,
    required this.numSelfStudyHours,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vietnamese_name'] = Variable<String>(vietnameseName);
    map['english_name'] = Variable<String>(englishName);
    {
      map['category'] = Variable<String>(
        Course.$convertercategory.toSql(category),
      );
    }
    map['num_credits'] = Variable<int>(numCredits);
    map['num_theory_hours'] = Variable<int>(numTheoryHours);
    map['num_practice_hours'] = Variable<int>(numPracticeHours);
    map['num_lab_hours'] = Variable<int>(numLabHours);
    map['num_self_study_hours'] = Variable<int>(numSelfStudyHours);
    return map;
  }

  CourseCompanion toCompanion(bool nullToAbsent) {
    return CourseCompanion(
      id: Value(id),
      vietnameseName: Value(vietnameseName),
      englishName: Value(englishName),
      category: Value(category),
      numCredits: Value(numCredits),
      numTheoryHours: Value(numTheoryHours),
      numPracticeHours: Value(numPracticeHours),
      numLabHours: Value(numLabHours),
      numSelfStudyHours: Value(numSelfStudyHours),
    );
  }

  factory CourseData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseData(
      id: serializer.fromJson<String>(json['id']),
      vietnameseName: serializer.fromJson<String>(json['vietnamese_name']),
      englishName: serializer.fromJson<String>(json['english_name']),
      category: serializer.fromJson<enums.CourseCategory>(json['category']),
      numCredits: serializer.fromJson<int>(json['num_credits']),
      numTheoryHours: serializer.fromJson<int>(json['num_theory_hours']),
      numPracticeHours: serializer.fromJson<int>(json['num_practice_hours']),
      numLabHours: serializer.fromJson<int>(json['num_lab_hours']),
      numSelfStudyHours: serializer.fromJson<int>(json['num_self_study_hours']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vietnamese_name': serializer.toJson<String>(vietnameseName),
      'english_name': serializer.toJson<String>(englishName),
      'category': serializer.toJson<enums.CourseCategory>(category),
      'num_credits': serializer.toJson<int>(numCredits),
      'num_theory_hours': serializer.toJson<int>(numTheoryHours),
      'num_practice_hours': serializer.toJson<int>(numPracticeHours),
      'num_lab_hours': serializer.toJson<int>(numLabHours),
      'num_self_study_hours': serializer.toJson<int>(numSelfStudyHours),
    };
  }

  CourseData copyWith({
    String? id,
    String? vietnameseName,
    String? englishName,
    enums.CourseCategory? category,
    int? numCredits,
    int? numTheoryHours,
    int? numPracticeHours,
    int? numLabHours,
    int? numSelfStudyHours,
  }) => CourseData(
    id: id ?? this.id,
    vietnameseName: vietnameseName ?? this.vietnameseName,
    englishName: englishName ?? this.englishName,
    category: category ?? this.category,
    numCredits: numCredits ?? this.numCredits,
    numTheoryHours: numTheoryHours ?? this.numTheoryHours,
    numPracticeHours: numPracticeHours ?? this.numPracticeHours,
    numLabHours: numLabHours ?? this.numLabHours,
    numSelfStudyHours: numSelfStudyHours ?? this.numSelfStudyHours,
  );
  CourseData copyWithCompanion(CourseCompanion data) {
    return CourseData(
      id: data.id.present ? data.id.value : this.id,
      vietnameseName: data.vietnameseName.present
          ? data.vietnameseName.value
          : this.vietnameseName,
      englishName: data.englishName.present
          ? data.englishName.value
          : this.englishName,
      category: data.category.present ? data.category.value : this.category,
      numCredits: data.numCredits.present
          ? data.numCredits.value
          : this.numCredits,
      numTheoryHours: data.numTheoryHours.present
          ? data.numTheoryHours.value
          : this.numTheoryHours,
      numPracticeHours: data.numPracticeHours.present
          ? data.numPracticeHours.value
          : this.numPracticeHours,
      numLabHours: data.numLabHours.present
          ? data.numLabHours.value
          : this.numLabHours,
      numSelfStudyHours: data.numSelfStudyHours.present
          ? data.numSelfStudyHours.value
          : this.numSelfStudyHours,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseData(')
          ..write('id: $id, ')
          ..write('vietnameseName: $vietnameseName, ')
          ..write('englishName: $englishName, ')
          ..write('category: $category, ')
          ..write('numCredits: $numCredits, ')
          ..write('numTheoryHours: $numTheoryHours, ')
          ..write('numPracticeHours: $numPracticeHours, ')
          ..write('numLabHours: $numLabHours, ')
          ..write('numSelfStudyHours: $numSelfStudyHours')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vietnameseName,
    englishName,
    category,
    numCredits,
    numTheoryHours,
    numPracticeHours,
    numLabHours,
    numSelfStudyHours,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseData &&
          other.id == this.id &&
          other.vietnameseName == this.vietnameseName &&
          other.englishName == this.englishName &&
          other.category == this.category &&
          other.numCredits == this.numCredits &&
          other.numTheoryHours == this.numTheoryHours &&
          other.numPracticeHours == this.numPracticeHours &&
          other.numLabHours == this.numLabHours &&
          other.numSelfStudyHours == this.numSelfStudyHours);
}

class CourseCompanion extends UpdateCompanion<CourseData> {
  final Value<String> id;
  final Value<String> vietnameseName;
  final Value<String> englishName;
  final Value<enums.CourseCategory> category;
  final Value<int> numCredits;
  final Value<int> numTheoryHours;
  final Value<int> numPracticeHours;
  final Value<int> numLabHours;
  final Value<int> numSelfStudyHours;
  final Value<int> rowid;
  const CourseCompanion({
    this.id = const Value.absent(),
    this.vietnameseName = const Value.absent(),
    this.englishName = const Value.absent(),
    this.category = const Value.absent(),
    this.numCredits = const Value.absent(),
    this.numTheoryHours = const Value.absent(),
    this.numPracticeHours = const Value.absent(),
    this.numLabHours = const Value.absent(),
    this.numSelfStudyHours = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseCompanion.insert({
    required String id,
    required String vietnameseName,
    required String englishName,
    required enums.CourseCategory category,
    required int numCredits,
    required int numTheoryHours,
    required int numPracticeHours,
    required int numLabHours,
    required int numSelfStudyHours,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       vietnameseName = Value(vietnameseName),
       englishName = Value(englishName),
       category = Value(category),
       numCredits = Value(numCredits),
       numTheoryHours = Value(numTheoryHours),
       numPracticeHours = Value(numPracticeHours),
       numLabHours = Value(numLabHours),
       numSelfStudyHours = Value(numSelfStudyHours);
  static Insertable<CourseData> custom({
    Expression<String>? id,
    Expression<String>? vietnameseName,
    Expression<String>? englishName,
    Expression<String>? category,
    Expression<int>? numCredits,
    Expression<int>? numTheoryHours,
    Expression<int>? numPracticeHours,
    Expression<int>? numLabHours,
    Expression<int>? numSelfStudyHours,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vietnameseName != null) 'vietnamese_name': vietnameseName,
      if (englishName != null) 'english_name': englishName,
      if (category != null) 'category': category,
      if (numCredits != null) 'num_credits': numCredits,
      if (numTheoryHours != null) 'num_theory_hours': numTheoryHours,
      if (numPracticeHours != null) 'num_practice_hours': numPracticeHours,
      if (numLabHours != null) 'num_lab_hours': numLabHours,
      if (numSelfStudyHours != null) 'num_self_study_hours': numSelfStudyHours,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseCompanion copyWith({
    Value<String>? id,
    Value<String>? vietnameseName,
    Value<String>? englishName,
    Value<enums.CourseCategory>? category,
    Value<int>? numCredits,
    Value<int>? numTheoryHours,
    Value<int>? numPracticeHours,
    Value<int>? numLabHours,
    Value<int>? numSelfStudyHours,
    Value<int>? rowid,
  }) {
    return CourseCompanion(
      id: id ?? this.id,
      vietnameseName: vietnameseName ?? this.vietnameseName,
      englishName: englishName ?? this.englishName,
      category: category ?? this.category,
      numCredits: numCredits ?? this.numCredits,
      numTheoryHours: numTheoryHours ?? this.numTheoryHours,
      numPracticeHours: numPracticeHours ?? this.numPracticeHours,
      numLabHours: numLabHours ?? this.numLabHours,
      numSelfStudyHours: numSelfStudyHours ?? this.numSelfStudyHours,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vietnameseName.present) {
      map['vietnamese_name'] = Variable<String>(vietnameseName.value);
    }
    if (englishName.present) {
      map['english_name'] = Variable<String>(englishName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        Course.$convertercategory.toSql(category.value),
      );
    }
    if (numCredits.present) {
      map['num_credits'] = Variable<int>(numCredits.value);
    }
    if (numTheoryHours.present) {
      map['num_theory_hours'] = Variable<int>(numTheoryHours.value);
    }
    if (numPracticeHours.present) {
      map['num_practice_hours'] = Variable<int>(numPracticeHours.value);
    }
    if (numLabHours.present) {
      map['num_lab_hours'] = Variable<int>(numLabHours.value);
    }
    if (numSelfStudyHours.present) {
      map['num_self_study_hours'] = Variable<int>(numSelfStudyHours.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseCompanion(')
          ..write('id: $id, ')
          ..write('vietnameseName: $vietnameseName, ')
          ..write('englishName: $englishName, ')
          ..write('category: $category, ')
          ..write('numCredits: $numCredits, ')
          ..write('numTheoryHours: $numTheoryHours, ')
          ..write('numPracticeHours: $numPracticeHours, ')
          ..write('numLabHours: $numLabHours, ')
          ..write('numSelfStudyHours: $numSelfStudyHours, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ThesisFts extends Table
    with TableInfo<ThesisFts, ThesisFt>, VirtualTableInfo<ThesisFts, ThesisFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ThesisFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _idGiangVienMeta = const VerificationMeta(
    'idGiangVien',
  );
  late final GeneratedColumn<String> idGiangVien = GeneratedColumn<String>(
    'idGiangVien',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _idHocVienMeta = const VerificationMeta(
    'idHocVien',
  );
  late final GeneratedColumn<String> idHocVien = GeneratedColumn<String>(
    'idHocVien',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _tenTiengAnhMeta = const VerificationMeta(
    'tenTiengAnh',
  );
  late final GeneratedColumn<String> tenTiengAnh = GeneratedColumn<String>(
    'tenTiengAnh',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _tenTiengVietMeta = const VerificationMeta(
    'tenTiengViet',
  );
  late final GeneratedColumn<String> tenTiengViet = GeneratedColumn<String>(
    'tenTiengViet',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _giangVienMeta = const VerificationMeta(
    'giangVien',
  );
  late final GeneratedColumn<String> giangVien = GeneratedColumn<String>(
    'giangVien',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _hocVienMeta = const VerificationMeta(
    'hocVien',
  );
  late final GeneratedColumn<String> hocVien = GeneratedColumn<String>(
    'hocVien',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idGiangVien,
    idHocVien,
    tenTiengAnh,
    tenTiengViet,
    giangVien,
    hocVien,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'thesis_fts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ThesisFt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('idGiangVien')) {
      context.handle(
        _idGiangVienMeta,
        idGiangVien.isAcceptableOrUnknown(
          data['idGiangVien']!,
          _idGiangVienMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idGiangVienMeta);
    }
    if (data.containsKey('idHocVien')) {
      context.handle(
        _idHocVienMeta,
        idHocVien.isAcceptableOrUnknown(data['idHocVien']!, _idHocVienMeta),
      );
    } else if (isInserting) {
      context.missing(_idHocVienMeta);
    }
    if (data.containsKey('tenTiengAnh')) {
      context.handle(
        _tenTiengAnhMeta,
        tenTiengAnh.isAcceptableOrUnknown(
          data['tenTiengAnh']!,
          _tenTiengAnhMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tenTiengAnhMeta);
    }
    if (data.containsKey('tenTiengViet')) {
      context.handle(
        _tenTiengVietMeta,
        tenTiengViet.isAcceptableOrUnknown(
          data['tenTiengViet']!,
          _tenTiengVietMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tenTiengVietMeta);
    }
    if (data.containsKey('giangVien')) {
      context.handle(
        _giangVienMeta,
        giangVien.isAcceptableOrUnknown(data['giangVien']!, _giangVienMeta),
      );
    } else if (isInserting) {
      context.missing(_giangVienMeta);
    }
    if (data.containsKey('hocVien')) {
      context.handle(
        _hocVienMeta,
        hocVien.isAcceptableOrUnknown(data['hocVien']!, _hocVienMeta),
      );
    } else if (isInserting) {
      context.missing(_hocVienMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ThesisFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ThesisFt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      idGiangVien: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idGiangVien'],
      )!,
      idHocVien: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idHocVien'],
      )!,
      tenTiengAnh: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenTiengAnh'],
      )!,
      tenTiengViet: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenTiengViet'],
      )!,
      giangVien: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}giangVien'],
      )!,
      hocVien: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hocVien'],
      )!,
    );
  }

  @override
  ThesisFts createAlias(String alias) {
    return ThesisFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(id, idGiangVien, idHocVien, tenTiengAnh, tenTiengViet, giangVien, hocVien, tokenize="trigram remove_diacritics 1 case_sensitive 0", prefix="2 3 5 7")';
}

class ThesisFt extends DataClass implements Insertable<ThesisFt> {
  final String id;
  final String idGiangVien;
  final String idHocVien;
  final String tenTiengAnh;
  final String tenTiengViet;
  final String giangVien;
  final String hocVien;
  const ThesisFt({
    required this.id,
    required this.idGiangVien,
    required this.idHocVien,
    required this.tenTiengAnh,
    required this.tenTiengViet,
    required this.giangVien,
    required this.hocVien,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['idGiangVien'] = Variable<String>(idGiangVien);
    map['idHocVien'] = Variable<String>(idHocVien);
    map['tenTiengAnh'] = Variable<String>(tenTiengAnh);
    map['tenTiengViet'] = Variable<String>(tenTiengViet);
    map['giangVien'] = Variable<String>(giangVien);
    map['hocVien'] = Variable<String>(hocVien);
    return map;
  }

  ThesisFtsCompanion toCompanion(bool nullToAbsent) {
    return ThesisFtsCompanion(
      id: Value(id),
      idGiangVien: Value(idGiangVien),
      idHocVien: Value(idHocVien),
      tenTiengAnh: Value(tenTiengAnh),
      tenTiengViet: Value(tenTiengViet),
      giangVien: Value(giangVien),
      hocVien: Value(hocVien),
    );
  }

  factory ThesisFt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThesisFt(
      id: serializer.fromJson<String>(json['id']),
      idGiangVien: serializer.fromJson<String>(json['idGiangVien']),
      idHocVien: serializer.fromJson<String>(json['idHocVien']),
      tenTiengAnh: serializer.fromJson<String>(json['tenTiengAnh']),
      tenTiengViet: serializer.fromJson<String>(json['tenTiengViet']),
      giangVien: serializer.fromJson<String>(json['giangVien']),
      hocVien: serializer.fromJson<String>(json['hocVien']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'idGiangVien': serializer.toJson<String>(idGiangVien),
      'idHocVien': serializer.toJson<String>(idHocVien),
      'tenTiengAnh': serializer.toJson<String>(tenTiengAnh),
      'tenTiengViet': serializer.toJson<String>(tenTiengViet),
      'giangVien': serializer.toJson<String>(giangVien),
      'hocVien': serializer.toJson<String>(hocVien),
    };
  }

  ThesisFt copyWith({
    String? id,
    String? idGiangVien,
    String? idHocVien,
    String? tenTiengAnh,
    String? tenTiengViet,
    String? giangVien,
    String? hocVien,
  }) => ThesisFt(
    id: id ?? this.id,
    idGiangVien: idGiangVien ?? this.idGiangVien,
    idHocVien: idHocVien ?? this.idHocVien,
    tenTiengAnh: tenTiengAnh ?? this.tenTiengAnh,
    tenTiengViet: tenTiengViet ?? this.tenTiengViet,
    giangVien: giangVien ?? this.giangVien,
    hocVien: hocVien ?? this.hocVien,
  );
  ThesisFt copyWithCompanion(ThesisFtsCompanion data) {
    return ThesisFt(
      id: data.id.present ? data.id.value : this.id,
      idGiangVien: data.idGiangVien.present
          ? data.idGiangVien.value
          : this.idGiangVien,
      idHocVien: data.idHocVien.present ? data.idHocVien.value : this.idHocVien,
      tenTiengAnh: data.tenTiengAnh.present
          ? data.tenTiengAnh.value
          : this.tenTiengAnh,
      tenTiengViet: data.tenTiengViet.present
          ? data.tenTiengViet.value
          : this.tenTiengViet,
      giangVien: data.giangVien.present ? data.giangVien.value : this.giangVien,
      hocVien: data.hocVien.present ? data.hocVien.value : this.hocVien,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ThesisFt(')
          ..write('id: $id, ')
          ..write('idGiangVien: $idGiangVien, ')
          ..write('idHocVien: $idHocVien, ')
          ..write('tenTiengAnh: $tenTiengAnh, ')
          ..write('tenTiengViet: $tenTiengViet, ')
          ..write('giangVien: $giangVien, ')
          ..write('hocVien: $hocVien')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    idGiangVien,
    idHocVien,
    tenTiengAnh,
    tenTiengViet,
    giangVien,
    hocVien,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThesisFt &&
          other.id == this.id &&
          other.idGiangVien == this.idGiangVien &&
          other.idHocVien == this.idHocVien &&
          other.tenTiengAnh == this.tenTiengAnh &&
          other.tenTiengViet == this.tenTiengViet &&
          other.giangVien == this.giangVien &&
          other.hocVien == this.hocVien);
}

class ThesisFtsCompanion extends UpdateCompanion<ThesisFt> {
  final Value<String> id;
  final Value<String> idGiangVien;
  final Value<String> idHocVien;
  final Value<String> tenTiengAnh;
  final Value<String> tenTiengViet;
  final Value<String> giangVien;
  final Value<String> hocVien;
  final Value<int> rowid;
  const ThesisFtsCompanion({
    this.id = const Value.absent(),
    this.idGiangVien = const Value.absent(),
    this.idHocVien = const Value.absent(),
    this.tenTiengAnh = const Value.absent(),
    this.tenTiengViet = const Value.absent(),
    this.giangVien = const Value.absent(),
    this.hocVien = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ThesisFtsCompanion.insert({
    required String id,
    required String idGiangVien,
    required String idHocVien,
    required String tenTiengAnh,
    required String tenTiengViet,
    required String giangVien,
    required String hocVien,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       idGiangVien = Value(idGiangVien),
       idHocVien = Value(idHocVien),
       tenTiengAnh = Value(tenTiengAnh),
       tenTiengViet = Value(tenTiengViet),
       giangVien = Value(giangVien),
       hocVien = Value(hocVien);
  static Insertable<ThesisFt> custom({
    Expression<String>? id,
    Expression<String>? idGiangVien,
    Expression<String>? idHocVien,
    Expression<String>? tenTiengAnh,
    Expression<String>? tenTiengViet,
    Expression<String>? giangVien,
    Expression<String>? hocVien,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idGiangVien != null) 'idGiangVien': idGiangVien,
      if (idHocVien != null) 'idHocVien': idHocVien,
      if (tenTiengAnh != null) 'tenTiengAnh': tenTiengAnh,
      if (tenTiengViet != null) 'tenTiengViet': tenTiengViet,
      if (giangVien != null) 'giangVien': giangVien,
      if (hocVien != null) 'hocVien': hocVien,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ThesisFtsCompanion copyWith({
    Value<String>? id,
    Value<String>? idGiangVien,
    Value<String>? idHocVien,
    Value<String>? tenTiengAnh,
    Value<String>? tenTiengViet,
    Value<String>? giangVien,
    Value<String>? hocVien,
    Value<int>? rowid,
  }) {
    return ThesisFtsCompanion(
      id: id ?? this.id,
      idGiangVien: idGiangVien ?? this.idGiangVien,
      idHocVien: idHocVien ?? this.idHocVien,
      tenTiengAnh: tenTiengAnh ?? this.tenTiengAnh,
      tenTiengViet: tenTiengViet ?? this.tenTiengViet,
      giangVien: giangVien ?? this.giangVien,
      hocVien: hocVien ?? this.hocVien,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (idGiangVien.present) {
      map['idGiangVien'] = Variable<String>(idGiangVien.value);
    }
    if (idHocVien.present) {
      map['idHocVien'] = Variable<String>(idHocVien.value);
    }
    if (tenTiengAnh.present) {
      map['tenTiengAnh'] = Variable<String>(tenTiengAnh.value);
    }
    if (tenTiengViet.present) {
      map['tenTiengViet'] = Variable<String>(tenTiengViet.value);
    }
    if (giangVien.present) {
      map['giangVien'] = Variable<String>(giangVien.value);
    }
    if (hocVien.present) {
      map['hocVien'] = Variable<String>(hocVien.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThesisFtsCompanion(')
          ..write('id: $id, ')
          ..write('idGiangVien: $idGiangVien, ')
          ..write('idHocVien: $idHocVien, ')
          ..write('tenTiengAnh: $tenTiengAnh, ')
          ..write('tenTiengViet: $tenTiengViet, ')
          ..write('giangVien: $giangVien, ')
          ..write('hocVien: $hocVien, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Preference extends Table with TableInfo<Preference, PreferenceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Preference(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preference';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreferenceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  PreferenceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreferenceData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
    );
  }

  @override
  Preference createAlias(String alias) {
    return Preference(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PreferenceData extends DataClass implements Insertable<PreferenceData> {
  final String key;
  final String? value;
  const PreferenceData({required this.key, this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  PreferenceCompanion toCompanion(bool nullToAbsent) {
    return PreferenceCompanion(
      key: Value(key),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
    );
  }

  factory PreferenceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreferenceData(
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

  PreferenceData copyWith({
    String? key,
    Value<String?> value = const Value.absent(),
  }) => PreferenceData(
    key: key ?? this.key,
    value: value.present ? value.value : this.value,
  );
  PreferenceData copyWithCompanion(PreferenceCompanion data) {
    return PreferenceData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreferenceData(')
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
      (other is PreferenceData &&
          other.key == this.key &&
          other.value == this.value);
}

class PreferenceCompanion extends UpdateCompanion<PreferenceData> {
  final Value<String> key;
  final Value<String?> value;
  final Value<int> rowid;
  const PreferenceCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PreferenceCompanion.insert({
    required String key,
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key);
  static Insertable<PreferenceData> custom({
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

  PreferenceCompanion copyWith({
    Value<String>? key,
    Value<String?>? value,
    Value<int>? rowid,
  }) {
    return PreferenceCompanion(
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
    return (StringBuffer('PreferenceCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DocumentRole extends Table
    with TableInfo<DocumentRole, DocumentRoleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DocumentRole(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _canExpireMeta = const VerificationMeta(
    'canExpire',
  );
  late final GeneratedColumn<bool> canExpire = GeneratedColumn<bool>(
    'can_expire',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT ()',
    defaultValue: const CustomExpression(''),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, canExpire, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_role';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentRoleData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('can_expire')) {
      context.handle(
        _canExpireMeta,
        canExpire.isAcceptableOrUnknown(data['can_expire']!, _canExpireMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentRoleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentRoleData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      canExpire: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}can_expire'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
    );
  }

  @override
  DocumentRole createAlias(String alias) {
    return DocumentRole(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DocumentRoleData extends DataClass
    implements Insertable<DocumentRoleData> {
  final int id;
  final String name;
  final bool canExpire;
  final String category;
  const DocumentRoleData({
    required this.id,
    required this.name,
    required this.canExpire,
    required this.category,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['can_expire'] = Variable<bool>(canExpire);
    map['category'] = Variable<String>(category);
    return map;
  }

  DocumentRoleCompanion toCompanion(bool nullToAbsent) {
    return DocumentRoleCompanion(
      id: Value(id),
      name: Value(name),
      canExpire: Value(canExpire),
      category: Value(category),
    );
  }

  factory DocumentRoleData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentRoleData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      canExpire: serializer.fromJson<bool>(json['can_expire']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'can_expire': serializer.toJson<bool>(canExpire),
      'category': serializer.toJson<String>(category),
    };
  }

  DocumentRoleData copyWith({
    int? id,
    String? name,
    bool? canExpire,
    String? category,
  }) => DocumentRoleData(
    id: id ?? this.id,
    name: name ?? this.name,
    canExpire: canExpire ?? this.canExpire,
    category: category ?? this.category,
  );
  DocumentRoleData copyWithCompanion(DocumentRoleCompanion data) {
    return DocumentRoleData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      canExpire: data.canExpire.present ? data.canExpire.value : this.canExpire,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentRoleData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('canExpire: $canExpire, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, canExpire, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentRoleData &&
          other.id == this.id &&
          other.name == this.name &&
          other.canExpire == this.canExpire &&
          other.category == this.category);
}

class DocumentRoleCompanion extends UpdateCompanion<DocumentRoleData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> canExpire;
  final Value<String> category;
  const DocumentRoleCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.canExpire = const Value.absent(),
    this.category = const Value.absent(),
  });
  DocumentRoleCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.canExpire = const Value.absent(),
    this.category = const Value.absent(),
  }) : name = Value(name);
  static Insertable<DocumentRoleData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? canExpire,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (canExpire != null) 'can_expire': canExpire,
      if (category != null) 'category': category,
    });
  }

  DocumentRoleCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? canExpire,
    Value<String>? category,
  }) {
    return DocumentRoleCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      canExpire: canExpire ?? this.canExpire,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (canExpire.present) {
      map['can_expire'] = Variable<bool>(canExpire.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentRoleCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('canExpire: $canExpire, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class Document extends Table with TableInfo<Document, DocumentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Document(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _officalCodeMeta = const VerificationMeta(
    'officalCode',
  );
  late final GeneratedColumn<String> officalCode = GeneratedColumn<String>(
    'offical_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _signedDateMeta = const VerificationMeta(
    'signedDate',
  );
  late final GeneratedColumn<String> signedDate = GeneratedColumn<String>(
    'signed_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  late final GeneratedColumn<int> roleId = GeneratedColumn<int>(
    'role_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES document_role(id)',
  );
  static const VerificationMeta _contentIdMeta = const VerificationMeta(
    'contentId',
  );
  late final GeneratedColumn<int> contentId = GeneratedColumn<int>(
    'content_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _archiveIdMeta = const VerificationMeta(
    'archiveId',
  );
  late final GeneratedColumn<String> archiveId = GeneratedColumn<String>(
    'archive_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    officalCode,
    signedDate,
    roleId,
    contentId,
    archiveId,
    createdTime,
    updatedTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('offical_code')) {
      context.handle(
        _officalCodeMeta,
        officalCode.isAcceptableOrUnknown(
          data['offical_code']!,
          _officalCodeMeta,
        ),
      );
    }
    if (data.containsKey('signed_date')) {
      context.handle(
        _signedDateMeta,
        signedDate.isAcceptableOrUnknown(data['signed_date']!, _signedDateMeta),
      );
    }
    if (data.containsKey('role_id')) {
      context.handle(
        _roleIdMeta,
        roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    if (data.containsKey('content_id')) {
      context.handle(
        _contentIdMeta,
        contentId.isAcceptableOrUnknown(data['content_id']!, _contentIdMeta),
      );
    }
    if (data.containsKey('archive_id')) {
      context.handle(
        _archiveIdMeta,
        archiveId.isAcceptableOrUnknown(data['archive_id']!, _archiveIdMeta),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      officalCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}offical_code'],
      ),
      signedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signed_date'],
      ),
      roleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_id'],
      )!,
      contentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}content_id'],
      ),
      archiveId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archive_id'],
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      )!,
    );
  }

  @override
  Document createAlias(String alias) {
    return Document(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DocumentData extends DataClass implements Insertable<DocumentData> {
  final int id;
  final String title;
  final String? officalCode;
  final String? signedDate;
  final int roleId;

  /// Content & archive
  final int? contentId;
  final String? archiveId;

  /// auto field
  final DateTime createdTime;
  final DateTime updatedTime;
  const DocumentData({
    required this.id,
    required this.title,
    this.officalCode,
    this.signedDate,
    required this.roleId,
    this.contentId,
    this.archiveId,
    required this.createdTime,
    required this.updatedTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || officalCode != null) {
      map['offical_code'] = Variable<String>(officalCode);
    }
    if (!nullToAbsent || signedDate != null) {
      map['signed_date'] = Variable<String>(signedDate);
    }
    map['role_id'] = Variable<int>(roleId);
    if (!nullToAbsent || contentId != null) {
      map['content_id'] = Variable<int>(contentId);
    }
    if (!nullToAbsent || archiveId != null) {
      map['archive_id'] = Variable<String>(archiveId);
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    map['updated_time'] = Variable<DateTime>(updatedTime);
    return map;
  }

  DocumentCompanion toCompanion(bool nullToAbsent) {
    return DocumentCompanion(
      id: Value(id),
      title: Value(title),
      officalCode: officalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(officalCode),
      signedDate: signedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(signedDate),
      roleId: Value(roleId),
      contentId: contentId == null && nullToAbsent
          ? const Value.absent()
          : Value(contentId),
      archiveId: archiveId == null && nullToAbsent
          ? const Value.absent()
          : Value(archiveId),
      createdTime: Value(createdTime),
      updatedTime: Value(updatedTime),
    );
  }

  factory DocumentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      officalCode: serializer.fromJson<String?>(json['offical_code']),
      signedDate: serializer.fromJson<String?>(json['signed_date']),
      roleId: serializer.fromJson<int>(json['role_id']),
      contentId: serializer.fromJson<int?>(json['content_id']),
      archiveId: serializer.fromJson<String?>(json['archive_id']),
      createdTime: serializer.fromJson<DateTime>(json['created_time']),
      updatedTime: serializer.fromJson<DateTime>(json['updated_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'offical_code': serializer.toJson<String?>(officalCode),
      'signed_date': serializer.toJson<String?>(signedDate),
      'role_id': serializer.toJson<int>(roleId),
      'content_id': serializer.toJson<int?>(contentId),
      'archive_id': serializer.toJson<String?>(archiveId),
      'created_time': serializer.toJson<DateTime>(createdTime),
      'updated_time': serializer.toJson<DateTime>(updatedTime),
    };
  }

  DocumentData copyWith({
    int? id,
    String? title,
    Value<String?> officalCode = const Value.absent(),
    Value<String?> signedDate = const Value.absent(),
    int? roleId,
    Value<int?> contentId = const Value.absent(),
    Value<String?> archiveId = const Value.absent(),
    DateTime? createdTime,
    DateTime? updatedTime,
  }) => DocumentData(
    id: id ?? this.id,
    title: title ?? this.title,
    officalCode: officalCode.present ? officalCode.value : this.officalCode,
    signedDate: signedDate.present ? signedDate.value : this.signedDate,
    roleId: roleId ?? this.roleId,
    contentId: contentId.present ? contentId.value : this.contentId,
    archiveId: archiveId.present ? archiveId.value : this.archiveId,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime ?? this.updatedTime,
  );
  DocumentData copyWithCompanion(DocumentCompanion data) {
    return DocumentData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      officalCode: data.officalCode.present
          ? data.officalCode.value
          : this.officalCode,
      signedDate: data.signedDate.present
          ? data.signedDate.value
          : this.signedDate,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
      contentId: data.contentId.present ? data.contentId.value : this.contentId,
      archiveId: data.archiveId.present ? data.archiveId.value : this.archiveId,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('officalCode: $officalCode, ')
          ..write('signedDate: $signedDate, ')
          ..write('roleId: $roleId, ')
          ..write('contentId: $contentId, ')
          ..write('archiveId: $archiveId, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    officalCode,
    signedDate,
    roleId,
    contentId,
    archiveId,
    createdTime,
    updatedTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentData &&
          other.id == this.id &&
          other.title == this.title &&
          other.officalCode == this.officalCode &&
          other.signedDate == this.signedDate &&
          other.roleId == this.roleId &&
          other.contentId == this.contentId &&
          other.archiveId == this.archiveId &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime);
}

class DocumentCompanion extends UpdateCompanion<DocumentData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> officalCode;
  final Value<String?> signedDate;
  final Value<int> roleId;
  final Value<int?> contentId;
  final Value<String?> archiveId;
  final Value<DateTime> createdTime;
  final Value<DateTime> updatedTime;
  const DocumentCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.officalCode = const Value.absent(),
    this.signedDate = const Value.absent(),
    this.roleId = const Value.absent(),
    this.contentId = const Value.absent(),
    this.archiveId = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
  });
  DocumentCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.officalCode = const Value.absent(),
    this.signedDate = const Value.absent(),
    required int roleId,
    this.contentId = const Value.absent(),
    this.archiveId = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
  }) : title = Value(title),
       roleId = Value(roleId);
  static Insertable<DocumentData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? officalCode,
    Expression<String>? signedDate,
    Expression<int>? roleId,
    Expression<int>? contentId,
    Expression<String>? archiveId,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (officalCode != null) 'offical_code': officalCode,
      if (signedDate != null) 'signed_date': signedDate,
      if (roleId != null) 'role_id': roleId,
      if (contentId != null) 'content_id': contentId,
      if (archiveId != null) 'archive_id': archiveId,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
    });
  }

  DocumentCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? officalCode,
    Value<String?>? signedDate,
    Value<int>? roleId,
    Value<int?>? contentId,
    Value<String?>? archiveId,
    Value<DateTime>? createdTime,
    Value<DateTime>? updatedTime,
  }) {
    return DocumentCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      officalCode: officalCode ?? this.officalCode,
      signedDate: signedDate ?? this.signedDate,
      roleId: roleId ?? this.roleId,
      contentId: contentId ?? this.contentId,
      archiveId: archiveId ?? this.archiveId,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (officalCode.present) {
      map['offical_code'] = Variable<String>(officalCode.value);
    }
    if (signedDate.present) {
      map['signed_date'] = Variable<String>(signedDate.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    if (contentId.present) {
      map['content_id'] = Variable<int>(contentId.value);
    }
    if (archiveId.present) {
      map['archive_id'] = Variable<String>(archiveId.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('officalCode: $officalCode, ')
          ..write('signedDate: $signedDate, ')
          ..write('roleId: $roleId, ')
          ..write('contentId: $contentId, ')
          ..write('archiveId: $archiveId, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime')
          ..write(')'))
        .toString();
  }
}

class Cohort extends Table with TableInfo<Cohort, CohortData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Cohort(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _groupUrlMeta = const VerificationMeta(
    'groupUrl',
  );
  late final GeneratedColumn<String> groupUrl = GeneratedColumn<String>(
    'group_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT ()',
    defaultValue: const CustomExpression(''),
  );
  @override
  List<GeneratedColumn> get $columns => [id, groupUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cohort';
  @override
  VerificationContext validateIntegrity(
    Insertable<CohortData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('group_url')) {
      context.handle(
        _groupUrlMeta,
        groupUrl.isAcceptableOrUnknown(data['group_url']!, _groupUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CohortData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CohortData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      groupUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_url'],
      )!,
    );
  }

  @override
  Cohort createAlias(String alias) {
    return Cohort(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CohortData extends DataClass implements Insertable<CohortData> {
  final String id;
  final String groupUrl;
  const CohortData({required this.id, required this.groupUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['group_url'] = Variable<String>(groupUrl);
    return map;
  }

  CohortCompanion toCompanion(bool nullToAbsent) {
    return CohortCompanion(id: Value(id), groupUrl: Value(groupUrl));
  }

  factory CohortData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CohortData(
      id: serializer.fromJson<String>(json['id']),
      groupUrl: serializer.fromJson<String>(json['group_url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'group_url': serializer.toJson<String>(groupUrl),
    };
  }

  CohortData copyWith({String? id, String? groupUrl}) =>
      CohortData(id: id ?? this.id, groupUrl: groupUrl ?? this.groupUrl);
  CohortData copyWithCompanion(CohortCompanion data) {
    return CohortData(
      id: data.id.present ? data.id.value : this.id,
      groupUrl: data.groupUrl.present ? data.groupUrl.value : this.groupUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CohortData(')
          ..write('id: $id, ')
          ..write('groupUrl: $groupUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, groupUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CohortData &&
          other.id == this.id &&
          other.groupUrl == this.groupUrl);
}

class CohortCompanion extends UpdateCompanion<CohortData> {
  final Value<String> id;
  final Value<String> groupUrl;
  final Value<int> rowid;
  const CohortCompanion({
    this.id = const Value.absent(),
    this.groupUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CohortCompanion.insert({
    required String id,
    this.groupUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<CohortData> custom({
    Expression<String>? id,
    Expression<String>? groupUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupUrl != null) 'group_url': groupUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CohortCompanion copyWith({
    Value<String>? id,
    Value<String>? groupUrl,
    Value<int>? rowid,
  }) {
    return CohortCompanion(
      id: id ?? this.id,
      groupUrl: groupUrl ?? this.groupUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (groupUrl.present) {
      map['group_url'] = Variable<String>(groupUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CohortCompanion(')
          ..write('id: $id, ')
          ..write('groupUrl: $groupUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class AdmissionCouncil extends Table
    with TableInfo<AdmissionCouncil, AdmissionCouncilData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AdmissionCouncil(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _presidentIdMeta = const VerificationMeta(
    'presidentId',
  );
  late final GeneratedColumn<int> presidentId = GeneratedColumn<int>(
    'president_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES teacher(id)',
  );
  static const VerificationMeta _secretaryIdMeta = const VerificationMeta(
    'secretaryId',
  );
  late final GeneratedColumn<int> secretaryId = GeneratedColumn<int>(
    'secretary_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES teacher(id)',
  );
  static const VerificationMeta _member1IdMeta = const VerificationMeta(
    'member1Id',
  );
  late final GeneratedColumn<int> member1Id = GeneratedColumn<int>(
    'member_1_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES teacher(id)',
  );
  static const VerificationMeta _member2IdMeta = const VerificationMeta(
    'member2Id',
  );
  late final GeneratedColumn<int> member2Id = GeneratedColumn<int>(
    'member_2_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES teacher(id)',
  );
  static const VerificationMeta _member3IdMeta = const VerificationMeta(
    'member3Id',
  );
  late final GeneratedColumn<int> member3Id = GeneratedColumn<int>(
    'member_3_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES teacher(id)',
  );
  static const VerificationMeta _establishmentDecisionIdMeta =
      const VerificationMeta('establishmentDecisionId');
  late final GeneratedColumn<String> establishmentDecisionId =
      GeneratedColumn<String>(
        'establishment_decision_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const VerificationMeta _establishmentDecisionDateMeta =
      const VerificationMeta('establishmentDecisionDate');
  late final GeneratedColumn<DateTime> establishmentDecisionDate =
      GeneratedColumn<DateTime>(
        'establishment_decision_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    year,
    presidentId,
    secretaryId,
    member1Id,
    member2Id,
    member3Id,
    establishmentDecisionId,
    establishmentDecisionDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'admission_council';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdmissionCouncilData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('president_id')) {
      context.handle(
        _presidentIdMeta,
        presidentId.isAcceptableOrUnknown(
          data['president_id']!,
          _presidentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_presidentIdMeta);
    }
    if (data.containsKey('secretary_id')) {
      context.handle(
        _secretaryIdMeta,
        secretaryId.isAcceptableOrUnknown(
          data['secretary_id']!,
          _secretaryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_secretaryIdMeta);
    }
    if (data.containsKey('member_1_id')) {
      context.handle(
        _member1IdMeta,
        member1Id.isAcceptableOrUnknown(data['member_1_id']!, _member1IdMeta),
      );
    } else if (isInserting) {
      context.missing(_member1IdMeta);
    }
    if (data.containsKey('member_2_id')) {
      context.handle(
        _member2IdMeta,
        member2Id.isAcceptableOrUnknown(data['member_2_id']!, _member2IdMeta),
      );
    } else if (isInserting) {
      context.missing(_member2IdMeta);
    }
    if (data.containsKey('member_3_id')) {
      context.handle(
        _member3IdMeta,
        member3Id.isAcceptableOrUnknown(data['member_3_id']!, _member3IdMeta),
      );
    } else if (isInserting) {
      context.missing(_member3IdMeta);
    }
    if (data.containsKey('establishment_decision_id')) {
      context.handle(
        _establishmentDecisionIdMeta,
        establishmentDecisionId.isAcceptableOrUnknown(
          data['establishment_decision_id']!,
          _establishmentDecisionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_establishmentDecisionIdMeta);
    }
    if (data.containsKey('establishment_decision_date')) {
      context.handle(
        _establishmentDecisionDateMeta,
        establishmentDecisionDate.isAcceptableOrUnknown(
          data['establishment_decision_date']!,
          _establishmentDecisionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_establishmentDecisionDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdmissionCouncilData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdmissionCouncilData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}year'],
      )!,
      presidentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}president_id'],
      )!,
      secretaryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}secretary_id'],
      )!,
      member1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}member_1_id'],
      )!,
      member2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}member_2_id'],
      )!,
      member3Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}member_3_id'],
      )!,
      establishmentDecisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}establishment_decision_id'],
      )!,
      establishmentDecisionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}establishment_decision_date'],
      )!,
    );
  }

  @override
  AdmissionCouncil createAlias(String alias) {
    return AdmissionCouncil(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AdmissionCouncilData extends DataClass
    implements Insertable<AdmissionCouncilData> {
  final int id;
  final String year;
  final int presidentId;
  final int secretaryId;
  final int member1Id;
  final int member2Id;
  final int member3Id;
  final String establishmentDecisionId;
  final DateTime establishmentDecisionDate;
  const AdmissionCouncilData({
    required this.id,
    required this.year,
    required this.presidentId,
    required this.secretaryId,
    required this.member1Id,
    required this.member2Id,
    required this.member3Id,
    required this.establishmentDecisionId,
    required this.establishmentDecisionDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['year'] = Variable<String>(year);
    map['president_id'] = Variable<int>(presidentId);
    map['secretary_id'] = Variable<int>(secretaryId);
    map['member_1_id'] = Variable<int>(member1Id);
    map['member_2_id'] = Variable<int>(member2Id);
    map['member_3_id'] = Variable<int>(member3Id);
    map['establishment_decision_id'] = Variable<String>(
      establishmentDecisionId,
    );
    map['establishment_decision_date'] = Variable<DateTime>(
      establishmentDecisionDate,
    );
    return map;
  }

  AdmissionCouncilCompanion toCompanion(bool nullToAbsent) {
    return AdmissionCouncilCompanion(
      id: Value(id),
      year: Value(year),
      presidentId: Value(presidentId),
      secretaryId: Value(secretaryId),
      member1Id: Value(member1Id),
      member2Id: Value(member2Id),
      member3Id: Value(member3Id),
      establishmentDecisionId: Value(establishmentDecisionId),
      establishmentDecisionDate: Value(establishmentDecisionDate),
    );
  }

  factory AdmissionCouncilData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdmissionCouncilData(
      id: serializer.fromJson<int>(json['id']),
      year: serializer.fromJson<String>(json['year']),
      presidentId: serializer.fromJson<int>(json['president_id']),
      secretaryId: serializer.fromJson<int>(json['secretary_id']),
      member1Id: serializer.fromJson<int>(json['member_1_id']),
      member2Id: serializer.fromJson<int>(json['member_2_id']),
      member3Id: serializer.fromJson<int>(json['member_3_id']),
      establishmentDecisionId: serializer.fromJson<String>(
        json['establishment_decision_id'],
      ),
      establishmentDecisionDate: serializer.fromJson<DateTime>(
        json['establishment_decision_date'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'year': serializer.toJson<String>(year),
      'president_id': serializer.toJson<int>(presidentId),
      'secretary_id': serializer.toJson<int>(secretaryId),
      'member_1_id': serializer.toJson<int>(member1Id),
      'member_2_id': serializer.toJson<int>(member2Id),
      'member_3_id': serializer.toJson<int>(member3Id),
      'establishment_decision_id': serializer.toJson<String>(
        establishmentDecisionId,
      ),
      'establishment_decision_date': serializer.toJson<DateTime>(
        establishmentDecisionDate,
      ),
    };
  }

  AdmissionCouncilData copyWith({
    int? id,
    String? year,
    int? presidentId,
    int? secretaryId,
    int? member1Id,
    int? member2Id,
    int? member3Id,
    String? establishmentDecisionId,
    DateTime? establishmentDecisionDate,
  }) => AdmissionCouncilData(
    id: id ?? this.id,
    year: year ?? this.year,
    presidentId: presidentId ?? this.presidentId,
    secretaryId: secretaryId ?? this.secretaryId,
    member1Id: member1Id ?? this.member1Id,
    member2Id: member2Id ?? this.member2Id,
    member3Id: member3Id ?? this.member3Id,
    establishmentDecisionId:
        establishmentDecisionId ?? this.establishmentDecisionId,
    establishmentDecisionDate:
        establishmentDecisionDate ?? this.establishmentDecisionDate,
  );
  AdmissionCouncilData copyWithCompanion(AdmissionCouncilCompanion data) {
    return AdmissionCouncilData(
      id: data.id.present ? data.id.value : this.id,
      year: data.year.present ? data.year.value : this.year,
      presidentId: data.presidentId.present
          ? data.presidentId.value
          : this.presidentId,
      secretaryId: data.secretaryId.present
          ? data.secretaryId.value
          : this.secretaryId,
      member1Id: data.member1Id.present ? data.member1Id.value : this.member1Id,
      member2Id: data.member2Id.present ? data.member2Id.value : this.member2Id,
      member3Id: data.member3Id.present ? data.member3Id.value : this.member3Id,
      establishmentDecisionId: data.establishmentDecisionId.present
          ? data.establishmentDecisionId.value
          : this.establishmentDecisionId,
      establishmentDecisionDate: data.establishmentDecisionDate.present
          ? data.establishmentDecisionDate.value
          : this.establishmentDecisionDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdmissionCouncilData(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('presidentId: $presidentId, ')
          ..write('secretaryId: $secretaryId, ')
          ..write('member1Id: $member1Id, ')
          ..write('member2Id: $member2Id, ')
          ..write('member3Id: $member3Id, ')
          ..write('establishmentDecisionId: $establishmentDecisionId, ')
          ..write('establishmentDecisionDate: $establishmentDecisionDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    year,
    presidentId,
    secretaryId,
    member1Id,
    member2Id,
    member3Id,
    establishmentDecisionId,
    establishmentDecisionDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdmissionCouncilData &&
          other.id == this.id &&
          other.year == this.year &&
          other.presidentId == this.presidentId &&
          other.secretaryId == this.secretaryId &&
          other.member1Id == this.member1Id &&
          other.member2Id == this.member2Id &&
          other.member3Id == this.member3Id &&
          other.establishmentDecisionId == this.establishmentDecisionId &&
          other.establishmentDecisionDate == this.establishmentDecisionDate);
}

class AdmissionCouncilCompanion extends UpdateCompanion<AdmissionCouncilData> {
  final Value<int> id;
  final Value<String> year;
  final Value<int> presidentId;
  final Value<int> secretaryId;
  final Value<int> member1Id;
  final Value<int> member2Id;
  final Value<int> member3Id;
  final Value<String> establishmentDecisionId;
  final Value<DateTime> establishmentDecisionDate;
  const AdmissionCouncilCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.presidentId = const Value.absent(),
    this.secretaryId = const Value.absent(),
    this.member1Id = const Value.absent(),
    this.member2Id = const Value.absent(),
    this.member3Id = const Value.absent(),
    this.establishmentDecisionId = const Value.absent(),
    this.establishmentDecisionDate = const Value.absent(),
  });
  AdmissionCouncilCompanion.insert({
    this.id = const Value.absent(),
    required String year,
    required int presidentId,
    required int secretaryId,
    required int member1Id,
    required int member2Id,
    required int member3Id,
    required String establishmentDecisionId,
    required DateTime establishmentDecisionDate,
  }) : year = Value(year),
       presidentId = Value(presidentId),
       secretaryId = Value(secretaryId),
       member1Id = Value(member1Id),
       member2Id = Value(member2Id),
       member3Id = Value(member3Id),
       establishmentDecisionId = Value(establishmentDecisionId),
       establishmentDecisionDate = Value(establishmentDecisionDate);
  static Insertable<AdmissionCouncilData> custom({
    Expression<int>? id,
    Expression<String>? year,
    Expression<int>? presidentId,
    Expression<int>? secretaryId,
    Expression<int>? member1Id,
    Expression<int>? member2Id,
    Expression<int>? member3Id,
    Expression<String>? establishmentDecisionId,
    Expression<DateTime>? establishmentDecisionDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (presidentId != null) 'president_id': presidentId,
      if (secretaryId != null) 'secretary_id': secretaryId,
      if (member1Id != null) 'member_1_id': member1Id,
      if (member2Id != null) 'member_2_id': member2Id,
      if (member3Id != null) 'member_3_id': member3Id,
      if (establishmentDecisionId != null)
        'establishment_decision_id': establishmentDecisionId,
      if (establishmentDecisionDate != null)
        'establishment_decision_date': establishmentDecisionDate,
    });
  }

  AdmissionCouncilCompanion copyWith({
    Value<int>? id,
    Value<String>? year,
    Value<int>? presidentId,
    Value<int>? secretaryId,
    Value<int>? member1Id,
    Value<int>? member2Id,
    Value<int>? member3Id,
    Value<String>? establishmentDecisionId,
    Value<DateTime>? establishmentDecisionDate,
  }) {
    return AdmissionCouncilCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      presidentId: presidentId ?? this.presidentId,
      secretaryId: secretaryId ?? this.secretaryId,
      member1Id: member1Id ?? this.member1Id,
      member2Id: member2Id ?? this.member2Id,
      member3Id: member3Id ?? this.member3Id,
      establishmentDecisionId:
          establishmentDecisionId ?? this.establishmentDecisionId,
      establishmentDecisionDate:
          establishmentDecisionDate ?? this.establishmentDecisionDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (year.present) {
      map['year'] = Variable<String>(year.value);
    }
    if (presidentId.present) {
      map['president_id'] = Variable<int>(presidentId.value);
    }
    if (secretaryId.present) {
      map['secretary_id'] = Variable<int>(secretaryId.value);
    }
    if (member1Id.present) {
      map['member_1_id'] = Variable<int>(member1Id.value);
    }
    if (member2Id.present) {
      map['member_2_id'] = Variable<int>(member2Id.value);
    }
    if (member3Id.present) {
      map['member_3_id'] = Variable<int>(member3Id.value);
    }
    if (establishmentDecisionId.present) {
      map['establishment_decision_id'] = Variable<String>(
        establishmentDecisionId.value,
      );
    }
    if (establishmentDecisionDate.present) {
      map['establishment_decision_date'] = Variable<DateTime>(
        establishmentDecisionDate.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdmissionCouncilCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('presidentId: $presidentId, ')
          ..write('secretaryId: $secretaryId, ')
          ..write('member1Id: $member1Id, ')
          ..write('member2Id: $member2Id, ')
          ..write('member3Id: $member3Id, ')
          ..write('establishmentDecisionId: $establishmentDecisionId, ')
          ..write('establishmentDecisionDate: $establishmentDecisionDate')
          ..write(')'))
        .toString();
  }
}

class Student extends Table with TableInfo<Student, StudentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Student(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _admissionIdMeta = const VerificationMeta(
    'admissionId',
  );
  late final GeneratedColumn<String> admissionId = GeneratedColumn<String>(
    'soHoSo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _cohortMeta = const VerificationMeta('cohort');
  late final GeneratedColumn<String> cohort = GeneratedColumn<String>(
    'nienKhoa',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'maHocVien',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'hoTen',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'ngaySinh',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumnWithTypeConverter<enums.Gender?, String> gender =
      GeneratedColumn<String>(
        'gioiTinh',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      ).withConverter<enums.Gender?>(Student.$convertergendern);
  static const VerificationMeta _placeOfBirthMeta = const VerificationMeta(
    'placeOfBirth',
  );
  late final GeneratedColumn<String> placeOfBirth = GeneratedColumn<String>(
    'noiSinh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'dienThoai',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _personalEmailMeta = const VerificationMeta(
    'personalEmail',
  );
  late final GeneratedColumn<String> personalEmail = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _schoolEmailMeta = const VerificationMeta(
    'schoolEmail',
  );
  late final GeneratedColumn<String> schoolEmail = GeneratedColumn<String>(
    'emailHust',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _bachelorUniversityMeta =
      const VerificationMeta('bachelorUniversity');
  late final GeneratedColumn<String> bachelorUniversity =
      GeneratedColumn<String>(
        'truongTotNghiepDaiHoc',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const VerificationMeta _bachelorMajorMeta = const VerificationMeta(
    'bachelorMajor',
  );
  late final GeneratedColumn<String> bachelorMajor = GeneratedColumn<String>(
    'nganhTotNghiepDaiHoc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _bachelorProgramMeta = const VerificationMeta(
    'bachelorProgram',
  );
  late final GeneratedColumn<String> bachelorProgram = GeneratedColumn<String>(
    'heTotNghiepDaiHoc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _bachelorGraduationRankMeta =
      const VerificationMeta('bachelorGraduationRank');
  late final GeneratedColumn<String> bachelorGraduationRank =
      GeneratedColumn<String>(
        'xepLoaiTotNghiepDaiHoc',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const VerificationMeta _bachelorGraduationDateMeta =
      const VerificationMeta('bachelorGraduationDate');
  late final GeneratedColumn<DateTime> bachelorGraduationDate =
      GeneratedColumn<DateTime>(
        'ngayTotNghiepDaiHoc',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const VerificationMeta _intendedSpecializationMeta =
      const VerificationMeta('intendedSpecialization');
  late final GeneratedColumn<String> intendedSpecialization =
      GeneratedColumn<String>(
        'dinhHuongChuyenSau',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const VerificationMeta _exemptedCoursesMeta = const VerificationMeta(
    'exemptedCourses',
  );
  late final GeneratedColumn<String> exemptedCourses = GeneratedColumn<String>(
    'hocPhanDuocMien',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _masterMajorMeta = const VerificationMeta(
    'masterMajor',
  );
  late final GeneratedColumn<String> masterMajor = GeneratedColumn<String>(
    'nganhDaoTaoThacSi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumnWithTypeConverter<enums.StudentStatus?, String>
  status = GeneratedColumn<String>(
    'maTrangThai',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<enums.StudentStatus?>(Student.$converterstatusn);
  static const VerificationMeta _hasHirstExtensionMeta = const VerificationMeta(
    'hasHirstExtension',
  );
  late final GeneratedColumn<bool> hasHirstExtension = GeneratedColumn<bool>(
    'flag_extend_1',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _hasSecondExtensionMeta =
      const VerificationMeta('hasSecondExtension');
  late final GeneratedColumn<bool> hasSecondExtension = GeneratedColumn<bool>(
    'flag_extend_2',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _admissionCouncilIdMeta =
      const VerificationMeta('admissionCouncilId');
  late final GeneratedColumn<int> admissionCouncilId = GeneratedColumn<int>(
    'idTieuBanXetTuyen',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumnWithTypeConverter<enums.AdmissionType?, String>
  admissionType = GeneratedColumn<String>(
    'idDienTuyenSinh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<enums.AdmissionType?>(Student.$converteradmissionTypen);
  static const VerificationMeta _isAdmissionPaidMeta = const VerificationMeta(
    'isAdmissionPaid',
  );
  late final GeneratedColumn<bool> isAdmissionPaid = GeneratedColumn<bool>(
    'thanhToanXetTuyen',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    admissionId,
    cohort,
    studentId,
    name,
    dateOfBirth,
    gender,
    placeOfBirth,
    phone,
    personalEmail,
    schoolEmail,
    bachelorUniversity,
    bachelorMajor,
    bachelorProgram,
    bachelorGraduationRank,
    bachelorGraduationDate,
    intendedSpecialization,
    exemptedCourses,
    masterMajor,
    status,
    hasHirstExtension,
    hasSecondExtension,
    admissionCouncilId,
    admissionType,
    isAdmissionPaid,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('soHoSo')) {
      context.handle(
        _admissionIdMeta,
        admissionId.isAcceptableOrUnknown(data['soHoSo']!, _admissionIdMeta),
      );
    }
    if (data.containsKey('nienKhoa')) {
      context.handle(
        _cohortMeta,
        cohort.isAcceptableOrUnknown(data['nienKhoa']!, _cohortMeta),
      );
    }
    if (data.containsKey('maHocVien')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['maHocVien']!, _studentIdMeta),
      );
    }
    if (data.containsKey('hoTen')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['hoTen']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ngaySinh')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(data['ngaySinh']!, _dateOfBirthMeta),
      );
    }
    if (data.containsKey('noiSinh')) {
      context.handle(
        _placeOfBirthMeta,
        placeOfBirth.isAcceptableOrUnknown(data['noiSinh']!, _placeOfBirthMeta),
      );
    }
    if (data.containsKey('dienThoai')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['dienThoai']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _personalEmailMeta,
        personalEmail.isAcceptableOrUnknown(data['email']!, _personalEmailMeta),
      );
    }
    if (data.containsKey('emailHust')) {
      context.handle(
        _schoolEmailMeta,
        schoolEmail.isAcceptableOrUnknown(data['emailHust']!, _schoolEmailMeta),
      );
    }
    if (data.containsKey('truongTotNghiepDaiHoc')) {
      context.handle(
        _bachelorUniversityMeta,
        bachelorUniversity.isAcceptableOrUnknown(
          data['truongTotNghiepDaiHoc']!,
          _bachelorUniversityMeta,
        ),
      );
    }
    if (data.containsKey('nganhTotNghiepDaiHoc')) {
      context.handle(
        _bachelorMajorMeta,
        bachelorMajor.isAcceptableOrUnknown(
          data['nganhTotNghiepDaiHoc']!,
          _bachelorMajorMeta,
        ),
      );
    }
    if (data.containsKey('heTotNghiepDaiHoc')) {
      context.handle(
        _bachelorProgramMeta,
        bachelorProgram.isAcceptableOrUnknown(
          data['heTotNghiepDaiHoc']!,
          _bachelorProgramMeta,
        ),
      );
    }
    if (data.containsKey('xepLoaiTotNghiepDaiHoc')) {
      context.handle(
        _bachelorGraduationRankMeta,
        bachelorGraduationRank.isAcceptableOrUnknown(
          data['xepLoaiTotNghiepDaiHoc']!,
          _bachelorGraduationRankMeta,
        ),
      );
    }
    if (data.containsKey('ngayTotNghiepDaiHoc')) {
      context.handle(
        _bachelorGraduationDateMeta,
        bachelorGraduationDate.isAcceptableOrUnknown(
          data['ngayTotNghiepDaiHoc']!,
          _bachelorGraduationDateMeta,
        ),
      );
    }
    if (data.containsKey('dinhHuongChuyenSau')) {
      context.handle(
        _intendedSpecializationMeta,
        intendedSpecialization.isAcceptableOrUnknown(
          data['dinhHuongChuyenSau']!,
          _intendedSpecializationMeta,
        ),
      );
    }
    if (data.containsKey('hocPhanDuocMien')) {
      context.handle(
        _exemptedCoursesMeta,
        exemptedCourses.isAcceptableOrUnknown(
          data['hocPhanDuocMien']!,
          _exemptedCoursesMeta,
        ),
      );
    }
    if (data.containsKey('nganhDaoTaoThacSi')) {
      context.handle(
        _masterMajorMeta,
        masterMajor.isAcceptableOrUnknown(
          data['nganhDaoTaoThacSi']!,
          _masterMajorMeta,
        ),
      );
    }
    if (data.containsKey('flag_extend_1')) {
      context.handle(
        _hasHirstExtensionMeta,
        hasHirstExtension.isAcceptableOrUnknown(
          data['flag_extend_1']!,
          _hasHirstExtensionMeta,
        ),
      );
    }
    if (data.containsKey('flag_extend_2')) {
      context.handle(
        _hasSecondExtensionMeta,
        hasSecondExtension.isAcceptableOrUnknown(
          data['flag_extend_2']!,
          _hasSecondExtensionMeta,
        ),
      );
    }
    if (data.containsKey('idTieuBanXetTuyen')) {
      context.handle(
        _admissionCouncilIdMeta,
        admissionCouncilId.isAcceptableOrUnknown(
          data['idTieuBanXetTuyen']!,
          _admissionCouncilIdMeta,
        ),
      );
    }
    if (data.containsKey('thanhToanXetTuyen')) {
      context.handle(
        _isAdmissionPaidMeta,
        isAdmissionPaid.isAcceptableOrUnknown(
          data['thanhToanXetTuyen']!,
          _isAdmissionPaidMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      admissionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}soHoSo'],
      ),
      cohort: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nienKhoa'],
      ),
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}maHocVien'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hoTen'],
      )!,
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ngaySinh'],
      ),
      gender: Student.$convertergendern.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gioiTinh'],
        ),
      ),
      placeOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}noiSinh'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dienThoai'],
      ),
      personalEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      schoolEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emailHust'],
      ),
      bachelorUniversity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}truongTotNghiepDaiHoc'],
      ),
      bachelorMajor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nganhTotNghiepDaiHoc'],
      ),
      bachelorProgram: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}heTotNghiepDaiHoc'],
      ),
      bachelorGraduationRank: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}xepLoaiTotNghiepDaiHoc'],
      ),
      bachelorGraduationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ngayTotNghiepDaiHoc'],
      ),
      intendedSpecialization: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dinhHuongChuyenSau'],
      ),
      exemptedCourses: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hocPhanDuocMien'],
      ),
      masterMajor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nganhDaoTaoThacSi'],
      ),
      status: Student.$converterstatusn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}maTrangThai'],
        ),
      ),
      hasHirstExtension: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}flag_extend_1'],
      )!,
      hasSecondExtension: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}flag_extend_2'],
      )!,
      admissionCouncilId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idTieuBanXetTuyen'],
      ),
      admissionType: Student.$converteradmissionTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}idDienTuyenSinh'],
        ),
      ),
      isAdmissionPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}thanhToanXetTuyen'],
      )!,
    );
  }

  @override
  Student createAlias(String alias) {
    return Student(attachedDatabase, alias);
  }

  static TypeConverter<enums.Gender, String> $convertergender =
      const enums.GenderConverter();
  static TypeConverter<enums.Gender?, String?> $convertergendern =
      NullAwareTypeConverter.wrap($convertergender);
  static TypeConverter<enums.StudentStatus, String> $converterstatus =
      const enums.StudentStatusConverter();
  static TypeConverter<enums.StudentStatus?, String?> $converterstatusn =
      NullAwareTypeConverter.wrap($converterstatus);
  static TypeConverter<enums.AdmissionType, String> $converteradmissionType =
      const enums.AdmissionTypeConverter();
  static TypeConverter<enums.AdmissionType?, String?> $converteradmissionTypen =
      NullAwareTypeConverter.wrap($converteradmissionType);
  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(idTieuBanXetTuyen)REFERENCES admission_council(id)',
    'FOREIGN KEY(nienKhoa)REFERENCES cohort(id)ON UPDATE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class StudentData extends DataClass implements Insertable<StudentData> {
  final int id;
  final String? admissionId;
  final String? cohort;
  final String? studentId;
  final String name;
  final DateTime? dateOfBirth;
  final enums.Gender? gender;
  final String? placeOfBirth;
  final String? phone;
  final String? personalEmail;
  final String? schoolEmail;
  final String? bachelorUniversity;
  final String? bachelorMajor;
  final String? bachelorProgram;
  final String? bachelorGraduationRank;
  final DateTime? bachelorGraduationDate;
  final String? intendedSpecialization;
  final String? exemptedCourses;
  final String? masterMajor;
  final enums.StudentStatus? status;
  final bool hasHirstExtension;
  final bool hasSecondExtension;
  final int? admissionCouncilId;
  final enums.AdmissionType? admissionType;
  final bool isAdmissionPaid;
  const StudentData({
    required this.id,
    this.admissionId,
    this.cohort,
    this.studentId,
    required this.name,
    this.dateOfBirth,
    this.gender,
    this.placeOfBirth,
    this.phone,
    this.personalEmail,
    this.schoolEmail,
    this.bachelorUniversity,
    this.bachelorMajor,
    this.bachelorProgram,
    this.bachelorGraduationRank,
    this.bachelorGraduationDate,
    this.intendedSpecialization,
    this.exemptedCourses,
    this.masterMajor,
    this.status,
    required this.hasHirstExtension,
    required this.hasSecondExtension,
    this.admissionCouncilId,
    this.admissionType,
    required this.isAdmissionPaid,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || admissionId != null) {
      map['soHoSo'] = Variable<String>(admissionId);
    }
    if (!nullToAbsent || cohort != null) {
      map['nienKhoa'] = Variable<String>(cohort);
    }
    if (!nullToAbsent || studentId != null) {
      map['maHocVien'] = Variable<String>(studentId);
    }
    map['hoTen'] = Variable<String>(name);
    if (!nullToAbsent || dateOfBirth != null) {
      map['ngaySinh'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || gender != null) {
      map['gioiTinh'] = Variable<String>(
        Student.$convertergendern.toSql(gender),
      );
    }
    if (!nullToAbsent || placeOfBirth != null) {
      map['noiSinh'] = Variable<String>(placeOfBirth);
    }
    if (!nullToAbsent || phone != null) {
      map['dienThoai'] = Variable<String>(phone);
    }
    if (!nullToAbsent || personalEmail != null) {
      map['email'] = Variable<String>(personalEmail);
    }
    if (!nullToAbsent || schoolEmail != null) {
      map['emailHust'] = Variable<String>(schoolEmail);
    }
    if (!nullToAbsent || bachelorUniversity != null) {
      map['truongTotNghiepDaiHoc'] = Variable<String>(bachelorUniversity);
    }
    if (!nullToAbsent || bachelorMajor != null) {
      map['nganhTotNghiepDaiHoc'] = Variable<String>(bachelorMajor);
    }
    if (!nullToAbsent || bachelorProgram != null) {
      map['heTotNghiepDaiHoc'] = Variable<String>(bachelorProgram);
    }
    if (!nullToAbsent || bachelorGraduationRank != null) {
      map['xepLoaiTotNghiepDaiHoc'] = Variable<String>(bachelorGraduationRank);
    }
    if (!nullToAbsent || bachelorGraduationDate != null) {
      map['ngayTotNghiepDaiHoc'] = Variable<DateTime>(bachelorGraduationDate);
    }
    if (!nullToAbsent || intendedSpecialization != null) {
      map['dinhHuongChuyenSau'] = Variable<String>(intendedSpecialization);
    }
    if (!nullToAbsent || exemptedCourses != null) {
      map['hocPhanDuocMien'] = Variable<String>(exemptedCourses);
    }
    if (!nullToAbsent || masterMajor != null) {
      map['nganhDaoTaoThacSi'] = Variable<String>(masterMajor);
    }
    if (!nullToAbsent || status != null) {
      map['maTrangThai'] = Variable<String>(
        Student.$converterstatusn.toSql(status),
      );
    }
    map['flag_extend_1'] = Variable<bool>(hasHirstExtension);
    map['flag_extend_2'] = Variable<bool>(hasSecondExtension);
    if (!nullToAbsent || admissionCouncilId != null) {
      map['idTieuBanXetTuyen'] = Variable<int>(admissionCouncilId);
    }
    if (!nullToAbsent || admissionType != null) {
      map['idDienTuyenSinh'] = Variable<String>(
        Student.$converteradmissionTypen.toSql(admissionType),
      );
    }
    map['thanhToanXetTuyen'] = Variable<bool>(isAdmissionPaid);
    return map;
  }

  StudentCompanion toCompanion(bool nullToAbsent) {
    return StudentCompanion(
      id: Value(id),
      admissionId: admissionId == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionId),
      cohort: cohort == null && nullToAbsent
          ? const Value.absent()
          : Value(cohort),
      studentId: studentId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentId),
      name: Value(name),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      placeOfBirth: placeOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(placeOfBirth),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      personalEmail: personalEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(personalEmail),
      schoolEmail: schoolEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(schoolEmail),
      bachelorUniversity: bachelorUniversity == null && nullToAbsent
          ? const Value.absent()
          : Value(bachelorUniversity),
      bachelorMajor: bachelorMajor == null && nullToAbsent
          ? const Value.absent()
          : Value(bachelorMajor),
      bachelorProgram: bachelorProgram == null && nullToAbsent
          ? const Value.absent()
          : Value(bachelorProgram),
      bachelorGraduationRank: bachelorGraduationRank == null && nullToAbsent
          ? const Value.absent()
          : Value(bachelorGraduationRank),
      bachelorGraduationDate: bachelorGraduationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(bachelorGraduationDate),
      intendedSpecialization: intendedSpecialization == null && nullToAbsent
          ? const Value.absent()
          : Value(intendedSpecialization),
      exemptedCourses: exemptedCourses == null && nullToAbsent
          ? const Value.absent()
          : Value(exemptedCourses),
      masterMajor: masterMajor == null && nullToAbsent
          ? const Value.absent()
          : Value(masterMajor),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      hasHirstExtension: Value(hasHirstExtension),
      hasSecondExtension: Value(hasSecondExtension),
      admissionCouncilId: admissionCouncilId == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionCouncilId),
      admissionType: admissionType == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionType),
      isAdmissionPaid: Value(isAdmissionPaid),
    );
  }

  factory StudentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentData(
      id: serializer.fromJson<int>(json['id']),
      admissionId: serializer.fromJson<String?>(json['soHoSo']),
      cohort: serializer.fromJson<String?>(json['nienKhoa']),
      studentId: serializer.fromJson<String?>(json['maHocVien']),
      name: serializer.fromJson<String>(json['hoTen']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['ngaySinh']),
      gender: serializer.fromJson<enums.Gender?>(json['gioiTinh']),
      placeOfBirth: serializer.fromJson<String?>(json['noiSinh']),
      phone: serializer.fromJson<String?>(json['dienThoai']),
      personalEmail: serializer.fromJson<String?>(json['email']),
      schoolEmail: serializer.fromJson<String?>(json['emailHust']),
      bachelorUniversity: serializer.fromJson<String?>(
        json['truongTotNghiepDaiHoc'],
      ),
      bachelorMajor: serializer.fromJson<String?>(json['nganhTotNghiepDaiHoc']),
      bachelorProgram: serializer.fromJson<String?>(json['heTotNghiepDaiHoc']),
      bachelorGraduationRank: serializer.fromJson<String?>(
        json['xepLoaiTotNghiepDaiHoc'],
      ),
      bachelorGraduationDate: serializer.fromJson<DateTime?>(
        json['ngayTotNghiepDaiHoc'],
      ),
      intendedSpecialization: serializer.fromJson<String?>(
        json['dinhHuongChuyenSau'],
      ),
      exemptedCourses: serializer.fromJson<String?>(json['hocPhanDuocMien']),
      masterMajor: serializer.fromJson<String?>(json['nganhDaoTaoThacSi']),
      status: serializer.fromJson<enums.StudentStatus?>(json['maTrangThai']),
      hasHirstExtension: serializer.fromJson<bool>(json['flag_extend_1']),
      hasSecondExtension: serializer.fromJson<bool>(json['flag_extend_2']),
      admissionCouncilId: serializer.fromJson<int?>(json['idTieuBanXetTuyen']),
      admissionType: serializer.fromJson<enums.AdmissionType?>(
        json['idDienTuyenSinh'],
      ),
      isAdmissionPaid: serializer.fromJson<bool>(json['thanhToanXetTuyen']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'soHoSo': serializer.toJson<String?>(admissionId),
      'nienKhoa': serializer.toJson<String?>(cohort),
      'maHocVien': serializer.toJson<String?>(studentId),
      'hoTen': serializer.toJson<String>(name),
      'ngaySinh': serializer.toJson<DateTime?>(dateOfBirth),
      'gioiTinh': serializer.toJson<enums.Gender?>(gender),
      'noiSinh': serializer.toJson<String?>(placeOfBirth),
      'dienThoai': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(personalEmail),
      'emailHust': serializer.toJson<String?>(schoolEmail),
      'truongTotNghiepDaiHoc': serializer.toJson<String?>(bachelorUniversity),
      'nganhTotNghiepDaiHoc': serializer.toJson<String?>(bachelorMajor),
      'heTotNghiepDaiHoc': serializer.toJson<String?>(bachelorProgram),
      'xepLoaiTotNghiepDaiHoc': serializer.toJson<String?>(
        bachelorGraduationRank,
      ),
      'ngayTotNghiepDaiHoc': serializer.toJson<DateTime?>(
        bachelorGraduationDate,
      ),
      'dinhHuongChuyenSau': serializer.toJson<String?>(intendedSpecialization),
      'hocPhanDuocMien': serializer.toJson<String?>(exemptedCourses),
      'nganhDaoTaoThacSi': serializer.toJson<String?>(masterMajor),
      'maTrangThai': serializer.toJson<enums.StudentStatus?>(status),
      'flag_extend_1': serializer.toJson<bool>(hasHirstExtension),
      'flag_extend_2': serializer.toJson<bool>(hasSecondExtension),
      'idTieuBanXetTuyen': serializer.toJson<int?>(admissionCouncilId),
      'idDienTuyenSinh': serializer.toJson<enums.AdmissionType?>(admissionType),
      'thanhToanXetTuyen': serializer.toJson<bool>(isAdmissionPaid),
    };
  }

  StudentData copyWith({
    int? id,
    Value<String?> admissionId = const Value.absent(),
    Value<String?> cohort = const Value.absent(),
    Value<String?> studentId = const Value.absent(),
    String? name,
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<enums.Gender?> gender = const Value.absent(),
    Value<String?> placeOfBirth = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> personalEmail = const Value.absent(),
    Value<String?> schoolEmail = const Value.absent(),
    Value<String?> bachelorUniversity = const Value.absent(),
    Value<String?> bachelorMajor = const Value.absent(),
    Value<String?> bachelorProgram = const Value.absent(),
    Value<String?> bachelorGraduationRank = const Value.absent(),
    Value<DateTime?> bachelorGraduationDate = const Value.absent(),
    Value<String?> intendedSpecialization = const Value.absent(),
    Value<String?> exemptedCourses = const Value.absent(),
    Value<String?> masterMajor = const Value.absent(),
    Value<enums.StudentStatus?> status = const Value.absent(),
    bool? hasHirstExtension,
    bool? hasSecondExtension,
    Value<int?> admissionCouncilId = const Value.absent(),
    Value<enums.AdmissionType?> admissionType = const Value.absent(),
    bool? isAdmissionPaid,
  }) => StudentData(
    id: id ?? this.id,
    admissionId: admissionId.present ? admissionId.value : this.admissionId,
    cohort: cohort.present ? cohort.value : this.cohort,
    studentId: studentId.present ? studentId.value : this.studentId,
    name: name ?? this.name,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    gender: gender.present ? gender.value : this.gender,
    placeOfBirth: placeOfBirth.present ? placeOfBirth.value : this.placeOfBirth,
    phone: phone.present ? phone.value : this.phone,
    personalEmail: personalEmail.present
        ? personalEmail.value
        : this.personalEmail,
    schoolEmail: schoolEmail.present ? schoolEmail.value : this.schoolEmail,
    bachelorUniversity: bachelorUniversity.present
        ? bachelorUniversity.value
        : this.bachelorUniversity,
    bachelorMajor: bachelorMajor.present
        ? bachelorMajor.value
        : this.bachelorMajor,
    bachelorProgram: bachelorProgram.present
        ? bachelorProgram.value
        : this.bachelorProgram,
    bachelorGraduationRank: bachelorGraduationRank.present
        ? bachelorGraduationRank.value
        : this.bachelorGraduationRank,
    bachelorGraduationDate: bachelorGraduationDate.present
        ? bachelorGraduationDate.value
        : this.bachelorGraduationDate,
    intendedSpecialization: intendedSpecialization.present
        ? intendedSpecialization.value
        : this.intendedSpecialization,
    exemptedCourses: exemptedCourses.present
        ? exemptedCourses.value
        : this.exemptedCourses,
    masterMajor: masterMajor.present ? masterMajor.value : this.masterMajor,
    status: status.present ? status.value : this.status,
    hasHirstExtension: hasHirstExtension ?? this.hasHirstExtension,
    hasSecondExtension: hasSecondExtension ?? this.hasSecondExtension,
    admissionCouncilId: admissionCouncilId.present
        ? admissionCouncilId.value
        : this.admissionCouncilId,
    admissionType: admissionType.present
        ? admissionType.value
        : this.admissionType,
    isAdmissionPaid: isAdmissionPaid ?? this.isAdmissionPaid,
  );
  StudentData copyWithCompanion(StudentCompanion data) {
    return StudentData(
      id: data.id.present ? data.id.value : this.id,
      admissionId: data.admissionId.present
          ? data.admissionId.value
          : this.admissionId,
      cohort: data.cohort.present ? data.cohort.value : this.cohort,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      name: data.name.present ? data.name.value : this.name,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      gender: data.gender.present ? data.gender.value : this.gender,
      placeOfBirth: data.placeOfBirth.present
          ? data.placeOfBirth.value
          : this.placeOfBirth,
      phone: data.phone.present ? data.phone.value : this.phone,
      personalEmail: data.personalEmail.present
          ? data.personalEmail.value
          : this.personalEmail,
      schoolEmail: data.schoolEmail.present
          ? data.schoolEmail.value
          : this.schoolEmail,
      bachelorUniversity: data.bachelorUniversity.present
          ? data.bachelorUniversity.value
          : this.bachelorUniversity,
      bachelorMajor: data.bachelorMajor.present
          ? data.bachelorMajor.value
          : this.bachelorMajor,
      bachelorProgram: data.bachelorProgram.present
          ? data.bachelorProgram.value
          : this.bachelorProgram,
      bachelorGraduationRank: data.bachelorGraduationRank.present
          ? data.bachelorGraduationRank.value
          : this.bachelorGraduationRank,
      bachelorGraduationDate: data.bachelorGraduationDate.present
          ? data.bachelorGraduationDate.value
          : this.bachelorGraduationDate,
      intendedSpecialization: data.intendedSpecialization.present
          ? data.intendedSpecialization.value
          : this.intendedSpecialization,
      exemptedCourses: data.exemptedCourses.present
          ? data.exemptedCourses.value
          : this.exemptedCourses,
      masterMajor: data.masterMajor.present
          ? data.masterMajor.value
          : this.masterMajor,
      status: data.status.present ? data.status.value : this.status,
      hasHirstExtension: data.hasHirstExtension.present
          ? data.hasHirstExtension.value
          : this.hasHirstExtension,
      hasSecondExtension: data.hasSecondExtension.present
          ? data.hasSecondExtension.value
          : this.hasSecondExtension,
      admissionCouncilId: data.admissionCouncilId.present
          ? data.admissionCouncilId.value
          : this.admissionCouncilId,
      admissionType: data.admissionType.present
          ? data.admissionType.value
          : this.admissionType,
      isAdmissionPaid: data.isAdmissionPaid.present
          ? data.isAdmissionPaid.value
          : this.isAdmissionPaid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentData(')
          ..write('id: $id, ')
          ..write('admissionId: $admissionId, ')
          ..write('cohort: $cohort, ')
          ..write('studentId: $studentId, ')
          ..write('name: $name, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('phone: $phone, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('schoolEmail: $schoolEmail, ')
          ..write('bachelorUniversity: $bachelorUniversity, ')
          ..write('bachelorMajor: $bachelorMajor, ')
          ..write('bachelorProgram: $bachelorProgram, ')
          ..write('bachelorGraduationRank: $bachelorGraduationRank, ')
          ..write('bachelorGraduationDate: $bachelorGraduationDate, ')
          ..write('intendedSpecialization: $intendedSpecialization, ')
          ..write('exemptedCourses: $exemptedCourses, ')
          ..write('masterMajor: $masterMajor, ')
          ..write('status: $status, ')
          ..write('hasHirstExtension: $hasHirstExtension, ')
          ..write('hasSecondExtension: $hasSecondExtension, ')
          ..write('admissionCouncilId: $admissionCouncilId, ')
          ..write('admissionType: $admissionType, ')
          ..write('isAdmissionPaid: $isAdmissionPaid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    admissionId,
    cohort,
    studentId,
    name,
    dateOfBirth,
    gender,
    placeOfBirth,
    phone,
    personalEmail,
    schoolEmail,
    bachelorUniversity,
    bachelorMajor,
    bachelorProgram,
    bachelorGraduationRank,
    bachelorGraduationDate,
    intendedSpecialization,
    exemptedCourses,
    masterMajor,
    status,
    hasHirstExtension,
    hasSecondExtension,
    admissionCouncilId,
    admissionType,
    isAdmissionPaid,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentData &&
          other.id == this.id &&
          other.admissionId == this.admissionId &&
          other.cohort == this.cohort &&
          other.studentId == this.studentId &&
          other.name == this.name &&
          other.dateOfBirth == this.dateOfBirth &&
          other.gender == this.gender &&
          other.placeOfBirth == this.placeOfBirth &&
          other.phone == this.phone &&
          other.personalEmail == this.personalEmail &&
          other.schoolEmail == this.schoolEmail &&
          other.bachelorUniversity == this.bachelorUniversity &&
          other.bachelorMajor == this.bachelorMajor &&
          other.bachelorProgram == this.bachelorProgram &&
          other.bachelorGraduationRank == this.bachelorGraduationRank &&
          other.bachelorGraduationDate == this.bachelorGraduationDate &&
          other.intendedSpecialization == this.intendedSpecialization &&
          other.exemptedCourses == this.exemptedCourses &&
          other.masterMajor == this.masterMajor &&
          other.status == this.status &&
          other.hasHirstExtension == this.hasHirstExtension &&
          other.hasSecondExtension == this.hasSecondExtension &&
          other.admissionCouncilId == this.admissionCouncilId &&
          other.admissionType == this.admissionType &&
          other.isAdmissionPaid == this.isAdmissionPaid);
}

class StudentCompanion extends UpdateCompanion<StudentData> {
  final Value<int> id;
  final Value<String?> admissionId;
  final Value<String?> cohort;
  final Value<String?> studentId;
  final Value<String> name;
  final Value<DateTime?> dateOfBirth;
  final Value<enums.Gender?> gender;
  final Value<String?> placeOfBirth;
  final Value<String?> phone;
  final Value<String?> personalEmail;
  final Value<String?> schoolEmail;
  final Value<String?> bachelorUniversity;
  final Value<String?> bachelorMajor;
  final Value<String?> bachelorProgram;
  final Value<String?> bachelorGraduationRank;
  final Value<DateTime?> bachelorGraduationDate;
  final Value<String?> intendedSpecialization;
  final Value<String?> exemptedCourses;
  final Value<String?> masterMajor;
  final Value<enums.StudentStatus?> status;
  final Value<bool> hasHirstExtension;
  final Value<bool> hasSecondExtension;
  final Value<int?> admissionCouncilId;
  final Value<enums.AdmissionType?> admissionType;
  final Value<bool> isAdmissionPaid;
  const StudentCompanion({
    this.id = const Value.absent(),
    this.admissionId = const Value.absent(),
    this.cohort = const Value.absent(),
    this.studentId = const Value.absent(),
    this.name = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.gender = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    this.phone = const Value.absent(),
    this.personalEmail = const Value.absent(),
    this.schoolEmail = const Value.absent(),
    this.bachelorUniversity = const Value.absent(),
    this.bachelorMajor = const Value.absent(),
    this.bachelorProgram = const Value.absent(),
    this.bachelorGraduationRank = const Value.absent(),
    this.bachelorGraduationDate = const Value.absent(),
    this.intendedSpecialization = const Value.absent(),
    this.exemptedCourses = const Value.absent(),
    this.masterMajor = const Value.absent(),
    this.status = const Value.absent(),
    this.hasHirstExtension = const Value.absent(),
    this.hasSecondExtension = const Value.absent(),
    this.admissionCouncilId = const Value.absent(),
    this.admissionType = const Value.absent(),
    this.isAdmissionPaid = const Value.absent(),
  });
  StudentCompanion.insert({
    this.id = const Value.absent(),
    this.admissionId = const Value.absent(),
    this.cohort = const Value.absent(),
    this.studentId = const Value.absent(),
    required String name,
    this.dateOfBirth = const Value.absent(),
    this.gender = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    this.phone = const Value.absent(),
    this.personalEmail = const Value.absent(),
    this.schoolEmail = const Value.absent(),
    this.bachelorUniversity = const Value.absent(),
    this.bachelorMajor = const Value.absent(),
    this.bachelorProgram = const Value.absent(),
    this.bachelorGraduationRank = const Value.absent(),
    this.bachelorGraduationDate = const Value.absent(),
    this.intendedSpecialization = const Value.absent(),
    this.exemptedCourses = const Value.absent(),
    this.masterMajor = const Value.absent(),
    this.status = const Value.absent(),
    this.hasHirstExtension = const Value.absent(),
    this.hasSecondExtension = const Value.absent(),
    this.admissionCouncilId = const Value.absent(),
    this.admissionType = const Value.absent(),
    this.isAdmissionPaid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<StudentData> custom({
    Expression<int>? id,
    Expression<String>? admissionId,
    Expression<String>? cohort,
    Expression<String>? studentId,
    Expression<String>? name,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? gender,
    Expression<String>? placeOfBirth,
    Expression<String>? phone,
    Expression<String>? personalEmail,
    Expression<String>? schoolEmail,
    Expression<String>? bachelorUniversity,
    Expression<String>? bachelorMajor,
    Expression<String>? bachelorProgram,
    Expression<String>? bachelorGraduationRank,
    Expression<DateTime>? bachelorGraduationDate,
    Expression<String>? intendedSpecialization,
    Expression<String>? exemptedCourses,
    Expression<String>? masterMajor,
    Expression<String>? status,
    Expression<bool>? hasHirstExtension,
    Expression<bool>? hasSecondExtension,
    Expression<int>? admissionCouncilId,
    Expression<String>? admissionType,
    Expression<bool>? isAdmissionPaid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (admissionId != null) 'soHoSo': admissionId,
      if (cohort != null) 'nienKhoa': cohort,
      if (studentId != null) 'maHocVien': studentId,
      if (name != null) 'hoTen': name,
      if (dateOfBirth != null) 'ngaySinh': dateOfBirth,
      if (gender != null) 'gioiTinh': gender,
      if (placeOfBirth != null) 'noiSinh': placeOfBirth,
      if (phone != null) 'dienThoai': phone,
      if (personalEmail != null) 'email': personalEmail,
      if (schoolEmail != null) 'emailHust': schoolEmail,
      if (bachelorUniversity != null)
        'truongTotNghiepDaiHoc': bachelorUniversity,
      if (bachelorMajor != null) 'nganhTotNghiepDaiHoc': bachelorMajor,
      if (bachelorProgram != null) 'heTotNghiepDaiHoc': bachelorProgram,
      if (bachelorGraduationRank != null)
        'xepLoaiTotNghiepDaiHoc': bachelorGraduationRank,
      if (bachelorGraduationDate != null)
        'ngayTotNghiepDaiHoc': bachelorGraduationDate,
      if (intendedSpecialization != null)
        'dinhHuongChuyenSau': intendedSpecialization,
      if (exemptedCourses != null) 'hocPhanDuocMien': exemptedCourses,
      if (masterMajor != null) 'nganhDaoTaoThacSi': masterMajor,
      if (status != null) 'maTrangThai': status,
      if (hasHirstExtension != null) 'flag_extend_1': hasHirstExtension,
      if (hasSecondExtension != null) 'flag_extend_2': hasSecondExtension,
      if (admissionCouncilId != null) 'idTieuBanXetTuyen': admissionCouncilId,
      if (admissionType != null) 'idDienTuyenSinh': admissionType,
      if (isAdmissionPaid != null) 'thanhToanXetTuyen': isAdmissionPaid,
    });
  }

  StudentCompanion copyWith({
    Value<int>? id,
    Value<String?>? admissionId,
    Value<String?>? cohort,
    Value<String?>? studentId,
    Value<String>? name,
    Value<DateTime?>? dateOfBirth,
    Value<enums.Gender?>? gender,
    Value<String?>? placeOfBirth,
    Value<String?>? phone,
    Value<String?>? personalEmail,
    Value<String?>? schoolEmail,
    Value<String?>? bachelorUniversity,
    Value<String?>? bachelorMajor,
    Value<String?>? bachelorProgram,
    Value<String?>? bachelorGraduationRank,
    Value<DateTime?>? bachelorGraduationDate,
    Value<String?>? intendedSpecialization,
    Value<String?>? exemptedCourses,
    Value<String?>? masterMajor,
    Value<enums.StudentStatus?>? status,
    Value<bool>? hasHirstExtension,
    Value<bool>? hasSecondExtension,
    Value<int?>? admissionCouncilId,
    Value<enums.AdmissionType?>? admissionType,
    Value<bool>? isAdmissionPaid,
  }) {
    return StudentCompanion(
      id: id ?? this.id,
      admissionId: admissionId ?? this.admissionId,
      cohort: cohort ?? this.cohort,
      studentId: studentId ?? this.studentId,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      phone: phone ?? this.phone,
      personalEmail: personalEmail ?? this.personalEmail,
      schoolEmail: schoolEmail ?? this.schoolEmail,
      bachelorUniversity: bachelorUniversity ?? this.bachelorUniversity,
      bachelorMajor: bachelorMajor ?? this.bachelorMajor,
      bachelorProgram: bachelorProgram ?? this.bachelorProgram,
      bachelorGraduationRank:
          bachelorGraduationRank ?? this.bachelorGraduationRank,
      bachelorGraduationDate:
          bachelorGraduationDate ?? this.bachelorGraduationDate,
      intendedSpecialization:
          intendedSpecialization ?? this.intendedSpecialization,
      exemptedCourses: exemptedCourses ?? this.exemptedCourses,
      masterMajor: masterMajor ?? this.masterMajor,
      status: status ?? this.status,
      hasHirstExtension: hasHirstExtension ?? this.hasHirstExtension,
      hasSecondExtension: hasSecondExtension ?? this.hasSecondExtension,
      admissionCouncilId: admissionCouncilId ?? this.admissionCouncilId,
      admissionType: admissionType ?? this.admissionType,
      isAdmissionPaid: isAdmissionPaid ?? this.isAdmissionPaid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (admissionId.present) {
      map['soHoSo'] = Variable<String>(admissionId.value);
    }
    if (cohort.present) {
      map['nienKhoa'] = Variable<String>(cohort.value);
    }
    if (studentId.present) {
      map['maHocVien'] = Variable<String>(studentId.value);
    }
    if (name.present) {
      map['hoTen'] = Variable<String>(name.value);
    }
    if (dateOfBirth.present) {
      map['ngaySinh'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (gender.present) {
      map['gioiTinh'] = Variable<String>(
        Student.$convertergendern.toSql(gender.value),
      );
    }
    if (placeOfBirth.present) {
      map['noiSinh'] = Variable<String>(placeOfBirth.value);
    }
    if (phone.present) {
      map['dienThoai'] = Variable<String>(phone.value);
    }
    if (personalEmail.present) {
      map['email'] = Variable<String>(personalEmail.value);
    }
    if (schoolEmail.present) {
      map['emailHust'] = Variable<String>(schoolEmail.value);
    }
    if (bachelorUniversity.present) {
      map['truongTotNghiepDaiHoc'] = Variable<String>(bachelorUniversity.value);
    }
    if (bachelorMajor.present) {
      map['nganhTotNghiepDaiHoc'] = Variable<String>(bachelorMajor.value);
    }
    if (bachelorProgram.present) {
      map['heTotNghiepDaiHoc'] = Variable<String>(bachelorProgram.value);
    }
    if (bachelorGraduationRank.present) {
      map['xepLoaiTotNghiepDaiHoc'] = Variable<String>(
        bachelorGraduationRank.value,
      );
    }
    if (bachelorGraduationDate.present) {
      map['ngayTotNghiepDaiHoc'] = Variable<DateTime>(
        bachelorGraduationDate.value,
      );
    }
    if (intendedSpecialization.present) {
      map['dinhHuongChuyenSau'] = Variable<String>(
        intendedSpecialization.value,
      );
    }
    if (exemptedCourses.present) {
      map['hocPhanDuocMien'] = Variable<String>(exemptedCourses.value);
    }
    if (masterMajor.present) {
      map['nganhDaoTaoThacSi'] = Variable<String>(masterMajor.value);
    }
    if (status.present) {
      map['maTrangThai'] = Variable<String>(
        Student.$converterstatusn.toSql(status.value),
      );
    }
    if (hasHirstExtension.present) {
      map['flag_extend_1'] = Variable<bool>(hasHirstExtension.value);
    }
    if (hasSecondExtension.present) {
      map['flag_extend_2'] = Variable<bool>(hasSecondExtension.value);
    }
    if (admissionCouncilId.present) {
      map['idTieuBanXetTuyen'] = Variable<int>(admissionCouncilId.value);
    }
    if (admissionType.present) {
      map['idDienTuyenSinh'] = Variable<String>(
        Student.$converteradmissionTypen.toSql(admissionType.value),
      );
    }
    if (isAdmissionPaid.present) {
      map['thanhToanXetTuyen'] = Variable<bool>(isAdmissionPaid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentCompanion(')
          ..write('id: $id, ')
          ..write('admissionId: $admissionId, ')
          ..write('cohort: $cohort, ')
          ..write('studentId: $studentId, ')
          ..write('name: $name, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('phone: $phone, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('schoolEmail: $schoolEmail, ')
          ..write('bachelorUniversity: $bachelorUniversity, ')
          ..write('bachelorMajor: $bachelorMajor, ')
          ..write('bachelorProgram: $bachelorProgram, ')
          ..write('bachelorGraduationRank: $bachelorGraduationRank, ')
          ..write('bachelorGraduationDate: $bachelorGraduationDate, ')
          ..write('intendedSpecialization: $intendedSpecialization, ')
          ..write('exemptedCourses: $exemptedCourses, ')
          ..write('masterMajor: $masterMajor, ')
          ..write('status: $status, ')
          ..write('hasHirstExtension: $hasHirstExtension, ')
          ..write('hasSecondExtension: $hasSecondExtension, ')
          ..write('admissionCouncilId: $admissionCouncilId, ')
          ..write('admissionType: $admissionType, ')
          ..write('isAdmissionPaid: $isAdmissionPaid')
          ..write(')'))
        .toString();
  }
}

class Semester extends Table with TableInfo<Semester, SemesterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Semester(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _registrationBeginDateMeta =
      const VerificationMeta('registrationBeginDate');
  late final GeneratedColumn<DateTime> registrationBeginDate =
      GeneratedColumn<DateTime>(
        'registration_begin_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const VerificationMeta _registrationEndDateMeta =
      const VerificationMeta('registrationEndDate');
  late final GeneratedColumn<DateTime> registrationEndDate =
      GeneratedColumn<DateTime>(
        'registration_end_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const VerificationMeta _classBeginDateMeta = const VerificationMeta(
    'classBeginDate',
  );
  late final GeneratedColumn<DateTime> classBeginDate =
      GeneratedColumn<DateTime>(
        'class_begin_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const VerificationMeta _classEndDateMeta = const VerificationMeta(
    'classEndDate',
  );
  late final GeneratedColumn<DateTime> classEndDate = GeneratedColumn<DateTime>(
    'class_end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _gradeSubmissionDeadlineMeta =
      const VerificationMeta('gradeSubmissionDeadline');
  late final GeneratedColumn<DateTime> gradeSubmissionDeadline =
      GeneratedColumn<DateTime>(
        'grade_submission_deadline',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    registrationBeginDate,
    registrationEndDate,
    classBeginDate,
    classEndDate,
    gradeSubmissionDeadline,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'semester';
  @override
  VerificationContext validateIntegrity(
    Insertable<SemesterData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('registration_begin_date')) {
      context.handle(
        _registrationBeginDateMeta,
        registrationBeginDate.isAcceptableOrUnknown(
          data['registration_begin_date']!,
          _registrationBeginDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_registrationBeginDateMeta);
    }
    if (data.containsKey('registration_end_date')) {
      context.handle(
        _registrationEndDateMeta,
        registrationEndDate.isAcceptableOrUnknown(
          data['registration_end_date']!,
          _registrationEndDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_registrationEndDateMeta);
    }
    if (data.containsKey('class_begin_date')) {
      context.handle(
        _classBeginDateMeta,
        classBeginDate.isAcceptableOrUnknown(
          data['class_begin_date']!,
          _classBeginDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_classBeginDateMeta);
    }
    if (data.containsKey('class_end_date')) {
      context.handle(
        _classEndDateMeta,
        classEndDate.isAcceptableOrUnknown(
          data['class_end_date']!,
          _classEndDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_classEndDateMeta);
    }
    if (data.containsKey('grade_submission_deadline')) {
      context.handle(
        _gradeSubmissionDeadlineMeta,
        gradeSubmissionDeadline.isAcceptableOrUnknown(
          data['grade_submission_deadline']!,
          _gradeSubmissionDeadlineMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_gradeSubmissionDeadlineMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SemesterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SemesterData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      registrationBeginDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}registration_begin_date'],
      )!,
      registrationEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}registration_end_date'],
      )!,
      classBeginDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}class_begin_date'],
      )!,
      classEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}class_end_date'],
      )!,
      gradeSubmissionDeadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}grade_submission_deadline'],
      )!,
    );
  }

  @override
  Semester createAlias(String alias) {
    return Semester(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SemesterData extends DataClass implements Insertable<SemesterData> {
  final String id;
  final DateTime registrationBeginDate;
  final DateTime registrationEndDate;
  final DateTime classBeginDate;
  final DateTime classEndDate;
  final DateTime gradeSubmissionDeadline;
  const SemesterData({
    required this.id,
    required this.registrationBeginDate,
    required this.registrationEndDate,
    required this.classBeginDate,
    required this.classEndDate,
    required this.gradeSubmissionDeadline,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['registration_begin_date'] = Variable<DateTime>(registrationBeginDate);
    map['registration_end_date'] = Variable<DateTime>(registrationEndDate);
    map['class_begin_date'] = Variable<DateTime>(classBeginDate);
    map['class_end_date'] = Variable<DateTime>(classEndDate);
    map['grade_submission_deadline'] = Variable<DateTime>(
      gradeSubmissionDeadline,
    );
    return map;
  }

  SemesterCompanion toCompanion(bool nullToAbsent) {
    return SemesterCompanion(
      id: Value(id),
      registrationBeginDate: Value(registrationBeginDate),
      registrationEndDate: Value(registrationEndDate),
      classBeginDate: Value(classBeginDate),
      classEndDate: Value(classEndDate),
      gradeSubmissionDeadline: Value(gradeSubmissionDeadline),
    );
  }

  factory SemesterData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SemesterData(
      id: serializer.fromJson<String>(json['id']),
      registrationBeginDate: serializer.fromJson<DateTime>(
        json['registration_begin_date'],
      ),
      registrationEndDate: serializer.fromJson<DateTime>(
        json['registration_end_date'],
      ),
      classBeginDate: serializer.fromJson<DateTime>(json['class_begin_date']),
      classEndDate: serializer.fromJson<DateTime>(json['class_end_date']),
      gradeSubmissionDeadline: serializer.fromJson<DateTime>(
        json['grade_submission_deadline'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'registration_begin_date': serializer.toJson<DateTime>(
        registrationBeginDate,
      ),
      'registration_end_date': serializer.toJson<DateTime>(registrationEndDate),
      'class_begin_date': serializer.toJson<DateTime>(classBeginDate),
      'class_end_date': serializer.toJson<DateTime>(classEndDate),
      'grade_submission_deadline': serializer.toJson<DateTime>(
        gradeSubmissionDeadline,
      ),
    };
  }

  SemesterData copyWith({
    String? id,
    DateTime? registrationBeginDate,
    DateTime? registrationEndDate,
    DateTime? classBeginDate,
    DateTime? classEndDate,
    DateTime? gradeSubmissionDeadline,
  }) => SemesterData(
    id: id ?? this.id,
    registrationBeginDate: registrationBeginDate ?? this.registrationBeginDate,
    registrationEndDate: registrationEndDate ?? this.registrationEndDate,
    classBeginDate: classBeginDate ?? this.classBeginDate,
    classEndDate: classEndDate ?? this.classEndDate,
    gradeSubmissionDeadline:
        gradeSubmissionDeadline ?? this.gradeSubmissionDeadline,
  );
  SemesterData copyWithCompanion(SemesterCompanion data) {
    return SemesterData(
      id: data.id.present ? data.id.value : this.id,
      registrationBeginDate: data.registrationBeginDate.present
          ? data.registrationBeginDate.value
          : this.registrationBeginDate,
      registrationEndDate: data.registrationEndDate.present
          ? data.registrationEndDate.value
          : this.registrationEndDate,
      classBeginDate: data.classBeginDate.present
          ? data.classBeginDate.value
          : this.classBeginDate,
      classEndDate: data.classEndDate.present
          ? data.classEndDate.value
          : this.classEndDate,
      gradeSubmissionDeadline: data.gradeSubmissionDeadline.present
          ? data.gradeSubmissionDeadline.value
          : this.gradeSubmissionDeadline,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SemesterData(')
          ..write('id: $id, ')
          ..write('registrationBeginDate: $registrationBeginDate, ')
          ..write('registrationEndDate: $registrationEndDate, ')
          ..write('classBeginDate: $classBeginDate, ')
          ..write('classEndDate: $classEndDate, ')
          ..write('gradeSubmissionDeadline: $gradeSubmissionDeadline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    registrationBeginDate,
    registrationEndDate,
    classBeginDate,
    classEndDate,
    gradeSubmissionDeadline,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SemesterData &&
          other.id == this.id &&
          other.registrationBeginDate == this.registrationBeginDate &&
          other.registrationEndDate == this.registrationEndDate &&
          other.classBeginDate == this.classBeginDate &&
          other.classEndDate == this.classEndDate &&
          other.gradeSubmissionDeadline == this.gradeSubmissionDeadline);
}

class SemesterCompanion extends UpdateCompanion<SemesterData> {
  final Value<String> id;
  final Value<DateTime> registrationBeginDate;
  final Value<DateTime> registrationEndDate;
  final Value<DateTime> classBeginDate;
  final Value<DateTime> classEndDate;
  final Value<DateTime> gradeSubmissionDeadline;
  final Value<int> rowid;
  const SemesterCompanion({
    this.id = const Value.absent(),
    this.registrationBeginDate = const Value.absent(),
    this.registrationEndDate = const Value.absent(),
    this.classBeginDate = const Value.absent(),
    this.classEndDate = const Value.absent(),
    this.gradeSubmissionDeadline = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SemesterCompanion.insert({
    required String id,
    required DateTime registrationBeginDate,
    required DateTime registrationEndDate,
    required DateTime classBeginDate,
    required DateTime classEndDate,
    required DateTime gradeSubmissionDeadline,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       registrationBeginDate = Value(registrationBeginDate),
       registrationEndDate = Value(registrationEndDate),
       classBeginDate = Value(classBeginDate),
       classEndDate = Value(classEndDate),
       gradeSubmissionDeadline = Value(gradeSubmissionDeadline);
  static Insertable<SemesterData> custom({
    Expression<String>? id,
    Expression<DateTime>? registrationBeginDate,
    Expression<DateTime>? registrationEndDate,
    Expression<DateTime>? classBeginDate,
    Expression<DateTime>? classEndDate,
    Expression<DateTime>? gradeSubmissionDeadline,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (registrationBeginDate != null)
        'registration_begin_date': registrationBeginDate,
      if (registrationEndDate != null)
        'registration_end_date': registrationEndDate,
      if (classBeginDate != null) 'class_begin_date': classBeginDate,
      if (classEndDate != null) 'class_end_date': classEndDate,
      if (gradeSubmissionDeadline != null)
        'grade_submission_deadline': gradeSubmissionDeadline,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SemesterCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? registrationBeginDate,
    Value<DateTime>? registrationEndDate,
    Value<DateTime>? classBeginDate,
    Value<DateTime>? classEndDate,
    Value<DateTime>? gradeSubmissionDeadline,
    Value<int>? rowid,
  }) {
    return SemesterCompanion(
      id: id ?? this.id,
      registrationBeginDate:
          registrationBeginDate ?? this.registrationBeginDate,
      registrationEndDate: registrationEndDate ?? this.registrationEndDate,
      classBeginDate: classBeginDate ?? this.classBeginDate,
      classEndDate: classEndDate ?? this.classEndDate,
      gradeSubmissionDeadline:
          gradeSubmissionDeadline ?? this.gradeSubmissionDeadline,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (registrationBeginDate.present) {
      map['registration_begin_date'] = Variable<DateTime>(
        registrationBeginDate.value,
      );
    }
    if (registrationEndDate.present) {
      map['registration_end_date'] = Variable<DateTime>(
        registrationEndDate.value,
      );
    }
    if (classBeginDate.present) {
      map['class_begin_date'] = Variable<DateTime>(classBeginDate.value);
    }
    if (classEndDate.present) {
      map['class_end_date'] = Variable<DateTime>(classEndDate.value);
    }
    if (gradeSubmissionDeadline.present) {
      map['grade_submission_deadline'] = Variable<DateTime>(
        gradeSubmissionDeadline.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SemesterCompanion(')
          ..write('id: $id, ')
          ..write('registrationBeginDate: $registrationBeginDate, ')
          ..write('registrationEndDate: $registrationEndDate, ')
          ..write('classBeginDate: $classBeginDate, ')
          ..write('classEndDate: $classEndDate, ')
          ..write('gradeSubmissionDeadline: $gradeSubmissionDeadline, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Thesis extends Table with TableInfo<Thesis, ThesisData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Thesis(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _supervisorIdMeta = const VerificationMeta(
    'supervisorId',
  );
  late final GeneratedColumn<int> supervisorId = GeneratedColumn<int>(
    'supervisor_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES teacher(id)',
  );
  static const VerificationMeta _presidentIdMeta = const VerificationMeta(
    'presidentId',
  );
  late final GeneratedColumn<int> presidentId = GeneratedColumn<int>(
    'president_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES teacher(id)',
  );
  static const VerificationMeta _firstReviewerIdMeta = const VerificationMeta(
    'firstReviewerId',
  );
  late final GeneratedColumn<int> firstReviewerId = GeneratedColumn<int>(
    'first_reviewer_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES teacher(id)',
  );
  static const VerificationMeta _secondReviewerIdMeta = const VerificationMeta(
    'secondReviewerId',
  );
  late final GeneratedColumn<int> secondReviewerId = GeneratedColumn<int>(
    'second_reviewer_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES teacher(id)',
  );
  static const VerificationMeta _secretaryIdMeta = const VerificationMeta(
    'secretaryId',
  );
  late final GeneratedColumn<int> secretaryId = GeneratedColumn<int>(
    'secretary_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES teacher(id)',
  );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  late final GeneratedColumn<int> memberId = GeneratedColumn<int>(
    'member_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES teacher(id)',
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'student_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES student(id)',
  );
  static const VerificationMeta _vietnameseTitleMeta = const VerificationMeta(
    'vietnameseTitle',
  );
  late final GeneratedColumn<String> vietnameseTitle = GeneratedColumn<String>(
    'vietnamese_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _englishTitleMeta = const VerificationMeta(
    'englishTitle',
  );
  late final GeneratedColumn<String> englishTitle = GeneratedColumn<String>(
    'english_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT ()',
    defaultValue: const CustomExpression(''),
  );
  static const VerificationMeta _defenseDeadlineMeta = const VerificationMeta(
    'defenseDeadline',
  );
  late final GeneratedColumn<DateTime> defenseDeadline =
      GeneratedColumn<DateTime>(
        'defense_deadline',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const VerificationMeta _defenseDateMeta = const VerificationMeta(
    'defenseDate',
  );
  late final GeneratedColumn<DateTime> defenseDate = GeneratedColumn<DateTime>(
    'defense_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _flagTrackingMeta = const VerificationMeta(
    'flagTracking',
  );
  late final GeneratedColumn<bool> flagTracking = GeneratedColumn<bool>(
    'flag_tracking',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _flagPaidMeta = const VerificationMeta(
    'flagPaid',
  );
  late final GeneratedColumn<bool> flagPaid = GeneratedColumn<bool>(
    'flag_paid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _flagIgnoreMeta = const VerificationMeta(
    'flagIgnore',
  );
  late final GeneratedColumn<bool> flagIgnore = GeneratedColumn<bool>(
    'flag_ignore',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  late final GeneratedColumn<String> group = GeneratedColumn<String>(
    'group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
    'nam',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumnWithTypeConverter<enums.MscDefenseStatus, String>
  defenseStatus = GeneratedColumn<String>(
    'defense_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<enums.MscDefenseStatus>(Thesis.$converterdefenseStatus);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supervisorId,
    presidentId,
    firstReviewerId,
    secondReviewerId,
    secretaryId,
    memberId,
    studentId,
    vietnameseTitle,
    englishTitle,
    note,
    defenseDeadline,
    defenseDate,
    flagTracking,
    flagPaid,
    flagIgnore,
    group,
    year,
    defenseStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'thesis';
  @override
  VerificationContext validateIntegrity(
    Insertable<ThesisData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supervisor_id')) {
      context.handle(
        _supervisorIdMeta,
        supervisorId.isAcceptableOrUnknown(
          data['supervisor_id']!,
          _supervisorIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supervisorIdMeta);
    }
    if (data.containsKey('president_id')) {
      context.handle(
        _presidentIdMeta,
        presidentId.isAcceptableOrUnknown(
          data['president_id']!,
          _presidentIdMeta,
        ),
      );
    }
    if (data.containsKey('first_reviewer_id')) {
      context.handle(
        _firstReviewerIdMeta,
        firstReviewerId.isAcceptableOrUnknown(
          data['first_reviewer_id']!,
          _firstReviewerIdMeta,
        ),
      );
    }
    if (data.containsKey('second_reviewer_id')) {
      context.handle(
        _secondReviewerIdMeta,
        secondReviewerId.isAcceptableOrUnknown(
          data['second_reviewer_id']!,
          _secondReviewerIdMeta,
        ),
      );
    }
    if (data.containsKey('secretary_id')) {
      context.handle(
        _secretaryIdMeta,
        secretaryId.isAcceptableOrUnknown(
          data['secretary_id']!,
          _secretaryIdMeta,
        ),
      );
    }
    if (data.containsKey('member_id')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta),
      );
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    }
    if (data.containsKey('vietnamese_title')) {
      context.handle(
        _vietnameseTitleMeta,
        vietnameseTitle.isAcceptableOrUnknown(
          data['vietnamese_title']!,
          _vietnameseTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vietnameseTitleMeta);
    }
    if (data.containsKey('english_title')) {
      context.handle(
        _englishTitleMeta,
        englishTitle.isAcceptableOrUnknown(
          data['english_title']!,
          _englishTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishTitleMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('defense_deadline')) {
      context.handle(
        _defenseDeadlineMeta,
        defenseDeadline.isAcceptableOrUnknown(
          data['defense_deadline']!,
          _defenseDeadlineMeta,
        ),
      );
    }
    if (data.containsKey('defense_date')) {
      context.handle(
        _defenseDateMeta,
        defenseDate.isAcceptableOrUnknown(
          data['defense_date']!,
          _defenseDateMeta,
        ),
      );
    }
    if (data.containsKey('flag_tracking')) {
      context.handle(
        _flagTrackingMeta,
        flagTracking.isAcceptableOrUnknown(
          data['flag_tracking']!,
          _flagTrackingMeta,
        ),
      );
    }
    if (data.containsKey('flag_paid')) {
      context.handle(
        _flagPaidMeta,
        flagPaid.isAcceptableOrUnknown(data['flag_paid']!, _flagPaidMeta),
      );
    }
    if (data.containsKey('flag_ignore')) {
      context.handle(
        _flagIgnoreMeta,
        flagIgnore.isAcceptableOrUnknown(data['flag_ignore']!, _flagIgnoreMeta),
      );
    }
    if (data.containsKey('group')) {
      context.handle(
        _groupMeta,
        group.isAcceptableOrUnknown(data['group']!, _groupMeta),
      );
    }
    if (data.containsKey('nam')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['nam']!, _yearMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ThesisData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ThesisData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      supervisorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supervisor_id'],
      )!,
      presidentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}president_id'],
      ),
      firstReviewerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_reviewer_id'],
      ),
      secondReviewerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}second_reviewer_id'],
      ),
      secretaryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}secretary_id'],
      ),
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}member_id'],
      ),
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_id'],
      ),
      vietnameseTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vietnamese_title'],
      )!,
      englishTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english_title'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
      defenseDeadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}defense_deadline'],
      ),
      defenseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}defense_date'],
      ),
      flagTracking: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}flag_tracking'],
      )!,
      flagPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}flag_paid'],
      )!,
      flagIgnore: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}flag_ignore'],
      )!,
      group: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nam'],
      ),
      defenseStatus: Thesis.$converterdefenseStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}defense_status'],
        )!,
      ),
    );
  }

  @override
  Thesis createAlias(String alias) {
    return Thesis(attachedDatabase, alias);
  }

  static TypeConverter<enums.MscDefenseStatus, String> $converterdefenseStatus =
      enums.mscDefenseStatusConverter;
  @override
  bool get dontWriteConstraints => true;
}

class ThesisData extends DataClass implements Insertable<ThesisData> {
  final int id;
  final int supervisorId;
  final int? presidentId;
  final int? firstReviewerId;
  final int? secondReviewerId;
  final int? secretaryId;
  final int? memberId;
  final int? studentId;
  final String vietnameseTitle;
  final String englishTitle;
  final String note;
  final DateTime? defenseDeadline;
  final DateTime? defenseDate;
  final bool flagTracking;
  final bool flagPaid;
  final bool flagIgnore;
  final String? group;
  final String? year;
  final enums.MscDefenseStatus defenseStatus;
  const ThesisData({
    required this.id,
    required this.supervisorId,
    this.presidentId,
    this.firstReviewerId,
    this.secondReviewerId,
    this.secretaryId,
    this.memberId,
    this.studentId,
    required this.vietnameseTitle,
    required this.englishTitle,
    required this.note,
    this.defenseDeadline,
    this.defenseDate,
    required this.flagTracking,
    required this.flagPaid,
    required this.flagIgnore,
    this.group,
    this.year,
    required this.defenseStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['supervisor_id'] = Variable<int>(supervisorId);
    if (!nullToAbsent || presidentId != null) {
      map['president_id'] = Variable<int>(presidentId);
    }
    if (!nullToAbsent || firstReviewerId != null) {
      map['first_reviewer_id'] = Variable<int>(firstReviewerId);
    }
    if (!nullToAbsent || secondReviewerId != null) {
      map['second_reviewer_id'] = Variable<int>(secondReviewerId);
    }
    if (!nullToAbsent || secretaryId != null) {
      map['secretary_id'] = Variable<int>(secretaryId);
    }
    if (!nullToAbsent || memberId != null) {
      map['member_id'] = Variable<int>(memberId);
    }
    if (!nullToAbsent || studentId != null) {
      map['student_id'] = Variable<int>(studentId);
    }
    map['vietnamese_title'] = Variable<String>(vietnameseTitle);
    map['english_title'] = Variable<String>(englishTitle);
    map['note'] = Variable<String>(note);
    if (!nullToAbsent || defenseDeadline != null) {
      map['defense_deadline'] = Variable<DateTime>(defenseDeadline);
    }
    if (!nullToAbsent || defenseDate != null) {
      map['defense_date'] = Variable<DateTime>(defenseDate);
    }
    map['flag_tracking'] = Variable<bool>(flagTracking);
    map['flag_paid'] = Variable<bool>(flagPaid);
    map['flag_ignore'] = Variable<bool>(flagIgnore);
    if (!nullToAbsent || group != null) {
      map['group'] = Variable<String>(group);
    }
    if (!nullToAbsent || year != null) {
      map['nam'] = Variable<String>(year);
    }
    {
      map['defense_status'] = Variable<String>(
        Thesis.$converterdefenseStatus.toSql(defenseStatus),
      );
    }
    return map;
  }

  ThesisCompanion toCompanion(bool nullToAbsent) {
    return ThesisCompanion(
      id: Value(id),
      supervisorId: Value(supervisorId),
      presidentId: presidentId == null && nullToAbsent
          ? const Value.absent()
          : Value(presidentId),
      firstReviewerId: firstReviewerId == null && nullToAbsent
          ? const Value.absent()
          : Value(firstReviewerId),
      secondReviewerId: secondReviewerId == null && nullToAbsent
          ? const Value.absent()
          : Value(secondReviewerId),
      secretaryId: secretaryId == null && nullToAbsent
          ? const Value.absent()
          : Value(secretaryId),
      memberId: memberId == null && nullToAbsent
          ? const Value.absent()
          : Value(memberId),
      studentId: studentId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentId),
      vietnameseTitle: Value(vietnameseTitle),
      englishTitle: Value(englishTitle),
      note: Value(note),
      defenseDeadline: defenseDeadline == null && nullToAbsent
          ? const Value.absent()
          : Value(defenseDeadline),
      defenseDate: defenseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(defenseDate),
      flagTracking: Value(flagTracking),
      flagPaid: Value(flagPaid),
      flagIgnore: Value(flagIgnore),
      group: group == null && nullToAbsent
          ? const Value.absent()
          : Value(group),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      defenseStatus: Value(defenseStatus),
    );
  }

  factory ThesisData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThesisData(
      id: serializer.fromJson<int>(json['id']),
      supervisorId: serializer.fromJson<int>(json['supervisor_id']),
      presidentId: serializer.fromJson<int?>(json['president_id']),
      firstReviewerId: serializer.fromJson<int?>(json['first_reviewer_id']),
      secondReviewerId: serializer.fromJson<int?>(json['second_reviewer_id']),
      secretaryId: serializer.fromJson<int?>(json['secretary_id']),
      memberId: serializer.fromJson<int?>(json['member_id']),
      studentId: serializer.fromJson<int?>(json['student_id']),
      vietnameseTitle: serializer.fromJson<String>(json['vietnamese_title']),
      englishTitle: serializer.fromJson<String>(json['english_title']),
      note: serializer.fromJson<String>(json['note']),
      defenseDeadline: serializer.fromJson<DateTime?>(json['defense_deadline']),
      defenseDate: serializer.fromJson<DateTime?>(json['defense_date']),
      flagTracking: serializer.fromJson<bool>(json['flag_tracking']),
      flagPaid: serializer.fromJson<bool>(json['flag_paid']),
      flagIgnore: serializer.fromJson<bool>(json['flag_ignore']),
      group: serializer.fromJson<String?>(json['group']),
      year: serializer.fromJson<String?>(json['nam']),
      defenseStatus: serializer.fromJson<enums.MscDefenseStatus>(
        json['defense_status'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supervisor_id': serializer.toJson<int>(supervisorId),
      'president_id': serializer.toJson<int?>(presidentId),
      'first_reviewer_id': serializer.toJson<int?>(firstReviewerId),
      'second_reviewer_id': serializer.toJson<int?>(secondReviewerId),
      'secretary_id': serializer.toJson<int?>(secretaryId),
      'member_id': serializer.toJson<int?>(memberId),
      'student_id': serializer.toJson<int?>(studentId),
      'vietnamese_title': serializer.toJson<String>(vietnameseTitle),
      'english_title': serializer.toJson<String>(englishTitle),
      'note': serializer.toJson<String>(note),
      'defense_deadline': serializer.toJson<DateTime?>(defenseDeadline),
      'defense_date': serializer.toJson<DateTime?>(defenseDate),
      'flag_tracking': serializer.toJson<bool>(flagTracking),
      'flag_paid': serializer.toJson<bool>(flagPaid),
      'flag_ignore': serializer.toJson<bool>(flagIgnore),
      'group': serializer.toJson<String?>(group),
      'nam': serializer.toJson<String?>(year),
      'defense_status': serializer.toJson<enums.MscDefenseStatus>(
        defenseStatus,
      ),
    };
  }

  ThesisData copyWith({
    int? id,
    int? supervisorId,
    Value<int?> presidentId = const Value.absent(),
    Value<int?> firstReviewerId = const Value.absent(),
    Value<int?> secondReviewerId = const Value.absent(),
    Value<int?> secretaryId = const Value.absent(),
    Value<int?> memberId = const Value.absent(),
    Value<int?> studentId = const Value.absent(),
    String? vietnameseTitle,
    String? englishTitle,
    String? note,
    Value<DateTime?> defenseDeadline = const Value.absent(),
    Value<DateTime?> defenseDate = const Value.absent(),
    bool? flagTracking,
    bool? flagPaid,
    bool? flagIgnore,
    Value<String?> group = const Value.absent(),
    Value<String?> year = const Value.absent(),
    enums.MscDefenseStatus? defenseStatus,
  }) => ThesisData(
    id: id ?? this.id,
    supervisorId: supervisorId ?? this.supervisorId,
    presidentId: presidentId.present ? presidentId.value : this.presidentId,
    firstReviewerId: firstReviewerId.present
        ? firstReviewerId.value
        : this.firstReviewerId,
    secondReviewerId: secondReviewerId.present
        ? secondReviewerId.value
        : this.secondReviewerId,
    secretaryId: secretaryId.present ? secretaryId.value : this.secretaryId,
    memberId: memberId.present ? memberId.value : this.memberId,
    studentId: studentId.present ? studentId.value : this.studentId,
    vietnameseTitle: vietnameseTitle ?? this.vietnameseTitle,
    englishTitle: englishTitle ?? this.englishTitle,
    note: note ?? this.note,
    defenseDeadline: defenseDeadline.present
        ? defenseDeadline.value
        : this.defenseDeadline,
    defenseDate: defenseDate.present ? defenseDate.value : this.defenseDate,
    flagTracking: flagTracking ?? this.flagTracking,
    flagPaid: flagPaid ?? this.flagPaid,
    flagIgnore: flagIgnore ?? this.flagIgnore,
    group: group.present ? group.value : this.group,
    year: year.present ? year.value : this.year,
    defenseStatus: defenseStatus ?? this.defenseStatus,
  );
  ThesisData copyWithCompanion(ThesisCompanion data) {
    return ThesisData(
      id: data.id.present ? data.id.value : this.id,
      supervisorId: data.supervisorId.present
          ? data.supervisorId.value
          : this.supervisorId,
      presidentId: data.presidentId.present
          ? data.presidentId.value
          : this.presidentId,
      firstReviewerId: data.firstReviewerId.present
          ? data.firstReviewerId.value
          : this.firstReviewerId,
      secondReviewerId: data.secondReviewerId.present
          ? data.secondReviewerId.value
          : this.secondReviewerId,
      secretaryId: data.secretaryId.present
          ? data.secretaryId.value
          : this.secretaryId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      vietnameseTitle: data.vietnameseTitle.present
          ? data.vietnameseTitle.value
          : this.vietnameseTitle,
      englishTitle: data.englishTitle.present
          ? data.englishTitle.value
          : this.englishTitle,
      note: data.note.present ? data.note.value : this.note,
      defenseDeadline: data.defenseDeadline.present
          ? data.defenseDeadline.value
          : this.defenseDeadline,
      defenseDate: data.defenseDate.present
          ? data.defenseDate.value
          : this.defenseDate,
      flagTracking: data.flagTracking.present
          ? data.flagTracking.value
          : this.flagTracking,
      flagPaid: data.flagPaid.present ? data.flagPaid.value : this.flagPaid,
      flagIgnore: data.flagIgnore.present
          ? data.flagIgnore.value
          : this.flagIgnore,
      group: data.group.present ? data.group.value : this.group,
      year: data.year.present ? data.year.value : this.year,
      defenseStatus: data.defenseStatus.present
          ? data.defenseStatus.value
          : this.defenseStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ThesisData(')
          ..write('id: $id, ')
          ..write('supervisorId: $supervisorId, ')
          ..write('presidentId: $presidentId, ')
          ..write('firstReviewerId: $firstReviewerId, ')
          ..write('secondReviewerId: $secondReviewerId, ')
          ..write('secretaryId: $secretaryId, ')
          ..write('memberId: $memberId, ')
          ..write('studentId: $studentId, ')
          ..write('vietnameseTitle: $vietnameseTitle, ')
          ..write('englishTitle: $englishTitle, ')
          ..write('note: $note, ')
          ..write('defenseDeadline: $defenseDeadline, ')
          ..write('defenseDate: $defenseDate, ')
          ..write('flagTracking: $flagTracking, ')
          ..write('flagPaid: $flagPaid, ')
          ..write('flagIgnore: $flagIgnore, ')
          ..write('group: $group, ')
          ..write('year: $year, ')
          ..write('defenseStatus: $defenseStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    supervisorId,
    presidentId,
    firstReviewerId,
    secondReviewerId,
    secretaryId,
    memberId,
    studentId,
    vietnameseTitle,
    englishTitle,
    note,
    defenseDeadline,
    defenseDate,
    flagTracking,
    flagPaid,
    flagIgnore,
    group,
    year,
    defenseStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThesisData &&
          other.id == this.id &&
          other.supervisorId == this.supervisorId &&
          other.presidentId == this.presidentId &&
          other.firstReviewerId == this.firstReviewerId &&
          other.secondReviewerId == this.secondReviewerId &&
          other.secretaryId == this.secretaryId &&
          other.memberId == this.memberId &&
          other.studentId == this.studentId &&
          other.vietnameseTitle == this.vietnameseTitle &&
          other.englishTitle == this.englishTitle &&
          other.note == this.note &&
          other.defenseDeadline == this.defenseDeadline &&
          other.defenseDate == this.defenseDate &&
          other.flagTracking == this.flagTracking &&
          other.flagPaid == this.flagPaid &&
          other.flagIgnore == this.flagIgnore &&
          other.group == this.group &&
          other.year == this.year &&
          other.defenseStatus == this.defenseStatus);
}

class ThesisCompanion extends UpdateCompanion<ThesisData> {
  final Value<int> id;
  final Value<int> supervisorId;
  final Value<int?> presidentId;
  final Value<int?> firstReviewerId;
  final Value<int?> secondReviewerId;
  final Value<int?> secretaryId;
  final Value<int?> memberId;
  final Value<int?> studentId;
  final Value<String> vietnameseTitle;
  final Value<String> englishTitle;
  final Value<String> note;
  final Value<DateTime?> defenseDeadline;
  final Value<DateTime?> defenseDate;
  final Value<bool> flagTracking;
  final Value<bool> flagPaid;
  final Value<bool> flagIgnore;
  final Value<String?> group;
  final Value<String?> year;
  final Value<enums.MscDefenseStatus> defenseStatus;
  const ThesisCompanion({
    this.id = const Value.absent(),
    this.supervisorId = const Value.absent(),
    this.presidentId = const Value.absent(),
    this.firstReviewerId = const Value.absent(),
    this.secondReviewerId = const Value.absent(),
    this.secretaryId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.studentId = const Value.absent(),
    this.vietnameseTitle = const Value.absent(),
    this.englishTitle = const Value.absent(),
    this.note = const Value.absent(),
    this.defenseDeadline = const Value.absent(),
    this.defenseDate = const Value.absent(),
    this.flagTracking = const Value.absent(),
    this.flagPaid = const Value.absent(),
    this.flagIgnore = const Value.absent(),
    this.group = const Value.absent(),
    this.year = const Value.absent(),
    this.defenseStatus = const Value.absent(),
  });
  ThesisCompanion.insert({
    this.id = const Value.absent(),
    required int supervisorId,
    this.presidentId = const Value.absent(),
    this.firstReviewerId = const Value.absent(),
    this.secondReviewerId = const Value.absent(),
    this.secretaryId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.studentId = const Value.absent(),
    required String vietnameseTitle,
    required String englishTitle,
    this.note = const Value.absent(),
    this.defenseDeadline = const Value.absent(),
    this.defenseDate = const Value.absent(),
    this.flagTracking = const Value.absent(),
    this.flagPaid = const Value.absent(),
    this.flagIgnore = const Value.absent(),
    this.group = const Value.absent(),
    this.year = const Value.absent(),
    required enums.MscDefenseStatus defenseStatus,
  }) : supervisorId = Value(supervisorId),
       vietnameseTitle = Value(vietnameseTitle),
       englishTitle = Value(englishTitle),
       defenseStatus = Value(defenseStatus);
  static Insertable<ThesisData> custom({
    Expression<int>? id,
    Expression<int>? supervisorId,
    Expression<int>? presidentId,
    Expression<int>? firstReviewerId,
    Expression<int>? secondReviewerId,
    Expression<int>? secretaryId,
    Expression<int>? memberId,
    Expression<int>? studentId,
    Expression<String>? vietnameseTitle,
    Expression<String>? englishTitle,
    Expression<String>? note,
    Expression<DateTime>? defenseDeadline,
    Expression<DateTime>? defenseDate,
    Expression<bool>? flagTracking,
    Expression<bool>? flagPaid,
    Expression<bool>? flagIgnore,
    Expression<String>? group,
    Expression<String>? year,
    Expression<String>? defenseStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supervisorId != null) 'supervisor_id': supervisorId,
      if (presidentId != null) 'president_id': presidentId,
      if (firstReviewerId != null) 'first_reviewer_id': firstReviewerId,
      if (secondReviewerId != null) 'second_reviewer_id': secondReviewerId,
      if (secretaryId != null) 'secretary_id': secretaryId,
      if (memberId != null) 'member_id': memberId,
      if (studentId != null) 'student_id': studentId,
      if (vietnameseTitle != null) 'vietnamese_title': vietnameseTitle,
      if (englishTitle != null) 'english_title': englishTitle,
      if (note != null) 'note': note,
      if (defenseDeadline != null) 'defense_deadline': defenseDeadline,
      if (defenseDate != null) 'defense_date': defenseDate,
      if (flagTracking != null) 'flag_tracking': flagTracking,
      if (flagPaid != null) 'flag_paid': flagPaid,
      if (flagIgnore != null) 'flag_ignore': flagIgnore,
      if (group != null) 'group': group,
      if (year != null) 'nam': year,
      if (defenseStatus != null) 'defense_status': defenseStatus,
    });
  }

  ThesisCompanion copyWith({
    Value<int>? id,
    Value<int>? supervisorId,
    Value<int?>? presidentId,
    Value<int?>? firstReviewerId,
    Value<int?>? secondReviewerId,
    Value<int?>? secretaryId,
    Value<int?>? memberId,
    Value<int?>? studentId,
    Value<String>? vietnameseTitle,
    Value<String>? englishTitle,
    Value<String>? note,
    Value<DateTime?>? defenseDeadline,
    Value<DateTime?>? defenseDate,
    Value<bool>? flagTracking,
    Value<bool>? flagPaid,
    Value<bool>? flagIgnore,
    Value<String?>? group,
    Value<String?>? year,
    Value<enums.MscDefenseStatus>? defenseStatus,
  }) {
    return ThesisCompanion(
      id: id ?? this.id,
      supervisorId: supervisorId ?? this.supervisorId,
      presidentId: presidentId ?? this.presidentId,
      firstReviewerId: firstReviewerId ?? this.firstReviewerId,
      secondReviewerId: secondReviewerId ?? this.secondReviewerId,
      secretaryId: secretaryId ?? this.secretaryId,
      memberId: memberId ?? this.memberId,
      studentId: studentId ?? this.studentId,
      vietnameseTitle: vietnameseTitle ?? this.vietnameseTitle,
      englishTitle: englishTitle ?? this.englishTitle,
      note: note ?? this.note,
      defenseDeadline: defenseDeadline ?? this.defenseDeadline,
      defenseDate: defenseDate ?? this.defenseDate,
      flagTracking: flagTracking ?? this.flagTracking,
      flagPaid: flagPaid ?? this.flagPaid,
      flagIgnore: flagIgnore ?? this.flagIgnore,
      group: group ?? this.group,
      year: year ?? this.year,
      defenseStatus: defenseStatus ?? this.defenseStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supervisorId.present) {
      map['supervisor_id'] = Variable<int>(supervisorId.value);
    }
    if (presidentId.present) {
      map['president_id'] = Variable<int>(presidentId.value);
    }
    if (firstReviewerId.present) {
      map['first_reviewer_id'] = Variable<int>(firstReviewerId.value);
    }
    if (secondReviewerId.present) {
      map['second_reviewer_id'] = Variable<int>(secondReviewerId.value);
    }
    if (secretaryId.present) {
      map['secretary_id'] = Variable<int>(secretaryId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<int>(memberId.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (vietnameseTitle.present) {
      map['vietnamese_title'] = Variable<String>(vietnameseTitle.value);
    }
    if (englishTitle.present) {
      map['english_title'] = Variable<String>(englishTitle.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (defenseDeadline.present) {
      map['defense_deadline'] = Variable<DateTime>(defenseDeadline.value);
    }
    if (defenseDate.present) {
      map['defense_date'] = Variable<DateTime>(defenseDate.value);
    }
    if (flagTracking.present) {
      map['flag_tracking'] = Variable<bool>(flagTracking.value);
    }
    if (flagPaid.present) {
      map['flag_paid'] = Variable<bool>(flagPaid.value);
    }
    if (flagIgnore.present) {
      map['flag_ignore'] = Variable<bool>(flagIgnore.value);
    }
    if (group.present) {
      map['group'] = Variable<String>(group.value);
    }
    if (year.present) {
      map['nam'] = Variable<String>(year.value);
    }
    if (defenseStatus.present) {
      map['defense_status'] = Variable<String>(
        Thesis.$converterdefenseStatus.toSql(defenseStatus.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThesisCompanion(')
          ..write('id: $id, ')
          ..write('supervisorId: $supervisorId, ')
          ..write('presidentId: $presidentId, ')
          ..write('firstReviewerId: $firstReviewerId, ')
          ..write('secondReviewerId: $secondReviewerId, ')
          ..write('secretaryId: $secretaryId, ')
          ..write('memberId: $memberId, ')
          ..write('studentId: $studentId, ')
          ..write('vietnameseTitle: $vietnameseTitle, ')
          ..write('englishTitle: $englishTitle, ')
          ..write('note: $note, ')
          ..write('defenseDeadline: $defenseDeadline, ')
          ..write('defenseDate: $defenseDate, ')
          ..write('flagTracking: $flagTracking, ')
          ..write('flagPaid: $flagPaid, ')
          ..write('flagIgnore: $flagIgnore, ')
          ..write('group: $group, ')
          ..write('year: $year, ')
          ..write('defenseStatus: $defenseStatus')
          ..write(')'))
        .toString();
  }
}

class AcademicGroup extends Table
    with TableInfo<AcademicGroup, AcademicGroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AcademicGroup(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'academic_group';
  @override
  VerificationContext validateIntegrity(
    Insertable<AcademicGroupData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AcademicGroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AcademicGroupData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  AcademicGroup createAlias(String alias) {
    return AcademicGroup(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AcademicGroupData extends DataClass
    implements Insertable<AcademicGroupData> {
  final int id;
  final String name;
  final String? note;
  const AcademicGroupData({required this.id, required this.name, this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  AcademicGroupCompanion toCompanion(bool nullToAbsent) {
    return AcademicGroupCompanion(
      id: Value(id),
      name: Value(name),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory AcademicGroupData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AcademicGroupData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'note': serializer.toJson<String?>(note),
    };
  }

  AcademicGroupData copyWith({
    int? id,
    String? name,
    Value<String?> note = const Value.absent(),
  }) => AcademicGroupData(
    id: id ?? this.id,
    name: name ?? this.name,
    note: note.present ? note.value : this.note,
  );
  AcademicGroupData copyWithCompanion(AcademicGroupCompanion data) {
    return AcademicGroupData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AcademicGroupData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AcademicGroupData &&
          other.id == this.id &&
          other.name == this.name &&
          other.note == this.note);
}

class AcademicGroupCompanion extends UpdateCompanion<AcademicGroupData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> note;
  const AcademicGroupCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.note = const Value.absent(),
  });
  AcademicGroupCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.note = const Value.absent(),
  }) : name = Value(name);
  static Insertable<AcademicGroupData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (note != null) 'note': note,
    });
  }

  AcademicGroupCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? note,
  }) {
    return AcademicGroupCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AcademicGroupCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class PhdCohort extends Table with TableInfo<PhdCohort, PhdCohortData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PhdCohort(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cohortMeta = const VerificationMeta('cohort');
  late final GeneratedColumn<String> cohort = GeneratedColumn<String>(
    'cohort',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  @override
  List<GeneratedColumn> get $columns => [cohort, createdTime, updatedTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'phd_cohort';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhdCohortData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cohort')) {
      context.handle(
        _cohortMeta,
        cohort.isAcceptableOrUnknown(data['cohort']!, _cohortMeta),
      );
    } else if (isInserting) {
      context.missing(_cohortMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cohort};
  @override
  PhdCohortData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhdCohortData(
      cohort: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cohort'],
      )!,
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      )!,
    );
  }

  @override
  PhdCohort createAlias(String alias) {
    return PhdCohort(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PhdCohortData extends DataClass implements Insertable<PhdCohortData> {
  final String cohort;
  final DateTime createdTime;
  final DateTime updatedTime;
  const PhdCohortData({
    required this.cohort,
    required this.createdTime,
    required this.updatedTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cohort'] = Variable<String>(cohort);
    map['created_time'] = Variable<DateTime>(createdTime);
    map['updated_time'] = Variable<DateTime>(updatedTime);
    return map;
  }

  PhdCohortCompanion toCompanion(bool nullToAbsent) {
    return PhdCohortCompanion(
      cohort: Value(cohort),
      createdTime: Value(createdTime),
      updatedTime: Value(updatedTime),
    );
  }

  factory PhdCohortData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhdCohortData(
      cohort: serializer.fromJson<String>(json['cohort']),
      createdTime: serializer.fromJson<DateTime>(json['created_time']),
      updatedTime: serializer.fromJson<DateTime>(json['updated_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cohort': serializer.toJson<String>(cohort),
      'created_time': serializer.toJson<DateTime>(createdTime),
      'updated_time': serializer.toJson<DateTime>(updatedTime),
    };
  }

  PhdCohortData copyWith({
    String? cohort,
    DateTime? createdTime,
    DateTime? updatedTime,
  }) => PhdCohortData(
    cohort: cohort ?? this.cohort,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime ?? this.updatedTime,
  );
  PhdCohortData copyWithCompanion(PhdCohortCompanion data) {
    return PhdCohortData(
      cohort: data.cohort.present ? data.cohort.value : this.cohort,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhdCohortData(')
          ..write('cohort: $cohort, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cohort, createdTime, updatedTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhdCohortData &&
          other.cohort == this.cohort &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime);
}

class PhdCohortCompanion extends UpdateCompanion<PhdCohortData> {
  final Value<String> cohort;
  final Value<DateTime> createdTime;
  final Value<DateTime> updatedTime;
  final Value<int> rowid;
  const PhdCohortCompanion({
    this.cohort = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhdCohortCompanion.insert({
    required String cohort,
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cohort = Value(cohort);
  static Insertable<PhdCohortData> custom({
    Expression<String>? cohort,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cohort != null) 'cohort': cohort,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhdCohortCompanion copyWith({
    Value<String>? cohort,
    Value<DateTime>? createdTime,
    Value<DateTime>? updatedTime,
    Value<int>? rowid,
  }) {
    return PhdCohortCompanion(
      cohort: cohort ?? this.cohort,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cohort.present) {
      map['cohort'] = Variable<String>(cohort.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhdCohortCompanion(')
          ..write('cohort: $cohort, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class PhdStudent extends Table with TableInfo<PhdStudent, PhdStudentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PhdStudent(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _cohortMeta = const VerificationMeta('cohort');
  late final GeneratedColumn<String> cohort = GeneratedColumn<String>(
    'cohort',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _managementIdMeta = const VerificationMeta(
    'managementId',
  );
  late final GeneratedColumn<String> managementId = GeneratedColumn<String>(
    'management_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'UNIQUE',
  );
  static const VerificationMeta _admissionIdMeta = const VerificationMeta(
    'admissionId',
  );
  late final GeneratedColumn<String> admissionId = GeneratedColumn<String>(
    'admission_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE NOT NULL',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumnWithTypeConverter<enums.Gender, String> gender =
      GeneratedColumn<String>(
        'gender',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NOT NULL DEFAULT \'M\'',
        defaultValue: const CustomExpression('\'M\''),
      ).withConverter<enums.Gender>(PhdStudent.$convertergender);
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _placeOfBirthMeta = const VerificationMeta(
    'placeOfBirth',
  );
  late final GeneratedColumn<String> placeOfBirth = GeneratedColumn<String>(
    'place_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _personalEmailMeta = const VerificationMeta(
    'personalEmail',
  );
  late final GeneratedColumn<String> personalEmail = GeneratedColumn<String>(
    'personal_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _majorNameMeta = const VerificationMeta(
    'majorName',
  );
  late final GeneratedColumn<String> majorName = GeneratedColumn<String>(
    'major_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'toán học\'',
    defaultValue: const CustomExpression('\'toán học\''),
  );
  static const VerificationMeta _majorIdMeta = const VerificationMeta(
    'majorId',
  );
  late final GeneratedColumn<String> majorId = GeneratedColumn<String>(
    'major_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 9460101',
    defaultValue: const CustomExpression('9460101'),
  );
  late final GeneratedColumnWithTypeConverter<enums.PhdSpecialization, String>
  majorSpecialization =
      GeneratedColumn<String>(
        'major_specialization',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<enums.PhdSpecialization>(
        PhdStudent.$convertermajorSpecialization,
      );
  static const VerificationMeta _admissionPresidentIdMeta =
      const VerificationMeta('admissionPresidentId');
  late final GeneratedColumn<int> admissionPresidentId = GeneratedColumn<int>(
    'admission_president_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _admissionSecretaryIdMeta =
      const VerificationMeta('admissionSecretaryId');
  late final GeneratedColumn<int> admissionSecretaryId = GeneratedColumn<int>(
    'admission_secretary_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _admission1stMemberIdMeta =
      const VerificationMeta('admission1stMemberId');
  late final GeneratedColumn<int> admission1stMemberId = GeneratedColumn<int>(
    'admission_1st_member_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _admission2ndMemberIdMeta =
      const VerificationMeta('admission2ndMemberId');
  late final GeneratedColumn<int> admission2ndMemberId = GeneratedColumn<int>(
    'admission_2nd_member_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _admission3rdMemberIdMeta =
      const VerificationMeta('admission3rdMemberId');
  late final GeneratedColumn<int> admission3rdMemberId = GeneratedColumn<int>(
    'admission_3rd_member_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _admissionPaidMeta = const VerificationMeta(
    'admissionPaid',
  );
  late final GeneratedColumn<bool> admissionPaid = GeneratedColumn<bool>(
    'admission_paid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _thesisMeta = const VerificationMeta('thesis');
  late final GeneratedColumn<String> thesis = GeneratedColumn<String>(
    'thesis',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _supervisorIdMeta = const VerificationMeta(
    'supervisorId',
  );
  late final GeneratedColumn<int> supervisorId = GeneratedColumn<int>(
    'supervisor_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _secondarySupervisorIdMeta =
      const VerificationMeta('secondarySupervisorId');
  late final GeneratedColumn<int> secondarySupervisorId = GeneratedColumn<int>(
    'secondary_supervisor_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _schoolEmailMeta = const VerificationMeta(
    'schoolEmail',
  );
  late final GeneratedColumn<String> schoolEmail = GeneratedColumn<String>(
    'school_email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'UNIQUE',
  );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  late final GeneratedColumn<String> createdTime = GeneratedColumn<String>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  late final GeneratedColumn<String> updatedTime = GeneratedColumn<String>(
    'updated_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  late final GeneratedColumnWithTypeConverter<enums.StudentStatus, String>
  status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<enums.StudentStatus>(PhdStudent.$converterstatus);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cohort,
    managementId,
    admissionId,
    name,
    gender,
    dateOfBirth,
    placeOfBirth,
    phone,
    personalEmail,
    majorName,
    majorId,
    majorSpecialization,
    admissionPresidentId,
    admissionSecretaryId,
    admission1stMemberId,
    admission2ndMemberId,
    admission3rdMemberId,
    admissionPaid,
    thesis,
    supervisorId,
    secondarySupervisorId,
    schoolEmail,
    createdTime,
    updatedTime,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'phd_student';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhdStudentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cohort')) {
      context.handle(
        _cohortMeta,
        cohort.isAcceptableOrUnknown(data['cohort']!, _cohortMeta),
      );
    } else if (isInserting) {
      context.missing(_cohortMeta);
    }
    if (data.containsKey('management_id')) {
      context.handle(
        _managementIdMeta,
        managementId.isAcceptableOrUnknown(
          data['management_id']!,
          _managementIdMeta,
        ),
      );
    }
    if (data.containsKey('admission_id')) {
      context.handle(
        _admissionIdMeta,
        admissionId.isAcceptableOrUnknown(
          data['admission_id']!,
          _admissionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_admissionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    }
    if (data.containsKey('place_of_birth')) {
      context.handle(
        _placeOfBirthMeta,
        placeOfBirth.isAcceptableOrUnknown(
          data['place_of_birth']!,
          _placeOfBirthMeta,
        ),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('personal_email')) {
      context.handle(
        _personalEmailMeta,
        personalEmail.isAcceptableOrUnknown(
          data['personal_email']!,
          _personalEmailMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_personalEmailMeta);
    }
    if (data.containsKey('major_name')) {
      context.handle(
        _majorNameMeta,
        majorName.isAcceptableOrUnknown(data['major_name']!, _majorNameMeta),
      );
    }
    if (data.containsKey('major_id')) {
      context.handle(
        _majorIdMeta,
        majorId.isAcceptableOrUnknown(data['major_id']!, _majorIdMeta),
      );
    }
    if (data.containsKey('admission_president_id')) {
      context.handle(
        _admissionPresidentIdMeta,
        admissionPresidentId.isAcceptableOrUnknown(
          data['admission_president_id']!,
          _admissionPresidentIdMeta,
        ),
      );
    }
    if (data.containsKey('admission_secretary_id')) {
      context.handle(
        _admissionSecretaryIdMeta,
        admissionSecretaryId.isAcceptableOrUnknown(
          data['admission_secretary_id']!,
          _admissionSecretaryIdMeta,
        ),
      );
    }
    if (data.containsKey('admission_1st_member_id')) {
      context.handle(
        _admission1stMemberIdMeta,
        admission1stMemberId.isAcceptableOrUnknown(
          data['admission_1st_member_id']!,
          _admission1stMemberIdMeta,
        ),
      );
    }
    if (data.containsKey('admission_2nd_member_id')) {
      context.handle(
        _admission2ndMemberIdMeta,
        admission2ndMemberId.isAcceptableOrUnknown(
          data['admission_2nd_member_id']!,
          _admission2ndMemberIdMeta,
        ),
      );
    }
    if (data.containsKey('admission_3rd_member_id')) {
      context.handle(
        _admission3rdMemberIdMeta,
        admission3rdMemberId.isAcceptableOrUnknown(
          data['admission_3rd_member_id']!,
          _admission3rdMemberIdMeta,
        ),
      );
    }
    if (data.containsKey('admission_paid')) {
      context.handle(
        _admissionPaidMeta,
        admissionPaid.isAcceptableOrUnknown(
          data['admission_paid']!,
          _admissionPaidMeta,
        ),
      );
    }
    if (data.containsKey('thesis')) {
      context.handle(
        _thesisMeta,
        thesis.isAcceptableOrUnknown(data['thesis']!, _thesisMeta),
      );
    } else if (isInserting) {
      context.missing(_thesisMeta);
    }
    if (data.containsKey('supervisor_id')) {
      context.handle(
        _supervisorIdMeta,
        supervisorId.isAcceptableOrUnknown(
          data['supervisor_id']!,
          _supervisorIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supervisorIdMeta);
    }
    if (data.containsKey('secondary_supervisor_id')) {
      context.handle(
        _secondarySupervisorIdMeta,
        secondarySupervisorId.isAcceptableOrUnknown(
          data['secondary_supervisor_id']!,
          _secondarySupervisorIdMeta,
        ),
      );
    }
    if (data.containsKey('school_email')) {
      context.handle(
        _schoolEmailMeta,
        schoolEmail.isAcceptableOrUnknown(
          data['school_email']!,
          _schoolEmailMeta,
        ),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhdStudentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhdStudentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cohort: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cohort'],
      )!,
      managementId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}management_id'],
      ),
      admissionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admission_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      gender: PhdStudent.$convertergender.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gender'],
        )!,
      ),
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      ),
      placeOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_of_birth'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      personalEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personal_email'],
      )!,
      majorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}major_name'],
      )!,
      majorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}major_id'],
      )!,
      majorSpecialization: PhdStudent.$convertermajorSpecialization.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}major_specialization'],
        )!,
      ),
      admissionPresidentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}admission_president_id'],
      ),
      admissionSecretaryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}admission_secretary_id'],
      ),
      admission1stMemberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}admission_1st_member_id'],
      ),
      admission2ndMemberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}admission_2nd_member_id'],
      ),
      admission3rdMemberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}admission_3rd_member_id'],
      ),
      admissionPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}admission_paid'],
      )!,
      thesis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thesis'],
      )!,
      supervisorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supervisor_id'],
      )!,
      secondarySupervisorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}secondary_supervisor_id'],
      ),
      schoolEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_email'],
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_time'],
      )!,
      status: PhdStudent.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
    );
  }

  @override
  PhdStudent createAlias(String alias) {
    return PhdStudent(attachedDatabase, alias);
  }

  static TypeConverter<enums.Gender, String> $convertergender =
      const enums.GenderConverter();
  static TypeConverter<enums.PhdSpecialization, String>
  $convertermajorSpecialization = enums.phdSpecializationConverter;
  static TypeConverter<enums.StudentStatus, String> $converterstatus =
      const enums.StudentStatusConverter();
  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(admission_president_id)REFERENCES teacher(id)',
    'FOREIGN KEY(admission_president_id)REFERENCES teacher(id)',
    'FOREIGN KEY(admission_secretary_id)REFERENCES teacher(id)',
    'FOREIGN KEY(admission_1st_member_id)REFERENCES teacher(id)',
    'FOREIGN KEY(admission_2nd_member_id)REFERENCES teacher(id)',
    'FOREIGN KEY(admission_3rd_member_id)REFERENCES teacher(id)',
    'FOREIGN KEY(supervisor_id)REFERENCES teacher(id)',
    'FOREIGN KEY(secondary_supervisor_id)REFERENCES teacher(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class PhdStudentData extends DataClass implements Insertable<PhdStudentData> {
  final int id;
  final String cohort;
  final String? managementId;
  final String admissionId;
  final String name;
  final enums.Gender gender;
  final DateTime? dateOfBirth;
  final String? placeOfBirth;
  final String phone;
  final String personalEmail;
  final String majorName;
  final String majorId;
  final enums.PhdSpecialization majorSpecialization;
  final int? admissionPresidentId;
  final int? admissionSecretaryId;
  final int? admission1stMemberId;
  final int? admission2ndMemberId;
  final int? admission3rdMemberId;
  final bool admissionPaid;
  final String thesis;
  final int supervisorId;
  final int? secondarySupervisorId;
  final String? schoolEmail;
  final String createdTime;
  final String updatedTime;
  final enums.StudentStatus status;
  const PhdStudentData({
    required this.id,
    required this.cohort,
    this.managementId,
    required this.admissionId,
    required this.name,
    required this.gender,
    this.dateOfBirth,
    this.placeOfBirth,
    required this.phone,
    required this.personalEmail,
    required this.majorName,
    required this.majorId,
    required this.majorSpecialization,
    this.admissionPresidentId,
    this.admissionSecretaryId,
    this.admission1stMemberId,
    this.admission2ndMemberId,
    this.admission3rdMemberId,
    required this.admissionPaid,
    required this.thesis,
    required this.supervisorId,
    this.secondarySupervisorId,
    this.schoolEmail,
    required this.createdTime,
    required this.updatedTime,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cohort'] = Variable<String>(cohort);
    if (!nullToAbsent || managementId != null) {
      map['management_id'] = Variable<String>(managementId);
    }
    map['admission_id'] = Variable<String>(admissionId);
    map['name'] = Variable<String>(name);
    {
      map['gender'] = Variable<String>(
        PhdStudent.$convertergender.toSql(gender),
      );
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || placeOfBirth != null) {
      map['place_of_birth'] = Variable<String>(placeOfBirth);
    }
    map['phone'] = Variable<String>(phone);
    map['personal_email'] = Variable<String>(personalEmail);
    map['major_name'] = Variable<String>(majorName);
    map['major_id'] = Variable<String>(majorId);
    {
      map['major_specialization'] = Variable<String>(
        PhdStudent.$convertermajorSpecialization.toSql(majorSpecialization),
      );
    }
    if (!nullToAbsent || admissionPresidentId != null) {
      map['admission_president_id'] = Variable<int>(admissionPresidentId);
    }
    if (!nullToAbsent || admissionSecretaryId != null) {
      map['admission_secretary_id'] = Variable<int>(admissionSecretaryId);
    }
    if (!nullToAbsent || admission1stMemberId != null) {
      map['admission_1st_member_id'] = Variable<int>(admission1stMemberId);
    }
    if (!nullToAbsent || admission2ndMemberId != null) {
      map['admission_2nd_member_id'] = Variable<int>(admission2ndMemberId);
    }
    if (!nullToAbsent || admission3rdMemberId != null) {
      map['admission_3rd_member_id'] = Variable<int>(admission3rdMemberId);
    }
    map['admission_paid'] = Variable<bool>(admissionPaid);
    map['thesis'] = Variable<String>(thesis);
    map['supervisor_id'] = Variable<int>(supervisorId);
    if (!nullToAbsent || secondarySupervisorId != null) {
      map['secondary_supervisor_id'] = Variable<int>(secondarySupervisorId);
    }
    if (!nullToAbsent || schoolEmail != null) {
      map['school_email'] = Variable<String>(schoolEmail);
    }
    map['created_time'] = Variable<String>(createdTime);
    map['updated_time'] = Variable<String>(updatedTime);
    {
      map['status'] = Variable<String>(
        PhdStudent.$converterstatus.toSql(status),
      );
    }
    return map;
  }

  PhdStudentCompanion toCompanion(bool nullToAbsent) {
    return PhdStudentCompanion(
      id: Value(id),
      cohort: Value(cohort),
      managementId: managementId == null && nullToAbsent
          ? const Value.absent()
          : Value(managementId),
      admissionId: Value(admissionId),
      name: Value(name),
      gender: Value(gender),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      placeOfBirth: placeOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(placeOfBirth),
      phone: Value(phone),
      personalEmail: Value(personalEmail),
      majorName: Value(majorName),
      majorId: Value(majorId),
      majorSpecialization: Value(majorSpecialization),
      admissionPresidentId: admissionPresidentId == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionPresidentId),
      admissionSecretaryId: admissionSecretaryId == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionSecretaryId),
      admission1stMemberId: admission1stMemberId == null && nullToAbsent
          ? const Value.absent()
          : Value(admission1stMemberId),
      admission2ndMemberId: admission2ndMemberId == null && nullToAbsent
          ? const Value.absent()
          : Value(admission2ndMemberId),
      admission3rdMemberId: admission3rdMemberId == null && nullToAbsent
          ? const Value.absent()
          : Value(admission3rdMemberId),
      admissionPaid: Value(admissionPaid),
      thesis: Value(thesis),
      supervisorId: Value(supervisorId),
      secondarySupervisorId: secondarySupervisorId == null && nullToAbsent
          ? const Value.absent()
          : Value(secondarySupervisorId),
      schoolEmail: schoolEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(schoolEmail),
      createdTime: Value(createdTime),
      updatedTime: Value(updatedTime),
      status: Value(status),
    );
  }

  factory PhdStudentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhdStudentData(
      id: serializer.fromJson<int>(json['id']),
      cohort: serializer.fromJson<String>(json['cohort']),
      managementId: serializer.fromJson<String?>(json['management_id']),
      admissionId: serializer.fromJson<String>(json['admission_id']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<enums.Gender>(json['gender']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['date_of_birth']),
      placeOfBirth: serializer.fromJson<String?>(json['place_of_birth']),
      phone: serializer.fromJson<String>(json['phone']),
      personalEmail: serializer.fromJson<String>(json['personal_email']),
      majorName: serializer.fromJson<String>(json['major_name']),
      majorId: serializer.fromJson<String>(json['major_id']),
      majorSpecialization: serializer.fromJson<enums.PhdSpecialization>(
        json['major_specialization'],
      ),
      admissionPresidentId: serializer.fromJson<int?>(
        json['admission_president_id'],
      ),
      admissionSecretaryId: serializer.fromJson<int?>(
        json['admission_secretary_id'],
      ),
      admission1stMemberId: serializer.fromJson<int?>(
        json['admission_1st_member_id'],
      ),
      admission2ndMemberId: serializer.fromJson<int?>(
        json['admission_2nd_member_id'],
      ),
      admission3rdMemberId: serializer.fromJson<int?>(
        json['admission_3rd_member_id'],
      ),
      admissionPaid: serializer.fromJson<bool>(json['admission_paid']),
      thesis: serializer.fromJson<String>(json['thesis']),
      supervisorId: serializer.fromJson<int>(json['supervisor_id']),
      secondarySupervisorId: serializer.fromJson<int?>(
        json['secondary_supervisor_id'],
      ),
      schoolEmail: serializer.fromJson<String?>(json['school_email']),
      createdTime: serializer.fromJson<String>(json['created_time']),
      updatedTime: serializer.fromJson<String>(json['updated_time']),
      status: serializer.fromJson<enums.StudentStatus>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cohort': serializer.toJson<String>(cohort),
      'management_id': serializer.toJson<String?>(managementId),
      'admission_id': serializer.toJson<String>(admissionId),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<enums.Gender>(gender),
      'date_of_birth': serializer.toJson<DateTime?>(dateOfBirth),
      'place_of_birth': serializer.toJson<String?>(placeOfBirth),
      'phone': serializer.toJson<String>(phone),
      'personal_email': serializer.toJson<String>(personalEmail),
      'major_name': serializer.toJson<String>(majorName),
      'major_id': serializer.toJson<String>(majorId),
      'major_specialization': serializer.toJson<enums.PhdSpecialization>(
        majorSpecialization,
      ),
      'admission_president_id': serializer.toJson<int?>(admissionPresidentId),
      'admission_secretary_id': serializer.toJson<int?>(admissionSecretaryId),
      'admission_1st_member_id': serializer.toJson<int?>(admission1stMemberId),
      'admission_2nd_member_id': serializer.toJson<int?>(admission2ndMemberId),
      'admission_3rd_member_id': serializer.toJson<int?>(admission3rdMemberId),
      'admission_paid': serializer.toJson<bool>(admissionPaid),
      'thesis': serializer.toJson<String>(thesis),
      'supervisor_id': serializer.toJson<int>(supervisorId),
      'secondary_supervisor_id': serializer.toJson<int?>(secondarySupervisorId),
      'school_email': serializer.toJson<String?>(schoolEmail),
      'created_time': serializer.toJson<String>(createdTime),
      'updated_time': serializer.toJson<String>(updatedTime),
      'status': serializer.toJson<enums.StudentStatus>(status),
    };
  }

  PhdStudentData copyWith({
    int? id,
    String? cohort,
    Value<String?> managementId = const Value.absent(),
    String? admissionId,
    String? name,
    enums.Gender? gender,
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<String?> placeOfBirth = const Value.absent(),
    String? phone,
    String? personalEmail,
    String? majorName,
    String? majorId,
    enums.PhdSpecialization? majorSpecialization,
    Value<int?> admissionPresidentId = const Value.absent(),
    Value<int?> admissionSecretaryId = const Value.absent(),
    Value<int?> admission1stMemberId = const Value.absent(),
    Value<int?> admission2ndMemberId = const Value.absent(),
    Value<int?> admission3rdMemberId = const Value.absent(),
    bool? admissionPaid,
    String? thesis,
    int? supervisorId,
    Value<int?> secondarySupervisorId = const Value.absent(),
    Value<String?> schoolEmail = const Value.absent(),
    String? createdTime,
    String? updatedTime,
    enums.StudentStatus? status,
  }) => PhdStudentData(
    id: id ?? this.id,
    cohort: cohort ?? this.cohort,
    managementId: managementId.present ? managementId.value : this.managementId,
    admissionId: admissionId ?? this.admissionId,
    name: name ?? this.name,
    gender: gender ?? this.gender,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    placeOfBirth: placeOfBirth.present ? placeOfBirth.value : this.placeOfBirth,
    phone: phone ?? this.phone,
    personalEmail: personalEmail ?? this.personalEmail,
    majorName: majorName ?? this.majorName,
    majorId: majorId ?? this.majorId,
    majorSpecialization: majorSpecialization ?? this.majorSpecialization,
    admissionPresidentId: admissionPresidentId.present
        ? admissionPresidentId.value
        : this.admissionPresidentId,
    admissionSecretaryId: admissionSecretaryId.present
        ? admissionSecretaryId.value
        : this.admissionSecretaryId,
    admission1stMemberId: admission1stMemberId.present
        ? admission1stMemberId.value
        : this.admission1stMemberId,
    admission2ndMemberId: admission2ndMemberId.present
        ? admission2ndMemberId.value
        : this.admission2ndMemberId,
    admission3rdMemberId: admission3rdMemberId.present
        ? admission3rdMemberId.value
        : this.admission3rdMemberId,
    admissionPaid: admissionPaid ?? this.admissionPaid,
    thesis: thesis ?? this.thesis,
    supervisorId: supervisorId ?? this.supervisorId,
    secondarySupervisorId: secondarySupervisorId.present
        ? secondarySupervisorId.value
        : this.secondarySupervisorId,
    schoolEmail: schoolEmail.present ? schoolEmail.value : this.schoolEmail,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime ?? this.updatedTime,
    status: status ?? this.status,
  );
  PhdStudentData copyWithCompanion(PhdStudentCompanion data) {
    return PhdStudentData(
      id: data.id.present ? data.id.value : this.id,
      cohort: data.cohort.present ? data.cohort.value : this.cohort,
      managementId: data.managementId.present
          ? data.managementId.value
          : this.managementId,
      admissionId: data.admissionId.present
          ? data.admissionId.value
          : this.admissionId,
      name: data.name.present ? data.name.value : this.name,
      gender: data.gender.present ? data.gender.value : this.gender,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      placeOfBirth: data.placeOfBirth.present
          ? data.placeOfBirth.value
          : this.placeOfBirth,
      phone: data.phone.present ? data.phone.value : this.phone,
      personalEmail: data.personalEmail.present
          ? data.personalEmail.value
          : this.personalEmail,
      majorName: data.majorName.present ? data.majorName.value : this.majorName,
      majorId: data.majorId.present ? data.majorId.value : this.majorId,
      majorSpecialization: data.majorSpecialization.present
          ? data.majorSpecialization.value
          : this.majorSpecialization,
      admissionPresidentId: data.admissionPresidentId.present
          ? data.admissionPresidentId.value
          : this.admissionPresidentId,
      admissionSecretaryId: data.admissionSecretaryId.present
          ? data.admissionSecretaryId.value
          : this.admissionSecretaryId,
      admission1stMemberId: data.admission1stMemberId.present
          ? data.admission1stMemberId.value
          : this.admission1stMemberId,
      admission2ndMemberId: data.admission2ndMemberId.present
          ? data.admission2ndMemberId.value
          : this.admission2ndMemberId,
      admission3rdMemberId: data.admission3rdMemberId.present
          ? data.admission3rdMemberId.value
          : this.admission3rdMemberId,
      admissionPaid: data.admissionPaid.present
          ? data.admissionPaid.value
          : this.admissionPaid,
      thesis: data.thesis.present ? data.thesis.value : this.thesis,
      supervisorId: data.supervisorId.present
          ? data.supervisorId.value
          : this.supervisorId,
      secondarySupervisorId: data.secondarySupervisorId.present
          ? data.secondarySupervisorId.value
          : this.secondarySupervisorId,
      schoolEmail: data.schoolEmail.present
          ? data.schoolEmail.value
          : this.schoolEmail,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhdStudentData(')
          ..write('id: $id, ')
          ..write('cohort: $cohort, ')
          ..write('managementId: $managementId, ')
          ..write('admissionId: $admissionId, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('phone: $phone, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('majorName: $majorName, ')
          ..write('majorId: $majorId, ')
          ..write('majorSpecialization: $majorSpecialization, ')
          ..write('admissionPresidentId: $admissionPresidentId, ')
          ..write('admissionSecretaryId: $admissionSecretaryId, ')
          ..write('admission1stMemberId: $admission1stMemberId, ')
          ..write('admission2ndMemberId: $admission2ndMemberId, ')
          ..write('admission3rdMemberId: $admission3rdMemberId, ')
          ..write('admissionPaid: $admissionPaid, ')
          ..write('thesis: $thesis, ')
          ..write('supervisorId: $supervisorId, ')
          ..write('secondarySupervisorId: $secondarySupervisorId, ')
          ..write('schoolEmail: $schoolEmail, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    cohort,
    managementId,
    admissionId,
    name,
    gender,
    dateOfBirth,
    placeOfBirth,
    phone,
    personalEmail,
    majorName,
    majorId,
    majorSpecialization,
    admissionPresidentId,
    admissionSecretaryId,
    admission1stMemberId,
    admission2ndMemberId,
    admission3rdMemberId,
    admissionPaid,
    thesis,
    supervisorId,
    secondarySupervisorId,
    schoolEmail,
    createdTime,
    updatedTime,
    status,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhdStudentData &&
          other.id == this.id &&
          other.cohort == this.cohort &&
          other.managementId == this.managementId &&
          other.admissionId == this.admissionId &&
          other.name == this.name &&
          other.gender == this.gender &&
          other.dateOfBirth == this.dateOfBirth &&
          other.placeOfBirth == this.placeOfBirth &&
          other.phone == this.phone &&
          other.personalEmail == this.personalEmail &&
          other.majorName == this.majorName &&
          other.majorId == this.majorId &&
          other.majorSpecialization == this.majorSpecialization &&
          other.admissionPresidentId == this.admissionPresidentId &&
          other.admissionSecretaryId == this.admissionSecretaryId &&
          other.admission1stMemberId == this.admission1stMemberId &&
          other.admission2ndMemberId == this.admission2ndMemberId &&
          other.admission3rdMemberId == this.admission3rdMemberId &&
          other.admissionPaid == this.admissionPaid &&
          other.thesis == this.thesis &&
          other.supervisorId == this.supervisorId &&
          other.secondarySupervisorId == this.secondarySupervisorId &&
          other.schoolEmail == this.schoolEmail &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.status == this.status);
}

class PhdStudentCompanion extends UpdateCompanion<PhdStudentData> {
  final Value<int> id;
  final Value<String> cohort;
  final Value<String?> managementId;
  final Value<String> admissionId;
  final Value<String> name;
  final Value<enums.Gender> gender;
  final Value<DateTime?> dateOfBirth;
  final Value<String?> placeOfBirth;
  final Value<String> phone;
  final Value<String> personalEmail;
  final Value<String> majorName;
  final Value<String> majorId;
  final Value<enums.PhdSpecialization> majorSpecialization;
  final Value<int?> admissionPresidentId;
  final Value<int?> admissionSecretaryId;
  final Value<int?> admission1stMemberId;
  final Value<int?> admission2ndMemberId;
  final Value<int?> admission3rdMemberId;
  final Value<bool> admissionPaid;
  final Value<String> thesis;
  final Value<int> supervisorId;
  final Value<int?> secondarySupervisorId;
  final Value<String?> schoolEmail;
  final Value<String> createdTime;
  final Value<String> updatedTime;
  final Value<enums.StudentStatus> status;
  const PhdStudentCompanion({
    this.id = const Value.absent(),
    this.cohort = const Value.absent(),
    this.managementId = const Value.absent(),
    this.admissionId = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    this.phone = const Value.absent(),
    this.personalEmail = const Value.absent(),
    this.majorName = const Value.absent(),
    this.majorId = const Value.absent(),
    this.majorSpecialization = const Value.absent(),
    this.admissionPresidentId = const Value.absent(),
    this.admissionSecretaryId = const Value.absent(),
    this.admission1stMemberId = const Value.absent(),
    this.admission2ndMemberId = const Value.absent(),
    this.admission3rdMemberId = const Value.absent(),
    this.admissionPaid = const Value.absent(),
    this.thesis = const Value.absent(),
    this.supervisorId = const Value.absent(),
    this.secondarySupervisorId = const Value.absent(),
    this.schoolEmail = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.status = const Value.absent(),
  });
  PhdStudentCompanion.insert({
    this.id = const Value.absent(),
    required String cohort,
    this.managementId = const Value.absent(),
    required String admissionId,
    required String name,
    this.gender = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    required String phone,
    required String personalEmail,
    this.majorName = const Value.absent(),
    this.majorId = const Value.absent(),
    required enums.PhdSpecialization majorSpecialization,
    this.admissionPresidentId = const Value.absent(),
    this.admissionSecretaryId = const Value.absent(),
    this.admission1stMemberId = const Value.absent(),
    this.admission2ndMemberId = const Value.absent(),
    this.admission3rdMemberId = const Value.absent(),
    this.admissionPaid = const Value.absent(),
    required String thesis,
    required int supervisorId,
    this.secondarySupervisorId = const Value.absent(),
    this.schoolEmail = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    required enums.StudentStatus status,
  }) : cohort = Value(cohort),
       admissionId = Value(admissionId),
       name = Value(name),
       phone = Value(phone),
       personalEmail = Value(personalEmail),
       majorSpecialization = Value(majorSpecialization),
       thesis = Value(thesis),
       supervisorId = Value(supervisorId),
       status = Value(status);
  static Insertable<PhdStudentData> custom({
    Expression<int>? id,
    Expression<String>? cohort,
    Expression<String>? managementId,
    Expression<String>? admissionId,
    Expression<String>? name,
    Expression<String>? gender,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? placeOfBirth,
    Expression<String>? phone,
    Expression<String>? personalEmail,
    Expression<String>? majorName,
    Expression<String>? majorId,
    Expression<String>? majorSpecialization,
    Expression<int>? admissionPresidentId,
    Expression<int>? admissionSecretaryId,
    Expression<int>? admission1stMemberId,
    Expression<int>? admission2ndMemberId,
    Expression<int>? admission3rdMemberId,
    Expression<bool>? admissionPaid,
    Expression<String>? thesis,
    Expression<int>? supervisorId,
    Expression<int>? secondarySupervisorId,
    Expression<String>? schoolEmail,
    Expression<String>? createdTime,
    Expression<String>? updatedTime,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cohort != null) 'cohort': cohort,
      if (managementId != null) 'management_id': managementId,
      if (admissionId != null) 'admission_id': admissionId,
      if (name != null) 'name': name,
      if (gender != null) 'gender': gender,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (placeOfBirth != null) 'place_of_birth': placeOfBirth,
      if (phone != null) 'phone': phone,
      if (personalEmail != null) 'personal_email': personalEmail,
      if (majorName != null) 'major_name': majorName,
      if (majorId != null) 'major_id': majorId,
      if (majorSpecialization != null)
        'major_specialization': majorSpecialization,
      if (admissionPresidentId != null)
        'admission_president_id': admissionPresidentId,
      if (admissionSecretaryId != null)
        'admission_secretary_id': admissionSecretaryId,
      if (admission1stMemberId != null)
        'admission_1st_member_id': admission1stMemberId,
      if (admission2ndMemberId != null)
        'admission_2nd_member_id': admission2ndMemberId,
      if (admission3rdMemberId != null)
        'admission_3rd_member_id': admission3rdMemberId,
      if (admissionPaid != null) 'admission_paid': admissionPaid,
      if (thesis != null) 'thesis': thesis,
      if (supervisorId != null) 'supervisor_id': supervisorId,
      if (secondarySupervisorId != null)
        'secondary_supervisor_id': secondarySupervisorId,
      if (schoolEmail != null) 'school_email': schoolEmail,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (status != null) 'status': status,
    });
  }

  PhdStudentCompanion copyWith({
    Value<int>? id,
    Value<String>? cohort,
    Value<String?>? managementId,
    Value<String>? admissionId,
    Value<String>? name,
    Value<enums.Gender>? gender,
    Value<DateTime?>? dateOfBirth,
    Value<String?>? placeOfBirth,
    Value<String>? phone,
    Value<String>? personalEmail,
    Value<String>? majorName,
    Value<String>? majorId,
    Value<enums.PhdSpecialization>? majorSpecialization,
    Value<int?>? admissionPresidentId,
    Value<int?>? admissionSecretaryId,
    Value<int?>? admission1stMemberId,
    Value<int?>? admission2ndMemberId,
    Value<int?>? admission3rdMemberId,
    Value<bool>? admissionPaid,
    Value<String>? thesis,
    Value<int>? supervisorId,
    Value<int?>? secondarySupervisorId,
    Value<String?>? schoolEmail,
    Value<String>? createdTime,
    Value<String>? updatedTime,
    Value<enums.StudentStatus>? status,
  }) {
    return PhdStudentCompanion(
      id: id ?? this.id,
      cohort: cohort ?? this.cohort,
      managementId: managementId ?? this.managementId,
      admissionId: admissionId ?? this.admissionId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      phone: phone ?? this.phone,
      personalEmail: personalEmail ?? this.personalEmail,
      majorName: majorName ?? this.majorName,
      majorId: majorId ?? this.majorId,
      majorSpecialization: majorSpecialization ?? this.majorSpecialization,
      admissionPresidentId: admissionPresidentId ?? this.admissionPresidentId,
      admissionSecretaryId: admissionSecretaryId ?? this.admissionSecretaryId,
      admission1stMemberId: admission1stMemberId ?? this.admission1stMemberId,
      admission2ndMemberId: admission2ndMemberId ?? this.admission2ndMemberId,
      admission3rdMemberId: admission3rdMemberId ?? this.admission3rdMemberId,
      admissionPaid: admissionPaid ?? this.admissionPaid,
      thesis: thesis ?? this.thesis,
      supervisorId: supervisorId ?? this.supervisorId,
      secondarySupervisorId:
          secondarySupervisorId ?? this.secondarySupervisorId,
      schoolEmail: schoolEmail ?? this.schoolEmail,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cohort.present) {
      map['cohort'] = Variable<String>(cohort.value);
    }
    if (managementId.present) {
      map['management_id'] = Variable<String>(managementId.value);
    }
    if (admissionId.present) {
      map['admission_id'] = Variable<String>(admissionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(
        PhdStudent.$convertergender.toSql(gender.value),
      );
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (placeOfBirth.present) {
      map['place_of_birth'] = Variable<String>(placeOfBirth.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (personalEmail.present) {
      map['personal_email'] = Variable<String>(personalEmail.value);
    }
    if (majorName.present) {
      map['major_name'] = Variable<String>(majorName.value);
    }
    if (majorId.present) {
      map['major_id'] = Variable<String>(majorId.value);
    }
    if (majorSpecialization.present) {
      map['major_specialization'] = Variable<String>(
        PhdStudent.$convertermajorSpecialization.toSql(
          majorSpecialization.value,
        ),
      );
    }
    if (admissionPresidentId.present) {
      map['admission_president_id'] = Variable<int>(admissionPresidentId.value);
    }
    if (admissionSecretaryId.present) {
      map['admission_secretary_id'] = Variable<int>(admissionSecretaryId.value);
    }
    if (admission1stMemberId.present) {
      map['admission_1st_member_id'] = Variable<int>(
        admission1stMemberId.value,
      );
    }
    if (admission2ndMemberId.present) {
      map['admission_2nd_member_id'] = Variable<int>(
        admission2ndMemberId.value,
      );
    }
    if (admission3rdMemberId.present) {
      map['admission_3rd_member_id'] = Variable<int>(
        admission3rdMemberId.value,
      );
    }
    if (admissionPaid.present) {
      map['admission_paid'] = Variable<bool>(admissionPaid.value);
    }
    if (thesis.present) {
      map['thesis'] = Variable<String>(thesis.value);
    }
    if (supervisorId.present) {
      map['supervisor_id'] = Variable<int>(supervisorId.value);
    }
    if (secondarySupervisorId.present) {
      map['secondary_supervisor_id'] = Variable<int>(
        secondarySupervisorId.value,
      );
    }
    if (schoolEmail.present) {
      map['school_email'] = Variable<String>(schoolEmail.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<String>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<String>(updatedTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        PhdStudent.$converterstatus.toSql(status.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhdStudentCompanion(')
          ..write('id: $id, ')
          ..write('cohort: $cohort, ')
          ..write('managementId: $managementId, ')
          ..write('admissionId: $admissionId, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('phone: $phone, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('majorName: $majorName, ')
          ..write('majorId: $majorId, ')
          ..write('majorSpecialization: $majorSpecialization, ')
          ..write('admissionPresidentId: $admissionPresidentId, ')
          ..write('admissionSecretaryId: $admissionSecretaryId, ')
          ..write('admission1stMemberId: $admission1stMemberId, ')
          ..write('admission2ndMemberId: $admission2ndMemberId, ')
          ..write('admission3rdMemberId: $admission3rdMemberId, ')
          ..write('admissionPaid: $admissionPaid, ')
          ..write('thesis: $thesis, ')
          ..write('supervisorId: $supervisorId, ')
          ..write('secondarySupervisorId: $secondarySupervisorId, ')
          ..write('schoolEmail: $schoolEmail, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class TeachingRegistration extends Table
    with TableInfo<TeachingRegistration, TeachingRegistrationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TeachingRegistration(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'teacher_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES teacher(id)',
  );
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES course(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [teacherId, courseId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teaching_registration';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeachingRegistrationData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {teacherId, courseId};
  @override
  TeachingRegistrationData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeachingRegistrationData(
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_id'],
      )!,
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}course_id'],
      )!,
    );
  }

  @override
  TeachingRegistration createAlias(String alias) {
    return TeachingRegistration(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(teacher_id, course_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class TeachingRegistrationData extends DataClass
    implements Insertable<TeachingRegistrationData> {
  final int teacherId;
  final String courseId;
  const TeachingRegistrationData({
    required this.teacherId,
    required this.courseId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['teacher_id'] = Variable<int>(teacherId);
    map['course_id'] = Variable<String>(courseId);
    return map;
  }

  TeachingRegistrationCompanion toCompanion(bool nullToAbsent) {
    return TeachingRegistrationCompanion(
      teacherId: Value(teacherId),
      courseId: Value(courseId),
    );
  }

  factory TeachingRegistrationData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeachingRegistrationData(
      teacherId: serializer.fromJson<int>(json['teacher_id']),
      courseId: serializer.fromJson<String>(json['course_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'teacher_id': serializer.toJson<int>(teacherId),
      'course_id': serializer.toJson<String>(courseId),
    };
  }

  TeachingRegistrationData copyWith({int? teacherId, String? courseId}) =>
      TeachingRegistrationData(
        teacherId: teacherId ?? this.teacherId,
        courseId: courseId ?? this.courseId,
      );
  TeachingRegistrationData copyWithCompanion(
    TeachingRegistrationCompanion data,
  ) {
    return TeachingRegistrationData(
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeachingRegistrationData(')
          ..write('teacherId: $teacherId, ')
          ..write('courseId: $courseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(teacherId, courseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeachingRegistrationData &&
          other.teacherId == this.teacherId &&
          other.courseId == this.courseId);
}

class TeachingRegistrationCompanion
    extends UpdateCompanion<TeachingRegistrationData> {
  final Value<int> teacherId;
  final Value<String> courseId;
  final Value<int> rowid;
  const TeachingRegistrationCompanion({
    this.teacherId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TeachingRegistrationCompanion.insert({
    required int teacherId,
    required String courseId,
    this.rowid = const Value.absent(),
  }) : teacherId = Value(teacherId),
       courseId = Value(courseId);
  static Insertable<TeachingRegistrationData> custom({
    Expression<int>? teacherId,
    Expression<String>? courseId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (teacherId != null) 'teacher_id': teacherId,
      if (courseId != null) 'course_id': courseId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TeachingRegistrationCompanion copyWith({
    Value<int>? teacherId,
    Value<String>? courseId,
    Value<int>? rowid,
  }) {
    return TeachingRegistrationCompanion(
      teacherId: teacherId ?? this.teacherId,
      courseId: courseId ?? this.courseId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeachingRegistrationCompanion(')
          ..write('teacherId: $teacherId, ')
          ..write('courseId: $courseId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CourseLimiting extends Table
    with TableInfo<CourseLimiting, CourseLimitingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CourseLimiting(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES course(id)',
  );
  static const VerificationMeta _semesterIdMeta = const VerificationMeta(
    'semesterId',
  );
  late final GeneratedColumn<String> semesterId = GeneratedColumn<String>(
    'semester_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES semester(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [courseId, semesterId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_limiting';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseLimitingData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('semester_id')) {
      context.handle(
        _semesterIdMeta,
        semesterId.isAcceptableOrUnknown(data['semester_id']!, _semesterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semesterIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {courseId, semesterId};
  @override
  CourseLimitingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseLimitingData(
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}course_id'],
      )!,
      semesterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}semester_id'],
      )!,
    );
  }

  @override
  CourseLimiting createAlias(String alias) {
    return CourseLimiting(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(course_id, semester_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CourseLimitingData extends DataClass
    implements Insertable<CourseLimitingData> {
  final int courseId;
  final String semesterId;
  const CourseLimitingData({required this.courseId, required this.semesterId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['course_id'] = Variable<int>(courseId);
    map['semester_id'] = Variable<String>(semesterId);
    return map;
  }

  CourseLimitingCompanion toCompanion(bool nullToAbsent) {
    return CourseLimitingCompanion(
      courseId: Value(courseId),
      semesterId: Value(semesterId),
    );
  }

  factory CourseLimitingData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseLimitingData(
      courseId: serializer.fromJson<int>(json['course_id']),
      semesterId: serializer.fromJson<String>(json['semester_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'course_id': serializer.toJson<int>(courseId),
      'semester_id': serializer.toJson<String>(semesterId),
    };
  }

  CourseLimitingData copyWith({int? courseId, String? semesterId}) =>
      CourseLimitingData(
        courseId: courseId ?? this.courseId,
        semesterId: semesterId ?? this.semesterId,
      );
  CourseLimitingData copyWithCompanion(CourseLimitingCompanion data) {
    return CourseLimitingData(
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      semesterId: data.semesterId.present
          ? data.semesterId.value
          : this.semesterId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseLimitingData(')
          ..write('courseId: $courseId, ')
          ..write('semesterId: $semesterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(courseId, semesterId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseLimitingData &&
          other.courseId == this.courseId &&
          other.semesterId == this.semesterId);
}

class CourseLimitingCompanion extends UpdateCompanion<CourseLimitingData> {
  final Value<int> courseId;
  final Value<String> semesterId;
  final Value<int> rowid;
  const CourseLimitingCompanion({
    this.courseId = const Value.absent(),
    this.semesterId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseLimitingCompanion.insert({
    required int courseId,
    required String semesterId,
    this.rowid = const Value.absent(),
  }) : courseId = Value(courseId),
       semesterId = Value(semesterId);
  static Insertable<CourseLimitingData> custom({
    Expression<int>? courseId,
    Expression<String>? semesterId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (courseId != null) 'course_id': courseId,
      if (semesterId != null) 'semester_id': semesterId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseLimitingCompanion copyWith({
    Value<int>? courseId,
    Value<String>? semesterId,
    Value<int>? rowid,
  }) {
    return CourseLimitingCompanion(
      courseId: courseId ?? this.courseId,
      semesterId: semesterId ?? this.semesterId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (semesterId.present) {
      map['semester_id'] = Variable<String>(semesterId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseLimitingCompanion(')
          ..write('courseId: $courseId, ')
          ..write('semesterId: $semesterId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CourseClass extends Table with TableInfo<CourseClass, CourseClassData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CourseClass(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _classIdMeta = const VerificationMeta(
    'classId',
  );
  late final GeneratedColumn<String> classId = GeneratedColumn<String>(
    'maLopHoc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
    'maHocPhan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'idGiangVien',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _registrationCountMeta = const VerificationMeta(
    'registrationCount',
  );
  late final GeneratedColumn<int> registrationCount = GeneratedColumn<int>(
    'soLuongDangKy',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _accessUrlMeta = const VerificationMeta(
    'accessUrl',
  );
  late final GeneratedColumn<String> accessUrl = GeneratedColumn<String>(
    'urlTruyCap',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _customBeginDateMeta = const VerificationMeta(
    'customBeginDate',
  );
  late final GeneratedColumn<DateTime> customBeginDate =
      GeneratedColumn<DateTime>(
        'customBeginDate',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const VerificationMeta _customEndDateMeta = const VerificationMeta(
    'customEndDate',
  );
  late final GeneratedColumn<DateTime> customEndDate =
      GeneratedColumn<DateTime>(
        'customEndDate',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const VerificationMeta _semesterMeta = const VerificationMeta(
    'semester',
  );
  late final GeneratedColumn<String> semester = GeneratedColumn<String>(
    'hocKy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _classroomMeta = const VerificationMeta(
    'classroom',
  );
  late final GeneratedColumn<String> classroom = GeneratedColumn<String>(
    'phongHoc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumnWithTypeConverter<enums.DayOfWeek?, int> dayOfWeek =
      GeneratedColumn<int>(
        'ngayHoc',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        $customConstraints: '',
      ).withConverter<enums.DayOfWeek?>(CourseClass.$converterdayOfWeekn);
  static const VerificationMeta _startPeriodMeta = const VerificationMeta(
    'startPeriod',
  );
  late final GeneratedColumn<int> startPeriod = GeneratedColumn<int>(
    'tietBatDau',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _endPeriodMeta = const VerificationMeta(
    'endPeriod',
  );
  late final GeneratedColumn<int> endPeriod = GeneratedColumn<int>(
    'tietKetThuc',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumnWithTypeConverter<enums.CourseClassStatus?, int>
  status = GeneratedColumn<int>(
    'trangThai',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<enums.CourseClassStatus?>(CourseClass.$converterstatusn);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    classId,
    courseId,
    teacherId,
    registrationCount,
    accessUrl,
    customBeginDate,
    customEndDate,
    semester,
    classroom,
    dayOfWeek,
    startPeriod,
    endPeriod,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_class';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseClassData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('maLopHoc')) {
      context.handle(
        _classIdMeta,
        classId.isAcceptableOrUnknown(data['maLopHoc']!, _classIdMeta),
      );
    } else if (isInserting) {
      context.missing(_classIdMeta);
    }
    if (data.containsKey('maHocPhan')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['maHocPhan']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('idGiangVien')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['idGiangVien']!, _teacherIdMeta),
      );
    }
    if (data.containsKey('soLuongDangKy')) {
      context.handle(
        _registrationCountMeta,
        registrationCount.isAcceptableOrUnknown(
          data['soLuongDangKy']!,
          _registrationCountMeta,
        ),
      );
    }
    if (data.containsKey('urlTruyCap')) {
      context.handle(
        _accessUrlMeta,
        accessUrl.isAcceptableOrUnknown(data['urlTruyCap']!, _accessUrlMeta),
      );
    }
    if (data.containsKey('customBeginDate')) {
      context.handle(
        _customBeginDateMeta,
        customBeginDate.isAcceptableOrUnknown(
          data['customBeginDate']!,
          _customBeginDateMeta,
        ),
      );
    }
    if (data.containsKey('customEndDate')) {
      context.handle(
        _customEndDateMeta,
        customEndDate.isAcceptableOrUnknown(
          data['customEndDate']!,
          _customEndDateMeta,
        ),
      );
    }
    if (data.containsKey('hocKy')) {
      context.handle(
        _semesterMeta,
        semester.isAcceptableOrUnknown(data['hocKy']!, _semesterMeta),
      );
    } else if (isInserting) {
      context.missing(_semesterMeta);
    }
    if (data.containsKey('phongHoc')) {
      context.handle(
        _classroomMeta,
        classroom.isAcceptableOrUnknown(data['phongHoc']!, _classroomMeta),
      );
    }
    if (data.containsKey('tietBatDau')) {
      context.handle(
        _startPeriodMeta,
        startPeriod.isAcceptableOrUnknown(
          data['tietBatDau']!,
          _startPeriodMeta,
        ),
      );
    }
    if (data.containsKey('tietKetThuc')) {
      context.handle(
        _endPeriodMeta,
        endPeriod.isAcceptableOrUnknown(data['tietKetThuc']!, _endPeriodMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseClassData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseClassData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      classId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}maLopHoc'],
      )!,
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}maHocPhan'],
      )!,
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idGiangVien'],
      ),
      registrationCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}soLuongDangKy'],
      )!,
      accessUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}urlTruyCap'],
      ),
      customBeginDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}customBeginDate'],
      ),
      customEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}customEndDate'],
      ),
      semester: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hocKy'],
      )!,
      classroom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phongHoc'],
      ),
      dayOfWeek: CourseClass.$converterdayOfWeekn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}ngayHoc'],
        ),
      ),
      startPeriod: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tietBatDau'],
      ),
      endPeriod: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tietKetThuc'],
      ),
      status: CourseClass.$converterstatusn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}trangThai'],
        ),
      ),
    );
  }

  @override
  CourseClass createAlias(String alias) {
    return CourseClass(attachedDatabase, alias);
  }

  static TypeConverter<enums.DayOfWeek, int> $converterdayOfWeek =
      const enums.DayOfWeekConverter();
  static TypeConverter<enums.DayOfWeek?, int?> $converterdayOfWeekn =
      NullAwareTypeConverter.wrap($converterdayOfWeek);
  static TypeConverter<enums.CourseClassStatus, int> $converterstatus =
      const enums.CourseClassStatusConverter();
  static TypeConverter<enums.CourseClassStatus?, int?> $converterstatusn =
      NullAwareTypeConverter.wrap($converterstatus);
  @override
  bool get dontWriteConstraints => true;
}

class CourseClassData extends DataClass implements Insertable<CourseClassData> {
  final int id;
  final String classId;
  final String courseId;
  final int? teacherId;
  final int registrationCount;
  final String? accessUrl;
  final DateTime? customBeginDate;
  final DateTime? customEndDate;
  final String semester;
  final String? classroom;
  final enums.DayOfWeek? dayOfWeek;
  final int? startPeriod;
  final int? endPeriod;
  final enums.CourseClassStatus? status;
  const CourseClassData({
    required this.id,
    required this.classId,
    required this.courseId,
    this.teacherId,
    required this.registrationCount,
    this.accessUrl,
    this.customBeginDate,
    this.customEndDate,
    required this.semester,
    this.classroom,
    this.dayOfWeek,
    this.startPeriod,
    this.endPeriod,
    this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['maLopHoc'] = Variable<String>(classId);
    map['maHocPhan'] = Variable<String>(courseId);
    if (!nullToAbsent || teacherId != null) {
      map['idGiangVien'] = Variable<int>(teacherId);
    }
    map['soLuongDangKy'] = Variable<int>(registrationCount);
    if (!nullToAbsent || accessUrl != null) {
      map['urlTruyCap'] = Variable<String>(accessUrl);
    }
    if (!nullToAbsent || customBeginDate != null) {
      map['customBeginDate'] = Variable<DateTime>(customBeginDate);
    }
    if (!nullToAbsent || customEndDate != null) {
      map['customEndDate'] = Variable<DateTime>(customEndDate);
    }
    map['hocKy'] = Variable<String>(semester);
    if (!nullToAbsent || classroom != null) {
      map['phongHoc'] = Variable<String>(classroom);
    }
    if (!nullToAbsent || dayOfWeek != null) {
      map['ngayHoc'] = Variable<int>(
        CourseClass.$converterdayOfWeekn.toSql(dayOfWeek),
      );
    }
    if (!nullToAbsent || startPeriod != null) {
      map['tietBatDau'] = Variable<int>(startPeriod);
    }
    if (!nullToAbsent || endPeriod != null) {
      map['tietKetThuc'] = Variable<int>(endPeriod);
    }
    if (!nullToAbsent || status != null) {
      map['trangThai'] = Variable<int>(
        CourseClass.$converterstatusn.toSql(status),
      );
    }
    return map;
  }

  CourseClassCompanion toCompanion(bool nullToAbsent) {
    return CourseClassCompanion(
      id: Value(id),
      classId: Value(classId),
      courseId: Value(courseId),
      teacherId: teacherId == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherId),
      registrationCount: Value(registrationCount),
      accessUrl: accessUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(accessUrl),
      customBeginDate: customBeginDate == null && nullToAbsent
          ? const Value.absent()
          : Value(customBeginDate),
      customEndDate: customEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(customEndDate),
      semester: Value(semester),
      classroom: classroom == null && nullToAbsent
          ? const Value.absent()
          : Value(classroom),
      dayOfWeek: dayOfWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(dayOfWeek),
      startPeriod: startPeriod == null && nullToAbsent
          ? const Value.absent()
          : Value(startPeriod),
      endPeriod: endPeriod == null && nullToAbsent
          ? const Value.absent()
          : Value(endPeriod),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
    );
  }

  factory CourseClassData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseClassData(
      id: serializer.fromJson<int>(json['id']),
      classId: serializer.fromJson<String>(json['maLopHoc']),
      courseId: serializer.fromJson<String>(json['maHocPhan']),
      teacherId: serializer.fromJson<int?>(json['idGiangVien']),
      registrationCount: serializer.fromJson<int>(json['soLuongDangKy']),
      accessUrl: serializer.fromJson<String?>(json['urlTruyCap']),
      customBeginDate: serializer.fromJson<DateTime?>(json['customBeginDate']),
      customEndDate: serializer.fromJson<DateTime?>(json['customEndDate']),
      semester: serializer.fromJson<String>(json['hocKy']),
      classroom: serializer.fromJson<String?>(json['phongHoc']),
      dayOfWeek: serializer.fromJson<enums.DayOfWeek?>(json['ngayHoc']),
      startPeriod: serializer.fromJson<int?>(json['tietBatDau']),
      endPeriod: serializer.fromJson<int?>(json['tietKetThuc']),
      status: serializer.fromJson<enums.CourseClassStatus?>(json['trangThai']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'maLopHoc': serializer.toJson<String>(classId),
      'maHocPhan': serializer.toJson<String>(courseId),
      'idGiangVien': serializer.toJson<int?>(teacherId),
      'soLuongDangKy': serializer.toJson<int>(registrationCount),
      'urlTruyCap': serializer.toJson<String?>(accessUrl),
      'customBeginDate': serializer.toJson<DateTime?>(customBeginDate),
      'customEndDate': serializer.toJson<DateTime?>(customEndDate),
      'hocKy': serializer.toJson<String>(semester),
      'phongHoc': serializer.toJson<String?>(classroom),
      'ngayHoc': serializer.toJson<enums.DayOfWeek?>(dayOfWeek),
      'tietBatDau': serializer.toJson<int?>(startPeriod),
      'tietKetThuc': serializer.toJson<int?>(endPeriod),
      'trangThai': serializer.toJson<enums.CourseClassStatus?>(status),
    };
  }

  CourseClassData copyWith({
    int? id,
    String? classId,
    String? courseId,
    Value<int?> teacherId = const Value.absent(),
    int? registrationCount,
    Value<String?> accessUrl = const Value.absent(),
    Value<DateTime?> customBeginDate = const Value.absent(),
    Value<DateTime?> customEndDate = const Value.absent(),
    String? semester,
    Value<String?> classroom = const Value.absent(),
    Value<enums.DayOfWeek?> dayOfWeek = const Value.absent(),
    Value<int?> startPeriod = const Value.absent(),
    Value<int?> endPeriod = const Value.absent(),
    Value<enums.CourseClassStatus?> status = const Value.absent(),
  }) => CourseClassData(
    id: id ?? this.id,
    classId: classId ?? this.classId,
    courseId: courseId ?? this.courseId,
    teacherId: teacherId.present ? teacherId.value : this.teacherId,
    registrationCount: registrationCount ?? this.registrationCount,
    accessUrl: accessUrl.present ? accessUrl.value : this.accessUrl,
    customBeginDate: customBeginDate.present
        ? customBeginDate.value
        : this.customBeginDate,
    customEndDate: customEndDate.present
        ? customEndDate.value
        : this.customEndDate,
    semester: semester ?? this.semester,
    classroom: classroom.present ? classroom.value : this.classroom,
    dayOfWeek: dayOfWeek.present ? dayOfWeek.value : this.dayOfWeek,
    startPeriod: startPeriod.present ? startPeriod.value : this.startPeriod,
    endPeriod: endPeriod.present ? endPeriod.value : this.endPeriod,
    status: status.present ? status.value : this.status,
  );
  CourseClassData copyWithCompanion(CourseClassCompanion data) {
    return CourseClassData(
      id: data.id.present ? data.id.value : this.id,
      classId: data.classId.present ? data.classId.value : this.classId,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      registrationCount: data.registrationCount.present
          ? data.registrationCount.value
          : this.registrationCount,
      accessUrl: data.accessUrl.present ? data.accessUrl.value : this.accessUrl,
      customBeginDate: data.customBeginDate.present
          ? data.customBeginDate.value
          : this.customBeginDate,
      customEndDate: data.customEndDate.present
          ? data.customEndDate.value
          : this.customEndDate,
      semester: data.semester.present ? data.semester.value : this.semester,
      classroom: data.classroom.present ? data.classroom.value : this.classroom,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      startPeriod: data.startPeriod.present
          ? data.startPeriod.value
          : this.startPeriod,
      endPeriod: data.endPeriod.present ? data.endPeriod.value : this.endPeriod,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseClassData(')
          ..write('id: $id, ')
          ..write('classId: $classId, ')
          ..write('courseId: $courseId, ')
          ..write('teacherId: $teacherId, ')
          ..write('registrationCount: $registrationCount, ')
          ..write('accessUrl: $accessUrl, ')
          ..write('customBeginDate: $customBeginDate, ')
          ..write('customEndDate: $customEndDate, ')
          ..write('semester: $semester, ')
          ..write('classroom: $classroom, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('startPeriod: $startPeriod, ')
          ..write('endPeriod: $endPeriod, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    classId,
    courseId,
    teacherId,
    registrationCount,
    accessUrl,
    customBeginDate,
    customEndDate,
    semester,
    classroom,
    dayOfWeek,
    startPeriod,
    endPeriod,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseClassData &&
          other.id == this.id &&
          other.classId == this.classId &&
          other.courseId == this.courseId &&
          other.teacherId == this.teacherId &&
          other.registrationCount == this.registrationCount &&
          other.accessUrl == this.accessUrl &&
          other.customBeginDate == this.customBeginDate &&
          other.customEndDate == this.customEndDate &&
          other.semester == this.semester &&
          other.classroom == this.classroom &&
          other.dayOfWeek == this.dayOfWeek &&
          other.startPeriod == this.startPeriod &&
          other.endPeriod == this.endPeriod &&
          other.status == this.status);
}

class CourseClassCompanion extends UpdateCompanion<CourseClassData> {
  final Value<int> id;
  final Value<String> classId;
  final Value<String> courseId;
  final Value<int?> teacherId;
  final Value<int> registrationCount;
  final Value<String?> accessUrl;
  final Value<DateTime?> customBeginDate;
  final Value<DateTime?> customEndDate;
  final Value<String> semester;
  final Value<String?> classroom;
  final Value<enums.DayOfWeek?> dayOfWeek;
  final Value<int?> startPeriod;
  final Value<int?> endPeriod;
  final Value<enums.CourseClassStatus?> status;
  const CourseClassCompanion({
    this.id = const Value.absent(),
    this.classId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.registrationCount = const Value.absent(),
    this.accessUrl = const Value.absent(),
    this.customBeginDate = const Value.absent(),
    this.customEndDate = const Value.absent(),
    this.semester = const Value.absent(),
    this.classroom = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.startPeriod = const Value.absent(),
    this.endPeriod = const Value.absent(),
    this.status = const Value.absent(),
  });
  CourseClassCompanion.insert({
    this.id = const Value.absent(),
    required String classId,
    required String courseId,
    this.teacherId = const Value.absent(),
    this.registrationCount = const Value.absent(),
    this.accessUrl = const Value.absent(),
    this.customBeginDate = const Value.absent(),
    this.customEndDate = const Value.absent(),
    required String semester,
    this.classroom = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.startPeriod = const Value.absent(),
    this.endPeriod = const Value.absent(),
    this.status = const Value.absent(),
  }) : classId = Value(classId),
       courseId = Value(courseId),
       semester = Value(semester);
  static Insertable<CourseClassData> custom({
    Expression<int>? id,
    Expression<String>? classId,
    Expression<String>? courseId,
    Expression<int>? teacherId,
    Expression<int>? registrationCount,
    Expression<String>? accessUrl,
    Expression<DateTime>? customBeginDate,
    Expression<DateTime>? customEndDate,
    Expression<String>? semester,
    Expression<String>? classroom,
    Expression<int>? dayOfWeek,
    Expression<int>? startPeriod,
    Expression<int>? endPeriod,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (classId != null) 'maLopHoc': classId,
      if (courseId != null) 'maHocPhan': courseId,
      if (teacherId != null) 'idGiangVien': teacherId,
      if (registrationCount != null) 'soLuongDangKy': registrationCount,
      if (accessUrl != null) 'urlTruyCap': accessUrl,
      if (customBeginDate != null) 'customBeginDate': customBeginDate,
      if (customEndDate != null) 'customEndDate': customEndDate,
      if (semester != null) 'hocKy': semester,
      if (classroom != null) 'phongHoc': classroom,
      if (dayOfWeek != null) 'ngayHoc': dayOfWeek,
      if (startPeriod != null) 'tietBatDau': startPeriod,
      if (endPeriod != null) 'tietKetThuc': endPeriod,
      if (status != null) 'trangThai': status,
    });
  }

  CourseClassCompanion copyWith({
    Value<int>? id,
    Value<String>? classId,
    Value<String>? courseId,
    Value<int?>? teacherId,
    Value<int>? registrationCount,
    Value<String?>? accessUrl,
    Value<DateTime?>? customBeginDate,
    Value<DateTime?>? customEndDate,
    Value<String>? semester,
    Value<String?>? classroom,
    Value<enums.DayOfWeek?>? dayOfWeek,
    Value<int?>? startPeriod,
    Value<int?>? endPeriod,
    Value<enums.CourseClassStatus?>? status,
  }) {
    return CourseClassCompanion(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      courseId: courseId ?? this.courseId,
      teacherId: teacherId ?? this.teacherId,
      registrationCount: registrationCount ?? this.registrationCount,
      accessUrl: accessUrl ?? this.accessUrl,
      customBeginDate: customBeginDate ?? this.customBeginDate,
      customEndDate: customEndDate ?? this.customEndDate,
      semester: semester ?? this.semester,
      classroom: classroom ?? this.classroom,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startPeriod: startPeriod ?? this.startPeriod,
      endPeriod: endPeriod ?? this.endPeriod,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (classId.present) {
      map['maLopHoc'] = Variable<String>(classId.value);
    }
    if (courseId.present) {
      map['maHocPhan'] = Variable<String>(courseId.value);
    }
    if (teacherId.present) {
      map['idGiangVien'] = Variable<int>(teacherId.value);
    }
    if (registrationCount.present) {
      map['soLuongDangKy'] = Variable<int>(registrationCount.value);
    }
    if (accessUrl.present) {
      map['urlTruyCap'] = Variable<String>(accessUrl.value);
    }
    if (customBeginDate.present) {
      map['customBeginDate'] = Variable<DateTime>(customBeginDate.value);
    }
    if (customEndDate.present) {
      map['customEndDate'] = Variable<DateTime>(customEndDate.value);
    }
    if (semester.present) {
      map['hocKy'] = Variable<String>(semester.value);
    }
    if (classroom.present) {
      map['phongHoc'] = Variable<String>(classroom.value);
    }
    if (dayOfWeek.present) {
      map['ngayHoc'] = Variable<int>(
        CourseClass.$converterdayOfWeekn.toSql(dayOfWeek.value),
      );
    }
    if (startPeriod.present) {
      map['tietBatDau'] = Variable<int>(startPeriod.value);
    }
    if (endPeriod.present) {
      map['tietKetThuc'] = Variable<int>(endPeriod.value);
    }
    if (status.present) {
      map['trangThai'] = Variable<int>(
        CourseClass.$converterstatusn.toSql(status.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseClassCompanion(')
          ..write('id: $id, ')
          ..write('classId: $classId, ')
          ..write('courseId: $courseId, ')
          ..write('teacherId: $teacherId, ')
          ..write('registrationCount: $registrationCount, ')
          ..write('accessUrl: $accessUrl, ')
          ..write('customBeginDate: $customBeginDate, ')
          ..write('customEndDate: $customEndDate, ')
          ..write('semester: $semester, ')
          ..write('classroom: $classroom, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('startPeriod: $startPeriod, ')
          ..write('endPeriod: $endPeriod, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class TeachingAssignment extends Table
    with TableInfo<TeachingAssignment, TeachingAssignmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TeachingAssignment(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _classIdMeta = const VerificationMeta(
    'classId',
  );
  late final GeneratedColumn<int> classId = GeneratedColumn<int>(
    'class_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES course_class(id)',
  );
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'teacher_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES teacher(id)',
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1.0',
    defaultValue: const CustomExpression('1.0'),
  );
  @override
  List<GeneratedColumn> get $columns => [classId, teacherId, sortOrder, weight];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teaching_assignment';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeachingAssignmentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('class_id')) {
      context.handle(
        _classIdMeta,
        classId.isAcceptableOrUnknown(data['class_id']!, _classIdMeta),
      );
    } else if (isInserting) {
      context.missing(_classIdMeta);
    }
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {classId, teacherId};
  @override
  TeachingAssignmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeachingAssignmentData(
      classId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}class_id'],
      )!,
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_id'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
    );
  }

  @override
  TeachingAssignment createAlias(String alias) {
    return TeachingAssignment(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(class_id, teacher_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class TeachingAssignmentData extends DataClass
    implements Insertable<TeachingAssignmentData> {
  final int classId;
  final int teacherId;
  final int sortOrder;
  final double weight;
  const TeachingAssignmentData({
    required this.classId,
    required this.teacherId,
    required this.sortOrder,
    required this.weight,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['class_id'] = Variable<int>(classId);
    map['teacher_id'] = Variable<int>(teacherId);
    map['sort_order'] = Variable<int>(sortOrder);
    map['weight'] = Variable<double>(weight);
    return map;
  }

  TeachingAssignmentCompanion toCompanion(bool nullToAbsent) {
    return TeachingAssignmentCompanion(
      classId: Value(classId),
      teacherId: Value(teacherId),
      sortOrder: Value(sortOrder),
      weight: Value(weight),
    );
  }

  factory TeachingAssignmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeachingAssignmentData(
      classId: serializer.fromJson<int>(json['class_id']),
      teacherId: serializer.fromJson<int>(json['teacher_id']),
      sortOrder: serializer.fromJson<int>(json['sort_order']),
      weight: serializer.fromJson<double>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'class_id': serializer.toJson<int>(classId),
      'teacher_id': serializer.toJson<int>(teacherId),
      'sort_order': serializer.toJson<int>(sortOrder),
      'weight': serializer.toJson<double>(weight),
    };
  }

  TeachingAssignmentData copyWith({
    int? classId,
    int? teacherId,
    int? sortOrder,
    double? weight,
  }) => TeachingAssignmentData(
    classId: classId ?? this.classId,
    teacherId: teacherId ?? this.teacherId,
    sortOrder: sortOrder ?? this.sortOrder,
    weight: weight ?? this.weight,
  );
  TeachingAssignmentData copyWithCompanion(TeachingAssignmentCompanion data) {
    return TeachingAssignmentData(
      classId: data.classId.present ? data.classId.value : this.classId,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      weight: data.weight.present ? data.weight.value : this.weight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeachingAssignmentData(')
          ..write('classId: $classId, ')
          ..write('teacherId: $teacherId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(classId, teacherId, sortOrder, weight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeachingAssignmentData &&
          other.classId == this.classId &&
          other.teacherId == this.teacherId &&
          other.sortOrder == this.sortOrder &&
          other.weight == this.weight);
}

class TeachingAssignmentCompanion
    extends UpdateCompanion<TeachingAssignmentData> {
  final Value<int> classId;
  final Value<int> teacherId;
  final Value<int> sortOrder;
  final Value<double> weight;
  final Value<int> rowid;
  const TeachingAssignmentCompanion({
    this.classId = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.weight = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TeachingAssignmentCompanion.insert({
    required int classId,
    required int teacherId,
    this.sortOrder = const Value.absent(),
    this.weight = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : classId = Value(classId),
       teacherId = Value(teacherId);
  static Insertable<TeachingAssignmentData> custom({
    Expression<int>? classId,
    Expression<int>? teacherId,
    Expression<int>? sortOrder,
    Expression<double>? weight,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (classId != null) 'class_id': classId,
      if (teacherId != null) 'teacher_id': teacherId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (weight != null) 'weight': weight,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TeachingAssignmentCompanion copyWith({
    Value<int>? classId,
    Value<int>? teacherId,
    Value<int>? sortOrder,
    Value<double>? weight,
    Value<int>? rowid,
  }) {
    return TeachingAssignmentCompanion(
      classId: classId ?? this.classId,
      teacherId: teacherId ?? this.teacherId,
      sortOrder: sortOrder ?? this.sortOrder,
      weight: weight ?? this.weight,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (classId.present) {
      map['class_id'] = Variable<int>(classId.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeachingAssignmentCompanion(')
          ..write('classId: $classId, ')
          ..write('teacherId: $teacherId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('weight: $weight, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class StudyRegistration extends Table
    with TableInfo<StudyRegistration, StudyRegistrationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  StudyRegistration(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _classIdMeta = const VerificationMeta(
    'classId',
  );
  late final GeneratedColumn<int> classId = GeneratedColumn<int>(
    'class_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES course_class(id)',
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES student(id)',
  );
  static const VerificationMeta _midTermGradeMeta = const VerificationMeta(
    'midTermGrade',
  );
  late final GeneratedColumn<double> midTermGrade = GeneratedColumn<double>(
    'mid_term_grade',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _finalTermGradeMeta = const VerificationMeta(
    'finalTermGrade',
  );
  late final GeneratedColumn<double> finalTermGrade = GeneratedColumn<double>(
    'final_term_grade',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    classId,
    studentId,
    midTermGrade,
    finalTermGrade,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_registration';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudyRegistrationData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('class_id')) {
      context.handle(
        _classIdMeta,
        classId.isAcceptableOrUnknown(data['class_id']!, _classIdMeta),
      );
    } else if (isInserting) {
      context.missing(_classIdMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('mid_term_grade')) {
      context.handle(
        _midTermGradeMeta,
        midTermGrade.isAcceptableOrUnknown(
          data['mid_term_grade']!,
          _midTermGradeMeta,
        ),
      );
    }
    if (data.containsKey('final_term_grade')) {
      context.handle(
        _finalTermGradeMeta,
        finalTermGrade.isAcceptableOrUnknown(
          data['final_term_grade']!,
          _finalTermGradeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {classId, studentId};
  @override
  StudyRegistrationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudyRegistrationData(
      classId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}class_id'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_id'],
      )!,
      midTermGrade: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mid_term_grade'],
      ),
      finalTermGrade: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}final_term_grade'],
      ),
    );
  }

  @override
  StudyRegistration createAlias(String alias) {
    return StudyRegistration(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(class_id, student_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class StudyRegistrationData extends DataClass
    implements Insertable<StudyRegistrationData> {
  final int classId;
  final int studentId;
  final double? midTermGrade;
  final double? finalTermGrade;
  const StudyRegistrationData({
    required this.classId,
    required this.studentId,
    this.midTermGrade,
    this.finalTermGrade,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['class_id'] = Variable<int>(classId);
    map['student_id'] = Variable<int>(studentId);
    if (!nullToAbsent || midTermGrade != null) {
      map['mid_term_grade'] = Variable<double>(midTermGrade);
    }
    if (!nullToAbsent || finalTermGrade != null) {
      map['final_term_grade'] = Variable<double>(finalTermGrade);
    }
    return map;
  }

  StudyRegistrationCompanion toCompanion(bool nullToAbsent) {
    return StudyRegistrationCompanion(
      classId: Value(classId),
      studentId: Value(studentId),
      midTermGrade: midTermGrade == null && nullToAbsent
          ? const Value.absent()
          : Value(midTermGrade),
      finalTermGrade: finalTermGrade == null && nullToAbsent
          ? const Value.absent()
          : Value(finalTermGrade),
    );
  }

  factory StudyRegistrationData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudyRegistrationData(
      classId: serializer.fromJson<int>(json['class_id']),
      studentId: serializer.fromJson<int>(json['student_id']),
      midTermGrade: serializer.fromJson<double?>(json['mid_term_grade']),
      finalTermGrade: serializer.fromJson<double?>(json['final_term_grade']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'class_id': serializer.toJson<int>(classId),
      'student_id': serializer.toJson<int>(studentId),
      'mid_term_grade': serializer.toJson<double?>(midTermGrade),
      'final_term_grade': serializer.toJson<double?>(finalTermGrade),
    };
  }

  StudyRegistrationData copyWith({
    int? classId,
    int? studentId,
    Value<double?> midTermGrade = const Value.absent(),
    Value<double?> finalTermGrade = const Value.absent(),
  }) => StudyRegistrationData(
    classId: classId ?? this.classId,
    studentId: studentId ?? this.studentId,
    midTermGrade: midTermGrade.present ? midTermGrade.value : this.midTermGrade,
    finalTermGrade: finalTermGrade.present
        ? finalTermGrade.value
        : this.finalTermGrade,
  );
  StudyRegistrationData copyWithCompanion(StudyRegistrationCompanion data) {
    return StudyRegistrationData(
      classId: data.classId.present ? data.classId.value : this.classId,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      midTermGrade: data.midTermGrade.present
          ? data.midTermGrade.value
          : this.midTermGrade,
      finalTermGrade: data.finalTermGrade.present
          ? data.finalTermGrade.value
          : this.finalTermGrade,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudyRegistrationData(')
          ..write('classId: $classId, ')
          ..write('studentId: $studentId, ')
          ..write('midTermGrade: $midTermGrade, ')
          ..write('finalTermGrade: $finalTermGrade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(classId, studentId, midTermGrade, finalTermGrade);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudyRegistrationData &&
          other.classId == this.classId &&
          other.studentId == this.studentId &&
          other.midTermGrade == this.midTermGrade &&
          other.finalTermGrade == this.finalTermGrade);
}

class StudyRegistrationCompanion
    extends UpdateCompanion<StudyRegistrationData> {
  final Value<int> classId;
  final Value<int> studentId;
  final Value<double?> midTermGrade;
  final Value<double?> finalTermGrade;
  final Value<int> rowid;
  const StudyRegistrationCompanion({
    this.classId = const Value.absent(),
    this.studentId = const Value.absent(),
    this.midTermGrade = const Value.absent(),
    this.finalTermGrade = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudyRegistrationCompanion.insert({
    required int classId,
    required int studentId,
    this.midTermGrade = const Value.absent(),
    this.finalTermGrade = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : classId = Value(classId),
       studentId = Value(studentId);
  static Insertable<StudyRegistrationData> custom({
    Expression<int>? classId,
    Expression<int>? studentId,
    Expression<double>? midTermGrade,
    Expression<double>? finalTermGrade,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (classId != null) 'class_id': classId,
      if (studentId != null) 'student_id': studentId,
      if (midTermGrade != null) 'mid_term_grade': midTermGrade,
      if (finalTermGrade != null) 'final_term_grade': finalTermGrade,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudyRegistrationCompanion copyWith({
    Value<int>? classId,
    Value<int>? studentId,
    Value<double?>? midTermGrade,
    Value<double?>? finalTermGrade,
    Value<int>? rowid,
  }) {
    return StudyRegistrationCompanion(
      classId: classId ?? this.classId,
      studentId: studentId ?? this.studentId,
      midTermGrade: midTermGrade ?? this.midTermGrade,
      finalTermGrade: finalTermGrade ?? this.finalTermGrade,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (classId.present) {
      map['class_id'] = Variable<int>(classId.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (midTermGrade.present) {
      map['mid_term_grade'] = Variable<double>(midTermGrade.value);
    }
    if (finalTermGrade.present) {
      map['final_term_grade'] = Variable<double>(finalTermGrade.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudyRegistrationCompanion(')
          ..write('classId: $classId, ')
          ..write('studentId: $studentId, ')
          ..write('midTermGrade: $midTermGrade, ')
          ..write('finalTermGrade: $finalTermGrade, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final TeacherFts teacherFts = TeacherFts(this);
  late final TeacherGroup teacherGroup = TeacherGroup(this);
  late final Teacher teacher = Teacher(this);
  late final Trigger teacherFtsDelete = Trigger(
    'CREATE TRIGGER teacher_fts_delete AFTER DELETE ON teacher BEGIN DELETE FROM teacher_fts WHERE id = old.id;END',
    'teacher_fts_delete',
  );
  late final Trigger teacherFtsInsert = Trigger(
    'CREATE TRIGGER teacher_fts_insert AFTER INSERT ON teacher BEGIN INSERT INTO teacher_fts (id, name, university, falcuty, specialization, phone_number, work_email, personal_email, citizen_id, bank_account) VALUES (NEW.id, NEW.name, NEW.university, NEW.falcuty, NEW.specialization, NEW.phone_number, NEW.work_email, NEW.personal_email, NEW.citizen_id, NEW.bank_account);END',
    'teacher_fts_insert',
  );
  late final Trigger teacherFtsUpdate = Trigger(
    'CREATE TRIGGER teacher_fts_update AFTER UPDATE ON teacher BEGIN INSERT INTO teacher_fts (id, name, university, falcuty, specialization, phone_number, work_email, personal_email, citizen_id, bank_account) VALUES (NEW.id, NEW.name, NEW.university, NEW.falcuty, NEW.specialization, NEW.phone_number, NEW.work_email, NEW.personal_email, NEW.citizen_id, NEW.bank_account);END',
    'teacher_fts_update',
  );
  late final CourseFts courseFts = CourseFts(this);
  late final Course course = Course(this);
  late final Trigger courseFtsDelete = Trigger(
    'CREATE TRIGGER course_fts_delete AFTER DELETE ON course BEGIN DELETE FROM course_fts WHERE "rowid" = (SELECT "rowid" FROM course_fts WHERE id = old.id);END',
    'course_fts_delete',
  );
  late final Trigger courseFtsInsert = Trigger(
    'CREATE TRIGGER course_fts_insert AFTER INSERT ON course BEGIN INSERT INTO course_fts (id, vietnamese_name, english_name) VALUES (new.id, new.vietnamese_name, new.english_name);END',
    'course_fts_insert',
  );
  late final Trigger courseFtsUpdate = Trigger(
    'CREATE TRIGGER course_fts_update AFTER UPDATE ON course BEGIN DELETE FROM course_fts WHERE "rowid" = (SELECT "rowid" FROM course_fts WHERE id = old.id);INSERT INTO course_fts (id, vietnamese_name, english_name) VALUES (new.id, new.vietnamese_name, new.english_name);END',
    'course_fts_update',
  );
  late final ThesisFts thesisFts = ThesisFts(this);
  late final Preference preference = Preference(this);
  late final DocumentRole documentRole = DocumentRole(this);
  late final Document document = Document(this);
  late final Cohort cohort = Cohort(this);
  late final AdmissionCouncil admissionCouncil = AdmissionCouncil(this);
  late final Student student = Student(this);
  late final Semester semester = Semester(this);
  late final Thesis thesis = Thesis(this);
  late final AcademicGroup academicGroup = AcademicGroup(this);
  late final PhdCohort phdCohort = PhdCohort(this);
  late final PhdStudent phdStudent = PhdStudent(this);
  late final TeachingRegistration teachingRegistration = TeachingRegistration(
    this,
  );
  late final CourseLimiting courseLimiting = CourseLimiting(this);
  late final CourseClass courseClass = CourseClass(this);
  late final TeachingAssignment teachingAssignment = TeachingAssignment(this);
  late final StudyRegistration studyRegistration = StudyRegistration(this);
  Selectable<String> searchTeacherIdsFts(String var1) {
    return customSelect(
      'SELECT id FROM teacher_fts WHERE teacher_fts MATCH ?1',
      variables: [Variable<String>(var1)],
      readsFrom: {teacherFts},
    ).map((QueryRow row) => row.read<String>('id'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    teacherFts,
    teacherGroup,
    teacher,
    teacherFtsDelete,
    teacherFtsInsert,
    teacherFtsUpdate,
    courseFts,
    course,
    courseFtsDelete,
    courseFtsInsert,
    courseFtsUpdate,
    thesisFts,
    preference,
    documentRole,
    document,
    cohort,
    admissionCouncil,
    student,
    semester,
    thesis,
    academicGroup,
    phdCohort,
    phdStudent,
    teachingRegistration,
    courseLimiting,
    courseClass,
    teachingAssignment,
    studyRegistration,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'teacher',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('teacher_fts', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'teacher',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [TableUpdate('teacher_fts', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'teacher',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('teacher_fts', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'course',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('course_fts', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'course',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [TableUpdate('course_fts', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'course',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('course_fts', kind: UpdateKind.delete),
        TableUpdate('course_fts', kind: UpdateKind.insert),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cohort',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('student', kind: UpdateKind.update)],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $TeacherFtsCreateCompanionBuilder =
    TeacherFtsCompanion Function({
      required String id,
      required String name,
      required String university,
      required String falcuty,
      required String specialization,
      required String phoneNumber,
      required String workEmail,
      required String personalEmail,
      required String citizenId,
      required String bankAccount,
      Value<int> rowid,
    });
typedef $TeacherFtsUpdateCompanionBuilder =
    TeacherFtsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> university,
      Value<String> falcuty,
      Value<String> specialization,
      Value<String> phoneNumber,
      Value<String> workEmail,
      Value<String> personalEmail,
      Value<String> citizenId,
      Value<String> bankAccount,
      Value<int> rowid,
    });

class $TeacherFtsFilterComposer extends Composer<_$AppDatabase, TeacherFts> {
  $TeacherFtsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get university => $composableBuilder(
    column: $table.university,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get falcuty => $composableBuilder(
    column: $table.falcuty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialization => $composableBuilder(
    column: $table.specialization,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workEmail => $composableBuilder(
    column: $table.workEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get citizenId => $composableBuilder(
    column: $table.citizenId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankAccount => $composableBuilder(
    column: $table.bankAccount,
    builder: (column) => ColumnFilters(column),
  );
}

class $TeacherFtsOrderingComposer extends Composer<_$AppDatabase, TeacherFts> {
  $TeacherFtsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get university => $composableBuilder(
    column: $table.university,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get falcuty => $composableBuilder(
    column: $table.falcuty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialization => $composableBuilder(
    column: $table.specialization,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workEmail => $composableBuilder(
    column: $table.workEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get citizenId => $composableBuilder(
    column: $table.citizenId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankAccount => $composableBuilder(
    column: $table.bankAccount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $TeacherFtsAnnotationComposer
    extends Composer<_$AppDatabase, TeacherFts> {
  $TeacherFtsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get university => $composableBuilder(
    column: $table.university,
    builder: (column) => column,
  );

  GeneratedColumn<String> get falcuty =>
      $composableBuilder(column: $table.falcuty, builder: (column) => column);

  GeneratedColumn<String> get specialization => $composableBuilder(
    column: $table.specialization,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get workEmail =>
      $composableBuilder(column: $table.workEmail, builder: (column) => column);

  GeneratedColumn<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get citizenId =>
      $composableBuilder(column: $table.citizenId, builder: (column) => column);

  GeneratedColumn<String> get bankAccount => $composableBuilder(
    column: $table.bankAccount,
    builder: (column) => column,
  );
}

class $TeacherFtsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          TeacherFts,
          TeacherFt,
          $TeacherFtsFilterComposer,
          $TeacherFtsOrderingComposer,
          $TeacherFtsAnnotationComposer,
          $TeacherFtsCreateCompanionBuilder,
          $TeacherFtsUpdateCompanionBuilder,
          (TeacherFt, BaseReferences<_$AppDatabase, TeacherFts, TeacherFt>),
          TeacherFt,
          PrefetchHooks Function()
        > {
  $TeacherFtsTableManager(_$AppDatabase db, TeacherFts table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TeacherFtsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TeacherFtsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TeacherFtsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> university = const Value.absent(),
                Value<String> falcuty = const Value.absent(),
                Value<String> specialization = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<String> workEmail = const Value.absent(),
                Value<String> personalEmail = const Value.absent(),
                Value<String> citizenId = const Value.absent(),
                Value<String> bankAccount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TeacherFtsCompanion(
                id: id,
                name: name,
                university: university,
                falcuty: falcuty,
                specialization: specialization,
                phoneNumber: phoneNumber,
                workEmail: workEmail,
                personalEmail: personalEmail,
                citizenId: citizenId,
                bankAccount: bankAccount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String university,
                required String falcuty,
                required String specialization,
                required String phoneNumber,
                required String workEmail,
                required String personalEmail,
                required String citizenId,
                required String bankAccount,
                Value<int> rowid = const Value.absent(),
              }) => TeacherFtsCompanion.insert(
                id: id,
                name: name,
                university: university,
                falcuty: falcuty,
                specialization: specialization,
                phoneNumber: phoneNumber,
                workEmail: workEmail,
                personalEmail: personalEmail,
                citizenId: citizenId,
                bankAccount: bankAccount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $TeacherFtsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      TeacherFts,
      TeacherFt,
      $TeacherFtsFilterComposer,
      $TeacherFtsOrderingComposer,
      $TeacherFtsAnnotationComposer,
      $TeacherFtsCreateCompanionBuilder,
      $TeacherFtsUpdateCompanionBuilder,
      (TeacherFt, BaseReferences<_$AppDatabase, TeacherFts, TeacherFt>),
      TeacherFt,
      PrefetchHooks Function()
    >;
typedef $TeacherGroupCreateCompanionBuilder =
    TeacherGroupCompanion Function({Value<int> id, required String name});
typedef $TeacherGroupUpdateCompanionBuilder =
    TeacherGroupCompanion Function({Value<int> id, Value<String> name});

final class $TeacherGroupReferences
    extends BaseReferences<_$AppDatabase, TeacherGroup, TeacherGroupData> {
  $TeacherGroupReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<Teacher, List<TeacherData>> _teacherRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.teacher,
    aliasName: $_aliasNameGenerator(
      db.teacherGroup.id,
      db.teacher.teacherGroupId,
    ),
  );

  $TeacherProcessedTableManager get teacherRefs {
    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.teacherGroupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_teacherRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $TeacherGroupFilterComposer
    extends Composer<_$AppDatabase, TeacherGroup> {
  $TeacherGroupFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> teacherRefs(
    Expression<bool> Function($TeacherFilterComposer f) f,
  ) {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.teacherGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TeacherGroupOrderingComposer
    extends Composer<_$AppDatabase, TeacherGroup> {
  $TeacherGroupOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $TeacherGroupAnnotationComposer
    extends Composer<_$AppDatabase, TeacherGroup> {
  $TeacherGroupAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> teacherRefs<T extends Object>(
    Expression<T> Function($TeacherAnnotationComposer a) f,
  ) {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.teacherGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TeacherGroupTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          TeacherGroup,
          TeacherGroupData,
          $TeacherGroupFilterComposer,
          $TeacherGroupOrderingComposer,
          $TeacherGroupAnnotationComposer,
          $TeacherGroupCreateCompanionBuilder,
          $TeacherGroupUpdateCompanionBuilder,
          (TeacherGroupData, $TeacherGroupReferences),
          TeacherGroupData,
          PrefetchHooks Function({bool teacherRefs})
        > {
  $TeacherGroupTableManager(_$AppDatabase db, TeacherGroup table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TeacherGroupFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TeacherGroupOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TeacherGroupAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => TeacherGroupCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  TeacherGroupCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $TeacherGroupReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({teacherRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (teacherRefs) db.teacher],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (teacherRefs)
                    await $_getPrefetchedData<
                      TeacherGroupData,
                      TeacherGroup,
                      TeacherData
                    >(
                      currentTable: table,
                      referencedTable: $TeacherGroupReferences
                          ._teacherRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $TeacherGroupReferences(db, table, p0).teacherRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.teacherGroupId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $TeacherGroupProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      TeacherGroup,
      TeacherGroupData,
      $TeacherGroupFilterComposer,
      $TeacherGroupOrderingComposer,
      $TeacherGroupAnnotationComposer,
      $TeacherGroupCreateCompanionBuilder,
      $TeacherGroupUpdateCompanionBuilder,
      (TeacherGroupData, $TeacherGroupReferences),
      TeacherGroupData,
      PrefetchHooks Function({bool teacherRefs})
    >;
typedef $TeacherCreateCompanionBuilder =
    TeacherCompanion Function({
      Value<int> id,
      Value<String?> staffId,
      required String name,
      Value<String?> university,
      Value<String?> falcuty,
      Value<bool> isOutsider,
      required enums.Gender gender,
      Value<String?> specialization,
      Value<enums.AcademicRank?> academicRank,
      Value<enums.AcademicDegree?> academicDegree,
      Value<DateTime?> academicDegreeReceiveDate,
      Value<String?> phoneNumber,
      Value<String?> workEmail,
      Value<String?> personalEmail,
      Value<String?> citizenId,
      Value<DateTime?> dateOfBirth,
      Value<String?> bankAccount,
      Value<String?> bankName,
      Value<String?> deprecatedTaxCode,
      Value<String?> note,
      Value<int?> teacherGroupId,
    });
typedef $TeacherUpdateCompanionBuilder =
    TeacherCompanion Function({
      Value<int> id,
      Value<String?> staffId,
      Value<String> name,
      Value<String?> university,
      Value<String?> falcuty,
      Value<bool> isOutsider,
      Value<enums.Gender> gender,
      Value<String?> specialization,
      Value<enums.AcademicRank?> academicRank,
      Value<enums.AcademicDegree?> academicDegree,
      Value<DateTime?> academicDegreeReceiveDate,
      Value<String?> phoneNumber,
      Value<String?> workEmail,
      Value<String?> personalEmail,
      Value<String?> citizenId,
      Value<DateTime?> dateOfBirth,
      Value<String?> bankAccount,
      Value<String?> bankName,
      Value<String?> deprecatedTaxCode,
      Value<String?> note,
      Value<int?> teacherGroupId,
    });

final class $TeacherReferences
    extends BaseReferences<_$AppDatabase, Teacher, TeacherData> {
  $TeacherReferences(super.$_db, super.$_table, super.$_typedResult);

  static TeacherGroup _teacherGroupIdTable(_$AppDatabase db) =>
      db.teacherGroup.createAlias(
        $_aliasNameGenerator(db.teacher.teacherGroupId, db.teacherGroup.id),
      );

  $TeacherGroupProcessedTableManager? get teacherGroupId {
    final $_column = $_itemColumn<int>('teacher_group_id');
    if ($_column == null) return null;
    final manager = $TeacherGroupTableManager(
      $_db,
      $_db.teacherGroup,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    TeachingRegistration,
    List<TeachingRegistrationData>
  >
  _teachingRegistrationRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.teachingRegistration,
        aliasName: $_aliasNameGenerator(
          db.teacher.id,
          db.teachingRegistration.teacherId,
        ),
      );

  $TeachingRegistrationProcessedTableManager get teachingRegistrationRefs {
    final manager = $TeachingRegistrationTableManager(
      $_db,
      $_db.teachingRegistration,
    ).filter((f) => f.teacherId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _teachingRegistrationRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<TeachingAssignment, List<TeachingAssignmentData>>
  _teachingAssignmentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.teachingAssignment,
        aliasName: $_aliasNameGenerator(
          db.teacher.id,
          db.teachingAssignment.teacherId,
        ),
      );

  $TeachingAssignmentProcessedTableManager get teachingAssignmentRefs {
    final manager = $TeachingAssignmentTableManager(
      $_db,
      $_db.teachingAssignment,
    ).filter((f) => f.teacherId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _teachingAssignmentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $TeacherFilterComposer extends Composer<_$AppDatabase, Teacher> {
  $TeacherFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get staffId => $composableBuilder(
    column: $table.staffId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get university => $composableBuilder(
    column: $table.university,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get falcuty => $composableBuilder(
    column: $table.falcuty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOutsider => $composableBuilder(
    column: $table.isOutsider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<enums.Gender, enums.Gender, String>
  get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get specialization => $composableBuilder(
    column: $table.specialization,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    enums.AcademicRank?,
    enums.AcademicRank,
    String
  >
  get academicRank => $composableBuilder(
    column: $table.academicRank,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    enums.AcademicDegree?,
    enums.AcademicDegree,
    String
  >
  get academicDegree => $composableBuilder(
    column: $table.academicDegree,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get academicDegreeReceiveDate => $composableBuilder(
    column: $table.academicDegreeReceiveDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workEmail => $composableBuilder(
    column: $table.workEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get citizenId => $composableBuilder(
    column: $table.citizenId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankAccount => $composableBuilder(
    column: $table.bankAccount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deprecatedTaxCode => $composableBuilder(
    column: $table.deprecatedTaxCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $TeacherGroupFilterComposer get teacherGroupId {
    final $TeacherGroupFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherGroupId,
      referencedTable: $db.teacherGroup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherGroupFilterComposer(
            $db: $db,
            $table: $db.teacherGroup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> teachingRegistrationRefs(
    Expression<bool> Function($TeachingRegistrationFilterComposer f) f,
  ) {
    final $TeachingRegistrationFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teachingRegistration,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeachingRegistrationFilterComposer(
            $db: $db,
            $table: $db.teachingRegistration,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> teachingAssignmentRefs(
    Expression<bool> Function($TeachingAssignmentFilterComposer f) f,
  ) {
    final $TeachingAssignmentFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teachingAssignment,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeachingAssignmentFilterComposer(
            $db: $db,
            $table: $db.teachingAssignment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TeacherOrderingComposer extends Composer<_$AppDatabase, Teacher> {
  $TeacherOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get staffId => $composableBuilder(
    column: $table.staffId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get university => $composableBuilder(
    column: $table.university,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get falcuty => $composableBuilder(
    column: $table.falcuty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOutsider => $composableBuilder(
    column: $table.isOutsider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialization => $composableBuilder(
    column: $table.specialization,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academicRank => $composableBuilder(
    column: $table.academicRank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academicDegree => $composableBuilder(
    column: $table.academicDegree,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get academicDegreeReceiveDate => $composableBuilder(
    column: $table.academicDegreeReceiveDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workEmail => $composableBuilder(
    column: $table.workEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get citizenId => $composableBuilder(
    column: $table.citizenId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankAccount => $composableBuilder(
    column: $table.bankAccount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deprecatedTaxCode => $composableBuilder(
    column: $table.deprecatedTaxCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $TeacherGroupOrderingComposer get teacherGroupId {
    final $TeacherGroupOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherGroupId,
      referencedTable: $db.teacherGroup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherGroupOrderingComposer(
            $db: $db,
            $table: $db.teacherGroup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TeacherAnnotationComposer extends Composer<_$AppDatabase, Teacher> {
  $TeacherAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get staffId =>
      $composableBuilder(column: $table.staffId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get university => $composableBuilder(
    column: $table.university,
    builder: (column) => column,
  );

  GeneratedColumn<String> get falcuty =>
      $composableBuilder(column: $table.falcuty, builder: (column) => column);

  GeneratedColumn<bool> get isOutsider => $composableBuilder(
    column: $table.isOutsider,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<enums.Gender, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get specialization => $composableBuilder(
    column: $table.specialization,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<enums.AcademicRank?, String>
  get academicRank => $composableBuilder(
    column: $table.academicRank,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<enums.AcademicDegree?, String>
  get academicDegree => $composableBuilder(
    column: $table.academicDegree,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get academicDegreeReceiveDate => $composableBuilder(
    column: $table.academicDegreeReceiveDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get workEmail =>
      $composableBuilder(column: $table.workEmail, builder: (column) => column);

  GeneratedColumn<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get citizenId =>
      $composableBuilder(column: $table.citizenId, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankAccount => $composableBuilder(
    column: $table.bankAccount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get deprecatedTaxCode => $composableBuilder(
    column: $table.deprecatedTaxCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $TeacherGroupAnnotationComposer get teacherGroupId {
    final $TeacherGroupAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherGroupId,
      referencedTable: $db.teacherGroup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherGroupAnnotationComposer(
            $db: $db,
            $table: $db.teacherGroup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> teachingRegistrationRefs<T extends Object>(
    Expression<T> Function($TeachingRegistrationAnnotationComposer a) f,
  ) {
    final $TeachingRegistrationAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teachingRegistration,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeachingRegistrationAnnotationComposer(
            $db: $db,
            $table: $db.teachingRegistration,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> teachingAssignmentRefs<T extends Object>(
    Expression<T> Function($TeachingAssignmentAnnotationComposer a) f,
  ) {
    final $TeachingAssignmentAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teachingAssignment,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeachingAssignmentAnnotationComposer(
            $db: $db,
            $table: $db.teachingAssignment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TeacherTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Teacher,
          TeacherData,
          $TeacherFilterComposer,
          $TeacherOrderingComposer,
          $TeacherAnnotationComposer,
          $TeacherCreateCompanionBuilder,
          $TeacherUpdateCompanionBuilder,
          (TeacherData, $TeacherReferences),
          TeacherData,
          PrefetchHooks Function({
            bool teacherGroupId,
            bool teachingRegistrationRefs,
            bool teachingAssignmentRefs,
          })
        > {
  $TeacherTableManager(_$AppDatabase db, Teacher table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TeacherFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TeacherOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TeacherAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> staffId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> university = const Value.absent(),
                Value<String?> falcuty = const Value.absent(),
                Value<bool> isOutsider = const Value.absent(),
                Value<enums.Gender> gender = const Value.absent(),
                Value<String?> specialization = const Value.absent(),
                Value<enums.AcademicRank?> academicRank = const Value.absent(),
                Value<enums.AcademicDegree?> academicDegree =
                    const Value.absent(),
                Value<DateTime?> academicDegreeReceiveDate =
                    const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> workEmail = const Value.absent(),
                Value<String?> personalEmail = const Value.absent(),
                Value<String?> citizenId = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> bankAccount = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> deprecatedTaxCode = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> teacherGroupId = const Value.absent(),
              }) => TeacherCompanion(
                id: id,
                staffId: staffId,
                name: name,
                university: university,
                falcuty: falcuty,
                isOutsider: isOutsider,
                gender: gender,
                specialization: specialization,
                academicRank: academicRank,
                academicDegree: academicDegree,
                academicDegreeReceiveDate: academicDegreeReceiveDate,
                phoneNumber: phoneNumber,
                workEmail: workEmail,
                personalEmail: personalEmail,
                citizenId: citizenId,
                dateOfBirth: dateOfBirth,
                bankAccount: bankAccount,
                bankName: bankName,
                deprecatedTaxCode: deprecatedTaxCode,
                note: note,
                teacherGroupId: teacherGroupId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> staffId = const Value.absent(),
                required String name,
                Value<String?> university = const Value.absent(),
                Value<String?> falcuty = const Value.absent(),
                Value<bool> isOutsider = const Value.absent(),
                required enums.Gender gender,
                Value<String?> specialization = const Value.absent(),
                Value<enums.AcademicRank?> academicRank = const Value.absent(),
                Value<enums.AcademicDegree?> academicDegree =
                    const Value.absent(),
                Value<DateTime?> academicDegreeReceiveDate =
                    const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> workEmail = const Value.absent(),
                Value<String?> personalEmail = const Value.absent(),
                Value<String?> citizenId = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> bankAccount = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> deprecatedTaxCode = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> teacherGroupId = const Value.absent(),
              }) => TeacherCompanion.insert(
                id: id,
                staffId: staffId,
                name: name,
                university: university,
                falcuty: falcuty,
                isOutsider: isOutsider,
                gender: gender,
                specialization: specialization,
                academicRank: academicRank,
                academicDegree: academicDegree,
                academicDegreeReceiveDate: academicDegreeReceiveDate,
                phoneNumber: phoneNumber,
                workEmail: workEmail,
                personalEmail: personalEmail,
                citizenId: citizenId,
                dateOfBirth: dateOfBirth,
                bankAccount: bankAccount,
                bankName: bankName,
                deprecatedTaxCode: deprecatedTaxCode,
                note: note,
                teacherGroupId: teacherGroupId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $TeacherReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                teacherGroupId = false,
                teachingRegistrationRefs = false,
                teachingAssignmentRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (teachingRegistrationRefs) db.teachingRegistration,
                    if (teachingAssignmentRefs) db.teachingAssignment,
                  ],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (teacherGroupId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.teacherGroupId,
                                    referencedTable: $TeacherReferences
                                        ._teacherGroupIdTable(db),
                                    referencedColumn: $TeacherReferences
                                        ._teacherGroupIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (teachingRegistrationRefs)
                        await $_getPrefetchedData<
                          TeacherData,
                          Teacher,
                          TeachingRegistrationData
                        >(
                          currentTable: table,
                          referencedTable: $TeacherReferences
                              ._teachingRegistrationRefsTable(db),
                          managerFromTypedResult: (p0) => $TeacherReferences(
                            db,
                            table,
                            p0,
                          ).teachingRegistrationRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teacherId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (teachingAssignmentRefs)
                        await $_getPrefetchedData<
                          TeacherData,
                          Teacher,
                          TeachingAssignmentData
                        >(
                          currentTable: table,
                          referencedTable: $TeacherReferences
                              ._teachingAssignmentRefsTable(db),
                          managerFromTypedResult: (p0) => $TeacherReferences(
                            db,
                            table,
                            p0,
                          ).teachingAssignmentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teacherId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $TeacherProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Teacher,
      TeacherData,
      $TeacherFilterComposer,
      $TeacherOrderingComposer,
      $TeacherAnnotationComposer,
      $TeacherCreateCompanionBuilder,
      $TeacherUpdateCompanionBuilder,
      (TeacherData, $TeacherReferences),
      TeacherData,
      PrefetchHooks Function({
        bool teacherGroupId,
        bool teachingRegistrationRefs,
        bool teachingAssignmentRefs,
      })
    >;
typedef $CourseFtsCreateCompanionBuilder =
    CourseFtsCompanion Function({
      required String id,
      required String vietnameseName,
      required String englishName,
      Value<int> rowid,
    });
typedef $CourseFtsUpdateCompanionBuilder =
    CourseFtsCompanion Function({
      Value<String> id,
      Value<String> vietnameseName,
      Value<String> englishName,
      Value<int> rowid,
    });

class $CourseFtsFilterComposer extends Composer<_$AppDatabase, CourseFts> {
  $CourseFtsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vietnameseName => $composableBuilder(
    column: $table.vietnameseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnFilters(column),
  );
}

class $CourseFtsOrderingComposer extends Composer<_$AppDatabase, CourseFts> {
  $CourseFtsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vietnameseName => $composableBuilder(
    column: $table.vietnameseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CourseFtsAnnotationComposer extends Composer<_$AppDatabase, CourseFts> {
  $CourseFtsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vietnameseName => $composableBuilder(
    column: $table.vietnameseName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => column,
  );
}

class $CourseFtsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CourseFts,
          CourseFt,
          $CourseFtsFilterComposer,
          $CourseFtsOrderingComposer,
          $CourseFtsAnnotationComposer,
          $CourseFtsCreateCompanionBuilder,
          $CourseFtsUpdateCompanionBuilder,
          (CourseFt, BaseReferences<_$AppDatabase, CourseFts, CourseFt>),
          CourseFt,
          PrefetchHooks Function()
        > {
  $CourseFtsTableManager(_$AppDatabase db, CourseFts table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CourseFtsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CourseFtsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CourseFtsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> vietnameseName = const Value.absent(),
                Value<String> englishName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CourseFtsCompanion(
                id: id,
                vietnameseName: vietnameseName,
                englishName: englishName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String vietnameseName,
                required String englishName,
                Value<int> rowid = const Value.absent(),
              }) => CourseFtsCompanion.insert(
                id: id,
                vietnameseName: vietnameseName,
                englishName: englishName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CourseFtsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CourseFts,
      CourseFt,
      $CourseFtsFilterComposer,
      $CourseFtsOrderingComposer,
      $CourseFtsAnnotationComposer,
      $CourseFtsCreateCompanionBuilder,
      $CourseFtsUpdateCompanionBuilder,
      (CourseFt, BaseReferences<_$AppDatabase, CourseFts, CourseFt>),
      CourseFt,
      PrefetchHooks Function()
    >;
typedef $CourseCreateCompanionBuilder =
    CourseCompanion Function({
      required String id,
      required String vietnameseName,
      required String englishName,
      required enums.CourseCategory category,
      required int numCredits,
      required int numTheoryHours,
      required int numPracticeHours,
      required int numLabHours,
      required int numSelfStudyHours,
      Value<int> rowid,
    });
typedef $CourseUpdateCompanionBuilder =
    CourseCompanion Function({
      Value<String> id,
      Value<String> vietnameseName,
      Value<String> englishName,
      Value<enums.CourseCategory> category,
      Value<int> numCredits,
      Value<int> numTheoryHours,
      Value<int> numPracticeHours,
      Value<int> numLabHours,
      Value<int> numSelfStudyHours,
      Value<int> rowid,
    });

final class $CourseReferences
    extends BaseReferences<_$AppDatabase, Course, CourseData> {
  $CourseReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    TeachingRegistration,
    List<TeachingRegistrationData>
  >
  _teachingRegistrationRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.teachingRegistration,
        aliasName: $_aliasNameGenerator(
          db.course.id,
          db.teachingRegistration.courseId,
        ),
      );

  $TeachingRegistrationProcessedTableManager get teachingRegistrationRefs {
    final manager = $TeachingRegistrationTableManager(
      $_db,
      $_db.teachingRegistration,
    ).filter((f) => f.courseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _teachingRegistrationRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $CourseFilterComposer extends Composer<_$AppDatabase, Course> {
  $CourseFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vietnameseName => $composableBuilder(
    column: $table.vietnameseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    enums.CourseCategory,
    enums.CourseCategory,
    String
  >
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get numCredits => $composableBuilder(
    column: $table.numCredits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numTheoryHours => $composableBuilder(
    column: $table.numTheoryHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numPracticeHours => $composableBuilder(
    column: $table.numPracticeHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numLabHours => $composableBuilder(
    column: $table.numLabHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numSelfStudyHours => $composableBuilder(
    column: $table.numSelfStudyHours,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> teachingRegistrationRefs(
    Expression<bool> Function($TeachingRegistrationFilterComposer f) f,
  ) {
    final $TeachingRegistrationFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teachingRegistration,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeachingRegistrationFilterComposer(
            $db: $db,
            $table: $db.teachingRegistration,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $CourseOrderingComposer extends Composer<_$AppDatabase, Course> {
  $CourseOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vietnameseName => $composableBuilder(
    column: $table.vietnameseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numCredits => $composableBuilder(
    column: $table.numCredits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numTheoryHours => $composableBuilder(
    column: $table.numTheoryHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numPracticeHours => $composableBuilder(
    column: $table.numPracticeHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numLabHours => $composableBuilder(
    column: $table.numLabHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numSelfStudyHours => $composableBuilder(
    column: $table.numSelfStudyHours,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CourseAnnotationComposer extends Composer<_$AppDatabase, Course> {
  $CourseAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vietnameseName => $composableBuilder(
    column: $table.vietnameseName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<enums.CourseCategory, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get numCredits => $composableBuilder(
    column: $table.numCredits,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numTheoryHours => $composableBuilder(
    column: $table.numTheoryHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numPracticeHours => $composableBuilder(
    column: $table.numPracticeHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numLabHours => $composableBuilder(
    column: $table.numLabHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numSelfStudyHours => $composableBuilder(
    column: $table.numSelfStudyHours,
    builder: (column) => column,
  );

  Expression<T> teachingRegistrationRefs<T extends Object>(
    Expression<T> Function($TeachingRegistrationAnnotationComposer a) f,
  ) {
    final $TeachingRegistrationAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teachingRegistration,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeachingRegistrationAnnotationComposer(
            $db: $db,
            $table: $db.teachingRegistration,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $CourseTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Course,
          CourseData,
          $CourseFilterComposer,
          $CourseOrderingComposer,
          $CourseAnnotationComposer,
          $CourseCreateCompanionBuilder,
          $CourseUpdateCompanionBuilder,
          (CourseData, $CourseReferences),
          CourseData,
          PrefetchHooks Function({bool teachingRegistrationRefs})
        > {
  $CourseTableManager(_$AppDatabase db, Course table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CourseFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CourseOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CourseAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> vietnameseName = const Value.absent(),
                Value<String> englishName = const Value.absent(),
                Value<enums.CourseCategory> category = const Value.absent(),
                Value<int> numCredits = const Value.absent(),
                Value<int> numTheoryHours = const Value.absent(),
                Value<int> numPracticeHours = const Value.absent(),
                Value<int> numLabHours = const Value.absent(),
                Value<int> numSelfStudyHours = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CourseCompanion(
                id: id,
                vietnameseName: vietnameseName,
                englishName: englishName,
                category: category,
                numCredits: numCredits,
                numTheoryHours: numTheoryHours,
                numPracticeHours: numPracticeHours,
                numLabHours: numLabHours,
                numSelfStudyHours: numSelfStudyHours,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String vietnameseName,
                required String englishName,
                required enums.CourseCategory category,
                required int numCredits,
                required int numTheoryHours,
                required int numPracticeHours,
                required int numLabHours,
                required int numSelfStudyHours,
                Value<int> rowid = const Value.absent(),
              }) => CourseCompanion.insert(
                id: id,
                vietnameseName: vietnameseName,
                englishName: englishName,
                category: category,
                numCredits: numCredits,
                numTheoryHours: numTheoryHours,
                numPracticeHours: numPracticeHours,
                numLabHours: numLabHours,
                numSelfStudyHours: numSelfStudyHours,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $CourseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({teachingRegistrationRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (teachingRegistrationRefs) db.teachingRegistration,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (teachingRegistrationRefs)
                    await $_getPrefetchedData<
                      CourseData,
                      Course,
                      TeachingRegistrationData
                    >(
                      currentTable: table,
                      referencedTable: $CourseReferences
                          ._teachingRegistrationRefsTable(db),
                      managerFromTypedResult: (p0) => $CourseReferences(
                        db,
                        table,
                        p0,
                      ).teachingRegistrationRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.courseId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $CourseProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Course,
      CourseData,
      $CourseFilterComposer,
      $CourseOrderingComposer,
      $CourseAnnotationComposer,
      $CourseCreateCompanionBuilder,
      $CourseUpdateCompanionBuilder,
      (CourseData, $CourseReferences),
      CourseData,
      PrefetchHooks Function({bool teachingRegistrationRefs})
    >;
typedef $ThesisFtsCreateCompanionBuilder =
    ThesisFtsCompanion Function({
      required String id,
      required String idGiangVien,
      required String idHocVien,
      required String tenTiengAnh,
      required String tenTiengViet,
      required String giangVien,
      required String hocVien,
      Value<int> rowid,
    });
typedef $ThesisFtsUpdateCompanionBuilder =
    ThesisFtsCompanion Function({
      Value<String> id,
      Value<String> idGiangVien,
      Value<String> idHocVien,
      Value<String> tenTiengAnh,
      Value<String> tenTiengViet,
      Value<String> giangVien,
      Value<String> hocVien,
      Value<int> rowid,
    });

class $ThesisFtsFilterComposer extends Composer<_$AppDatabase, ThesisFts> {
  $ThesisFtsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idGiangVien => $composableBuilder(
    column: $table.idGiangVien,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idHocVien => $composableBuilder(
    column: $table.idHocVien,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenTiengAnh => $composableBuilder(
    column: $table.tenTiengAnh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenTiengViet => $composableBuilder(
    column: $table.tenTiengViet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get giangVien => $composableBuilder(
    column: $table.giangVien,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hocVien => $composableBuilder(
    column: $table.hocVien,
    builder: (column) => ColumnFilters(column),
  );
}

class $ThesisFtsOrderingComposer extends Composer<_$AppDatabase, ThesisFts> {
  $ThesisFtsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idGiangVien => $composableBuilder(
    column: $table.idGiangVien,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idHocVien => $composableBuilder(
    column: $table.idHocVien,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenTiengAnh => $composableBuilder(
    column: $table.tenTiengAnh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenTiengViet => $composableBuilder(
    column: $table.tenTiengViet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get giangVien => $composableBuilder(
    column: $table.giangVien,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hocVien => $composableBuilder(
    column: $table.hocVien,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ThesisFtsAnnotationComposer extends Composer<_$AppDatabase, ThesisFts> {
  $ThesisFtsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get idGiangVien => $composableBuilder(
    column: $table.idGiangVien,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idHocVien =>
      $composableBuilder(column: $table.idHocVien, builder: (column) => column);

  GeneratedColumn<String> get tenTiengAnh => $composableBuilder(
    column: $table.tenTiengAnh,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tenTiengViet => $composableBuilder(
    column: $table.tenTiengViet,
    builder: (column) => column,
  );

  GeneratedColumn<String> get giangVien =>
      $composableBuilder(column: $table.giangVien, builder: (column) => column);

  GeneratedColumn<String> get hocVien =>
      $composableBuilder(column: $table.hocVien, builder: (column) => column);
}

class $ThesisFtsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          ThesisFts,
          ThesisFt,
          $ThesisFtsFilterComposer,
          $ThesisFtsOrderingComposer,
          $ThesisFtsAnnotationComposer,
          $ThesisFtsCreateCompanionBuilder,
          $ThesisFtsUpdateCompanionBuilder,
          (ThesisFt, BaseReferences<_$AppDatabase, ThesisFts, ThesisFt>),
          ThesisFt,
          PrefetchHooks Function()
        > {
  $ThesisFtsTableManager(_$AppDatabase db, ThesisFts table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ThesisFtsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ThesisFtsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ThesisFtsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> idGiangVien = const Value.absent(),
                Value<String> idHocVien = const Value.absent(),
                Value<String> tenTiengAnh = const Value.absent(),
                Value<String> tenTiengViet = const Value.absent(),
                Value<String> giangVien = const Value.absent(),
                Value<String> hocVien = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ThesisFtsCompanion(
                id: id,
                idGiangVien: idGiangVien,
                idHocVien: idHocVien,
                tenTiengAnh: tenTiengAnh,
                tenTiengViet: tenTiengViet,
                giangVien: giangVien,
                hocVien: hocVien,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String idGiangVien,
                required String idHocVien,
                required String tenTiengAnh,
                required String tenTiengViet,
                required String giangVien,
                required String hocVien,
                Value<int> rowid = const Value.absent(),
              }) => ThesisFtsCompanion.insert(
                id: id,
                idGiangVien: idGiangVien,
                idHocVien: idHocVien,
                tenTiengAnh: tenTiengAnh,
                tenTiengViet: tenTiengViet,
                giangVien: giangVien,
                hocVien: hocVien,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $ThesisFtsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      ThesisFts,
      ThesisFt,
      $ThesisFtsFilterComposer,
      $ThesisFtsOrderingComposer,
      $ThesisFtsAnnotationComposer,
      $ThesisFtsCreateCompanionBuilder,
      $ThesisFtsUpdateCompanionBuilder,
      (ThesisFt, BaseReferences<_$AppDatabase, ThesisFts, ThesisFt>),
      ThesisFt,
      PrefetchHooks Function()
    >;
typedef $PreferenceCreateCompanionBuilder =
    PreferenceCompanion Function({
      required String key,
      Value<String?> value,
      Value<int> rowid,
    });
typedef $PreferenceUpdateCompanionBuilder =
    PreferenceCompanion Function({
      Value<String> key,
      Value<String?> value,
      Value<int> rowid,
    });

class $PreferenceFilterComposer extends Composer<_$AppDatabase, Preference> {
  $PreferenceFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $PreferenceOrderingComposer extends Composer<_$AppDatabase, Preference> {
  $PreferenceOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $PreferenceAnnotationComposer
    extends Composer<_$AppDatabase, Preference> {
  $PreferenceAnnotationComposer({
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

class $PreferenceTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Preference,
          PreferenceData,
          $PreferenceFilterComposer,
          $PreferenceOrderingComposer,
          $PreferenceAnnotationComposer,
          $PreferenceCreateCompanionBuilder,
          $PreferenceUpdateCompanionBuilder,
          (
            PreferenceData,
            BaseReferences<_$AppDatabase, Preference, PreferenceData>,
          ),
          PreferenceData,
          PrefetchHooks Function()
        > {
  $PreferenceTableManager(_$AppDatabase db, Preference table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $PreferenceFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $PreferenceOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $PreferenceAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferenceCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                Value<String?> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferenceCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $PreferenceProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Preference,
      PreferenceData,
      $PreferenceFilterComposer,
      $PreferenceOrderingComposer,
      $PreferenceAnnotationComposer,
      $PreferenceCreateCompanionBuilder,
      $PreferenceUpdateCompanionBuilder,
      (
        PreferenceData,
        BaseReferences<_$AppDatabase, Preference, PreferenceData>,
      ),
      PreferenceData,
      PrefetchHooks Function()
    >;
typedef $DocumentRoleCreateCompanionBuilder =
    DocumentRoleCompanion Function({
      Value<int> id,
      required String name,
      Value<bool> canExpire,
      Value<String> category,
    });
typedef $DocumentRoleUpdateCompanionBuilder =
    DocumentRoleCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<bool> canExpire,
      Value<String> category,
    });

final class $DocumentRoleReferences
    extends BaseReferences<_$AppDatabase, DocumentRole, DocumentRoleData> {
  $DocumentRoleReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<Document, List<DocumentData>> _documentRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.document,
    aliasName: $_aliasNameGenerator(db.documentRole.id, db.document.roleId),
  );

  $DocumentProcessedTableManager get documentRefs {
    final manager = $DocumentTableManager(
      $_db,
      $_db.document,
    ).filter((f) => f.roleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_documentRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $DocumentRoleFilterComposer
    extends Composer<_$AppDatabase, DocumentRole> {
  $DocumentRoleFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get canExpire => $composableBuilder(
    column: $table.canExpire,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> documentRefs(
    Expression<bool> Function($DocumentFilterComposer f) f,
  ) {
    final $DocumentFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.document,
      getReferencedColumn: (t) => t.roleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $DocumentFilterComposer(
            $db: $db,
            $table: $db.document,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $DocumentRoleOrderingComposer
    extends Composer<_$AppDatabase, DocumentRole> {
  $DocumentRoleOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get canExpire => $composableBuilder(
    column: $table.canExpire,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );
}

class $DocumentRoleAnnotationComposer
    extends Composer<_$AppDatabase, DocumentRole> {
  $DocumentRoleAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get canExpire =>
      $composableBuilder(column: $table.canExpire, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  Expression<T> documentRefs<T extends Object>(
    Expression<T> Function($DocumentAnnotationComposer a) f,
  ) {
    final $DocumentAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.document,
      getReferencedColumn: (t) => t.roleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $DocumentAnnotationComposer(
            $db: $db,
            $table: $db.document,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $DocumentRoleTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          DocumentRole,
          DocumentRoleData,
          $DocumentRoleFilterComposer,
          $DocumentRoleOrderingComposer,
          $DocumentRoleAnnotationComposer,
          $DocumentRoleCreateCompanionBuilder,
          $DocumentRoleUpdateCompanionBuilder,
          (DocumentRoleData, $DocumentRoleReferences),
          DocumentRoleData,
          PrefetchHooks Function({bool documentRefs})
        > {
  $DocumentRoleTableManager(_$AppDatabase db, DocumentRole table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DocumentRoleFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DocumentRoleOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DocumentRoleAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> canExpire = const Value.absent(),
                Value<String> category = const Value.absent(),
              }) => DocumentRoleCompanion(
                id: id,
                name: name,
                canExpire: canExpire,
                category: category,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<bool> canExpire = const Value.absent(),
                Value<String> category = const Value.absent(),
              }) => DocumentRoleCompanion.insert(
                id: id,
                name: name,
                canExpire: canExpire,
                category: category,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $DocumentRoleReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({documentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (documentRefs) db.document],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (documentRefs)
                    await $_getPrefetchedData<
                      DocumentRoleData,
                      DocumentRole,
                      DocumentData
                    >(
                      currentTable: table,
                      referencedTable: $DocumentRoleReferences
                          ._documentRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $DocumentRoleReferences(db, table, p0).documentRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.roleId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $DocumentRoleProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      DocumentRole,
      DocumentRoleData,
      $DocumentRoleFilterComposer,
      $DocumentRoleOrderingComposer,
      $DocumentRoleAnnotationComposer,
      $DocumentRoleCreateCompanionBuilder,
      $DocumentRoleUpdateCompanionBuilder,
      (DocumentRoleData, $DocumentRoleReferences),
      DocumentRoleData,
      PrefetchHooks Function({bool documentRefs})
    >;
typedef $DocumentCreateCompanionBuilder =
    DocumentCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> officalCode,
      Value<String?> signedDate,
      required int roleId,
      Value<int?> contentId,
      Value<String?> archiveId,
      Value<DateTime> createdTime,
      Value<DateTime> updatedTime,
    });
typedef $DocumentUpdateCompanionBuilder =
    DocumentCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> officalCode,
      Value<String?> signedDate,
      Value<int> roleId,
      Value<int?> contentId,
      Value<String?> archiveId,
      Value<DateTime> createdTime,
      Value<DateTime> updatedTime,
    });

final class $DocumentReferences
    extends BaseReferences<_$AppDatabase, Document, DocumentData> {
  $DocumentReferences(super.$_db, super.$_table, super.$_typedResult);

  static DocumentRole _roleIdTable(_$AppDatabase db) =>
      db.documentRole.createAlias(
        $_aliasNameGenerator(db.document.roleId, db.documentRole.id),
      );

  $DocumentRoleProcessedTableManager get roleId {
    final $_column = $_itemColumn<int>('role_id')!;

    final manager = $DocumentRoleTableManager(
      $_db,
      $_db.documentRole,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $DocumentFilterComposer extends Composer<_$AppDatabase, Document> {
  $DocumentFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get officalCode => $composableBuilder(
    column: $table.officalCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signedDate => $composableBuilder(
    column: $table.signedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get contentId => $composableBuilder(
    column: $table.contentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archiveId => $composableBuilder(
    column: $table.archiveId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  $DocumentRoleFilterComposer get roleId {
    final $DocumentRoleFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleId,
      referencedTable: $db.documentRole,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $DocumentRoleFilterComposer(
            $db: $db,
            $table: $db.documentRole,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $DocumentOrderingComposer extends Composer<_$AppDatabase, Document> {
  $DocumentOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get officalCode => $composableBuilder(
    column: $table.officalCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signedDate => $composableBuilder(
    column: $table.signedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get contentId => $composableBuilder(
    column: $table.contentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archiveId => $composableBuilder(
    column: $table.archiveId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  $DocumentRoleOrderingComposer get roleId {
    final $DocumentRoleOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleId,
      referencedTable: $db.documentRole,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $DocumentRoleOrderingComposer(
            $db: $db,
            $table: $db.documentRole,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $DocumentAnnotationComposer extends Composer<_$AppDatabase, Document> {
  $DocumentAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get officalCode => $composableBuilder(
    column: $table.officalCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get signedDate => $composableBuilder(
    column: $table.signedDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get contentId =>
      $composableBuilder(column: $table.contentId, builder: (column) => column);

  GeneratedColumn<String> get archiveId =>
      $composableBuilder(column: $table.archiveId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  $DocumentRoleAnnotationComposer get roleId {
    final $DocumentRoleAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleId,
      referencedTable: $db.documentRole,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $DocumentRoleAnnotationComposer(
            $db: $db,
            $table: $db.documentRole,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $DocumentTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Document,
          DocumentData,
          $DocumentFilterComposer,
          $DocumentOrderingComposer,
          $DocumentAnnotationComposer,
          $DocumentCreateCompanionBuilder,
          $DocumentUpdateCompanionBuilder,
          (DocumentData, $DocumentReferences),
          DocumentData,
          PrefetchHooks Function({bool roleId})
        > {
  $DocumentTableManager(_$AppDatabase db, Document table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DocumentFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DocumentOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DocumentAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> officalCode = const Value.absent(),
                Value<String?> signedDate = const Value.absent(),
                Value<int> roleId = const Value.absent(),
                Value<int?> contentId = const Value.absent(),
                Value<String?> archiveId = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime> updatedTime = const Value.absent(),
              }) => DocumentCompanion(
                id: id,
                title: title,
                officalCode: officalCode,
                signedDate: signedDate,
                roleId: roleId,
                contentId: contentId,
                archiveId: archiveId,
                createdTime: createdTime,
                updatedTime: updatedTime,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> officalCode = const Value.absent(),
                Value<String?> signedDate = const Value.absent(),
                required int roleId,
                Value<int?> contentId = const Value.absent(),
                Value<String?> archiveId = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime> updatedTime = const Value.absent(),
              }) => DocumentCompanion.insert(
                id: id,
                title: title,
                officalCode: officalCode,
                signedDate: signedDate,
                roleId: roleId,
                contentId: contentId,
                archiveId: archiveId,
                createdTime: createdTime,
                updatedTime: updatedTime,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $DocumentReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({roleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (roleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roleId,
                                referencedTable: $DocumentReferences
                                    ._roleIdTable(db),
                                referencedColumn: $DocumentReferences
                                    ._roleIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $DocumentProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Document,
      DocumentData,
      $DocumentFilterComposer,
      $DocumentOrderingComposer,
      $DocumentAnnotationComposer,
      $DocumentCreateCompanionBuilder,
      $DocumentUpdateCompanionBuilder,
      (DocumentData, $DocumentReferences),
      DocumentData,
      PrefetchHooks Function({bool roleId})
    >;
typedef $CohortCreateCompanionBuilder =
    CohortCompanion Function({
      required String id,
      Value<String> groupUrl,
      Value<int> rowid,
    });
typedef $CohortUpdateCompanionBuilder =
    CohortCompanion Function({
      Value<String> id,
      Value<String> groupUrl,
      Value<int> rowid,
    });

class $CohortFilterComposer extends Composer<_$AppDatabase, Cohort> {
  $CohortFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupUrl => $composableBuilder(
    column: $table.groupUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $CohortOrderingComposer extends Composer<_$AppDatabase, Cohort> {
  $CohortOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupUrl => $composableBuilder(
    column: $table.groupUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CohortAnnotationComposer extends Composer<_$AppDatabase, Cohort> {
  $CohortAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get groupUrl =>
      $composableBuilder(column: $table.groupUrl, builder: (column) => column);
}

class $CohortTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Cohort,
          CohortData,
          $CohortFilterComposer,
          $CohortOrderingComposer,
          $CohortAnnotationComposer,
          $CohortCreateCompanionBuilder,
          $CohortUpdateCompanionBuilder,
          (CohortData, BaseReferences<_$AppDatabase, Cohort, CohortData>),
          CohortData,
          PrefetchHooks Function()
        > {
  $CohortTableManager(_$AppDatabase db, Cohort table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CohortFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CohortOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CohortAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> groupUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CohortCompanion(id: id, groupUrl: groupUrl, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                Value<String> groupUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CohortCompanion.insert(
                id: id,
                groupUrl: groupUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CohortProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Cohort,
      CohortData,
      $CohortFilterComposer,
      $CohortOrderingComposer,
      $CohortAnnotationComposer,
      $CohortCreateCompanionBuilder,
      $CohortUpdateCompanionBuilder,
      (CohortData, BaseReferences<_$AppDatabase, Cohort, CohortData>),
      CohortData,
      PrefetchHooks Function()
    >;
typedef $AdmissionCouncilCreateCompanionBuilder =
    AdmissionCouncilCompanion Function({
      Value<int> id,
      required String year,
      required int presidentId,
      required int secretaryId,
      required int member1Id,
      required int member2Id,
      required int member3Id,
      required String establishmentDecisionId,
      required DateTime establishmentDecisionDate,
    });
typedef $AdmissionCouncilUpdateCompanionBuilder =
    AdmissionCouncilCompanion Function({
      Value<int> id,
      Value<String> year,
      Value<int> presidentId,
      Value<int> secretaryId,
      Value<int> member1Id,
      Value<int> member2Id,
      Value<int> member3Id,
      Value<String> establishmentDecisionId,
      Value<DateTime> establishmentDecisionDate,
    });

final class $AdmissionCouncilReferences
    extends
        BaseReferences<_$AppDatabase, AdmissionCouncil, AdmissionCouncilData> {
  $AdmissionCouncilReferences(super.$_db, super.$_table, super.$_typedResult);

  static Teacher _presidentIdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.admissionCouncil.presidentId, db.teacher.id),
  );

  $TeacherProcessedTableManager get presidentId {
    final $_column = $_itemColumn<int>('president_id')!;

    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_presidentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _secretaryIdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.admissionCouncil.secretaryId, db.teacher.id),
  );

  $TeacherProcessedTableManager get secretaryId {
    final $_column = $_itemColumn<int>('secretary_id')!;

    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_secretaryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _member1IdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.admissionCouncil.member1Id, db.teacher.id),
  );

  $TeacherProcessedTableManager get member1Id {
    final $_column = $_itemColumn<int>('member_1_id')!;

    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_member1IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _member2IdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.admissionCouncil.member2Id, db.teacher.id),
  );

  $TeacherProcessedTableManager get member2Id {
    final $_column = $_itemColumn<int>('member_2_id')!;

    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_member2IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _member3IdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.admissionCouncil.member3Id, db.teacher.id),
  );

  $TeacherProcessedTableManager get member3Id {
    final $_column = $_itemColumn<int>('member_3_id')!;

    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_member3IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $AdmissionCouncilFilterComposer
    extends Composer<_$AppDatabase, AdmissionCouncil> {
  $AdmissionCouncilFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get establishmentDecisionId => $composableBuilder(
    column: $table.establishmentDecisionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get establishmentDecisionDate => $composableBuilder(
    column: $table.establishmentDecisionDate,
    builder: (column) => ColumnFilters(column),
  );

  $TeacherFilterComposer get presidentId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presidentId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get secretaryId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secretaryId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get member1Id {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.member1Id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get member2Id {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.member2Id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get member3Id {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.member3Id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $AdmissionCouncilOrderingComposer
    extends Composer<_$AppDatabase, AdmissionCouncil> {
  $AdmissionCouncilOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get establishmentDecisionId => $composableBuilder(
    column: $table.establishmentDecisionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get establishmentDecisionDate => $composableBuilder(
    column: $table.establishmentDecisionDate,
    builder: (column) => ColumnOrderings(column),
  );

  $TeacherOrderingComposer get presidentId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presidentId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get secretaryId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secretaryId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get member1Id {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.member1Id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get member2Id {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.member2Id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get member3Id {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.member3Id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $AdmissionCouncilAnnotationComposer
    extends Composer<_$AppDatabase, AdmissionCouncil> {
  $AdmissionCouncilAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get establishmentDecisionId => $composableBuilder(
    column: $table.establishmentDecisionId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get establishmentDecisionDate => $composableBuilder(
    column: $table.establishmentDecisionDate,
    builder: (column) => column,
  );

  $TeacherAnnotationComposer get presidentId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presidentId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get secretaryId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secretaryId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get member1Id {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.member1Id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get member2Id {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.member2Id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get member3Id {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.member3Id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $AdmissionCouncilTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          AdmissionCouncil,
          AdmissionCouncilData,
          $AdmissionCouncilFilterComposer,
          $AdmissionCouncilOrderingComposer,
          $AdmissionCouncilAnnotationComposer,
          $AdmissionCouncilCreateCompanionBuilder,
          $AdmissionCouncilUpdateCompanionBuilder,
          (AdmissionCouncilData, $AdmissionCouncilReferences),
          AdmissionCouncilData,
          PrefetchHooks Function({
            bool presidentId,
            bool secretaryId,
            bool member1Id,
            bool member2Id,
            bool member3Id,
          })
        > {
  $AdmissionCouncilTableManager(_$AppDatabase db, AdmissionCouncil table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AdmissionCouncilFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AdmissionCouncilOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AdmissionCouncilAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> year = const Value.absent(),
                Value<int> presidentId = const Value.absent(),
                Value<int> secretaryId = const Value.absent(),
                Value<int> member1Id = const Value.absent(),
                Value<int> member2Id = const Value.absent(),
                Value<int> member3Id = const Value.absent(),
                Value<String> establishmentDecisionId = const Value.absent(),
                Value<DateTime> establishmentDecisionDate =
                    const Value.absent(),
              }) => AdmissionCouncilCompanion(
                id: id,
                year: year,
                presidentId: presidentId,
                secretaryId: secretaryId,
                member1Id: member1Id,
                member2Id: member2Id,
                member3Id: member3Id,
                establishmentDecisionId: establishmentDecisionId,
                establishmentDecisionDate: establishmentDecisionDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String year,
                required int presidentId,
                required int secretaryId,
                required int member1Id,
                required int member2Id,
                required int member3Id,
                required String establishmentDecisionId,
                required DateTime establishmentDecisionDate,
              }) => AdmissionCouncilCompanion.insert(
                id: id,
                year: year,
                presidentId: presidentId,
                secretaryId: secretaryId,
                member1Id: member1Id,
                member2Id: member2Id,
                member3Id: member3Id,
                establishmentDecisionId: establishmentDecisionId,
                establishmentDecisionDate: establishmentDecisionDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $AdmissionCouncilReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                presidentId = false,
                secretaryId = false,
                member1Id = false,
                member2Id = false,
                member3Id = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (presidentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.presidentId,
                                    referencedTable: $AdmissionCouncilReferences
                                        ._presidentIdTable(db),
                                    referencedColumn:
                                        $AdmissionCouncilReferences
                                            ._presidentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (secretaryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.secretaryId,
                                    referencedTable: $AdmissionCouncilReferences
                                        ._secretaryIdTable(db),
                                    referencedColumn:
                                        $AdmissionCouncilReferences
                                            ._secretaryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (member1Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.member1Id,
                                    referencedTable: $AdmissionCouncilReferences
                                        ._member1IdTable(db),
                                    referencedColumn:
                                        $AdmissionCouncilReferences
                                            ._member1IdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (member2Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.member2Id,
                                    referencedTable: $AdmissionCouncilReferences
                                        ._member2IdTable(db),
                                    referencedColumn:
                                        $AdmissionCouncilReferences
                                            ._member2IdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (member3Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.member3Id,
                                    referencedTable: $AdmissionCouncilReferences
                                        ._member3IdTable(db),
                                    referencedColumn:
                                        $AdmissionCouncilReferences
                                            ._member3IdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $AdmissionCouncilProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      AdmissionCouncil,
      AdmissionCouncilData,
      $AdmissionCouncilFilterComposer,
      $AdmissionCouncilOrderingComposer,
      $AdmissionCouncilAnnotationComposer,
      $AdmissionCouncilCreateCompanionBuilder,
      $AdmissionCouncilUpdateCompanionBuilder,
      (AdmissionCouncilData, $AdmissionCouncilReferences),
      AdmissionCouncilData,
      PrefetchHooks Function({
        bool presidentId,
        bool secretaryId,
        bool member1Id,
        bool member2Id,
        bool member3Id,
      })
    >;
typedef $StudentCreateCompanionBuilder =
    StudentCompanion Function({
      Value<int> id,
      Value<String?> admissionId,
      Value<String?> cohort,
      Value<String?> studentId,
      required String name,
      Value<DateTime?> dateOfBirth,
      Value<enums.Gender?> gender,
      Value<String?> placeOfBirth,
      Value<String?> phone,
      Value<String?> personalEmail,
      Value<String?> schoolEmail,
      Value<String?> bachelorUniversity,
      Value<String?> bachelorMajor,
      Value<String?> bachelorProgram,
      Value<String?> bachelorGraduationRank,
      Value<DateTime?> bachelorGraduationDate,
      Value<String?> intendedSpecialization,
      Value<String?> exemptedCourses,
      Value<String?> masterMajor,
      Value<enums.StudentStatus?> status,
      Value<bool> hasHirstExtension,
      Value<bool> hasSecondExtension,
      Value<int?> admissionCouncilId,
      Value<enums.AdmissionType?> admissionType,
      Value<bool> isAdmissionPaid,
    });
typedef $StudentUpdateCompanionBuilder =
    StudentCompanion Function({
      Value<int> id,
      Value<String?> admissionId,
      Value<String?> cohort,
      Value<String?> studentId,
      Value<String> name,
      Value<DateTime?> dateOfBirth,
      Value<enums.Gender?> gender,
      Value<String?> placeOfBirth,
      Value<String?> phone,
      Value<String?> personalEmail,
      Value<String?> schoolEmail,
      Value<String?> bachelorUniversity,
      Value<String?> bachelorMajor,
      Value<String?> bachelorProgram,
      Value<String?> bachelorGraduationRank,
      Value<DateTime?> bachelorGraduationDate,
      Value<String?> intendedSpecialization,
      Value<String?> exemptedCourses,
      Value<String?> masterMajor,
      Value<enums.StudentStatus?> status,
      Value<bool> hasHirstExtension,
      Value<bool> hasSecondExtension,
      Value<int?> admissionCouncilId,
      Value<enums.AdmissionType?> admissionType,
      Value<bool> isAdmissionPaid,
    });

final class $StudentReferences
    extends BaseReferences<_$AppDatabase, Student, StudentData> {
  $StudentReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<Thesis, List<ThesisData>> _thesisRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.thesis,
    aliasName: $_aliasNameGenerator(db.student.id, db.thesis.studentId),
  );

  $ThesisProcessedTableManager get thesisRefs {
    final manager = $ThesisTableManager(
      $_db,
      $_db.thesis,
    ).filter((f) => f.studentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_thesisRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<StudyRegistration, List<StudyRegistrationData>>
  _studyRegistrationRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.studyRegistration,
        aliasName: $_aliasNameGenerator(
          db.student.id,
          db.studyRegistration.studentId,
        ),
      );

  $StudyRegistrationProcessedTableManager get studyRegistrationRefs {
    final manager = $StudyRegistrationTableManager(
      $_db,
      $_db.studyRegistration,
    ).filter((f) => f.studentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _studyRegistrationRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $StudentFilterComposer extends Composer<_$AppDatabase, Student> {
  $StudentFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get admissionId => $composableBuilder(
    column: $table.admissionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cohort => $composableBuilder(
    column: $table.cohort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<enums.Gender?, enums.Gender, String>
  get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get placeOfBirth => $composableBuilder(
    column: $table.placeOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolEmail => $composableBuilder(
    column: $table.schoolEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bachelorUniversity => $composableBuilder(
    column: $table.bachelorUniversity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bachelorMajor => $composableBuilder(
    column: $table.bachelorMajor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bachelorProgram => $composableBuilder(
    column: $table.bachelorProgram,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bachelorGraduationRank => $composableBuilder(
    column: $table.bachelorGraduationRank,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get bachelorGraduationDate => $composableBuilder(
    column: $table.bachelorGraduationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get intendedSpecialization => $composableBuilder(
    column: $table.intendedSpecialization,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exemptedCourses => $composableBuilder(
    column: $table.exemptedCourses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get masterMajor => $composableBuilder(
    column: $table.masterMajor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    enums.StudentStatus?,
    enums.StudentStatus,
    String
  >
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get hasHirstExtension => $composableBuilder(
    column: $table.hasHirstExtension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasSecondExtension => $composableBuilder(
    column: $table.hasSecondExtension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get admissionCouncilId => $composableBuilder(
    column: $table.admissionCouncilId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    enums.AdmissionType?,
    enums.AdmissionType,
    String
  >
  get admissionType => $composableBuilder(
    column: $table.admissionType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isAdmissionPaid => $composableBuilder(
    column: $table.isAdmissionPaid,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> thesisRefs(
    Expression<bool> Function($ThesisFilterComposer f) f,
  ) {
    final $ThesisFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.thesis,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ThesisFilterComposer(
            $db: $db,
            $table: $db.thesis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> studyRegistrationRefs(
    Expression<bool> Function($StudyRegistrationFilterComposer f) f,
  ) {
    final $StudyRegistrationFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studyRegistration,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudyRegistrationFilterComposer(
            $db: $db,
            $table: $db.studyRegistration,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $StudentOrderingComposer extends Composer<_$AppDatabase, Student> {
  $StudentOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get admissionId => $composableBuilder(
    column: $table.admissionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cohort => $composableBuilder(
    column: $table.cohort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placeOfBirth => $composableBuilder(
    column: $table.placeOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolEmail => $composableBuilder(
    column: $table.schoolEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bachelorUniversity => $composableBuilder(
    column: $table.bachelorUniversity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bachelorMajor => $composableBuilder(
    column: $table.bachelorMajor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bachelorProgram => $composableBuilder(
    column: $table.bachelorProgram,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bachelorGraduationRank => $composableBuilder(
    column: $table.bachelorGraduationRank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get bachelorGraduationDate => $composableBuilder(
    column: $table.bachelorGraduationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get intendedSpecialization => $composableBuilder(
    column: $table.intendedSpecialization,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exemptedCourses => $composableBuilder(
    column: $table.exemptedCourses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get masterMajor => $composableBuilder(
    column: $table.masterMajor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasHirstExtension => $composableBuilder(
    column: $table.hasHirstExtension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasSecondExtension => $composableBuilder(
    column: $table.hasSecondExtension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get admissionCouncilId => $composableBuilder(
    column: $table.admissionCouncilId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get admissionType => $composableBuilder(
    column: $table.admissionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAdmissionPaid => $composableBuilder(
    column: $table.isAdmissionPaid,
    builder: (column) => ColumnOrderings(column),
  );
}

class $StudentAnnotationComposer extends Composer<_$AppDatabase, Student> {
  $StudentAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get admissionId => $composableBuilder(
    column: $table.admissionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cohort =>
      $composableBuilder(column: $table.cohort, builder: (column) => column);

  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<enums.Gender?, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get placeOfBirth => $composableBuilder(
    column: $table.placeOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get schoolEmail => $composableBuilder(
    column: $table.schoolEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bachelorUniversity => $composableBuilder(
    column: $table.bachelorUniversity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bachelorMajor => $composableBuilder(
    column: $table.bachelorMajor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bachelorProgram => $composableBuilder(
    column: $table.bachelorProgram,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bachelorGraduationRank => $composableBuilder(
    column: $table.bachelorGraduationRank,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get bachelorGraduationDate => $composableBuilder(
    column: $table.bachelorGraduationDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get intendedSpecialization => $composableBuilder(
    column: $table.intendedSpecialization,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exemptedCourses => $composableBuilder(
    column: $table.exemptedCourses,
    builder: (column) => column,
  );

  GeneratedColumn<String> get masterMajor => $composableBuilder(
    column: $table.masterMajor,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<enums.StudentStatus?, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get hasHirstExtension => $composableBuilder(
    column: $table.hasHirstExtension,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasSecondExtension => $composableBuilder(
    column: $table.hasSecondExtension,
    builder: (column) => column,
  );

  GeneratedColumn<int> get admissionCouncilId => $composableBuilder(
    column: $table.admissionCouncilId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<enums.AdmissionType?, String>
  get admissionType => $composableBuilder(
    column: $table.admissionType,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAdmissionPaid => $composableBuilder(
    column: $table.isAdmissionPaid,
    builder: (column) => column,
  );

  Expression<T> thesisRefs<T extends Object>(
    Expression<T> Function($ThesisAnnotationComposer a) f,
  ) {
    final $ThesisAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.thesis,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ThesisAnnotationComposer(
            $db: $db,
            $table: $db.thesis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> studyRegistrationRefs<T extends Object>(
    Expression<T> Function($StudyRegistrationAnnotationComposer a) f,
  ) {
    final $StudyRegistrationAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studyRegistration,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudyRegistrationAnnotationComposer(
            $db: $db,
            $table: $db.studyRegistration,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $StudentTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Student,
          StudentData,
          $StudentFilterComposer,
          $StudentOrderingComposer,
          $StudentAnnotationComposer,
          $StudentCreateCompanionBuilder,
          $StudentUpdateCompanionBuilder,
          (StudentData, $StudentReferences),
          StudentData,
          PrefetchHooks Function({bool thesisRefs, bool studyRegistrationRefs})
        > {
  $StudentTableManager(_$AppDatabase db, Student table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $StudentFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $StudentOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $StudentAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> admissionId = const Value.absent(),
                Value<String?> cohort = const Value.absent(),
                Value<String?> studentId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<enums.Gender?> gender = const Value.absent(),
                Value<String?> placeOfBirth = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> personalEmail = const Value.absent(),
                Value<String?> schoolEmail = const Value.absent(),
                Value<String?> bachelorUniversity = const Value.absent(),
                Value<String?> bachelorMajor = const Value.absent(),
                Value<String?> bachelorProgram = const Value.absent(),
                Value<String?> bachelorGraduationRank = const Value.absent(),
                Value<DateTime?> bachelorGraduationDate = const Value.absent(),
                Value<String?> intendedSpecialization = const Value.absent(),
                Value<String?> exemptedCourses = const Value.absent(),
                Value<String?> masterMajor = const Value.absent(),
                Value<enums.StudentStatus?> status = const Value.absent(),
                Value<bool> hasHirstExtension = const Value.absent(),
                Value<bool> hasSecondExtension = const Value.absent(),
                Value<int?> admissionCouncilId = const Value.absent(),
                Value<enums.AdmissionType?> admissionType =
                    const Value.absent(),
                Value<bool> isAdmissionPaid = const Value.absent(),
              }) => StudentCompanion(
                id: id,
                admissionId: admissionId,
                cohort: cohort,
                studentId: studentId,
                name: name,
                dateOfBirth: dateOfBirth,
                gender: gender,
                placeOfBirth: placeOfBirth,
                phone: phone,
                personalEmail: personalEmail,
                schoolEmail: schoolEmail,
                bachelorUniversity: bachelorUniversity,
                bachelorMajor: bachelorMajor,
                bachelorProgram: bachelorProgram,
                bachelorGraduationRank: bachelorGraduationRank,
                bachelorGraduationDate: bachelorGraduationDate,
                intendedSpecialization: intendedSpecialization,
                exemptedCourses: exemptedCourses,
                masterMajor: masterMajor,
                status: status,
                hasHirstExtension: hasHirstExtension,
                hasSecondExtension: hasSecondExtension,
                admissionCouncilId: admissionCouncilId,
                admissionType: admissionType,
                isAdmissionPaid: isAdmissionPaid,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> admissionId = const Value.absent(),
                Value<String?> cohort = const Value.absent(),
                Value<String?> studentId = const Value.absent(),
                required String name,
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<enums.Gender?> gender = const Value.absent(),
                Value<String?> placeOfBirth = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> personalEmail = const Value.absent(),
                Value<String?> schoolEmail = const Value.absent(),
                Value<String?> bachelorUniversity = const Value.absent(),
                Value<String?> bachelorMajor = const Value.absent(),
                Value<String?> bachelorProgram = const Value.absent(),
                Value<String?> bachelorGraduationRank = const Value.absent(),
                Value<DateTime?> bachelorGraduationDate = const Value.absent(),
                Value<String?> intendedSpecialization = const Value.absent(),
                Value<String?> exemptedCourses = const Value.absent(),
                Value<String?> masterMajor = const Value.absent(),
                Value<enums.StudentStatus?> status = const Value.absent(),
                Value<bool> hasHirstExtension = const Value.absent(),
                Value<bool> hasSecondExtension = const Value.absent(),
                Value<int?> admissionCouncilId = const Value.absent(),
                Value<enums.AdmissionType?> admissionType =
                    const Value.absent(),
                Value<bool> isAdmissionPaid = const Value.absent(),
              }) => StudentCompanion.insert(
                id: id,
                admissionId: admissionId,
                cohort: cohort,
                studentId: studentId,
                name: name,
                dateOfBirth: dateOfBirth,
                gender: gender,
                placeOfBirth: placeOfBirth,
                phone: phone,
                personalEmail: personalEmail,
                schoolEmail: schoolEmail,
                bachelorUniversity: bachelorUniversity,
                bachelorMajor: bachelorMajor,
                bachelorProgram: bachelorProgram,
                bachelorGraduationRank: bachelorGraduationRank,
                bachelorGraduationDate: bachelorGraduationDate,
                intendedSpecialization: intendedSpecialization,
                exemptedCourses: exemptedCourses,
                masterMajor: masterMajor,
                status: status,
                hasHirstExtension: hasHirstExtension,
                hasSecondExtension: hasSecondExtension,
                admissionCouncilId: admissionCouncilId,
                admissionType: admissionType,
                isAdmissionPaid: isAdmissionPaid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $StudentReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({thesisRefs = false, studyRegistrationRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (thesisRefs) db.thesis,
                    if (studyRegistrationRefs) db.studyRegistration,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (thesisRefs)
                        await $_getPrefetchedData<
                          StudentData,
                          Student,
                          ThesisData
                        >(
                          currentTable: table,
                          referencedTable: $StudentReferences._thesisRefsTable(
                            db,
                          ),
                          managerFromTypedResult: (p0) =>
                              $StudentReferences(db, table, p0).thesisRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (studyRegistrationRefs)
                        await $_getPrefetchedData<
                          StudentData,
                          Student,
                          StudyRegistrationData
                        >(
                          currentTable: table,
                          referencedTable: $StudentReferences
                              ._studyRegistrationRefsTable(db),
                          managerFromTypedResult: (p0) => $StudentReferences(
                            db,
                            table,
                            p0,
                          ).studyRegistrationRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $StudentProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Student,
      StudentData,
      $StudentFilterComposer,
      $StudentOrderingComposer,
      $StudentAnnotationComposer,
      $StudentCreateCompanionBuilder,
      $StudentUpdateCompanionBuilder,
      (StudentData, $StudentReferences),
      StudentData,
      PrefetchHooks Function({bool thesisRefs, bool studyRegistrationRefs})
    >;
typedef $SemesterCreateCompanionBuilder =
    SemesterCompanion Function({
      required String id,
      required DateTime registrationBeginDate,
      required DateTime registrationEndDate,
      required DateTime classBeginDate,
      required DateTime classEndDate,
      required DateTime gradeSubmissionDeadline,
      Value<int> rowid,
    });
typedef $SemesterUpdateCompanionBuilder =
    SemesterCompanion Function({
      Value<String> id,
      Value<DateTime> registrationBeginDate,
      Value<DateTime> registrationEndDate,
      Value<DateTime> classBeginDate,
      Value<DateTime> classEndDate,
      Value<DateTime> gradeSubmissionDeadline,
      Value<int> rowid,
    });

final class $SemesterReferences
    extends BaseReferences<_$AppDatabase, Semester, SemesterData> {
  $SemesterReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<CourseLimiting, List<CourseLimitingData>>
  _courseLimitingRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.courseLimiting,
    aliasName: $_aliasNameGenerator(
      db.semester.id,
      db.courseLimiting.semesterId,
    ),
  );

  $CourseLimitingProcessedTableManager get courseLimitingRefs {
    final manager = $CourseLimitingTableManager(
      $_db,
      $_db.courseLimiting,
    ).filter((f) => f.semesterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_courseLimitingRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $SemesterFilterComposer extends Composer<_$AppDatabase, Semester> {
  $SemesterFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get registrationBeginDate => $composableBuilder(
    column: $table.registrationBeginDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get registrationEndDate => $composableBuilder(
    column: $table.registrationEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get classBeginDate => $composableBuilder(
    column: $table.classBeginDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get classEndDate => $composableBuilder(
    column: $table.classEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get gradeSubmissionDeadline => $composableBuilder(
    column: $table.gradeSubmissionDeadline,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> courseLimitingRefs(
    Expression<bool> Function($CourseLimitingFilterComposer f) f,
  ) {
    final $CourseLimitingFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseLimiting,
      getReferencedColumn: (t) => t.semesterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseLimitingFilterComposer(
            $db: $db,
            $table: $db.courseLimiting,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $SemesterOrderingComposer extends Composer<_$AppDatabase, Semester> {
  $SemesterOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get registrationBeginDate => $composableBuilder(
    column: $table.registrationBeginDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get registrationEndDate => $composableBuilder(
    column: $table.registrationEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get classBeginDate => $composableBuilder(
    column: $table.classBeginDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get classEndDate => $composableBuilder(
    column: $table.classEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get gradeSubmissionDeadline => $composableBuilder(
    column: $table.gradeSubmissionDeadline,
    builder: (column) => ColumnOrderings(column),
  );
}

class $SemesterAnnotationComposer extends Composer<_$AppDatabase, Semester> {
  $SemesterAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get registrationBeginDate => $composableBuilder(
    column: $table.registrationBeginDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get registrationEndDate => $composableBuilder(
    column: $table.registrationEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get classBeginDate => $composableBuilder(
    column: $table.classBeginDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get classEndDate => $composableBuilder(
    column: $table.classEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get gradeSubmissionDeadline => $composableBuilder(
    column: $table.gradeSubmissionDeadline,
    builder: (column) => column,
  );

  Expression<T> courseLimitingRefs<T extends Object>(
    Expression<T> Function($CourseLimitingAnnotationComposer a) f,
  ) {
    final $CourseLimitingAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseLimiting,
      getReferencedColumn: (t) => t.semesterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseLimitingAnnotationComposer(
            $db: $db,
            $table: $db.courseLimiting,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $SemesterTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Semester,
          SemesterData,
          $SemesterFilterComposer,
          $SemesterOrderingComposer,
          $SemesterAnnotationComposer,
          $SemesterCreateCompanionBuilder,
          $SemesterUpdateCompanionBuilder,
          (SemesterData, $SemesterReferences),
          SemesterData,
          PrefetchHooks Function({bool courseLimitingRefs})
        > {
  $SemesterTableManager(_$AppDatabase db, Semester table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $SemesterFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $SemesterOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $SemesterAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> registrationBeginDate = const Value.absent(),
                Value<DateTime> registrationEndDate = const Value.absent(),
                Value<DateTime> classBeginDate = const Value.absent(),
                Value<DateTime> classEndDate = const Value.absent(),
                Value<DateTime> gradeSubmissionDeadline = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SemesterCompanion(
                id: id,
                registrationBeginDate: registrationBeginDate,
                registrationEndDate: registrationEndDate,
                classBeginDate: classBeginDate,
                classEndDate: classEndDate,
                gradeSubmissionDeadline: gradeSubmissionDeadline,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime registrationBeginDate,
                required DateTime registrationEndDate,
                required DateTime classBeginDate,
                required DateTime classEndDate,
                required DateTime gradeSubmissionDeadline,
                Value<int> rowid = const Value.absent(),
              }) => SemesterCompanion.insert(
                id: id,
                registrationBeginDate: registrationBeginDate,
                registrationEndDate: registrationEndDate,
                classBeginDate: classBeginDate,
                classEndDate: classEndDate,
                gradeSubmissionDeadline: gradeSubmissionDeadline,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $SemesterReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({courseLimitingRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (courseLimitingRefs) db.courseLimiting,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (courseLimitingRefs)
                    await $_getPrefetchedData<
                      SemesterData,
                      Semester,
                      CourseLimitingData
                    >(
                      currentTable: table,
                      referencedTable: $SemesterReferences
                          ._courseLimitingRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $SemesterReferences(db, table, p0).courseLimitingRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.semesterId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $SemesterProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Semester,
      SemesterData,
      $SemesterFilterComposer,
      $SemesterOrderingComposer,
      $SemesterAnnotationComposer,
      $SemesterCreateCompanionBuilder,
      $SemesterUpdateCompanionBuilder,
      (SemesterData, $SemesterReferences),
      SemesterData,
      PrefetchHooks Function({bool courseLimitingRefs})
    >;
typedef $ThesisCreateCompanionBuilder =
    ThesisCompanion Function({
      Value<int> id,
      required int supervisorId,
      Value<int?> presidentId,
      Value<int?> firstReviewerId,
      Value<int?> secondReviewerId,
      Value<int?> secretaryId,
      Value<int?> memberId,
      Value<int?> studentId,
      required String vietnameseTitle,
      required String englishTitle,
      Value<String> note,
      Value<DateTime?> defenseDeadline,
      Value<DateTime?> defenseDate,
      Value<bool> flagTracking,
      Value<bool> flagPaid,
      Value<bool> flagIgnore,
      Value<String?> group,
      Value<String?> year,
      required enums.MscDefenseStatus defenseStatus,
    });
typedef $ThesisUpdateCompanionBuilder =
    ThesisCompanion Function({
      Value<int> id,
      Value<int> supervisorId,
      Value<int?> presidentId,
      Value<int?> firstReviewerId,
      Value<int?> secondReviewerId,
      Value<int?> secretaryId,
      Value<int?> memberId,
      Value<int?> studentId,
      Value<String> vietnameseTitle,
      Value<String> englishTitle,
      Value<String> note,
      Value<DateTime?> defenseDeadline,
      Value<DateTime?> defenseDate,
      Value<bool> flagTracking,
      Value<bool> flagPaid,
      Value<bool> flagIgnore,
      Value<String?> group,
      Value<String?> year,
      Value<enums.MscDefenseStatus> defenseStatus,
    });

final class $ThesisReferences
    extends BaseReferences<_$AppDatabase, Thesis, ThesisData> {
  $ThesisReferences(super.$_db, super.$_table, super.$_typedResult);

  static Teacher _supervisorIdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.thesis.supervisorId, db.teacher.id),
  );

  $TeacherProcessedTableManager get supervisorId {
    final $_column = $_itemColumn<int>('supervisor_id')!;

    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supervisorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _presidentIdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.thesis.presidentId, db.teacher.id),
  );

  $TeacherProcessedTableManager? get presidentId {
    final $_column = $_itemColumn<int>('president_id');
    if ($_column == null) return null;
    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_presidentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _firstReviewerIdTable(_$AppDatabase db) =>
      db.teacher.createAlias(
        $_aliasNameGenerator(db.thesis.firstReviewerId, db.teacher.id),
      );

  $TeacherProcessedTableManager? get firstReviewerId {
    final $_column = $_itemColumn<int>('first_reviewer_id');
    if ($_column == null) return null;
    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_firstReviewerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _secondReviewerIdTable(_$AppDatabase db) =>
      db.teacher.createAlias(
        $_aliasNameGenerator(db.thesis.secondReviewerId, db.teacher.id),
      );

  $TeacherProcessedTableManager? get secondReviewerId {
    final $_column = $_itemColumn<int>('second_reviewer_id');
    if ($_column == null) return null;
    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_secondReviewerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _secretaryIdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.thesis.secretaryId, db.teacher.id),
  );

  $TeacherProcessedTableManager? get secretaryId {
    final $_column = $_itemColumn<int>('secretary_id');
    if ($_column == null) return null;
    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_secretaryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _memberIdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.thesis.memberId, db.teacher.id),
  );

  $TeacherProcessedTableManager? get memberId {
    final $_column = $_itemColumn<int>('member_id');
    if ($_column == null) return null;
    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Student _studentIdTable(_$AppDatabase db) => db.student.createAlias(
    $_aliasNameGenerator(db.thesis.studentId, db.student.id),
  );

  $StudentProcessedTableManager? get studentId {
    final $_column = $_itemColumn<int>('student_id');
    if ($_column == null) return null;
    final manager = $StudentTableManager(
      $_db,
      $_db.student,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $ThesisFilterComposer extends Composer<_$AppDatabase, Thesis> {
  $ThesisFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vietnameseTitle => $composableBuilder(
    column: $table.vietnameseTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get englishTitle => $composableBuilder(
    column: $table.englishTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get defenseDeadline => $composableBuilder(
    column: $table.defenseDeadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get defenseDate => $composableBuilder(
    column: $table.defenseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get flagTracking => $composableBuilder(
    column: $table.flagTracking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get flagPaid => $composableBuilder(
    column: $table.flagPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get flagIgnore => $composableBuilder(
    column: $table.flagIgnore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get group => $composableBuilder(
    column: $table.group,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    enums.MscDefenseStatus,
    enums.MscDefenseStatus,
    String
  >
  get defenseStatus => $composableBuilder(
    column: $table.defenseStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $TeacherFilterComposer get supervisorId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supervisorId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get presidentId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presidentId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get firstReviewerId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firstReviewerId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get secondReviewerId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secondReviewerId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get secretaryId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secretaryId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get memberId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $StudentFilterComposer get studentId {
    final $StudentFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.student,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudentFilterComposer(
            $db: $db,
            $table: $db.student,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ThesisOrderingComposer extends Composer<_$AppDatabase, Thesis> {
  $ThesisOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vietnameseTitle => $composableBuilder(
    column: $table.vietnameseTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get englishTitle => $composableBuilder(
    column: $table.englishTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get defenseDeadline => $composableBuilder(
    column: $table.defenseDeadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get defenseDate => $composableBuilder(
    column: $table.defenseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get flagTracking => $composableBuilder(
    column: $table.flagTracking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get flagPaid => $composableBuilder(
    column: $table.flagPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get flagIgnore => $composableBuilder(
    column: $table.flagIgnore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get group => $composableBuilder(
    column: $table.group,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defenseStatus => $composableBuilder(
    column: $table.defenseStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $TeacherOrderingComposer get supervisorId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supervisorId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get presidentId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presidentId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get firstReviewerId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firstReviewerId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get secondReviewerId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secondReviewerId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get secretaryId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secretaryId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get memberId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $StudentOrderingComposer get studentId {
    final $StudentOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.student,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudentOrderingComposer(
            $db: $db,
            $table: $db.student,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ThesisAnnotationComposer extends Composer<_$AppDatabase, Thesis> {
  $ThesisAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vietnameseTitle => $composableBuilder(
    column: $table.vietnameseTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get englishTitle => $composableBuilder(
    column: $table.englishTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get defenseDeadline => $composableBuilder(
    column: $table.defenseDeadline,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get defenseDate => $composableBuilder(
    column: $table.defenseDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get flagTracking => $composableBuilder(
    column: $table.flagTracking,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get flagPaid =>
      $composableBuilder(column: $table.flagPaid, builder: (column) => column);

  GeneratedColumn<bool> get flagIgnore => $composableBuilder(
    column: $table.flagIgnore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get group =>
      $composableBuilder(column: $table.group, builder: (column) => column);

  GeneratedColumn<String> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumnWithTypeConverter<enums.MscDefenseStatus, String>
  get defenseStatus => $composableBuilder(
    column: $table.defenseStatus,
    builder: (column) => column,
  );

  $TeacherAnnotationComposer get supervisorId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supervisorId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get presidentId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presidentId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get firstReviewerId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firstReviewerId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get secondReviewerId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secondReviewerId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get secretaryId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secretaryId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get memberId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $StudentAnnotationComposer get studentId {
    final $StudentAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.student,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudentAnnotationComposer(
            $db: $db,
            $table: $db.student,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ThesisTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Thesis,
          ThesisData,
          $ThesisFilterComposer,
          $ThesisOrderingComposer,
          $ThesisAnnotationComposer,
          $ThesisCreateCompanionBuilder,
          $ThesisUpdateCompanionBuilder,
          (ThesisData, $ThesisReferences),
          ThesisData,
          PrefetchHooks Function({
            bool supervisorId,
            bool presidentId,
            bool firstReviewerId,
            bool secondReviewerId,
            bool secretaryId,
            bool memberId,
            bool studentId,
          })
        > {
  $ThesisTableManager(_$AppDatabase db, Thesis table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ThesisFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ThesisOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ThesisAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> supervisorId = const Value.absent(),
                Value<int?> presidentId = const Value.absent(),
                Value<int?> firstReviewerId = const Value.absent(),
                Value<int?> secondReviewerId = const Value.absent(),
                Value<int?> secretaryId = const Value.absent(),
                Value<int?> memberId = const Value.absent(),
                Value<int?> studentId = const Value.absent(),
                Value<String> vietnameseTitle = const Value.absent(),
                Value<String> englishTitle = const Value.absent(),
                Value<String> note = const Value.absent(),
                Value<DateTime?> defenseDeadline = const Value.absent(),
                Value<DateTime?> defenseDate = const Value.absent(),
                Value<bool> flagTracking = const Value.absent(),
                Value<bool> flagPaid = const Value.absent(),
                Value<bool> flagIgnore = const Value.absent(),
                Value<String?> group = const Value.absent(),
                Value<String?> year = const Value.absent(),
                Value<enums.MscDefenseStatus> defenseStatus =
                    const Value.absent(),
              }) => ThesisCompanion(
                id: id,
                supervisorId: supervisorId,
                presidentId: presidentId,
                firstReviewerId: firstReviewerId,
                secondReviewerId: secondReviewerId,
                secretaryId: secretaryId,
                memberId: memberId,
                studentId: studentId,
                vietnameseTitle: vietnameseTitle,
                englishTitle: englishTitle,
                note: note,
                defenseDeadline: defenseDeadline,
                defenseDate: defenseDate,
                flagTracking: flagTracking,
                flagPaid: flagPaid,
                flagIgnore: flagIgnore,
                group: group,
                year: year,
                defenseStatus: defenseStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int supervisorId,
                Value<int?> presidentId = const Value.absent(),
                Value<int?> firstReviewerId = const Value.absent(),
                Value<int?> secondReviewerId = const Value.absent(),
                Value<int?> secretaryId = const Value.absent(),
                Value<int?> memberId = const Value.absent(),
                Value<int?> studentId = const Value.absent(),
                required String vietnameseTitle,
                required String englishTitle,
                Value<String> note = const Value.absent(),
                Value<DateTime?> defenseDeadline = const Value.absent(),
                Value<DateTime?> defenseDate = const Value.absent(),
                Value<bool> flagTracking = const Value.absent(),
                Value<bool> flagPaid = const Value.absent(),
                Value<bool> flagIgnore = const Value.absent(),
                Value<String?> group = const Value.absent(),
                Value<String?> year = const Value.absent(),
                required enums.MscDefenseStatus defenseStatus,
              }) => ThesisCompanion.insert(
                id: id,
                supervisorId: supervisorId,
                presidentId: presidentId,
                firstReviewerId: firstReviewerId,
                secondReviewerId: secondReviewerId,
                secretaryId: secretaryId,
                memberId: memberId,
                studentId: studentId,
                vietnameseTitle: vietnameseTitle,
                englishTitle: englishTitle,
                note: note,
                defenseDeadline: defenseDeadline,
                defenseDate: defenseDate,
                flagTracking: flagTracking,
                flagPaid: flagPaid,
                flagIgnore: flagIgnore,
                group: group,
                year: year,
                defenseStatus: defenseStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $ThesisReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback:
              ({
                supervisorId = false,
                presidentId = false,
                firstReviewerId = false,
                secondReviewerId = false,
                secretaryId = false,
                memberId = false,
                studentId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (supervisorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.supervisorId,
                                    referencedTable: $ThesisReferences
                                        ._supervisorIdTable(db),
                                    referencedColumn: $ThesisReferences
                                        ._supervisorIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (presidentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.presidentId,
                                    referencedTable: $ThesisReferences
                                        ._presidentIdTable(db),
                                    referencedColumn: $ThesisReferences
                                        ._presidentIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (firstReviewerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.firstReviewerId,
                                    referencedTable: $ThesisReferences
                                        ._firstReviewerIdTable(db),
                                    referencedColumn: $ThesisReferences
                                        ._firstReviewerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (secondReviewerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.secondReviewerId,
                                    referencedTable: $ThesisReferences
                                        ._secondReviewerIdTable(db),
                                    referencedColumn: $ThesisReferences
                                        ._secondReviewerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (secretaryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.secretaryId,
                                    referencedTable: $ThesisReferences
                                        ._secretaryIdTable(db),
                                    referencedColumn: $ThesisReferences
                                        ._secretaryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (memberId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.memberId,
                                    referencedTable: $ThesisReferences
                                        ._memberIdTable(db),
                                    referencedColumn: $ThesisReferences
                                        ._memberIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (studentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.studentId,
                                    referencedTable: $ThesisReferences
                                        ._studentIdTable(db),
                                    referencedColumn: $ThesisReferences
                                        ._studentIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $ThesisProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Thesis,
      ThesisData,
      $ThesisFilterComposer,
      $ThesisOrderingComposer,
      $ThesisAnnotationComposer,
      $ThesisCreateCompanionBuilder,
      $ThesisUpdateCompanionBuilder,
      (ThesisData, $ThesisReferences),
      ThesisData,
      PrefetchHooks Function({
        bool supervisorId,
        bool presidentId,
        bool firstReviewerId,
        bool secondReviewerId,
        bool secretaryId,
        bool memberId,
        bool studentId,
      })
    >;
typedef $AcademicGroupCreateCompanionBuilder =
    AcademicGroupCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> note,
    });
typedef $AcademicGroupUpdateCompanionBuilder =
    AcademicGroupCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> note,
    });

class $AcademicGroupFilterComposer
    extends Composer<_$AppDatabase, AcademicGroup> {
  $AcademicGroupFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $AcademicGroupOrderingComposer
    extends Composer<_$AppDatabase, AcademicGroup> {
  $AcademicGroupOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $AcademicGroupAnnotationComposer
    extends Composer<_$AppDatabase, AcademicGroup> {
  $AcademicGroupAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $AcademicGroupTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          AcademicGroup,
          AcademicGroupData,
          $AcademicGroupFilterComposer,
          $AcademicGroupOrderingComposer,
          $AcademicGroupAnnotationComposer,
          $AcademicGroupCreateCompanionBuilder,
          $AcademicGroupUpdateCompanionBuilder,
          (
            AcademicGroupData,
            BaseReferences<_$AppDatabase, AcademicGroup, AcademicGroupData>,
          ),
          AcademicGroupData,
          PrefetchHooks Function()
        > {
  $AcademicGroupTableManager(_$AppDatabase db, AcademicGroup table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AcademicGroupFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AcademicGroupOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AcademicGroupAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => AcademicGroupCompanion(id: id, name: name, note: note),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> note = const Value.absent(),
              }) =>
                  AcademicGroupCompanion.insert(id: id, name: name, note: note),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $AcademicGroupProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      AcademicGroup,
      AcademicGroupData,
      $AcademicGroupFilterComposer,
      $AcademicGroupOrderingComposer,
      $AcademicGroupAnnotationComposer,
      $AcademicGroupCreateCompanionBuilder,
      $AcademicGroupUpdateCompanionBuilder,
      (
        AcademicGroupData,
        BaseReferences<_$AppDatabase, AcademicGroup, AcademicGroupData>,
      ),
      AcademicGroupData,
      PrefetchHooks Function()
    >;
typedef $PhdCohortCreateCompanionBuilder =
    PhdCohortCompanion Function({
      required String cohort,
      Value<DateTime> createdTime,
      Value<DateTime> updatedTime,
      Value<int> rowid,
    });
typedef $PhdCohortUpdateCompanionBuilder =
    PhdCohortCompanion Function({
      Value<String> cohort,
      Value<DateTime> createdTime,
      Value<DateTime> updatedTime,
      Value<int> rowid,
    });

class $PhdCohortFilterComposer extends Composer<_$AppDatabase, PhdCohort> {
  $PhdCohortFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cohort => $composableBuilder(
    column: $table.cohort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );
}

class $PhdCohortOrderingComposer extends Composer<_$AppDatabase, PhdCohort> {
  $PhdCohortOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cohort => $composableBuilder(
    column: $table.cohort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $PhdCohortAnnotationComposer extends Composer<_$AppDatabase, PhdCohort> {
  $PhdCohortAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cohort =>
      $composableBuilder(column: $table.cohort, builder: (column) => column);

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );
}

class $PhdCohortTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          PhdCohort,
          PhdCohortData,
          $PhdCohortFilterComposer,
          $PhdCohortOrderingComposer,
          $PhdCohortAnnotationComposer,
          $PhdCohortCreateCompanionBuilder,
          $PhdCohortUpdateCompanionBuilder,
          (
            PhdCohortData,
            BaseReferences<_$AppDatabase, PhdCohort, PhdCohortData>,
          ),
          PhdCohortData,
          PrefetchHooks Function()
        > {
  $PhdCohortTableManager(_$AppDatabase db, PhdCohort table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $PhdCohortFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $PhdCohortOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $PhdCohortAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> cohort = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime> updatedTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhdCohortCompanion(
                cohort: cohort,
                createdTime: createdTime,
                updatedTime: updatedTime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cohort,
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime> updatedTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhdCohortCompanion.insert(
                cohort: cohort,
                createdTime: createdTime,
                updatedTime: updatedTime,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $PhdCohortProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      PhdCohort,
      PhdCohortData,
      $PhdCohortFilterComposer,
      $PhdCohortOrderingComposer,
      $PhdCohortAnnotationComposer,
      $PhdCohortCreateCompanionBuilder,
      $PhdCohortUpdateCompanionBuilder,
      (PhdCohortData, BaseReferences<_$AppDatabase, PhdCohort, PhdCohortData>),
      PhdCohortData,
      PrefetchHooks Function()
    >;
typedef $PhdStudentCreateCompanionBuilder =
    PhdStudentCompanion Function({
      Value<int> id,
      required String cohort,
      Value<String?> managementId,
      required String admissionId,
      required String name,
      Value<enums.Gender> gender,
      Value<DateTime?> dateOfBirth,
      Value<String?> placeOfBirth,
      required String phone,
      required String personalEmail,
      Value<String> majorName,
      Value<String> majorId,
      required enums.PhdSpecialization majorSpecialization,
      Value<int?> admissionPresidentId,
      Value<int?> admissionSecretaryId,
      Value<int?> admission1stMemberId,
      Value<int?> admission2ndMemberId,
      Value<int?> admission3rdMemberId,
      Value<bool> admissionPaid,
      required String thesis,
      required int supervisorId,
      Value<int?> secondarySupervisorId,
      Value<String?> schoolEmail,
      Value<String> createdTime,
      Value<String> updatedTime,
      required enums.StudentStatus status,
    });
typedef $PhdStudentUpdateCompanionBuilder =
    PhdStudentCompanion Function({
      Value<int> id,
      Value<String> cohort,
      Value<String?> managementId,
      Value<String> admissionId,
      Value<String> name,
      Value<enums.Gender> gender,
      Value<DateTime?> dateOfBirth,
      Value<String?> placeOfBirth,
      Value<String> phone,
      Value<String> personalEmail,
      Value<String> majorName,
      Value<String> majorId,
      Value<enums.PhdSpecialization> majorSpecialization,
      Value<int?> admissionPresidentId,
      Value<int?> admissionSecretaryId,
      Value<int?> admission1stMemberId,
      Value<int?> admission2ndMemberId,
      Value<int?> admission3rdMemberId,
      Value<bool> admissionPaid,
      Value<String> thesis,
      Value<int> supervisorId,
      Value<int?> secondarySupervisorId,
      Value<String?> schoolEmail,
      Value<String> createdTime,
      Value<String> updatedTime,
      Value<enums.StudentStatus> status,
    });

class $PhdStudentFilterComposer extends Composer<_$AppDatabase, PhdStudent> {
  $PhdStudentFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cohort => $composableBuilder(
    column: $table.cohort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get managementId => $composableBuilder(
    column: $table.managementId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get admissionId => $composableBuilder(
    column: $table.admissionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<enums.Gender, enums.Gender, String>
  get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get placeOfBirth => $composableBuilder(
    column: $table.placeOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get majorName => $composableBuilder(
    column: $table.majorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get majorId => $composableBuilder(
    column: $table.majorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    enums.PhdSpecialization,
    enums.PhdSpecialization,
    String
  >
  get majorSpecialization => $composableBuilder(
    column: $table.majorSpecialization,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get admissionPresidentId => $composableBuilder(
    column: $table.admissionPresidentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get admissionSecretaryId => $composableBuilder(
    column: $table.admissionSecretaryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get admission1stMemberId => $composableBuilder(
    column: $table.admission1stMemberId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get admission2ndMemberId => $composableBuilder(
    column: $table.admission2ndMemberId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get admission3rdMemberId => $composableBuilder(
    column: $table.admission3rdMemberId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get admissionPaid => $composableBuilder(
    column: $table.admissionPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thesis => $composableBuilder(
    column: $table.thesis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get supervisorId => $composableBuilder(
    column: $table.supervisorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get secondarySupervisorId => $composableBuilder(
    column: $table.secondarySupervisorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolEmail => $composableBuilder(
    column: $table.schoolEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    enums.StudentStatus,
    enums.StudentStatus,
    String
  >
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $PhdStudentOrderingComposer extends Composer<_$AppDatabase, PhdStudent> {
  $PhdStudentOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cohort => $composableBuilder(
    column: $table.cohort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get managementId => $composableBuilder(
    column: $table.managementId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get admissionId => $composableBuilder(
    column: $table.admissionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placeOfBirth => $composableBuilder(
    column: $table.placeOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get majorName => $composableBuilder(
    column: $table.majorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get majorId => $composableBuilder(
    column: $table.majorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get majorSpecialization => $composableBuilder(
    column: $table.majorSpecialization,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get admissionPresidentId => $composableBuilder(
    column: $table.admissionPresidentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get admissionSecretaryId => $composableBuilder(
    column: $table.admissionSecretaryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get admission1stMemberId => $composableBuilder(
    column: $table.admission1stMemberId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get admission2ndMemberId => $composableBuilder(
    column: $table.admission2ndMemberId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get admission3rdMemberId => $composableBuilder(
    column: $table.admission3rdMemberId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get admissionPaid => $composableBuilder(
    column: $table.admissionPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thesis => $composableBuilder(
    column: $table.thesis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get supervisorId => $composableBuilder(
    column: $table.supervisorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get secondarySupervisorId => $composableBuilder(
    column: $table.secondarySupervisorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolEmail => $composableBuilder(
    column: $table.schoolEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $PhdStudentAnnotationComposer
    extends Composer<_$AppDatabase, PhdStudent> {
  $PhdStudentAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cohort =>
      $composableBuilder(column: $table.cohort, builder: (column) => column);

  GeneratedColumn<String> get managementId => $composableBuilder(
    column: $table.managementId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get admissionId => $composableBuilder(
    column: $table.admissionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<enums.Gender, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get placeOfBirth => $composableBuilder(
    column: $table.placeOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get majorName =>
      $composableBuilder(column: $table.majorName, builder: (column) => column);

  GeneratedColumn<String> get majorId =>
      $composableBuilder(column: $table.majorId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<enums.PhdSpecialization, String>
  get majorSpecialization => $composableBuilder(
    column: $table.majorSpecialization,
    builder: (column) => column,
  );

  GeneratedColumn<int> get admissionPresidentId => $composableBuilder(
    column: $table.admissionPresidentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get admissionSecretaryId => $composableBuilder(
    column: $table.admissionSecretaryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get admission1stMemberId => $composableBuilder(
    column: $table.admission1stMemberId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get admission2ndMemberId => $composableBuilder(
    column: $table.admission2ndMemberId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get admission3rdMemberId => $composableBuilder(
    column: $table.admission3rdMemberId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get admissionPaid => $composableBuilder(
    column: $table.admissionPaid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thesis =>
      $composableBuilder(column: $table.thesis, builder: (column) => column);

  GeneratedColumn<int> get supervisorId => $composableBuilder(
    column: $table.supervisorId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get secondarySupervisorId => $composableBuilder(
    column: $table.secondarySupervisorId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get schoolEmail => $composableBuilder(
    column: $table.schoolEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<enums.StudentStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $PhdStudentTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          PhdStudent,
          PhdStudentData,
          $PhdStudentFilterComposer,
          $PhdStudentOrderingComposer,
          $PhdStudentAnnotationComposer,
          $PhdStudentCreateCompanionBuilder,
          $PhdStudentUpdateCompanionBuilder,
          (
            PhdStudentData,
            BaseReferences<_$AppDatabase, PhdStudent, PhdStudentData>,
          ),
          PhdStudentData,
          PrefetchHooks Function()
        > {
  $PhdStudentTableManager(_$AppDatabase db, PhdStudent table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $PhdStudentFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $PhdStudentOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $PhdStudentAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> cohort = const Value.absent(),
                Value<String?> managementId = const Value.absent(),
                Value<String> admissionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<enums.Gender> gender = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> placeOfBirth = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> personalEmail = const Value.absent(),
                Value<String> majorName = const Value.absent(),
                Value<String> majorId = const Value.absent(),
                Value<enums.PhdSpecialization> majorSpecialization =
                    const Value.absent(),
                Value<int?> admissionPresidentId = const Value.absent(),
                Value<int?> admissionSecretaryId = const Value.absent(),
                Value<int?> admission1stMemberId = const Value.absent(),
                Value<int?> admission2ndMemberId = const Value.absent(),
                Value<int?> admission3rdMemberId = const Value.absent(),
                Value<bool> admissionPaid = const Value.absent(),
                Value<String> thesis = const Value.absent(),
                Value<int> supervisorId = const Value.absent(),
                Value<int?> secondarySupervisorId = const Value.absent(),
                Value<String?> schoolEmail = const Value.absent(),
                Value<String> createdTime = const Value.absent(),
                Value<String> updatedTime = const Value.absent(),
                Value<enums.StudentStatus> status = const Value.absent(),
              }) => PhdStudentCompanion(
                id: id,
                cohort: cohort,
                managementId: managementId,
                admissionId: admissionId,
                name: name,
                gender: gender,
                dateOfBirth: dateOfBirth,
                placeOfBirth: placeOfBirth,
                phone: phone,
                personalEmail: personalEmail,
                majorName: majorName,
                majorId: majorId,
                majorSpecialization: majorSpecialization,
                admissionPresidentId: admissionPresidentId,
                admissionSecretaryId: admissionSecretaryId,
                admission1stMemberId: admission1stMemberId,
                admission2ndMemberId: admission2ndMemberId,
                admission3rdMemberId: admission3rdMemberId,
                admissionPaid: admissionPaid,
                thesis: thesis,
                supervisorId: supervisorId,
                secondarySupervisorId: secondarySupervisorId,
                schoolEmail: schoolEmail,
                createdTime: createdTime,
                updatedTime: updatedTime,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String cohort,
                Value<String?> managementId = const Value.absent(),
                required String admissionId,
                required String name,
                Value<enums.Gender> gender = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> placeOfBirth = const Value.absent(),
                required String phone,
                required String personalEmail,
                Value<String> majorName = const Value.absent(),
                Value<String> majorId = const Value.absent(),
                required enums.PhdSpecialization majorSpecialization,
                Value<int?> admissionPresidentId = const Value.absent(),
                Value<int?> admissionSecretaryId = const Value.absent(),
                Value<int?> admission1stMemberId = const Value.absent(),
                Value<int?> admission2ndMemberId = const Value.absent(),
                Value<int?> admission3rdMemberId = const Value.absent(),
                Value<bool> admissionPaid = const Value.absent(),
                required String thesis,
                required int supervisorId,
                Value<int?> secondarySupervisorId = const Value.absent(),
                Value<String?> schoolEmail = const Value.absent(),
                Value<String> createdTime = const Value.absent(),
                Value<String> updatedTime = const Value.absent(),
                required enums.StudentStatus status,
              }) => PhdStudentCompanion.insert(
                id: id,
                cohort: cohort,
                managementId: managementId,
                admissionId: admissionId,
                name: name,
                gender: gender,
                dateOfBirth: dateOfBirth,
                placeOfBirth: placeOfBirth,
                phone: phone,
                personalEmail: personalEmail,
                majorName: majorName,
                majorId: majorId,
                majorSpecialization: majorSpecialization,
                admissionPresidentId: admissionPresidentId,
                admissionSecretaryId: admissionSecretaryId,
                admission1stMemberId: admission1stMemberId,
                admission2ndMemberId: admission2ndMemberId,
                admission3rdMemberId: admission3rdMemberId,
                admissionPaid: admissionPaid,
                thesis: thesis,
                supervisorId: supervisorId,
                secondarySupervisorId: secondarySupervisorId,
                schoolEmail: schoolEmail,
                createdTime: createdTime,
                updatedTime: updatedTime,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $PhdStudentProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      PhdStudent,
      PhdStudentData,
      $PhdStudentFilterComposer,
      $PhdStudentOrderingComposer,
      $PhdStudentAnnotationComposer,
      $PhdStudentCreateCompanionBuilder,
      $PhdStudentUpdateCompanionBuilder,
      (
        PhdStudentData,
        BaseReferences<_$AppDatabase, PhdStudent, PhdStudentData>,
      ),
      PhdStudentData,
      PrefetchHooks Function()
    >;
typedef $TeachingRegistrationCreateCompanionBuilder =
    TeachingRegistrationCompanion Function({
      required int teacherId,
      required String courseId,
      Value<int> rowid,
    });
typedef $TeachingRegistrationUpdateCompanionBuilder =
    TeachingRegistrationCompanion Function({
      Value<int> teacherId,
      Value<String> courseId,
      Value<int> rowid,
    });

final class $TeachingRegistrationReferences
    extends
        BaseReferences<
          _$AppDatabase,
          TeachingRegistration,
          TeachingRegistrationData
        > {
  $TeachingRegistrationReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static Teacher _teacherIdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.teachingRegistration.teacherId, db.teacher.id),
  );

  $TeacherProcessedTableManager get teacherId {
    final $_column = $_itemColumn<int>('teacher_id')!;

    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Course _courseIdTable(_$AppDatabase db) => db.course.createAlias(
    $_aliasNameGenerator(db.teachingRegistration.courseId, db.course.id),
  );

  $CourseProcessedTableManager get courseId {
    final $_column = $_itemColumn<String>('course_id')!;

    final manager = $CourseTableManager(
      $_db,
      $_db.course,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $TeachingRegistrationFilterComposer
    extends Composer<_$AppDatabase, TeachingRegistration> {
  $TeachingRegistrationFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $TeacherFilterComposer get teacherId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $CourseFilterComposer get courseId {
    final $CourseFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.course,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseFilterComposer(
            $db: $db,
            $table: $db.course,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TeachingRegistrationOrderingComposer
    extends Composer<_$AppDatabase, TeachingRegistration> {
  $TeachingRegistrationOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $TeacherOrderingComposer get teacherId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $CourseOrderingComposer get courseId {
    final $CourseOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.course,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseOrderingComposer(
            $db: $db,
            $table: $db.course,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TeachingRegistrationAnnotationComposer
    extends Composer<_$AppDatabase, TeachingRegistration> {
  $TeachingRegistrationAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $TeacherAnnotationComposer get teacherId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $CourseAnnotationComposer get courseId {
    final $CourseAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.course,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseAnnotationComposer(
            $db: $db,
            $table: $db.course,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TeachingRegistrationTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          TeachingRegistration,
          TeachingRegistrationData,
          $TeachingRegistrationFilterComposer,
          $TeachingRegistrationOrderingComposer,
          $TeachingRegistrationAnnotationComposer,
          $TeachingRegistrationCreateCompanionBuilder,
          $TeachingRegistrationUpdateCompanionBuilder,
          (TeachingRegistrationData, $TeachingRegistrationReferences),
          TeachingRegistrationData,
          PrefetchHooks Function({bool teacherId, bool courseId})
        > {
  $TeachingRegistrationTableManager(
    _$AppDatabase db,
    TeachingRegistration table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TeachingRegistrationFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TeachingRegistrationOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TeachingRegistrationAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> teacherId = const Value.absent(),
                Value<String> courseId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TeachingRegistrationCompanion(
                teacherId: teacherId,
                courseId: courseId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int teacherId,
                required String courseId,
                Value<int> rowid = const Value.absent(),
              }) => TeachingRegistrationCompanion.insert(
                teacherId: teacherId,
                courseId: courseId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $TeachingRegistrationReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({teacherId = false, courseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (teacherId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.teacherId,
                                referencedTable: $TeachingRegistrationReferences
                                    ._teacherIdTable(db),
                                referencedColumn:
                                    $TeachingRegistrationReferences
                                        ._teacherIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (courseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.courseId,
                                referencedTable: $TeachingRegistrationReferences
                                    ._courseIdTable(db),
                                referencedColumn:
                                    $TeachingRegistrationReferences
                                        ._courseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $TeachingRegistrationProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      TeachingRegistration,
      TeachingRegistrationData,
      $TeachingRegistrationFilterComposer,
      $TeachingRegistrationOrderingComposer,
      $TeachingRegistrationAnnotationComposer,
      $TeachingRegistrationCreateCompanionBuilder,
      $TeachingRegistrationUpdateCompanionBuilder,
      (TeachingRegistrationData, $TeachingRegistrationReferences),
      TeachingRegistrationData,
      PrefetchHooks Function({bool teacherId, bool courseId})
    >;
typedef $CourseLimitingCreateCompanionBuilder =
    CourseLimitingCompanion Function({
      required int courseId,
      required String semesterId,
      Value<int> rowid,
    });
typedef $CourseLimitingUpdateCompanionBuilder =
    CourseLimitingCompanion Function({
      Value<int> courseId,
      Value<String> semesterId,
      Value<int> rowid,
    });

final class $CourseLimitingReferences
    extends BaseReferences<_$AppDatabase, CourseLimiting, CourseLimitingData> {
  $CourseLimitingReferences(super.$_db, super.$_table, super.$_typedResult);

  static Semester _semesterIdTable(_$AppDatabase db) => db.semester.createAlias(
    $_aliasNameGenerator(db.courseLimiting.semesterId, db.semester.id),
  );

  $SemesterProcessedTableManager get semesterId {
    final $_column = $_itemColumn<String>('semester_id')!;

    final manager = $SemesterTableManager(
      $_db,
      $_db.semester,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_semesterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $CourseLimitingFilterComposer
    extends Composer<_$AppDatabase, CourseLimiting> {
  $CourseLimitingFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $SemesterFilterComposer get semesterId {
    final $SemesterFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semesterId,
      referencedTable: $db.semester,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SemesterFilterComposer(
            $db: $db,
            $table: $db.semester,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $CourseLimitingOrderingComposer
    extends Composer<_$AppDatabase, CourseLimiting> {
  $CourseLimitingOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $SemesterOrderingComposer get semesterId {
    final $SemesterOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semesterId,
      referencedTable: $db.semester,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SemesterOrderingComposer(
            $db: $db,
            $table: $db.semester,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $CourseLimitingAnnotationComposer
    extends Composer<_$AppDatabase, CourseLimiting> {
  $CourseLimitingAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $SemesterAnnotationComposer get semesterId {
    final $SemesterAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semesterId,
      referencedTable: $db.semester,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SemesterAnnotationComposer(
            $db: $db,
            $table: $db.semester,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $CourseLimitingTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CourseLimiting,
          CourseLimitingData,
          $CourseLimitingFilterComposer,
          $CourseLimitingOrderingComposer,
          $CourseLimitingAnnotationComposer,
          $CourseLimitingCreateCompanionBuilder,
          $CourseLimitingUpdateCompanionBuilder,
          (CourseLimitingData, $CourseLimitingReferences),
          CourseLimitingData,
          PrefetchHooks Function({bool semesterId})
        > {
  $CourseLimitingTableManager(_$AppDatabase db, CourseLimiting table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CourseLimitingFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CourseLimitingOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CourseLimitingAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> courseId = const Value.absent(),
                Value<String> semesterId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CourseLimitingCompanion(
                courseId: courseId,
                semesterId: semesterId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int courseId,
                required String semesterId,
                Value<int> rowid = const Value.absent(),
              }) => CourseLimitingCompanion.insert(
                courseId: courseId,
                semesterId: semesterId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $CourseLimitingReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({semesterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (semesterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.semesterId,
                                referencedTable: $CourseLimitingReferences
                                    ._semesterIdTable(db),
                                referencedColumn: $CourseLimitingReferences
                                    ._semesterIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $CourseLimitingProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CourseLimiting,
      CourseLimitingData,
      $CourseLimitingFilterComposer,
      $CourseLimitingOrderingComposer,
      $CourseLimitingAnnotationComposer,
      $CourseLimitingCreateCompanionBuilder,
      $CourseLimitingUpdateCompanionBuilder,
      (CourseLimitingData, $CourseLimitingReferences),
      CourseLimitingData,
      PrefetchHooks Function({bool semesterId})
    >;
typedef $CourseClassCreateCompanionBuilder =
    CourseClassCompanion Function({
      Value<int> id,
      required String classId,
      required String courseId,
      Value<int?> teacherId,
      Value<int> registrationCount,
      Value<String?> accessUrl,
      Value<DateTime?> customBeginDate,
      Value<DateTime?> customEndDate,
      required String semester,
      Value<String?> classroom,
      Value<enums.DayOfWeek?> dayOfWeek,
      Value<int?> startPeriod,
      Value<int?> endPeriod,
      Value<enums.CourseClassStatus?> status,
    });
typedef $CourseClassUpdateCompanionBuilder =
    CourseClassCompanion Function({
      Value<int> id,
      Value<String> classId,
      Value<String> courseId,
      Value<int?> teacherId,
      Value<int> registrationCount,
      Value<String?> accessUrl,
      Value<DateTime?> customBeginDate,
      Value<DateTime?> customEndDate,
      Value<String> semester,
      Value<String?> classroom,
      Value<enums.DayOfWeek?> dayOfWeek,
      Value<int?> startPeriod,
      Value<int?> endPeriod,
      Value<enums.CourseClassStatus?> status,
    });

final class $CourseClassReferences
    extends BaseReferences<_$AppDatabase, CourseClass, CourseClassData> {
  $CourseClassReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<TeachingAssignment, List<TeachingAssignmentData>>
  _teachingAssignmentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.teachingAssignment,
        aliasName: $_aliasNameGenerator(
          db.courseClass.id,
          db.teachingAssignment.classId,
        ),
      );

  $TeachingAssignmentProcessedTableManager get teachingAssignmentRefs {
    final manager = $TeachingAssignmentTableManager(
      $_db,
      $_db.teachingAssignment,
    ).filter((f) => f.classId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _teachingAssignmentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<StudyRegistration, List<StudyRegistrationData>>
  _studyRegistrationRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.studyRegistration,
        aliasName: $_aliasNameGenerator(
          db.courseClass.id,
          db.studyRegistration.classId,
        ),
      );

  $StudyRegistrationProcessedTableManager get studyRegistrationRefs {
    final manager = $StudyRegistrationTableManager(
      $_db,
      $_db.studyRegistration,
    ).filter((f) => f.classId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _studyRegistrationRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $CourseClassFilterComposer extends Composer<_$AppDatabase, CourseClass> {
  $CourseClassFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get classId => $composableBuilder(
    column: $table.classId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get registrationCount => $composableBuilder(
    column: $table.registrationCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accessUrl => $composableBuilder(
    column: $table.accessUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get customBeginDate => $composableBuilder(
    column: $table.customBeginDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get customEndDate => $composableBuilder(
    column: $table.customEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get semester => $composableBuilder(
    column: $table.semester,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get classroom => $composableBuilder(
    column: $table.classroom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<enums.DayOfWeek?, enums.DayOfWeek, int>
  get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get startPeriod => $composableBuilder(
    column: $table.startPeriod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endPeriod => $composableBuilder(
    column: $table.endPeriod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    enums.CourseClassStatus?,
    enums.CourseClassStatus,
    int
  >
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> teachingAssignmentRefs(
    Expression<bool> Function($TeachingAssignmentFilterComposer f) f,
  ) {
    final $TeachingAssignmentFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teachingAssignment,
      getReferencedColumn: (t) => t.classId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeachingAssignmentFilterComposer(
            $db: $db,
            $table: $db.teachingAssignment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> studyRegistrationRefs(
    Expression<bool> Function($StudyRegistrationFilterComposer f) f,
  ) {
    final $StudyRegistrationFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studyRegistration,
      getReferencedColumn: (t) => t.classId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudyRegistrationFilterComposer(
            $db: $db,
            $table: $db.studyRegistration,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $CourseClassOrderingComposer
    extends Composer<_$AppDatabase, CourseClass> {
  $CourseClassOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get classId => $composableBuilder(
    column: $table.classId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get registrationCount => $composableBuilder(
    column: $table.registrationCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accessUrl => $composableBuilder(
    column: $table.accessUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get customBeginDate => $composableBuilder(
    column: $table.customBeginDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get customEndDate => $composableBuilder(
    column: $table.customEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get semester => $composableBuilder(
    column: $table.semester,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get classroom => $composableBuilder(
    column: $table.classroom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startPeriod => $composableBuilder(
    column: $table.startPeriod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endPeriod => $composableBuilder(
    column: $table.endPeriod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CourseClassAnnotationComposer
    extends Composer<_$AppDatabase, CourseClass> {
  $CourseClassAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get classId =>
      $composableBuilder(column: $table.classId, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<int> get teacherId =>
      $composableBuilder(column: $table.teacherId, builder: (column) => column);

  GeneratedColumn<int> get registrationCount => $composableBuilder(
    column: $table.registrationCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accessUrl =>
      $composableBuilder(column: $table.accessUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get customBeginDate => $composableBuilder(
    column: $table.customBeginDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get customEndDate => $composableBuilder(
    column: $table.customEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get semester =>
      $composableBuilder(column: $table.semester, builder: (column) => column);

  GeneratedColumn<String> get classroom =>
      $composableBuilder(column: $table.classroom, builder: (column) => column);

  GeneratedColumnWithTypeConverter<enums.DayOfWeek?, int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<int> get startPeriod => $composableBuilder(
    column: $table.startPeriod,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endPeriod =>
      $composableBuilder(column: $table.endPeriod, builder: (column) => column);

  GeneratedColumnWithTypeConverter<enums.CourseClassStatus?, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  Expression<T> teachingAssignmentRefs<T extends Object>(
    Expression<T> Function($TeachingAssignmentAnnotationComposer a) f,
  ) {
    final $TeachingAssignmentAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teachingAssignment,
      getReferencedColumn: (t) => t.classId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeachingAssignmentAnnotationComposer(
            $db: $db,
            $table: $db.teachingAssignment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> studyRegistrationRefs<T extends Object>(
    Expression<T> Function($StudyRegistrationAnnotationComposer a) f,
  ) {
    final $StudyRegistrationAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studyRegistration,
      getReferencedColumn: (t) => t.classId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudyRegistrationAnnotationComposer(
            $db: $db,
            $table: $db.studyRegistration,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $CourseClassTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CourseClass,
          CourseClassData,
          $CourseClassFilterComposer,
          $CourseClassOrderingComposer,
          $CourseClassAnnotationComposer,
          $CourseClassCreateCompanionBuilder,
          $CourseClassUpdateCompanionBuilder,
          (CourseClassData, $CourseClassReferences),
          CourseClassData,
          PrefetchHooks Function({
            bool teachingAssignmentRefs,
            bool studyRegistrationRefs,
          })
        > {
  $CourseClassTableManager(_$AppDatabase db, CourseClass table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CourseClassFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CourseClassOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CourseClassAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> classId = const Value.absent(),
                Value<String> courseId = const Value.absent(),
                Value<int?> teacherId = const Value.absent(),
                Value<int> registrationCount = const Value.absent(),
                Value<String?> accessUrl = const Value.absent(),
                Value<DateTime?> customBeginDate = const Value.absent(),
                Value<DateTime?> customEndDate = const Value.absent(),
                Value<String> semester = const Value.absent(),
                Value<String?> classroom = const Value.absent(),
                Value<enums.DayOfWeek?> dayOfWeek = const Value.absent(),
                Value<int?> startPeriod = const Value.absent(),
                Value<int?> endPeriod = const Value.absent(),
                Value<enums.CourseClassStatus?> status = const Value.absent(),
              }) => CourseClassCompanion(
                id: id,
                classId: classId,
                courseId: courseId,
                teacherId: teacherId,
                registrationCount: registrationCount,
                accessUrl: accessUrl,
                customBeginDate: customBeginDate,
                customEndDate: customEndDate,
                semester: semester,
                classroom: classroom,
                dayOfWeek: dayOfWeek,
                startPeriod: startPeriod,
                endPeriod: endPeriod,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String classId,
                required String courseId,
                Value<int?> teacherId = const Value.absent(),
                Value<int> registrationCount = const Value.absent(),
                Value<String?> accessUrl = const Value.absent(),
                Value<DateTime?> customBeginDate = const Value.absent(),
                Value<DateTime?> customEndDate = const Value.absent(),
                required String semester,
                Value<String?> classroom = const Value.absent(),
                Value<enums.DayOfWeek?> dayOfWeek = const Value.absent(),
                Value<int?> startPeriod = const Value.absent(),
                Value<int?> endPeriod = const Value.absent(),
                Value<enums.CourseClassStatus?> status = const Value.absent(),
              }) => CourseClassCompanion.insert(
                id: id,
                classId: classId,
                courseId: courseId,
                teacherId: teacherId,
                registrationCount: registrationCount,
                accessUrl: accessUrl,
                customBeginDate: customBeginDate,
                customEndDate: customEndDate,
                semester: semester,
                classroom: classroom,
                dayOfWeek: dayOfWeek,
                startPeriod: startPeriod,
                endPeriod: endPeriod,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $CourseClassReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                teachingAssignmentRefs = false,
                studyRegistrationRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (teachingAssignmentRefs) db.teachingAssignment,
                    if (studyRegistrationRefs) db.studyRegistration,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (teachingAssignmentRefs)
                        await $_getPrefetchedData<
                          CourseClassData,
                          CourseClass,
                          TeachingAssignmentData
                        >(
                          currentTable: table,
                          referencedTable: $CourseClassReferences
                              ._teachingAssignmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $CourseClassReferences(
                                db,
                                table,
                                p0,
                              ).teachingAssignmentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.classId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (studyRegistrationRefs)
                        await $_getPrefetchedData<
                          CourseClassData,
                          CourseClass,
                          StudyRegistrationData
                        >(
                          currentTable: table,
                          referencedTable: $CourseClassReferences
                              ._studyRegistrationRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $CourseClassReferences(
                                db,
                                table,
                                p0,
                              ).studyRegistrationRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.classId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $CourseClassProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CourseClass,
      CourseClassData,
      $CourseClassFilterComposer,
      $CourseClassOrderingComposer,
      $CourseClassAnnotationComposer,
      $CourseClassCreateCompanionBuilder,
      $CourseClassUpdateCompanionBuilder,
      (CourseClassData, $CourseClassReferences),
      CourseClassData,
      PrefetchHooks Function({
        bool teachingAssignmentRefs,
        bool studyRegistrationRefs,
      })
    >;
typedef $TeachingAssignmentCreateCompanionBuilder =
    TeachingAssignmentCompanion Function({
      required int classId,
      required int teacherId,
      Value<int> sortOrder,
      Value<double> weight,
      Value<int> rowid,
    });
typedef $TeachingAssignmentUpdateCompanionBuilder =
    TeachingAssignmentCompanion Function({
      Value<int> classId,
      Value<int> teacherId,
      Value<int> sortOrder,
      Value<double> weight,
      Value<int> rowid,
    });

final class $TeachingAssignmentReferences
    extends
        BaseReferences<
          _$AppDatabase,
          TeachingAssignment,
          TeachingAssignmentData
        > {
  $TeachingAssignmentReferences(super.$_db, super.$_table, super.$_typedResult);

  static CourseClass _classIdTable(_$AppDatabase db) =>
      db.courseClass.createAlias(
        $_aliasNameGenerator(db.teachingAssignment.classId, db.courseClass.id),
      );

  $CourseClassProcessedTableManager get classId {
    final $_column = $_itemColumn<int>('class_id')!;

    final manager = $CourseClassTableManager(
      $_db,
      $_db.courseClass,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_classIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Teacher _teacherIdTable(_$AppDatabase db) => db.teacher.createAlias(
    $_aliasNameGenerator(db.teachingAssignment.teacherId, db.teacher.id),
  );

  $TeacherProcessedTableManager get teacherId {
    final $_column = $_itemColumn<int>('teacher_id')!;

    final manager = $TeacherTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $TeachingAssignmentFilterComposer
    extends Composer<_$AppDatabase, TeachingAssignment> {
  $TeachingAssignmentFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  $CourseClassFilterComposer get classId {
    final $CourseClassFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.courseClass,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseClassFilterComposer(
            $db: $db,
            $table: $db.courseClass,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherFilterComposer get teacherId {
    final $TeacherFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TeachingAssignmentOrderingComposer
    extends Composer<_$AppDatabase, TeachingAssignment> {
  $TeachingAssignmentOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  $CourseClassOrderingComposer get classId {
    final $CourseClassOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.courseClass,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseClassOrderingComposer(
            $db: $db,
            $table: $db.courseClass,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherOrderingComposer get teacherId {
    final $TeacherOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherOrderingComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TeachingAssignmentAnnotationComposer
    extends Composer<_$AppDatabase, TeachingAssignment> {
  $TeachingAssignmentAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  $CourseClassAnnotationComposer get classId {
    final $CourseClassAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.courseClass,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseClassAnnotationComposer(
            $db: $db,
            $table: $db.courseClass,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $TeacherAnnotationComposer get teacherId {
    final $TeacherAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TeacherAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TeachingAssignmentTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          TeachingAssignment,
          TeachingAssignmentData,
          $TeachingAssignmentFilterComposer,
          $TeachingAssignmentOrderingComposer,
          $TeachingAssignmentAnnotationComposer,
          $TeachingAssignmentCreateCompanionBuilder,
          $TeachingAssignmentUpdateCompanionBuilder,
          (TeachingAssignmentData, $TeachingAssignmentReferences),
          TeachingAssignmentData,
          PrefetchHooks Function({bool classId, bool teacherId})
        > {
  $TeachingAssignmentTableManager(_$AppDatabase db, TeachingAssignment table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TeachingAssignmentFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TeachingAssignmentOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TeachingAssignmentAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> classId = const Value.absent(),
                Value<int> teacherId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TeachingAssignmentCompanion(
                classId: classId,
                teacherId: teacherId,
                sortOrder: sortOrder,
                weight: weight,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int classId,
                required int teacherId,
                Value<int> sortOrder = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TeachingAssignmentCompanion.insert(
                classId: classId,
                teacherId: teacherId,
                sortOrder: sortOrder,
                weight: weight,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $TeachingAssignmentReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({classId = false, teacherId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (classId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.classId,
                                referencedTable: $TeachingAssignmentReferences
                                    ._classIdTable(db),
                                referencedColumn: $TeachingAssignmentReferences
                                    ._classIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (teacherId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.teacherId,
                                referencedTable: $TeachingAssignmentReferences
                                    ._teacherIdTable(db),
                                referencedColumn: $TeachingAssignmentReferences
                                    ._teacherIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $TeachingAssignmentProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      TeachingAssignment,
      TeachingAssignmentData,
      $TeachingAssignmentFilterComposer,
      $TeachingAssignmentOrderingComposer,
      $TeachingAssignmentAnnotationComposer,
      $TeachingAssignmentCreateCompanionBuilder,
      $TeachingAssignmentUpdateCompanionBuilder,
      (TeachingAssignmentData, $TeachingAssignmentReferences),
      TeachingAssignmentData,
      PrefetchHooks Function({bool classId, bool teacherId})
    >;
typedef $StudyRegistrationCreateCompanionBuilder =
    StudyRegistrationCompanion Function({
      required int classId,
      required int studentId,
      Value<double?> midTermGrade,
      Value<double?> finalTermGrade,
      Value<int> rowid,
    });
typedef $StudyRegistrationUpdateCompanionBuilder =
    StudyRegistrationCompanion Function({
      Value<int> classId,
      Value<int> studentId,
      Value<double?> midTermGrade,
      Value<double?> finalTermGrade,
      Value<int> rowid,
    });

final class $StudyRegistrationReferences
    extends
        BaseReferences<
          _$AppDatabase,
          StudyRegistration,
          StudyRegistrationData
        > {
  $StudyRegistrationReferences(super.$_db, super.$_table, super.$_typedResult);

  static CourseClass _classIdTable(_$AppDatabase db) =>
      db.courseClass.createAlias(
        $_aliasNameGenerator(db.studyRegistration.classId, db.courseClass.id),
      );

  $CourseClassProcessedTableManager get classId {
    final $_column = $_itemColumn<int>('class_id')!;

    final manager = $CourseClassTableManager(
      $_db,
      $_db.courseClass,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_classIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Student _studentIdTable(_$AppDatabase db) => db.student.createAlias(
    $_aliasNameGenerator(db.studyRegistration.studentId, db.student.id),
  );

  $StudentProcessedTableManager get studentId {
    final $_column = $_itemColumn<int>('student_id')!;

    final manager = $StudentTableManager(
      $_db,
      $_db.student,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $StudyRegistrationFilterComposer
    extends Composer<_$AppDatabase, StudyRegistration> {
  $StudyRegistrationFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get midTermGrade => $composableBuilder(
    column: $table.midTermGrade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get finalTermGrade => $composableBuilder(
    column: $table.finalTermGrade,
    builder: (column) => ColumnFilters(column),
  );

  $CourseClassFilterComposer get classId {
    final $CourseClassFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.courseClass,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseClassFilterComposer(
            $db: $db,
            $table: $db.courseClass,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $StudentFilterComposer get studentId {
    final $StudentFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.student,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudentFilterComposer(
            $db: $db,
            $table: $db.student,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $StudyRegistrationOrderingComposer
    extends Composer<_$AppDatabase, StudyRegistration> {
  $StudyRegistrationOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get midTermGrade => $composableBuilder(
    column: $table.midTermGrade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get finalTermGrade => $composableBuilder(
    column: $table.finalTermGrade,
    builder: (column) => ColumnOrderings(column),
  );

  $CourseClassOrderingComposer get classId {
    final $CourseClassOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.courseClass,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseClassOrderingComposer(
            $db: $db,
            $table: $db.courseClass,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $StudentOrderingComposer get studentId {
    final $StudentOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.student,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudentOrderingComposer(
            $db: $db,
            $table: $db.student,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $StudyRegistrationAnnotationComposer
    extends Composer<_$AppDatabase, StudyRegistration> {
  $StudyRegistrationAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get midTermGrade => $composableBuilder(
    column: $table.midTermGrade,
    builder: (column) => column,
  );

  GeneratedColumn<double> get finalTermGrade => $composableBuilder(
    column: $table.finalTermGrade,
    builder: (column) => column,
  );

  $CourseClassAnnotationComposer get classId {
    final $CourseClassAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.courseClass,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $CourseClassAnnotationComposer(
            $db: $db,
            $table: $db.courseClass,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $StudentAnnotationComposer get studentId {
    final $StudentAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.student,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $StudentAnnotationComposer(
            $db: $db,
            $table: $db.student,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $StudyRegistrationTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          StudyRegistration,
          StudyRegistrationData,
          $StudyRegistrationFilterComposer,
          $StudyRegistrationOrderingComposer,
          $StudyRegistrationAnnotationComposer,
          $StudyRegistrationCreateCompanionBuilder,
          $StudyRegistrationUpdateCompanionBuilder,
          (StudyRegistrationData, $StudyRegistrationReferences),
          StudyRegistrationData,
          PrefetchHooks Function({bool classId, bool studentId})
        > {
  $StudyRegistrationTableManager(_$AppDatabase db, StudyRegistration table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $StudyRegistrationFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $StudyRegistrationOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $StudyRegistrationAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> classId = const Value.absent(),
                Value<int> studentId = const Value.absent(),
                Value<double?> midTermGrade = const Value.absent(),
                Value<double?> finalTermGrade = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudyRegistrationCompanion(
                classId: classId,
                studentId: studentId,
                midTermGrade: midTermGrade,
                finalTermGrade: finalTermGrade,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int classId,
                required int studentId,
                Value<double?> midTermGrade = const Value.absent(),
                Value<double?> finalTermGrade = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudyRegistrationCompanion.insert(
                classId: classId,
                studentId: studentId,
                midTermGrade: midTermGrade,
                finalTermGrade: finalTermGrade,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $StudyRegistrationReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({classId = false, studentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (classId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.classId,
                                referencedTable: $StudyRegistrationReferences
                                    ._classIdTable(db),
                                referencedColumn: $StudyRegistrationReferences
                                    ._classIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (studentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.studentId,
                                referencedTable: $StudyRegistrationReferences
                                    ._studentIdTable(db),
                                referencedColumn: $StudyRegistrationReferences
                                    ._studentIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $StudyRegistrationProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      StudyRegistration,
      StudyRegistrationData,
      $StudyRegistrationFilterComposer,
      $StudyRegistrationOrderingComposer,
      $StudyRegistrationAnnotationComposer,
      $StudyRegistrationCreateCompanionBuilder,
      $StudyRegistrationUpdateCompanionBuilder,
      (StudyRegistrationData, $StudyRegistrationReferences),
      StudyRegistrationData,
      PrefetchHooks Function({bool classId, bool studentId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $TeacherFtsTableManager get teacherFts =>
      $TeacherFtsTableManager(_db, _db.teacherFts);
  $TeacherGroupTableManager get teacherGroup =>
      $TeacherGroupTableManager(_db, _db.teacherGroup);
  $TeacherTableManager get teacher => $TeacherTableManager(_db, _db.teacher);
  $CourseFtsTableManager get courseFts =>
      $CourseFtsTableManager(_db, _db.courseFts);
  $CourseTableManager get course => $CourseTableManager(_db, _db.course);
  $ThesisFtsTableManager get thesisFts =>
      $ThesisFtsTableManager(_db, _db.thesisFts);
  $PreferenceTableManager get preference =>
      $PreferenceTableManager(_db, _db.preference);
  $DocumentRoleTableManager get documentRole =>
      $DocumentRoleTableManager(_db, _db.documentRole);
  $DocumentTableManager get document =>
      $DocumentTableManager(_db, _db.document);
  $CohortTableManager get cohort => $CohortTableManager(_db, _db.cohort);
  $AdmissionCouncilTableManager get admissionCouncil =>
      $AdmissionCouncilTableManager(_db, _db.admissionCouncil);
  $StudentTableManager get student => $StudentTableManager(_db, _db.student);
  $SemesterTableManager get semester =>
      $SemesterTableManager(_db, _db.semester);
  $ThesisTableManager get thesis => $ThesisTableManager(_db, _db.thesis);
  $AcademicGroupTableManager get academicGroup =>
      $AcademicGroupTableManager(_db, _db.academicGroup);
  $PhdCohortTableManager get phdCohort =>
      $PhdCohortTableManager(_db, _db.phdCohort);
  $PhdStudentTableManager get phdStudent =>
      $PhdStudentTableManager(_db, _db.phdStudent);
  $TeachingRegistrationTableManager get teachingRegistration =>
      $TeachingRegistrationTableManager(_db, _db.teachingRegistration);
  $CourseLimitingTableManager get courseLimiting =>
      $CourseLimitingTableManager(_db, _db.courseLimiting);
  $CourseClassTableManager get courseClass =>
      $CourseClassTableManager(_db, _db.courseClass);
  $TeachingAssignmentTableManager get teachingAssignment =>
      $TeachingAssignmentTableManager(_db, _db.teachingAssignment);
  $StudyRegistrationTableManager get studyRegistration =>
      $StudyRegistrationTableManager(_db, _db.studyRegistration);
}
