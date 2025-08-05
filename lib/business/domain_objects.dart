// Run
import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../services/database.dart';
import '../services/sqlbuilder/sqlbuilder.dart';

part 'domain_objects.freezed.dart';
part 'domain_objects.g.dart';

DateTime datetimeFromYyyymmdd(String dString) {
  return DateFormat('yyyy/MM/dd').parse(dString);
}

String datetimeToDdmmyyyy(DateTime d) {
  return DateFormat('dd/MM/yyyy').format(d);
}

String datetimeToYyyymmdd(DateTime d) {
  return DateFormat('yyyy/MM/dd').format(d);
}

List<T?> prependNull<T>(List<T> values) {
  return [null, for (final value in values) value];
}

/// Quote string in a double quote
String quoted(String s) {
  return '"$s"';
}

Future<void> _abstractUpdateAttr<T, S>({
  required String table,
  required String idField,
  required String attrName,
  required S id,
  required T value,
}) async {
  print(
    "Updating attribute $attrName in table $table with id $idField = $id to value: $value",
  );
  final query = UpdateQuery()
    ..update(table)
    ..set({attrName: value})
    ..where("$idField = ?", [id]);

  final sql = query.build();
  return dbSession((db) => db.rawUpdate(sql));
}

Future<List<T>> _all<T>({
  required String table,
  required T Function(Map<String, Object?>) fromJson,
}) {
  return dbSession((db) async {
    final rows = await db.query(table);
    return [for (final json in rows) fromJson(json)];
  });
}

Future<void> _create<T>({
  required String table,
  required String idField,
  required Map<String, Object?> Function() toJson,
  List<String> ignoreFields = const [],
}) async {
  final data = toJson();
  data.remove(idField);
  for (final field in ignoreFields) {
    data.remove(field);
  }
  return dbSession((db) async {
    db.insert(table, _sanitize(data));
  });
}

Future<void> _delete<T>({
  required String table,
  required String idField,
  required Map<String, Object?> Function() toJson,
}) async {
  final id = toJson()[idField];
  return dbSession((db) async {
    db.delete(table, where: "$idField = ?", whereArgs: [id]);
  });
}

Future<T> _getById<T>({
  required Object id,
  required String table,
  required String idField,
  required T Function(Map<String, Object?>) fromJson,
}) async {
  return dbSessionReadOnly((db) async {
    final rows = await db.query(table, where: "$idField = ?", whereArgs: [id]);
    return fromJson(rows.single);
  });
}

Map<String, Object?> _sanitize(Map<String, Object?> data) {
  Map<String, Object?> ret = {};
  for (final key in data.keys) {
    final value = data[key];
    switch (value) {
      case String svalue:
        ret[key] = svalue.trim();
      default:
        ret[key] = value;
    }
  }
  return ret;
}

Future<void> _update<T>({
  required String table,
  required String idField,
  required Map<String, Object?> Function() toJson,
  List<String> ignoreFields = const [],
}) async {
  final data = toJson();
  final id = data[idField];
  data.remove(idField);
  for (final field in ignoreFields) {
    data.remove(field);
  }
  return dbSession((db) async {
    db.update(table, _sanitize(data), where: "$idField = ?", whereArgs: [id]);
  });
}

typedef ClassOfYear = NienKhoa;

typedef Student = HocVien;

typedef Teacher = GiangVien;

typedef Thesis = DeTaiThacSi;

class BoolIntSerializer implements JsonConverter<bool, int?> {
  const BoolIntSerializer();

  @override
  bool fromJson(int? i) => (i != 0);
  @override
  int? toJson(bool b) => (b == true) ? 1 : 0;
}

@freezed
class DangKyHoc with _$DangKyHoc {
  static const table = "DangKyHoc";
  factory DangKyHoc({
    required int idLopTinChi,
    required int idHocVien,
    double? diemQuaTrinh,
    double? diemCuoiKy,
  }) = _DangKyHoc;
  factory DangKyHoc.fromJson(Map<String, dynamic> json) =>
      _$DangKyHocFromJson(json);

  const DangKyHoc._();

  static Future<void> create({
    required LopTinChi lopTinChi,
    required List<HocVien> listHocVien,
  }) async {
    await transaction((Transaction txn) async {
      final idLopTinChi = lopTinChi.id;
      for (final hocVien in listHocVien) {
        final idHocVien = hocVien.id;
        final query = InsertQuery()
          ..into(table)
          ..insert({"idLopTinChi": idLopTinChi, "idHocVien": idHocVien});

        final sql = query.build();
        await txn.rawInsert(sql);
      }
    });
  }
}

class DateSerializer implements JsonConverter<DateTime, String> {
  const DateSerializer();
  @override
  DateTime fromJson(String s) => datetimeFromYyyymmdd(s);
  @override
  String toJson(DateTime d) => datetimeToYyyymmdd(d);
}

@freezed
class DeTaiThacSi with _$DeTaiThacSi {
  static const table = "DeTaiThacSi";

  static const idField = "id";
  const factory DeTaiThacSi({
    int? id,
    required int idGiangVien,
    required String tenTiengViet,
    required String tenTiengAnh,
    required GiangVien giangVien,
    int? idHocVien,
    HocVien? hocVien,
    int? idChuTich,
    int? idPhanBien1,
    int? idPhanBien2,
    int? idUyVien,
    int? idThuKy,
    @MaybeDateSerializer() DateTime? ngayGiao,
    String? soQdGiao,
    @MaybeDateSerializer() DateTime? hanBaoVe,
    String? soQdBaoVe,
    @MaybeDateSerializer() DateTime? ngayBaoVe,
    @JsonKey(name: "flag_tracking")
    @Default(false)
    @BoolIntSerializer()
    bool flagTracking,
    @JsonKey(name: "flag_payment")
    @Default(false)
    @BoolIntSerializer()
    bool thanhToan,
    String? ghiChu,
    String? group,
    int? nam,
  }) = _DeTaiThacSi;

  factory DeTaiThacSi.fromJson(Map<String, dynamic> json) =>
      _$DeTaiThacSiFromJson(json);

  const DeTaiThacSi._();

  bool get assigned => idHocVien != null;

