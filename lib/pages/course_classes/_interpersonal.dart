import 'package:intl/intl.dart';
import '../../business/business_enums.dart';
import '../../business/drift_orm.dart';

DateTime _parseYmd(String ymd) {
  try {
    final parts = ymd.split('-');
    if (parts.length != 3) {
      throw FormatException('Invalid date format, expected YYYY-MM-DD');
    }
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final day = int.parse(parts[2]);
    return DateTime(year, month, day);
  } catch (e) {
    return DateTime.now();
  }
}

String teachingInvitationMessage({
  required Pronoun pronoun,
  required SemesterData semester,
  required String courseName,
  required int numberOfRegisteredStudents,
}) {
  // TODO: store iso date in DB so that in is mapped automatically by drift
  final startTime = _parseYmd(semester.studyStartDate);
  final endTime = _parseYmd(semester.studyEndDate);
  final startTimeStr = DateFormat('dd/MM/yyyy').format(startTime);
  final endTimeStr = DateFormat('dd/MM/yyyy').format(endTime);
  final teachingTime = "$startTimeStr - $endTimeStr";

  final greeting = pronoun.greeting;
  return "$greeting, đợt học cao học tới có một lớp $courseName, số lượng đăng ký là $numberOfRegisteredStudents học viên, thời gian giảng dạy là $teachingTime. ${pronoun.capitalized} có thể dạy lớp này không ạ?";
}
