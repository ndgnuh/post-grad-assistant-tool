// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:fami_tools/business/db_v2_providers.dart';

import 'package:fami_tools/business/documents/pdf_utils.dart';
import '../utilities/xlsx_builder.dart';
import 'package:fami_tools/business/view_models.dart';

import '../common_widgets.dart';
import '../../documents.dart';

Future<XlsxFile> buildThesisAssignmentExcel({
  required List<StudentViewModel> theses,
  required CohortData cohort,
}) async {
  final model = ThesisAssignmentModel(
    cohort: cohort,
    theses: theses,
  );

  final bytes = await buildSingleSheetExcel(
    builder: (sheet) => _buildSheet(sheet: sheet, model: model),
  );

  final name = model.fileName;
  return XlsxFile(name: name, bytes: bytes);
}

Future<PdfFile> buildThesisAssignmentPdf({
  required List<StudentViewModel> theses,
  required CohortData cohort,
  required PdfConfig config,
}) async {
  final model = ThesisAssignmentModel(
    cohort: cohort,
    theses: theses,
  );

  final bytes = await buildMultiPageDocument(
    pageFormat: PdfPageFormat.a4.transpose,
    baseFontSize: config.baseFontSize,
    margin: EdgeInsets.symmetric(
      horizontal: config.horizontalMargin,
      vertical: config.verticalMargin,
    ),
    build: (context) => _build(
      context: context,
      model: model,
    ),
    // header: (context) => FancyHdr(
    //   header: true,
    //   right: "Trang ${context.pageNumber} / ${context.pagesCount}",
    // ),
    footer: (context) => FancyHdr(
      left: "ĐT.QT10.BM04",
      center: "Lần ban hành: 01",
      right: "Ngày ban hành: 06/05/2021",
    ),
  );

  final name = model.fileName;
  return PdfFile(name: name, bytes: bytes);
}

void _buildSheet({
  required Sheet sheet,
  required ThesisAssignmentModel model,
}) {
  final style = sheet.defaultCellStyle.adjustFontSize(fontSize: 10);
  final bold = style.bold;

  sheet.setCell(
    cellIndex: CellIndex.indexByString("C1"),
    mergeTo: CellIndex.indexByString("E1"),
    style: style.center,
    value: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
  );

  sheet.setCell(
    cellIndex: CellIndex.indexByString("C2"),
    mergeTo: CellIndex.indexByString("E2"),
    style: style.center.bold,
    value: "KHOA TOÁN - TIN",
  );

  sheet.setCell(
    cellIndex: CellIndex.indexByString("C4"),
    mergeTo: CellIndex.indexByString("K4"),
    style: bold.center,
    value: "Kính gửỉ: Ban Đào tạo",
  );

  sheet.setCell(
    cellIndex: CellIndex.indexByString("C5"),
    mergeTo: CellIndex.indexByString("K5"),
    style: bold.center.adjustFontSize(increment: 2),
    value:
        "DANH SÁCH ĐỀ TÀI LUẬN VĂN THẠC SĨ (CHÍNH THỨC) - KHÓA ${model.cohort.id}",
  );

  sheet.setCell(
    cellIndex: CellIndex.indexByString("C6"),
    mergeTo: CellIndex.indexByString("K6"),
    style: style.center,
    value: "Ngành: Toán - Tin, Hệ thạc sĩ khoa học.",
  );

  sheet.setCell(
    cellIndex: CellIndex.indexByString("C7"),
    mergeTo: CellIndex.indexByString("K7"),
    style: style.center,
    value: "Lớp: ${model.classCode}",
  );

  sheet.addTable(
    topLeftIndex: CellIndex.indexByString("A9"),
    header: model.tableHeaders(newLine: " "),
    headerStyle: bold.center.wrapText,
    cellStyle: style.centerVertically.wrapText,
    data: model.tableData,
    cellStyleBuilder: (row, col, value, defaultStyle) {
      switch (col) {
        case 0:
        case 2:
        case 4:
        case 8:
        case 9:
        case 10:
          return defaultStyle.center;
        default:
          return defaultStyle;
      }
    },
  );

  final maxRows = sheet.maxRows;
  final pointer = CellPointer(
    CellIndex.indexByString("H${maxRows}"),
  );

  pointer.advanceRow(2);
  sheet.setCell(
    cellIndex: pointer.current,
    mergeTo: pointer.jumpToColumn('K'),
    style: style.center.italic,
    value: "Hà Nội, ngày .... tháng .... năm 20....",
  );

  pointer.advanceRow();
  pointer.jumpToColumn('H');
  sheet.setCell(
    cellIndex: pointer.current,
    mergeTo: pointer.jumpToColumn('K'),
    style: style.center.bold,
    value: "KHOA TOÁN - TIN",
  );

  final widths = <double>[
    8,
    25,
    15,
    25,
    15,
    30,
    30,
    25,
    12,
    15,
  ];
  for (var i = 0; i < widths.length; i++) {
    sheet.setColumnWidth(i, widths[i]);
    sheet.setColumnAutoFit(i);
  }
}

