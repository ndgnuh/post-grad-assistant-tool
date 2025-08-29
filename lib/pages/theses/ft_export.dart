import 'dart:io';
import 'package:excel/excel.dart';
import 'package:pdf/pdf.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import '../../services/pdf_widgets.dart' as pw;
import '../../services/sqlbuilder/sqlbuilder.dart';
import '../../services/database.dart';
import '../../business/domain_objects.dart';

Future<void> exportThesisListPdf({
  required String outputPath,
  required List<Thesis> theses,
}) async {
  final theme = await pw.defaultTheme(baseSize: 9);
  final pdf = pw.Document(theme: theme);

  final gv = [for (final dt in theses) (dt.giangVien)];
  final dateFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
  final formattedDate = dateFormat.format(DateTime.now());

  final page = pw.MultiPage(
    pageFormat: pw.a4Landscape(),
    margin: pw.EdgeInsets.all(0.5 * PdfPageFormat.inch),
    build: (context) {
      final header = pw.Row(
        children: [
          pw.EzTopHeader.fami(),
          pw.Expanded(child: pw.Text("")),
          pw.EzTopHeader.chxhcnvn(),
        ],
      );

      final title = pw.EzTitle(
        "DANH SÁCH ĐỀ TÀI HƯỚNG DẪN CAO HỌC",
        fontSize: 16,
      );
      final subtitle = pw.Center(
        child: pw.Text(
          "Ngày tạo: $formattedDate",
          style: pw.TextStyle(fontSize: 12),
        ),
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
        data: theses,
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
        pw.SizedBox(height: 32),
        title,
        pw.SizedBox(height: 8),
        subtitle,
        pw.SizedBox(height: 16),
        data,
      ];
    },
  );
  pdf.addPage(page);

  final outFile = File(outputPath);
  await outFile.create(recursive: true);
  await outFile.writeAsBytes(await pdf.save());
}
