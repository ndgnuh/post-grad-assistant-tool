import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart' as p;
import 'sqlbuilder/sqlbuilder.dart';

import 'dtypes.dart';
export 'dtypes.dart';

export 'package:sqflite/sqflite.dart' show openDatabase;
export 'dtypes.dart' show LopTinChi, HocPhan, GiangVien, NhomChuyenMon;

const tables = (
  dangKyHoc: "DangKyHoc",
  giangVien: "GiangVien",
  hocHam: "HocHam",
  hocKy: "HocKy",
  hocPhan: "HocPhan",
  hocVi: "HocVi",
  hocVien: "HocVien",
  hoiDongLVTS: "HoiDongLVTS",
  khoiKienThuc: "KhoiKienThuc",
  lopTinChi: "LopTinChi",
  namTaiChinh: "NamTaiChinh",
  nhomChuyenMon: "NhomChuyenMon",
  nienKhoa: "NienKhoa",
  tieuBanXetTuyen: "TieuBanXetTuyen",
  trangThaiHocVien: "TrangThaiHocVien",
);

class DbSession {
  final String dbPath;

  Future run(Future Function(Database db) effect) async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    } else {
      databaseFactory = databaseFactoryFfi;
    }
    Database db = await openDatabase(dbPath);
    return effect(db);
  }

  const DbSession({
    required this.dbPath,
  });
}

final databasePath = p.join(p.current, "fami.sqlite3");

Future<T> dbSession<T>(Future<T> Function(Database) callback,
    {bool ro = false}) async {
  final db = await openDatabase(databasePath);
  final ret = await callback(db);
  await db.close();
  return ret;
}

class Repository {
  static Future<List<TieuBanXetTuyen>> allTieuBanXetTuyen() async {
    return await dbSession((Database db) async {
      final rows = await db.query(TieuBanXetTuyen.table);
      return [for (final json in rows) TieuBanXetTuyen.fromJson(json)];
    });
  }

  static Future<List<GiangVien>> listGiangVien({
    String? searchHoTen,
    String? searchEmail,
  }) async {
    final query = SelectQuery()
      ..from(GiangVien.table)
      ..selectAll();

    if (searchHoTen != null) {
      query.where("hoTen like ?", ['%$searchHoTen%']);
    }
    if (searchEmail != null) {
      query.where("email like ?", ['%$searchEmail%']);
    }
    final sql = query.build();

    return await dbSession((db) async {
      final rows = await db.rawQuery(sql);
      return [for (final json in rows) GiangVien.fromJson(json)];
    });
  }

  static Future<GiangVien> getGiangVien({
    required int id,
  }) async {
    final query = SelectQuery()
      ..from(GiangVien.table)
      ..where("id = ?", [id])
      ..selectAll();
    final sql = query.build();
    return dbSession((Database db) async {
      final rows = await db.rawQuery(sql);
      final gvs = [
        for (final json in rows) GiangVien.fromJson(json),
      ];
      return gvs.first;
    });
  }
}

Future<List<GiangVien>> fetchGiangVien({int? id, String? hoTen}) async {
  final Database db = await openDatabase(databasePath);
  final List gvMap = await db.rawQuery("""
  SELECT * FROM GiangVien
    WHERE (? IS NULL) OR (hoTen LIKE ?)
    WHERE (? IS NULL) OR (id = ?)
  """, [hoTen, "%$hoTen%", id, id]);
  final List<GiangVien> rets = [
    for (final row in gvMap) GiangVien.fromJson(row)
  ];

  await db.close();
  return rets;
}

/// Trả về danh sách học kỳ, mỗi học kỳ là một [String].
Future<List<String>> getHocKy() async {
  var db = await openDatabase(databasePath);
  var rows = await db.query(
    "HocKy",
    columns: ["hocKy"],
    orderBy: "hocKy DESC",
  );
  var danhSachHocKy = [for (final {"hocKy": hocKy as String} in rows) hocKy];
  await db.close();
  return danhSachHocKy;
}

typedef HocPhan = ({
  int id,
  String maHocPHan,
  String tenHocPhan,
  String khoiLuong,
  int soTinChi,
});

/// Trả về danh sách học kỳ, mỗi học kỳ là một [String].
Future<List<HocPhan>> getHocPhan({String? ten}) async {
  var db = await openDatabase(databasePath);
  var rows = await db.query(
    "HocPhan",
    where: switch (ten) {
      null => null,
      String _ => "Where tenHocPhan = ?",
    },
    whereArgs: switch (ten) {
      null => null,
      String ten => [ten],
    },
  );
  var ret = [
    for (final row in rows)
      (
        id: row['id'],
        maHocPhan: row['maHocPhan'],
        tenHocPhan: row['tenHocPhan'],
        khoiLuong: row['khoiLuong'],
        soTinChi: row['soTinChi'],
      ) as HocPhan
  ];

  await db.close();
  return ret;
}

Future<List<LopTinChi>> fetchLopTinChi({
  int? id,
  String? hocKy,
  String? maLop,
  int? maHocPhan,
  int? trangThai,
  bool withHocPhan = false,
  bool withGiangVien = false,
}) async {
  var db = await openDatabase(databasePath);

  List<Map<String, Object?>> rows = await db.rawQuery("""
  SELECT * FROM LopTinChi WHERE
  (id = ? or ? IS NULL) AND
  (maLop = ? or ? IS NULL) AND
  (hocKy = ? or ? IS NULL) AND
  (maHocPhan = ? or ? IS NULL) AND
  (trangThai = ? or ? IS NULL) AND
  """, [
    id,
    id,
    "%$maLop%",
    maLop,
    hocKy,
    hocKy,
    maHocPhan,
    maHocPhan,
    trangThai,
    trangThai
  ]);

  if (withGiangVien) {
    for (var row in rows) {
      if (row['idGiangVien'] == null) {
        continue;
      }

      // Database constraint ensure that the list is not empty
      GiangVien gv = (await fetchGiangVien(id: id))[0];
      row["giangVien"] = gv;
    }
  }

  // if (withHocPhan) {
  //   for (var row in rows) {
  //     if (row['maHocPhan'] == null) {
  //       continue;
  //     }

  //     // Database constraint ensure that the list is not empty
  //     GiangVien gv = (await fetchHocPhan(id: id))[0];
  //     row["hocPhan"] = gv;
  //   }
  // }

  return [for (final json in rows) LopTinChi.fromJson(json)];
}

