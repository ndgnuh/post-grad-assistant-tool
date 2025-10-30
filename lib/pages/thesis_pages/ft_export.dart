import 'dart:async';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:riverpod/riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../services/pdf_widgets.dart' as pw;

final unassignedThesisProvider = AsyncNotifierProvider(
  () => ThesisIdsNotifier(assigned: false),
);

final sampleThesesPdfProvider = AsyncNotifierProvider(
  SampleThesesPdfNotifier.new,
);

Future<Uint8List> buildThesisListPdf({
  required List<ThesisData> theses,
  required Map<ThesisData, TeacherData> supervisors,
}) async {
  final theme = await pw.defaultTheme(baseSize: 9);
  final pdf = pw.Document(theme: theme);
  final dateFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
  final formattedDate = dateFormat.format(DateTime.now());

  final page = pw.MultiPage(
    pageFormat: pw.a4Portrait(),
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

      final data = pw.EzTable<ThesisData>(
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
          0: pw.Alignment.topLeft,
          1: pw.Alignment.topLeft,
          2: pw.Alignment.topLeft,
          3: pw.Alignment.topLeft,
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
          final thesis = theses[r];
          final teacher = supervisors[theses[r]]!;
          final contact = teacher.email ?? teacher.phoneNumber;
          return [
            teacher.name,
            thesis.vietnameseTitle,
            thesis.englishTitle,
            contact,
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

  return pdf.save();
}

class SampleThesesPdfNotifier extends AsyncNotifier<Uint8List> {
  @override
  FutureOr<Uint8List> build() async {
    final ids = await ref.watch(unassignedThesisProvider.future);

    final theses = <ThesisData>[];
    for (final id in ids) {
      final thesis = await ref.watch(thesisByIdProvider(id).future);
      theses.add(thesis!);
    }

    final supervisors = <ThesisData, TeacherData>{};
    for (final thesis in theses) {
      final teacher = await ref.watch(
        teacherByIdProvider(thesis.supervisorId).future,
      );
      supervisors[thesis] = teacher!;
    }
    return buildThesisListPdf(theses: theses, supervisors: supervisors);
  }
}
