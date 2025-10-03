// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_orm.dart';

// ignore_for_file: type=lint
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
  static const VerificationMeta _registrationOpenDateMeta =
      const VerificationMeta('registrationOpenDate');
  late final GeneratedColumn<String> registrationOpenDate =
      GeneratedColumn<String>(
        'moDangKy',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const VerificationMeta _registrationCloseDateMeta =
      const VerificationMeta('registrationCloseDate');
  late final GeneratedColumn<String> registrationCloseDate =
      GeneratedColumn<String>(
        'dongDangKy',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const VerificationMeta _studyStartDateMeta = const VerificationMeta(
    'studyStartDate',
  );
  late final GeneratedColumn<String> studyStartDate = GeneratedColumn<String>(
    'batDauHoc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _studyEndDateMeta = const VerificationMeta(
    'studyEndDate',
  );
  late final GeneratedColumn<String> studyEndDate = GeneratedColumn<String>(
    'ketThucHoc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _gradeSubmissionDeadlineMeta =
      const VerificationMeta('gradeSubmissionDeadline');
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
    if (data.containsKey('moDangKy')) {
      context.handle(
        _registrationOpenDateMeta,
        registrationOpenDate.isAcceptableOrUnknown(
          data['moDangKy']!,
          _registrationOpenDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_registrationOpenDateMeta);
    }
    if (data.containsKey('dongDangKy')) {
      context.handle(
        _registrationCloseDateMeta,
        registrationCloseDate.isAcceptableOrUnknown(
          data['dongDangKy']!,
          _registrationCloseDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_registrationCloseDateMeta);
    }
    if (data.containsKey('batDauHoc')) {
      context.handle(
        _studyStartDateMeta,
        studyStartDate.isAcceptableOrUnknown(
          data['batDauHoc']!,
          _studyStartDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_studyStartDateMeta);
    }
    if (data.containsKey('ketThucHoc')) {
      context.handle(
        _studyEndDateMeta,
        studyEndDate.isAcceptableOrUnknown(
          data['ketThucHoc']!,
          _studyEndDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_studyEndDateMeta);
    }
    if (data.containsKey('hanNhapDiem')) {
      context.handle(
        _gradeSubmissionDeadlineMeta,
        gradeSubmissionDeadline.isAcceptableOrUnknown(
          data['hanNhapDiem']!,
          _gradeSubmissionDeadlineMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_gradeSubmissionDeadlineMeta);
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

class SemesterData extends DataClass implements Insertable<SemesterData> {
  final String semester;
  final String registrationOpenDate;
  final String registrationCloseDate;
  final String studyStartDate;
  final String studyEndDate;
  final String gradeSubmissionDeadline;
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

  factory SemesterData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SemesterData(
      semester: serializer.fromJson<String>(json['hocKy']),
      registrationOpenDate: serializer.fromJson<String>(json['moDangKy']),
      registrationCloseDate: serializer.fromJson<String>(json['dongDangKy']),
      studyStartDate: serializer.fromJson<String>(json['batDauHoc']),
      studyEndDate: serializer.fromJson<String>(json['ketThucHoc']),
      gradeSubmissionDeadline: serializer.fromJson<String>(json['hanNhapDiem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'hocKy': serializer.toJson<String>(semester),
      'moDangKy': serializer.toJson<String>(registrationOpenDate),
      'dongDangKy': serializer.toJson<String>(registrationCloseDate),
      'batDauHoc': serializer.toJson<String>(studyStartDate),
      'ketThucHoc': serializer.toJson<String>(studyEndDate),
      'hanNhapDiem': serializer.toJson<String>(gradeSubmissionDeadline),
    };
  }

  SemesterData copyWith({
    String? semester,
    String? registrationOpenDate,
    String? registrationCloseDate,
    String? studyStartDate,
    String? studyEndDate,
    String? gradeSubmissionDeadline,
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

class Hocphan extends Table with TableInfo<Hocphan, CourseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Hocphan(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'maHocPhan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
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
  static const VerificationMeta _creditsMeta = const VerificationMeta(
    'credits',
  );
  late final GeneratedColumn<int> credits = GeneratedColumn<int>(
    'soTinChi',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumnWithTypeConverter<CourseCategory, String>
  courseCategory = GeneratedColumn<String>(
    'khoiKienThuc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<CourseCategory>(Hocphan.$convertercourseCategory);
  static const VerificationMeta _workloadMeta = const VerificationMeta(
    'workload',
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
  VerificationContext validateIntegrity(
    Insertable<CourseData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('maHocPhan')) {
      context.handle(
        _idMeta,
        id.isAcceptableOrUnknown(data['maHocPhan']!, _idMeta),
      );
    } else if (isInserting) {
      context.missing(_idMeta);
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
    if (data.containsKey('soTinChi')) {
      context.handle(
        _creditsMeta,
        credits.isAcceptableOrUnknown(data['soTinChi']!, _creditsMeta),
      );
    } else if (isInserting) {
      context.missing(_creditsMeta);
    }
    if (data.containsKey('khoiLuong')) {
      context.handle(
        _workloadMeta,
        workload.isAcceptableOrUnknown(data['khoiLuong']!, _workloadMeta),
      );
    } else if (isInserting) {
      context.missing(_workloadMeta);
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
      courseCategory: Hocphan.$convertercourseCategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}khoiKienThuc'],
        )!,
      ),
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

  static TypeConverter<CourseCategory, String> $convertercourseCategory =
      const CourseCategoryConverter();
  @override
  bool get dontWriteConstraints => true;
}

class CourseData extends DataClass implements Insertable<CourseData> {
  final String id;
  final String vietnameseTitle;
  final String englishTitle;
  final int credits;
  final CourseCategory courseCategory;
  final String workload;
  const CourseData({
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
    {
      map['khoiKienThuc'] = Variable<String>(
        Hocphan.$convertercourseCategory.toSql(courseCategory),
      );
    }
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

  factory CourseData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseData(
      id: serializer.fromJson<String>(json['maHocPhan']),
      vietnameseTitle: serializer.fromJson<String>(json['tenTiengViet']),
      englishTitle: serializer.fromJson<String>(json['tenTiengAnh']),
      credits: serializer.fromJson<int>(json['soTinChi']),
      courseCategory: serializer.fromJson<CourseCategory>(json['khoiKienThuc']),
      workload: serializer.fromJson<String>(json['khoiLuong']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'maHocPhan': serializer.toJson<String>(id),
      'tenTiengViet': serializer.toJson<String>(vietnameseTitle),
      'tenTiengAnh': serializer.toJson<String>(englishTitle),
      'soTinChi': serializer.toJson<int>(credits),
      'khoiKienThuc': serializer.toJson<CourseCategory>(courseCategory),
      'khoiLuong': serializer.toJson<String>(workload),
    };
  }

  CourseData copyWith({
    String? id,
    String? vietnameseTitle,
    String? englishTitle,
    int? credits,
    CourseCategory? courseCategory,
    String? workload,
  }) => CourseData(
    id: id ?? this.id,
    vietnameseTitle: vietnameseTitle ?? this.vietnameseTitle,
    englishTitle: englishTitle ?? this.englishTitle,
    credits: credits ?? this.credits,
    courseCategory: courseCategory ?? this.courseCategory,
    workload: workload ?? this.workload,
  );
  CourseData copyWithCompanion(HocphanCompanion data) {
    return CourseData(
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
    return (StringBuffer('CourseData(')
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
      (other is CourseData &&
          other.id == this.id &&
          other.vietnameseTitle == this.vietnameseTitle &&
          other.englishTitle == this.englishTitle &&
          other.credits == this.credits &&
          other.courseCategory == this.courseCategory &&
          other.workload == this.workload);
}

class HocphanCompanion extends UpdateCompanion<CourseData> {
  final Value<String> id;
  final Value<String> vietnameseTitle;
  final Value<String> englishTitle;
  final Value<int> credits;
  final Value<CourseCategory> courseCategory;
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
    required CourseCategory courseCategory,
    required String workload,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       vietnameseTitle = Value(vietnameseTitle),
       englishTitle = Value(englishTitle),
       credits = Value(credits),
       courseCategory = Value(courseCategory),
       workload = Value(workload);
  static Insertable<CourseData> custom({
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
    Value<CourseCategory>? courseCategory,
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
      map['khoiKienThuc'] = Variable<String>(
        Hocphan.$convertercourseCategory.toSql(courseCategory.value),
      );
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

class Giangvien extends Table with TableInfo<Giangvien, TeacherData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Giangvien(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumnWithTypeConverter<Gender?, String> gender =
      GeneratedColumn<String>(
        'gioiTinh',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      ).withConverter<Gender?>(Giangvien.$convertergendern);
  late final GeneratedColumnWithTypeConverter<AcademicRank?, String>
  academicRank = GeneratedColumn<String>(
    'hocHam',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<AcademicRank?>(Giangvien.$converteracademicRank);
  late final GeneratedColumnWithTypeConverter<AcademicDegree?, String>
  academicDegree = GeneratedColumn<String>(
    'hocVi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  ).withConverter<AcademicDegree?>(Giangvien.$converteracademicDegree);
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
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
    'ngaySinh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
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
  static const String $name = 'giangvien';
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
    if (data.containsKey('ngaySinh')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(data['ngaySinh']!, _dateOfBirthMeta),
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
      gender: Giangvien.$convertergendern.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gioiTinh'],
        ),
      ),
      academicRank: Giangvien.$converteracademicRank.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}hocHam'],
        ),
      ),
      academicDegree: Giangvien.$converteracademicDegree.fromSql(
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

  static TypeConverter<Gender, String> $convertergender =
      const GenderConverter();
  static TypeConverter<Gender?, String?> $convertergendern =
      NullAwareTypeConverter.wrap($convertergender);
  static TypeConverter<AcademicRank?, String?> $converteracademicRank =
      const AcademicRankConverter();
  static TypeConverter<AcademicDegree?, String?> $converteracademicDegree =
      const AcademicDegreeConverter();
  @override
  bool get dontWriteConstraints => true;
}

class TeacherData extends DataClass implements Insertable<TeacherData> {
  final int id;
  final String? managementId;
  final String name;
  final String? department;
  final bool isOutsider;
  final Gender? gender;
  final AcademicRank? academicRank;
  final AcademicDegree? academicDegree;
  final String? phone;
  final String? personalEmail;
  final String? citizenId;
  final String? dateOfBirth;
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
        Giangvien.$convertergendern.toSql(gender),
      );
    }
    if (!nullToAbsent || academicRank != null) {
      map['hocHam'] = Variable<String>(
        Giangvien.$converteracademicRank.toSql(academicRank),
      );
    }
    if (!nullToAbsent || academicDegree != null) {
      map['hocVi'] = Variable<String>(
        Giangvien.$converteracademicDegree.toSql(academicDegree),
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
      gender: serializer.fromJson<Gender?>(json['gioiTinh']),
      academicRank: serializer.fromJson<AcademicRank?>(json['hocHam']),
      academicDegree: serializer.fromJson<AcademicDegree?>(json['hocVi']),
      phone: serializer.fromJson<String?>(json['sdt']),
      personalEmail: serializer.fromJson<String?>(json['email']),
      citizenId: serializer.fromJson<String?>(json['cccd']),
      dateOfBirth: serializer.fromJson<String?>(json['ngaySinh']),
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
      'gioiTinh': serializer.toJson<Gender?>(gender),
      'hocHam': serializer.toJson<AcademicRank?>(academicRank),
      'hocVi': serializer.toJson<AcademicDegree?>(academicDegree),
      'sdt': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(personalEmail),
      'cccd': serializer.toJson<String?>(citizenId),
      'ngaySinh': serializer.toJson<String?>(dateOfBirth),
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
    Value<Gender?> gender = const Value.absent(),
    Value<AcademicRank?> academicRank = const Value.absent(),
    Value<AcademicDegree?> academicDegree = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> personalEmail = const Value.absent(),
    Value<String?> citizenId = const Value.absent(),
    Value<String?> dateOfBirth = const Value.absent(),
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
  TeacherData copyWithCompanion(GiangvienCompanion data) {
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

class GiangvienCompanion extends UpdateCompanion<TeacherData> {
  final Value<int> id;
  final Value<String?> managementId;
  final Value<String> name;
  final Value<String?> department;
  final Value<bool> isOutsider;
  final Value<Gender?> gender;
  final Value<AcademicRank?> academicRank;
  final Value<AcademicDegree?> academicDegree;
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

  GiangvienCompanion copyWith({
    Value<int>? id,
    Value<String?>? managementId,
    Value<String>? name,
    Value<String?>? department,
    Value<bool>? isOutsider,
    Value<Gender?>? gender,
    Value<AcademicRank?>? academicRank,
    Value<AcademicDegree?>? academicDegree,
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
      map['gioiTinh'] = Variable<String>(
        Giangvien.$convertergendern.toSql(gender.value),
      );
    }
    if (academicRank.present) {
      map['hocHam'] = Variable<String>(
        Giangvien.$converteracademicRank.toSql(academicRank.value),
      );
    }
    if (academicDegree.present) {
      map['hocVi'] = Variable<String>(
        Giangvien.$converteracademicDegree.toSql(academicDegree.value),
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
  static const VerificationMeta _assignedDateMeta = const VerificationMeta(
    'assignedDate',
  );
  late final GeneratedColumn<String> assignedDate = GeneratedColumn<String>(
    'ngayGiao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
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
  static const VerificationMeta _defenseDeadlineMeta = const VerificationMeta(
    'defenseDeadline',
  );
  late final GeneratedColumn<String> defenseDeadline = GeneratedColumn<String>(
    'hanBaoVe',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
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
  static const VerificationMeta _defenseDateMeta = const VerificationMeta(
    'defenseDate',
  );
  late final GeneratedColumn<String> defenseDate = GeneratedColumn<String>(
    'ngayBaoVe',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
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
  static const VerificationMeta _isTrackingMeta = const VerificationMeta(
    'isTracking',
  );
  late final GeneratedColumn<int> isTracking = GeneratedColumn<int>(
    'flag_tracking',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0 CHECK (flag_tracking IN (0, 1))',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  late final GeneratedColumn<int> isPaid = GeneratedColumn<int>(
    'flag_paid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0 CHECK (flag_tracking IN (0, 1))',
    defaultValue: const CustomExpression('0'),
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
    isTracking,
    isPaid,
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
    if (data.containsKey('ngayGiao')) {
      context.handle(
        _assignedDateMeta,
        assignedDate.isAcceptableOrUnknown(
          data['ngayGiao']!,
          _assignedDateMeta,
        ),
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
    if (data.containsKey('hanBaoVe')) {
      context.handle(
        _defenseDeadlineMeta,
        defenseDeadline.isAcceptableOrUnknown(
          data['hanBaoVe']!,
          _defenseDeadlineMeta,
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
    if (data.containsKey('ngayBaoVe')) {
      context.handle(
        _defenseDateMeta,
        defenseDate.isAcceptableOrUnknown(data['ngayBaoVe']!, _defenseDateMeta),
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
        _isTrackingMeta,
        isTracking.isAcceptableOrUnknown(
          data['flag_tracking']!,
          _isTrackingMeta,
        ),
      );
    }
    if (data.containsKey('flag_paid')) {
      context.handle(
        _isPaidMeta,
        isPaid.isAcceptableOrUnknown(data['flag_paid']!, _isPaidMeta),
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
      isTracking: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}flag_tracking'],
      )!,
      isPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}flag_paid'],
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

class ThesisData extends DataClass implements Insertable<ThesisData> {
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
  final int isTracking;
  final int isPaid;
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
    required this.isTracking,
    required this.isPaid,
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
    map['flag_tracking'] = Variable<int>(isTracking);
    map['flag_paid'] = Variable<int>(isPaid);
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
      isTracking: Value(isTracking),
      isPaid: Value(isPaid),
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
      assignedDate: serializer.fromJson<String?>(json['ngayGiao']),
      assignedDecisionNumber: serializer.fromJson<String?>(json['soQdGiao']),
      defenseDeadline: serializer.fromJson<String?>(json['hanBaoVe']),
      defenseDecisionNumber: serializer.fromJson<String?>(json['soQdBaoVe']),
      defenseDate: serializer.fromJson<String?>(json['ngayBaoVe']),
      presidentId: serializer.fromJson<int?>(json['idChuTich']),
      firstReviewerId: serializer.fromJson<int?>(json['idPhanBien1']),
      secondReviewerId: serializer.fromJson<int?>(json['idPhanBien2']),
      secretaryId: serializer.fromJson<int?>(json['idThuKy']),
      memberId: serializer.fromJson<int?>(json['idUyVien']),
      isTracking: serializer.fromJson<int>(json['flag_tracking']),
      isPaid: serializer.fromJson<int>(json['flag_paid']),
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
      'ngayGiao': serializer.toJson<String?>(assignedDate),
      'soQdGiao': serializer.toJson<String?>(assignedDecisionNumber),
      'hanBaoVe': serializer.toJson<String?>(defenseDeadline),
      'soQdBaoVe': serializer.toJson<String?>(defenseDecisionNumber),
      'ngayBaoVe': serializer.toJson<String?>(defenseDate),
      'idChuTich': serializer.toJson<int?>(presidentId),
      'idPhanBien1': serializer.toJson<int?>(firstReviewerId),
      'idPhanBien2': serializer.toJson<int?>(secondReviewerId),
      'idThuKy': serializer.toJson<int?>(secretaryId),
      'idUyVien': serializer.toJson<int?>(memberId),
      'flag_tracking': serializer.toJson<int>(isTracking),
      'flag_paid': serializer.toJson<int>(isPaid),
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
    int? isTracking,
    int? isPaid,
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
    isTracking: isTracking ?? this.isTracking,
    isPaid: isPaid ?? this.isPaid,
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
      isTracking: data.isTracking.present
          ? data.isTracking.value
          : this.isTracking,
      isPaid: data.isPaid.present ? data.isPaid.value : this.isPaid,
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
          ..write('isTracking: $isTracking, ')
          ..write('isPaid: $isPaid, ')
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
    isTracking,
    isPaid,
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
          other.isTracking == this.isTracking &&
          other.isPaid == this.isPaid &&
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
  final Value<int> isTracking;
  final Value<int> isPaid;
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
    this.isTracking = const Value.absent(),
    this.isPaid = const Value.absent(),
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
    this.isTracking = const Value.absent(),
    this.isPaid = const Value.absent(),
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
    Expression<int>? isTracking,
    Expression<int>? isPaid,
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
      if (isTracking != null) 'flag_tracking': isTracking,
      if (isPaid != null) 'flag_paid': isPaid,
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
    Value<int>? isTracking,
    Value<int>? isPaid,
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
      isTracking: isTracking ?? this.isTracking,
      isPaid: isPaid ?? this.isPaid,
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
    if (isTracking.present) {
      map['flag_tracking'] = Variable<int>(isTracking.value);
    }
    if (isPaid.present) {
      map['flag_paid'] = Variable<int>(isPaid.value);
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
          ..write('isTracking: $isTracking, ')
          ..write('isPaid: $isPaid, ')
          ..write('group: $group, ')
          ..write('year: $year, ')
          ..write('isRegisteredForDefense: $isRegisteredForDefense, ')
          ..write('isProfileSubmitted: $isProfileSubmitted')
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
    true,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
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
  late final GeneratedColumnWithTypeConverter<Gender, String> gender =
      GeneratedColumn<String>(
        'gender',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NOT NULL DEFAULT \'M\'',
        defaultValue: const CustomExpression('\'M\''),
      ).withConverter<Gender>(PhdStudent.$convertergender);
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
      ),
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
      ),
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

  static TypeConverter<Gender, String> $convertergender =
      const GenderConverter();
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
  final int? id;
  final String cohort;
  final String? managementId;
  final String? admissionId;
  final String name;
  final Gender gender;
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
    this.id,
    required this.cohort,
    this.managementId,
    this.admissionId,
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
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['cohort'] = Variable<String>(cohort);
    if (!nullToAbsent || managementId != null) {
      map['management_id'] = Variable<String>(managementId);
    }
    if (!nullToAbsent || admissionId != null) {
      map['admission_id'] = Variable<String>(admissionId);
    }
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
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      cohort: Value(cohort),
      managementId: managementId == null && nullToAbsent
          ? const Value.absent()
          : Value(managementId),
      admissionId: admissionId == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionId),
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
      id: serializer.fromJson<int?>(json['id']),
      cohort: serializer.fromJson<String>(json['cohort']),
      managementId: serializer.fromJson<String?>(json['management_id']),
      admissionId: serializer.fromJson<String?>(json['admission_id']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<Gender>(json['gender']),
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
      'id': serializer.toJson<int?>(id),
      'cohort': serializer.toJson<String>(cohort),
      'management_id': serializer.toJson<String?>(managementId),
      'admission_id': serializer.toJson<String?>(admissionId),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<Gender>(gender),
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
    Value<int?> id = const Value.absent(),
    String? cohort,
    Value<String?> managementId = const Value.absent(),
    Value<String?> admissionId = const Value.absent(),
    String? name,
    Gender? gender,
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
    id: id.present ? id.value : this.id,
    cohort: cohort ?? this.cohort,
    managementId: managementId.present ? managementId.value : this.managementId,
    admissionId: admissionId.present ? admissionId.value : this.admissionId,
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
  final Value<int?> id;
  final Value<String> cohort;
  final Value<String?> managementId;
  final Value<String?> admissionId;
  final Value<String> name;
  final Value<Gender> gender;
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
    this.admissionId = const Value.absent(),
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
    Value<int?>? id,
    Value<String>? cohort,
    Value<String?>? managementId,
    Value<String?>? admissionId,
    Value<String>? name,
    Value<Gender>? gender,
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
    'FOREIGN KEY(idGiangVien)REFERENCES giangvien(id)',
    'FOREIGN KEY(maHocPhan)REFERENCES hocphan(maHocPhan)',
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

abstract class _$MyDriftDatabase extends GeneratedDatabase {
  _$MyDriftDatabase(QueryExecutor e) : super(e);
  $MyDriftDatabaseManager get managers => $MyDriftDatabaseManager(this);
  late final Hocky hocky = Hocky(this);
  late final Hocphan hocphan = Hocphan(this);
  late final Giangvien giangvien = Giangvien(this);
  late final Detaithacsi detaithacsi = Detaithacsi(this);
  late final PhdStudent phdStudent = PhdStudent(this);
  late final DangKyGiangDay dangKyGiangDay = DangKyGiangDay(this);
  Future<int> createPhdStudent({
    required String cohort,
    String? admissionId,
    required String name,
    required Gender gender,
    DateTime? dateOfBirth,
    String? placeOfBirth,
    required String phone,
    required String personalEmail,
    required String majorName,
    required String majorId,
    required String majorSpecialization,
    required String thesis,
    required int supervisorId,
    int? secondarySupervisorId,
  }) {
    return customInsert(
      'INSERT INTO phd_student (cohort, admission_id, name, gender, date_of_birth, place_of_birth, phone, personal_email, major_name, major_id, major_specialization, thesis, supervisor_id, secondary_supervisor_id) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13, ?14)',
      variables: [
        Variable<String>(cohort),
        Variable<String>(admissionId),
        Variable<String>(name),
        Variable<String>(PhdStudent.$convertergender.toSql(gender)),
        Variable<DateTime>(dateOfBirth),
        Variable<String>(placeOfBirth),
        Variable<String>(phone),
        Variable<String>(personalEmail),
        Variable<String>(majorName),
        Variable<String>(majorId),
        Variable<String>(majorSpecialization),
        Variable<String>(thesis),
        Variable<int>(supervisorId),
        Variable<int>(secondarySupervisorId),
      ],
      updates: {phdStudent},
    );
  }

  Selectable<TeacherData> searchTeacher({String? searchText, bool? outsider}) {
    return customSelect(
      'SELECT * FROM giangvien WHERE hoten LIKE \'%\' || ?1 || \'%\' OR email LIKE \'%\' || ?1 || \'%\' OR macanbo LIKE \'%\' || ?1 || \'%\' OR sdt LIKE \'%\' || ?1 || \'%\' OR email LIKE \'%\' || ?1 || \'%\' OR cccd LIKE \'%\' || ?1 || \'%\' OR stk LIKE \'%\' || ?1 || \'%\' OR mst LIKE \'%\' || ?1 || \'%\' AND(?2 IS NULL OR ngoaitruong = ?2)',
      variables: [Variable<String>(searchText), Variable<bool>(outsider)],
      readsFrom: {giangvien},
    ).asyncMap(giangvien.mapFromRow);
  }

  Selectable<int> getTrackingThesisIds() {
    return customSelect(
      'SELECT id FROM detaithacsi WHERE flag_tracking = 1 ORDER BY "group"',
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

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    hocky,
    hocphan,
    giangvien,
    detaithacsi,
    phdStudent,
    dangKyGiangDay,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $HockyCreateCompanionBuilder =
    HockyCompanion Function({
      required String semester,
      required String registrationOpenDate,
      required String registrationCloseDate,
      required String studyStartDate,
      required String studyEndDate,
      required String gradeSubmissionDeadline,
      Value<int> rowid,
    });
typedef $HockyUpdateCompanionBuilder =
    HockyCompanion Function({
      Value<String> semester,
      Value<String> registrationOpenDate,
      Value<String> registrationCloseDate,
      Value<String> studyStartDate,
      Value<String> studyEndDate,
      Value<String> gradeSubmissionDeadline,
      Value<int> rowid,
    });

class $HockyFilterComposer extends Composer<_$MyDriftDatabase, Hocky> {
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

  ColumnFilters<String> get registrationOpenDate => $composableBuilder(
    column: $table.registrationOpenDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registrationCloseDate => $composableBuilder(
    column: $table.registrationCloseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studyStartDate => $composableBuilder(
    column: $table.studyStartDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studyEndDate => $composableBuilder(
    column: $table.studyEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gradeSubmissionDeadline => $composableBuilder(
    column: $table.gradeSubmissionDeadline,
    builder: (column) => ColumnFilters(column),
  );
}

class $HockyOrderingComposer extends Composer<_$MyDriftDatabase, Hocky> {
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

class $HockyAnnotationComposer extends Composer<_$MyDriftDatabase, Hocky> {
  $HockyAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get semester =>
      $composableBuilder(column: $table.semester, builder: (column) => column);

  GeneratedColumn<String> get registrationOpenDate => $composableBuilder(
    column: $table.registrationOpenDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registrationCloseDate => $composableBuilder(
    column: $table.registrationCloseDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get studyStartDate => $composableBuilder(
    column: $table.studyStartDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get studyEndDate => $composableBuilder(
    column: $table.studyEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gradeSubmissionDeadline => $composableBuilder(
    column: $table.gradeSubmissionDeadline,
    builder: (column) => column,
  );
}

class $HockyTableManager
    extends
        RootTableManager<
          _$MyDriftDatabase,
          Hocky,
          SemesterData,
          $HockyFilterComposer,
          $HockyOrderingComposer,
          $HockyAnnotationComposer,
          $HockyCreateCompanionBuilder,
          $HockyUpdateCompanionBuilder,
          (
            SemesterData,
            BaseReferences<_$MyDriftDatabase, Hocky, SemesterData>,
          ),
          SemesterData,
          PrefetchHooks Function()
        > {
  $HockyTableManager(_$MyDriftDatabase db, Hocky table)
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
                Value<String> registrationOpenDate = const Value.absent(),
                Value<String> registrationCloseDate = const Value.absent(),
                Value<String> studyStartDate = const Value.absent(),
                Value<String> studyEndDate = const Value.absent(),
                Value<String> gradeSubmissionDeadline = const Value.absent(),
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
                required String registrationOpenDate,
                required String registrationCloseDate,
                required String studyStartDate,
                required String studyEndDate,
                required String gradeSubmissionDeadline,
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
      _$MyDriftDatabase,
      Hocky,
      SemesterData,
      $HockyFilterComposer,
      $HockyOrderingComposer,
      $HockyAnnotationComposer,
      $HockyCreateCompanionBuilder,
      $HockyUpdateCompanionBuilder,
      (SemesterData, BaseReferences<_$MyDriftDatabase, Hocky, SemesterData>),
      SemesterData,
      PrefetchHooks Function()
    >;
typedef $HocphanCreateCompanionBuilder =
    HocphanCompanion Function({
      required String id,
      required String vietnameseTitle,
      required String englishTitle,
      required int credits,
      required CourseCategory courseCategory,
      required String workload,
      Value<int> rowid,
    });
typedef $HocphanUpdateCompanionBuilder =
    HocphanCompanion Function({
      Value<String> id,
      Value<String> vietnameseTitle,
      Value<String> englishTitle,
      Value<int> credits,
      Value<CourseCategory> courseCategory,
      Value<String> workload,
      Value<int> rowid,
    });

class $HocphanFilterComposer extends Composer<_$MyDriftDatabase, Hocphan> {
  $HocphanFilterComposer({
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

  ColumnFilters<String> get vietnameseTitle => $composableBuilder(
    column: $table.vietnameseTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get englishTitle => $composableBuilder(
    column: $table.englishTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get credits => $composableBuilder(
    column: $table.credits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CourseCategory, CourseCategory, String>
  get courseCategory => $composableBuilder(
    column: $table.courseCategory,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get workload => $composableBuilder(
    column: $table.workload,
    builder: (column) => ColumnFilters(column),
  );
}

class $HocphanOrderingComposer extends Composer<_$MyDriftDatabase, Hocphan> {
  $HocphanOrderingComposer({
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

  ColumnOrderings<String> get vietnameseTitle => $composableBuilder(
    column: $table.vietnameseTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get englishTitle => $composableBuilder(
    column: $table.englishTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get credits => $composableBuilder(
    column: $table.credits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseCategory => $composableBuilder(
    column: $table.courseCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workload => $composableBuilder(
    column: $table.workload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $HocphanAnnotationComposer extends Composer<_$MyDriftDatabase, Hocphan> {
  $HocphanAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vietnameseTitle => $composableBuilder(
    column: $table.vietnameseTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get englishTitle => $composableBuilder(
    column: $table.englishTitle,
    builder: (column) => column,
  );

  GeneratedColumn<int> get credits =>
      $composableBuilder(column: $table.credits, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CourseCategory, String> get courseCategory =>
      $composableBuilder(
        column: $table.courseCategory,
        builder: (column) => column,
      );

  GeneratedColumn<String> get workload =>
      $composableBuilder(column: $table.workload, builder: (column) => column);
}

class $HocphanTableManager
    extends
        RootTableManager<
          _$MyDriftDatabase,
          Hocphan,
          CourseData,
          $HocphanFilterComposer,
          $HocphanOrderingComposer,
          $HocphanAnnotationComposer,
          $HocphanCreateCompanionBuilder,
          $HocphanUpdateCompanionBuilder,
          (CourseData, BaseReferences<_$MyDriftDatabase, Hocphan, CourseData>),
          CourseData,
          PrefetchHooks Function()
        > {
  $HocphanTableManager(_$MyDriftDatabase db, Hocphan table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $HocphanFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $HocphanOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $HocphanAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> vietnameseTitle = const Value.absent(),
                Value<String> englishTitle = const Value.absent(),
                Value<int> credits = const Value.absent(),
                Value<CourseCategory> courseCategory = const Value.absent(),
                Value<String> workload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HocphanCompanion(
                id: id,
                vietnameseTitle: vietnameseTitle,
                englishTitle: englishTitle,
                credits: credits,
                courseCategory: courseCategory,
                workload: workload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String vietnameseTitle,
                required String englishTitle,
                required int credits,
                required CourseCategory courseCategory,
                required String workload,
                Value<int> rowid = const Value.absent(),
              }) => HocphanCompanion.insert(
                id: id,
                vietnameseTitle: vietnameseTitle,
                englishTitle: englishTitle,
                credits: credits,
                courseCategory: courseCategory,
                workload: workload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $HocphanProcessedTableManager =
    ProcessedTableManager<
      _$MyDriftDatabase,
      Hocphan,
      CourseData,
      $HocphanFilterComposer,
      $HocphanOrderingComposer,
      $HocphanAnnotationComposer,
      $HocphanCreateCompanionBuilder,
      $HocphanUpdateCompanionBuilder,
      (CourseData, BaseReferences<_$MyDriftDatabase, Hocphan, CourseData>),
      CourseData,
      PrefetchHooks Function()
    >;
typedef $GiangvienCreateCompanionBuilder =
    GiangvienCompanion Function({
      Value<int> id,
      Value<String?> managementId,
      required String name,
      Value<String?> department,
      Value<bool> isOutsider,
      Value<Gender?> gender,
      Value<AcademicRank?> academicRank,
      Value<AcademicDegree?> academicDegree,
      Value<String?> phone,
      Value<String?> personalEmail,
      Value<String?> citizenId,
      Value<String?> dateOfBirth,
      Value<String?> bankAccount,
      Value<String?> bankName,
      Value<String?> taxCode,
      Value<String?> note,
      Value<int?> academicGroupId,
    });
typedef $GiangvienUpdateCompanionBuilder =
    GiangvienCompanion Function({
      Value<int> id,
      Value<String?> managementId,
      Value<String> name,
      Value<String?> department,
      Value<bool> isOutsider,
      Value<Gender?> gender,
      Value<AcademicRank?> academicRank,
      Value<AcademicDegree?> academicDegree,
      Value<String?> phone,
      Value<String?> personalEmail,
      Value<String?> citizenId,
      Value<String?> dateOfBirth,
      Value<String?> bankAccount,
      Value<String?> bankName,
      Value<String?> taxCode,
      Value<String?> note,
      Value<int?> academicGroupId,
    });

class $GiangvienFilterComposer extends Composer<_$MyDriftDatabase, Giangvien> {
  $GiangvienFilterComposer({
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

  ColumnWithTypeConverterFilters<Gender?, Gender, String> get gender =>
      $composableBuilder(
        column: $table.gender,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<AcademicRank?, AcademicRank, String>
  get academicRank => $composableBuilder(
    column: $table.academicRank,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<AcademicDegree?, AcademicDegree, String>
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

  ColumnFilters<String> get dateOfBirth => $composableBuilder(
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
}

class $GiangvienOrderingComposer
    extends Composer<_$MyDriftDatabase, Giangvien> {
  $GiangvienOrderingComposer({
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

class $GiangvienAnnotationComposer
    extends Composer<_$MyDriftDatabase, Giangvien> {
  $GiangvienAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<Gender?, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AcademicRank?, String> get academicRank =>
      $composableBuilder(
        column: $table.academicRank,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<AcademicDegree?, String>
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

  GeneratedColumn<String> get dateOfBirth => $composableBuilder(
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
}

class $GiangvienTableManager
    extends
        RootTableManager<
          _$MyDriftDatabase,
          Giangvien,
          TeacherData,
          $GiangvienFilterComposer,
          $GiangvienOrderingComposer,
          $GiangvienAnnotationComposer,
          $GiangvienCreateCompanionBuilder,
          $GiangvienUpdateCompanionBuilder,
          (
            TeacherData,
            BaseReferences<_$MyDriftDatabase, Giangvien, TeacherData>,
          ),
          TeacherData,
          PrefetchHooks Function()
        > {
  $GiangvienTableManager(_$MyDriftDatabase db, Giangvien table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $GiangvienFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $GiangvienOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $GiangvienAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> managementId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<bool> isOutsider = const Value.absent(),
                Value<Gender?> gender = const Value.absent(),
                Value<AcademicRank?> academicRank = const Value.absent(),
                Value<AcademicDegree?> academicDegree = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> personalEmail = const Value.absent(),
                Value<String?> citizenId = const Value.absent(),
                Value<String?> dateOfBirth = const Value.absent(),
                Value<String?> bankAccount = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> taxCode = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> academicGroupId = const Value.absent(),
              }) => GiangvienCompanion(
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
                Value<Gender?> gender = const Value.absent(),
                Value<AcademicRank?> academicRank = const Value.absent(),
                Value<AcademicDegree?> academicDegree = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> personalEmail = const Value.absent(),
                Value<String?> citizenId = const Value.absent(),
                Value<String?> dateOfBirth = const Value.absent(),
                Value<String?> bankAccount = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> taxCode = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> academicGroupId = const Value.absent(),
              }) => GiangvienCompanion.insert(
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $GiangvienProcessedTableManager =
    ProcessedTableManager<
      _$MyDriftDatabase,
      Giangvien,
      TeacherData,
      $GiangvienFilterComposer,
      $GiangvienOrderingComposer,
      $GiangvienAnnotationComposer,
      $GiangvienCreateCompanionBuilder,
      $GiangvienUpdateCompanionBuilder,
      (TeacherData, BaseReferences<_$MyDriftDatabase, Giangvien, TeacherData>),
      TeacherData,
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
      Value<String?> assignedDate,
      Value<String?> assignedDecisionNumber,
      Value<String?> defenseDeadline,
      Value<String?> defenseDecisionNumber,
      Value<String?> defenseDate,
      Value<int?> presidentId,
      Value<int?> firstReviewerId,
      Value<int?> secondReviewerId,
      Value<int?> secretaryId,
      Value<int?> memberId,
      Value<int> isTracking,
      Value<int> isPaid,
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
      Value<String?> assignedDate,
      Value<String?> assignedDecisionNumber,
      Value<String?> defenseDeadline,
      Value<String?> defenseDecisionNumber,
      Value<String?> defenseDate,
      Value<int?> presidentId,
      Value<int?> firstReviewerId,
      Value<int?> secondReviewerId,
      Value<int?> secretaryId,
      Value<int?> memberId,
      Value<int> isTracking,
      Value<int> isPaid,
      Value<String?> group,
      Value<String?> year,
      Value<int> isRegisteredForDefense,
      Value<int> isProfileSubmitted,
    });

class $DetaithacsiFilterComposer
    extends Composer<_$MyDriftDatabase, Detaithacsi> {
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

  ColumnFilters<String> get assignedDate => $composableBuilder(
    column: $table.assignedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assignedDecisionNumber => $composableBuilder(
    column: $table.assignedDecisionNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defenseDeadline => $composableBuilder(
    column: $table.defenseDeadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defenseDecisionNumber => $composableBuilder(
    column: $table.defenseDecisionNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defenseDate => $composableBuilder(
    column: $table.defenseDate,
    builder: (column) => ColumnFilters(column),
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

  ColumnFilters<int> get isTracking => $composableBuilder(
    column: $table.isTracking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isPaid => $composableBuilder(
    column: $table.isPaid,
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
    extends Composer<_$MyDriftDatabase, Detaithacsi> {
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

  ColumnOrderings<int> get isTracking => $composableBuilder(
    column: $table.isTracking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isPaid => $composableBuilder(
    column: $table.isPaid,
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
    extends Composer<_$MyDriftDatabase, Detaithacsi> {
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

  GeneratedColumn<String> get assignedDate => $composableBuilder(
    column: $table.assignedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assignedDecisionNumber => $composableBuilder(
    column: $table.assignedDecisionNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defenseDeadline => $composableBuilder(
    column: $table.defenseDeadline,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defenseDecisionNumber => $composableBuilder(
    column: $table.defenseDecisionNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defenseDate => $composableBuilder(
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

  GeneratedColumn<int> get isTracking => $composableBuilder(
    column: $table.isTracking,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isPaid =>
      $composableBuilder(column: $table.isPaid, builder: (column) => column);

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
          _$MyDriftDatabase,
          Detaithacsi,
          ThesisData,
          $DetaithacsiFilterComposer,
          $DetaithacsiOrderingComposer,
          $DetaithacsiAnnotationComposer,
          $DetaithacsiCreateCompanionBuilder,
          $DetaithacsiUpdateCompanionBuilder,
          (
            ThesisData,
            BaseReferences<_$MyDriftDatabase, Detaithacsi, ThesisData>,
          ),
          ThesisData,
          PrefetchHooks Function()
        > {
  $DetaithacsiTableManager(_$MyDriftDatabase db, Detaithacsi table)
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
                Value<int> isTracking = const Value.absent(),
                Value<int> isPaid = const Value.absent(),
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
                isTracking: isTracking,
                isPaid: isPaid,
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
                Value<int> isTracking = const Value.absent(),
                Value<int> isPaid = const Value.absent(),
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
                isTracking: isTracking,
                isPaid: isPaid,
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
      _$MyDriftDatabase,
      Detaithacsi,
      ThesisData,
      $DetaithacsiFilterComposer,
      $DetaithacsiOrderingComposer,
      $DetaithacsiAnnotationComposer,
      $DetaithacsiCreateCompanionBuilder,
      $DetaithacsiUpdateCompanionBuilder,
      (ThesisData, BaseReferences<_$MyDriftDatabase, Detaithacsi, ThesisData>),
      ThesisData,
      PrefetchHooks Function()
    >;
typedef $PhdStudentCreateCompanionBuilder =
    PhdStudentCompanion Function({
      Value<int?> id,
      required String cohort,
      Value<String?> managementId,
      Value<String?> admissionId,
      required String name,
      Value<Gender> gender,
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
      Value<int?> id,
      Value<String> cohort,
      Value<String?> managementId,
      Value<String?> admissionId,
      Value<String> name,
      Value<Gender> gender,
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

class $PhdStudentFilterComposer
    extends Composer<_$MyDriftDatabase, PhdStudent> {
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

  ColumnWithTypeConverterFilters<Gender, Gender, String> get gender =>
      $composableBuilder(
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

class $PhdStudentOrderingComposer
    extends Composer<_$MyDriftDatabase, PhdStudent> {
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
    extends Composer<_$MyDriftDatabase, PhdStudent> {
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

  GeneratedColumnWithTypeConverter<Gender, String> get gender =>
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
          _$MyDriftDatabase,
          PhdStudent,
          PhdStudentData,
          $PhdStudentFilterComposer,
          $PhdStudentOrderingComposer,
          $PhdStudentAnnotationComposer,
          $PhdStudentCreateCompanionBuilder,
          $PhdStudentUpdateCompanionBuilder,
          (
            PhdStudentData,
            BaseReferences<_$MyDriftDatabase, PhdStudent, PhdStudentData>,
          ),
          PhdStudentData,
          PrefetchHooks Function()
        > {
  $PhdStudentTableManager(_$MyDriftDatabase db, PhdStudent table)
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
                Value<int?> id = const Value.absent(),
                Value<String> cohort = const Value.absent(),
                Value<String?> managementId = const Value.absent(),
                Value<String?> admissionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<Gender> gender = const Value.absent(),
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
                Value<int?> id = const Value.absent(),
                required String cohort,
                Value<String?> managementId = const Value.absent(),
                Value<String?> admissionId = const Value.absent(),
                required String name,
                Value<Gender> gender = const Value.absent(),
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
      _$MyDriftDatabase,
      PhdStudent,
      PhdStudentData,
      $PhdStudentFilterComposer,
      $PhdStudentOrderingComposer,
      $PhdStudentAnnotationComposer,
      $PhdStudentCreateCompanionBuilder,
      $PhdStudentUpdateCompanionBuilder,
      (
        PhdStudentData,
        BaseReferences<_$MyDriftDatabase, PhdStudent, PhdStudentData>,
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
    extends Composer<_$MyDriftDatabase, DangKyGiangDay> {
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
    extends Composer<_$MyDriftDatabase, DangKyGiangDay> {
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
    extends Composer<_$MyDriftDatabase, DangKyGiangDay> {
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
          _$MyDriftDatabase,
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
              _$MyDriftDatabase,
              DangKyGiangDay,
              TeachingRegistrationData
            >,
          ),
          TeachingRegistrationData,
          PrefetchHooks Function()
        > {
  $DangKyGiangDayTableManager(_$MyDriftDatabase db, DangKyGiangDay table)
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
      _$MyDriftDatabase,
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
          _$MyDriftDatabase,
          DangKyGiangDay,
          TeachingRegistrationData
        >,
      ),
      TeachingRegistrationData,
      PrefetchHooks Function()
    >;

class $MyDriftDatabaseManager {
  final _$MyDriftDatabase _db;
  $MyDriftDatabaseManager(this._db);
  $HockyTableManager get hocky => $HockyTableManager(_db, _db.hocky);
  $HocphanTableManager get hocphan => $HocphanTableManager(_db, _db.hocphan);
  $GiangvienTableManager get giangvien =>
      $GiangvienTableManager(_db, _db.giangvien);
  $DetaithacsiTableManager get detaithacsi =>
      $DetaithacsiTableManager(_db, _db.detaithacsi);
  $PhdStudentTableManager get phdStudent =>
      $PhdStudentTableManager(_db, _db.phdStudent);
  $DangKyGiangDayTableManager get dangKyGiangDay =>
      $DangKyGiangDayTableManager(_db, _db.dangKyGiangDay);
}