  Future<GiangVien?> get chuTich async => switch (idChuTich) {
    null => null,
    Object id => GiangVien.getById(id),
  };

  Future<GiangVien?> get phanBien1 async => switch (idPhanBien1) {
    null => null,
    Object id => GiangVien.getById(id),
  };

  Future<GiangVien?> get phanBien2 async => switch (idPhanBien2) {
    null => null,
    Object id => GiangVien.getById(id),
  };

  Future<GiangVien?> get thuKy async => switch (idThuKy) {
    null => null,
    Object id => GiangVien.getById(id),
  };

  Future<GiangVien?> get uyVien async => switch (idUyVien) {
    null => null,
    Object id => GiangVien.getById(id),
  };

  Future<void> assignStudent(HocVien? student) async {
    final query = UpdateQuery()
      ..update(table)
      ..set({"idHocVien": student?.id})
      ..where("id = ?", [id]);
    final sql = query.build();
    print(sql);
    dbSession((Database db) async {
      await db.rawUpdate(sql);
    });
  }

  /// CRUD create
  Future<void> create() async {
    dbSession((Database db) async {
      final data = toJson();
      data.remove("id"); // Remove id to let the database generate it
      data.remove("giangVien"); // Resolved field
      data.remove("hocVien"); // Resolved field
      await db.insert(table, _sanitize(data));
    });
  }

  Future<void> delete() =>
      _delete(table: table, idField: idField, toJson: toJson);
  Future<void> setAssignDecision(String value) =>
      _updateAttr("soQdGiao", value);

  Future<void> setDueDate(DateTime d) =>
      _updateAttr("hanBaoVe", datetimeToYyyymmdd(d));

  Future<void> setProtectDecision(String value) =>
      _updateAttr("soQuyetDinhBaoVe", value);

  Future<void> track() => updateTracking(true);

  Future<void> untrack() => updateTracking(false);

  Future<void> update() async {
    dbSession((Database db) async {
      final data = toJson();
      final id = data[idField];
      data.remove(idField); // Remove id to let the database update it
      data.remove("giangVien"); // Resolved field
      data.remove("hocVien"); // Resolved field
      await db.update(
        table,
        _sanitize(data),
        where: "$idField = ?",
        whereArgs: [id],
      );
    });
  }

  Future updateChuTich(int? idGiangVien) =>
      _updateAttr("idChuTich", idGiangVien);

  Future updatePhanBien1(int? idGiangVien) =>
      _updateAttr("idPhanBien1", idGiangVien);

  Future updatePhanBien2(int? idGiangVien) =>
      _updateAttr("idPhanBien2", idGiangVien);
  Future updateThuKy(int? idGiangVien) => _updateAttr("idThuKy", idGiangVien);
  // Set as tracked
  Future<void> updateTracking(bool value) async {
    await _updateAttr("flag_tracking", value ? 1 : 0);
  }

  Future updateUyVien(int? idGiangVien) => _updateAttr("idUyVien", idGiangVien);
  Future<void> _updateAttr<T>(String attrName, T value) async {
    final query = UpdateQuery()
      ..update(table)
      ..set({attrName: value})
      ..where("$idField = ?", [id]);

    final sql = query.build();
    return dbSession((db) => db.rawUpdate(sql));
  }

  static Future<DeTaiThacSi> getById(int id) async {
    return await dbSession((Database db) async {
      final rows = await db.query(
        table,
        where: "$idField = ?",
        whereArgs: [id],
      );
      if (rows.isEmpty) {
        throw Exception("DeTaiThacSi with id $id not found");
      }

      final deTaiJson = await resolveRow(rows.first);
      return DeTaiThacSi.fromJson(deTaiJson);
    });
  }

  static Future<DeTaiThacSi?> getByStudentId(int idHocVien) async {
    return dbSession((Database db) async {
      final rows = await db.query(
        table,
        where: "idHocVien = ?",
        whereArgs: [idHocVien],
      );

      if (rows.isEmpty) {
        return null;
      }

      final thesisJson = await resolveRow(rows.first);
      final thesis = DeTaiThacSi.fromJson(thesisJson);
      return thesis;
    });
  }

  static Future<Map<String, Object?>> resolveRow(
    Map<String, Object?> rowOrig,
  ) async {
    final teacher = await Teacher.getById(rowOrig["idGiangVien"] as int);
    final student = switch (rowOrig["idHocVien"]) {
      int id => await Student.getById(id),
      _ => null,
    };

    return {
      ...rowOrig,
      "giangVien": teacher.toJson(),
      "hocVien": student?.toJson(),
    };
  }

  static FutureOr<List<DeTaiThacSi>> search({
    String? searchQuery,
    bool? assigned,
    bool? tracked,
    bool? paid,
    Object? idGiangVien, // deprecated
    ClassOfYear? nienKhoa,
  }) async {
    return dbSession((Database db) async {
      final queryBuilder = SelectQuery()
        ..from("DeTaiThacSi")
        ..selectAll();

      // Additional filter if query is not empty
      if (searchQuery != null && searchQuery.trim().isNotEmpty) {
        final topicIdQuery = SelectQuery()
          ..from("fts_DeTaiThacSi")
          ..select(["id"])
          ..where("fts_DeTaiThacSi match ?", [searchQuery]);

        queryBuilder.where("id in ?", [topicIdQuery]);
      }

      /// Check if tracking
      if (tracked == true) {
        queryBuilder.where("flag_tracking = ?", [1]);
      } else if (tracked == false) {
        queryBuilder.where("flag_tracking = ?", [0]);
      }

      /// Check if paid
      if (paid == true) {
        queryBuilder.where("flag_payment = ?", [1]);
      } else if (paid == false) {
        queryBuilder.where("flag_payment = ?", [0]);
      }

      // Additional filter if class of-year is not empty
      if (nienKhoa != null) {
        final studentIdQuery = SelectQuery()
          ..from(HocVien.table)
          ..select(["id"])
          ..where("nienKhoa = ?", [nienKhoa.nienKhoa]);

        queryBuilder.where("idHocVien in ?", [studentIdQuery]);
      }

      switch (assigned) {
        case true:
          queryBuilder.where("idHocVien is not NULL");
          break;
        case false:
          queryBuilder.where("idHocVien is NULL");
          break;
        default:
          // No additional filter
          break;
      }

      final sql = queryBuilder.build();
      final rows = await db.rawQuery(sql);

      // Resolve rows
      final resolvedRows = [for (final row in rows) await resolveRow(row)];
      return [for (final json in resolvedRows) DeTaiThacSi.fromJson(json)];
    });
  }

