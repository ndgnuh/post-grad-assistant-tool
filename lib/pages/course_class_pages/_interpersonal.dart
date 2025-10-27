import 'package:intl/intl.dart';
import '../../business/drift_orm.dart';

String teachingInvitationMessage({
  required Pronoun pronoun,
  required SemesterData semester,
  required String courseName,
  required int numberOfRegisteredStudents,
}) {
  final startTime = semester.studyStartDate;
  final endTime = semester.studyEndDate;
  final startTimeStr = DateFormat('dd/MM/yyyy').format(startTime);
  final endTimeStr = DateFormat('dd/MM/yyyy').format(endTime);
  final teachingTime = "$startTimeStr - $endTimeStr";

  final greeting = pronoun.greeting;
  return "$greeting, đợt học cao học tới có một lớp $courseName, số lượng đăng ký là $numberOfRegisteredStudents học viên, thời gian giảng dạy là $teachingTime. ${pronoun.capitalized} có thể dạy lớp này không ạ?";
}