List<Widget> _build({
  required Context context,
  required ThesisAssignmentModel model,
}) {
  final textStyle = context.defaultTextStyle;
  final classCode = model.classCode;

  return [
    Footer(
      leading: FormalTitle(
        firstTitle: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
        secondTitle: "KHOA TOÁN - TIN",
      ),
    ),

    Center(
      child: Column(
        children: [
          SizedBox(height: 6 * pt),
          Text("Kính gửi: Ban Đào tạo", style: textStyle.heading1.bold),
          SizedBox(height: 2 * pt),
          Text(
            "DANH SÁCH ĐỀ TÀI LUẬN VĂN THẠC SĨ (CHÍNH THỨC) - KHÓA ${model.cohort.id}",
            style: textStyle.heading0.bold,
          ),
          Text(
            "Ngành: Toán - Tin, Hệ thạc sĩ khoa học",
            style: textStyle.heading2,
          ),
          SizedBox(height: 2 * pt),
          Text("Lớp: $classCode", style: textStyle.heading2),
          SizedBox(height: 6 * pt),
        ],
      ),
    ),

    /// The table
    EzTable(
      data: model.tableData,
      rowBuilder: (i, row) => row,
      headers: model.tableHeaders(),
      textAligns: {
        0: TextAlign.center,
        1: TextAlign.left,
        2: TextAlign.center,
        3: TextAlign.left,
        4: TextAlign.center,
        5: TextAlign.left,
        6: TextAlign.left,
        7: TextAlign.left,
        8: TextAlign.center,
        9: TextAlign.center,
        10: TextAlign.center,
      },
      columnWidths: model.tableColumnWidths,
      defaultDataWrap: false,
      dataWraps: {
        // outer supervisor workplace has university + faculty
        // therefore may be long
        4: true,
        5: true,
        6: true,
        10: true,
      },
      padding: EdgeInsets.all(4 * pt),
      alignments: model.tableAlignments,
    ),

    // TableHelper.fromTextArray(
    //   cellPadding: EdgeInsets.all(4 * pt),
    //   // headerStyle: bold,
    //   data: [model.tableHeaders, ...model.tableData],
    //   columnWidths: model.tableColumnWidths,
    //   cellAlignments: model.tableAlignments,
    //   cellBuilder: (col, data, row) {
    //     print(row);
    //     if (row == 0) {
    //       return Container(
    //         padding: EdgeInsets.all(2 * pt),
    //         alignment: Alignment.center,
    //         child: Text(
    //           data,
    //           style: bold,
    //           textAlign: TextAlign.center,
    //         ),
    //       );
    //     }
    //     return null;
    //   },
    // ),
    SizedBox(height: 6 * pt),
    Footer(
      trailing: Column(
        children: [
          Text(
            "Hà Nội, ngày .... tháng .... năm 20....",
            style: textStyle.italic,
          ),
          SizedBox(height: 2 * pt),
          Text("KHOA TOÁN - TIN", style: textStyle.bold),
          SizedBox(height: 3 * cm),
        ],
      ),
    ),
  ];
}

/// Bandage solution for now
/// TODO: proper view model
const teacherGroup = [
  "Khoa học dữ liệu và ứng dụng",
  "Cơ sở toán học cho tin học và hệ thống thông tin",
  "Tối ưu và tính toán khoa học",
  "Xác suất thống kê và ứng dụng",
  "Giải tích",
  "Đại số",
];