  static Future<List<DeTaiThacSi>> search2({
    int? idGiangVien,
    String? searchQuery,
    bool assigned = false,
  }) async {
    final studentJoinMode = switch (assigned) {
      false => JoinType.left,
      true => JoinType.inner,
    };

    final query = SelectQuery()
      ..from(DeTaiThacSi.table)
      ..select(["$table.*"])
      ..join(
        HocVien.table,
        "${HocVien.table}.id = ${DeTaiThacSi.table}.idHocVien",
        studentJoinMode,
      )
      ..join(
        GiangVien.table,
        "${GiangVien.table}.id = ${DeTaiThacSi.table}.idGiangVien",
      );

    if (assigned) {
      query.where("idHocVien is not NULL");
    }

    // Conditional filter
    if (idGiangVien != null) query.where("idGiangVien = ?", [idGiangVien]);

    // Conditional filter
    if (searchQuery != null && searchQuery != "") {
      final like = "%$searchQuery%";
      query.where(
        """
        DetaiThacSi.tenTiengAnh LIKE ?
        OR DetaiThacSi.tenTiengViet LIKE ?
        OR HocVien.hoTen LIKE ?
        OR HocVien.email LIKE ?
        OR HocVien.dienThoai LIKE ?
        OR HocVien.maHocVien LIKE ?
        OR GiangVien.hoTen LIKE ?
        OR GiangVien.email LIKE ?
        OR GiangVien.sdt LIKE ?
        """,
        [like, like, like, like, like, like, like, like, like],
      );
    }

    // Actual query
    final sql = query.build();
    return dbSession((Database db) async {
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) DeTaiThacSi.fromJson(json)];
    });
  }
}

@JsonEnum(valueField: "value")
enum DienTuyenSinh {
  tichHop(value: "cn-ths", label: "Tích hợp Cử nhân - Thạc sĩ"),
  xetTuyen(value: "xt", label: "Xét tuyển");

  static const table = "DienTuyenSinh";
  final String value;
  final String label;
  const DienTuyenSinh({required this.value, required this.label});

  @override
  toString() => label;
}

@freezed
class GiangVien with _$GiangVien {
  static const table = "GiangVien";
  static const idField = "id";
  factory GiangVien({
    required int id,
    required String hoTen,
    String? maCanBo,
    String? donVi,
    String? chuyenNganh,
    GioiTinh? gioiTinh,
    HocHam? hocHam,
    HocVi? hocVi,
    int? namNhanTs,
    String? sdt,
    String? email,
    String? cccd,
    @MaybeDateSerializer() DateTime? ngaySinh,
    String? stk,
    String? nganHang,
    String? mst,
    String? note,
    int? ncm,
  }) = _GiangVien;

  factory GiangVien.fromJson(Map<String, dynamic> json) =>
      _$GiangVienFromJson(json);

  const GiangVien._();

  // Họ tên, học hàm, học vị
  String get hoTenChucDanh {
    return switch ((hocHam, hocVi)) {
      (HocHam a, HocVi b) => "${a.short} ${b.short} $hoTen",
      (HocHam a, null) => "${a.short} $hoTen",
      (null, HocVi a) => "${a.short} $hoTen",
      _ => hoTen,
    };
  }

  /// Specialized group
  Future<NhomChuyenMon?> get specializedGroup => dbSessionReadOnly((db) async {
    final query = SelectQuery()
      ..from("NhomChuyenMon")
      ..selectAll()
      ..where("id = ?", [ncm]);

    final rows = await db.rawQuery(query.build());
    if (rows.isEmpty) return null;
    return NhomChuyenMon.fromJson(rows.first);
  });

