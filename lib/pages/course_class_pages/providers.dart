import 'dart:async';

import 'package:fami_tools/business/copy_pasta.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../business/db_v2_providers.dart';
import '../../business/selection_models.dart';

final courseClassViewModelsProvider = AsyncNotifierProvider(
  CourseClassViewModelsNotifier.new,
);

final courseClassViewModelByIdProvider = AsyncNotifierProvider.family(
  CourseClassViewModelByIdNotifier.new,
);

final semesterSelectionModelProvider = AsyncNotifierProvider(
  () => SemesterSelectionModelNotifier("course-class"),
);

/// Return course class IDs for the selected semester
/// along with a boolean indicating whether no semester is selected
final courseClassIdsProvider = FutureProvider((ref) async {
  final semesterSelection = await ref.watch(
    semesterSelectionModelProvider.future,
  );
  final selectedSemester = semesterSelection.selected;
  if (selectedSemester == null) return ([], true);

  final courseClassIds = await ref.watch(
    courseClassIdsBySemesterProvider(selectedSemester.semester).future,
  );
  return (courseClassIds, false);
});

final courseRegistrationMessageProvider = AsyncNotifierProvider(
  CourseRegistrationMessageNotifier.new,
);

final gradeSubmissionAnnouncementProvider = AsyncNotifierProvider(
  GradeSubmissionAnnouncementNotifier.new,
);

final teachingAnnouncementProvider = AsyncNotifierProvider(
  TeachingAnnouncementNotifier.new,
);

@immutable
class CourseClassViewModel {
  final SemesterData semester;
  final CourseClassData courseClass;
  final Map<TeacherData, double> teachers;
  final CourseData course;
  final int registrationCount;

  const CourseClassViewModel({
    required this.semester,
    required this.courseClass,
    required this.teachers,
    required this.course,
    this.registrationCount = 0,
  });
}

class CourseClassViewModelByIdNotifier
    extends AsyncNotifier<CourseClassViewModel> {
  final int courseClassId;
  CourseClassViewModelByIdNotifier(this.courseClassId);

  @override
  FutureOr<CourseClassViewModel> build() async {
    final courseClass = await ref.watch(
      courseClassByIdProvider(courseClassId).future,
    );

    final course = await ref.watch(
      courseByIdProvider(courseClass.courseId).future,
    );

    final teachingAssignments = await ref.watch(
      teachingAssignmentByClassProvider(courseClass.id).future,
    );
    final teachingTeachers = <TeacherData, double>{};
    for (final assignment in teachingAssignments) {
      final teacher = await ref.watch(
        teacherByIdProvider(assignment.teacherId).future,
      );
      teachingTeachers[teacher] = assignment.weight;
    }

    final semester = await ref.watch(
      semesterByIdProvider(courseClass.semester).future,
    );

    final registrationCount = await ref.watch(
      registrationCountProvider(courseClass.id).future,
    );

    return CourseClassViewModel(
      courseClass: courseClass,
      teachers: teachingTeachers,
      course: course,
      semester: semester,
      registrationCount: registrationCount,
    );
  }
}

class CourseClassViewModelsNotifier
    extends AsyncNotifier<List<CourseClassViewModel>> {
  @override
  FutureOr<List<CourseClassViewModel>> build() async {
    final semesterModel = await ref.watch(
      semesterSelectionModelProvider.future,
    );
    if (semesterModel.selected == null) {
      return [];
    }

    final semester = semesterModel.selected!;

    final courseClassIds = await ref.watch(
      courseClassIdsBySemesterProvider(semester.semester).future,
    );

    final courseClassViewModels = <CourseClassViewModel>[];

    for (final id in courseClassIds) {
      final viewModel = await ref.watch(
        courseClassViewModelByIdProvider(id).future,
      );
      if (viewModel != null) {
        courseClassViewModels.add(viewModel);
      }
    }

    return courseClassViewModels;
  }
}

sealed class EmailToTeachersNotifier extends AsyncNotifier<Email?> {
  String subject(SemesterData semester);
  String body(SemesterData semester);

