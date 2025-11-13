import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:fami_tools/business/copy_pasta.dart';
import 'package:fami_tools/business/excel_files.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business/db_v2_providers.dart';
import '../../business/pdfs/pdfs.dart';
import '../../business/selection_models.dart';
import '_interpersonal.dart' as interpersonal;
import 'providers.dart';

/// Provide whether to use polite pronoun when addressing the selected teacher
final politenessProvider = AsyncNotifierProvider.family(
  PoliteNotifier.new,
);

/// Which candiddate teacher is selected on the UI
final candidateSelectionProvider = AsyncNotifierProvider.family(
  CandidateSelectionNotifier.new,
);

final teachingAssignmentEmailProvider = FutureProvider<Email?>((ref) async {
  // Get selected teacher
  final semesterSelection = await ref.watch(
    semesterSelectionModelProvider.future,
  );
  final semester = semesterSelection.selected;
  if (semester == null) return null;

  // Information
  final specialistName = "Nguyễn Huy Hùng"; // TODO: get from preference
  final specialistPronoun = "thầy";
  final specialistEmail =
      "hung.nguyenhuy@hust.edu.vn"; // TODO: get from preference
  final semesterId = semester.id;
  final myFalcuty =
      await ref.watch(myFacultyProvider.future) ?? "<<<< MY FACULTY >>>>";
  final myName = await ref.watch(myNameProvider.future) ?? "<<<< MY NAME >>>>";

  // Supervisor email
  final mySupervisorId = await ref.watch(mySupervisorIdProvider.future);
  final String mySupervisorEmail;
  if (mySupervisorId == null) {
    mySupervisorEmail = "";
  } else {
    final mySupervisor = await ref.watch(
      teacherByIdProvider(mySupervisorId).future,
    );
    mySupervisorEmail = mySupervisor.email!;
  }

  /// List of course classes requires room arrangement
  final classIds = await ref.watch(
    courseClassIdsBySemesterProvider(semester.id).future,
  );
  final needsRoomArrangement = <String>[];
  for (final classId in classIds) {
    final courseClass = await ref.watch(
      courseClassByIdProvider(classId).future,
    );
    final course = await ref.watch(
      courseByIdProvider(courseClass.courseId).future,
    );

    if (courseClass.status == CourseClassStatus.canceled) continue;
    if (courseClass.classId.startsWith("MI") == false) continue;
    if (courseClass.registrationCount < 5) continue;
    if ((courseClass.classroom ?? "").isEmpty ||
        courseClass.classroom?.toLowerCase() == "mượn") {
      final className = courseClass.classId.replaceFirst(
        course.id,
        course.vietnameseName,
      );
      needsRoomArrangement.add("- $className");
    }
  }

  final String arrangementRequest;
  if (needsRoomArrangement.isEmpty) {
    arrangementRequest =
        "Các lớp học dưới đây cần được sắp xếp phòng học, mong $specialistPronoun hỗ trợ ạ:"
        "\n${needsRoomArrangement.join('\n')}\n\n"
        "Em cảm ơn $specialistPronoun ạ.";
  } else {
    arrangementRequest = "Em cảm ơn $specialistPronoun ạ.";
  }

  final body =
      """
Kính gửi $specialistPronoun $specialistName,
    
Em gửi bảng phân công giảng dạy cao học đợt học $semesterId ạ. Bảng phân công được đính kèm trong email ạ.

$arrangementRequest
    
Trân trọng,
$myName"""
          .trim();

  return Email(
    recipients: {specialistEmail},
    ccRecipients: {mySupervisorEmail},
    subject: "Phân công giảng dạy đợt học ${semester.id}, $myFalcuty",
    body: body,
  );
});

final teachingAssignmentPdfProvider = FutureProvider((ref) async {
  final model = await ref.watch(teachingAssignmentOutputModelProvider.future);
  if (model == null) return null;

  return PdfFile.mscCourseClass.teachingAssignment(
    semester: model.semester,
    courseClasses: model.courseClasses,
    mapCourses: model.mapCourses,
    mapTeachers: model.mapTeachers,
    mapWeights: model.mapWeights,
  );
});

final teachingAssignmentXlsxProvider = FutureProvider((ref) async {
  final model = await ref.watch(teachingAssignmentOutputModelProvider.future);
  if (model == null) return null;

  return ExcelFile.msc.teachingAssignment(
    semester: model.semester,
    courseClasses: model.courseClasses,
    mapCourses: model.mapCourses,
    mapTeachers: model.mapTeachers,
    mapWeights: model.mapWeights,
  );
});