  // List of teaching courses
  Future<List<HocPhan>> get teachingCourses async {
    final courseIdQuery = SelectQuery()
      ..from("DangKyGiangDay")
      ..select(["maHocPhan"])
      ..where("idGiangVien = ?", [id]);

    final courseQuery = SelectQuery()
      ..selectAll()
      ..from(HocPhan.table)
      ..where("maHocPhan in ?", [courseIdQuery]);

    final sql = courseQuery.build();

    return dbSessionReadOnly((db) async {
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) HocPhan.fromJson(json)];
    });
  }

  // Add teaching course
  Future<void> addTeachingCourse(String courseId) async {
    final query = InsertQuery()
      ..into("DangKyGiangDay")
      ..insert({"idGiangVien": id, "maHocPhan": courseId});

    final sql = query.build();

    return dbSession((Database db) async {
      await db.rawInsert(sql);
    });
  }

  // Create new
  Future<void> create() =>
      _create(table: table, idField: idField, toJson: toJson);

  // remove teaching course
  Future<void> removeTeachingCourse(String courseId) async {
    final query = DeleteQuery()
      ..deleteFrom("DangKyGiangDay")
      ..where("idGiangVien = ? AND maHocPhan = ?", [id, courseId]);

    final sql = query.build();

    return dbSession((Database db) async {
      await db.rawDelete(sql);
    });
  }

  // Single field updating
  Future updateField<T>({required String fieldName, required T value}) async {
    return _abstractUpdateAttr(
      table: table,
      idField: idField,
      attrName: fieldName,
      id: id,
      value: value,
    );
  }

  Future updateUniversity(String universityName) async {
    return updateField(fieldName: "donVi", value: universityName);
  }

  Future updateName(String name) async {
    return updateField(fieldName: "hoTen", value: name);
  }

  Future updateStaffId(String? staffId) async {
    return updateField(fieldName: "maCanBo", value: staffId);
  }

  Future updatePhone(String? phone) async {
    return updateField(fieldName: "sdt", value: phone);
  }

  Future updateDateOfBirth(DateTime? date) async {
    final dateString = date != null ? datetimeToYyyymmdd(date) : null;
    updateField(fieldName: "ngaySinh", value: dateString);
  }

  Future updateEmail(String? email) async {
    return updateField(fieldName: "email", value: email);
  }

  Future updateGroup(int? ncm) async {
    return updateField(fieldName: "ncm", value: ncm);
  }

  Future updateGender(GioiTinh? gender) async {
    return updateField(fieldName: "gioiTinh", value: gender?.value);
  }

  Future updateTaxCode(String? taxCode) async {
    return updateField(fieldName: "mst", value: taxCode);
  }

  Future updateBankAccount(String? bankAccount) async {
    return updateField(fieldName: "stk", value: bankAccount);
  }

  Future updateBankName(String? bankName) async {
    return updateField(fieldName: "nganHang", value: bankName);
  }

  Future<void> update() =>
      _update(table: table, idField: idField, toJson: toJson);

  // Tất cả giảng viên
  static Future<List<GiangVien>> all() async {
    return dbSession((db) async {
      final rows = await db.query(table);
      return [for (final json in rows) GiangVien.fromJson(json)];
    });
  }

  static Future<List<GiangVien>> getByCourse(String courseId) async {
    final query = SelectQuery()
      ..from("DangKyGiangDay")
      ..select(["idGiangVien"])
      ..where("maHocPhan = ?", [courseId]);

    final giangVienQuery = SelectQuery()
      ..selectAll()
      ..from(table)
      ..where("id in ?", [query]);

    final sql = giangVienQuery.build();

    return dbSessionReadOnly((db) async {
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) GiangVien.fromJson(json)];
    });
  }

  // CRUDs
  static Future<GiangVien> getById(id) => _getById(
    id: id,
    table: table,
    idField: idField,
    fromJson: GiangVien.fromJson,
  );

  // Tất cả giảng viên
  static Future<List<GiangVien>> search(
    String? searchKeyword, {
    bool? isLocalStaff,
  }) async {
    final query = SelectQuery()
      ..from(table)
      ..selectAll();

    if (searchKeyword == "") return [];

    if (searchKeyword != null && searchKeyword != "") {
      if (searchKeyword.length < 3) {
        searchKeyword = searchKeyword.padRight(3, ".");
      }
      final sanitized = searchKeyword.replaceAll(".", "*").replaceAll("@", "*");
      final rowid = SelectQuery()
        ..select(["ROWID"])
        ..from("fts_GiangVien")
        ..where("fts_GiangVien MATCH ? or fts_GiangVien MATCH ?", [
          sanitized,
          quoted(searchKeyword),
        ]);
      query.where("id in ?", [rowid]);
    }

    // filter by isLocalStaff
    switch (isLocalStaff) {
      case true:
        query.where("ngoaiTruong = (?)", [0]);
      case false:
        query.where("ngoaiTruong != (?)", [1]);
      default:
      // do nothing
    }

    final sql = query.build();
    print(sql);
    return dbSessionReadOnly((db) async {
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) GiangVien.fromJson(json)];
    });
  }
}

@JsonEnum(valueField: "value")
enum GioiTinh {
  nam(value: "M", label: "Nam"),
  nu(value: "F", label: "Nữ");

  final String value;
  final String label;
  const GioiTinh({required this.value, required this.label});

  @override
  toString() => label;
}

@JsonEnum(valueField: "value")
enum HocHam {
  gs("GS", "GS.", "Giáo sư"),
  pgs("PGS", "PGS.", "Phó giáo sư");

  final String value;
  final String short;
  final String label;
  const HocHam(this.value, this.short, this.label);

  @override
  toString() => label;
}

@freezed
class HocKy with _$HocKy {
  static const table = "HocKy";
  const factory HocKy({
    required String hocKy,
    @DateSerializer() required DateTime moDangKy,
    @DateSerializer() required DateTime dongDangKy,
    @DateSerializer() required DateTime batDauHoc,
    @DateSerializer() required DateTime ketThucHoc,
    @DateSerializer() required DateTime hanNhapDiem,
  }) = _HocKy;
  factory HocKy.fromJson(Map<String, dynamic> json) => _$HocKyFromJson(json);

  const HocKy._();

  String get batDauHocDmy => datetimeToDdmmyyyy(batDauHoc);

  String get dongDangKyDmy => datetimeToDdmmyyyy(dongDangKy);
  String get hanNhapDiemDmy => datetimeToDdmmyyyy(hanNhapDiem);
  DateTime get hanNopDiem => hanNhapDiem.add(Duration(days: -7));
  String get hanNopDiemDmy => datetimeToDdmmyyyy(hanNopDiem);
  String get ketThucHocDmy => datetimeToDdmmyyyy(ketThucHoc);
  String get moDangKyDmy => datetimeToDdmmyyyy(moDangKy);

  String get namHoc {
    final (yearStart, yearEnd) = yearStartEnd;
    return "$yearStart-$yearEnd";
  }

  String get thoiGianHoc {
    final a = datetimeToDdmmyyyy(batDauHoc);
    final b = datetimeToDdmmyyyy(ketThucHoc);
    return "$a - $b";
  }

  (int, int) get yearStartEnd {
    final yearStart = int.parse(hocKy.substring(0, 4));
    final yearEnd = yearStart + 1;
    return (yearStart, yearEnd);
  }

  Future<void> delete() async {
    final query = DeleteQuery()
      ..deleteFrom(table)
      ..where("hocKy = ?", [hocKy]);

    final sql = query.build();
    await dbSession((Database db) async {
      await db.rawDelete(sql);
    });
  }

  @override
  String toString() => hocKy;