/// Trả về danh sách lớp tín chỉ [List<LopTinChi>], lọc theo trạng thái [trangThai],
/// kỳ học [hocKy] và học phần [idHocPhan].
Future<List<HocPhan>> getLopTinChi({
  String? hocKy,
  int? idHocPhan,
  int? trangThai,
}) async {
  var db = await openDatabase(databasePath);
  var rows = await db.query(
    "LopTinChi",
  );
  var ret = [
    for (final row in rows)
      (
        id: row['id'] as int,
        maHocPhan: row['maHocPhan'] as String,
        tenHocPhan: row['tenHocPhan'],
        khoiLuong: row['khoiLuong'],
        soTinChi: row['soTinChi'],
      ) as HocPhan
  ];

  await db.close();
  return ret;
}

Future<List<NhomChuyenMon>> fetchNhomChuyenMon() async {
  var db = await openDatabase(databasePath);
  var rows = await db.query("NhomChuyenMon");
  var ret = [for (final row in rows) NhomChuyenMon.fromJson(row)];
  await db.close();
  return ret;
}

class NienKhoa {
  String nienKhoa;
  NienKhoa(this.nienKhoa);

  static Future<List<NienKhoa>> all() async {
    final db = await openDatabase(databasePath, readOnly: true);
    final rows = await db.query(
      "NienKhoa",
      columns: ["nienKhoa"],
      orderBy: "nienKhoa DESC",
    );

    await db.close();
    return [
      for (final {
            "nienKhoa": nienKhoa as String,
          } in rows)
        NienKhoa(nienKhoa),
    ];
  }
}

class TrangThaiHocVien {
  String maTrangThai;
  String tenTrangThai;
  TrangThaiHocVien(this.maTrangThai, this.tenTrangThai);

  static Future<List<TrangThaiHocVien>> all() async {
    final db = await openDatabase(
      databasePath,
      readOnly: true,
    );
    final rows = await db.query(
      "TrangThaiHocVien",
      columns: ["maTrangThai", "tenTrangThai"],
    );

    await db.close();
    return [
      for (final {
            "maTrangThai": maTrangThai as String,
            "tenTrangThai": tenTrangThai as String,
          } in rows)
        TrangThaiHocVien(maTrangThai, tenTrangThai),
    ];
  }
}

DateTime? tryParseDate(String s, {String delim = "/"}) {
  try {
    final parts = s.split(delim);
    return DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  } on Exception {
    return null;
  }
}

DateTime? tryParseDMY(String? date, {String delim = "/"}) {
  print(date);
  switch (date) {
    case String s:
      final parts = s.split(delim);
      if (parts.length < 3) {
        return null;
      }
      final year = int.tryParse(parts[2]);
      final month = int.tryParse(parts[1]);
      final day = int.tryParse(parts[0]);
      return switch ((year, month, day)) {
        (int y, int m, int d) => DateTime(y, m, d),
        _ => null,
      };
    default:
      return null;
  }
}

String? tryFormatHumanDate(DateTime? date) {
  final valueFormat = DateFormat("dd/MM/yyyy");
  try {
    return switch (date) {
      null => null,
      DateTime d => valueFormat.format(d),
    };
  } on Exception {
    return null;
  }
}

String? toSqliteDate(DateTime? mDate) {
  return switch (mDate) {
    DateTime d => DateFormat('yyyy/MM/dd').format(d),
    null => null,
  };
}

extension DateTimeConvert on DateTime {
  String toYmd() {
    return DateFormat('yyyy/MM/dd').format(this);
  }

  String toDmy() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}

extension HocVienCrud on HocVien {
  Future<void> update(Map<String, Object?> data) async {
    await dbSession<void>((Database db) async {
      await db.update(
        "HocVien",
        data,
        where: "id = ?",
        whereArgs: [id],
      );
    });
  }

  Future<TieuBanXetTuyen?> get tieuBanXetTuyen async {
    if (idTieuBanXetTuyen == null) {
      return null;
    }
    return await dbSession<TieuBanXetTuyen>(
      (Database db) async {
        final rows = await db.query(
          "TieuBanXetTuyen",
          where: "id = ?",
          whereArgs: [idTieuBanXetTuyen],
        );
        return TieuBanXetTuyen.fromJson(rows.first);
      },
    );
  }
}

extension TieuBanXetTuyenCrud on TieuBanXetTuyen {
  Future<GiangVien> get chuTich async {
    return await Repository.getGiangVien(id: idChuTich);
  }

  Future<GiangVien> get thuKy async {
    return await Repository.getGiangVien(id: idThuKy);
  }

  Future<GiangVien> get uyVien1 async {
    return await Repository.getGiangVien(id: idUyVien1);
  }

  Future<GiangVien> get uyVien2 async {
    return await Repository.getGiangVien(id: idUyVien2);
  }

  Future<GiangVien> get uyVien3 async {
    return await Repository.getGiangVien(id: idUyVien3);
  }
}
