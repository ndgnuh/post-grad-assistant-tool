import 'dart:io' show File;

export 'domain_objects.dart';
import 'domain_objects.dart';

import '../services/database.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

Future<bool> importFromBangDiem(
  String filename,
  HocKy hocKy,
) async {
  final excelFile = File(filename);
  final xlsx = SpreadsheetDecoder.decodeBytes(
    await excelFile.readAsBytes(),
  );

  // Extract from xlsx file
  Map<String, List<String>> classes = {};
  final startRow = 12;
  for (final classId in xlsx.tables.keys) {
    final sheet = xlsx.tables[classId] as SpreadsheetTable;
    final listMaHocVien = <String>[];
    for (int rowNr = startRow; rowNr < sheet.maxRows; rowNr++) {
      final row = sheet.rows[rowNr];
      final maHv = row[1];
      switch (maHv) {
        case String value:
          listMaHocVien.add(value);
        default:
          break;
      }
    }
    classes[classId] = listMaHocVien;
  }

  // Insert
  await transaction((txn) async {
    final idHocKy = hocKy.hocKy;
    for (final maLopHoc in xlsx.tables.keys) {
      final maHocPhan = maLopHoc.split("-")[0];
      // insert class
      final query = InsertQuery()
        ..into(LopTinChi.table)
        ..insert({
          "maLopHoc": maLopHoc,
          "maHocPhan": maHocPhan,
          "hocKy": idHocKy,
        });
      await txn.rawInsert(query.build());

      // Query id Lop
      final queryIdLop = SelectQuery()
        ..from(LopTinChi.table)
        ..select(["id"])
        ..where("maLopHoc = ?", [maLopHoc]);
      final rows1 = await txn.rawQuery(queryIdLop.build());
      final idLopTinChi = rows1.first["id"];

      // Register
      final listMaHocVien = classes[maLopHoc] as List;
      for (final maHocVien in listMaHocVien) {
        // get student id
        final queryHocVienId = SelectQuery()
          ..from(HocVien.table)
          ..select([HocVien.idField])
          ..where("maHocVien = ?", [maHocVien]);
        final rows2 = await txn.rawQuery(queryHocVienId.build());
        final idHocVien = rows2.first[HocVien.idField];

        // register student
        final registerQuery = InsertQuery()
          ..into(DangKyHoc.table)
          ..insert({
            "idLopTinChi": idLopTinChi,
            "idHocVien": idHocVien,
          });
        final sql = registerQuery.build();
        await txn.rawInsert(sql);
      }
    }
  });
  return true;

  // Lop tin chi
  // test student ID
  // get new
}

Future<List<HocKy>> listHocKy() async {
  return dbSession((db) async {
    final rows = await db.query(HocKy.table);
    return [for (final json in rows) HocKy.fromJson(json)];
  });
}

Future<List<HocPhan>> listHocPhan() async {
  return dbSession((db) async {
    final rows = await db.query(HocPhan.table);
    return [for (final json in rows) HocPhan.fromJson(json)];
  });
}

Future<List<GiangVien>> listGiangVien() async {
  return dbSession((db) async {
    final rows = await db.query(GiangVien.table);
    return [for (final json in rows) GiangVien.fromJson(json)];
  });
}

/// Tạo thông báo lớp học + url
/// để gửi cho học viên.
Future<String> makeNotificationText({
  required List<LopTinChi> listLopTinChi,
}) async {
  final rows = <String>[];
  int count = 1;
  for (final (idx, lop) in listLopTinChi.indexed) {
    final stt = count.toString();
    final tenLop = await lop.tenLopHoc;
    final url = lop.urlTruyCap;
    if (url != null) {
      count = count + 1;
      rows.add("$stt. $tenLop: $url");
    }
  }
  return rows.join("\n");
}

/// Copy thông tin lớp tín chỉ để có thể paste vào các
/// chương trình bảng tính, nội dung copy giống trong
/// biểu mẫu đăng ký phân công giảng dạy
Future<String> makeBm09String({
  required HocKy hocKy,
  required List<LopTinChi> listLopTinChi,
}) async {
  final rows = <List<String>>[];

  // Ngày học
  final tuNgay = datetimeToDdmmyyyy(hocKy.batDauHoc);
  final denNgay = datetimeToDdmmyyyy(hocKy.ketThucHoc);
  final tuNgayDenNgay = "=\"$tuNgay\" & CHAR(10) & \"$denNgay\"";

  for (final (idx, lop) in listLopTinChi.indexed) {
    final gv = await lop.giangVien;
    final hp = await lop.hocPhan;
    final stt = idx + 1;
    final huy = lop.trangThai == TrangThaiLopTinChi.huy;
    final tenLop = lop.maLopHoc?.replaceFirst(hp.maHocPhan, hp.tenTiengViet);
    final tietBd = lop.tietBatDau?.toString().padLeft(2, "0");
    final tietKt = lop.tietKetThuc?.toString().padLeft(2, "0");
    final tietHoc = switch ((tietBd, tietKt)) {
      (String a, String b) => "=\"$a-$b\"",
      _ => "",
    };
    final sdt = "=\"${gv?.sdt}\"";

    List<String> row = [
      stt.toString(),
      lop.maLopHoc ?? "",
      hp.soTinChi.toString(),
      tenLop ?? "",
      huy ? "" : (lop.ngayHoc?.value.toString() ?? ""),
      huy ? "" : tietHoc,
      huy ? "" : tuNgayDenNgay,
      huy ? "" : lop.phongHoc ?? "",
      huy ? "" : gv?.hoTenChucDanh ?? "N/A",
      huy ? "" : "ĐHBKHN",
      huy ? "" : sdt,
      huy ? "Hủy" : "",
    ];

    rows.add(row);
  }

  // Convert to CSV
  final csv = [for (final row in rows) row.join("\t")].join("\n");
  // final file = File("/tmp/data.csv");
  // String csv = ListToCsvConverter().convert(
  //   rows,
  //   eol: "\r",
  //   fieldDelimiter: "\t",
  // );
  // await file.writeAsString(csv);
  return csv;
}

/// Trả về danh sách lớp tín chỉ [List<LopTinChi>], lọc theo trạng thái [trangThai],
/// kỳ học [hocKy] và học phần [idHocPhan].
Future<List<LopTinChi>> getLopTinChi({
  HocKy? hocKy,
  HocPhan? hocPhan,
  TrangThaiLopTinChi? trangThai,
}) async {
  final query = SelectQuery()
    ..from(LopTinChi.table)
    ..selectAll();

  if (hocKy != null) query.where("hocKy = ?", [hocKy.hocKy]);
  if (hocPhan != null) query.where("maHocPhan = ?", [hocPhan.maHocPhan]);
  if (trangThai != null) query.where("trangThai = ?", [trangThai.value]);

  final sql = query.build();
  return dbSession((db) async {
    var rows = await db.rawQuery(sql);
    return [for (final json in rows) LopTinChi.fromJson(json)];
  });
}