  Future<HocKy> update({
    DateTime? moDangKy,
    DateTime? dongDangKy,
    DateTime? batDauHoc,
    DateTime? ketThucHoc,
    DateTime? hanNhapDiem,
  }) async {
    final format = DateFormat('yyyy/MM/dd');
    final data = {
      "moDangKy": format.format(moDangKy ?? this.moDangKy),
      "dongDangKy": format.format(dongDangKy ?? this.dongDangKy),
      "batDauHoc": format.format(batDauHoc ?? this.batDauHoc),
      "ketThucHoc": format.format(ketThucHoc ?? this.ketThucHoc),
      "hanNhapDiem": format.format(hanNhapDiem ?? this.hanNhapDiem),
    };

    final query = UpdateQuery()
      ..update(table)
      ..set(data)
      ..where("hocKy = ?", [hocKy]);

    final sql = query.build();

    await dbSession((Database db) async {
      await db.rawUpdate(sql);
    });

    return copyWith(
      moDangKy: moDangKy ?? this.moDangKy,
      dongDangKy: dongDangKy ?? this.dongDangKy,
      batDauHoc: batDauHoc ?? this.batDauHoc,
      ketThucHoc: ketThucHoc ?? this.ketThucHoc,
      hanNhapDiem: hanNhapDiem ?? this.hanNhapDiem,
    );
  }

  static Future<List<HocKy>> all() async {
    return dbSession((Database db) async {
      final rows = await db.query(table, orderBy: "hocKy DESC");
      return [for (final json in rows) HocKy.fromJson(json)];
    });
  }

  static Future<HocKy> create({
    required String hocKy,
    required DateTime moDangKy,
    required DateTime dongDangKy,
    required DateTime batDauHoc,
    required DateTime ketThucHoc,
    required DateTime hanNhapDiem,
  }) async {
    final data = {
      "hocKy": hocKy,
      "moDangKy": datetimeToYyyymmdd(moDangKy),
      "dongDangKy": datetimeToYyyymmdd(dongDangKy),
      "batDauHoc": datetimeToYyyymmdd(batDauHoc),
      "ketThucHoc": datetimeToYyyymmdd(ketThucHoc),
      "hanNhapDiem": datetimeToYyyymmdd(hanNhapDiem),
    };
    final query = InsertQuery()
      ..into(table)
      ..insert(data);

    final sql = query.build();

    await dbSession((Database db) async {
      await db.rawInsert(sql);
    });
    return HocKy.fromJson(data);
  }

  static Future<HocKy> getClosest() async {
    final listAcademicYears = await HocKy.all();
    final now = DateTime.now();
    var dayDiff = Duration(days: 99999999999);
    var closest = listAcademicYears.first;

    for (final year in listAcademicYears) {
      final diff = year.batDauHoc.difference(now).abs();
      if (diff < dayDiff) {
        dayDiff = diff;
        closest = year;
      }
    }

    return closest;
  }

  static FutureOr<List<HocKy>> search({required String searchQuery}) async {
    if (searchQuery.trim().isEmpty) {
      return [];
    }

    final query = SelectQuery()
      ..from(table)
      ..selectAll();

    query.where("hocKy LIKE ?", ["%$searchQuery%"]);

    final sql = query.build();
    print(sql);
    return dbSessionReadOnly((Database db) async {
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) HocKy.fromJson(json)];
    });
  }
}

@freezed
class HocPhan with _$HocPhan {
  static const table = "HocPhan";
  static const idField = "maHocPhan";
  const factory HocPhan({
    required String maHocPhan,
    required String tenTiengViet,
    required String tenTiengAnh,
    required int soTinChi,
    required KhoiKienThuc khoiKienThuc,
    required String khoiLuong,
  }) = _HocPhan;
  factory HocPhan.fromJson(Map<String, dynamic> json) =>
      _$HocPhanFromJson(json);

  const HocPhan._();

  /// List of teachers that teach this course.
  /// Returns a [Future<List<GiangVien>>] objects.
  Future<List<GiangVien>> get teachingStaffs async {
    final teacherIdQuery = SelectQuery()
      ..from("DangKyGiangDay")
      ..select(["idGiangVien"])
      ..where("maHocPhan = ?", [maHocPhan]);

    final teacherQuery = SelectQuery()
      ..selectAll()
      ..from(GiangVien.table)
      ..where("id in ?", [teacherIdQuery]);

    final sql = teacherQuery.build();

    return dbSessionReadOnly((db) async {
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) GiangVien.fromJson(json)];
    });
  }

  /// Assign a teacher to this course.
  /// Return a [bool] to indicate success or failure.
  Future<bool> addTeachingStaff(int teacherId) async {
    final query = InsertQuery()
      ..into("DangKyGiangDay")
      ..insert({"maHocPhan": maHocPhan, "idGiangVien": teacherId});

    final sql = query.build();

    return dbSession((Database db) async {
      try {
        await db.rawInsert(sql);
        return true;
      } catch (e) {
        print("Error assigning teacher: $e");
        return false;
      }
    });
  }

  /// Remove a teacher from teaching this course.
  Future<bool> removeTeachingStaff(int teacherId) async {
    final query = DeleteQuery()
      ..deleteFrom("DangKyGiangDay")
      ..where("maHocPhan = ? AND idGiangVien = ?", [maHocPhan, teacherId]);

    final sql = query.build();

    return dbSession((Database db) async {
      try {
        await db.rawDelete(sql);
        return true;
      } catch (e) {
        print("Error removing teacher: $e");
        return false;
      }
    });
  }

  @override
  toString() => "$maHocPhan $tenTiengViet $khoiLuong";

  static Future<List<HocPhan>> all() =>
      _all(table: table, fromJson: HocPhan.fromJson);

  static Future<HocPhan> getById(String id) => _getById(
    id: id,
    table: table,
    idField: idField,
    fromJson: HocPhan.fromJson,
  );

  static Future<List<HocPhan>> search(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    return await dbSessionReadOnly((Database db) async {
      final ftsQuery = SelectQuery()
        ..from("fts_HocPhan")
        ..select(["maHocPhan"])
        ..where("fts_HocPhan MATCH ?", [query]);

      final hpQuery = SelectQuery()
        ..selectAll()
        ..from("HocPhan")
        ..where("maHocPhan in ?", [ftsQuery]);

      final sql = hpQuery.build();
      final rows = await db.rawQuery(sql);
      return <HocPhan>[for (final json in rows) HocPhan.fromJson(json)];
    });
  }
}

@JsonEnum(valueField: "value")
enum HocVi {
  kySu('KS', "KS.", 'Kỹ sư'),
  thacSi('ThS', "ThS.", 'Thạc sĩ'),
  tienSi('TS', "TS.", 'Tiến sĩ'),
  tienSiKhoaHoc('TSKH', "TSKH.", 'Tiến sĩ khoa học');

