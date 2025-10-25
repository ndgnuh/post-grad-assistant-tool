part of 'teaching_assignment.dart';

/// Provide the easy-to-use view model for teaching assignment
final teachingAssignmentViewModelProvider = AsyncNotifierProvider.family(
  TeachingAssignmentViewModelNotifier.new,
);

/// Provide whether to use polite pronoun when addressing the selected teacher
final politenessProvider = AsyncNotifierProvider.family(
  PoliteNotifier.new,
);

/// Provide teachers that:
/// - can teach the course
/// - are not yet assigned to the class
final candidateTeachersProvider = AsyncNotifierProvider.family(
  CandidateTeachersNotifier.new,
);

/// Which candiddate teacher is selected on the UI
final selectedCandidateTeacherProvider = AsyncNotifierProvider.family(
  SelectedCandidateTeacherNotifier.new,
);

/// Provide the teachers assigned to
/// teach a course class, along with their contribution percentage
/// it can hold emmepheral state though
final assignedTeachersProvider = AsyncNotifierProvider.family(
  AssignedTeachersNotifier.new,
);

class SelectedCandidateTeacherNotifier extends AsyncNotifier<TeacherData?> {
  final int courseClassId;
  SelectedCandidateTeacherNotifier(this.courseClassId);
  @override
  FutureOr<TeacherData?> build() async {
    final candidates = await ref.watch(
      candidateTeachersProvider(courseClassId).future,
    );

    return candidates.firstOrNull;
  }

  void select(TeacherData teacher) {
    state = AsyncData(teacher);
  }

  void clear() {
    state = AsyncData(null);
  }
}

class AssignedTeachersNotifier extends AsyncNotifier<Map<TeacherData, double>> {
  bool dirty = false;
  final int courseClassId;
  AssignedTeachersNotifier(this.courseClassId);

  @override
  FutureOr<Map<TeacherData, double>> build() async {
    if (dirty) {
      return state.value ?? {};
    }

    final assignments = await ref.watch(
      teachingAssignmentsProvider(courseClassId).future,
    );

    final Map<TeacherData, double> result = {};
    for (final assignment in assignments) {
      final teacher = await ref.watch(
        teacherByIdProvider(assignment.teacherId).future,
      );
      if (teacher != null) {
        result[teacher] = assignment.weight;
      }
    }
    return result;
  }

  void reset() {
    dirty = false;
    ref.invalidateSelf();
  }

  void removeTeacher(TeacherData teacher) {
    switch (state) {
      case AsyncData(:final value):
        final newValue = Map<TeacherData, double>.from(value);
        newValue.remove(teacher);
        state = AsyncData(newValue);
        dirty = true;
        ref.invalidateSelf();
      default:
    }
  }

  void addSelectedTeacher() async {
    final tba = await ref.read(
      selectedCandidateTeacherProvider(courseClassId).future,
    );
    if (tba == null) return;

    switch (state) {
      case AsyncData(:final value):
        final newValue = Map<TeacherData, double>.from(value);
        newValue[tba] = 1.0;
        state = AsyncData(newValue);
        dirty = true;
        print("Updated");
        ref.invalidateSelf();
      default:
    }
  }
}

class CandidateTeachersNotifier extends AsyncNotifier<List<TeacherData>> {
  final int courseClassId;
  CandidateTeachersNotifier(this.courseClassId);

  @override
  Future<List<TeacherData>> build() async {
    final courseClass = await ref.watch(
      courseClassByIdProvider(courseClassId).future,
    );
    if (courseClass == null) return [];

    // Get all teachers that can teach the course
    final teacherIds = await ref.watch(
      teacherIdsByCourseProvider(courseClass.courseId).future,
    );

    // Get assigned teacher ids
    final assignmentTeachers = await ref.watch(
      assignedTeachersProvider(courseClassId).future,
    );

    // Fetch teacher data
    final teachers = <TeacherData>[];
    for (final teacherId in teacherIds) {
      final teacher = ref.watch(teacherByIdProvider(teacherId)).value;
      if (teacher != null && !assignmentTeachers.containsKey(teacher)) {
        teachers.add(teacher);
      }
    }

    return teachers;
  }
}

class TeachingAssignmentViewModel {
  final CourseData course;
  final CourseClassData courseClass;
  final SemesterData semester;
  final int registrationCount;
  final List<TeacherData> candidateTeachers;
  final TeacherData? selectedTeacher;

  TeachingAssignmentViewModel({
    required this.course,
    required this.courseClass,
    required this.semester,
    required this.candidateTeachers,
    required this.registrationCount,
    this.selectedTeacher,
  });
}

class TeachingAssignmentViewModelNotifier
    extends AsyncNotifier<TeachingAssignmentViewModel> {
  final int courseClassId;
  TeachingAssignmentViewModelNotifier(this.courseClassId);

  @override
  Future<TeachingAssignmentViewModel> build() async {
    final courseClass = (await ref.watch(
      courseClassByIdProvider(courseClassId).future,
    ))!;

    final course = (await ref.watch(
      courseByIdProvider(courseClass.courseId).future,
    ))!;
    final semester = (await ref.watch(
      semesterByIdProvider(courseClass.semester).future,
    ))!;

    final candidateTeachers = await ref.watch(
      candidateTeachersProvider(courseClassId).future,
    );

    final registrationCount = await ref.watch(
      registrationCountProvider(courseClassId).future,
    );

    final selectedTeacher = await ref.watch(
      selectedCandidateTeacherProvider(courseClassId).future,
    );

    return TeachingAssignmentViewModel(
      semester: semester,
      course: course,
      courseClass: courseClass,
      candidateTeachers: candidateTeachers,
      registrationCount: registrationCount,
      selectedTeacher: selectedTeacher,
    );
  }
}

class PoliteNotifier extends AsyncNotifier<bool> {
  final int courseClassId;
  PoliteNotifier(this.courseClassId);

  String politeKey(int teacherId) => 'polite-pronoun/$teacherId';

  @override
  Future<bool> build() async {
    // Get selected teacher
    final teacher = await ref.watch(
      selectedCandidateTeacherProvider(courseClassId).future,
    );
    if (teacher == null) return false;

    // Get politeness preference
    final key = politeKey(teacher.id);
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

    // Store preference
    final teacher = await ref.read(
      selectedCandidateTeacherProvider(courseClassId).future,
    );
    if (teacher == null) return;
    final key = politeKey(teacher.id);
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(key, newValue);
  }
}
