import 'dart:async';

import 'package:fami_tools/business/documents/common_widgets.dart';
import 'package:fami_tools/business/main_database.dart';

import 'pdf_utils.dart';
import 'xlsx_utils.dart';
import '../documents.dart';

class CourseLimitingDocumentModel {
  final List<CourseData> courses;
  final SemesterData semester;
  final String? faculty;

  static final defaultPdfConfig = PdfConfig(
    pageFormat: PdfPageFormat.a4.transpose,
    baseFontSize: 12 * pt,
    horizontalMargin: 1.2 * inch,
    verticalMargin: 0.7 * inch,

    verticalTableCellPadding: 3 * pt,
    horizontalTableCellPadding: 3 * pt,
  );

  String get name => "HanChe_HocPhan_${semester.id}".replaceFirst(".", "");

  CourseLimitingDocumentModel({
    required this.courses,
    required this.semester,
    required this.faculty,
  });

  List<List<Object>> dataTable({required bool separateNames}) {
    final list = <List<Object>>[];

    final courses = [...this.courses];
    courses.sort((a, b) => a.id.compareTo(b.id));

    for (final (i, course) in courses.indexed) {
      final title = [
        course.vietnameseName,
        course.englishName,
      ].join('\n');

      final workLoad = [
        course.numCredits.toString(),
        "(",
        [
          course.numTheoryHours,
          course.numPracticeHours,
          course.numLabHours,
          course.numSelfStudyHours,
        ].join(","),
        ")",
      ].join('');

      final row = [
        i + 1,
        course.id,
        if (separateNames) course.vietnameseName,
        if (separateNames) course.englishName,
        if (!separateNames) title,
        workLoad,
        course.category.label,
        semester.id,
      ];
      list.add(row);
    }
    return list;
  }

  Future<PdfFile> buildPdf(PdfConfig config) async {
    return _pdf(model: this, config: config);
  }

  FutureOr<XlsxFile> buildXlsx() {
    return _buildXlsx(model: this);
  }
}

Future<PdfFile> _pdf({
  required CourseLimitingDocumentModel model,
  required PdfConfig config,
}) async {
  final bytes = await buildMultiPageDocument(
    pageFormat: config.pageFormat,
    margin: EdgeInsets.symmetric(
      horizontal: config.horizontalMargin,
      vertical: config.verticalMargin,
    ),
    baseFontSize: config.baseFontSize,
    footer: (context) => FancyHdr(
      left: "ĐT.QT05.BM08",
      center: "Ban hành lần: 02",
      right: "Ngày ban hành: 28/04/2023",
    ),
    build: (context) {
      final style = context.defaultTextStyle;
      final semester = model.semester.id;
      final faculty = model.faculty;
      return [
        FormalTitle(
          firstTitle: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
          secondTitle: "KHOA TOÁN - TIN",
          firstStyle: style.heading2.copyWith(
            fontSize: style.heading2.fontSizeValue - 1,
          ),
          secondStyle: style.bold.heading2,
        ),

        SizedBox(height: style.bigSkip),

        Center(
          child: Column(
            children: [
              Text(
                "Kính gửi: Ban Đào tạo",
                textAlign: TextAlign.center,
                style: style.bold.heading1,
              ),
            ],
          ),
        ),

        SizedBox(height: style.medSkip),

        Text(
          "Thực hiện kế hoạch giảng dạy cao học học kỳ $semester, $faculty đề xuất danh mục các học phần trong chương trình đào tạo Thạc sĩ các ngành như sau:",
        ),

        SizedBox(height: style.smallSkip),
        EzTable(
          padding: EdgeInsets.symmetric(
            vertical: config.verticalTableCellPadding,
            horizontal: config.horizontalTableCellPadding,
          ),
          data: model.dataTable(separateNames: false),
          rowBuilder: (_, row) => row,
          alignments: {2: Alignment.centerLeft},
          textAligns: {2: TextAlign.left},

          headers: [
            "TT",
            "Mã HP",
            "Tên học phần",
            "Khối lượng",
            "Khối kiến thức",
            "Đợt học",
          ],
        ),

        SizedBox(height: style.bigSkip),

        Footer(
          trailing: Column(
            children: [
              Text(
                "Hà Nội, ngày ........ tháng ....... năm ........",
                style: style.italic,
              ),
              SizedBox(height: style.smallSkip),
              Text("KHOA TOÁN - TIN", style: style.bold),
              SizedBox(height: 15 * mm),
            ],
          ),
        ),
      ];
    },
  );

  return PdfFile(
    name: model.name,
    bytes: bytes,
    config: config,
  );
}

XlsxFile _buildXlsx({
  required CourseLimitingDocumentModel model,
}) {
  builder(Sheet sheet) {
    sheet.addTable(
      headerStyleBuilder: (col, value, defaultStyle) {
        return defaultStyle.center.bold;
      },
      cellStyleBuilder: (row, col, value, defaultStyle) {
        switch (col) {
          case 2 || 3 || 5:
            return defaultStyle.centerVertically.flushLeft;
          default:
            return defaultStyle.center;
        }
      },
      header: [
        "TT",
        "Mã HP",
        "Tên tiếng Việt",
        "Tên tiếng Anh",
        "Khối lượng",
        "Khối kiến thức",
        "Đợt học",
      ],
      topLeftIndex: CellIndex.indexByString("A1"),
      data: model.dataTable(separateNames: true),
    );

    for (int i = 0; i < sheet.maxColumns; i++) {
      sheet.setColumnAutoFit(i);
    }
  }

  final bytes = buildSingleSheetExcel(builder: builder);
  final name = model.name;
  return XlsxFile(name: name, bytes: bytes);
}