  final String value;
  final String short;
  final String label;
  const HocVi(this.value, this.short, this.label);

  @override
  toString() => label;
}

@freezed
class HocVien with _$HocVien {
  static const table = "HocVien";
  static const idField = "id";

  const factory HocVien({
    required int id,
    String? soHoSo,
    String? nienKhoa,
    String? maHocVien,
    required String hoTen,
    @MaybeDateSerializer() DateTime? ngaySinh,
    GioiTinh? gioiTinh,
    String? noiSinh,
    String? email,
    String? emailHust,
    String? truongTotNghiepDaiHoc,
    String? nganhTotNghiepDaiHoc,
    String? heTotNghiepDaiHoc,
    String? xepLoaiTotNghiepDaiHoc,
    @MaybeDateSerializer() DateTime? ngayTotNghiepDaiHoc,
    String? dinhHuongChuyenSau,
    String? hocPhanDuocMien,
    String? nganhDaoTaoThacSi,
    String? dienThoai,
    required TrangThaiHocVien maTrangThai,
    String? deTaiLuanVanTiengViet,
    String? deTaiLuanVanTiengAnh,
    @MaybeDateSerializer() DateTime? ngayGiaoDeTai,
    String? soQuyetDinhGiao,
    @MaybeDateSerializer() DateTime? ngayBaoVe,
    int? soQuyetDinhBaoVe,
    @MaybeDateSerializer() DateTime? ngayKyQuyetDinhBaoVe,
    int? idGiangVienHuongDan,
    @MaybeDateSerializer() DateTime? hanBaoVe,
    @Default(0) int lanGiaHan,
    int? idTieuBanXetTuyen,
    DienTuyenSinh? idDienTuyenSinh,
    @Default(0) int thanhToanXetTuyen,
  }) = _HocVien;
  factory HocVien.fromJson(Map<String, dynamic> json) =>
      _$HocVienFromJson(json);

  const HocVien._();
  // We left these field in the constructor
  // so that it maps nicely to the database.
  DienTuyenSinh? get dienTuyenSinh => idDienTuyenSinh;

  TrangThaiHocVien? get trangThai => maTrangThai;

  Future<void> create() =>
      _create(table: HocVien.table, idField: "id", toJson: toJson);

  Future<void> delete() =>
      _delete(table: HocVien.table, idField: "id", toJson: toJson);

  Future<void> update() =>
      _update(table: HocVien.table, idField: "id", toJson: toJson);

  Future<void> updateAttribute<T, int>(String attr, T value) =>
      _abstractUpdateAttr(
        table: table,
        idField: "id",
        id: id,
        attrName: attr,
        value: value,
      );

  Future<void> updatePhoneNumber(String value) =>
      updateAttribute("dienThoai", value);

  Future<void> updatePrivateEmail(String value) =>
      updateAttribute("email", value);

  Future<void> updateStudentEmail(String value) =>
      updateAttribute("emailHust", value);

  Future<void> updateStudentId(String value) =>
      updateAttribute("maHocVien", value);

  static Future<List<HocVien>> all() =>
      _all(table: table, fromJson: HocVien.fromJson);
  static Future<List<HocVien>> getAdmissionList() async {
    final query = SelectQuery()
      ..from(table)
      ..selectAll()
      ..where("maTrangThai = ?", [TrangThaiHocVien.xetTuyen.value])
      ..orderBy(["soHoSo"]);

    final sql = query.build();

    return dbSessionReadOnly((Database db) async {
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) HocVien.fromJson(json)];
    });
  }

  static Future<List<HocVien>> getByClassOfYear(NienKhoa? nienKhoa) {
    return dbSession((Database db) async {
      final query = SelectQuery()
        ..from(table)
        ..where("nienKhoa = ?", [nienKhoa?.nienKhoa])
        ..selectAll();

      final sql = query.build();
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) HocVien.fromJson(json)];
    });
  }

  static Future<HocVien> getById(int id) => _getById(
    id: id,
    table: table,
    idField: idField,
    fromJson: HocVien.fromJson,
  );
  static Future<HocVien> getByMaHocVien(String maHocVien) {
    return _getById(
      id: maHocVien,
      table: table,
      idField: "maHocVien",
      fromJson: HocVien.fromJson,
    );
  }

  static FutureOr<List<HocVien>> search({
    String? searchQuery,
    ClassOfYear? classOfYear,
  }) {
    final emptySearch = searchQuery == null || searchQuery.trim().isEmpty;
    final emptyClassOfYear = classOfYear == null;
    if (emptySearch && emptyClassOfYear) {
      return const <HocVien>[];
    }

    final query = SelectQuery()
      ..from(table)
      ..selectAll();

    /// Conditional filter for search query
    if (!emptySearch) {
      final query1 = SelectQuery()
        ..from("fts_HocVien")
        ..select(["maHocVien"])
        ..where("fts_HocVien MATCH ?", [searchQuery]);

      query.where("maHocVien in ?", [query1]);
    }

    /// Conditional filter for class of year
    if (!emptyClassOfYear) {
      query.where("nienKhoa = ?", [classOfYear.nienKhoa]);
    }

    final sql = query.build();

    return dbSessionReadOnly((Database db) async {
      final rows = await db.rawQuery(sql);

      return [for (final json in rows) HocVien.fromJson(json)];
    });
  }
}

@freezed
class HoiDongLVTS with _$HoiDongLVTS {
  static const table = "HoiDongLVTS";
  const factory HoiDongLVTS({
    required int id,
    int? idHocVien,
    int? idChuTich,
    int? idThuKy,
    int? idPhanBien1,
    int? idPhanBien2,
    int? idUyVien,
    String? ngayBaoVe,
    String? soQuyetDinh,
    @Default(1) int lanBaoVe,
    @Default(0) int thanhToan,
    String? nam,
  }) = _HoiDongLVTS;

  factory HoiDongLVTS.fromJson(Map<String, dynamic> json) =>
      _$HoiDongLVTSFromJson(json);
}

