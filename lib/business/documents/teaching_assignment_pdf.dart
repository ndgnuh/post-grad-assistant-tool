import '../../utilities/strings.dart';
import '../documents.dart';
import '../main_database.dart';
import 'common_widgets.dart';
import 'pdf_utils.dart';
import 'utilities/xlsx_builder.dart';

class TeachingAssignmentDocument {
  final SemesterData semester;
  final List<CourseClassData> courseClasses;
  final Map<int, CourseData> mapCourses;
  final Map<int, List<TeacherData>> mapTeachers;
  final Map<int, List<double>> mapWeights;

  static final defaultPdfConfig = PdfConfig(
    pageFormat: PdfPageFormat.a4.landscape,
    horizontalMargin: 0.5 * inch,
    verticalMargin: 0.5 * inch,
    baseFontSize: 10 * pt,
  );

  String get name {
    final semesterId = semester.id;
    return "${semesterId}_PhanCongGiangDay_FaMI";
  }

  Future<XlsxFile> buildXlsx() {
    return _buildXlsx(model: this);
  }

  Future<PdfFile> buildPdf({required PdfConfig config}) async {
    return await _buildPdf(
      config: config,
      model: this,
    );
  }

  TeachingAssignmentDocument({
    required this.semester,
    required this.courseClasses,
    required this.mapCourses,
    required this.mapTeachers,
    required this.mapWeights,
  });
}

Future<PdfFile> _buildPdf({
  required final PdfConfig config,
  required final TeachingAssignmentDocument model,
}) async {
  final bytes = await buildMultiPageDocument(
    pageFormat: PdfPageFormat.a4.landscape,
    margin: EdgeInsets.symmetric(
      horizontal: config.horizontalMargin,
      vertical: config.verticalMargin,
    ),
    baseFontSize: config.baseFontSize,
    build: (context) => [
      _TeachingAssignmentPdf(
        config: config,
        mapCourses: model.mapCourses,
        semester: model.semester,
        courseClasses: model.courseClasses,
        mapTeachers: model.mapTeachers,
        mapWeights: model.mapWeights,
      ),
    ],
  );

  final name = model.name;
  return PdfFile(name: name, bytes: bytes);
}

class _TeachingAssignmentPdf extends StatelessWidget {
  final SemesterData semester;
  final List<CourseClassData> courseClasses;
  final Map<int, CourseData> mapCourses;
  final Map<int, List<TeacherData>> mapTeachers;
  final Map<int, List<double>> mapWeights;
  final PdfConfig config;

  _TeachingAssignmentPdf({
    required this.semester,
    required this.mapCourses,
    required this.courseClasses,
    required this.mapTeachers,
    required this.mapWeights,
    required this.config,
  });

  List<String> get headerTexts => [
    "STT",
    "Mã lớp học phần",
    "Số TC",
    "Tên lớp học phần",
    "Thứ",
    "Tiết",
    "Từ ngày\nđến ngày",
    "Phòng học",
    "Giảng viên",
    "Cơ quan\ncông tác",
    "Điện thoại\nliên hệ",
    "Ghi chú",
  ];

  PdfColor? rowColor(int i, CourseClassData courseClass) {
    if (courseClass.status == CourseClassStatus.canceled) {
      return PdfColors.red200;
    }
    return null;
  }

  List<String> buildRow(int i, CourseClassData courseClass) {
    final status = courseClass.status;
    final course = mapCourses[courseClass.id]!;

    /// Order
    final ord = (i + 1).toString();

    /// Class ID and Name
    final courseClassId = courseClass.classId.replaceFirst(" ", "\n");
    final courseClassName = courseClass.classId.replaceFirst(
      course.id,
      course.vietnameseName,
    );

    /// Number of credits
    final credits = course.numCredits.toString();

    /// Which periods the class takes place
    final String periods;
    switch ((courseClass.startPeriod, courseClass.endPeriod)) {
      case (int start, int end):
        periods = "$start - $end";
      case _:
        periods = "";
    }

    /// from - to dates
    final beginDate = semester.classBeginDate.toDmy(separator: '/');
    final endDate = semester.classEndDate.toDmy(separator: '/');
    final fromToDate = "$beginDate\n$endDate";

    /// Teachers
    final teachers = [
      for (final teacher in mapTeachers[courseClass.id]!) teacher.name,
    ].join("\n");
    final contacts = [
      for (final teacher in mapTeachers[courseClass.id]!) teacher.phoneNumber,
    ].join("\n");

    /// Classroom
    final String classroom;
    switch ((courseClass.status, courseClass.classroom)) {
      case (CourseClassStatus.canceled, _):
        classroom = "";
      case (_, String room) when room.isNotEmpty:
        classroom = room;
      default:
        classroom = "mượn";
    }

    /// Note
    final String note;
    switch ((status, courseClass.registrationCount)) {
      case (CourseClassStatus.canceled, _):
        note = "Hủy";
      case (_, int number) when number < 5:
        note = "Đồ án";
      default:
        note = "";
    }

    return [
      ord,
      courseClassId,
      credits,
      courseClassName,
      courseClass.dayOfWeek?.toShortString() ?? "",
      periods,
      fromToDate,
      classroom,
      teachers,
      "ĐHBKHN",
      contacts,
      note,
    ];
  }

