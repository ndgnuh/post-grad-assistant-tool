import 'dart:io';
import 'package:excel/excel.dart';
import 'package:pdf/pdf.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import '../services/pdf_widgets.dart' as pw;
import '../services/sqlbuilder/sqlbuilder.dart';
import '../services/database.dart';
import './domain_objects.dart';

part 'ql_de_tai.freezed.dart';
part 'ql_de_tai.g.dart';

@freezed
abstract class MasterThesisTopic with _$MasterThesisTopic {
  const MasterThesisTopic._();
  const factory MasterThesisTopic({
    required String advisor,
    required String nameVi,
    required String nameEn,
    required String note,
    String? studentName,
    String? studentCode,
  }) = _MasterThesisTopic;

  factory MasterThesisTopic.fromJson(Map<String, dynamic> json) =>
      _$MasterThesisTopicFromJson(json);
}

/// Search for master thesis topics based on a query string.
/// Returns a list of topic IDs that match the query.
FutureOr<List<int>> searchDeTai({
  required String query,
  bool? assigned,
}) async {
  if (query.isEmpty) {
    return [];
  }

  return dbSession((Database db) async {
    final topicIdQuery = SelectQuery()
      ..from("fts_DeTaiThacSi")
      ..select(["id"])
      ..where("fts_DeTaiThacSi match ?", [query]);

    final queryBuilder = SelectQuery()
      ..from("DeTaiThacSi")
      ..select(["id"])
      ..where("id in ?", [topicIdQuery]);

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

    final rows = await db.rawQuery(queryBuilder.build());
    return [for (final row in rows) row["id"] as int];
  });
}

Future<List<MasterThesisTopic>> getAllMasterTopics() async {
  return dbSession((Database db) async {
    final query = SelectQuery()
      ..from("DeTaiThacSi as A")
      ..join("ChucDanhGiangVien as B", "A.idGiangVien = B.id")
      ..select([
        "CONCAT(B.chucDanh, B.hoTen) as advisor",
        "A.tenTiengViet as nameVi",
        "A.tenTiengAnh as nameEn",
        "A.ghiChu as note"
      ])
      ..where("A.idHocVien is NULL");

    final sql = query.build();
    final rows = await db.rawQuery(sql);
    return [for (final row in rows) MasterThesisTopic.fromJson(row)];
  });
}

final _defaultCellStyle = CellStyle(
  fontFamily: "Times New Roman",
  fontSize: 10,
);

void exportXlsxAllTopic({
  required String outputFile,
}) async {
  final query = SelectQuery()
    ..from("DeTaiThacSi as A")
    ..join("ChucDanhGiangVien as B", "A.idGiangVien = B.id")
    ..select([
      "CONCAT(B.chucDanh, B.hoTen) as namegv",
      "A.tenTiengViet as namevi",
      "A.tenTiengAnh as nameen",
      "A.ghiChu as note"
    ])
    ..where("A.idHocVien is NULL");

  final rows = await dbSession((Database db) async {
    final sql = query.build();
    return await db.rawQuery(sql);
  });

  print(rows);
}

extension _CellIndex on Sheet {
  Data operator [](dynamic index) {
    switch (index) {
      case String cellIndex:
        return cell(CellIndex.indexByString(cellIndex));
      case (int row, int col):
        return cell(
          CellIndex.indexByColumnRow(
            columnIndex: col,
            rowIndex: row,
          ),
        );
      default:
        throw "Invalid cell index";
    }
  }
}

extension _CellData on Data {
  set text(String value) {
    this.value = TextCellValue(value);
  }
}