class ThesisAssignmentModel {
  final CohortData cohort;
  final List<StudentViewModel> theses;

  String get fileName => "DanhSach_DeTai_${cohort.id.replaceAll(' ', '_')}";
  String get classCode => "${cohort.id.replaceFirst("CH20", "")}-MI-TT";

  const ThesisAssignmentModel({
    required this.cohort,
    required this.theses,
  });

  static const defaultPdfconfig = PdfConfig(
    baseFontSize: 9 * pt,
    horizontalMargin: 0.5 * inch,
    verticalMargin: 0.79 * inch,
    verticalTableCellPadding: 3 * pt,
    horizontalTableCellPadding: 3 * pt,
  );

  Future<PdfFile> pdf(PdfConfig config) => buildThesisAssignmentPdf(
    theses: theses,
    cohort: cohort,
    config: config,
  );

  Future<XlsxFile> get xlsx => buildThesisAssignmentExcel(
    theses: theses,
    cohort: cohort,
  );

  List<List<String>> get tableData {
    int skipped = 0;
    final rows = <List<String>>[];
    for (var i = 0; i < theses.length; i++) {
      final model = theses[i];
      final thesis = model.thesis;
      final supervisor = model.supervisor;
      final student = model.student;
      final secondarySupervisor = model.secondarySupervisor;

      final group = switch (supervisor?.teacherGroupId) {
        int id when id > 0 && id <= teacherGroup.length => teacherGroup[id - 1],
        _ => "",
      };

      if (supervisor == null || student.studentId == null) {
        skipped++;
        continue;
      }

      final String secondarySupervisorWorkplace;
      switch ((secondarySupervisor?.university, secondarySupervisor?.falcuty)) {
        case (String u, String f) when u.isNotEmpty && f.isNotEmpty:
          secondarySupervisorWorkplace = "$u; $f";
          break;
        case (String u, _) when u.isNotEmpty:
          secondarySupervisorWorkplace = u;
          break;
        case (_, String f) when f.isNotEmpty:
          secondarySupervisorWorkplace = "??; f";
          break;
        default:
          secondarySupervisorWorkplace = "??";
      }

      rows.add([
        (i - skipped + 1).toString(),
        supervisor.name,
        supervisor.falcuty ?? "??",
        secondarySupervisor?.name ?? "",
        secondarySupervisor != null ? secondarySupervisorWorkplace : "",
        thesis?.vietnameseTitle ?? "-",
        thesis?.englishTitle ?? "-",
        student.name,
        student.studentId!,
        "",
        group,
      ]);
    }
    return rows;
  }

  List<String> tableHeaders({String newLine = "\n"}) => [
    "STT",
    "GV${newLine}hướng dẫn 1",
    "Đơn vị",
    "GV${newLine}hướng dẫn 2",
    "Đơn vị",
    "Tên đề tài chính thức${newLine}(tiếng Việt)",
    "Tên đề tài chính thức${newLine}(tiếng Anh)",
    "Họ và tên học viên",
    "SHHV",
    "Mã đề tài",
    "NC tại${newLine}Bộ môn, PTN",
  ];

  Map<int, TableColumnWidth> get tableColumnWidths => {
    0: IntrinsicColumnWidth(),
    1: IntrinsicColumnWidth(),
    2: IntrinsicColumnWidth(),
    3: IntrinsicColumnWidth(),
    4: FlexColumnWidth(2),
    5: FlexColumnWidth(3),
    6: FlexColumnWidth(3),
    7: IntrinsicColumnWidth(),
    8: IntrinsicColumnWidth(),
    9: IntrinsicColumnWidth(),
    10: FlexColumnWidth(2),
  };

  Map<int, Alignment> get tableHeaderAlignments => {
    for (int i = 0; i < tableHeaders().length; i++) i: Alignment.center,
  };

  Map<int, Alignment> get tableAlignments => {
    0: Alignment.center,
    1: Alignment.centerLeft,
    2: Alignment.center,
    3: Alignment.centerLeft,
    4: Alignment.center,
    5: Alignment.centerLeft,
    6: Alignment.centerLeft,
    7: Alignment.centerLeft,
    8: Alignment.center,
    9: Alignment.center,
    10: Alignment.center,
  };
}