  @override
  Future<Email?> build() async {
    // Get selected semester
    final semesterSelection = await ref.watch(
      semesterSelectionModelProvider.future,
    );
    final selectedSemester = semesterSelection.selected;

    if (selectedSemester == null) return null;

    // Get classes by semester
    final courseClassIds = await ref.watch(
      courseClassIdsBySemesterProvider(selectedSemester.semester).future,
    );
    if (courseClassIds.isEmpty) return null;

    // Get emails through teaching assignments
    final recipients = <String>{};
    for (final classId in courseClassIds) {
      final assignments = await ref.watch(
        teachingAssignmentsProvider(classId).future,
      );
      for (final assignment in assignments) {
        final teacher = await ref.watch(
          teacherByIdProvider(assignment.teacherId).future,
        );
        recipients.add(teacher.personalEmail!);
      }
    }

    return Email(
      recipients: recipients,
      subject: subject(selectedSemester),
      body: body(selectedSemester),
    );
  }
}

class GradeSubmissionAnnouncementNotifier extends EmailToTeachersNotifier {
  @override
  String body(SemesterData selectedSemester) {
    final dateFmt = DateFormat("dd/MM/yyyy");
    final semesterName = selectedSemester.semester;
    final studyEndDate = dateFmt.format(selectedSemester.studyEndDate);
    final submissionDeadline = dateFmt.format(
      selectedSemester.studyEndDate.add(const Duration(days: 7)),
    );

    return """Kính gửi các Thầy, các Cô,

Ngày $studyEndDate là ngày kết thúc học tập của đợt học $semesterName.
Thầy/Cô tổ chức cho học viên thi và gửi hai bảng điểm ở Văn phòng Khoa cho em trước ngày $submissionDeadline.
Khi cho học viên thi, Thầy/Cô điền luôn ngày thi trên bảng điểm giúp em ạ.

Em cảm ơn Thầy/Cô ạ.""";
  }

  @override
  String subject(SemesterData semester) =>
      "[Nhắc việc] Nộp điểm đợt học ${semester.semester}";
}

class TeachingAnnouncementNotifier extends EmailToTeachersNotifier {
  @override
  String body(SemesterData selectedSemester) {
    final dateFmt = DateFormat("dd/MM/yyyy");
    final semesterName = selectedSemester.semester;
    final studyStartDate = dateFmt.format(
      selectedSemester.studyStartDate,
    );
    final studyEndDate = dateFmt.format(
      selectedSemester.studyEndDate,
    );
    final submissionDeadline = dateFmt.format(
      selectedSemester.gradeSubmissionDeadline,
    );

    return """Kính gửi các Thầy, các Cô,

Em gửi danh sách lớp của các lớp cao học của đợt học $semesterName kèm với bảng điểm quá trình và bảng điểm kết thúc học phần. Các lớp sẽ học từ ngày $studyStartDate đến ngày $studyEndDate.

Thầy, Cô lưu ý, trong buổi đầu tiên của học phần Thầy, Cô cung cấp đề cương chi tiết và kế hoạch học, thi cho lớp, trong đó xác định rõ:

      - Yêu cầu của học phần,
      - Nhiệm vụ của học viên,
      - Đánh giá kết quả trong số kiểm tra giữa kỳ, thi hết học phần,
      - Tài liệu học tập, tham khảo.

Lịch thi do Thầy, Cô sắp xếp ngay sau khi kết thúc học phần, thời gian thi nằm trong thời gian học của học kỳ. 

Thầy, Cô cho học viên thi, điền đủ thông tin ngày thi và nộp lại bảng điểm trước ngày $submissionDeadline. Em cảm ơn Thầy, Cô ạ.

Kính thư,
Nguyễn Đức Hùng""";
  }

  @override
  String subject(SemesterData semester) {
    return "[Thông báo] Về việc giảng dạy cao học đợt học ${semester.semester}";
  }
}

class CourseRegistrationMessageNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    // Selected semester
    final semesterSelection = await ref.watch(
      semesterSelectionModelProvider.future,
    );
    final selectedSemester = semesterSelection.selected;
    if (selectedSemester == null) return null;

    // If any semester is selected, returns the notification
    final dateFmt = DateFormat("dd/MM/yyyy");
    final semester = selectedSemester;
    final semesterName = semester.semester;
    final registerFromString = dateFmt.format(semester.registrationOpenDate);
    final registerToString = dateFmt.format(semester.registrationCloseDate);

    return "Đợt học $semesterName mở đăng ký từ $registerFromString đến $registerToString. Các bạn nhớ đăng ký học đúng thời gian nhé!";
  }
}