/// Provide the teachers assigned to
/// teach a course class, along with their contribution percentage
/// it can hold emmepheral state though
final teachingAssignmentViewModelProvider = AsyncNotifierProvider.family(
  TeachingAssignmentViewModelNotifier.new,
);

final teachingInvitationMessageProvider = FutureProvider.family((
  ref,
  int classId,
) async {
  /// Get selected teacher
  final candidateSelection = await ref.watch(
    candidateSelectionProvider(classId).future,
  );
  final teacher = candidateSelection.selected;
  if (teacher == null) {
    return 'Chưa chọn giảng viên để mời';
  }

  /// Get semester info from class
  final courseClass = await ref.watch(
    courseClassViewModelByIdProvider(classId).future,
  );

  /// Get politeness preference
  final isPolite = await ref.watch(
    politenessProvider(classId).future,
  );
  final pronoun = switch ((isPolite, teacher.gender)) {
    (true, Gender.male) => Pronoun.thay,
    (true, Gender.female) => Pronoun.co,
    (false, Gender.male) => Pronoun.anh,
    (false, Gender.female) => Pronoun.chi,
    (_, _) => Pronoun.sir,
  };

  return interpersonal.teachingInvitationMessage(
    pronoun: pronoun,
    semester: courseClass.semester,
    courseName: courseClass.course.vietnameseName,
    numberOfRegisteredStudents: courseClass.registrationCount,
  );
});

class CandidateSelectionNotifier
    extends AsyncNotifier<SelectionModel<TeacherData>> {
  final int courseClassId;
  CandidateSelectionNotifier(this.courseClassId);
  @override
  FutureOr<SelectionModel<TeacherData>> build() async {
    final courseClass = await ref.watch(
      courseClassByIdProvider(courseClassId).future,
    );

    final teacherIds = await ref.watch(
      teacherIdsByCourseProvider(courseClass.courseId).future,
    );

    final teachers = <TeacherData>[];
    for (final teacherId in teacherIds) {
      final teacher = ref.watch(teacherByIdProvider(teacherId)).value;
      if (teacher != null) {
        teachers.add(teacher);
      }
    }

    return SelectionModel<TeacherData>(
      options: teachers,
      selected: teachers.firstOrNull,
    );
  }

  void selectTeacher(TeacherData? teacher) {
    state = AsyncData(
      SelectionModel<TeacherData>(
        options: state.value!.options,
        selected: teacher,
      ),
    );
  }
}

class TeachingAssignmentViewModel {
  final int classId;
  final List<TeacherData> assignedTeachers;
  final List<double> weights;

  double get totalWeight => weights.fold<double>(
    0.0,
    (previousValue, element) => previousValue + element,
  );

  TeachingAssignmentViewModel({
    required this.classId,
    required this.assignedTeachers,
    required this.weights,
  });

  TeachingAssignmentViewModel addTeacher(TeacherData teacher, double weight) {
    if (assignedTeachers.contains(teacher)) {
      return this;
    }
    return TeachingAssignmentViewModel(
      classId: classId,
      assignedTeachers: [...assignedTeachers, teacher],
      weights: [...weights, weight],
    );
  }

  TeachingAssignmentViewModel removeTeacher(TeacherData teacher) {
    final index = assignedTeachers.indexOf(teacher);
    if (index == -1) return this;

    final newTeachers = List<TeacherData>.from(assignedTeachers);
    final newWeights = List<double>.from(weights);
    newTeachers.removeAt(index);
    newWeights.removeAt(index);
    return TeachingAssignmentViewModel(
      classId: classId,
      assignedTeachers: newTeachers,
      weights: newWeights,
    );
  }

  TeachingAssignmentViewModel setWeight(TeacherData teacher, double weight) {
    final index = assignedTeachers.indexOf(teacher);
    if (index == -1) return this;

    final newWeights = List<double>.from(weights);
    newWeights[index] = weight;
    return TeachingAssignmentViewModel(
      classId: classId,
      assignedTeachers: assignedTeachers,
      weights: newWeights,
    );
  }

  List<TeachingAssignmentCompanion> get toCompanions {
    final companions = <TeachingAssignmentCompanion>[];
    for (int i = 0; i < assignedTeachers.length; i++) {
      final teacher = assignedTeachers[i];
      final weight = weights[i];
      companions.add(
        TeachingAssignmentCompanion.insert(
          classId: classId,
          teacherId: teacher.id,
          weight: Value(weight),
          sortOrder: Value(i),
        ),
      );
    }
    return companions;
  }
}