  @override
  Widget build(Context context) {
    final yearStart = int.parse(semester.id.split('.').first);
    final yearEnd = yearStart + 1;
    final bold = TextStyle(fontWeight: FontWeight.bold);
    final beginDate = semester.classBeginDate.toDmy(separator: '/');
    final endDate = semester.classEndDate.toDmy(separator: '/');

    return Column(
      children: [
        /// Titles
        Row(
          children: [
            FamiTitle(),
            Spacer(),
          ],
        ),

        /// To:
        SizedBox(height: 12 * pt),
        Text('Kính gửi: Ban Phòng Đào Tạo', style: bold),
        Text(
          "BẢNG PHÂN CÔNG ĐĂNG KÝ GIẢNG DẠY CAO HỌC - HỌC KỲ ${semester.id} - NĂM HỌC $yearStart - $yearEnd",
          style: bold,
        ),

        // Class begin-from date
        SizedBox(height: 3 * pt),
        Text(
          "Thời gian học: $beginDate - $endDate",
          style: bold,
        ),

        // assignment table
        SizedBox(height: 6 * pt),
        TableHelper.fromTextArray(
          headerStyle: bold,
          headerAlignment: Alignment.center,
          headerAlignments: {3: Alignment.center, 8: Alignment.center},
          cellBuilder: (col, data, row) {
            if (row == 0) {
              return Align(
                alignment: Alignment.center,
                child: Text(
                  data,
                  style: bold,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return null;
          },

          defaultColumnWidth: IntrinsicColumnWidth(),
          cellAlignment: Alignment.center,
          columnWidths: {3: FlexColumnWidth(0.5)},
          cellAlignments: {3: Alignment.centerLeft, 8: Alignment.centerLeft},
          data: [
            headerTexts,
            for (final (i, courseClass) in courseClasses.indexed)
              buildRow(i, courseClass),
          ],
        ),

        SizedBox(height: 6 * pt),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  "Hà Nội, ngày ${'.' * 8} tháng ${'.' * 8} năm ${'.' * 12}",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 1 * pt),
                Text("KHOA TOÁN - TIN", style: bold),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

void _sheetBuilder({
  required Sheet sheet,
  required SemesterData semester,
  required List<CourseClassData> courseClasses,
  required Map<int, CourseData> mapCourses,
  required Map<int, List<TeacherData>> mapTeachers,
  required Map<int, List<double>> mapWeights,
}) {
  /// Information
  final yearStart = int.parse(semester.id.split('.').first);
  final yearEnd = yearStart + 1;
  final beginDate = semester.classBeginDate.toDmy(separator: '/');
  final endDate = semester.classEndDate.toDmy(separator: '/');
  final semesterId = semester.id;

  final normal = sheet.defaultCellStyle.copyWith(
    fontSizeVal: 10,
  );
  final bold = normal.copyWith(boldVal: true);
  final boldCenter = bold.copyWith(
    horizontalAlignVal: HorizontalAlign.Center,
    verticalAlignVal: VerticalAlign.Center,
  );

  // Table headers
  // the headers are merged for some reason...
  // starting from B column because of the form
  final headerTexts = [
    "STT",
    "Mã lớp học phần",
    "Số TC",
    "Tên lớp học phần",
    "Thứ",
    "Tiết",
    "Từ ngày đến ngày",
    "Phòng học",
    "Giảng viên",
    "Cơ quan công tác",
    "Điện thoại liên hệ",
    "Ghi chú",
  ];
  sheet.setColumnWidth(0, 1);
  for (int col = 1; col < headerTexts.length + 1; col++) {
    final cellIndex = CellIndex.indexByColumnRow(
      rowIndex: 9,
      columnIndex: col,
    );
    final mergeTo = CellIndex.indexByColumnRow(
      rowIndex: 10,
      columnIndex: col,
    );
    sheet.setCell(
      cellIndex: cellIndex,
      value: TextCellValue(headerTexts[col - 1]),
      mergeTo: mergeTo,
      style: boldCenter.withBorders(),
    );
  }

  /// Write the assignment table
  final rows = <List<String>>[];
  for (final (i, courseClass) in courseClasses.indexed) {
    final status = courseClass.status;
    final course = mapCourses[courseClass.id]!;

    /// Order
    final ord = (i + 1).toString();

    /// Class ID and Name
    final courseClassId = courseClass.classId.replaceFirst(" ", "\n");
    final courseClassName = courseClass.classId.replaceFirst(
      course.id,
      course.vietnameseName,
    );

    /// Number of credits
    final credits = course.numCredits.toString();

    /// Which periods the class takes place
    final String periods;
    switch ((courseClass.startPeriod, courseClass.endPeriod)) {
      case (int start, int end):
        periods = "$start - $end";
      case _:
        periods = "";
    }

    /// from - to dates
    final beginDate = semester.classBeginDate.toDmy(separator: '/');
    final endDate = semester.classEndDate.toDmy(separator: '/');
    final fromToDate = "$beginDate - $endDate";

    /// Teachers
    final teachers = [
      for (final teacher in mapTeachers[courseClass.id]!) teacher.name,
    ].join("\n");
    final contacts = [
      for (final teacher in mapTeachers[courseClass.id]!) teacher.phoneNumber,
    ].join("\n");

    final String note;
    switch ((status, courseClass.registrationCount)) {
      case (CourseClassStatus.canceled, _):
        note = "Hủy";
      case (_, int count) when count < 5:
        note = "Đồ án";
      case _:
        note = "";
    }

    final row = [
      ord,
      courseClassId,
      credits,
      courseClassName,
      courseClass.dayOfWeek?.toShortString() ?? "",
      periods,
      fromToDate,
      courseClass.classroom ?? "",
      teachers,
      "Đại học Bách khoa Hà Nội",
      contacts,
      note,
    ];
    rows.add(row);
  }
  sheet.addTable(
    topLeftIndex: CellIndex.indexByString("B12"),
    data: rows,
    cellStyle: normal.copyWith(
      verticalAlignVal: VerticalAlign.Center,
      horizontalAlignVal: HorizontalAlign.Center,
    ),
  );

  /// Auto fit use the width of merged cells...
  /// so some columns have to be set manually
  /// Luckily it is the order column, so just eyeing it out works
  sheet.setAllColumnAutoFit();
  sheet.setColumnWidth(1, 6);

  /// Write headers
  sheet.setCell(
    cellIndex: CellIndex.indexByString("B1"),
    value: TextCellValue("ĐẠI HỌC BÁCH KHOA HÀ NỘI"),
    mergeTo: CellIndex.indexByString("G1"),
    style: boldCenter,
  );

  sheet.setCell(
    cellIndex: CellIndex.indexByString("B2"),
    value: TextCellValue("KHOA TOÁN - TIN"),
    mergeTo: CellIndex.indexByString("G2"),
    style: boldCenter,
  );

  // Write titles
  sheet.setCell(
    cellIndex: CellIndex.indexByString("B4"),
    value: "Kính gửi: Ban Đào tạo",
    mergeTo: CellIndex.indexByString("M4"),
    style: boldCenter,
  );
  sheet.setCell(
    cellIndex: CellIndex.indexByString("B6"),
    value:
        "BẢNG PHÂN CÔNG ĐĂNG KÝ GIẢNG DẠY CAO HỌC - HỌC KỲ $semesterId - NĂM HỌC $yearStart - $yearEnd",
    mergeTo: CellIndex.indexByString("M6"),
    style: boldCenter,
  );
  sheet.setCell(
    cellIndex: CellIndex.indexByString("B8"),
    value: "Thời gian học: $beginDate - $endDate",
    mergeTo: CellIndex.indexByString("M8"),
    style: boldCenter,
  );

  final lastRowIndex = sheet.maxRows + 2;
  sheet.setCell(
    cellIndex: CellIndex.indexByColumnRow(
      columnIndex: 10,
      rowIndex: lastRowIndex,
    ),
    mergeTo: CellIndex.indexByColumnRow(
      columnIndex: 12,
      rowIndex: lastRowIndex,
    ),
    value: TextCellValue("Hà Nội, ngày .... tháng .... năm ...."),
    style: normal.center.italic,
  );
  sheet.setCell(
    cellIndex: CellIndex.indexByColumnRow(
      columnIndex: 10,
      rowIndex: lastRowIndex + 1,
    ),
    mergeTo: CellIndex.indexByColumnRow(
      columnIndex: 12,
      rowIndex: lastRowIndex + 1,
    ),
    value: TextCellValue("KHOA TOÁN - TIN"),
    style: normal.center.bold,
  );
}

Future<XlsxFile> _buildXlsx({
  required final TeachingAssignmentDocument model,
}) async {
  final bytes = await buildSingleSheetExcel(
    builder: (sheet) => _sheetBuilder(
      sheet: sheet,
      semester: model.semester,
      courseClasses: model.courseClasses,
      mapCourses: model.mapCourses,
      mapTeachers: model.mapTeachers,
      mapWeights: model.mapWeights,
    ),
  );

  final name = model.name;
  return XlsxFile(name: name, bytes: bytes);
}
