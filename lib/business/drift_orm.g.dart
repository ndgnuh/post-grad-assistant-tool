// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_orm.dart';

// ignore_for_file: type=lint
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

class NienKhoa extends Table with TableInfo<NienKhoa, CohortData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  NienKhoa(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cohortMeta = const VerificationMeta('cohort');
  late final GeneratedColumn<String> cohort = GeneratedColumn<String>(
    'nienKhoa',
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
  VerificationContext validateIntegrity(
    Insertable<CohortData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nienKhoa')) {
      context.handle(
        _cohortMeta,
        cohort.isAcceptableOrUnknown(data['nienKhoa']!, _cohortMeta),
      );
    } else if (isInserting) {
      context.missing(_cohortMeta);
    }
    if (data.containsKey('groupUrl')) {
      context.handle(
        _groupUrlMeta,
        groupUrl.isAcceptableOrUnknown(data['groupUrl']!, _groupUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cohort};
  @override
  CohortData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CohortData(
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

class CohortData extends DataClass implements Insertable<CohortData> {
  final String cohort;
  final String groupUrl;
  const CohortData({required this.cohort, required this.groupUrl});
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

  factory CohortData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CohortData(
      cohort: serializer.fromJson<String>(json['nienKhoa']),
      groupUrl: serializer.fromJson<String>(json['groupUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nienKhoa': serializer.toJson<String>(cohort),
      'groupUrl': serializer.toJson<String>(groupUrl),
    };
  }

  CohortData copyWith({String? cohort, String? groupUrl}) => CohortData(
    cohort: cohort ?? this.cohort,
    groupUrl: groupUrl ?? this.groupUrl,
  );
  CohortData copyWithCompanion(NienKhoaCompanion data) {
    return CohortData(
      cohort: data.cohort.present ? data.cohort.value : this.cohort,
      groupUrl: data.groupUrl.present ? data.groupUrl.value : this.groupUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CohortData(')
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
      (other is CohortData &&
          other.cohort == this.cohort &&
          other.groupUrl == this.groupUrl);
}

class NienKhoaCompanion extends UpdateCompanion<CohortData> {
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
  static Insertable<CohortData> custom({
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
  static const VerificationMeta _managementIdMeta = const VerificationMeta(
    'managementId',
  );
  late final GeneratedColumn<String> managementId = GeneratedColumn<String>(
    'maCanBo',
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
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'donVi',
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
    'ngoaiTruong',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT TRUE',
    defaultValue: const CustomExpression('TRUE'),
  );
  late final GeneratedColumnWithTypeConverter<enums.Gender?, String> gender =
      GeneratedColumn<String>(
        'gioiTinh',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      ).withConverter<enums.Gender?>(Teacher.$convertergendern);
  late final GeneratedColumnWithTypeConverter<enums.AcademicRank?, String>
  academicRank = GeneratedColumn<String>(
    'hocHam',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<enums.AcademicRank?>(Teacher.$converteracademicRank);
  late final GeneratedColumnWithTypeConverter<enums.AcademicDegree?, String>
  academicDegree = GeneratedColumn<String>(
    'hocVi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<enums.AcademicDegree?>(Teacher.$converteracademicDegree);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'sdt',
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
  static const VerificationMeta _citizenIdMeta = const VerificationMeta(
    'citizenId',
  );
  late final GeneratedColumn<String> citizenId = GeneratedColumn<String>(
    'cccd',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumnWithTypeConverter<DateTime?, String> dateOfBirth =
      GeneratedColumn<String>(
        'ngaySinh',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      ).withConverter<DateTime?>(Teacher.$converterdateOfBirth);
  static const VerificationMeta _bankAccountMeta = const VerificationMeta(
    'bankAccount',
  );
  late final GeneratedColumn<String> bankAccount = GeneratedColumn<String>(
    'stk',
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
    'nganHang',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _taxCodeMeta = const VerificationMeta(
    'taxCode',
  );
  late final GeneratedColumn<String> taxCode = GeneratedColumn<String>(
    'mst',
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
  static const VerificationMeta _academicGroupIdMeta = const VerificationMeta(
    'academicGroupId',
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
    if (data.containsKey('maCanBo')) {
      context.handle(
        _managementIdMeta,
        managementId.isAcceptableOrUnknown(data['maCanBo']!, _managementIdMeta),
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
    if (data.containsKey('donVi')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['donVi']!, _departmentMeta),
      );
    }
    if (data.containsKey('ngoaiTruong')) {
      context.handle(
        _isOutsiderMeta,
        isOutsider.isAcceptableOrUnknown(data['ngoaiTruong']!, _isOutsiderMeta),
      );
    }
    if (data.containsKey('sdt')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['sdt']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _personalEmailMeta,
        personalEmail.isAcceptableOrUnknown(data['email']!, _personalEmailMeta),
      );
    }
    if (data.containsKey('cccd')) {
      context.handle(
        _citizenIdMeta,
        citizenId.isAcceptableOrUnknown(data['cccd']!, _citizenIdMeta),
      );
    }
    if (data.containsKey('stk')) {
      context.handle(
        _bankAccountMeta,
        bankAccount.isAcceptableOrUnknown(data['stk']!, _bankAccountMeta),
      );
    }
    if (data.containsKey('nganHang')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['nganHang']!, _bankNameMeta),
      );
    }
    if (data.containsKey('mst')) {
      context.handle(
        _taxCodeMeta,
        taxCode.isAcceptableOrUnknown(data['mst']!, _taxCodeMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('ncm')) {
      context.handle(
        _academicGroupIdMeta,
        academicGroupId.isAcceptableOrUnknown(
          data['ncm']!,
          _academicGroupIdMeta,
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
      gender: Teacher.$convertergendern.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gioiTinh'],
        ),
      ),
      academicRank: Teacher.$converteracademicRank.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}hocHam'],
        ),
      ),
      academicDegree: Teacher.$converteracademicDegree.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}hocVi'],
        ),
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
      dateOfBirth: Teacher.$converterdateOfBirth.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ngaySinh'],
        ),
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
  Teacher createAlias(String alias) {
    return Teacher(attachedDatabase, alias);
  }

  static TypeConverter<enums.Gender, String> $convertergender =
      const enums.GenderConverter();
  static TypeConverter<enums.Gender?, String?> $convertergendern =
      NullAwareTypeConverter.wrap($convertergender);
  static TypeConverter<enums.AcademicRank?, String?> $converteracademicRank =
      const enums.AcademicRankConverter();
  static TypeConverter<enums.AcademicDegree?, String?>
  $converteracademicDegree = const enums.AcademicDegreeConverter();
  static TypeConverter<DateTime?, String?> $converterdateOfBirth =
      const enums.YmdDateConverter();
  @override
  bool get dontWriteConstraints => true;
}

class TeacherData extends DataClass implements Insertable<TeacherData> {
  final int id;
  final String? managementId;
  final String name;
  final String? department;
  final bool isOutsider;
  final enums.Gender? gender;
  final enums.AcademicRank? academicRank;
  final enums.AcademicDegree? academicDegree;
  final String? phone;
  final String? personalEmail;
  final String? citizenId;
  final DateTime? dateOfBirth;
  final String? bankAccount;
  final String? bankName;
  final String? taxCode;
  final String? note;
  final int? academicGroupId;
  const TeacherData({
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
      map['gioiTinh'] = Variable<String>(
        Teacher.$convertergendern.toSql(gender),
      );
    }
    if (!nullToAbsent || academicRank != null) {
      map['hocHam'] = Variable<String>(
        Teacher.$converteracademicRank.toSql(academicRank),
      );
    }
    if (!nullToAbsent || academicDegree != null) {
      map['hocVi'] = Variable<String>(
        Teacher.$converteracademicDegree.toSql(academicDegree),
      );
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
      map['ngaySinh'] = Variable<String>(
        Teacher.$converterdateOfBirth.toSql(dateOfBirth),
      );
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

  TeacherCompanion toCompanion(bool nullToAbsent) {
    return TeacherCompanion(
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

  factory TeacherData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeacherData(
      id: serializer.fromJson<int>(json['id']),
      managementId: serializer.fromJson<String?>(json['maCanBo']),
      name: serializer.fromJson<String>(json['hoTen']),
      department: serializer.fromJson<String?>(json['donVi']),
      isOutsider: serializer.fromJson<bool>(json['ngoaiTruong']),
      gender: serializer.fromJson<enums.Gender?>(json['gioiTinh']),
      academicRank: serializer.fromJson<enums.AcademicRank?>(json['hocHam']),
      academicDegree: serializer.fromJson<enums.AcademicDegree?>(json['hocVi']),
      phone: serializer.fromJson<String?>(json['sdt']),
      personalEmail: serializer.fromJson<String?>(json['email']),
      citizenId: serializer.fromJson<String?>(json['cccd']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['ngaySinh']),
      bankAccount: serializer.fromJson<String?>(json['stk']),
      bankName: serializer.fromJson<String?>(json['nganHang']),
      taxCode: serializer.fromJson<String?>(json['mst']),
      note: serializer.fromJson<String?>(json['note']),
      academicGroupId: serializer.fromJson<int?>(json['ncm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'maCanBo': serializer.toJson<String?>(managementId),
      'hoTen': serializer.toJson<String>(name),
      'donVi': serializer.toJson<String?>(department),
      'ngoaiTruong': serializer.toJson<bool>(isOutsider),
      'gioiTinh': serializer.toJson<enums.Gender?>(gender),
      'hocHam': serializer.toJson<enums.AcademicRank?>(academicRank),
      'hocVi': serializer.toJson<enums.AcademicDegree?>(academicDegree),
      'sdt': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(personalEmail),
      'cccd': serializer.toJson<String?>(citizenId),
      'ngaySinh': serializer.toJson<DateTime?>(dateOfBirth),
      'stk': serializer.toJson<String?>(bankAccount),
      'nganHang': serializer.toJson<String?>(bankName),
      'mst': serializer.toJson<String?>(taxCode),
      'note': serializer.toJson<String?>(note),
      'ncm': serializer.toJson<int?>(academicGroupId),
    };
  }

  TeacherData copyWith({
    int? id,
    Value<String?> managementId = const Value.absent(),
    String? name,
    Value<String?> department = const Value.absent(),
    bool? isOutsider,
    Value<enums.Gender?> gender = const Value.absent(),
    Value<enums.AcademicRank?> academicRank = const Value.absent(),
    Value<enums.AcademicDegree?> academicDegree = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> personalEmail = const Value.absent(),
    Value<String?> citizenId = const Value.absent(),
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<String?> bankAccount = const Value.absent(),
    Value<String?> bankName = const Value.absent(),
    Value<String?> taxCode = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<int?> academicGroupId = const Value.absent(),
  }) => TeacherData(
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
  TeacherData copyWithCompanion(TeacherCompanion data) {
    return TeacherData(
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
    return (StringBuffer('TeacherData(')
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
      (other is TeacherData &&
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

class TeacherCompanion extends UpdateCompanion<TeacherData> {
  final Value<int> id;
  final Value<String?> managementId;
  final Value<String> name;
  final Value<String?> department;
  final Value<bool> isOutsider;
  final Value<enums.Gender?> gender;
  final Value<enums.AcademicRank?> academicRank;
  final Value<enums.AcademicDegree?> academicDegree;
  final Value<String?> phone;
  final Value<String?> personalEmail;
  final Value<String?> citizenId;
  final Value<DateTime?> dateOfBirth;
  final Value<String?> bankAccount;
  final Value<String?> bankName;
  final Value<String?> taxCode;
  final Value<String?> note;
  final Value<int?> academicGroupId;
  const TeacherCompanion({
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
  TeacherCompanion.insert({
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
  static Insertable<TeacherData> custom({
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

  TeacherCompanion copyWith({
    Value<int>? id,
    Value<String?>? managementId,
    Value<String>? name,
    Value<String?>? department,
    Value<bool>? isOutsider,
    Value<enums.Gender?>? gender,
    Value<enums.AcademicRank?>? academicRank,
    Value<enums.AcademicDegree?>? academicDegree,
    Value<String?>? phone,
    Value<String?>? personalEmail,
    Value<String?>? citizenId,
    Value<DateTime?>? dateOfBirth,
    Value<String?>? bankAccount,
    Value<String?>? bankName,
    Value<String?>? taxCode,
    Value<String?>? note,
    Value<int?>? academicGroupId,
  }) {
    return TeacherCompanion(
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
      map['gioiTinh'] = Variable<String>(
        Teacher.$convertergendern.toSql(gender.value),
      );
    }
    if (academicRank.present) {
      map['hocHam'] = Variable<String>(
        Teacher.$converteracademicRank.toSql(academicRank.value),
      );
    }
    if (academicDegree.present) {
      map['hocVi'] = Variable<String>(
        Teacher.$converteracademicDegree.toSql(academicDegree.value),
      );
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
      map['ngaySinh'] = Variable<String>(
        Teacher.$converterdateOfBirth.toSql(dateOfBirth.value),
      );
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
    return (StringBuffer('TeacherCompanion(')
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
  late final GeneratedColumnWithTypeConverter<DateTime?, String> dateOfBirth =
      GeneratedColumn<String>(
        'ngaySinh',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      ).withConverter<DateTime?>(Student.$converterdateOfBirth);
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
  late final GeneratedColumnWithTypeConverter<DateTime?, String>
  bachelorGraduationDate = GeneratedColumn<String>(
    'ngayTotNghiepDaiHoc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<DateTime?>(Student.$converterbachelorGraduationDate);
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
      dateOfBirth: Student.$converterdateOfBirth.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ngaySinh'],
        ),
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
      bachelorGraduationDate: Student.$converterbachelorGraduationDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ngayTotNghiepDaiHoc'],
        ),
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

  static TypeConverter<DateTime?, String?> $converterdateOfBirth =
      const enums.YmdDateConverter();
  static TypeConverter<enums.Gender, String> $convertergender =
      const enums.GenderConverter();
  static TypeConverter<enums.Gender?, String?> $convertergendern =
      NullAwareTypeConverter.wrap($convertergender);
  static TypeConverter<DateTime?, String?> $converterbachelorGraduationDate =
      const enums.YmdDateConverter();
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
    'FOREIGN KEY(nienKhoa)REFERENCES NienKhoa(nienKhoa)ON UPDATE CASCADE',
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
      map['ngaySinh'] = Variable<String>(
        Student.$converterdateOfBirth.toSql(dateOfBirth),
      );
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
      map['ngayTotNghiepDaiHoc'] = Variable<String>(
        Student.$converterbachelorGraduationDate.toSql(bachelorGraduationDate),
      );
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
      map['ngaySinh'] = Variable<String>(
        Student.$converterdateOfBirth.toSql(dateOfBirth.value),
      );
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
      map['ngayTotNghiepDaiHoc'] = Variable<String>(
        Student.$converterbachelorGraduationDate.toSql(
          bachelorGraduationDate.value,
        ),
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

class Hocky extends Table with TableInfo<Hocky, SemesterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Hocky(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _semesterMeta = const VerificationMeta(
    'semester',
  );
  late final GeneratedColumn<String> semester = GeneratedColumn<String>(
    'hocKy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumnWithTypeConverter<DateTime, String>
  registrationOpenDate = GeneratedColumn<String>(
    'moDangKy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<DateTime>(Hocky.$converterregistrationOpenDate);
  late final GeneratedColumnWithTypeConverter<DateTime, String>
  registrationCloseDate = GeneratedColumn<String>(
    'dongDangKy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<DateTime>(Hocky.$converterregistrationCloseDate);
  late final GeneratedColumnWithTypeConverter<DateTime, String> studyStartDate =
      GeneratedColumn<String>(
        'batDauHoc',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<DateTime>(Hocky.$converterstudyStartDate);
  late final GeneratedColumnWithTypeConverter<DateTime, String> studyEndDate =
      GeneratedColumn<String>(
        'ketThucHoc',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<DateTime>(Hocky.$converterstudyEndDate);
  late final GeneratedColumnWithTypeConverter<DateTime, String>
  gradeSubmissionDeadline = GeneratedColumn<String>(
    'hanNhapDiem',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<DateTime>(Hocky.$convertergradeSubmissionDeadline);
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
  VerificationContext validateIntegrity(
    Insertable<SemesterData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('hocKy')) {
      context.handle(
        _semesterMeta,
        semester.isAcceptableOrUnknown(data['hocKy']!, _semesterMeta),
      );
    } else if (isInserting) {
      context.missing(_semesterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {semester};
  @override
  SemesterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SemesterData(
      semester: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hocKy'],
      )!,
      registrationOpenDate: Hocky.$converterregistrationOpenDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}moDangKy'],
        )!,
      ),
      registrationCloseDate: Hocky.$converterregistrationCloseDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}dongDangKy'],
        )!,
      ),
      studyStartDate: Hocky.$converterstudyStartDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}batDauHoc'],
        )!,
      ),
      studyEndDate: Hocky.$converterstudyEndDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ketThucHoc'],
        )!,
      ),
      gradeSubmissionDeadline: Hocky.$convertergradeSubmissionDeadline.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}hanNhapDiem'],
        )!,
      ),
    );
  }

  @override
  Hocky createAlias(String alias) {
    return Hocky(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converterregistrationOpenDate =
      const enums.SureYmdDateConverter();
  static TypeConverter<DateTime, String> $converterregistrationCloseDate =
      const enums.SureYmdDateConverter();
  static TypeConverter<DateTime, String> $converterstudyStartDate =
      const enums.SureYmdDateConverter();
  static TypeConverter<DateTime, String> $converterstudyEndDate =
      const enums.SureYmdDateConverter();
  static TypeConverter<DateTime, String> $convertergradeSubmissionDeadline =
      const enums.SureYmdDateConverter();
  @override
  bool get dontWriteConstraints => true;
}

class SemesterData extends DataClass implements Insertable<SemesterData> {
  final String semester;
  final DateTime registrationOpenDate;
  final DateTime registrationCloseDate;
  final DateTime studyStartDate;
  final DateTime studyEndDate;
  final DateTime gradeSubmissionDeadline;
  const SemesterData({
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
    {
      map['moDangKy'] = Variable<String>(
        Hocky.$converterregistrationOpenDate.toSql(registrationOpenDate),
      );
    }
    {
      map['dongDangKy'] = Variable<String>(
        Hocky.$converterregistrationCloseDate.toSql(registrationCloseDate),
      );
    }
    {
      map['batDauHoc'] = Variable<String>(
        Hocky.$converterstudyStartDate.toSql(studyStartDate),
      );
    }
    {
      map['ketThucHoc'] = Variable<String>(
        Hocky.$converterstudyEndDate.toSql(studyEndDate),
      );
    }
    {
      map['hanNhapDiem'] = Variable<String>(
        Hocky.$convertergradeSubmissionDeadline.toSql(gradeSubmissionDeadline),
      );
    }
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

  factory SemesterData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SemesterData(
      semester: serializer.fromJson<String>(json['hocKy']),
      registrationOpenDate: serializer.fromJson<DateTime>(json['moDangKy']),
      registrationCloseDate: serializer.fromJson<DateTime>(json['dongDangKy']),
      studyStartDate: serializer.fromJson<DateTime>(json['batDauHoc']),
      studyEndDate: serializer.fromJson<DateTime>(json['ketThucHoc']),
      gradeSubmissionDeadline: serializer.fromJson<DateTime>(
        json['hanNhapDiem'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'hocKy': serializer.toJson<String>(semester),
      'moDangKy': serializer.toJson<DateTime>(registrationOpenDate),
      'dongDangKy': serializer.toJson<DateTime>(registrationCloseDate),
      'batDauHoc': serializer.toJson<DateTime>(studyStartDate),
      'ketThucHoc': serializer.toJson<DateTime>(studyEndDate),
      'hanNhapDiem': serializer.toJson<DateTime>(gradeSubmissionDeadline),
    };
  }

  SemesterData copyWith({
    String? semester,
    DateTime? registrationOpenDate,
    DateTime? registrationCloseDate,
    DateTime? studyStartDate,
    DateTime? studyEndDate,
    DateTime? gradeSubmissionDeadline,
  }) => SemesterData(
    semester: semester ?? this.semester,
    registrationOpenDate: registrationOpenDate ?? this.registrationOpenDate,
    registrationCloseDate: registrationCloseDate ?? this.registrationCloseDate,
    studyStartDate: studyStartDate ?? this.studyStartDate,
    studyEndDate: studyEndDate ?? this.studyEndDate,
    gradeSubmissionDeadline:
        gradeSubmissionDeadline ?? this.gradeSubmissionDeadline,
  );
  SemesterData copyWithCompanion(HockyCompanion data) {
    return SemesterData(
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
    return (StringBuffer('SemesterData(')
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
      (other is SemesterData &&
          other.semester == this.semester &&
          other.registrationOpenDate == this.registrationOpenDate &&
          other.registrationCloseDate == this.registrationCloseDate &&
          other.studyStartDate == this.studyStartDate &&
          other.studyEndDate == this.studyEndDate &&
          other.gradeSubmissionDeadline == this.gradeSubmissionDeadline);
}

class HockyCompanion extends UpdateCompanion<SemesterData> {
  final Value<String> semester;
  final Value<DateTime> registrationOpenDate;
  final Value<DateTime> registrationCloseDate;
  final Value<DateTime> studyStartDate;
  final Value<DateTime> studyEndDate;
  final Value<DateTime> gradeSubmissionDeadline;
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
    required DateTime registrationOpenDate,
    required DateTime registrationCloseDate,
    required DateTime studyStartDate,
    required DateTime studyEndDate,
    required DateTime gradeSubmissionDeadline,
    this.rowid = const Value.absent(),
  }) : semester = Value(semester),
       registrationOpenDate = Value(registrationOpenDate),
       registrationCloseDate = Value(registrationCloseDate),
       studyStartDate = Value(studyStartDate),
       studyEndDate = Value(studyEndDate),
       gradeSubmissionDeadline = Value(gradeSubmissionDeadline);
  static Insertable<SemesterData> custom({
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
    Value<DateTime>? registrationOpenDate,
    Value<DateTime>? registrationCloseDate,
    Value<DateTime>? studyStartDate,
    Value<DateTime>? studyEndDate,
    Value<DateTime>? gradeSubmissionDeadline,
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
      map['moDangKy'] = Variable<String>(
        Hocky.$converterregistrationOpenDate.toSql(registrationOpenDate.value),
      );
    }
    if (registrationCloseDate.present) {
      map['dongDangKy'] = Variable<String>(
        Hocky.$converterregistrationCloseDate.toSql(
          registrationCloseDate.value,
        ),
      );
    }
    if (studyStartDate.present) {
      map['batDauHoc'] = Variable<String>(
        Hocky.$converterstudyStartDate.toSql(studyStartDate.value),
      );
    }
    if (studyEndDate.present) {
      map['ketThucHoc'] = Variable<String>(
        Hocky.$converterstudyEndDate.toSql(studyEndDate.value),
      );
    }
    if (gradeSubmissionDeadline.present) {
      map['hanNhapDiem'] = Variable<String>(
        Hocky.$convertergradeSubmissionDeadline.toSql(
          gradeSubmissionDeadline.value,
        ),
      );
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

class Detaithacsi extends Table with TableInfo<Detaithacsi, ThesisData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Detaithacsi(this.attachedDatabase, [this._alias]);
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
    'idGiangVien',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _vietnameseTitleMeta = const VerificationMeta(
    'vietnameseTitle',
  );
  late final GeneratedColumn<String> vietnameseTitle = GeneratedColumn<String>(
    'tenTiengViet',
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
    'tenTiengAnh',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'ghiChu',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT ()',
    defaultValue: const CustomExpression(''),
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'idHocVien',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumnWithTypeConverter<DateTime?, String> assignedDate =
      GeneratedColumn<String>(
        'ngayGiao',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      ).withConverter<DateTime?>(Detaithacsi.$converterassignedDate);
  static const VerificationMeta _assignedDecisionNumberMeta =
      const VerificationMeta('assignedDecisionNumber');
  late final GeneratedColumn<String> assignedDecisionNumber =
      GeneratedColumn<String>(
        'soQdGiao',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumnWithTypeConverter<DateTime?, String>
  defenseDeadline = GeneratedColumn<String>(
    'hanBaoVe',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<DateTime?>(Detaithacsi.$converterdefenseDeadline);
  static const VerificationMeta _defenseDecisionNumberMeta =
      const VerificationMeta('defenseDecisionNumber');
  late final GeneratedColumn<String> defenseDecisionNumber =
      GeneratedColumn<String>(
        'soQdBaoVe',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumnWithTypeConverter<DateTime?, String> defenseDate =
      GeneratedColumn<String>(
        'ngayBaoVe',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      ).withConverter<DateTime?>(Detaithacsi.$converterdefenseDate);
  static const VerificationMeta _presidentIdMeta = const VerificationMeta(
    'presidentId',
  );
  late final GeneratedColumn<int> presidentId = GeneratedColumn<int>(
    'idChuTich',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _firstReviewerIdMeta = const VerificationMeta(
    'firstReviewerId',
  );
  late final GeneratedColumn<int> firstReviewerId = GeneratedColumn<int>(
    'idPhanBien1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _secondReviewerIdMeta = const VerificationMeta(
    'secondReviewerId',
  );
  late final GeneratedColumn<int> secondReviewerId = GeneratedColumn<int>(
    'idPhanBien2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _secretaryIdMeta = const VerificationMeta(
    'secretaryId',
  );
  late final GeneratedColumn<int> secretaryId = GeneratedColumn<int>(
    'idThuKy',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  late final GeneratedColumn<int> memberId = GeneratedColumn<int>(
    'idUyVien',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _isRegisteredForDefenseMeta =
      const VerificationMeta('isRegisteredForDefense');
  late final GeneratedColumn<int> isRegisteredForDefense = GeneratedColumn<int>(
    'dangKyBaoVe',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _isProfileSubmittedMeta =
      const VerificationMeta('isProfileSubmitted');
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
  VerificationContext validateIntegrity(
    Insertable<ThesisData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('idGiangVien')) {
      context.handle(
        _supervisorIdMeta,
        supervisorId.isAcceptableOrUnknown(
          data['idGiangVien']!,
          _supervisorIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supervisorIdMeta);
    }
    if (data.containsKey('tenTiengViet')) {
      context.handle(
        _vietnameseTitleMeta,
        vietnameseTitle.isAcceptableOrUnknown(
          data['tenTiengViet']!,
          _vietnameseTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vietnameseTitleMeta);
    }
    if (data.containsKey('tenTiengAnh')) {
      context.handle(
        _englishTitleMeta,
        englishTitle.isAcceptableOrUnknown(
          data['tenTiengAnh']!,
          _englishTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishTitleMeta);
    }
    if (data.containsKey('ghiChu')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['ghiChu']!, _noteMeta),
      );
    }
    if (data.containsKey('idHocVien')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['idHocVien']!, _studentIdMeta),
      );
    }
    if (data.containsKey('soQdGiao')) {
      context.handle(
        _assignedDecisionNumberMeta,
        assignedDecisionNumber.isAcceptableOrUnknown(
          data['soQdGiao']!,
          _assignedDecisionNumberMeta,
        ),
      );
    }
    if (data.containsKey('soQdBaoVe')) {
      context.handle(
        _defenseDecisionNumberMeta,
        defenseDecisionNumber.isAcceptableOrUnknown(
          data['soQdBaoVe']!,
          _defenseDecisionNumberMeta,
        ),
      );
    }
    if (data.containsKey('idChuTich')) {
      context.handle(
        _presidentIdMeta,
        presidentId.isAcceptableOrUnknown(data['idChuTich']!, _presidentIdMeta),
      );
    }
    if (data.containsKey('idPhanBien1')) {
      context.handle(
        _firstReviewerIdMeta,
        firstReviewerId.isAcceptableOrUnknown(
          data['idPhanBien1']!,
          _firstReviewerIdMeta,
        ),
      );
    }
    if (data.containsKey('idPhanBien2')) {
      context.handle(
        _secondReviewerIdMeta,
        secondReviewerId.isAcceptableOrUnknown(
          data['idPhanBien2']!,
          _secondReviewerIdMeta,
        ),
      );
    }
    if (data.containsKey('idThuKy')) {
      context.handle(
        _secretaryIdMeta,
        secretaryId.isAcceptableOrUnknown(data['idThuKy']!, _secretaryIdMeta),
      );
    }
    if (data.containsKey('idUyVien')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['idUyVien']!, _memberIdMeta),
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
    if (data.containsKey('dangKyBaoVe')) {
      context.handle(
        _isRegisteredForDefenseMeta,
        isRegisteredForDefense.isAcceptableOrUnknown(
          data['dangKyBaoVe']!,
          _isRegisteredForDefenseMeta,
        ),
      );
    }
    if (data.containsKey('nopHoSo')) {
      context.handle(
        _isProfileSubmittedMeta,
        isProfileSubmitted.isAcceptableOrUnknown(
          data['nopHoSo']!,
          _isProfileSubmittedMeta,
        ),
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
      assignedDate: Detaithacsi.$converterassignedDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ngayGiao'],
        ),
      ),
      assignedDecisionNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}soQdGiao'],
      ),
      defenseDeadline: Detaithacsi.$converterdefenseDeadline.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}hanBaoVe'],
        ),
      ),
      defenseDecisionNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}soQdBaoVe'],
      ),
      defenseDate: Detaithacsi.$converterdefenseDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ngayBaoVe'],
        ),
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

  static TypeConverter<DateTime?, String?> $converterassignedDate =
      const enums.YmdDateConverter();
  static TypeConverter<DateTime?, String?> $converterdefenseDeadline =
      const enums.YmdDateConverter();
  static TypeConverter<DateTime?, String?> $converterdefenseDate =
      const enums.YmdDateConverter();
  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(idChuTich)REFERENCES teacher(id)',
    'FOREIGN KEY(idGiangVien)REFERENCES teacher(id)',
    'FOREIGN KEY(idPhanBien1)REFERENCES teacher(id)',
    'FOREIGN KEY(idPhanBien2)REFERENCES teacher(id)',
    'FOREIGN KEY(idThuKy)REFERENCES teacher(id)',
    'FOREIGN KEY(idUyVien)REFERENCES teacher(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ThesisData extends DataClass implements Insertable<ThesisData> {
  final int id;
  final int supervisorId;
  final String vietnameseTitle;
  final String englishTitle;
  final String note;
  final int? studentId;
  final DateTime? assignedDate;
  final String? assignedDecisionNumber;
  final DateTime? defenseDeadline;
  final String? defenseDecisionNumber;
  final DateTime? defenseDate;
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
  const ThesisData({
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
      map['ngayGiao'] = Variable<String>(
        Detaithacsi.$converterassignedDate.toSql(assignedDate),
      );
    }
    if (!nullToAbsent || assignedDecisionNumber != null) {
      map['soQdGiao'] = Variable<String>(assignedDecisionNumber);
    }
    if (!nullToAbsent || defenseDeadline != null) {
      map['hanBaoVe'] = Variable<String>(
        Detaithacsi.$converterdefenseDeadline.toSql(defenseDeadline),
      );
    }
    if (!nullToAbsent || defenseDecisionNumber != null) {
      map['soQdBaoVe'] = Variable<String>(defenseDecisionNumber);
    }
    if (!nullToAbsent || defenseDate != null) {
      map['ngayBaoVe'] = Variable<String>(
        Detaithacsi.$converterdefenseDate.toSql(defenseDate),
      );
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

  factory ThesisData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThesisData(
      id: serializer.fromJson<int>(json['id']),
      supervisorId: serializer.fromJson<int>(json['idGiangVien']),
      vietnameseTitle: serializer.fromJson<String>(json['tenTiengViet']),
      englishTitle: serializer.fromJson<String>(json['tenTiengAnh']),
      note: serializer.fromJson<String>(json['ghiChu']),
      studentId: serializer.fromJson<int?>(json['idHocVien']),
      assignedDate: serializer.fromJson<DateTime?>(json['ngayGiao']),
      assignedDecisionNumber: serializer.fromJson<String?>(json['soQdGiao']),
      defenseDeadline: serializer.fromJson<DateTime?>(json['hanBaoVe']),
      defenseDecisionNumber: serializer.fromJson<String?>(json['soQdBaoVe']),
      defenseDate: serializer.fromJson<DateTime?>(json['ngayBaoVe']),
      presidentId: serializer.fromJson<int?>(json['idChuTich']),
      firstReviewerId: serializer.fromJson<int?>(json['idPhanBien1']),
      secondReviewerId: serializer.fromJson<int?>(json['idPhanBien2']),
      secretaryId: serializer.fromJson<int?>(json['idThuKy']),
      memberId: serializer.fromJson<int?>(json['idUyVien']),
      flagTracking: serializer.fromJson<bool>(json['flag_tracking']),
      flagPaid: serializer.fromJson<bool>(json['flag_paid']),
      flagIgnore: serializer.fromJson<bool>(json['flag_ignore']),
      group: serializer.fromJson<String?>(json['group']),
      year: serializer.fromJson<String?>(json['nam']),
      isRegisteredForDefense: serializer.fromJson<int>(json['dangKyBaoVe']),
      isProfileSubmitted: serializer.fromJson<int>(json['nopHoSo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idGiangVien': serializer.toJson<int>(supervisorId),
      'tenTiengViet': serializer.toJson<String>(vietnameseTitle),
      'tenTiengAnh': serializer.toJson<String>(englishTitle),
      'ghiChu': serializer.toJson<String>(note),
      'idHocVien': serializer.toJson<int?>(studentId),
      'ngayGiao': serializer.toJson<DateTime?>(assignedDate),
      'soQdGiao': serializer.toJson<String?>(assignedDecisionNumber),
      'hanBaoVe': serializer.toJson<DateTime?>(defenseDeadline),
      'soQdBaoVe': serializer.toJson<String?>(defenseDecisionNumber),
      'ngayBaoVe': serializer.toJson<DateTime?>(defenseDate),
      'idChuTich': serializer.toJson<int?>(presidentId),
      'idPhanBien1': serializer.toJson<int?>(firstReviewerId),
      'idPhanBien2': serializer.toJson<int?>(secondReviewerId),
      'idThuKy': serializer.toJson<int?>(secretaryId),
      'idUyVien': serializer.toJson<int?>(memberId),
      'flag_tracking': serializer.toJson<bool>(flagTracking),
      'flag_paid': serializer.toJson<bool>(flagPaid),
      'flag_ignore': serializer.toJson<bool>(flagIgnore),
      'group': serializer.toJson<String?>(group),
      'nam': serializer.toJson<String?>(year),
      'dangKyBaoVe': serializer.toJson<int>(isRegisteredForDefense),
      'nopHoSo': serializer.toJson<int>(isProfileSubmitted),
    };
  }

  ThesisData copyWith({
    int? id,
    int? supervisorId,
    String? vietnameseTitle,
    String? englishTitle,
    String? note,
    Value<int?> studentId = const Value.absent(),
    Value<DateTime?> assignedDate = const Value.absent(),
    Value<String?> assignedDecisionNumber = const Value.absent(),
    Value<DateTime?> defenseDeadline = const Value.absent(),
    Value<String?> defenseDecisionNumber = const Value.absent(),
    Value<DateTime?> defenseDate = const Value.absent(),
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
  }) => ThesisData(
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
  ThesisData copyWithCompanion(DetaithacsiCompanion data) {
    return ThesisData(
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
    return (StringBuffer('ThesisData(')
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
      (other is ThesisData &&
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

class DetaithacsiCompanion extends UpdateCompanion<ThesisData> {
  final Value<int> id;
  final Value<int> supervisorId;
  final Value<String> vietnameseTitle;
  final Value<String> englishTitle;
  final Value<String> note;
  final Value<int?> studentId;
  final Value<DateTime?> assignedDate;
  final Value<String?> assignedDecisionNumber;
  final Value<DateTime?> defenseDeadline;
  final Value<String?> defenseDecisionNumber;
  final Value<DateTime?> defenseDate;
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
  static Insertable<ThesisData> custom({
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
    Value<DateTime?>? assignedDate,
    Value<String?>? assignedDecisionNumber,
    Value<DateTime?>? defenseDeadline,
    Value<String?>? defenseDecisionNumber,
    Value<DateTime?>? defenseDate,
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
      map['ngayGiao'] = Variable<String>(
        Detaithacsi.$converterassignedDate.toSql(assignedDate.value),
      );
    }
    if (assignedDecisionNumber.present) {
      map['soQdGiao'] = Variable<String>(assignedDecisionNumber.value);
    }
    if (defenseDeadline.present) {
      map['hanBaoVe'] = Variable<String>(
        Detaithacsi.$converterdefenseDeadline.toSql(defenseDeadline.value),
      );
    }
    if (defenseDecisionNumber.present) {
      map['soQdBaoVe'] = Variable<String>(defenseDecisionNumber.value);
    }
    if (defenseDate.present) {
      map['ngayBaoVe'] = Variable<String>(
        Detaithacsi.$converterdefenseDate.toSql(defenseDate.value),
      );
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
  static const VerificationMeta _majorSpecializationMeta =
      const VerificationMeta('majorSpecialization');
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
    if (data.containsKey('major_specialization')) {
      context.handle(
        _majorSpecializationMeta,
        majorSpecialization.isAcceptableOrUnknown(
          data['major_specialization']!,
          _majorSpecializationMeta,
        ),
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

  static TypeConverter<enums.Gender, String> $convertergender =
      const enums.GenderConverter();
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
      majorSpecialization: serializer.fromJson<String>(
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
      'major_specialization': serializer.toJson<String>(majorSpecialization),
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
  final Value<enums.Gender> gender;
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
    Value<enums.Gender>? gender,
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
    with TableInfo<DangKyGiangDay, TeachingRegistrationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DangKyGiangDay(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'idGiangVien',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  @override
  List<GeneratedColumn> get $columns => [teacherId, courseId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'DangKyGiangDay';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeachingRegistrationData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idGiangVien')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['idGiangVien']!, _teacherIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('maHocPhan')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['maHocPhan']!, _courseIdMeta),
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
    'FOREIGN KEY(idGiangVien)REFERENCES teacher(id)',
    'FOREIGN KEY(maHocPhan)REFERENCES course(id)',
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

  factory TeachingRegistrationData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeachingRegistrationData(
      teacherId: serializer.fromJson<int>(json['idGiangVien']),
      courseId: serializer.fromJson<String>(json['maHocPhan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idGiangVien': serializer.toJson<int>(teacherId),
      'maHocPhan': serializer.toJson<String>(courseId),
    };
  }

  TeachingRegistrationData copyWith({int? teacherId, String? courseId}) =>
      TeachingRegistrationData(
        teacherId: teacherId ?? this.teacherId,
        courseId: courseId ?? this.courseId,
      );
  TeachingRegistrationData copyWithCompanion(DangKyGiangDayCompanion data) {
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

class DangKyGiangDayCompanion
    extends UpdateCompanion<TeachingRegistrationData> {
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
  static Insertable<TeachingRegistrationData> custom({
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

class LopTinChi extends Table with TableInfo<LopTinChi, CourseClassData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LopTinChi(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  late final GeneratedColumn<String> dayOfWeek = GeneratedColumn<String>(
    'ngayHoc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
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
  ).withConverter<enums.CourseClassStatus?>(LopTinChi.$converterstatusn);
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
    if (data.containsKey('ngayHoc')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['ngayHoc']!, _dayOfWeekMeta),
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
      status: LopTinChi.$converterstatusn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}trangThai'],
        ),
      ),
    );
  }

  @override
  LopTinChi createAlias(String alias) {
    return LopTinChi(attachedDatabase, alias);
  }

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
  final String? dayOfWeek;
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
      map['ngayHoc'] = Variable<String>(dayOfWeek);
    }
    if (!nullToAbsent || startPeriod != null) {
      map['tietBatDau'] = Variable<int>(startPeriod);
    }
    if (!nullToAbsent || endPeriod != null) {
      map['tietKetThuc'] = Variable<int>(endPeriod);
    }
    if (!nullToAbsent || status != null) {
      map['trangThai'] = Variable<int>(
        LopTinChi.$converterstatusn.toSql(status),
      );
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
      dayOfWeek: serializer.fromJson<String?>(json['ngayHoc']),
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
      'ngayHoc': serializer.toJson<String?>(dayOfWeek),
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
    Value<String?> dayOfWeek = const Value.absent(),
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
  CourseClassData copyWithCompanion(LopTinChiCompanion data) {
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

class LopTinChiCompanion extends UpdateCompanion<CourseClassData> {
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
  final Value<enums.CourseClassStatus?> status;
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
    Value<enums.CourseClassStatus?>? status,
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
      map['trangThai'] = Variable<int>(
        LopTinChi.$converterstatusn.toSql(status.value),
      );
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
  static const VerificationMeta _classIdMeta = const VerificationMeta(
    'classId',
  );
  late final GeneratedColumn<int> classId = GeneratedColumn<int>(
    'class_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES LopTinChi(id)',
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

class DangKyHoc extends Table
    with TableInfo<DangKyHoc, ClassCourseRegistrationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DangKyHoc(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _courseClassIdMeta = const VerificationMeta(
    'courseClassId',
  );
  late final GeneratedColumn<int> courseClassId = GeneratedColumn<int>(
    'idLopTinChi',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
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
  VerificationContext validateIntegrity(
    Insertable<ClassCourseRegistrationData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idLopTinChi')) {
      context.handle(
        _courseClassIdMeta,
        courseClassId.isAcceptableOrUnknown(
          data['idLopTinChi']!,
          _courseClassIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_courseClassIdMeta);
    }
    if (data.containsKey('idHocVien')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['idHocVien']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {courseClassId, studentId};
  @override
  ClassCourseRegistrationData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClassCourseRegistrationData(
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

class ClassCourseRegistrationData extends DataClass
    implements Insertable<ClassCourseRegistrationData> {
  final int courseClassId;
  final int studentId;
  const ClassCourseRegistrationData({
    required this.courseClassId,
    required this.studentId,
  });
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

  factory ClassCourseRegistrationData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClassCourseRegistrationData(
      courseClassId: serializer.fromJson<int>(json['idLopTinChi']),
      studentId: serializer.fromJson<int>(json['idHocVien']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idLopTinChi': serializer.toJson<int>(courseClassId),
      'idHocVien': serializer.toJson<int>(studentId),
    };
  }

  ClassCourseRegistrationData copyWith({int? courseClassId, int? studentId}) =>
      ClassCourseRegistrationData(
        courseClassId: courseClassId ?? this.courseClassId,
        studentId: studentId ?? this.studentId,
      );
  ClassCourseRegistrationData copyWithCompanion(DangKyHocCompanion data) {
    return ClassCourseRegistrationData(
      courseClassId: data.courseClassId.present
          ? data.courseClassId.value
          : this.courseClassId,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClassCourseRegistrationData(')
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
      (other is ClassCourseRegistrationData &&
          other.courseClassId == this.courseClassId &&
          other.studentId == this.studentId);
}

class DangKyHocCompanion extends UpdateCompanion<ClassCourseRegistrationData> {
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
  static Insertable<ClassCourseRegistrationData> custom({
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
  static const String $name = 'fts_DeTaiThacSi';
  @override
  VerificationContext validateIntegrity(
    Insertable<FtsDeTaiThacSiData> instance, {
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
  bool get dontWriteConstraints => true;
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final Preference preference = Preference(this);
  late final DocumentRole documentRole = DocumentRole(this);
  late final Document document = Document(this);
  late final NienKhoa nienKhoa = NienKhoa(this);
  late final Teacher teacher = Teacher(this);
  late final AdmissionCouncil admissionCouncil = AdmissionCouncil(this);
  late final Student student = Student(this);
  late final Hocky hocky = Hocky(this);
  late final Course course = Course(this);
  late final Detaithacsi detaithacsi = Detaithacsi(this);
  late final PhdCohort phdCohort = PhdCohort(this);
  late final PhdStudent phdStudent = PhdStudent(this);
  late final DangKyGiangDay dangKyGiangDay = DangKyGiangDay(this);
  late final LopTinChi lopTinChi = LopTinChi(this);
  late final TeachingAssignment teachingAssignment = TeachingAssignment(this);
  late final DangKyHoc dangKyHoc = DangKyHoc(this);
  late final FtsDeTaiThacSi ftsDeTaiThacSi = FtsDeTaiThacSi(this);
  Selectable<TeacherData> searchTeacher({String? searchText, bool? outsider}) {
    return customSelect(
      'SELECT * FROM teacher WHERE hoten LIKE \'%\' || ?1 || \'%\' OR email LIKE \'%\' || ?1 || \'%\' OR macanbo LIKE \'%\' || ?1 || \'%\' OR sdt LIKE \'%\' || ?1 || \'%\' OR email LIKE \'%\' || ?1 || \'%\' OR cccd LIKE \'%\' || ?1 || \'%\' OR stk LIKE \'%\' || ?1 || \'%\' OR mst LIKE \'%\' || ?1 || \'%\' AND(?2 IS NULL OR ngoaitruong = ?2)',
      variables: [Variable<String>(searchText), Variable<bool>(outsider)],
      readsFrom: {teacher},
    ).asyncMap(teacher.mapFromRow);
  }

  Selectable<int> getTrackingThesisIds() {
    return customSelect(
      'SELECT id FROM detaithacsi WHERE flag_tracking = 1 ORDER BY soQdBaoVe',
      variables: [],
      readsFrom: {detaithacsi},
    ).map((QueryRow row) => row.read<int>('id'));
  }

  Future<int> trackThesis({required int thesisId}) {
    return customUpdate(
      'UPDATE detaithacsi SET flag_tracking = 1 WHERE id = ?1',
      variables: [Variable<int>(thesisId)],
      updates: {detaithacsi},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> untrackThesis({required int thesisId}) {
    return customUpdate(
      'UPDATE detaithacsi SET flag_tracking = 0 WHERE id = ?1',
      variables: [Variable<int>(thesisId)],
      updates: {detaithacsi},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<int?> getThesisPresidentId({required int thesisId}) {
    return customSelect(
      'SELECT idChuTich FROM detaithacsi WHERE id = ?1',
      variables: [Variable<int>(thesisId)],
      readsFrom: {detaithacsi},
    ).map((QueryRow row) => row.readNullable<int>('idChuTich'));
  }

  Selectable<int?> getThesis1stReviewerId({required int thesisId}) {
    return customSelect(
      'SELECT idPhanBien1 FROM detaithacsi WHERE id = ?1',
      variables: [Variable<int>(thesisId)],
      readsFrom: {detaithacsi},
    ).map((QueryRow row) => row.readNullable<int>('idPhanBien1'));
  }

  Selectable<int?> getThesis2ndReviewerId({required int thesisId}) {
    return customSelect(
      'SELECT idPhanBien2 FROM detaithacsi WHERE id = ?1',
      variables: [Variable<int>(thesisId)],
      readsFrom: {detaithacsi},
    ).map((QueryRow row) => row.readNullable<int>('idPhanBien2'));
  }

  Selectable<int?> getThesisSecretaryId({required int thesisId}) {
    return customSelect(
      'SELECT idThuKy FROM detaithacsi WHERE id = ?1',
      variables: [Variable<int>(thesisId)],
      readsFrom: {detaithacsi},
    ).map((QueryRow row) => row.readNullable<int>('idThuKy'));
  }

  Selectable<int?> getThesisMemberId({required int thesisId}) {
    return customSelect(
      'SELECT idUyVien FROM detaithacsi WHERE id = ?1',
      variables: [Variable<int>(thesisId)],
      readsFrom: {detaithacsi},
    ).map((QueryRow row) => row.readNullable<int>('idUyVien'));
  }

  Future<int> setThesisPresidentId({int? teacherId, required int thesisId}) {
    return customUpdate(
      'UPDATE detaithacsi SET idChuTich = ?1 WHERE id = ?2',
      variables: [Variable<int>(teacherId), Variable<int>(thesisId)],
      updates: {detaithacsi},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setThesis1stReviewerId({int? teacherId, required int thesisId}) {
    return customUpdate(
      'UPDATE detaithacsi SET idPhanBien1 = ?1 WHERE id = ?2',
      variables: [Variable<int>(teacherId), Variable<int>(thesisId)],
      updates: {detaithacsi},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setThesis2ndReviewerId({int? teacherId, required int thesisId}) {
    return customUpdate(
      'UPDATE detaithacsi SET idPhanBien2 = ?1 WHERE id = ?2',
      variables: [Variable<int>(teacherId), Variable<int>(thesisId)],
      updates: {detaithacsi},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setThesisSecretaryId({int? teacherId, required int thesisId}) {
    return customUpdate(
      'UPDATE detaithacsi SET idThuKy = ?1 WHERE id = ?2',
      variables: [Variable<int>(teacherId), Variable<int>(thesisId)],
      updates: {detaithacsi},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setThesisMemberId({int? teacherId, required int thesisId}) {
    return customUpdate(
      'UPDATE detaithacsi SET idUyVien = ?1 WHERE id = ?2',
      variables: [Variable<int>(teacherId), Variable<int>(thesisId)],
      updates: {detaithacsi},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<String> getAllSemesters() {
    return customSelect(
      'SELECT DISTINCT hocKy FROM LopTinChi ORDER BY hocKy DESC',
      variables: [],
      readsFrom: {lopTinChi},
    ).map((QueryRow row) => row.read<String>('hocKy'));
  }

  Selectable<int> searchTheses({required String searchText}) {
    return customSelect(
      'SELECT id FROM detaithacsi WHERE id IN (SELECT id FROM fts_DeTaiThacSi WHERE fts_DeTaiThacSi MATCH ?1)',
      variables: [Variable<String>(searchText)],
      readsFrom: {detaithacsi, ftsDeTaiThacSi},
    ).map((QueryRow row) => row.read<int>('id'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    preference,
    documentRole,
    document,
    nienKhoa,
    teacher,
    admissionCouncil,
    student,
    hocky,
    course,
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
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'NienKhoa',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('student', kind: UpdateKind.update)],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

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
typedef $NienKhoaCreateCompanionBuilder =
    NienKhoaCompanion Function({
      required String cohort,
      Value<String> groupUrl,
      Value<int> rowid,
    });
typedef $NienKhoaUpdateCompanionBuilder =
    NienKhoaCompanion Function({
      Value<String> cohort,
      Value<String> groupUrl,
      Value<int> rowid,
    });

class $NienKhoaFilterComposer extends Composer<_$AppDatabase, NienKhoa> {
  $NienKhoaFilterComposer({
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

  ColumnFilters<String> get groupUrl => $composableBuilder(
    column: $table.groupUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $NienKhoaOrderingComposer extends Composer<_$AppDatabase, NienKhoa> {
  $NienKhoaOrderingComposer({
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

  ColumnOrderings<String> get groupUrl => $composableBuilder(
    column: $table.groupUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $NienKhoaAnnotationComposer extends Composer<_$AppDatabase, NienKhoa> {
  $NienKhoaAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cohort =>
      $composableBuilder(column: $table.cohort, builder: (column) => column);

  GeneratedColumn<String> get groupUrl =>
      $composableBuilder(column: $table.groupUrl, builder: (column) => column);
}

class $NienKhoaTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          NienKhoa,
          CohortData,
          $NienKhoaFilterComposer,
          $NienKhoaOrderingComposer,
          $NienKhoaAnnotationComposer,
          $NienKhoaCreateCompanionBuilder,
          $NienKhoaUpdateCompanionBuilder,
          (CohortData, BaseReferences<_$AppDatabase, NienKhoa, CohortData>),
          CohortData,
          PrefetchHooks Function()
        > {
  $NienKhoaTableManager(_$AppDatabase db, NienKhoa table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $NienKhoaFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $NienKhoaOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $NienKhoaAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> cohort = const Value.absent(),
                Value<String> groupUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NienKhoaCompanion(
                cohort: cohort,
                groupUrl: groupUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cohort,
                Value<String> groupUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NienKhoaCompanion.insert(
                cohort: cohort,
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

typedef $NienKhoaProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      NienKhoa,
      CohortData,
      $NienKhoaFilterComposer,
      $NienKhoaOrderingComposer,
      $NienKhoaAnnotationComposer,
      $NienKhoaCreateCompanionBuilder,
      $NienKhoaUpdateCompanionBuilder,
      (CohortData, BaseReferences<_$AppDatabase, NienKhoa, CohortData>),
      CohortData,
      PrefetchHooks Function()
    >;
typedef $TeacherCreateCompanionBuilder =
    TeacherCompanion Function({
      Value<int> id,
      Value<String?> managementId,
      required String name,
      Value<String?> department,
      Value<bool> isOutsider,
      Value<enums.Gender?> gender,
      Value<enums.AcademicRank?> academicRank,
      Value<enums.AcademicDegree?> academicDegree,
      Value<String?> phone,
      Value<String?> personalEmail,
      Value<String?> citizenId,
      Value<DateTime?> dateOfBirth,
      Value<String?> bankAccount,
      Value<String?> bankName,
      Value<String?> taxCode,
      Value<String?> note,
      Value<int?> academicGroupId,
    });
typedef $TeacherUpdateCompanionBuilder =
    TeacherCompanion Function({
      Value<int> id,
      Value<String?> managementId,
      Value<String> name,
      Value<String?> department,
      Value<bool> isOutsider,
      Value<enums.Gender?> gender,
      Value<enums.AcademicRank?> academicRank,
      Value<enums.AcademicDegree?> academicDegree,
      Value<String?> phone,
      Value<String?> personalEmail,
      Value<String?> citizenId,
      Value<DateTime?> dateOfBirth,
      Value<String?> bankAccount,
      Value<String?> bankName,
      Value<String?> taxCode,
      Value<String?> note,
      Value<int?> academicGroupId,
    });

final class $TeacherReferences
    extends BaseReferences<_$AppDatabase, Teacher, TeacherData> {
  $TeacherReferences(super.$_db, super.$_table, super.$_typedResult);

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

  ColumnFilters<String> get managementId => $composableBuilder(
    column: $table.managementId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOutsider => $composableBuilder(
    column: $table.isOutsider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<enums.Gender?, enums.Gender, String>
  get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
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

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String> get dateOfBirth =>
      $composableBuilder(
        column: $table.dateOfBirth,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get bankAccount => $composableBuilder(
    column: $table.bankAccount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxCode => $composableBuilder(
    column: $table.taxCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get academicGroupId => $composableBuilder(
    column: $table.academicGroupId,
    builder: (column) => ColumnFilters(column),
  );

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

  ColumnOrderings<String> get managementId => $composableBuilder(
    column: $table.managementId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
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

  ColumnOrderings<String> get academicRank => $composableBuilder(
    column: $table.academicRank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academicDegree => $composableBuilder(
    column: $table.academicDegree,
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

  ColumnOrderings<String> get citizenId => $composableBuilder(
    column: $table.citizenId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateOfBirth => $composableBuilder(
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

  ColumnOrderings<String> get taxCode => $composableBuilder(
    column: $table.taxCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get academicGroupId => $composableBuilder(
    column: $table.academicGroupId,
    builder: (column) => ColumnOrderings(column),
  );
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

  GeneratedColumn<String> get managementId => $composableBuilder(
    column: $table.managementId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isOutsider => $composableBuilder(
    column: $table.isOutsider,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<enums.Gender?, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

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

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get personalEmail => $composableBuilder(
    column: $table.personalEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get citizenId =>
      $composableBuilder(column: $table.citizenId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, String> get dateOfBirth =>
      $composableBuilder(
        column: $table.dateOfBirth,
        builder: (column) => column,
      );

  GeneratedColumn<String> get bankAccount => $composableBuilder(
    column: $table.bankAccount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get taxCode =>
      $composableBuilder(column: $table.taxCode, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get academicGroupId => $composableBuilder(
    column: $table.academicGroupId,
    builder: (column) => column,
  );

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
          PrefetchHooks Function({bool teachingAssignmentRefs})
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
                Value<String?> managementId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<bool> isOutsider = const Value.absent(),
                Value<enums.Gender?> gender = const Value.absent(),
                Value<enums.AcademicRank?> academicRank = const Value.absent(),
                Value<enums.AcademicDegree?> academicDegree =
                    const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> personalEmail = const Value.absent(),
                Value<String?> citizenId = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> bankAccount = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> taxCode = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> academicGroupId = const Value.absent(),
              }) => TeacherCompanion(
                id: id,
                managementId: managementId,
                name: name,
                department: department,
                isOutsider: isOutsider,
                gender: gender,
                academicRank: academicRank,
                academicDegree: academicDegree,
                phone: phone,
                personalEmail: personalEmail,
                citizenId: citizenId,
                dateOfBirth: dateOfBirth,
                bankAccount: bankAccount,
                bankName: bankName,
                taxCode: taxCode,
                note: note,
                academicGroupId: academicGroupId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> managementId = const Value.absent(),
                required String name,
                Value<String?> department = const Value.absent(),
                Value<bool> isOutsider = const Value.absent(),
                Value<enums.Gender?> gender = const Value.absent(),
                Value<enums.AcademicRank?> academicRank = const Value.absent(),
                Value<enums.AcademicDegree?> academicDegree =
                    const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> personalEmail = const Value.absent(),
                Value<String?> citizenId = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> bankAccount = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> taxCode = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> academicGroupId = const Value.absent(),
              }) => TeacherCompanion.insert(
                id: id,
                managementId: managementId,
                name: name,
                department: department,
                isOutsider: isOutsider,
                gender: gender,
                academicRank: academicRank,
                academicDegree: academicDegree,
                phone: phone,
                personalEmail: personalEmail,
                citizenId: citizenId,
                dateOfBirth: dateOfBirth,
                bankAccount: bankAccount,
                bankName: bankName,
                taxCode: taxCode,
                note: note,
                academicGroupId: academicGroupId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $TeacherReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({teachingAssignmentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (teachingAssignmentRefs) db.teachingAssignment,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
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
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.teacherId == item.id),
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
      PrefetchHooks Function({bool teachingAssignmentRefs})
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

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String> get dateOfBirth =>
      $composableBuilder(
        column: $table.dateOfBirth,
        builder: (column) => ColumnWithTypeConverterFilters(column),
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

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String>
  get bachelorGraduationDate => $composableBuilder(
    column: $table.bachelorGraduationDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  ColumnOrderings<String> get dateOfBirth => $composableBuilder(
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

  ColumnOrderings<String> get bachelorGraduationDate => $composableBuilder(
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

  GeneratedColumnWithTypeConverter<DateTime?, String> get dateOfBirth =>
      $composableBuilder(
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

  GeneratedColumnWithTypeConverter<DateTime?, String>
  get bachelorGraduationDate => $composableBuilder(
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
          (StudentData, BaseReferences<_$AppDatabase, Student, StudentData>),
          StudentData,
          PrefetchHooks Function()
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (StudentData, BaseReferences<_$AppDatabase, Student, StudentData>),
      StudentData,
      PrefetchHooks Function()
    >;
typedef $HockyCreateCompanionBuilder =
    HockyCompanion Function({
      required String semester,
      required DateTime registrationOpenDate,
      required DateTime registrationCloseDate,
      required DateTime studyStartDate,
      required DateTime studyEndDate,
      required DateTime gradeSubmissionDeadline,
      Value<int> rowid,
    });
typedef $HockyUpdateCompanionBuilder =
    HockyCompanion Function({
      Value<String> semester,
      Value<DateTime> registrationOpenDate,
      Value<DateTime> registrationCloseDate,
      Value<DateTime> studyStartDate,
      Value<DateTime> studyEndDate,
      Value<DateTime> gradeSubmissionDeadline,
      Value<int> rowid,
    });

class $HockyFilterComposer extends Composer<_$AppDatabase, Hocky> {
  $HockyFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get semester => $composableBuilder(
    column: $table.semester,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String>
  get registrationOpenDate => $composableBuilder(
    column: $table.registrationOpenDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String>
  get registrationCloseDate => $composableBuilder(
    column: $table.registrationCloseDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String>
  get studyStartDate => $composableBuilder(
    column: $table.studyStartDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get studyEndDate =>
      $composableBuilder(
        column: $table.studyEndDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String>
  get gradeSubmissionDeadline => $composableBuilder(
    column: $table.gradeSubmissionDeadline,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $HockyOrderingComposer extends Composer<_$AppDatabase, Hocky> {
  $HockyOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get semester => $composableBuilder(
    column: $table.semester,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registrationOpenDate => $composableBuilder(
    column: $table.registrationOpenDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registrationCloseDate => $composableBuilder(
    column: $table.registrationCloseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studyStartDate => $composableBuilder(
    column: $table.studyStartDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studyEndDate => $composableBuilder(
    column: $table.studyEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gradeSubmissionDeadline => $composableBuilder(
    column: $table.gradeSubmissionDeadline,
    builder: (column) => ColumnOrderings(column),
  );
}

class $HockyAnnotationComposer extends Composer<_$AppDatabase, Hocky> {
  $HockyAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get semester =>
      $composableBuilder(column: $table.semester, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, String> get registrationOpenDate =>
      $composableBuilder(
        column: $table.registrationOpenDate,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<DateTime, String>
  get registrationCloseDate => $composableBuilder(
    column: $table.registrationCloseDate,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime, String> get studyStartDate =>
      $composableBuilder(
        column: $table.studyStartDate,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<DateTime, String> get studyEndDate =>
      $composableBuilder(
        column: $table.studyEndDate,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<DateTime, String>
  get gradeSubmissionDeadline => $composableBuilder(
    column: $table.gradeSubmissionDeadline,
    builder: (column) => column,
  );
}

class $HockyTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Hocky,
          SemesterData,
          $HockyFilterComposer,
          $HockyOrderingComposer,
          $HockyAnnotationComposer,
          $HockyCreateCompanionBuilder,
          $HockyUpdateCompanionBuilder,
          (SemesterData, BaseReferences<_$AppDatabase, Hocky, SemesterData>),
          SemesterData,
          PrefetchHooks Function()
        > {
  $HockyTableManager(_$AppDatabase db, Hocky table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $HockyFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $HockyOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $HockyAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> semester = const Value.absent(),
                Value<DateTime> registrationOpenDate = const Value.absent(),
                Value<DateTime> registrationCloseDate = const Value.absent(),
                Value<DateTime> studyStartDate = const Value.absent(),
                Value<DateTime> studyEndDate = const Value.absent(),
                Value<DateTime> gradeSubmissionDeadline = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HockyCompanion(
                semester: semester,
                registrationOpenDate: registrationOpenDate,
                registrationCloseDate: registrationCloseDate,
                studyStartDate: studyStartDate,
                studyEndDate: studyEndDate,
                gradeSubmissionDeadline: gradeSubmissionDeadline,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String semester,
                required DateTime registrationOpenDate,
                required DateTime registrationCloseDate,
                required DateTime studyStartDate,
                required DateTime studyEndDate,
                required DateTime gradeSubmissionDeadline,
                Value<int> rowid = const Value.absent(),
              }) => HockyCompanion.insert(
                semester: semester,
                registrationOpenDate: registrationOpenDate,
                registrationCloseDate: registrationCloseDate,
                studyStartDate: studyStartDate,
                studyEndDate: studyEndDate,
                gradeSubmissionDeadline: gradeSubmissionDeadline,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $HockyProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Hocky,
      SemesterData,
      $HockyFilterComposer,
      $HockyOrderingComposer,
      $HockyAnnotationComposer,
      $HockyCreateCompanionBuilder,
      $HockyUpdateCompanionBuilder,
      (SemesterData, BaseReferences<_$AppDatabase, Hocky, SemesterData>),
      SemesterData,
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
          (CourseData, BaseReferences<_$AppDatabase, Course, CourseData>),
          CourseData,
          PrefetchHooks Function()
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (CourseData, BaseReferences<_$AppDatabase, Course, CourseData>),
      CourseData,
      PrefetchHooks Function()
    >;
typedef $DetaithacsiCreateCompanionBuilder =
    DetaithacsiCompanion Function({
      Value<int> id,
      required int supervisorId,
      required String vietnameseTitle,
      required String englishTitle,
      Value<String> note,
      Value<int?> studentId,
      Value<DateTime?> assignedDate,
      Value<String?> assignedDecisionNumber,
      Value<DateTime?> defenseDeadline,
      Value<String?> defenseDecisionNumber,
      Value<DateTime?> defenseDate,
      Value<int?> presidentId,
      Value<int?> firstReviewerId,
      Value<int?> secondReviewerId,
      Value<int?> secretaryId,
      Value<int?> memberId,
      Value<bool> flagTracking,
      Value<bool> flagPaid,
      Value<bool> flagIgnore,
      Value<String?> group,
      Value<String?> year,
      Value<int> isRegisteredForDefense,
      Value<int> isProfileSubmitted,
    });
typedef $DetaithacsiUpdateCompanionBuilder =
    DetaithacsiCompanion Function({
      Value<int> id,
      Value<int> supervisorId,
      Value<String> vietnameseTitle,
      Value<String> englishTitle,
      Value<String> note,
      Value<int?> studentId,
      Value<DateTime?> assignedDate,
      Value<String?> assignedDecisionNumber,
      Value<DateTime?> defenseDeadline,
      Value<String?> defenseDecisionNumber,
      Value<DateTime?> defenseDate,
      Value<int?> presidentId,
      Value<int?> firstReviewerId,
      Value<int?> secondReviewerId,
      Value<int?> secretaryId,
      Value<int?> memberId,
      Value<bool> flagTracking,
      Value<bool> flagPaid,
      Value<bool> flagIgnore,
      Value<String?> group,
      Value<String?> year,
      Value<int> isRegisteredForDefense,
      Value<int> isProfileSubmitted,
    });

class $DetaithacsiFilterComposer extends Composer<_$AppDatabase, Detaithacsi> {
  $DetaithacsiFilterComposer({
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

  ColumnFilters<int> get supervisorId => $composableBuilder(
    column: $table.supervisorId,
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

  ColumnFilters<int> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String>
  get assignedDate => $composableBuilder(
    column: $table.assignedDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get assignedDecisionNumber => $composableBuilder(
    column: $table.assignedDecisionNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String>
  get defenseDeadline => $composableBuilder(
    column: $table.defenseDeadline,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get defenseDecisionNumber => $composableBuilder(
    column: $table.defenseDecisionNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String> get defenseDate =>
      $composableBuilder(
        column: $table.defenseDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get presidentId => $composableBuilder(
    column: $table.presidentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firstReviewerId => $composableBuilder(
    column: $table.firstReviewerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get secondReviewerId => $composableBuilder(
    column: $table.secondReviewerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get secretaryId => $composableBuilder(
    column: $table.secretaryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get memberId => $composableBuilder(
    column: $table.memberId,
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

  ColumnFilters<int> get isRegisteredForDefense => $composableBuilder(
    column: $table.isRegisteredForDefense,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isProfileSubmitted => $composableBuilder(
    column: $table.isProfileSubmitted,
    builder: (column) => ColumnFilters(column),
  );
}

class $DetaithacsiOrderingComposer
    extends Composer<_$AppDatabase, Detaithacsi> {
  $DetaithacsiOrderingComposer({
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

  ColumnOrderings<int> get supervisorId => $composableBuilder(
    column: $table.supervisorId,
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

  ColumnOrderings<int> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignedDate => $composableBuilder(
    column: $table.assignedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignedDecisionNumber => $composableBuilder(
    column: $table.assignedDecisionNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defenseDeadline => $composableBuilder(
    column: $table.defenseDeadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defenseDecisionNumber => $composableBuilder(
    column: $table.defenseDecisionNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defenseDate => $composableBuilder(
    column: $table.defenseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get presidentId => $composableBuilder(
    column: $table.presidentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firstReviewerId => $composableBuilder(
    column: $table.firstReviewerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get secondReviewerId => $composableBuilder(
    column: $table.secondReviewerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get secretaryId => $composableBuilder(
    column: $table.secretaryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get memberId => $composableBuilder(
    column: $table.memberId,
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

  ColumnOrderings<int> get isRegisteredForDefense => $composableBuilder(
    column: $table.isRegisteredForDefense,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isProfileSubmitted => $composableBuilder(
    column: $table.isProfileSubmitted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $DetaithacsiAnnotationComposer
    extends Composer<_$AppDatabase, Detaithacsi> {
  $DetaithacsiAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get supervisorId => $composableBuilder(
    column: $table.supervisorId,
    builder: (column) => column,
  );

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

  GeneratedColumn<int> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, String> get assignedDate =>
      $composableBuilder(
        column: $table.assignedDate,
        builder: (column) => column,
      );

  GeneratedColumn<String> get assignedDecisionNumber => $composableBuilder(
    column: $table.assignedDecisionNumber,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime?, String> get defenseDeadline =>
      $composableBuilder(
        column: $table.defenseDeadline,
        builder: (column) => column,
      );

  GeneratedColumn<String> get defenseDecisionNumber => $composableBuilder(
    column: $table.defenseDecisionNumber,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime?, String> get defenseDate =>
      $composableBuilder(
        column: $table.defenseDate,
        builder: (column) => column,
      );

  GeneratedColumn<int> get presidentId => $composableBuilder(
    column: $table.presidentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get firstReviewerId => $composableBuilder(
    column: $table.firstReviewerId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get secondReviewerId => $composableBuilder(
    column: $table.secondReviewerId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get secretaryId => $composableBuilder(
    column: $table.secretaryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get memberId =>
      $composableBuilder(column: $table.memberId, builder: (column) => column);

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

  GeneratedColumn<int> get isRegisteredForDefense => $composableBuilder(
    column: $table.isRegisteredForDefense,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isProfileSubmitted => $composableBuilder(
    column: $table.isProfileSubmitted,
    builder: (column) => column,
  );
}

class $DetaithacsiTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Detaithacsi,
          ThesisData,
          $DetaithacsiFilterComposer,
          $DetaithacsiOrderingComposer,
          $DetaithacsiAnnotationComposer,
          $DetaithacsiCreateCompanionBuilder,
          $DetaithacsiUpdateCompanionBuilder,
          (ThesisData, BaseReferences<_$AppDatabase, Detaithacsi, ThesisData>),
          ThesisData,
          PrefetchHooks Function()
        > {
  $DetaithacsiTableManager(_$AppDatabase db, Detaithacsi table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DetaithacsiFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DetaithacsiOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DetaithacsiAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> supervisorId = const Value.absent(),
                Value<String> vietnameseTitle = const Value.absent(),
                Value<String> englishTitle = const Value.absent(),
                Value<String> note = const Value.absent(),
                Value<int?> studentId = const Value.absent(),
                Value<DateTime?> assignedDate = const Value.absent(),
                Value<String?> assignedDecisionNumber = const Value.absent(),
                Value<DateTime?> defenseDeadline = const Value.absent(),
                Value<String?> defenseDecisionNumber = const Value.absent(),
                Value<DateTime?> defenseDate = const Value.absent(),
                Value<int?> presidentId = const Value.absent(),
                Value<int?> firstReviewerId = const Value.absent(),
                Value<int?> secondReviewerId = const Value.absent(),
                Value<int?> secretaryId = const Value.absent(),
                Value<int?> memberId = const Value.absent(),
                Value<bool> flagTracking = const Value.absent(),
                Value<bool> flagPaid = const Value.absent(),
                Value<bool> flagIgnore = const Value.absent(),
                Value<String?> group = const Value.absent(),
                Value<String?> year = const Value.absent(),
                Value<int> isRegisteredForDefense = const Value.absent(),
                Value<int> isProfileSubmitted = const Value.absent(),
              }) => DetaithacsiCompanion(
                id: id,
                supervisorId: supervisorId,
                vietnameseTitle: vietnameseTitle,
                englishTitle: englishTitle,
                note: note,
                studentId: studentId,
                assignedDate: assignedDate,
                assignedDecisionNumber: assignedDecisionNumber,
                defenseDeadline: defenseDeadline,
                defenseDecisionNumber: defenseDecisionNumber,
                defenseDate: defenseDate,
                presidentId: presidentId,
                firstReviewerId: firstReviewerId,
                secondReviewerId: secondReviewerId,
                secretaryId: secretaryId,
                memberId: memberId,
                flagTracking: flagTracking,
                flagPaid: flagPaid,
                flagIgnore: flagIgnore,
                group: group,
                year: year,
                isRegisteredForDefense: isRegisteredForDefense,
                isProfileSubmitted: isProfileSubmitted,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int supervisorId,
                required String vietnameseTitle,
                required String englishTitle,
                Value<String> note = const Value.absent(),
                Value<int?> studentId = const Value.absent(),
                Value<DateTime?> assignedDate = const Value.absent(),
                Value<String?> assignedDecisionNumber = const Value.absent(),
                Value<DateTime?> defenseDeadline = const Value.absent(),
                Value<String?> defenseDecisionNumber = const Value.absent(),
                Value<DateTime?> defenseDate = const Value.absent(),
                Value<int?> presidentId = const Value.absent(),
                Value<int?> firstReviewerId = const Value.absent(),
                Value<int?> secondReviewerId = const Value.absent(),
                Value<int?> secretaryId = const Value.absent(),
                Value<int?> memberId = const Value.absent(),
                Value<bool> flagTracking = const Value.absent(),
                Value<bool> flagPaid = const Value.absent(),
                Value<bool> flagIgnore = const Value.absent(),
                Value<String?> group = const Value.absent(),
                Value<String?> year = const Value.absent(),
                Value<int> isRegisteredForDefense = const Value.absent(),
                Value<int> isProfileSubmitted = const Value.absent(),
              }) => DetaithacsiCompanion.insert(
                id: id,
                supervisorId: supervisorId,
                vietnameseTitle: vietnameseTitle,
                englishTitle: englishTitle,
                note: note,
                studentId: studentId,
                assignedDate: assignedDate,
                assignedDecisionNumber: assignedDecisionNumber,
                defenseDeadline: defenseDeadline,
                defenseDecisionNumber: defenseDecisionNumber,
                defenseDate: defenseDate,
                presidentId: presidentId,
                firstReviewerId: firstReviewerId,
                secondReviewerId: secondReviewerId,
                secretaryId: secretaryId,
                memberId: memberId,
                flagTracking: flagTracking,
                flagPaid: flagPaid,
                flagIgnore: flagIgnore,
                group: group,
                year: year,
                isRegisteredForDefense: isRegisteredForDefense,
                isProfileSubmitted: isProfileSubmitted,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $DetaithacsiProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Detaithacsi,
      ThesisData,
      $DetaithacsiFilterComposer,
      $DetaithacsiOrderingComposer,
      $DetaithacsiAnnotationComposer,
      $DetaithacsiCreateCompanionBuilder,
      $DetaithacsiUpdateCompanionBuilder,
      (ThesisData, BaseReferences<_$AppDatabase, Detaithacsi, ThesisData>),
      ThesisData,
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
      Value<String> majorSpecialization,
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
      Value<String> majorSpecialization,
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

  ColumnFilters<String> get majorSpecialization => $composableBuilder(
    column: $table.majorSpecialization,
    builder: (column) => ColumnFilters(column),
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

  GeneratedColumn<String> get majorSpecialization => $composableBuilder(
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
                Value<String> majorSpecialization = const Value.absent(),
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
                Value<String> majorSpecialization = const Value.absent(),
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
typedef $DangKyGiangDayCreateCompanionBuilder =
    DangKyGiangDayCompanion Function({
      required int teacherId,
      required String courseId,
      Value<int> rowid,
    });
typedef $DangKyGiangDayUpdateCompanionBuilder =
    DangKyGiangDayCompanion Function({
      Value<int> teacherId,
      Value<String> courseId,
      Value<int> rowid,
    });

class $DangKyGiangDayFilterComposer
    extends Composer<_$AppDatabase, DangKyGiangDay> {
  $DangKyGiangDayFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnFilters(column),
  );
}

class $DangKyGiangDayOrderingComposer
    extends Composer<_$AppDatabase, DangKyGiangDay> {
  $DangKyGiangDayOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $DangKyGiangDayAnnotationComposer
    extends Composer<_$AppDatabase, DangKyGiangDay> {
  $DangKyGiangDayAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get teacherId =>
      $composableBuilder(column: $table.teacherId, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);
}

class $DangKyGiangDayTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          DangKyGiangDay,
          TeachingRegistrationData,
          $DangKyGiangDayFilterComposer,
          $DangKyGiangDayOrderingComposer,
          $DangKyGiangDayAnnotationComposer,
          $DangKyGiangDayCreateCompanionBuilder,
          $DangKyGiangDayUpdateCompanionBuilder,
          (
            TeachingRegistrationData,
            BaseReferences<
              _$AppDatabase,
              DangKyGiangDay,
              TeachingRegistrationData
            >,
          ),
          TeachingRegistrationData,
          PrefetchHooks Function()
        > {
  $DangKyGiangDayTableManager(_$AppDatabase db, DangKyGiangDay table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DangKyGiangDayFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DangKyGiangDayOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DangKyGiangDayAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> teacherId = const Value.absent(),
                Value<String> courseId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DangKyGiangDayCompanion(
                teacherId: teacherId,
                courseId: courseId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int teacherId,
                required String courseId,
                Value<int> rowid = const Value.absent(),
              }) => DangKyGiangDayCompanion.insert(
                teacherId: teacherId,
                courseId: courseId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $DangKyGiangDayProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      DangKyGiangDay,
      TeachingRegistrationData,
      $DangKyGiangDayFilterComposer,
      $DangKyGiangDayOrderingComposer,
      $DangKyGiangDayAnnotationComposer,
      $DangKyGiangDayCreateCompanionBuilder,
      $DangKyGiangDayUpdateCompanionBuilder,
      (
        TeachingRegistrationData,
        BaseReferences<_$AppDatabase, DangKyGiangDay, TeachingRegistrationData>,
      ),
      TeachingRegistrationData,
      PrefetchHooks Function()
    >;
typedef $LopTinChiCreateCompanionBuilder =
    LopTinChiCompanion Function({
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
      Value<String?> dayOfWeek,
      Value<int?> startPeriod,
      Value<int?> endPeriod,
      Value<enums.CourseClassStatus?> status,
    });
typedef $LopTinChiUpdateCompanionBuilder =
    LopTinChiCompanion Function({
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
      Value<String?> dayOfWeek,
      Value<int?> startPeriod,
      Value<int?> endPeriod,
      Value<enums.CourseClassStatus?> status,
    });

final class $LopTinChiReferences
    extends BaseReferences<_$AppDatabase, LopTinChi, CourseClassData> {
  $LopTinChiReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<TeachingAssignment, List<TeachingAssignmentData>>
  _teachingAssignmentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.teachingAssignment,
        aliasName: $_aliasNameGenerator(
          db.lopTinChi.id,
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
}

class $LopTinChiFilterComposer extends Composer<_$AppDatabase, LopTinChi> {
  $LopTinChiFilterComposer({
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

  ColumnFilters<String> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
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
}

class $LopTinChiOrderingComposer extends Composer<_$AppDatabase, LopTinChi> {
  $LopTinChiOrderingComposer({
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

  ColumnOrderings<String> get dayOfWeek => $composableBuilder(
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

class $LopTinChiAnnotationComposer extends Composer<_$AppDatabase, LopTinChi> {
  $LopTinChiAnnotationComposer({
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

  GeneratedColumn<String> get dayOfWeek =>
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
}

class $LopTinChiTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          LopTinChi,
          CourseClassData,
          $LopTinChiFilterComposer,
          $LopTinChiOrderingComposer,
          $LopTinChiAnnotationComposer,
          $LopTinChiCreateCompanionBuilder,
          $LopTinChiUpdateCompanionBuilder,
          (CourseClassData, $LopTinChiReferences),
          CourseClassData,
          PrefetchHooks Function({bool teachingAssignmentRefs})
        > {
  $LopTinChiTableManager(_$AppDatabase db, LopTinChi table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $LopTinChiFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $LopTinChiOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $LopTinChiAnnotationComposer($db: db, $table: table),
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
                Value<String?> dayOfWeek = const Value.absent(),
                Value<int?> startPeriod = const Value.absent(),
                Value<int?> endPeriod = const Value.absent(),
                Value<enums.CourseClassStatus?> status = const Value.absent(),
              }) => LopTinChiCompanion(
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
                Value<String?> dayOfWeek = const Value.absent(),
                Value<int?> startPeriod = const Value.absent(),
                Value<int?> endPeriod = const Value.absent(),
                Value<enums.CourseClassStatus?> status = const Value.absent(),
              }) => LopTinChiCompanion.insert(
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
                (e) => (e.readTable(table), $LopTinChiReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({teachingAssignmentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (teachingAssignmentRefs) db.teachingAssignment,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (teachingAssignmentRefs)
                    await $_getPrefetchedData<
                      CourseClassData,
                      LopTinChi,
                      TeachingAssignmentData
                    >(
                      currentTable: table,
                      referencedTable: $LopTinChiReferences
                          ._teachingAssignmentRefsTable(db),
                      managerFromTypedResult: (p0) => $LopTinChiReferences(
                        db,
                        table,
                        p0,
                      ).teachingAssignmentRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.classId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $LopTinChiProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      LopTinChi,
      CourseClassData,
      $LopTinChiFilterComposer,
      $LopTinChiOrderingComposer,
      $LopTinChiAnnotationComposer,
      $LopTinChiCreateCompanionBuilder,
      $LopTinChiUpdateCompanionBuilder,
      (CourseClassData, $LopTinChiReferences),
      CourseClassData,
      PrefetchHooks Function({bool teachingAssignmentRefs})
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

  static LopTinChi _classIdTable(_$AppDatabase db) => db.lopTinChi.createAlias(
    $_aliasNameGenerator(db.teachingAssignment.classId, db.lopTinChi.id),
  );

  $LopTinChiProcessedTableManager get classId {
    final $_column = $_itemColumn<int>('class_id')!;

    final manager = $LopTinChiTableManager(
      $_db,
      $_db.lopTinChi,
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

  $LopTinChiFilterComposer get classId {
    final $LopTinChiFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.lopTinChi,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $LopTinChiFilterComposer(
            $db: $db,
            $table: $db.lopTinChi,
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

  $LopTinChiOrderingComposer get classId {
    final $LopTinChiOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.lopTinChi,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $LopTinChiOrderingComposer(
            $db: $db,
            $table: $db.lopTinChi,
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

  $LopTinChiAnnotationComposer get classId {
    final $LopTinChiAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.lopTinChi,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $LopTinChiAnnotationComposer(
            $db: $db,
            $table: $db.lopTinChi,
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
typedef $DangKyHocCreateCompanionBuilder =
    DangKyHocCompanion Function({
      required int courseClassId,
      required int studentId,
      Value<int> rowid,
    });
typedef $DangKyHocUpdateCompanionBuilder =
    DangKyHocCompanion Function({
      Value<int> courseClassId,
      Value<int> studentId,
      Value<int> rowid,
    });

class $DangKyHocFilterComposer extends Composer<_$AppDatabase, DangKyHoc> {
  $DangKyHocFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get courseClassId => $composableBuilder(
    column: $table.courseClassId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );
}

class $DangKyHocOrderingComposer extends Composer<_$AppDatabase, DangKyHoc> {
  $DangKyHocOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get courseClassId => $composableBuilder(
    column: $table.courseClassId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $DangKyHocAnnotationComposer extends Composer<_$AppDatabase, DangKyHoc> {
  $DangKyHocAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get courseClassId => $composableBuilder(
    column: $table.courseClassId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);
}

class $DangKyHocTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          DangKyHoc,
          ClassCourseRegistrationData,
          $DangKyHocFilterComposer,
          $DangKyHocOrderingComposer,
          $DangKyHocAnnotationComposer,
          $DangKyHocCreateCompanionBuilder,
          $DangKyHocUpdateCompanionBuilder,
          (
            ClassCourseRegistrationData,
            BaseReferences<
              _$AppDatabase,
              DangKyHoc,
              ClassCourseRegistrationData
            >,
          ),
          ClassCourseRegistrationData,
          PrefetchHooks Function()
        > {
  $DangKyHocTableManager(_$AppDatabase db, DangKyHoc table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DangKyHocFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DangKyHocOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DangKyHocAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> courseClassId = const Value.absent(),
                Value<int> studentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DangKyHocCompanion(
                courseClassId: courseClassId,
                studentId: studentId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int courseClassId,
                required int studentId,
                Value<int> rowid = const Value.absent(),
              }) => DangKyHocCompanion.insert(
                courseClassId: courseClassId,
                studentId: studentId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $DangKyHocProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      DangKyHoc,
      ClassCourseRegistrationData,
      $DangKyHocFilterComposer,
      $DangKyHocOrderingComposer,
      $DangKyHocAnnotationComposer,
      $DangKyHocCreateCompanionBuilder,
      $DangKyHocUpdateCompanionBuilder,
      (
        ClassCourseRegistrationData,
        BaseReferences<_$AppDatabase, DangKyHoc, ClassCourseRegistrationData>,
      ),
      ClassCourseRegistrationData,
      PrefetchHooks Function()
    >;
typedef $FtsDeTaiThacSiCreateCompanionBuilder =
    FtsDeTaiThacSiCompanion Function({
      required String id,
      required String idGiangVien,
      required String idHocVien,
      required String tenTiengAnh,
      required String tenTiengViet,
      required String giangVien,
      required String hocVien,
      Value<int> rowid,
    });
typedef $FtsDeTaiThacSiUpdateCompanionBuilder =
    FtsDeTaiThacSiCompanion Function({
      Value<String> id,
      Value<String> idGiangVien,
      Value<String> idHocVien,
      Value<String> tenTiengAnh,
      Value<String> tenTiengViet,
      Value<String> giangVien,
      Value<String> hocVien,
      Value<int> rowid,
    });

class $FtsDeTaiThacSiFilterComposer
    extends Composer<_$AppDatabase, FtsDeTaiThacSi> {
  $FtsDeTaiThacSiFilterComposer({
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

class $FtsDeTaiThacSiOrderingComposer
    extends Composer<_$AppDatabase, FtsDeTaiThacSi> {
  $FtsDeTaiThacSiOrderingComposer({
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

class $FtsDeTaiThacSiAnnotationComposer
    extends Composer<_$AppDatabase, FtsDeTaiThacSi> {
  $FtsDeTaiThacSiAnnotationComposer({
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

class $FtsDeTaiThacSiTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          FtsDeTaiThacSi,
          FtsDeTaiThacSiData,
          $FtsDeTaiThacSiFilterComposer,
          $FtsDeTaiThacSiOrderingComposer,
          $FtsDeTaiThacSiAnnotationComposer,
          $FtsDeTaiThacSiCreateCompanionBuilder,
          $FtsDeTaiThacSiUpdateCompanionBuilder,
          (
            FtsDeTaiThacSiData,
            BaseReferences<_$AppDatabase, FtsDeTaiThacSi, FtsDeTaiThacSiData>,
          ),
          FtsDeTaiThacSiData,
          PrefetchHooks Function()
        > {
  $FtsDeTaiThacSiTableManager(_$AppDatabase db, FtsDeTaiThacSi table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $FtsDeTaiThacSiFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $FtsDeTaiThacSiOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $FtsDeTaiThacSiAnnotationComposer($db: db, $table: table),
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
              }) => FtsDeTaiThacSiCompanion(
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
              }) => FtsDeTaiThacSiCompanion.insert(
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

typedef $FtsDeTaiThacSiProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      FtsDeTaiThacSi,
      FtsDeTaiThacSiData,
      $FtsDeTaiThacSiFilterComposer,
      $FtsDeTaiThacSiOrderingComposer,
      $FtsDeTaiThacSiAnnotationComposer,
      $FtsDeTaiThacSiCreateCompanionBuilder,
      $FtsDeTaiThacSiUpdateCompanionBuilder,
      (
        FtsDeTaiThacSiData,
        BaseReferences<_$AppDatabase, FtsDeTaiThacSi, FtsDeTaiThacSiData>,
      ),
      FtsDeTaiThacSiData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $PreferenceTableManager get preference =>
      $PreferenceTableManager(_db, _db.preference);
  $DocumentRoleTableManager get documentRole =>
      $DocumentRoleTableManager(_db, _db.documentRole);
  $DocumentTableManager get document =>
      $DocumentTableManager(_db, _db.document);
  $NienKhoaTableManager get nienKhoa =>
      $NienKhoaTableManager(_db, _db.nienKhoa);
  $TeacherTableManager get teacher => $TeacherTableManager(_db, _db.teacher);
  $AdmissionCouncilTableManager get admissionCouncil =>
      $AdmissionCouncilTableManager(_db, _db.admissionCouncil);
  $StudentTableManager get student => $StudentTableManager(_db, _db.student);
  $HockyTableManager get hocky => $HockyTableManager(_db, _db.hocky);
  $CourseTableManager get course => $CourseTableManager(_db, _db.course);
  $DetaithacsiTableManager get detaithacsi =>
      $DetaithacsiTableManager(_db, _db.detaithacsi);
  $PhdCohortTableManager get phdCohort =>
      $PhdCohortTableManager(_db, _db.phdCohort);
  $PhdStudentTableManager get phdStudent =>
      $PhdStudentTableManager(_db, _db.phdStudent);
  $DangKyGiangDayTableManager get dangKyGiangDay =>
      $DangKyGiangDayTableManager(_db, _db.dangKyGiangDay);
  $LopTinChiTableManager get lopTinChi =>
      $LopTinChiTableManager(_db, _db.lopTinChi);
  $TeachingAssignmentTableManager get teachingAssignment =>
      $TeachingAssignmentTableManager(_db, _db.teachingAssignment);
  $DangKyHocTableManager get dangKyHoc =>
      $DangKyHocTableManager(_db, _db.dangKyHoc);
  $FtsDeTaiThacSiTableManager get ftsDeTaiThacSi =>
      $FtsDeTaiThacSiTableManager(_db, _db.ftsDeTaiThacSi);
}
