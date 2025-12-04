import '../../business/drift_orm.dart';

/// TODO: make this model public and use it in PDF modules
/// View model dùng cho việc hiển thị dữ liệu của luận vân thạc sĩ
class StudentThesisViewModel {
  final StudentData? student;
  final ThesisData thesis;
  final TeacherData supervisor;

  final TeacherData? president;
  final TeacherData? secretary;
  final TeacherData? firstReviewer;
  final TeacherData? secondReviewer;
  final TeacherData? member;

  const StudentThesisViewModel({
    required this.student,
    required this.thesis,
    required this.supervisor,
    this.president,
    this.secretary,
    this.firstReviewer,
    this.secondReviewer,
    this.member,
  });

  List<TeacherData?> get councilMembers {
    return [
      president,
      secretary,
      firstReviewer,
      secondReviewer,
      member,
    ];
  }
}