Future<void> exportDanhSachDeTaiPdf({
  required String outputPath,
  required List<DeTaiThacSi> listDeTaiThacSi,
}) async {
  final theme = await pw.defaultTheme(baseSize: 9);
  final pdf = pw.Document(theme: theme);

  final gv = [for (final dt in listDeTaiThacSi) (await dt.giangVien)];

  final page = pw.MultiPage(
    pageFormat: pw.a4Landscape(),
    margin: pw.EdgeInsets.all(0.5 * PdfPageFormat.inch),
    build: (context) {
      final header = pw.Row(children: [
        pw.EzTopHeader.fami(),
        pw.Expanded(child: pw.Text("")),
        pw.EzTopHeader.chxhcnvn(),
      ]);
      final title = pw.EzTitle(
        "DANH SÁCH ĐỀ TÀI HƯỚNG DẪN CAO HỌC",
        fontSize: 16,
      );
      final data = pw.EzTable<DeTaiThacSi>(
        padding: pw.EdgeInsets.symmetric(
          vertical: 3 * pw.pt,
          horizontal: 6 * pw.pt,
        ),
        columnWidths: {
          0: pw.IntrinsicColumnWidth(),
          1: pw.FlexColumnWidth(),
          2: pw.FlexColumnWidth(),
          3: pw.IntrinsicColumnWidth(),
        },
        alignments: {
          0: pw.Alignment.centerLeft,
          1: pw.Alignment.centerLeft,
          2: pw.Alignment.centerLeft,
          3: pw.Alignment.centerLeft,
        },
        textAligns: {
          0: pw.TextAlign.start,
          1: pw.TextAlign.justify,
          2: pw.TextAlign.justify,
          3: pw.TextAlign.start,
        },
        dataWrap: true,
        headers: [
          "Giảng viên hướng dẫn",
          "Tên đề tài (tiếng Việt)",
          "Tên đề tài (tiếng Anh)",
          "Thông tin liên hệ",
        ],
        data: listDeTaiThacSi,
        rowBuilder: (int r, dt) {
          return [
            gv[r].hoTenChucDanh,
            dt.tenTiengViet,
            dt.tenTiengAnh,
            "Email; ${gv[r].email}\nSĐT: ${gv[r].sdt}",
          ];
        },
      );
      return [
        header,
        pw.Spacer(),
        title,
        pw.Spacer(flex: 2),
        data,
      ];
    },
  );
  pdf.addPage(page);

  final outFile = File(outputPath);
  await outFile.create(recursive: true);
  await outFile.writeAsBytes(await pdf.save());
}

Future<void> exportDanhSachDeTaiExcel({
  required String outputPath,
  required List<DeTaiThacSi> listDeTaiThacSi,
}) async {
  final xlsx = Excel.createExcel();
  final sheet = xlsx.tables[xlsx.getDefaultSheet()] as Sheet;

  /// Sheet contents
  sheet["A1"].text = "Giảng viên hướng dẫn";
  sheet["B1"].text = "Tên đề tài (tiếng Việt)";
  sheet["C1"].text = "Tên đề tài (tiếng Anh)";
  for (final (r, dt) in listDeTaiThacSi.indexed) {
    final gv = await dt.giangVien;
    final n = r + 1;
    sheet[(n, 0)].text = gv.hoTenChucDanh;
    sheet[(n, 1)].text = dt.tenTiengViet;
    sheet[(n, 2)].text = dt.tenTiengAnh;
  }

  /// Sheet column widths
  sheet.setColumnAutoFit(0);
  sheet.setColumnAutoFit(1);
  sheet.setColumnAutoFit(2);

  /// Sheet style
  final boldStyle = _defaultCellStyle.copyWith(
    boldVal: true,
  );
  sheet["A1"].cellStyle = boldStyle;
  sheet["B1"].cellStyle = boldStyle;
  sheet["C1"].cellStyle = boldStyle;
  for (var i = 1; i < sheet.maxRows; i++) {
    sheet[(i, 0)].cellStyle = _defaultCellStyle;
    sheet[(i, 1)].cellStyle = _defaultCellStyle;
    sheet[(i, 2)].cellStyle = _defaultCellStyle;
  }

  final fileBytes = xlsx.save();
  final fileOutput = File(outputPath);
  await fileOutput.create(recursive: true);
  await fileOutput.writeAsBytes((fileBytes) as List<int>);
}
