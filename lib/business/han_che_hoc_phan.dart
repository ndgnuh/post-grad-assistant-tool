import '../datamodels.dart' show dbSession;
import '../services/sqlbuilder/sqlbuilder.dart';
import '../services/pdf_widgets.dart' as pw;
import 'dart:typed_data';
import 'dart:io';

import 'domain_objects.dart';
export 'domain_objects.dart' show HocPhan, KhoiKienThuc;

extension _Query on HocPhan {
  Future<String> get tenKhoiKienThuc async {
    final query = SelectQuery()
      ..from(KhoiKienThuc.table)
      ..select(["tenKhoiKienThuc"])
      ..where("khoiKienThuc = ?", [khoiKienThuc.value]);

    final sql = query.build();
    return dbSession((db) async {
      final rows = await db.rawQuery(sql);
      return rows[0]["tenKhoiKienThuc"].toString();
    });
  }
}

Future<List<HocPhan>> searchHocPhan({String? keyword = ""}) async {
  final query = SelectQuery()
    ..from(HocPhan.table)
    ..selectAll()
    ..where("khoiKienThuc not in ('khac', 'cn', 'dc-ths')");

  print(keyword);
  if (keyword != null && keyword != "") {
    final like = "%$keyword%";
    query.where(
        "maHocPhan like ? OR tenTiengAnh like ? or tenTiengViet like ? ",
        [like, like, like]);
  }

  final sql = query.build();
  print(sql);

  return dbSession((db) async {
    final rows = await db.rawQuery(sql);
    return [for (final json in rows) HocPhan.fromJson(json)];
  });
}

Future<Uint8List> createPdf({
  required List<HocPhan> listHocPhan,
  required String hocKy,
}) async {
  final pdf = pw.Document(
    theme: await pw.defaultTheme(
      baseSize: 11 * pw.PdfPageFormat.point,
    ),
  );

  // Information
  final today = DateTime.now();
  final day = today.day;
  final month = today.month;
  final year = today.year;
  final greetLine =
      "Thực hiện kế hoạch giảng dạy cao học học kỳ $hocKy, Khoa Toán - Tin đề xuấn danh mục các học phần trong chương trình đào tạo Thạc sĩ các ngành như sau:";

  // Resolve khoi Kien Thuc
  // TODO: implement proper access function elsewhere
  Map<HocPhan, String> tenKhoiKienThuc = {};
  listHocPhan.sort((hp1, hp2) {
    return hp1.maHocPhan.compareTo(hp2.maHocPhan);
  });
  for (final hp in listHocPhan) {
    tenKhoiKienThuc[hp] = await hp.tenKhoiKienThuc;
  }

  final page = pw.MultiPage(
    margin: pw.EdgeInsets.symmetric(
      vertical: 0.75 * pw.inch,
      horizontal: 0.9 * pw.inch,
    ),
    orientation: pw.PageOrientation.landscape,
    pageFormat: pw.transpose(pw.PdfPageFormat.a4),
    build: (context) {
      return [
        pw.EzTopHeader.fami(),
        pw.EzSkip.medskip(),
        pw.EzTitle("Kính gửi: Ban Đào tạo"),
        pw.EzSkip.medskip(),
        pw.Text(greetLine),
        pw.EzSkip.medskip(),
        pw.EzTable(
          padding: pw.EdgeInsetsDirectional.symmetric(
            vertical: 2 * pw.pt,
            horizontal: 3 * pw.pt,
          ),
          textAligns: {
            2: pw.TextAlign.justify,
          },
          alignments: {
            2: pw.Alignment.centerLeft,
          },
          data: listHocPhan,
          headers: [
            "TT",
            "Mã HP",
            "Tên học phần",
            "Khối lượng",
            "Khối kiến thức",
            "Đợt học",
          ],
          rowBuilder: (int i, HocPhan hp) {
            String name = "${hp.tenTiengAnh}\n${hp.tenTiengViet}";
            // if (name.length > 70) {
            //   name = "${hp.tenTiengAnh}\n${hp.tenTiengViet}";
            // }
            return [
              "${i + 1}",
              hp.maHocPhan,
              name,
              hp.khoiLuong,
              tenKhoiKienThuc[hp],
              hocKy,
            ];
          },
        ),
        pw.EzSkip.medskip(),
        pw.Row(
          children: [
            pw.Expanded(child: pw.SizedBox.shrink()),
            pw.Column(
              children: [
                pw.ItalicText("Hà Nội, ngày $day tháng $month năm $year"),
                pw.EzSkip.smallskip(),
                pw.Text("TRƯỞNG KHOA KHOA TOÁN - TIN"),
                pw.EzSkip(height: 15 * pw.mm),
              ],
            ),
          ],
        ),
        pw.Spacer(),
        pw.Footer(
          leading: pw.Text("ĐT.QT05.BM08"),
          title: pw.Center(child: pw.Text("Ban hành lần: 02")),
          trailing: pw.Text("Ngày ban hành: 28/04/2023"),
          padding: pw.EdgeInsetsDirectional.symmetric(vertical: 3 * pw.pt),
          decoration: pw.BoxDecoration(
            border: pw.Border(
              top: pw.BorderSide(width: 0.5 * pw.pt),
            ),
          ),
        ),
      ];
    },
  );

  pdf.addPage(page);

  return await pdf.save();
}
