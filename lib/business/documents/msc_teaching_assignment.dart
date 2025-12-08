import 'package:fami_tools/business/main_database.dart';
import 'package:fami_tools/business/documents.dart';
import 'package:fami_tools/business/documents/utilities/xlsx_builder.dart';
import 'package:fami_tools/utilities/strings.dart';

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

XlsxFile buildTeachingAssignmentXlsx({
  required SemesterData semester,
  required List<CourseClassData> courseClasses,
  required Map<int, CourseData> mapCourses,
  required Map<int, List<TeacherData>> mapTeachers,
  required Map<int, List<double>> mapWeights,
}) {
  final bytes = buildSingleSheetExcel(
    builder: (sheet) => _sheetBuilder(
      sheet: sheet,
      semester: semester,
      courseClasses: courseClasses,
      mapCourses: mapCourses,
      mapTeachers: mapTeachers,
      mapWeights: mapWeights,
    ),
  );

  final name = "${semester.id}_PhanCongGiangDay_FaMI";
  return XlsxFile(name: name, bytes: bytes);
}
