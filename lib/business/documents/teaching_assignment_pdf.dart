import 'package:fami_tools/utilities/strings.dart';
import 'package:fami_tools/utilities/pdf_building.dart';

import 'common_widgets.dart';
import '../documents.dart';
import '../main_database.dart';

Future<PdfFile> buildTeachingAssignmentPdf({
  required SemesterData semester,
  required List<CourseClassData> courseClasses,
  required Map<int, CourseData> mapCourses,
  required Map<int, List<TeacherData>> mapTeachers,
  required Map<int, List<double>> mapWeights,
}) async {
  final bytes = await buildMultiPageDocument(
    pageFormat: PdfPageFormat.a4.landscape,
    margin: EdgeInsets.all(0.5 * inch),
    baseFontSize: 10,
    build: (context) => [
      TeachingAssignmentPdf(
        mapCourses: mapCourses,
        semester: semester,
        courseClasses: courseClasses,
        mapTeachers: mapTeachers,
        mapWeights: mapWeights,
      ),
    ],
  );

  final name = "${semester.id}_PhanCongGiangDay_FaMI";
  return PdfFile(name: name, bytes: bytes);
}

class TeachingAssignmentPdf extends StatelessWidget {
  final SemesterData semester;
  final List<CourseClassData> courseClasses;
  final Map<int, CourseData> mapCourses;
  final Map<int, List<TeacherData>> mapTeachers;
  final Map<int, List<double>> mapWeights;

  TeachingAssignmentPdf({
    required this.semester,
    required this.mapCourses,
    required this.courseClasses,
    required this.mapTeachers,
    required this.mapWeights,
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