/// Acts like a view model for teaching assignments
class TeachingAssignmentViewModelNotifier
    extends AsyncNotifier<TeachingAssignmentViewModel> {
  final int classId;
  bool dirty = false;
  TeachingAssignmentViewModelNotifier(this.classId);

  @override
  FutureOr<TeachingAssignmentViewModel> build() async {
    final entries = await ref.watch(
      teachingAssignmentByClassProvider(classId).future,
    );

    final List<TeacherData> teachers = [];
    final weights = <double>[];
    for (final entry in entries) {
      final teacher = await ref.watch(
        teacherByIdProvider(entry.teacherId).future,
      );

      teachers.add(teacher);
      weights.add(entry.weight);
    }
    return TeachingAssignmentViewModel(
      classId: classId,
      assignedTeachers: teachers,
      weights: weights,
    );
  }

  void addTeacher(TeacherData teacher, [double weight = 1.0]) {
    final model = state.value!;
    state = AsyncData(model.addTeacher(teacher, weight));
    dirty = true;
  }

  void setWeight(TeacherData teacher, double weight) {
    final model = state.value!;
    state = AsyncData(model.setWeight(teacher, weight));
    dirty = true;
  }

  void removeTeacher(TeacherData teacher) {
    final model = state.value!;
    state = AsyncData(model.removeTeacher(teacher));
    dirty = true;
  }

  void reset() {
    dirty = false;
    ref.invalidateSelf();
  }

  void commit() {
    final companions = state.value!.toCompanions;
    final notifier = ref.read(
      teachingAssignmentByClassProvider(classId).notifier,
    );
    notifier.setAssignment(companions);
    dirty = false;
  }
}

class PoliteNotifier extends AsyncNotifier<bool> {
  final int courseClassId;
  PoliteNotifier(this.courseClassId);

  String politeKey(int teacherId) => 'polite-pronoun/$teacherId';

  @override
  Future<bool> build() async {
    // Get selected teacher
    final teacherSelectionModel = await ref.watch(
      candidateSelectionProvider(courseClassId).future,
    );
    final selectedTeacher = teacherSelectionModel.selected;
    if (selectedTeacher == null) return false;

    // Get politeness preference
    final key = politeKey(selectedTeacher.id);
    final pref = await SharedPreferences.getInstance();
    final politePref = pref.getBool(key);

    // If pref is null, set to true
    if (politePref == null) {
      await pref.setBool(key, true);
      return true;
    }

    return politePref;
  }

  void set(bool newValue) async {
    // Update state
    state = AsyncValue.data(newValue);

    // Get selected teacher
    final teacherSelectionModel = await ref.watch(
      candidateSelectionProvider(courseClassId).future,
    );
    final selectedTeacher = teacherSelectionModel.selected;
    if (selectedTeacher == null) return;
    final key = politeKey(selectedTeacher.id);
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(key, newValue);
  }
}

final teachingAssignmentOutputModelProvider = FutureProvider((ref) async {
  final semesterSelection = await ref.watch(
    semesterSelectionModelProvider.future,
  );
  final semester = semesterSelection.selected;
  if (semester == null) return null;

  final courseClassIds = await ref.watch(
    courseClassIdsBySemesterProvider(semester.id).future,
  );

  final courseClasses = <CourseClassData>[];
  final mapTeachers = <int, List<TeacherData>>{};
  final mapWeights = <int, List<double>>{};
  final mapCourses = <int, CourseData>{};

  for (final classId in courseClassIds) {
    final courseClass = await ref.watch(
      courseClassByIdProvider(classId).future,
    );
    if (!courseClass.courseId.startsWith("MI")) continue;

    final course = await ref.watch(
      courseByIdProvider(courseClass.courseId).future,
    );
    final assignment = await ref.watch(
      teachingAssignmentsProvider(classId).future,
    );
    final teachers = [
      for (final a in assignment)
        await ref.watch(teacherByIdProvider(a.teacherId).future),
    ];
    final weights = [for (final a in assignment) a.weight];

    courseClasses.add(courseClass);
    mapCourses[classId] = course;
    mapTeachers[classId] = teachers;
    mapWeights[classId] = weights;
  }

  return (
    semester: semester,
    courseClasses: courseClasses,
    mapCourses: mapCourses,
    mapTeachers: mapTeachers,
    mapWeights: mapWeights,
  );
});
