// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class NienKhoa extends Table with TableInfo<NienKhoa, NienKhoaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  NienKhoa(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> cohort = GeneratedColumn<String>(
    'nienKhoa',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> groupUrl = GeneratedColumn<String>(
    'groupUrl',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT ()',
    defaultValue: const CustomExpression(''),
  );
  @override
  List<GeneratedColumn> get $columns => [cohort, groupUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'NienKhoa';
  @override
  Set<GeneratedColumn> get $primaryKey => {cohort};
  @override
  NienKhoaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NienKhoaData(
      cohort: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nienKhoa'],
      )!,
      groupUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}groupUrl'],
      )!,
    );
  }

  @override
  NienKhoa createAlias(String alias) {
    return NienKhoa(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class NienKhoaData extends DataClass implements Insertable<NienKhoaData> {
  final String cohort;
  final String groupUrl;
  const NienKhoaData({required this.cohort, required this.groupUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nienKhoa'] = Variable<String>(cohort);
    map['groupUrl'] = Variable<String>(groupUrl);
    return map;
  }

  NienKhoaCompanion toCompanion(bool nullToAbsent) {
    return NienKhoaCompanion(cohort: Value(cohort), groupUrl: Value(groupUrl));
  }

  factory NienKhoaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NienKhoaData(
      cohort: serializer.fromJson<String>(json['cohort']),
      groupUrl: serializer.fromJson<String>(json['groupUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cohort': serializer.toJson<String>(cohort),
      'groupUrl': serializer.toJson<String>(groupUrl),
    };
  }

  NienKhoaData copyWith({String? cohort, String? groupUrl}) => NienKhoaData(
    cohort: cohort ?? this.cohort,
    groupUrl: groupUrl ?? this.groupUrl,
  );
  NienKhoaData copyWithCompanion(NienKhoaCompanion data) {
    return NienKhoaData(
      cohort: data.cohort.present ? data.cohort.value : this.cohort,
      groupUrl: data.groupUrl.present ? data.groupUrl.value : this.groupUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NienKhoaData(')
          ..write('cohort: $cohort, ')
          ..write('groupUrl: $groupUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cohort, groupUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NienKhoaData &&
          other.cohort == this.cohort &&
          other.groupUrl == this.groupUrl);
}

class NienKhoaCompanion extends UpdateCompanion<NienKhoaData> {
  final Value<String> cohort;
  final Value<String> groupUrl;
  final Value<int> rowid;
  const NienKhoaCompanion({
    this.cohort = const Value.absent(),
    this.groupUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NienKhoaCompanion.insert({
    required String cohort,
    this.groupUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cohort = Value(cohort);
  static Insertable<NienKhoaData> custom({
    Expression<String>? cohort,
    Expression<String>? groupUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cohort != null) 'nienKhoa': cohort,
      if (groupUrl != null) 'groupUrl': groupUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NienKhoaCompanion copyWith({
    Value<String>? cohort,
    Value<String>? groupUrl,
    Value<int>? rowid,
  }) {
    return NienKhoaCompanion(
      cohort: cohort ?? this.cohort,
      groupUrl: groupUrl ?? this.groupUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cohort.present) {
      map['nienKhoa'] = Variable<String>(cohort.value);
    }
    if (groupUrl.present) {
      map['groupUrl'] = Variable<String>(groupUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NienKhoaCompanion(')
          ..write('cohort: $cohort, ')
          ..write('groupUrl: $groupUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Giangvien extends Table with TableInfo<Giangvien, GiangvienData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Giangvien(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<String> managementId = GeneratedColumn<String>(
    'maCanBo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'hoTen',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'donVi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<bool> isOutsider = GeneratedColumn<bool>(
    'ngoaiTruong',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT TRUE',
    defaultValue: const CustomExpression('TRUE'),
  );
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gioiTinh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> academicRank = GeneratedColumn<String>(
    'hocHam',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> academicDegree = GeneratedColumn<String>(
    'hocVi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'sdt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> personalEmail = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> citizenId = GeneratedColumn<String>(
    'cccd',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
    'ngaySinh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> bankAccount = GeneratedColumn<String>(
    'stk',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'nganHang',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> taxCode = GeneratedColumn<String>(
    'mst',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> academicGroupId = GeneratedColumn<int>(
    'ncm',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    managementId,
    name,
    department,
    isOutsider,
    gender,
    academicRank,
    academicDegree,
    phone,
    personalEmail,
    citizenId,
    dateOfBirth,
    bankAccount,
    bankName,
    taxCode,
    note,
    academicGroupId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'giangvien';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GiangvienData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GiangvienData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      managementId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}maCanBo'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hoTen'],
      )!,
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}donVi'],
      ),
      isOutsider: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}ngoaiTruong'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gioiTinh'],
      ),
      academicRank: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hocHam'],
      ),
      academicDegree: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hocVi'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sdt'],
      ),
      personalEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      citizenId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cccd'],
      ),
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ngaySinh'],
      ),
      bankAccount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stk'],
      ),
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nganHang'],
      ),
      taxCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mst'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      academicGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ncm'],
      ),
    );
  }

  @override
  Giangvien createAlias(String alias) {
    return Giangvien(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class GiangvienData extends DataClass implements Insertable<GiangvienData> {
  final int id;
  final String? managementId;
  final String name;
  final String? department;
  final bool isOutsider;
  final String? gender;
  final String? academicRank;
  final String? academicDegree;
  final String? phone;
  final String? personalEmail;
  final String? citizenId;
  final String? dateOfBirth;
  final String? bankAccount;
  final String? bankName;
  final String? taxCode;
  final String? note;
  final int? academicGroupId;
  const GiangvienData({
    required this.id,
    this.managementId,
    required this.name,
    this.department,
    required this.isOutsider,
    this.gender,
    this.academicRank,
    this.academicDegree,
    this.phone,
    this.personalEmail,
    this.citizenId,
    this.dateOfBirth,
    this.bankAccount,
    this.bankName,
    this.taxCode,
    this.note,
    this.academicGroupId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || managementId != null) {
      map['maCanBo'] = Variable<String>(managementId);
    }
    map['hoTen'] = Variable<String>(name);
    if (!nullToAbsent || department != null) {
      map['donVi'] = Variable<String>(department);
    }
    map['ngoaiTruong'] = Variable<bool>(isOutsider);
    if (!nullToAbsent || gender != null) {
      map['gioiTinh'] = Variable<String>(gender);
    }
    if (!nullToAbsent || academicRank != null) {
      map['hocHam'] = Variable<String>(academicRank);
    }
    if (!nullToAbsent || academicDegree != null) {
      map['hocVi'] = Variable<String>(academicDegree);
    }
    if (!nullToAbsent || phone != null) {
      map['sdt'] = Variable<String>(phone);
    }
    if (!nullToAbsent || personalEmail != null) {
      map['email'] = Variable<String>(personalEmail);
    }
    if (!nullToAbsent || citizenId != null) {
      map['cccd'] = Variable<String>(citizenId);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['ngaySinh'] = Variable<String>(dateOfBirth);
    }
    if (!nullToAbsent || bankAccount != null) {
      map['stk'] = Variable<String>(bankAccount);
    }
    if (!nullToAbsent || bankName != null) {
      map['nganHang'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || taxCode != null) {
      map['mst'] = Variable<String>(taxCode);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || academicGroupId != null) {
      map['ncm'] = Variable<int>(academicGroupId);
    }
    return map;
  }

  GiangvienCompanion toCompanion(bool nullToAbsent) {
    return GiangvienCompanion(
      id: Value(id),
      managementId: managementId == null && nullToAbsent
          ? const Value.absent()
          : Value(managementId),
      name: Value(name),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      isOutsider: Value(isOutsider),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      academicRank: academicRank == null && nullToAbsent
          ? const Value.absent()
          : Value(academicRank),
      academicDegree: academicDegree == null && nullToAbsent
          ? const Value.absent()
          : Value(academicDegree),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
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
      taxCode: taxCode == null && nullToAbsent
          ? const Value.absent()
          : Value(taxCode),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      academicGroupId: academicGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(academicGroupId),
    );
  }

  factory GiangvienData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GiangvienData(
      id: serializer.fromJson<int>(json['id']),
      managementId: serializer.fromJson<String?>(json['managementId']),
      name: serializer.fromJson<String>(json['name']),
      department: serializer.fromJson<String?>(json['department']),
      isOutsider: serializer.fromJson<bool>(json['isOutsider']),
      gender: serializer.fromJson<String?>(json['gender']),
      academicRank: serializer.fromJson<String?>(json['academicRank']),
      academicDegree: serializer.fromJson<String?>(json['academicDegree']),
      phone: serializer.fromJson<String?>(json['phone']),
      personalEmail: serializer.fromJson<String?>(json['personalEmail']),
      citizenId: serializer.fromJson<String?>(json['citizenId']),
      dateOfBirth: serializer.fromJson<String?>(json['dateOfBirth']),
      bankAccount: serializer.fromJson<String?>(json['bankAccount']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      taxCode: serializer.fromJson<String?>(json['taxCode']),
      note: serializer.fromJson<String?>(json['note']),
      academicGroupId: serializer.fromJson<int?>(json['academicGroupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'managementId': serializer.toJson<String?>(managementId),
      'name': serializer.toJson<String>(name),
      'department': serializer.toJson<String?>(department),
      'isOutsider': serializer.toJson<bool>(isOutsider),
      'gender': serializer.toJson<String?>(gender),
      'academicRank': serializer.toJson<String?>(academicRank),
      'academicDegree': serializer.toJson<String?>(academicDegree),
      'phone': serializer.toJson<String?>(phone),
      'personalEmail': serializer.toJson<String?>(personalEmail),
      'citizenId': serializer.toJson<String?>(citizenId),
      'dateOfBirth': serializer.toJson<String?>(dateOfBirth),
      'bankAccount': serializer.toJson<String?>(bankAccount),
      'bankName': serializer.toJson<String?>(bankName),
      'taxCode': serializer.toJson<String?>(taxCode),
      'note': serializer.toJson<String?>(note),
      'academicGroupId': serializer.toJson<int?>(academicGroupId),
    };
  }

  GiangvienData copyWith({
    int? id,
    Value<String?> managementId = const Value.absent(),
    String? name,
    Value<String?> department = const Value.absent(),
    bool? isOutsider,
    Value<String?> gender = const Value.absent(),
    Value<String?> academicRank = const Value.absent(),
    Value<String?> academicDegree = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> personalEmail = const Value.absent(),
    Value<String?> citizenId = const Value.absent(),
    Value<String?> dateOfBirth = const Value.absent(),
    Value<String?> bankAccount = const Value.absent(),
    Value<String?> bankName = const Value.absent(),
    Value<String?> taxCode = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<int?> academicGroupId = const Value.absent(),
  }) => GiangvienData(
    id: id ?? this.id,
    managementId: managementId.present ? managementId.value : this.managementId,
    name: name ?? this.name,
    department: department.present ? department.value : this.department,
    isOutsider: isOutsider ?? this.isOutsider,
    gender: gender.present ? gender.value : this.gender,
    academicRank: academicRank.present ? academicRank.value : this.academicRank,
    academicDegree: academicDegree.present
        ? academicDegree.value
        : this.academicDegree,
    phone: phone.present ? phone.value : this.phone,
    personalEmail: personalEmail.present
        ? personalEmail.value
        : this.personalEmail,
    citizenId: citizenId.present ? citizenId.value : this.citizenId,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    bankAccount: bankAccount.present ? bankAccount.value : this.bankAccount,
    bankName: bankName.present ? bankName.value : this.bankName,
    taxCode: taxCode.present ? taxCode.value : this.taxCode,
    note: note.present ? note.value : this.note,
    academicGroupId: academicGroupId.present
        ? academicGroupId.value
        : this.academicGroupId,
  );
  GiangvienData copyWithCompanion(GiangvienCompanion data) {
    return GiangvienData(
      id: data.id.present ? data.id.value : this.id,
      managementId: data.managementId.present
          ? data.managementId.value
          : this.managementId,
      name: data.name.present ? data.name.value : this.name,
      department: data.department.present
          ? data.department.value
          : this.department,
      isOutsider: data.isOutsider.present
          ? data.isOutsider.value
          : this.isOutsider,
      gender: data.gender.present ? data.gender.value : this.gender,
      academicRank: data.academicRank.present
          ? data.academicRank.value
          : this.academicRank,
      academicDegree: data.academicDegree.present
          ? data.academicDegree.value
          : this.academicDegree,
      phone: data.phone.present ? data.phone.value : this.phone,
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
      taxCode: data.taxCode.present ? data.taxCode.value : this.taxCode,
      note: data.note.present ? data.note.value : this.note,
      academicGroupId: data.academicGroupId.present
          ? data.academicGroupId.value
          : this.academicGroupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GiangvienData(')
          ..write('id: $id, ')
          ..write('managementId: $managementId, ')
          ..write('name: $name, ')
          ..write('department: $department, ')
          ..write('isOutsider: $isOutsider, ')
          ..write('gender: $gender, ')
          ..write('academicRank: $academicRank, ')
          ..write('academicDegree: $academicDegree, ')
          ..write('phone: $phone, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('citizenId: $citizenId, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('bankAccount: $bankAccount, ')
          ..write('bankName: $bankName, ')
          ..write('taxCode: $taxCode, ')
          ..write('note: $note, ')
          ..write('academicGroupId: $academicGroupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    managementId,
    name,
    department,
    isOutsider,
    gender,
    academicRank,
    academicDegree,
    phone,
    personalEmail,
    citizenId,
    dateOfBirth,
    bankAccount,
    bankName,
    taxCode,
    note,
    academicGroupId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GiangvienData &&
          other.id == this.id &&
          other.managementId == this.managementId &&
          other.name == this.name &&
          other.department == this.department &&
          other.isOutsider == this.isOutsider &&
          other.gender == this.gender &&
          other.academicRank == this.academicRank &&
          other.academicDegree == this.academicDegree &&
          other.phone == this.phone &&
          other.personalEmail == this.personalEmail &&
          other.citizenId == this.citizenId &&
          other.dateOfBirth == this.dateOfBirth &&
          other.bankAccount == this.bankAccount &&
          other.bankName == this.bankName &&
          other.taxCode == this.taxCode &&
          other.note == this.note &&
          other.academicGroupId == this.academicGroupId);
}

class GiangvienCompanion extends UpdateCompanion<GiangvienData> {
  final Value<int> id;
  final Value<String?> managementId;
  final Value<String> name;
  final Value<String?> department;
  final Value<bool> isOutsider;
  final Value<String?> gender;
  final Value<String?> academicRank;
  final Value<String?> academicDegree;
  final Value<String?> phone;
  final Value<String?> personalEmail;
  final Value<String?> citizenId;
  final Value<String?> dateOfBirth;
  final Value<String?> bankAccount;
  final Value<String?> bankName;
  final Value<String?> taxCode;
  final Value<String?> note;
  final Value<int?> academicGroupId;
  const GiangvienCompanion({
    this.id = const Value.absent(),
    this.managementId = const Value.absent(),
    this.name = const Value.absent(),
    this.department = const Value.absent(),
    this.isOutsider = const Value.absent(),
    this.gender = const Value.absent(),
    this.academicRank = const Value.absent(),
    this.academicDegree = const Value.absent(),
    this.phone = const Value.absent(),
    this.personalEmail = const Value.absent(),
    this.citizenId = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.bankAccount = const Value.absent(),
    this.bankName = const Value.absent(),
    this.taxCode = const Value.absent(),
    this.note = const Value.absent(),
    this.academicGroupId = const Value.absent(),
  });
  GiangvienCompanion.insert({
    this.id = const Value.absent(),
    this.managementId = const Value.absent(),
    required String name,
    this.department = const Value.absent(),
    this.isOutsider = const Value.absent(),
    this.gender = const Value.absent(),
    this.academicRank = const Value.absent(),
    this.academicDegree = const Value.absent(),
    this.phone = const Value.absent(),
    this.personalEmail = const Value.absent(),
    this.citizenId = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.bankAccount = const Value.absent(),
    this.bankName = const Value.absent(),
    this.taxCode = const Value.absent(),
    this.note = const Value.absent(),
    this.academicGroupId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<GiangvienData> custom({
    Expression<int>? id,
    Expression<String>? managementId,
    Expression<String>? name,
    Expression<String>? department,
    Expression<bool>? isOutsider,
    Expression<String>? gender,
    Expression<String>? academicRank,
    Expression<String>? academicDegree,
    Expression<String>? phone,
    Expression<String>? personalEmail,
    Expression<String>? citizenId,
    Expression<String>? dateOfBirth,
    Expression<String>? bankAccount,
    Expression<String>? bankName,
    Expression<String>? taxCode,
    Expression<String>? note,
    Expression<int>? academicGroupId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (managementId != null) 'maCanBo': managementId,
      if (name != null) 'hoTen': name,
      if (department != null) 'donVi': department,
      if (isOutsider != null) 'ngoaiTruong': isOutsider,
      if (gender != null) 'gioiTinh': gender,
      if (academicRank != null) 'hocHam': academicRank,
      if (academicDegree != null) 'hocVi': academicDegree,
      if (phone != null) 'sdt': phone,
      if (personalEmail != null) 'email': personalEmail,
      if (citizenId != null) 'cccd': citizenId,
      if (dateOfBirth != null) 'ngaySinh': dateOfBirth,
      if (bankAccount != null) 'stk': bankAccount,
      if (bankName != null) 'nganHang': bankName,
      if (taxCode != null) 'mst': taxCode,
      if (note != null) 'note': note,
      if (academicGroupId != null) 'ncm': academicGroupId,
    });
  }

  GiangvienCompanion copyWith({
    Value<int>? id,
    Value<String?>? managementId,
    Value<String>? name,
    Value<String?>? department,
    Value<bool>? isOutsider,
    Value<String?>? gender,
    Value<String?>? academicRank,
    Value<String?>? academicDegree,
    Value<String?>? phone,
    Value<String?>? personalEmail,
    Value<String?>? citizenId,
    Value<String?>? dateOfBirth,
    Value<String?>? bankAccount,
    Value<String?>? bankName,
    Value<String?>? taxCode,
    Value<String?>? note,
    Value<int?>? academicGroupId,
  }) {
    return GiangvienCompanion(
      id: id ?? this.id,
      managementId: managementId ?? this.managementId,
      name: name ?? this.name,
      department: department ?? this.department,
      isOutsider: isOutsider ?? this.isOutsider,
      gender: gender ?? this.gender,
      academicRank: academicRank ?? this.academicRank,
      academicDegree: academicDegree ?? this.academicDegree,
      phone: phone ?? this.phone,
      personalEmail: personalEmail ?? this.personalEmail,
      citizenId: citizenId ?? this.citizenId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bankAccount: bankAccount ?? this.bankAccount,
      bankName: bankName ?? this.bankName,
      taxCode: taxCode ?? this.taxCode,
      note: note ?? this.note,
      academicGroupId: academicGroupId ?? this.academicGroupId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (managementId.present) {
      map['maCanBo'] = Variable<String>(managementId.value);
    }
    if (name.present) {
      map['hoTen'] = Variable<String>(name.value);
    }
    if (department.present) {
      map['donVi'] = Variable<String>(department.value);
    }
    if (isOutsider.present) {
      map['ngoaiTruong'] = Variable<bool>(isOutsider.value);
    }
    if (gender.present) {
      map['gioiTinh'] = Variable<String>(gender.value);
    }
    if (academicRank.present) {
      map['hocHam'] = Variable<String>(academicRank.value);
    }
    if (academicDegree.present) {
      map['hocVi'] = Variable<String>(academicDegree.value);
    }
    if (phone.present) {
      map['sdt'] = Variable<String>(phone.value);
    }
    if (personalEmail.present) {
      map['email'] = Variable<String>(personalEmail.value);
    }
    if (citizenId.present) {
      map['cccd'] = Variable<String>(citizenId.value);
    }
    if (dateOfBirth.present) {
      map['ngaySinh'] = Variable<String>(dateOfBirth.value);
    }
    if (bankAccount.present) {
      map['stk'] = Variable<String>(bankAccount.value);
    }
    if (bankName.present) {
      map['nganHang'] = Variable<String>(bankName.value);
    }
    if (taxCode.present) {
      map['mst'] = Variable<String>(taxCode.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (academicGroupId.present) {
      map['ncm'] = Variable<int>(academicGroupId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GiangvienCompanion(')
          ..write('id: $id, ')
          ..write('managementId: $managementId, ')
          ..write('name: $name, ')
          ..write('department: $department, ')
          ..write('isOutsider: $isOutsider, ')
          ..write('gender: $gender, ')
          ..write('academicRank: $academicRank, ')
          ..write('academicDegree: $academicDegree, ')
          ..write('phone: $phone, ')
          ..write('personalEmail: $personalEmail, ')
          ..write('citizenId: $citizenId, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('bankAccount: $bankAccount, ')
          ..write('bankName: $bankName, ')
          ..write('taxCode: $taxCode, ')
          ..write('note: $note, ')
          ..write('academicGroupId: $academicGroupId')
          ..write(')'))
        .toString();
  }
}

class TieuBanXetTuyen extends Table
    with TableInfo<TieuBanXetTuyen, TieuBanXetTuyenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TieuBanXetTuyen(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
    'nam',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> presidentId = GeneratedColumn<int>(
    'idChuTich',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> secretaryId = GeneratedColumn<int>(
    'idThuKy',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> member1Id = GeneratedColumn<int>(
    'idUyVien1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> member2Id = GeneratedColumn<int>(
    'idUyVien2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> member3Id = GeneratedColumn<int>(
    'idUyVien3',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'TieuBanXetTuyen';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TieuBanXetTuyenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TieuBanXetTuyenData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nam'],
      )!,
      presidentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idChuTich'],
      )!,
      secretaryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idThuKy'],
      )!,
      member1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idUyVien1'],
      )!,
      member2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idUyVien2'],
      ),
      member3Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idUyVien3'],
      ),
    );
  }

  @override
  TieuBanXetTuyen createAlias(String alias) {
    return TieuBanXetTuyen(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(idChuTich)REFERENCES GiangVien(id)',
    'FOREIGN KEY(idThuKy)REFERENCES GiangVien(id)',
    'FOREIGN KEY(idUyVien1)REFERENCES GiangVien(id)',
    'FOREIGN KEY(idUyVien2)REFERENCES GiangVien(id)',
    'FOREIGN KEY(idUyVien3)REFERENCES GiangVien(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class TieuBanXetTuyenData extends DataClass
    implements Insertable<TieuBanXetTuyenData> {
  final int id;
  final String year;
  final int presidentId;
  final int secretaryId;
  final int member1Id;
  final int? member2Id;
  final int? member3Id;
  const TieuBanXetTuyenData({
    required this.id,
    required this.year,
    required this.presidentId,
    required this.secretaryId,
    required this.member1Id,
    this.member2Id,
    this.member3Id,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nam'] = Variable<String>(year);
    map['idChuTich'] = Variable<int>(presidentId);
    map['idThuKy'] = Variable<int>(secretaryId);
    map['idUyVien1'] = Variable<int>(member1Id);
    if (!nullToAbsent || member2Id != null) {
      map['idUyVien2'] = Variable<int>(member2Id);
    }
    if (!nullToAbsent || member3Id != null) {
      map['idUyVien3'] = Variable<int>(member3Id);
    }
    return map;
  }

  TieuBanXetTuyenCompanion toCompanion(bool nullToAbsent) {
    return TieuBanXetTuyenCompanion(
      id: Value(id),
      year: Value(year),
      presidentId: Value(presidentId),
      secretaryId: Value(secretaryId),
      member1Id: Value(member1Id),
      member2Id: member2Id == null && nullToAbsent
          ? const Value.absent()
          : Value(member2Id),
      member3Id: member3Id == null && nullToAbsent
          ? const Value.absent()
          : Value(member3Id),
    );
  }

  factory TieuBanXetTuyenData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TieuBanXetTuyenData(
      id: serializer.fromJson<int>(json['id']),
      year: serializer.fromJson<String>(json['year']),
      presidentId: serializer.fromJson<int>(json['presidentId']),
      secretaryId: serializer.fromJson<int>(json['secretaryId']),
      member1Id: serializer.fromJson<int>(json['member1Id']),
      member2Id: serializer.fromJson<int?>(json['member2Id']),
      member3Id: serializer.fromJson<int?>(json['member3Id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'year': serializer.toJson<String>(year),
      'presidentId': serializer.toJson<int>(presidentId),
      'secretaryId': serializer.toJson<int>(secretaryId),
      'member1Id': serializer.toJson<int>(member1Id),
      'member2Id': serializer.toJson<int?>(member2Id),
      'member3Id': serializer.toJson<int?>(member3Id),
    };
  }

  TieuBanXetTuyenData copyWith({
    int? id,
    String? year,
    int? presidentId,
    int? secretaryId,
    int? member1Id,
    Value<int?> member2Id = const Value.absent(),
    Value<int?> member3Id = const Value.absent(),
  }) => TieuBanXetTuyenData(
    id: id ?? this.id,
    year: year ?? this.year,
    presidentId: presidentId ?? this.presidentId,
    secretaryId: secretaryId ?? this.secretaryId,
    member1Id: member1Id ?? this.member1Id,
    member2Id: member2Id.present ? member2Id.value : this.member2Id,
    member3Id: member3Id.present ? member3Id.value : this.member3Id,
  );
  TieuBanXetTuyenData copyWithCompanion(TieuBanXetTuyenCompanion data) {
    return TieuBanXetTuyenData(
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
    );
  }

  @override
  String toString() {
    return (StringBuffer('TieuBanXetTuyenData(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('presidentId: $presidentId, ')
          ..write('secretaryId: $secretaryId, ')
          ..write('member1Id: $member1Id, ')
          ..write('member2Id: $member2Id, ')
          ..write('member3Id: $member3Id')
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
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TieuBanXetTuyenData &&
          other.id == this.id &&
          other.year == this.year &&
          other.presidentId == this.presidentId &&
          other.secretaryId == this.secretaryId &&
          other.member1Id == this.member1Id &&
          other.member2Id == this.member2Id &&
          other.member3Id == this.member3Id);
}

class TieuBanXetTuyenCompanion extends UpdateCompanion<TieuBanXetTuyenData> {
  final Value<int> id;
  final Value<String> year;
  final Value<int> presidentId;
  final Value<int> secretaryId;
  final Value<int> member1Id;
  final Value<int?> member2Id;
  final Value<int?> member3Id;
  const TieuBanXetTuyenCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.presidentId = const Value.absent(),
    this.secretaryId = const Value.absent(),
    this.member1Id = const Value.absent(),
    this.member2Id = const Value.absent(),
    this.member3Id = const Value.absent(),
  });
  TieuBanXetTuyenCompanion.insert({
    this.id = const Value.absent(),
    required String year,
    required int presidentId,
    required int secretaryId,
    required int member1Id,
    this.member2Id = const Value.absent(),
    this.member3Id = const Value.absent(),
  }) : year = Value(year),
       presidentId = Value(presidentId),
       secretaryId = Value(secretaryId),
       member1Id = Value(member1Id);
  static Insertable<TieuBanXetTuyenData> custom({
    Expression<int>? id,
    Expression<String>? year,
    Expression<int>? presidentId,
    Expression<int>? secretaryId,
    Expression<int>? member1Id,
    Expression<int>? member2Id,
    Expression<int>? member3Id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'nam': year,
      if (presidentId != null) 'idChuTich': presidentId,
      if (secretaryId != null) 'idThuKy': secretaryId,
      if (member1Id != null) 'idUyVien1': member1Id,
      if (member2Id != null) 'idUyVien2': member2Id,
      if (member3Id != null) 'idUyVien3': member3Id,
    });
  }

  TieuBanXetTuyenCompanion copyWith({
    Value<int>? id,
    Value<String>? year,
    Value<int>? presidentId,
    Value<int>? secretaryId,
    Value<int>? member1Id,
    Value<int?>? member2Id,
    Value<int?>? member3Id,
  }) {
    return TieuBanXetTuyenCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      presidentId: presidentId ?? this.presidentId,
      secretaryId: secretaryId ?? this.secretaryId,
      member1Id: member1Id ?? this.member1Id,
      member2Id: member2Id ?? this.member2Id,
      member3Id: member3Id ?? this.member3Id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (year.present) {
      map['nam'] = Variable<String>(year.value);
    }
    if (presidentId.present) {
      map['idChuTich'] = Variable<int>(presidentId.value);
    }
    if (secretaryId.present) {
      map['idThuKy'] = Variable<int>(secretaryId.value);
    }
    if (member1Id.present) {
      map['idUyVien1'] = Variable<int>(member1Id.value);
    }
    if (member2Id.present) {
      map['idUyVien2'] = Variable<int>(member2Id.value);
    }
    if (member3Id.present) {
      map['idUyVien3'] = Variable<int>(member3Id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TieuBanXetTuyenCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('presidentId: $presidentId, ')
          ..write('secretaryId: $secretaryId, ')
          ..write('member1Id: $member1Id, ')
          ..write('member2Id: $member2Id, ')
          ..write('member3Id: $member3Id')
          ..write(')'))
        .toString();
  }
}

class HocVien extends Table with TableInfo<HocVien, HocVienData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HocVien(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<String> admissionId = GeneratedColumn<String>(
    'soHoSo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> cohort = GeneratedColumn<String>(
    'nienKhoa',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'maHocVien',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'hoTen',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
    'ngaySinh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gioiTinh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> placeOfBirth = GeneratedColumn<String>(
    'noiSinh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'dienThoai',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> personalEmail = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> schoolEmail = GeneratedColumn<String>(
    'emailHust',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> bachelorUniversity =
      GeneratedColumn<String>(
        'truongTotNghiepDaiHoc',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumn<String> bachelorMajor = GeneratedColumn<String>(
    'nganhTotNghiepDaiHoc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> bachelorProgram = GeneratedColumn<String>(
    'heTotNghiepDaiHoc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> bachelorGraduationRank =
      GeneratedColumn<String>(
        'xepLoaiTotNghiepDaiHoc',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumn<String> bachelorGraduationDate =
      GeneratedColumn<String>(
        'ngayTotNghiepDaiHoc',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumn<String> intendedSpecialization =
      GeneratedColumn<String>(
        'dinhHuongChuyenSau',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumn<String> exemptedCourses = GeneratedColumn<String>(
    'hocPhanDuocMien',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> masterMajor = GeneratedColumn<String>(
    'nganhDaoTaoThacSi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'maTrangThai',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
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
  late final GeneratedColumn<bool> hasSecondExtension = GeneratedColumn<bool>(
    'flag_extend_2',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  late final GeneratedColumn<int> admissionCouncilId = GeneratedColumn<int>(
    'idTieuBanXetTuyen',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> admissionType = GeneratedColumn<String>(
    'idDienTuyenSinh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
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
  static const String $name = 'HocVien';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HocVienData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HocVienData(
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
        DriftSqlType.string,
        data['${effectivePrefix}ngaySinh'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gioiTinh'],
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
        DriftSqlType.string,
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
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}maTrangThai'],
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
      admissionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idDienTuyenSinh'],
      ),
      isAdmissionPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}thanhToanXetTuyen'],
      )!,
    );
  }

  @override
  HocVien createAlias(String alias) {
    return HocVien(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(idTieuBanXetTuyen)REFERENCES TieuBanXetTuyen(id)',
    'FOREIGN KEY(nienKhoa)REFERENCES NienKhoa(nienKhoa)ON UPDATE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class HocVienData extends DataClass implements Insertable<HocVienData> {
  final int id;
  final String? admissionId;
  final String? cohort;
  final String? studentId;
  final String name;
  final String? dateOfBirth;
  final String? gender;
  final String? placeOfBirth;
  final String? phone;
  final String? personalEmail;
  final String? schoolEmail;
  final String? bachelorUniversity;
  final String? bachelorMajor;
  final String? bachelorProgram;
  final String? bachelorGraduationRank;
  final String? bachelorGraduationDate;
  final String? intendedSpecialization;
  final String? exemptedCourses;
  final String? masterMajor;
  final String? status;
  final bool hasHirstExtension;
  final bool hasSecondExtension;
  final int? admissionCouncilId;
  final String? admissionType;
  final bool isAdmissionPaid;
  const HocVienData({
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
      map['ngaySinh'] = Variable<String>(dateOfBirth);
    }
    if (!nullToAbsent || gender != null) {
      map['gioiTinh'] = Variable<String>(gender);
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
      map['ngayTotNghiepDaiHoc'] = Variable<String>(bachelorGraduationDate);
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
      map['maTrangThai'] = Variable<String>(status);
    }
    map['flag_extend_1'] = Variable<bool>(hasHirstExtension);
    map['flag_extend_2'] = Variable<bool>(hasSecondExtension);
    if (!nullToAbsent || admissionCouncilId != null) {
      map['idTieuBanXetTuyen'] = Variable<int>(admissionCouncilId);
    }
    if (!nullToAbsent || admissionType != null) {
      map['idDienTuyenSinh'] = Variable<String>(admissionType);
    }
    map['thanhToanXetTuyen'] = Variable<bool>(isAdmissionPaid);
    return map;
  }

  HocVienCompanion toCompanion(bool nullToAbsent) {
    return HocVienCompanion(
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

  factory HocVienData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HocVienData(
      id: serializer.fromJson<int>(json['id']),
      admissionId: serializer.fromJson<String?>(json['admissionId']),
      cohort: serializer.fromJson<String?>(json['cohort']),
      studentId: serializer.fromJson<String?>(json['studentId']),
      name: serializer.fromJson<String>(json['name']),
      dateOfBirth: serializer.fromJson<String?>(json['dateOfBirth']),
      gender: serializer.fromJson<String?>(json['gender']),
      placeOfBirth: serializer.fromJson<String?>(json['placeOfBirth']),
      phone: serializer.fromJson<String?>(json['phone']),
      personalEmail: serializer.fromJson<String?>(json['personalEmail']),
      schoolEmail: serializer.fromJson<String?>(json['schoolEmail']),
      bachelorUniversity: serializer.fromJson<String?>(
        json['bachelorUniversity'],
      ),
      bachelorMajor: serializer.fromJson<String?>(json['bachelorMajor']),
      bachelorProgram: serializer.fromJson<String?>(json['bachelorProgram']),
      bachelorGraduationRank: serializer.fromJson<String?>(
        json['bachelorGraduationRank'],
      ),
      bachelorGraduationDate: serializer.fromJson<String?>(
        json['bachelorGraduationDate'],
      ),
      intendedSpecialization: serializer.fromJson<String?>(
        json['intendedSpecialization'],
      ),
      exemptedCourses: serializer.fromJson<String?>(json['exemptedCourses']),
      masterMajor: serializer.fromJson<String?>(json['masterMajor']),
      status: serializer.fromJson<String?>(json['status']),
      hasHirstExtension: serializer.fromJson<bool>(json['hasHirstExtension']),
      hasSecondExtension: serializer.fromJson<bool>(json['hasSecondExtension']),
      admissionCouncilId: serializer.fromJson<int?>(json['admissionCouncilId']),
      admissionType: serializer.fromJson<String?>(json['admissionType']),
      isAdmissionPaid: serializer.fromJson<bool>(json['isAdmissionPaid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'admissionId': serializer.toJson<String?>(admissionId),
      'cohort': serializer.toJson<String?>(cohort),
      'studentId': serializer.toJson<String?>(studentId),
      'name': serializer.toJson<String>(name),
      'dateOfBirth': serializer.toJson<String?>(dateOfBirth),
      'gender': serializer.toJson<String?>(gender),
      'placeOfBirth': serializer.toJson<String?>(placeOfBirth),
      'phone': serializer.toJson<String?>(phone),
      'personalEmail': serializer.toJson<String?>(personalEmail),
      'schoolEmail': serializer.toJson<String?>(schoolEmail),
      'bachelorUniversity': serializer.toJson<String?>(bachelorUniversity),
      'bachelorMajor': serializer.toJson<String?>(bachelorMajor),
      'bachelorProgram': serializer.toJson<String?>(bachelorProgram),
      'bachelorGraduationRank': serializer.toJson<String?>(
        bachelorGraduationRank,
      ),
      'bachelorGraduationDate': serializer.toJson<String?>(
        bachelorGraduationDate,
      ),
      'intendedSpecialization': serializer.toJson<String?>(
        intendedSpecialization,
      ),
      'exemptedCourses': serializer.toJson<String?>(exemptedCourses),
      'masterMajor': serializer.toJson<String?>(masterMajor),
      'status': serializer.toJson<String?>(status),
      'hasHirstExtension': serializer.toJson<bool>(hasHirstExtension),
      'hasSecondExtension': serializer.toJson<bool>(hasSecondExtension),
      'admissionCouncilId': serializer.toJson<int?>(admissionCouncilId),
      'admissionType': serializer.toJson<String?>(admissionType),
      'isAdmissionPaid': serializer.toJson<bool>(isAdmissionPaid),
    };
  }

  HocVienData copyWith({
    int? id,
    Value<String?> admissionId = const Value.absent(),
    Value<String?> cohort = const Value.absent(),
    Value<String?> studentId = const Value.absent(),
    String? name,
    Value<String?> dateOfBirth = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<String?> placeOfBirth = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> personalEmail = const Value.absent(),
    Value<String?> schoolEmail = const Value.absent(),
    Value<String?> bachelorUniversity = const Value.absent(),
    Value<String?> bachelorMajor = const Value.absent(),
    Value<String?> bachelorProgram = const Value.absent(),
    Value<String?> bachelorGraduationRank = const Value.absent(),
    Value<String?> bachelorGraduationDate = const Value.absent(),
    Value<String?> intendedSpecialization = const Value.absent(),
    Value<String?> exemptedCourses = const Value.absent(),
    Value<String?> masterMajor = const Value.absent(),
    Value<String?> status = const Value.absent(),
    bool? hasHirstExtension,
    bool? hasSecondExtension,
    Value<int?> admissionCouncilId = const Value.absent(),
    Value<String?> admissionType = const Value.absent(),
    bool? isAdmissionPaid,
  }) => HocVienData(
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
  HocVienData copyWithCompanion(HocVienCompanion data) {
    return HocVienData(
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
    return (StringBuffer('HocVienData(')
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
      (other is HocVienData &&
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

class HocVienCompanion extends UpdateCompanion<HocVienData> {
  final Value<int> id;
  final Value<String?> admissionId;
  final Value<String?> cohort;
  final Value<String?> studentId;
  final Value<String> name;
  final Value<String?> dateOfBirth;
  final Value<String?> gender;
  final Value<String?> placeOfBirth;
  final Value<String?> phone;
  final Value<String?> personalEmail;
  final Value<String?> schoolEmail;
  final Value<String?> bachelorUniversity;
  final Value<String?> bachelorMajor;
  final Value<String?> bachelorProgram;
  final Value<String?> bachelorGraduationRank;
  final Value<String?> bachelorGraduationDate;
  final Value<String?> intendedSpecialization;
  final Value<String?> exemptedCourses;
  final Value<String?> masterMajor;
  final Value<String?> status;
  final Value<bool> hasHirstExtension;
  final Value<bool> hasSecondExtension;
  final Value<int?> admissionCouncilId;
  final Value<String?> admissionType;
  final Value<bool> isAdmissionPaid;
  const HocVienCompanion({
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
  HocVienCompanion.insert({
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
  static Insertable<HocVienData> custom({
    Expression<int>? id,
    Expression<String>? admissionId,
    Expression<String>? cohort,
    Expression<String>? studentId,
    Expression<String>? name,
    Expression<String>? dateOfBirth,
    Expression<String>? gender,
    Expression<String>? placeOfBirth,
    Expression<String>? phone,
    Expression<String>? personalEmail,
    Expression<String>? schoolEmail,
    Expression<String>? bachelorUniversity,
    Expression<String>? bachelorMajor,
    Expression<String>? bachelorProgram,
    Expression<String>? bachelorGraduationRank,
    Expression<String>? bachelorGraduationDate,
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

  HocVienCompanion copyWith({
    Value<int>? id,
    Value<String?>? admissionId,
    Value<String?>? cohort,
    Value<String?>? studentId,
    Value<String>? name,
    Value<String?>? dateOfBirth,
    Value<String?>? gender,
    Value<String?>? placeOfBirth,
    Value<String?>? phone,
    Value<String?>? personalEmail,
    Value<String?>? schoolEmail,
    Value<String?>? bachelorUniversity,
    Value<String?>? bachelorMajor,
    Value<String?>? bachelorProgram,
    Value<String?>? bachelorGraduationRank,
    Value<String?>? bachelorGraduationDate,
    Value<String?>? intendedSpecialization,
    Value<String?>? exemptedCourses,
    Value<String?>? masterMajor,
    Value<String?>? status,
    Value<bool>? hasHirstExtension,
    Value<bool>? hasSecondExtension,
    Value<int?>? admissionCouncilId,
    Value<String?>? admissionType,
    Value<bool>? isAdmissionPaid,
  }) {
    return HocVienCompanion(
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
      map['ngaySinh'] = Variable<String>(dateOfBirth.value);
    }
    if (gender.present) {
      map['gioiTinh'] = Variable<String>(gender.value);
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
      map['ngayTotNghiepDaiHoc'] = Variable<String>(
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
      map['maTrangThai'] = Variable<String>(status.value);
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
      map['idDienTuyenSinh'] = Variable<String>(admissionType.value);
    }
    if (isAdmissionPaid.present) {
      map['thanhToanXetTuyen'] = Variable<bool>(isAdmissionPaid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HocVienCompanion(')
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

class Hocky extends Table with TableInfo<Hocky, HockyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Hocky(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> semester = GeneratedColumn<String>(
    'hocKy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> registrationOpenDate =
      GeneratedColumn<String>(
        'moDangKy',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<String> registrationCloseDate =
      GeneratedColumn<String>(
        'dongDangKy',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<String> studyStartDate = GeneratedColumn<String>(
    'batDauHoc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> studyEndDate = GeneratedColumn<String>(
    'ketThucHoc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> gradeSubmissionDeadline =
      GeneratedColumn<String>(
        'hanNhapDiem',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  @override
  List<GeneratedColumn> get $columns => [
    semester,
    registrationOpenDate,
    registrationCloseDate,
    studyStartDate,
    studyEndDate,
    gradeSubmissionDeadline,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hocky';
  @override
  Set<GeneratedColumn> get $primaryKey => {semester};
  @override
  HockyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HockyData(
      semester: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hocKy'],
      )!,
      registrationOpenDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moDangKy'],
      )!,
      registrationCloseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dongDangKy'],
      )!,
      studyStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batDauHoc'],
      )!,
      studyEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ketThucHoc'],
      )!,
      gradeSubmissionDeadline: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hanNhapDiem'],
      )!,
    );
  }

  @override
  Hocky createAlias(String alias) {
    return Hocky(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class HockyData extends DataClass implements Insertable<HockyData> {
  final String semester;
  final String registrationOpenDate;
  final String registrationCloseDate;
  final String studyStartDate;
  final String studyEndDate;
  final String gradeSubmissionDeadline;
  const HockyData({
    required this.semester,
    required this.registrationOpenDate,
    required this.registrationCloseDate,
    required this.studyStartDate,
    required this.studyEndDate,
    required this.gradeSubmissionDeadline,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['hocKy'] = Variable<String>(semester);
    map['moDangKy'] = Variable<String>(registrationOpenDate);
    map['dongDangKy'] = Variable<String>(registrationCloseDate);
    map['batDauHoc'] = Variable<String>(studyStartDate);
    map['ketThucHoc'] = Variable<String>(studyEndDate);
    map['hanNhapDiem'] = Variable<String>(gradeSubmissionDeadline);
    return map;
  }

  HockyCompanion toCompanion(bool nullToAbsent) {
    return HockyCompanion(
      semester: Value(semester),
      registrationOpenDate: Value(registrationOpenDate),
      registrationCloseDate: Value(registrationCloseDate),
      studyStartDate: Value(studyStartDate),
      studyEndDate: Value(studyEndDate),
      gradeSubmissionDeadline: Value(gradeSubmissionDeadline),
    );
  }

  factory HockyData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HockyData(
      semester: serializer.fromJson<String>(json['semester']),
      registrationOpenDate: serializer.fromJson<String>(
        json['registrationOpenDate'],
      ),
      registrationCloseDate: serializer.fromJson<String>(
        json['registrationCloseDate'],
      ),
      studyStartDate: serializer.fromJson<String>(json['studyStartDate']),
      studyEndDate: serializer.fromJson<String>(json['studyEndDate']),
      gradeSubmissionDeadline: serializer.fromJson<String>(
        json['gradeSubmissionDeadline'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'semester': serializer.toJson<String>(semester),
      'registrationOpenDate': serializer.toJson<String>(registrationOpenDate),
      'registrationCloseDate': serializer.toJson<String>(registrationCloseDate),
      'studyStartDate': serializer.toJson<String>(studyStartDate),
      'studyEndDate': serializer.toJson<String>(studyEndDate),
      'gradeSubmissionDeadline': serializer.toJson<String>(
        gradeSubmissionDeadline,
      ),
    };
  }

  HockyData copyWith({
    String? semester,
    String? registrationOpenDate,
    String? registrationCloseDate,
    String? studyStartDate,
    String? studyEndDate,
    String? gradeSubmissionDeadline,
  }) => HockyData(
    semester: semester ?? this.semester,
    registrationOpenDate: registrationOpenDate ?? this.registrationOpenDate,
    registrationCloseDate: registrationCloseDate ?? this.registrationCloseDate,
    studyStartDate: studyStartDate ?? this.studyStartDate,
    studyEndDate: studyEndDate ?? this.studyEndDate,
    gradeSubmissionDeadline:
        gradeSubmissionDeadline ?? this.gradeSubmissionDeadline,
  );
  HockyData copyWithCompanion(HockyCompanion data) {
    return HockyData(
      semester: data.semester.present ? data.semester.value : this.semester,
      registrationOpenDate: data.registrationOpenDate.present
          ? data.registrationOpenDate.value
          : this.registrationOpenDate,
      registrationCloseDate: data.registrationCloseDate.present
          ? data.registrationCloseDate.value
          : this.registrationCloseDate,
      studyStartDate: data.studyStartDate.present
          ? data.studyStartDate.value
          : this.studyStartDate,
      studyEndDate: data.studyEndDate.present
          ? data.studyEndDate.value
          : this.studyEndDate,
      gradeSubmissionDeadline: data.gradeSubmissionDeadline.present
          ? data.gradeSubmissionDeadline.value
          : this.gradeSubmissionDeadline,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HockyData(')
          ..write('semester: $semester, ')
          ..write('registrationOpenDate: $registrationOpenDate, ')
          ..write('registrationCloseDate: $registrationCloseDate, ')
          ..write('studyStartDate: $studyStartDate, ')
          ..write('studyEndDate: $studyEndDate, ')
          ..write('gradeSubmissionDeadline: $gradeSubmissionDeadline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    semester,
    registrationOpenDate,
    registrationCloseDate,
    studyStartDate,
    studyEndDate,
    gradeSubmissionDeadline,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HockyData &&
          other.semester == this.semester &&
          other.registrationOpenDate == this.registrationOpenDate &&
          other.registrationCloseDate == this.registrationCloseDate &&
          other.studyStartDate == this.studyStartDate &&
          other.studyEndDate == this.studyEndDate &&
          other.gradeSubmissionDeadline == this.gradeSubmissionDeadline);
}

class HockyCompanion extends UpdateCompanion<HockyData> {
  final Value<String> semester;
  final Value<String> registrationOpenDate;
  final Value<String> registrationCloseDate;
  final Value<String> studyStartDate;
  final Value<String> studyEndDate;
  final Value<String> gradeSubmissionDeadline;
  final Value<int> rowid;
  const HockyCompanion({
    this.semester = const Value.absent(),
    this.registrationOpenDate = const Value.absent(),
    this.registrationCloseDate = const Value.absent(),
    this.studyStartDate = const Value.absent(),
    this.studyEndDate = const Value.absent(),
    this.gradeSubmissionDeadline = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HockyCompanion.insert({
    required String semester,
    required String registrationOpenDate,
    required String registrationCloseDate,
    required String studyStartDate,
    required String studyEndDate,
    required String gradeSubmissionDeadline,
    this.rowid = const Value.absent(),
  }) : semester = Value(semester),
       registrationOpenDate = Value(registrationOpenDate),
       registrationCloseDate = Value(registrationCloseDate),
       studyStartDate = Value(studyStartDate),
       studyEndDate = Value(studyEndDate),
       gradeSubmissionDeadline = Value(gradeSubmissionDeadline);
  static Insertable<HockyData> custom({
    Expression<String>? semester,
    Expression<String>? registrationOpenDate,
    Expression<String>? registrationCloseDate,
    Expression<String>? studyStartDate,
    Expression<String>? studyEndDate,
    Expression<String>? gradeSubmissionDeadline,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (semester != null) 'hocKy': semester,
      if (registrationOpenDate != null) 'moDangKy': registrationOpenDate,
      if (registrationCloseDate != null) 'dongDangKy': registrationCloseDate,
      if (studyStartDate != null) 'batDauHoc': studyStartDate,
      if (studyEndDate != null) 'ketThucHoc': studyEndDate,
      if (gradeSubmissionDeadline != null)
        'hanNhapDiem': gradeSubmissionDeadline,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HockyCompanion copyWith({
    Value<String>? semester,
    Value<String>? registrationOpenDate,
    Value<String>? registrationCloseDate,
    Value<String>? studyStartDate,
    Value<String>? studyEndDate,
    Value<String>? gradeSubmissionDeadline,
    Value<int>? rowid,
  }) {
    return HockyCompanion(
      semester: semester ?? this.semester,
      registrationOpenDate: registrationOpenDate ?? this.registrationOpenDate,
      registrationCloseDate:
          registrationCloseDate ?? this.registrationCloseDate,
      studyStartDate: studyStartDate ?? this.studyStartDate,
      studyEndDate: studyEndDate ?? this.studyEndDate,
      gradeSubmissionDeadline:
          gradeSubmissionDeadline ?? this.gradeSubmissionDeadline,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (semester.present) {
      map['hocKy'] = Variable<String>(semester.value);
    }
    if (registrationOpenDate.present) {
      map['moDangKy'] = Variable<String>(registrationOpenDate.value);
    }
    if (registrationCloseDate.present) {
      map['dongDangKy'] = Variable<String>(registrationCloseDate.value);
    }
    if (studyStartDate.present) {
      map['batDauHoc'] = Variable<String>(studyStartDate.value);
    }
    if (studyEndDate.present) {
      map['ketThucHoc'] = Variable<String>(studyEndDate.value);
    }
    if (gradeSubmissionDeadline.present) {
      map['hanNhapDiem'] = Variable<String>(gradeSubmissionDeadline.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HockyCompanion(')
          ..write('semester: $semester, ')
          ..write('registrationOpenDate: $registrationOpenDate, ')
          ..write('registrationCloseDate: $registrationCloseDate, ')
          ..write('studyStartDate: $studyStartDate, ')
          ..write('studyEndDate: $studyEndDate, ')
          ..write('gradeSubmissionDeadline: $gradeSubmissionDeadline, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Hocphan extends Table with TableInfo<Hocphan, HocphanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Hocphan(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'maHocPhan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> vietnameseTitle = GeneratedColumn<String>(
    'tenTiengViet',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> englishTitle = GeneratedColumn<String>(
    'tenTiengAnh',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> credits = GeneratedColumn<int>(
    'soTinChi',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> courseCategory = GeneratedColumn<String>(
    'khoiKienThuc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> workload = GeneratedColumn<String>(
    'khoiLuong',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vietnameseTitle,
    englishTitle,
    credits,
    courseCategory,
    workload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hocphan';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HocphanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HocphanData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}maHocPhan'],
      )!,
      vietnameseTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenTiengViet'],
      )!,
      englishTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenTiengAnh'],
      )!,
      credits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}soTinChi'],
      )!,
      courseCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}khoiKienThuc'],
      )!,
      workload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}khoiLuong'],
      )!,
    );
  }

  @override
  Hocphan createAlias(String alias) {
    return Hocphan(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class HocphanData extends DataClass implements Insertable<HocphanData> {
  final String id;
  final String vietnameseTitle;
  final String englishTitle;
  final int credits;
  final String courseCategory;
  final String workload;
  const HocphanData({
    required this.id,
    required this.vietnameseTitle,
    required this.englishTitle,
    required this.credits,
    required this.courseCategory,
    required this.workload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['maHocPhan'] = Variable<String>(id);
    map['tenTiengViet'] = Variable<String>(vietnameseTitle);
    map['tenTiengAnh'] = Variable<String>(englishTitle);
    map['soTinChi'] = Variable<int>(credits);
    map['khoiKienThuc'] = Variable<String>(courseCategory);
    map['khoiLuong'] = Variable<String>(workload);
    return map;
  }

  HocphanCompanion toCompanion(bool nullToAbsent) {
    return HocphanCompanion(
      id: Value(id),
      vietnameseTitle: Value(vietnameseTitle),
      englishTitle: Value(englishTitle),
      credits: Value(credits),
      courseCategory: Value(courseCategory),
      workload: Value(workload),
    );
  }

  factory HocphanData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HocphanData(
      id: serializer.fromJson<String>(json['id']),
      vietnameseTitle: serializer.fromJson<String>(json['vietnameseTitle']),
      englishTitle: serializer.fromJson<String>(json['englishTitle']),
      credits: serializer.fromJson<int>(json['credits']),
      courseCategory: serializer.fromJson<String>(json['courseCategory']),
      workload: serializer.fromJson<String>(json['workload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vietnameseTitle': serializer.toJson<String>(vietnameseTitle),
      'englishTitle': serializer.toJson<String>(englishTitle),
      'credits': serializer.toJson<int>(credits),
      'courseCategory': serializer.toJson<String>(courseCategory),
      'workload': serializer.toJson<String>(workload),
    };
  }

  HocphanData copyWith({
    String? id,
    String? vietnameseTitle,
    String? englishTitle,
    int? credits,
    String? courseCategory,
    String? workload,
  }) => HocphanData(
    id: id ?? this.id,
    vietnameseTitle: vietnameseTitle ?? this.vietnameseTitle,
    englishTitle: englishTitle ?? this.englishTitle,
    credits: credits ?? this.credits,
    courseCategory: courseCategory ?? this.courseCategory,
    workload: workload ?? this.workload,
  );
  HocphanData copyWithCompanion(HocphanCompanion data) {
    return HocphanData(
      id: data.id.present ? data.id.value : this.id,
      vietnameseTitle: data.vietnameseTitle.present
          ? data.vietnameseTitle.value
          : this.vietnameseTitle,
      englishTitle: data.englishTitle.present
          ? data.englishTitle.value
          : this.englishTitle,
      credits: data.credits.present ? data.credits.value : this.credits,
      courseCategory: data.courseCategory.present
          ? data.courseCategory.value
          : this.courseCategory,
      workload: data.workload.present ? data.workload.value : this.workload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HocphanData(')
          ..write('id: $id, ')
          ..write('vietnameseTitle: $vietnameseTitle, ')
          ..write('englishTitle: $englishTitle, ')
          ..write('credits: $credits, ')
          ..write('courseCategory: $courseCategory, ')
          ..write('workload: $workload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vietnameseTitle,
    englishTitle,
    credits,
    courseCategory,
    workload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HocphanData &&
          other.id == this.id &&
          other.vietnameseTitle == this.vietnameseTitle &&
          other.englishTitle == this.englishTitle &&
          other.credits == this.credits &&
          other.courseCategory == this.courseCategory &&
          other.workload == this.workload);
}

class HocphanCompanion extends UpdateCompanion<HocphanData> {
  final Value<String> id;
  final Value<String> vietnameseTitle;
  final Value<String> englishTitle;
  final Value<int> credits;
  final Value<String> courseCategory;
  final Value<String> workload;
  final Value<int> rowid;
  const HocphanCompanion({
    this.id = const Value.absent(),
    this.vietnameseTitle = const Value.absent(),
    this.englishTitle = const Value.absent(),
    this.credits = const Value.absent(),
    this.courseCategory = const Value.absent(),
    this.workload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HocphanCompanion.insert({
    required String id,
    required String vietnameseTitle,
    required String englishTitle,
    required int credits,
    required String courseCategory,
    required String workload,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       vietnameseTitle = Value(vietnameseTitle),
       englishTitle = Value(englishTitle),
       credits = Value(credits),
       courseCategory = Value(courseCategory),
       workload = Value(workload);
  static Insertable<HocphanData> custom({
    Expression<String>? id,
    Expression<String>? vietnameseTitle,
    Expression<String>? englishTitle,
    Expression<int>? credits,
    Expression<String>? courseCategory,
    Expression<String>? workload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'maHocPhan': id,
      if (vietnameseTitle != null) 'tenTiengViet': vietnameseTitle,
      if (englishTitle != null) 'tenTiengAnh': englishTitle,
      if (credits != null) 'soTinChi': credits,
      if (courseCategory != null) 'khoiKienThuc': courseCategory,
      if (workload != null) 'khoiLuong': workload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HocphanCompanion copyWith({
    Value<String>? id,
    Value<String>? vietnameseTitle,
    Value<String>? englishTitle,
    Value<int>? credits,
    Value<String>? courseCategory,
    Value<String>? workload,
    Value<int>? rowid,
  }) {
    return HocphanCompanion(
      id: id ?? this.id,
      vietnameseTitle: vietnameseTitle ?? this.vietnameseTitle,
      englishTitle: englishTitle ?? this.englishTitle,
      credits: credits ?? this.credits,
      courseCategory: courseCategory ?? this.courseCategory,
      workload: workload ?? this.workload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['maHocPhan'] = Variable<String>(id.value);
    }
    if (vietnameseTitle.present) {
      map['tenTiengViet'] = Variable<String>(vietnameseTitle.value);
    }
    if (englishTitle.present) {
      map['tenTiengAnh'] = Variable<String>(englishTitle.value);
    }
    if (credits.present) {
      map['soTinChi'] = Variable<int>(credits.value);
    }
    if (courseCategory.present) {
      map['khoiKienThuc'] = Variable<String>(courseCategory.value);
    }
    if (workload.present) {
      map['khoiLuong'] = Variable<String>(workload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HocphanCompanion(')
          ..write('id: $id, ')
          ..write('vietnameseTitle: $vietnameseTitle, ')
          ..write('englishTitle: $englishTitle, ')
          ..write('credits: $credits, ')
          ..write('courseCategory: $courseCategory, ')
          ..write('workload: $workload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Detaithacsi extends Table with TableInfo<Detaithacsi, DetaithacsiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Detaithacsi(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<int> supervisorId = GeneratedColumn<int>(
    'idGiangVien',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> vietnameseTitle = GeneratedColumn<String>(
    'tenTiengViet',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> englishTitle = GeneratedColumn<String>(
    'tenTiengAnh',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'ghiChu',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT ()',
    defaultValue: const CustomExpression(''),
  );
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'idHocVien',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> assignedDate = GeneratedColumn<String>(
    'ngayGiao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> assignedDecisionNumber =
      GeneratedColumn<String>(
        'soQdGiao',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumn<String> defenseDeadline = GeneratedColumn<String>(
    'hanBaoVe',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> defenseDecisionNumber =
      GeneratedColumn<String>(
        'soQdBaoVe',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumn<String> defenseDate = GeneratedColumn<String>(
    'ngayBaoVe',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> presidentId = GeneratedColumn<int>(
    'idChuTich',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> firstReviewerId = GeneratedColumn<int>(
    'idPhanBien1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> secondReviewerId = GeneratedColumn<int>(
    'idPhanBien2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> secretaryId = GeneratedColumn<int>(
    'idThuKy',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> memberId = GeneratedColumn<int>(
    'idUyVien',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
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
  late final GeneratedColumn<bool> flagPaid = GeneratedColumn<bool>(
    'flag_paid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
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
  late final GeneratedColumn<String> group = GeneratedColumn<String>(
    'group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
    'nam',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> isRegisteredForDefense = GeneratedColumn<int>(
    'dangKyBaoVe',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<int> isProfileSubmitted = GeneratedColumn<int>(
    'nopHoSo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supervisorId,
    vietnameseTitle,
    englishTitle,
    note,
    studentId,
    assignedDate,
    assignedDecisionNumber,
    defenseDeadline,
    defenseDecisionNumber,
    defenseDate,
    presidentId,
    firstReviewerId,
    secondReviewerId,
    secretaryId,
    memberId,
    flagTracking,
    flagPaid,
    flagIgnore,
    group,
    year,
    isRegisteredForDefense,
    isProfileSubmitted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'detaithacsi';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DetaithacsiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetaithacsiData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      supervisorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idGiangVien'],
      )!,
      vietnameseTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenTiengViet'],
      )!,
      englishTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenTiengAnh'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ghiChu'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idHocVien'],
      ),
      assignedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ngayGiao'],
      ),
      assignedDecisionNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}soQdGiao'],
      ),
      defenseDeadline: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hanBaoVe'],
      ),
      defenseDecisionNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}soQdBaoVe'],
      ),
      defenseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ngayBaoVe'],
      ),
      presidentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idChuTich'],
      ),
      firstReviewerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idPhanBien1'],
      ),
      secondReviewerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idPhanBien2'],
      ),
      secretaryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idThuKy'],
      ),
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idUyVien'],
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
      isRegisteredForDefense: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dangKyBaoVe'],
      )!,
      isProfileSubmitted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nopHoSo'],
      )!,
    );
  }

  @override
  Detaithacsi createAlias(String alias) {
    return Detaithacsi(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(idChuTich)REFERENCES GiangVien(id)',
    'FOREIGN KEY(idGiangVien)REFERENCES GiangVien(id)',
    'FOREIGN KEY(idPhanBien1)REFERENCES GiangVien(id)',
    'FOREIGN KEY(idPhanBien2)REFERENCES GiangVien(id)',
    'FOREIGN KEY(idThuKy)REFERENCES GiangVien(id)',
    'FOREIGN KEY(idUyVien)REFERENCES GiangVien(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class DetaithacsiData extends DataClass implements Insertable<DetaithacsiData> {
  final int id;
  final int supervisorId;
  final String vietnameseTitle;
  final String englishTitle;
  final String note;
  final int? studentId;
  final String? assignedDate;
  final String? assignedDecisionNumber;
  final String? defenseDeadline;
  final String? defenseDecisionNumber;
  final String? defenseDate;
  final int? presidentId;
  final int? firstReviewerId;
  final int? secondReviewerId;
  final int? secretaryId;
  final int? memberId;
  final bool flagTracking;
  final bool flagPaid;
  final bool flagIgnore;
  final String? group;
  final String? year;
  final int isRegisteredForDefense;
  final int isProfileSubmitted;
  const DetaithacsiData({
    required this.id,
    required this.supervisorId,
    required this.vietnameseTitle,
    required this.englishTitle,
    required this.note,
    this.studentId,
    this.assignedDate,
    this.assignedDecisionNumber,
    this.defenseDeadline,
    this.defenseDecisionNumber,
    this.defenseDate,
    this.presidentId,
    this.firstReviewerId,
    this.secondReviewerId,
    this.secretaryId,
    this.memberId,
    required this.flagTracking,
    required this.flagPaid,
    required this.flagIgnore,
    this.group,
    this.year,
    required this.isRegisteredForDefense,
    required this.isProfileSubmitted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['idGiangVien'] = Variable<int>(supervisorId);
    map['tenTiengViet'] = Variable<String>(vietnameseTitle);
    map['tenTiengAnh'] = Variable<String>(englishTitle);
    map['ghiChu'] = Variable<String>(note);
    if (!nullToAbsent || studentId != null) {
      map['idHocVien'] = Variable<int>(studentId);
    }
    if (!nullToAbsent || assignedDate != null) {
      map['ngayGiao'] = Variable<String>(assignedDate);
    }
    if (!nullToAbsent || assignedDecisionNumber != null) {
      map['soQdGiao'] = Variable<String>(assignedDecisionNumber);
    }
    if (!nullToAbsent || defenseDeadline != null) {
      map['hanBaoVe'] = Variable<String>(defenseDeadline);
    }
    if (!nullToAbsent || defenseDecisionNumber != null) {
      map['soQdBaoVe'] = Variable<String>(defenseDecisionNumber);
    }
    if (!nullToAbsent || defenseDate != null) {
      map['ngayBaoVe'] = Variable<String>(defenseDate);
    }
    if (!nullToAbsent || presidentId != null) {
      map['idChuTich'] = Variable<int>(presidentId);
    }
    if (!nullToAbsent || firstReviewerId != null) {
      map['idPhanBien1'] = Variable<int>(firstReviewerId);
    }
    if (!nullToAbsent || secondReviewerId != null) {
      map['idPhanBien2'] = Variable<int>(secondReviewerId);
    }
    if (!nullToAbsent || secretaryId != null) {
      map['idThuKy'] = Variable<int>(secretaryId);
    }
    if (!nullToAbsent || memberId != null) {
      map['idUyVien'] = Variable<int>(memberId);
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
    map['dangKyBaoVe'] = Variable<int>(isRegisteredForDefense);
    map['nopHoSo'] = Variable<int>(isProfileSubmitted);
    return map;
  }

  DetaithacsiCompanion toCompanion(bool nullToAbsent) {
    return DetaithacsiCompanion(
      id: Value(id),
      supervisorId: Value(supervisorId),
      vietnameseTitle: Value(vietnameseTitle),
      englishTitle: Value(englishTitle),
      note: Value(note),
      studentId: studentId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentId),
      assignedDate: assignedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedDate),
      assignedDecisionNumber: assignedDecisionNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedDecisionNumber),
      defenseDeadline: defenseDeadline == null && nullToAbsent
          ? const Value.absent()
          : Value(defenseDeadline),
      defenseDecisionNumber: defenseDecisionNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(defenseDecisionNumber),
      defenseDate: defenseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(defenseDate),
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
      flagTracking: Value(flagTracking),
      flagPaid: Value(flagPaid),
      flagIgnore: Value(flagIgnore),
      group: group == null && nullToAbsent
          ? const Value.absent()
          : Value(group),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      isRegisteredForDefense: Value(isRegisteredForDefense),
      isProfileSubmitted: Value(isProfileSubmitted),
    );
  }

  factory DetaithacsiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetaithacsiData(
      id: serializer.fromJson<int>(json['id']),
      supervisorId: serializer.fromJson<int>(json['supervisorId']),
      vietnameseTitle: serializer.fromJson<String>(json['vietnameseTitle']),
      englishTitle: serializer.fromJson<String>(json['englishTitle']),
      note: serializer.fromJson<String>(json['note']),
      studentId: serializer.fromJson<int?>(json['studentId']),
      assignedDate: serializer.fromJson<String?>(json['assignedDate']),
      assignedDecisionNumber: serializer.fromJson<String?>(
        json['assignedDecisionNumber'],
      ),
      defenseDeadline: serializer.fromJson<String?>(json['defenseDeadline']),
      defenseDecisionNumber: serializer.fromJson<String?>(
        json['defenseDecisionNumber'],
      ),
      defenseDate: serializer.fromJson<String?>(json['defenseDate']),
      presidentId: serializer.fromJson<int?>(json['presidentId']),
      firstReviewerId: serializer.fromJson<int?>(json['firstReviewerId']),
      secondReviewerId: serializer.fromJson<int?>(json['secondReviewerId']),
      secretaryId: serializer.fromJson<int?>(json['secretaryId']),
      memberId: serializer.fromJson<int?>(json['memberId']),
      flagTracking: serializer.fromJson<bool>(json['flagTracking']),
      flagPaid: serializer.fromJson<bool>(json['flagPaid']),
      flagIgnore: serializer.fromJson<bool>(json['flagIgnore']),
      group: serializer.fromJson<String?>(json['group']),
      year: serializer.fromJson<String?>(json['year']),
      isRegisteredForDefense: serializer.fromJson<int>(
        json['isRegisteredForDefense'],
      ),
      isProfileSubmitted: serializer.fromJson<int>(json['isProfileSubmitted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supervisorId': serializer.toJson<int>(supervisorId),
      'vietnameseTitle': serializer.toJson<String>(vietnameseTitle),
      'englishTitle': serializer.toJson<String>(englishTitle),
      'note': serializer.toJson<String>(note),
      'studentId': serializer.toJson<int?>(studentId),
      'assignedDate': serializer.toJson<String?>(assignedDate),
      'assignedDecisionNumber': serializer.toJson<String?>(
        assignedDecisionNumber,
      ),
      'defenseDeadline': serializer.toJson<String?>(defenseDeadline),
      'defenseDecisionNumber': serializer.toJson<String?>(
        defenseDecisionNumber,
      ),
      'defenseDate': serializer.toJson<String?>(defenseDate),
      'presidentId': serializer.toJson<int?>(presidentId),
      'firstReviewerId': serializer.toJson<int?>(firstReviewerId),
      'secondReviewerId': serializer.toJson<int?>(secondReviewerId),
      'secretaryId': serializer.toJson<int?>(secretaryId),
      'memberId': serializer.toJson<int?>(memberId),
      'flagTracking': serializer.toJson<bool>(flagTracking),
      'flagPaid': serializer.toJson<bool>(flagPaid),
      'flagIgnore': serializer.toJson<bool>(flagIgnore),
      'group': serializer.toJson<String?>(group),
      'year': serializer.toJson<String?>(year),
      'isRegisteredForDefense': serializer.toJson<int>(isRegisteredForDefense),
      'isProfileSubmitted': serializer.toJson<int>(isProfileSubmitted),
    };
  }

  DetaithacsiData copyWith({
    int? id,
    int? supervisorId,
    String? vietnameseTitle,
    String? englishTitle,
    String? note,
    Value<int?> studentId = const Value.absent(),
    Value<String?> assignedDate = const Value.absent(),
    Value<String?> assignedDecisionNumber = const Value.absent(),
    Value<String?> defenseDeadline = const Value.absent(),
    Value<String?> defenseDecisionNumber = const Value.absent(),
    Value<String?> defenseDate = const Value.absent(),
    Value<int?> presidentId = const Value.absent(),
    Value<int?> firstReviewerId = const Value.absent(),
    Value<int?> secondReviewerId = const Value.absent(),
    Value<int?> secretaryId = const Value.absent(),
    Value<int?> memberId = const Value.absent(),
    bool? flagTracking,
    bool? flagPaid,
    bool? flagIgnore,
    Value<String?> group = const Value.absent(),
    Value<String?> year = const Value.absent(),
    int? isRegisteredForDefense,
    int? isProfileSubmitted,
  }) => DetaithacsiData(
    id: id ?? this.id,
    supervisorId: supervisorId ?? this.supervisorId,
    vietnameseTitle: vietnameseTitle ?? this.vietnameseTitle,
    englishTitle: englishTitle ?? this.englishTitle,
    note: note ?? this.note,
    studentId: studentId.present ? studentId.value : this.studentId,
    assignedDate: assignedDate.present ? assignedDate.value : this.assignedDate,
    assignedDecisionNumber: assignedDecisionNumber.present
        ? assignedDecisionNumber.value
        : this.assignedDecisionNumber,
    defenseDeadline: defenseDeadline.present
        ? defenseDeadline.value
        : this.defenseDeadline,
    defenseDecisionNumber: defenseDecisionNumber.present
        ? defenseDecisionNumber.value
        : this.defenseDecisionNumber,
    defenseDate: defenseDate.present ? defenseDate.value : this.defenseDate,
    presidentId: presidentId.present ? presidentId.value : this.presidentId,
    firstReviewerId: firstReviewerId.present
        ? firstReviewerId.value
        : this.firstReviewerId,
    secondReviewerId: secondReviewerId.present
        ? secondReviewerId.value
        : this.secondReviewerId,
    secretaryId: secretaryId.present ? secretaryId.value : this.secretaryId,
    memberId: memberId.present ? memberId.value : this.memberId,
    flagTracking: flagTracking ?? this.flagTracking,
    flagPaid: flagPaid ?? this.flagPaid,
    flagIgnore: flagIgnore ?? this.flagIgnore,
    group: group.present ? group.value : this.group,
    year: year.present ? year.value : this.year,
    isRegisteredForDefense:
        isRegisteredForDefense ?? this.isRegisteredForDefense,
    isProfileSubmitted: isProfileSubmitted ?? this.isProfileSubmitted,
  );
  DetaithacsiData copyWithCompanion(DetaithacsiCompanion data) {
    return DetaithacsiData(
      id: data.id.present ? data.id.value : this.id,
      supervisorId: data.supervisorId.present
          ? data.supervisorId.value
          : this.supervisorId,
      vietnameseTitle: data.vietnameseTitle.present
          ? data.vietnameseTitle.value
          : this.vietnameseTitle,
      englishTitle: data.englishTitle.present
          ? data.englishTitle.value
          : this.englishTitle,
      note: data.note.present ? data.note.value : this.note,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      assignedDate: data.assignedDate.present
          ? data.assignedDate.value
          : this.assignedDate,
      assignedDecisionNumber: data.assignedDecisionNumber.present
          ? data.assignedDecisionNumber.value
          : this.assignedDecisionNumber,
      defenseDeadline: data.defenseDeadline.present
          ? data.defenseDeadline.value
          : this.defenseDeadline,
      defenseDecisionNumber: data.defenseDecisionNumber.present
          ? data.defenseDecisionNumber.value
          : this.defenseDecisionNumber,
      defenseDate: data.defenseDate.present
          ? data.defenseDate.value
          : this.defenseDate,
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
      flagTracking: data.flagTracking.present
          ? data.flagTracking.value
          : this.flagTracking,
      flagPaid: data.flagPaid.present ? data.flagPaid.value : this.flagPaid,
      flagIgnore: data.flagIgnore.present
          ? data.flagIgnore.value
          : this.flagIgnore,
      group: data.group.present ? data.group.value : this.group,
      year: data.year.present ? data.year.value : this.year,
      isRegisteredForDefense: data.isRegisteredForDefense.present
          ? data.isRegisteredForDefense.value
          : this.isRegisteredForDefense,
      isProfileSubmitted: data.isProfileSubmitted.present
          ? data.isProfileSubmitted.value
          : this.isProfileSubmitted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DetaithacsiData(')
          ..write('id: $id, ')
          ..write('supervisorId: $supervisorId, ')
          ..write('vietnameseTitle: $vietnameseTitle, ')
          ..write('englishTitle: $englishTitle, ')
          ..write('note: $note, ')
          ..write('studentId: $studentId, ')
          ..write('assignedDate: $assignedDate, ')
          ..write('assignedDecisionNumber: $assignedDecisionNumber, ')
          ..write('defenseDeadline: $defenseDeadline, ')
          ..write('defenseDecisionNumber: $defenseDecisionNumber, ')
          ..write('defenseDate: $defenseDate, ')
          ..write('presidentId: $presidentId, ')
          ..write('firstReviewerId: $firstReviewerId, ')
          ..write('secondReviewerId: $secondReviewerId, ')
          ..write('secretaryId: $secretaryId, ')
          ..write('memberId: $memberId, ')
          ..write('flagTracking: $flagTracking, ')
          ..write('flagPaid: $flagPaid, ')
          ..write('flagIgnore: $flagIgnore, ')
          ..write('group: $group, ')
          ..write('year: $year, ')
          ..write('isRegisteredForDefense: $isRegisteredForDefense, ')
          ..write('isProfileSubmitted: $isProfileSubmitted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    supervisorId,
    vietnameseTitle,
    englishTitle,
    note,
    studentId,
    assignedDate,
    assignedDecisionNumber,
    defenseDeadline,
    defenseDecisionNumber,
    defenseDate,
    presidentId,
    firstReviewerId,
    secondReviewerId,
    secretaryId,
    memberId,
    flagTracking,
    flagPaid,
    flagIgnore,
    group,
    year,
    isRegisteredForDefense,
    isProfileSubmitted,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetaithacsiData &&
          other.id == this.id &&
          other.supervisorId == this.supervisorId &&
          other.vietnameseTitle == this.vietnameseTitle &&
          other.englishTitle == this.englishTitle &&
          other.note == this.note &&
          other.studentId == this.studentId &&
          other.assignedDate == this.assignedDate &&
          other.assignedDecisionNumber == this.assignedDecisionNumber &&
          other.defenseDeadline == this.defenseDeadline &&
          other.defenseDecisionNumber == this.defenseDecisionNumber &&
          other.defenseDate == this.defenseDate &&
          other.presidentId == this.presidentId &&
          other.firstReviewerId == this.firstReviewerId &&
          other.secondReviewerId == this.secondReviewerId &&
          other.secretaryId == this.secretaryId &&
          other.memberId == this.memberId &&
          other.flagTracking == this.flagTracking &&
          other.flagPaid == this.flagPaid &&
          other.flagIgnore == this.flagIgnore &&
          other.group == this.group &&
          other.year == this.year &&
          other.isRegisteredForDefense == this.isRegisteredForDefense &&
          other.isProfileSubmitted == this.isProfileSubmitted);
}

class DetaithacsiCompanion extends UpdateCompanion<DetaithacsiData> {
  final Value<int> id;
  final Value<int> supervisorId;
  final Value<String> vietnameseTitle;
  final Value<String> englishTitle;
  final Value<String> note;
  final Value<int?> studentId;
  final Value<String?> assignedDate;
  final Value<String?> assignedDecisionNumber;
  final Value<String?> defenseDeadline;
  final Value<String?> defenseDecisionNumber;
  final Value<String?> defenseDate;
  final Value<int?> presidentId;
  final Value<int?> firstReviewerId;
  final Value<int?> secondReviewerId;
  final Value<int?> secretaryId;
  final Value<int?> memberId;
  final Value<bool> flagTracking;
  final Value<bool> flagPaid;
  final Value<bool> flagIgnore;
  final Value<String?> group;
  final Value<String?> year;
  final Value<int> isRegisteredForDefense;
  final Value<int> isProfileSubmitted;
  const DetaithacsiCompanion({
    this.id = const Value.absent(),
    this.supervisorId = const Value.absent(),
    this.vietnameseTitle = const Value.absent(),
    this.englishTitle = const Value.absent(),
    this.note = const Value.absent(),
    this.studentId = const Value.absent(),
    this.assignedDate = const Value.absent(),
    this.assignedDecisionNumber = const Value.absent(),
    this.defenseDeadline = const Value.absent(),
    this.defenseDecisionNumber = const Value.absent(),
    this.defenseDate = const Value.absent(),
    this.presidentId = const Value.absent(),
    this.firstReviewerId = const Value.absent(),
    this.secondReviewerId = const Value.absent(),
    this.secretaryId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.flagTracking = const Value.absent(),
    this.flagPaid = const Value.absent(),
    this.flagIgnore = const Value.absent(),
    this.group = const Value.absent(),
    this.year = const Value.absent(),
    this.isRegisteredForDefense = const Value.absent(),
    this.isProfileSubmitted = const Value.absent(),
  });
  DetaithacsiCompanion.insert({
    this.id = const Value.absent(),
    required int supervisorId,
    required String vietnameseTitle,
    required String englishTitle,
    this.note = const Value.absent(),
    this.studentId = const Value.absent(),
    this.assignedDate = const Value.absent(),
    this.assignedDecisionNumber = const Value.absent(),
    this.defenseDeadline = const Value.absent(),
    this.defenseDecisionNumber = const Value.absent(),
    this.defenseDate = const Value.absent(),
    this.presidentId = const Value.absent(),
    this.firstReviewerId = const Value.absent(),
    this.secondReviewerId = const Value.absent(),
    this.secretaryId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.flagTracking = const Value.absent(),
    this.flagPaid = const Value.absent(),
    this.flagIgnore = const Value.absent(),
    this.group = const Value.absent(),
    this.year = const Value.absent(),
    this.isRegisteredForDefense = const Value.absent(),
    this.isProfileSubmitted = const Value.absent(),
  }) : supervisorId = Value(supervisorId),
       vietnameseTitle = Value(vietnameseTitle),
       englishTitle = Value(englishTitle);
  static Insertable<DetaithacsiData> custom({
    Expression<int>? id,
    Expression<int>? supervisorId,
    Expression<String>? vietnameseTitle,
    Expression<String>? englishTitle,
    Expression<String>? note,
    Expression<int>? studentId,
    Expression<String>? assignedDate,
    Expression<String>? assignedDecisionNumber,
    Expression<String>? defenseDeadline,
    Expression<String>? defenseDecisionNumber,
    Expression<String>? defenseDate,
    Expression<int>? presidentId,
    Expression<int>? firstReviewerId,
    Expression<int>? secondReviewerId,
    Expression<int>? secretaryId,
    Expression<int>? memberId,
    Expression<bool>? flagTracking,
    Expression<bool>? flagPaid,
    Expression<bool>? flagIgnore,
    Expression<String>? group,
    Expression<String>? year,
    Expression<int>? isRegisteredForDefense,
    Expression<int>? isProfileSubmitted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supervisorId != null) 'idGiangVien': supervisorId,
      if (vietnameseTitle != null) 'tenTiengViet': vietnameseTitle,
      if (englishTitle != null) 'tenTiengAnh': englishTitle,
      if (note != null) 'ghiChu': note,
      if (studentId != null) 'idHocVien': studentId,
      if (assignedDate != null) 'ngayGiao': assignedDate,
      if (assignedDecisionNumber != null) 'soQdGiao': assignedDecisionNumber,
      if (defenseDeadline != null) 'hanBaoVe': defenseDeadline,
      if (defenseDecisionNumber != null) 'soQdBaoVe': defenseDecisionNumber,
      if (defenseDate != null) 'ngayBaoVe': defenseDate,
      if (presidentId != null) 'idChuTich': presidentId,
      if (firstReviewerId != null) 'idPhanBien1': firstReviewerId,
      if (secondReviewerId != null) 'idPhanBien2': secondReviewerId,
      if (secretaryId != null) 'idThuKy': secretaryId,
      if (memberId != null) 'idUyVien': memberId,
      if (flagTracking != null) 'flag_tracking': flagTracking,
      if (flagPaid != null) 'flag_paid': flagPaid,
      if (flagIgnore != null) 'flag_ignore': flagIgnore,
      if (group != null) 'group': group,
      if (year != null) 'nam': year,
      if (isRegisteredForDefense != null) 'dangKyBaoVe': isRegisteredForDefense,
      if (isProfileSubmitted != null) 'nopHoSo': isProfileSubmitted,
    });
  }

  DetaithacsiCompanion copyWith({
    Value<int>? id,
    Value<int>? supervisorId,
    Value<String>? vietnameseTitle,
    Value<String>? englishTitle,
    Value<String>? note,
    Value<int?>? studentId,
    Value<String?>? assignedDate,
    Value<String?>? assignedDecisionNumber,
    Value<String?>? defenseDeadline,
    Value<String?>? defenseDecisionNumber,
    Value<String?>? defenseDate,
    Value<int?>? presidentId,
    Value<int?>? firstReviewerId,
    Value<int?>? secondReviewerId,
    Value<int?>? secretaryId,
    Value<int?>? memberId,
    Value<bool>? flagTracking,
    Value<bool>? flagPaid,
    Value<bool>? flagIgnore,
    Value<String?>? group,
    Value<String?>? year,
    Value<int>? isRegisteredForDefense,
    Value<int>? isProfileSubmitted,
  }) {
    return DetaithacsiCompanion(
      id: id ?? this.id,
      supervisorId: supervisorId ?? this.supervisorId,
      vietnameseTitle: vietnameseTitle ?? this.vietnameseTitle,
      englishTitle: englishTitle ?? this.englishTitle,
      note: note ?? this.note,
      studentId: studentId ?? this.studentId,
      assignedDate: assignedDate ?? this.assignedDate,
      assignedDecisionNumber:
          assignedDecisionNumber ?? this.assignedDecisionNumber,
      defenseDeadline: defenseDeadline ?? this.defenseDeadline,
      defenseDecisionNumber:
          defenseDecisionNumber ?? this.defenseDecisionNumber,
      defenseDate: defenseDate ?? this.defenseDate,
      presidentId: presidentId ?? this.presidentId,
      firstReviewerId: firstReviewerId ?? this.firstReviewerId,
      secondReviewerId: secondReviewerId ?? this.secondReviewerId,
      secretaryId: secretaryId ?? this.secretaryId,
      memberId: memberId ?? this.memberId,
      flagTracking: flagTracking ?? this.flagTracking,
      flagPaid: flagPaid ?? this.flagPaid,
      flagIgnore: flagIgnore ?? this.flagIgnore,
      group: group ?? this.group,
      year: year ?? this.year,
      isRegisteredForDefense:
          isRegisteredForDefense ?? this.isRegisteredForDefense,
      isProfileSubmitted: isProfileSubmitted ?? this.isProfileSubmitted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supervisorId.present) {
      map['idGiangVien'] = Variable<int>(supervisorId.value);
    }
    if (vietnameseTitle.present) {
      map['tenTiengViet'] = Variable<String>(vietnameseTitle.value);
    }
    if (englishTitle.present) {
      map['tenTiengAnh'] = Variable<String>(englishTitle.value);
    }
    if (note.present) {
      map['ghiChu'] = Variable<String>(note.value);
    }
    if (studentId.present) {
      map['idHocVien'] = Variable<int>(studentId.value);
    }
    if (assignedDate.present) {
      map['ngayGiao'] = Variable<String>(assignedDate.value);
    }
    if (assignedDecisionNumber.present) {
      map['soQdGiao'] = Variable<String>(assignedDecisionNumber.value);
    }
    if (defenseDeadline.present) {
      map['hanBaoVe'] = Variable<String>(defenseDeadline.value);
    }
    if (defenseDecisionNumber.present) {
      map['soQdBaoVe'] = Variable<String>(defenseDecisionNumber.value);
    }
    if (defenseDate.present) {
      map['ngayBaoVe'] = Variable<String>(defenseDate.value);
    }
    if (presidentId.present) {
      map['idChuTich'] = Variable<int>(presidentId.value);
    }
    if (firstReviewerId.present) {
      map['idPhanBien1'] = Variable<int>(firstReviewerId.value);
    }
    if (secondReviewerId.present) {
      map['idPhanBien2'] = Variable<int>(secondReviewerId.value);
    }
    if (secretaryId.present) {
      map['idThuKy'] = Variable<int>(secretaryId.value);
    }
    if (memberId.present) {
      map['idUyVien'] = Variable<int>(memberId.value);
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
    if (isRegisteredForDefense.present) {
      map['dangKyBaoVe'] = Variable<int>(isRegisteredForDefense.value);
    }
    if (isProfileSubmitted.present) {
      map['nopHoSo'] = Variable<int>(isProfileSubmitted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetaithacsiCompanion(')
          ..write('id: $id, ')
          ..write('supervisorId: $supervisorId, ')
          ..write('vietnameseTitle: $vietnameseTitle, ')
          ..write('englishTitle: $englishTitle, ')
          ..write('note: $note, ')
          ..write('studentId: $studentId, ')
          ..write('assignedDate: $assignedDate, ')
          ..write('assignedDecisionNumber: $assignedDecisionNumber, ')
          ..write('defenseDeadline: $defenseDeadline, ')
          ..write('defenseDecisionNumber: $defenseDecisionNumber, ')
          ..write('defenseDate: $defenseDate, ')
          ..write('presidentId: $presidentId, ')
          ..write('firstReviewerId: $firstReviewerId, ')
          ..write('secondReviewerId: $secondReviewerId, ')
          ..write('secretaryId: $secretaryId, ')
          ..write('memberId: $memberId, ')
          ..write('flagTracking: $flagTracking, ')
          ..write('flagPaid: $flagPaid, ')
          ..write('flagIgnore: $flagIgnore, ')
          ..write('group: $group, ')
          ..write('year: $year, ')
          ..write('isRegisteredForDefense: $isRegisteredForDefense, ')
          ..write('isProfileSubmitted: $isProfileSubmitted')
          ..write(')'))
        .toString();
  }
}

class PhdCohort extends Table with TableInfo<PhdCohort, PhdCohortData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PhdCohort(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> cohort = GeneratedColumn<String>(
    'cohort',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
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
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime>(json['updatedTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cohort': serializer.toJson<String>(cohort),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime>(updatedTime),
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<String> cohort = GeneratedColumn<String>(
    'cohort',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> managementId = GeneratedColumn<String>(
    'management_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'UNIQUE',
  );
  late final GeneratedColumn<String> admissionId = GeneratedColumn<String>(
    'admission_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE NOT NULL',
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'M\'',
    defaultValue: const CustomExpression('\'M\''),
  );
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> placeOfBirth = GeneratedColumn<String>(
    'place_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<String> personalEmail = GeneratedColumn<String>(
    'personal_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
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
  late final GeneratedColumn<String> majorId = GeneratedColumn<String>(
    'major_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 9460101',
    defaultValue: const CustomExpression('9460101'),
  );
  late final GeneratedColumn<String> majorSpecialization =
      GeneratedColumn<String>(
        'major_specialization',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NOT NULL DEFAULT \'n/a\'',
        defaultValue: const CustomExpression('\'n/a\''),
      );
  late final GeneratedColumn<int> admissionPresidentId = GeneratedColumn<int>(
    'admission_president_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> admissionSecretaryId = GeneratedColumn<int>(
    'admission_secretary_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> admission1stMemberId = GeneratedColumn<int>(
    'admission_1st_member_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> admission2ndMemberId = GeneratedColumn<int>(
    'admission_2nd_member_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> admission3rdMemberId = GeneratedColumn<int>(
    'admission_3rd_member_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
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
  late final GeneratedColumn<String> thesis = GeneratedColumn<String>(
    'thesis',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> supervisorId = GeneratedColumn<int>(
    'supervisor_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> secondarySupervisorId = GeneratedColumn<int>(
    'secondary_supervisor_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> schoolEmail = GeneratedColumn<String>(
    'school_email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'UNIQUE',
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
  late final GeneratedColumn<String> updatedTime = GeneratedColumn<String>(
    'updated_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'phd_student';
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
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
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
      majorSpecialization: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}major_specialization'],
      )!,
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
    );
  }

  @override
  PhdStudent createAlias(String alias) {
    return PhdStudent(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(admission_president_id)REFERENCES giangvien(id)',
    'FOREIGN KEY(admission_president_id)REFERENCES giangvien(id)',
    'FOREIGN KEY(admission_secretary_id)REFERENCES giangvien(id)',
    'FOREIGN KEY(admission_1st_member_id)REFERENCES giangvien(id)',
    'FOREIGN KEY(admission_2nd_member_id)REFERENCES giangvien(id)',
    'FOREIGN KEY(admission_3rd_member_id)REFERENCES giangvien(id)',
    'FOREIGN KEY(supervisor_id)REFERENCES giangvien(id)',
    'FOREIGN KEY(secondary_supervisor_id)REFERENCES giangvien(id)',
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
  final String gender;
  final DateTime? dateOfBirth;
  final String? placeOfBirth;
  final String phone;
  final String personalEmail;
  final String majorName;
  final String majorId;
  final String majorSpecialization;
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
    map['gender'] = Variable<String>(gender);
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
    map['major_specialization'] = Variable<String>(majorSpecialization);
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
      managementId: serializer.fromJson<String?>(json['managementId']),
      admissionId: serializer.fromJson<String>(json['admissionId']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<String>(json['gender']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
      placeOfBirth: serializer.fromJson<String?>(json['placeOfBirth']),
      phone: serializer.fromJson<String>(json['phone']),
      personalEmail: serializer.fromJson<String>(json['personalEmail']),
      majorName: serializer.fromJson<String>(json['majorName']),
      majorId: serializer.fromJson<String>(json['majorId']),
      majorSpecialization: serializer.fromJson<String>(
        json['majorSpecialization'],
      ),
      admissionPresidentId: serializer.fromJson<int?>(
        json['admissionPresidentId'],
      ),
      admissionSecretaryId: serializer.fromJson<int?>(
        json['admissionSecretaryId'],
      ),
      admission1stMemberId: serializer.fromJson<int?>(
        json['admission1stMemberId'],
      ),
      admission2ndMemberId: serializer.fromJson<int?>(
        json['admission2ndMemberId'],
      ),
      admission3rdMemberId: serializer.fromJson<int?>(
        json['admission3rdMemberId'],
      ),
      admissionPaid: serializer.fromJson<bool>(json['admissionPaid']),
      thesis: serializer.fromJson<String>(json['thesis']),
      supervisorId: serializer.fromJson<int>(json['supervisorId']),
      secondarySupervisorId: serializer.fromJson<int?>(
        json['secondarySupervisorId'],
      ),
      schoolEmail: serializer.fromJson<String?>(json['schoolEmail']),
      createdTime: serializer.fromJson<String>(json['createdTime']),
      updatedTime: serializer.fromJson<String>(json['updatedTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cohort': serializer.toJson<String>(cohort),
      'managementId': serializer.toJson<String?>(managementId),
      'admissionId': serializer.toJson<String>(admissionId),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<String>(gender),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
      'placeOfBirth': serializer.toJson<String?>(placeOfBirth),
      'phone': serializer.toJson<String>(phone),
      'personalEmail': serializer.toJson<String>(personalEmail),
      'majorName': serializer.toJson<String>(majorName),
      'majorId': serializer.toJson<String>(majorId),
      'majorSpecialization': serializer.toJson<String>(majorSpecialization),
      'admissionPresidentId': serializer.toJson<int?>(admissionPresidentId),
      'admissionSecretaryId': serializer.toJson<int?>(admissionSecretaryId),
      'admission1stMemberId': serializer.toJson<int?>(admission1stMemberId),
      'admission2ndMemberId': serializer.toJson<int?>(admission2ndMemberId),
      'admission3rdMemberId': serializer.toJson<int?>(admission3rdMemberId),
      'admissionPaid': serializer.toJson<bool>(admissionPaid),
      'thesis': serializer.toJson<String>(thesis),
      'supervisorId': serializer.toJson<int>(supervisorId),
      'secondarySupervisorId': serializer.toJson<int?>(secondarySupervisorId),
      'schoolEmail': serializer.toJson<String?>(schoolEmail),
      'createdTime': serializer.toJson<String>(createdTime),
      'updatedTime': serializer.toJson<String>(updatedTime),
    };
  }

  PhdStudentData copyWith({
    int? id,
    String? cohort,
    Value<String?> managementId = const Value.absent(),
    String? admissionId,
    String? name,
    String? gender,
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<String?> placeOfBirth = const Value.absent(),
    String? phone,
    String? personalEmail,
    String? majorName,
    String? majorId,
    String? majorSpecialization,
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
          ..write('updatedTime: $updatedTime')
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
          other.updatedTime == this.updatedTime);
}

class PhdStudentCompanion extends UpdateCompanion<PhdStudentData> {
  final Value<int> id;
  final Value<String> cohort;
  final Value<String?> managementId;
  final Value<String> admissionId;
  final Value<String> name;
  final Value<String> gender;
  final Value<DateTime?> dateOfBirth;
  final Value<String?> placeOfBirth;
  final Value<String> phone;
  final Value<String> personalEmail;
  final Value<String> majorName;
  final Value<String> majorId;
  final Value<String> majorSpecialization;
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
    this.majorSpecialization = const Value.absent(),
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
  }) : cohort = Value(cohort),
       admissionId = Value(admissionId),
       name = Value(name),
       phone = Value(phone),
       personalEmail = Value(personalEmail),
       thesis = Value(thesis),
       supervisorId = Value(supervisorId);
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
    });
  }

  PhdStudentCompanion copyWith({
    Value<int>? id,
    Value<String>? cohort,
    Value<String?>? managementId,
    Value<String>? admissionId,
    Value<String>? name,
    Value<String>? gender,
    Value<DateTime?>? dateOfBirth,
    Value<String?>? placeOfBirth,
    Value<String>? phone,
    Value<String>? personalEmail,
    Value<String>? majorName,
    Value<String>? majorId,
    Value<String>? majorSpecialization,
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
      map['gender'] = Variable<String>(gender.value);
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
      map['major_specialization'] = Variable<String>(majorSpecialization.value);
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
          ..write('updatedTime: $updatedTime')
          ..write(')'))
        .toString();
  }
}

class DangKyGiangDay extends Table
    with TableInfo<DangKyGiangDay, DangKyGiangDayData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DangKyGiangDay(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'idGiangVien',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
    'maHocPhan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [teacherId, courseId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'DangKyGiangDay';
  @override
  Set<GeneratedColumn> get $primaryKey => {teacherId, courseId};
  @override
  DangKyGiangDayData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DangKyGiangDayData(
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idGiangVien'],
      )!,
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}maHocPhan'],
      )!,
    );
  }

  @override
  DangKyGiangDay createAlias(String alias) {
    return DangKyGiangDay(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(idGiangVien, maHocPhan)',
    'FOREIGN KEY(idGiangVien)REFERENCES giangvien(id)',
    'FOREIGN KEY(maHocPhan)REFERENCES hocphan(maHocPhan)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class DangKyGiangDayData extends DataClass
    implements Insertable<DangKyGiangDayData> {
  final int teacherId;
  final String courseId;
  const DangKyGiangDayData({required this.teacherId, required this.courseId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idGiangVien'] = Variable<int>(teacherId);
    map['maHocPhan'] = Variable<String>(courseId);
    return map;
  }

  DangKyGiangDayCompanion toCompanion(bool nullToAbsent) {
    return DangKyGiangDayCompanion(
      teacherId: Value(teacherId),
      courseId: Value(courseId),
    );
  }

  factory DangKyGiangDayData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DangKyGiangDayData(
      teacherId: serializer.fromJson<int>(json['teacherId']),
      courseId: serializer.fromJson<String>(json['courseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'teacherId': serializer.toJson<int>(teacherId),
      'courseId': serializer.toJson<String>(courseId),
    };
  }

  DangKyGiangDayData copyWith({int? teacherId, String? courseId}) =>
      DangKyGiangDayData(
        teacherId: teacherId ?? this.teacherId,
        courseId: courseId ?? this.courseId,
      );
  DangKyGiangDayData copyWithCompanion(DangKyGiangDayCompanion data) {
    return DangKyGiangDayData(
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DangKyGiangDayData(')
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
      (other is DangKyGiangDayData &&
          other.teacherId == this.teacherId &&
          other.courseId == this.courseId);
}

class DangKyGiangDayCompanion extends UpdateCompanion<DangKyGiangDayData> {
  final Value<int> teacherId;
  final Value<String> courseId;
  final Value<int> rowid;
  const DangKyGiangDayCompanion({
    this.teacherId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DangKyGiangDayCompanion.insert({
    required int teacherId,
    required String courseId,
    this.rowid = const Value.absent(),
  }) : teacherId = Value(teacherId),
       courseId = Value(courseId);
  static Insertable<DangKyGiangDayData> custom({
    Expression<int>? teacherId,
    Expression<String>? courseId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (teacherId != null) 'idGiangVien': teacherId,
      if (courseId != null) 'maHocPhan': courseId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DangKyGiangDayCompanion copyWith({
    Value<int>? teacherId,
    Value<String>? courseId,
    Value<int>? rowid,
  }) {
    return DangKyGiangDayCompanion(
      teacherId: teacherId ?? this.teacherId,
      courseId: courseId ?? this.courseId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (teacherId.present) {
      map['idGiangVien'] = Variable<int>(teacherId.value);
    }
    if (courseId.present) {
      map['maHocPhan'] = Variable<String>(courseId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DangKyGiangDayCompanion(')
          ..write('teacherId: $teacherId, ')
          ..write('courseId: $courseId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class LopTinChi extends Table with TableInfo<LopTinChi, LopTinChiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LopTinChi(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<String> classId = GeneratedColumn<String>(
    'maLopHoc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
    'maHocPhan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'idGiangVien',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
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
  late final GeneratedColumn<String> accessUrl = GeneratedColumn<String>(
    'urlTruyCap',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
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
  late final GeneratedColumn<DateTime> customEndDate =
      GeneratedColumn<DateTime>(
        'customEndDate',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumn<String> semester = GeneratedColumn<String>(
    'hocKy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> classroom = GeneratedColumn<String>(
    'phongHoc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> dayOfWeek = GeneratedColumn<String>(
    'ngayHoc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> startPeriod = GeneratedColumn<int>(
    'tietBatDau',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> endPeriod = GeneratedColumn<int>(
    'tietKetThuc',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'trangThai',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
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
  static const String $name = 'LopTinChi';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LopTinChiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LopTinChiData(
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
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ngayHoc'],
      ),
      startPeriod: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tietBatDau'],
      ),
      endPeriod: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tietKetThuc'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trangThai'],
      ),
    );
  }

  @override
  LopTinChi createAlias(String alias) {
    return LopTinChi(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class LopTinChiData extends DataClass implements Insertable<LopTinChiData> {
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
  final String? dayOfWeek;
  final int? startPeriod;
  final int? endPeriod;
  final int? status;
  const LopTinChiData({
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
      map['ngayHoc'] = Variable<String>(dayOfWeek);
    }
    if (!nullToAbsent || startPeriod != null) {
      map['tietBatDau'] = Variable<int>(startPeriod);
    }
    if (!nullToAbsent || endPeriod != null) {
      map['tietKetThuc'] = Variable<int>(endPeriod);
    }
    if (!nullToAbsent || status != null) {
      map['trangThai'] = Variable<int>(status);
    }
    return map;
  }

  LopTinChiCompanion toCompanion(bool nullToAbsent) {
    return LopTinChiCompanion(
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

  factory LopTinChiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LopTinChiData(
      id: serializer.fromJson<int>(json['id']),
      classId: serializer.fromJson<String>(json['classId']),
      courseId: serializer.fromJson<String>(json['courseId']),
      teacherId: serializer.fromJson<int?>(json['teacherId']),
      registrationCount: serializer.fromJson<int>(json['registrationCount']),
      accessUrl: serializer.fromJson<String?>(json['accessUrl']),
      customBeginDate: serializer.fromJson<DateTime?>(json['customBeginDate']),
      customEndDate: serializer.fromJson<DateTime?>(json['customEndDate']),
      semester: serializer.fromJson<String>(json['semester']),
      classroom: serializer.fromJson<String?>(json['classroom']),
      dayOfWeek: serializer.fromJson<String?>(json['dayOfWeek']),
      startPeriod: serializer.fromJson<int?>(json['startPeriod']),
      endPeriod: serializer.fromJson<int?>(json['endPeriod']),
      status: serializer.fromJson<int?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'classId': serializer.toJson<String>(classId),
      'courseId': serializer.toJson<String>(courseId),
      'teacherId': serializer.toJson<int?>(teacherId),
      'registrationCount': serializer.toJson<int>(registrationCount),
      'accessUrl': serializer.toJson<String?>(accessUrl),
      'customBeginDate': serializer.toJson<DateTime?>(customBeginDate),
      'customEndDate': serializer.toJson<DateTime?>(customEndDate),
      'semester': serializer.toJson<String>(semester),
      'classroom': serializer.toJson<String?>(classroom),
      'dayOfWeek': serializer.toJson<String?>(dayOfWeek),
      'startPeriod': serializer.toJson<int?>(startPeriod),
      'endPeriod': serializer.toJson<int?>(endPeriod),
      'status': serializer.toJson<int?>(status),
    };
  }

  LopTinChiData copyWith({
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
    Value<String?> dayOfWeek = const Value.absent(),
    Value<int?> startPeriod = const Value.absent(),
    Value<int?> endPeriod = const Value.absent(),
    Value<int?> status = const Value.absent(),
  }) => LopTinChiData(
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
  LopTinChiData copyWithCompanion(LopTinChiCompanion data) {
    return LopTinChiData(
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
    return (StringBuffer('LopTinChiData(')
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
      (other is LopTinChiData &&
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

class LopTinChiCompanion extends UpdateCompanion<LopTinChiData> {
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
  final Value<String?> dayOfWeek;
  final Value<int?> startPeriod;
  final Value<int?> endPeriod;
  final Value<int?> status;
  const LopTinChiCompanion({
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
  LopTinChiCompanion.insert({
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
  static Insertable<LopTinChiData> custom({
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
    Expression<String>? dayOfWeek,
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

  LopTinChiCompanion copyWith({
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
    Value<String?>? dayOfWeek,
    Value<int?>? startPeriod,
    Value<int?>? endPeriod,
    Value<int?>? status,
  }) {
    return LopTinChiCompanion(
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
      map['ngayHoc'] = Variable<String>(dayOfWeek.value);
    }
    if (startPeriod.present) {
      map['tietBatDau'] = Variable<int>(startPeriod.value);
    }
    if (endPeriod.present) {
      map['tietKetThuc'] = Variable<int>(endPeriod.value);
    }
    if (status.present) {
      map['trangThai'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LopTinChiCompanion(')
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
  late final GeneratedColumn<int> classId = GeneratedColumn<int>(
    'classId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'teacherId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  late final GeneratedColumn<double> contribution = GeneratedColumn<double>(
    'contribution',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1.0',
    defaultValue: const CustomExpression('1.0'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    classId,
    teacherId,
    order,
    contribution,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'TeachingAssignment';
  @override
  Set<GeneratedColumn> get $primaryKey => {classId, teacherId};
  @override
  TeachingAssignmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeachingAssignmentData(
      classId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}classId'],
      )!,
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacherId'],
      )!,
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      )!,
      contribution: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}contribution'],
      )!,
    );
  }

  @override
  TeachingAssignment createAlias(String alias) {
    return TeachingAssignment(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(classId, teacherId)',
    'FOREIGN KEY(classId)REFERENCES LopTinChi(id)',
    'FOREIGN KEY(teacherId)REFERENCES GiangVien(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class TeachingAssignmentData extends DataClass
    implements Insertable<TeachingAssignmentData> {
  final int classId;
  final int teacherId;
  final int order;
  final double contribution;
  const TeachingAssignmentData({
    required this.classId,
    required this.teacherId,
    required this.order,
    required this.contribution,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['classId'] = Variable<int>(classId);
    map['teacherId'] = Variable<int>(teacherId);
    map['order'] = Variable<int>(order);
    map['contribution'] = Variable<double>(contribution);
    return map;
  }

  TeachingAssignmentCompanion toCompanion(bool nullToAbsent) {
    return TeachingAssignmentCompanion(
      classId: Value(classId),
      teacherId: Value(teacherId),
      order: Value(order),
      contribution: Value(contribution),
    );
  }

  factory TeachingAssignmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeachingAssignmentData(
      classId: serializer.fromJson<int>(json['classId']),
      teacherId: serializer.fromJson<int>(json['teacherId']),
      order: serializer.fromJson<int>(json['order']),
      contribution: serializer.fromJson<double>(json['contribution']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'classId': serializer.toJson<int>(classId),
      'teacherId': serializer.toJson<int>(teacherId),
      'order': serializer.toJson<int>(order),
      'contribution': serializer.toJson<double>(contribution),
    };
  }

  TeachingAssignmentData copyWith({
    int? classId,
    int? teacherId,
    int? order,
    double? contribution,
  }) => TeachingAssignmentData(
    classId: classId ?? this.classId,
    teacherId: teacherId ?? this.teacherId,
    order: order ?? this.order,
    contribution: contribution ?? this.contribution,
  );
  TeachingAssignmentData copyWithCompanion(TeachingAssignmentCompanion data) {
    return TeachingAssignmentData(
      classId: data.classId.present ? data.classId.value : this.classId,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      order: data.order.present ? data.order.value : this.order,
      contribution: data.contribution.present
          ? data.contribution.value
          : this.contribution,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeachingAssignmentData(')
          ..write('classId: $classId, ')
          ..write('teacherId: $teacherId, ')
          ..write('order: $order, ')
          ..write('contribution: $contribution')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(classId, teacherId, order, contribution);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeachingAssignmentData &&
          other.classId == this.classId &&
          other.teacherId == this.teacherId &&
          other.order == this.order &&
          other.contribution == this.contribution);
}

class TeachingAssignmentCompanion
    extends UpdateCompanion<TeachingAssignmentData> {
  final Value<int> classId;
  final Value<int> teacherId;
  final Value<int> order;
  final Value<double> contribution;
  final Value<int> rowid;
  const TeachingAssignmentCompanion({
    this.classId = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.order = const Value.absent(),
    this.contribution = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TeachingAssignmentCompanion.insert({
    required int classId,
    required int teacherId,
    this.order = const Value.absent(),
    this.contribution = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : classId = Value(classId),
       teacherId = Value(teacherId);
  static Insertable<TeachingAssignmentData> custom({
    Expression<int>? classId,
    Expression<int>? teacherId,
    Expression<int>? order,
    Expression<double>? contribution,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (classId != null) 'classId': classId,
      if (teacherId != null) 'teacherId': teacherId,
      if (order != null) 'order': order,
      if (contribution != null) 'contribution': contribution,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TeachingAssignmentCompanion copyWith({
    Value<int>? classId,
    Value<int>? teacherId,
    Value<int>? order,
    Value<double>? contribution,
    Value<int>? rowid,
  }) {
    return TeachingAssignmentCompanion(
      classId: classId ?? this.classId,
      teacherId: teacherId ?? this.teacherId,
      order: order ?? this.order,
      contribution: contribution ?? this.contribution,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (classId.present) {
      map['classId'] = Variable<int>(classId.value);
    }
    if (teacherId.present) {
      map['teacherId'] = Variable<int>(teacherId.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (contribution.present) {
      map['contribution'] = Variable<double>(contribution.value);
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
          ..write('order: $order, ')
          ..write('contribution: $contribution, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DangKyHoc extends Table with TableInfo<DangKyHoc, DangKyHocData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DangKyHoc(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> courseClassId = GeneratedColumn<int>(
    'idLopTinChi',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'idHocVien',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [courseClassId, studentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'DangKyHoc';
  @override
  Set<GeneratedColumn> get $primaryKey => {courseClassId, studentId};
  @override
  DangKyHocData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DangKyHocData(
      courseClassId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idLopTinChi'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idHocVien'],
      )!,
    );
  }

  @override
  DangKyHoc createAlias(String alias) {
    return DangKyHoc(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(idLopTinChi, idHocVien)',
    'FOREIGN KEY(idLopTinChi)REFERENCES LopTinChi(id)',
    'FOREIGN KEY(idHocVien)REFERENCES phd_student(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class DangKyHocData extends DataClass implements Insertable<DangKyHocData> {
  final int courseClassId;
  final int studentId;
  const DangKyHocData({required this.courseClassId, required this.studentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idLopTinChi'] = Variable<int>(courseClassId);
    map['idHocVien'] = Variable<int>(studentId);
    return map;
  }

  DangKyHocCompanion toCompanion(bool nullToAbsent) {
    return DangKyHocCompanion(
      courseClassId: Value(courseClassId),
      studentId: Value(studentId),
    );
  }

  factory DangKyHocData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DangKyHocData(
      courseClassId: serializer.fromJson<int>(json['courseClassId']),
      studentId: serializer.fromJson<int>(json['studentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'courseClassId': serializer.toJson<int>(courseClassId),
      'studentId': serializer.toJson<int>(studentId),
    };
  }

  DangKyHocData copyWith({int? courseClassId, int? studentId}) => DangKyHocData(
    courseClassId: courseClassId ?? this.courseClassId,
    studentId: studentId ?? this.studentId,
  );
  DangKyHocData copyWithCompanion(DangKyHocCompanion data) {
    return DangKyHocData(
      courseClassId: data.courseClassId.present
          ? data.courseClassId.value
          : this.courseClassId,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DangKyHocData(')
          ..write('courseClassId: $courseClassId, ')
          ..write('studentId: $studentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(courseClassId, studentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DangKyHocData &&
          other.courseClassId == this.courseClassId &&
          other.studentId == this.studentId);
}

class DangKyHocCompanion extends UpdateCompanion<DangKyHocData> {
  final Value<int> courseClassId;
  final Value<int> studentId;
  final Value<int> rowid;
  const DangKyHocCompanion({
    this.courseClassId = const Value.absent(),
    this.studentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DangKyHocCompanion.insert({
    required int courseClassId,
    required int studentId,
    this.rowid = const Value.absent(),
  }) : courseClassId = Value(courseClassId),
       studentId = Value(studentId);
  static Insertable<DangKyHocData> custom({
    Expression<int>? courseClassId,
    Expression<int>? studentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (courseClassId != null) 'idLopTinChi': courseClassId,
      if (studentId != null) 'idHocVien': studentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DangKyHocCompanion copyWith({
    Value<int>? courseClassId,
    Value<int>? studentId,
    Value<int>? rowid,
  }) {
    return DangKyHocCompanion(
      courseClassId: courseClassId ?? this.courseClassId,
      studentId: studentId ?? this.studentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courseClassId.present) {
      map['idLopTinChi'] = Variable<int>(courseClassId.value);
    }
    if (studentId.present) {
      map['idHocVien'] = Variable<int>(studentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DangKyHocCompanion(')
          ..write('courseClassId: $courseClassId, ')
          ..write('studentId: $studentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class FtsDeTaiThacSi extends Table
    with
        TableInfo<FtsDeTaiThacSi, FtsDeTaiThacSiData>,
        VirtualTableInfo<FtsDeTaiThacSi, FtsDeTaiThacSiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FtsDeTaiThacSi(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> idGiangVien = GeneratedColumn<String>(
    'idGiangVien',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> idHocVien = GeneratedColumn<String>(
    'idHocVien',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> tenTiengAnh = GeneratedColumn<String>(
    'tenTiengAnh',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> tenTiengViet = GeneratedColumn<String>(
    'tenTiengViet',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> giangVien = GeneratedColumn<String>(
    'giangVien',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
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
  static const String $name = 'fts_DeTaiThacSi';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FtsDeTaiThacSiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FtsDeTaiThacSiData(
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
  FtsDeTaiThacSi createAlias(String alias) {
    return FtsDeTaiThacSi(attachedDatabase, alias);
  }

  @override
  String get moduleAndArgs =>
      'fts5(id, idGiangVien, idHocVien, tenTiengAnh, tenTiengViet, giangVien, hocVien, tokenize="trigram remove_diacritics 1 case_sensitive 0", prefix="2 3 5 7")';
}

class FtsDeTaiThacSiData extends DataClass
    implements Insertable<FtsDeTaiThacSiData> {
  final String id;
  final String idGiangVien;
  final String idHocVien;
  final String tenTiengAnh;
  final String tenTiengViet;
  final String giangVien;
  final String hocVien;
  const FtsDeTaiThacSiData({
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

  FtsDeTaiThacSiCompanion toCompanion(bool nullToAbsent) {
    return FtsDeTaiThacSiCompanion(
      id: Value(id),
      idGiangVien: Value(idGiangVien),
      idHocVien: Value(idHocVien),
      tenTiengAnh: Value(tenTiengAnh),
      tenTiengViet: Value(tenTiengViet),
      giangVien: Value(giangVien),
      hocVien: Value(hocVien),
    );
  }

  factory FtsDeTaiThacSiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FtsDeTaiThacSiData(
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

  FtsDeTaiThacSiData copyWith({
    String? id,
    String? idGiangVien,
    String? idHocVien,
    String? tenTiengAnh,
    String? tenTiengViet,
    String? giangVien,
    String? hocVien,
  }) => FtsDeTaiThacSiData(
    id: id ?? this.id,
    idGiangVien: idGiangVien ?? this.idGiangVien,
    idHocVien: idHocVien ?? this.idHocVien,
    tenTiengAnh: tenTiengAnh ?? this.tenTiengAnh,
    tenTiengViet: tenTiengViet ?? this.tenTiengViet,
    giangVien: giangVien ?? this.giangVien,
    hocVien: hocVien ?? this.hocVien,
  );
  FtsDeTaiThacSiData copyWithCompanion(FtsDeTaiThacSiCompanion data) {
    return FtsDeTaiThacSiData(
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
    return (StringBuffer('FtsDeTaiThacSiData(')
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
      (other is FtsDeTaiThacSiData &&
          other.id == this.id &&
          other.idGiangVien == this.idGiangVien &&
          other.idHocVien == this.idHocVien &&
          other.tenTiengAnh == this.tenTiengAnh &&
          other.tenTiengViet == this.tenTiengViet &&
          other.giangVien == this.giangVien &&
          other.hocVien == this.hocVien);
}

class FtsDeTaiThacSiCompanion extends UpdateCompanion<FtsDeTaiThacSiData> {
  final Value<String> id;
  final Value<String> idGiangVien;
  final Value<String> idHocVien;
  final Value<String> tenTiengAnh;
  final Value<String> tenTiengViet;
  final Value<String> giangVien;
  final Value<String> hocVien;
  final Value<int> rowid;
  const FtsDeTaiThacSiCompanion({
    this.id = const Value.absent(),
    this.idGiangVien = const Value.absent(),
    this.idHocVien = const Value.absent(),
    this.tenTiengAnh = const Value.absent(),
    this.tenTiengViet = const Value.absent(),
    this.giangVien = const Value.absent(),
    this.hocVien = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FtsDeTaiThacSiCompanion.insert({
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
  static Insertable<FtsDeTaiThacSiData> custom({
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

  FtsDeTaiThacSiCompanion copyWith({
    Value<String>? id,
    Value<String>? idGiangVien,
    Value<String>? idHocVien,
    Value<String>? tenTiengAnh,
    Value<String>? tenTiengViet,
    Value<String>? giangVien,
    Value<String>? hocVien,
    Value<int>? rowid,
  }) {
    return FtsDeTaiThacSiCompanion(
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
    return (StringBuffer('FtsDeTaiThacSiCompanion(')
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

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final NienKhoa nienKhoa = NienKhoa(this);
  late final Giangvien giangvien = Giangvien(this);
  late final TieuBanXetTuyen tieuBanXetTuyen = TieuBanXetTuyen(this);
  late final HocVien hocVien = HocVien(this);
  late final Hocky hocky = Hocky(this);
  late final Hocphan hocphan = Hocphan(this);
  late final Detaithacsi detaithacsi = Detaithacsi(this);
  late final PhdCohort phdCohort = PhdCohort(this);
  late final PhdStudent phdStudent = PhdStudent(this);
  late final DangKyGiangDay dangKyGiangDay = DangKyGiangDay(this);
  late final LopTinChi lopTinChi = LopTinChi(this);
  late final TeachingAssignment teachingAssignment = TeachingAssignment(this);
  late final DangKyHoc dangKyHoc = DangKyHoc(this);
  late final FtsDeTaiThacSi ftsDeTaiThacSi = FtsDeTaiThacSi(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    nienKhoa,
    giangvien,
    tieuBanXetTuyen,
    hocVien,
    hocky,
    hocphan,
    detaithacsi,
    phdCohort,
    phdStudent,
    dangKyGiangDay,
    lopTinChi,
    teachingAssignment,
    dangKyHoc,
    ftsDeTaiThacSi,
  ];
  @override
  int get schemaVersion => 2;
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