@JsonEnum(valueField: "value")
enum KhoiKienThuc {
  khac('khac', 'Khác'),
  cn('cn', 'Cử nhân'),
  daiCuongThs('dc-ths', 'Đại cương'),
  nganhRong('nganh-rong', 'Kiến thức ngành (rộng)'),
  nganhNangCao('nganh-nangcao', 'Kiến thức ngành (nâng cao)'),
  tuChonBatBuoc('tc-batbuoc', 'Tự chọn bắt buộc'),
  tcChonTuDo('tc-tudo', 'Tự chọn tự do');

  static const String table = "KhoiKienThuc";
  final String value;
  final String label;
  const KhoiKienThuc(this.value, this.label);

  @override
  toString() => label;
}

@freezed
class LopTinChi with _$LopTinChi {
  static const table = "LopTinChi";
  const factory LopTinChi({
    required int id,
    String? maLopHoc,
    required String maHocPhan,
    int? soLuongDangKy,
    @Deprecated("Chuyển sang dùng bảng phân công dạy") int? idGiangVien,
    int? idLopTruong,
    String? urlTruyCap,
    String? hocKy,
    String? phongHoc,
    NgayTrongTuan? ngayHoc,
    int? tietBatDau,
    int? tietKetThuc,
    DateTime? customBeginDate,
    DateTime? customEndDate,
    @Default(TrangThaiLopTinChi.binhThuong) TrangThaiLopTinChi trangThai,
  }) = _LopTinChi;
  factory LopTinChi.fromJson(Map<String, dynamic> json) =>
      _$LopTinChiFromJson(json);

  const LopTinChi._();

  Future<GiangVien?> get giangVien async {
    if (idGiangVien == null) {
      return null;
    }
    return dbSession((db) async {
      final rows = await db.query(
        GiangVien.table,
        where: "id = ?",
        whereArgs: [idGiangVien],
      );
      return GiangVien.fromJson(rows[0]);
    });
  }

  Future<HocKy> get hocKyObject async {
    return dbSession((db) async {
      final rows = await db.query(
        HocKy.table,
        where: "hocKy = ?",
        whereArgs: [hocKy],
      );
      return HocKy.fromJson(rows[0]);
    });
  }

  // Lấy mã học phần
  Future<HocPhan> get hocPhan async => HocPhan.getById(maHocPhan);

  Future<int> get soLuongHocVien async {
    return await dbSession((db) async {
      final query = SelectQuery()
        ..select(["COUNT(idHocVien) as count"])
        ..from(DangKyHoc.table)
        ..where("idLopTinChi = ?", [id]);
      final sql = query.build();
      final rows = await db.rawQuery(sql);
      return rows.first["count"] as int;
    });
  }

  Future<String> get tenLopHoc async {
    final hp = await hocPhan;
    return maLopHoc?.replaceFirst(hp.maHocPhan, hp.tenTiengViet) ?? "";
  }

  Future<void> create() =>
      _create(table: LopTinChi.table, idField: "id", toJson: toJson);

  Future<void> update() =>
      _update(table: LopTinChi.table, idField: "id", toJson: toJson);

  Future<void> updateAccessUrl(String url) => _updateAttr("urlTruyCap", url);
  Future<void> updateClassCode(String classCode) =>
      _updateAttr("maLopHoc", classCode);

  Future<void> updateCustomBeginDate(DateTime? date) =>
      _updateAttr("customBeginDate", date);

  Future<void> updateCustomEndDate(DateTime? date) =>
      _updateAttr("customEndDate", date);
  Future<void> updateDayOfWeek(NgayTrongTuan weekday) =>
      _updateAttr("ngayHoc", weekday.value);

  Future<void> updateEndTime(int endTime) =>
      _updateAttr("tietKetThuc", endTime);

  Future<void> updateNumRegistered(int numRegistered) =>
      _updateAttr("soLuongDangKy", numRegistered);

  Future<void> updateRoom(String room) => _updateAttr("phongHoc", room);

  Future<void> updateStartTime(int startTime) =>
      _updateAttr("tietBatDau", startTime);

  Future<void> updateStatus(TrangThaiLopTinChi status) =>
      _updateAttr("trangThai", status.value);

  Future<void> updateTeacher(int teacherId) =>
      _updateAttr("idGiangVien", teacherId);

  Future<void> _updateAttr<T>(String attr, T value) =>
      _abstractUpdateAttr<T, int>(
        table: table,
        idField: "id",
        id: id,
        attrName: attr,
        value: value,
      );

  static Future<bool> createMultiples(List<LopTinChi> classes) async {
    final allRows = [
      for (final courseClass in classes) courseClass.toJson()..remove("id"),
    ];
    final query = InsertQuery()
      ..into(table)
      ..insertAll(allRows);
    final sql = query.build();
    return dbSession((Database db) async {
      try {
        await db.rawInsert(sql);
        return true;
      } catch (e) {
        print("Error creating new class: $e");
        return false;
      }
    });
  }

  static Future<LopTinChi> getById(int id) => _getById(
    id: id,
    table: table,
    idField: "id",
    fromJson: LopTinChi.fromJson,
  );

  static Future<LopTinChi?> getByMaLop(String maLopHoc) => _getById(
    id: maLopHoc,
    table: table,
    idField: "maLopHoc",
    fromJson: LopTinChi.fromJson,
  );

  static Future<List<LopTinChi>> getBySemester(HocKy semester) async {
    final query = SelectQuery()
      ..from(table)
      ..selectAll()
      ..where("hocKy = ?", [semester.hocKy]);

    final sql = query.build();
    return dbSessionReadOnly((db) async {
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) LopTinChi.fromJson(json)];
    });
  }
}

class MaybeDateSerializer implements JsonConverter<DateTime?, String?> {
  const MaybeDateSerializer();

  @override
  DateTime? fromJson(String? inputString) {
    switch (inputString) {
      case String dString:
        try {
          return DateFormat('yyyy/MM/dd').parse(dString);
        } on Exception {
          return null;
        }
      default:
        return null;
    }
  }

  @override
  String? toJson(DateTime? date) {
    switch (date) {
      case DateTime d:
        return DateFormat('yyyy/MM/dd').format(d);
      default:
        return null;
    }
  }
}

@freezed
class NamTaiChinh with _$NamTaiChinh {
  static const table = "NamTaiChinh";
  const factory NamTaiChinh({
    required String nam,
    required int tienChuTichLVTS,
    required int tienThuKyLVTS,
    required int tienUyVienLVTS,
    required int tienPhanBienLVTS,
    required int tienChuTichXT,
    required int tienThuKyXT,
    required int tienUyVienXT,
    required int tienChuTichDCNCS,
    required int tienThuKyDCNCS,
  }) = _NamTaiChinh;

  factory NamTaiChinh.fromJson(Map<String, dynamic> json) =>
      _$NamTaiChinhFromJson(json);
}

@JsonEnum(valueField: "value")
enum NgayTrongTuan {
  t2(2, 'Thứ 2'),
  t3(3, 'Thứ 3'),
  t4(4, 'Thứ 4'),
  t5(5, 'Thứ 5'),
  t6(6, 'Thứ 6'),
  t7(7, 'Thứ 7');

  final int value;
  final String label;
  const NgayTrongTuan(this.value, this.label);
  @override
  toString() => label;

  static NgayTrongTuan? fromInt(int? i) {
    return switch (i) {
      2 => t2,
      3 => t3,
      4 => t4,
      5 => t5,
      6 => t6,
      7 => t7,
      _ => null,
    };
  }
}

@freezed
class NhomChuyenMon with _$NhomChuyenMon {
  static const table = "NhomChuyenMon";
  const factory NhomChuyenMon({required int id, required String tenNhom}) =
      _NhomChuyenMon;

  factory NhomChuyenMon.fromJson(Map<String, dynamic> json) =>
      _$NhomChuyenMonFromJson(json);
}

@freezed
class NienKhoa with _$NienKhoa {
  static const table = "NienKhoa";
  const factory NienKhoa({required String nienKhoa}) = _NienKhoa;

  factory NienKhoa.fromJson(Map<String, dynamic> json) =>
      _$NienKhoaFromJson(json);

  static Future<List<NienKhoa>> all() async {
    return dbSession((db) async {
      final rows = await db.query(table, orderBy: "nienKhoa DESC");
      return [for (final json in rows) NienKhoa.fromJson(json)];
    });
  }

  static Future<List<NienKhoa>> search(String? nienKhoa) async {
    if (nienKhoa == null || nienKhoa.isEmpty) {
      return [];
    }
    return dbSession((db) async {
      final rows = await db.query(
        table,
        where: "nienKhoa like ?",
        whereArgs: ["%$nienKhoa%"],
      );
      return [for (final json in rows) NienKhoa.fromJson(json)];
    });
  }
}

/// Unused class, should I remove this
@freezed
abstract class TeachingRegistration with _$TeachingRegistration {
  static const table = "DangKyGiangDay";
  static const idField = "id";

  const factory TeachingRegistration({
    @JsonKey(name: "idGiangVien") required int teacherId,
    @JsonKey(name: "maHocPhan") required String courseId,
  }) = _TeachingRegistration;

  factory TeachingRegistration.fromJson(Map<String, dynamic> json) =>
      _$TeachingRegistrationFromJson(json);
}

@freezed
class TieuBanXetTuyen with _$TieuBanXetTuyen {
  static const table = "TieuBanXetTuyen";
  const factory TieuBanXetTuyen({
    required int id,
    required String nam,
    required int idChuTich,
    required int idThuKy,
    required int idUyVien1,
    required int idUyVien2,
    required int idUyVien3,
  }) = _TieuBanXetTuyen;
  factory TieuBanXetTuyen.fromJson(Map<String, dynamic> json) =>
      _$TieuBanXetTuyenFromJson(json);

  const TieuBanXetTuyen._();

  Future<GiangVien> get chuTich async {
    return await GiangVien.getById(idChuTich);
  }

  Future<GiangVien> get thuKy async {
    return await GiangVien.getById(idThuKy);
  }

  Future<GiangVien> get uyVien1 async {
    return await GiangVien.getById(idUyVien1);
  }

  Future<GiangVien> get uyVien2 async {
    return await GiangVien.getById(idUyVien2);
  }

  Future<GiangVien> get uyVien3 async {
    return await GiangVien.getById(idUyVien3);
  }

  @override
  String toString() => "Tiểu ban xét tuyển năm $nam";

  static Future<List<TieuBanXetTuyen>> all() async {
    return dbSession((db) async {
      final rows = await db.query(table, orderBy: "nam DESC");
      return [for (final json in rows) TieuBanXetTuyen.fromJson(json)];
    });
  }

  static Future<TieuBanXetTuyen?> getById(id) async {
    return dbSession((db) async {
      final rows = await db.query(table, where: "id = ?", whereArgs: [id]);
      if (rows.isEmpty) {
        return null;
      } else {
        final json = rows.single;
        return TieuBanXetTuyen.fromJson(json);
      }
    });
  }
}

@JsonEnum(valueField: "value")
enum TrangThaiHocVien {
  xetTuyen('xt', 'Xét tuyển'),
  dangHoc('hoc', 'Đang học'),
  nghiHoc('nghi', 'Thôi học'),
  totNghiep('tn', 'Đã tốt nghiệp');

  final String value;
  final String label;
  const TrangThaiHocVien(this.value, this.label);

  @override
  toString() => label;
}

@JsonEnum(valueField: "value")
enum TrangThaiLopTinChi {
  huy(1),
  binhThuong(0);

  final int value;
  const TrangThaiLopTinChi(this.value);

  @override
  toString() => switch (this) {
    TrangThaiLopTinChi.huy => "Hủy",
    TrangThaiLopTinChi.binhThuong => "Bình thường",
  };
}

enum VaiTroHoiDong {
  chuTich('chu-tich', 'Chủ tịch'),
  phanBien('phan-bien', 'Phản biện'),
  thuKy('thu-ky', 'Thư ký'),
  uyVien('uy-vien', 'Ủy viên'),
  phucVu('phuc-vu', 'Người phục vụ');

  final String value;
  final String label;
  const VaiTroHoiDong(this.value, this.label);
}
