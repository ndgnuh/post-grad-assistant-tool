import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fami_tools/business/documents/course_limiting_pdf.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../business/copy_pasta.dart';
import '../../business/db_v2_providers.dart';
import '../../business/documents.dart';
import '../../business/selection_models.dart';
import '../../utilities/strings.dart' show DateFormatter;

final courseLimitingEmail = FutureProvider<Email>(
  (ref) async {
    final selectedSemester = await ref.read(
      semesterSelectionModelProvider.future,
    );

    assert(selectedSemester.selected != null, "Chưa chọn học kỳ");
    final semester = selectedSemester.selected!.id;

    final myFaculty = await ref.watch(myFacultyProvider.future);
    final mySupervisor = await ref.watch(mySupervisorProvider.future);
    final mySupervisorEmail = {
      mySupervisor.workEmail,
      mySupervisor.personalEmail,
    }.whereType<String>().toSet();

    final subject =
        "Danh mục hạn chế học phần Khoa Toán - Tin, đợt học $semester";
    final body = """Kính gửi thầy Nguyễn Huy Hùng,

Em gửi danh mục hạn chế học phần của $myFaculty, đợt học $semester. Danh mục được đính kèm trong email. Nhờ thầy xử lý tiếp, em cảm ơn thầy ạ.""";

    final email = Email(
      // TODO: config study specialist recipients
      recipients: {"hung.nguyenhuy@hust.edu.vn"},
      subject: subject,
      body: body,
      ccRecipients: mySupervisorEmail,
    );

    return email;
  },
);

final courseLimitingModelProvider = FutureProvider(
  (ref) async {
    final semesterModel = await ref.watch(
      semesterSelectionModelProvider.future,
    );
    final semester = semesterModel.selected;
    final courses = await ref.watch(coursesProvider.future);
    final courseClasses = await ref.watch(
      previousSemesterCourseClassesProvider.future,
    );
    final limitedCourses = await ref.watch(limitedCourseProvider.future);

    final SemesterData? prevSemester;
    switch (semester) {
      case SemesterData semester:
        prevSemester = await ref.watch(
          previousSemesterProvider(semester).future,
        );

      default:
        prevSemester = null;
    }

    final faculty = await ref.watch(myFacultyProvider.future);

    return CourseLimitingModel(
      faculty: faculty,
      semester: semester,
      prevSemester: prevSemester,
      courseClasses: courseClasses.toSet(),
      limitedCourses: limitedCourses.toSet(),
      courses: courses,
    );
  },
);

final courseSelectionProvider = AsyncNotifierProvider(
  _CourseSelectionNotifier.new,
);

final coursesProvider = FutureProvider<List<CourseData>>((ref) async {
  final db = await ref.watch(mainDatabaseProvider.future);
  final stmt = db.course.select();
  stmt.where(
    (c) =>
        c.category.equals(CourseCategory.masterMajorKnowledge.value) |
        c.category.equals(CourseCategory.masterPracticalElection.value) |
        c.category.equals(CourseCategory.masterAdvancedSpecialized.value) |
        c.category.equals(CourseCategory.masterNonrestrictedElection.value),
  );
  stmt.orderBy([
    (c) => OrderingTerm.asc(c.category),
    (c) => OrderingTerm.asc(c.id),
  ]);

  final ids = await stmt.map((c) => c.id).get();

  final courses = <CourseData>[];
  for (final id in ids) {
    final course = await ref.watch(courseByIdProvider(id).future);
    courses.add(course);
  }

  return courses;
});

final limitedCourseProvider = AsyncNotifierProvider(
  LimitedCourseNotifier.new,
);

final previousSemesterCourseClassesProvider =
    FutureProvider<List<CourseClassData>>(
      (ref) async {
        /// Check selected semester
        final semesterModel = await ref.watch(
          semesterSelectionModelProvider.future,
        );
        final semester = semesterModel.selected;
        if (semester == null) return [];

        // Get previous semester
        final prevSemester = await ref.watch(
          previousSemesterProvider(semester).future,
        );

        if (prevSemester == null) return [];

        /// Get list of classes
        final ids = await ref.watch(
          courseClassIdsBySemesterProvider(prevSemester.id).future,
        );

        // Add course classes by IDs
        final courseClasses = <CourseClassData>[];
        for (final id in ids) {
          final courseClass = await ref.watch(
            courseClassByIdProvider(id).future,
          );
          courseClasses.add(courseClass);
        }

        return courseClasses;
      },
    );

final semesterSelectionModelProvider = AsyncNotifierProvider(
  () => SemesterSelectionModelNotifier("course-limiting"),
);

final _courseLimitingDocumentProvider =
    FutureProvider<CourseLimitingDocumentModel>(
      (ref) async {
        final model = await ref.watch(courseLimitingModelProvider.future);
        return model.documentModel();
      },
    );

final courseLimitingPdfProvider = FutureProvider.family(
  (ref, PdfConfig config) async {
    final provider = _courseLimitingDocumentProvider.future;
    final documentModel = await ref.watch(provider);
    return documentModel.buildPdf(config);
  },
);

final courseLimitingXlsxProvider = FutureProvider((ref) async {
  final prod = _courseLimitingDocumentProvider.future;
  final documentModel = await ref.watch(prod);
  return documentModel.buildXlsx();
});

typedef CourseLimitingViewModelArgs = ({String semesterId, String courseId});

class CourseLimitingModel {
  final SemesterData? semester;
  final SemesterData? prevSemester;
  final String? faculty;
  final List<CourseData> courses;
  final Set<CourseData> limitedCourses;
  final Set<CourseClassData> courseClasses;

  const CourseLimitingModel({
    required this.limitedCourses,
    required this.courses,
    required this.courseClasses,
    required this.semester,
    required this.prevSemester,
    required this.faculty,
  });

  CourseLimitingDocumentModel documentModel() {
    assert(semester != null, "Chưa chọn học kỳ");
    final limitedCourseList = courses
        .where((course) => limitedCourses.contains(course))
        .toList();
    limitedCourseList.sort((a, b) => a.id.compareTo(b.id));

    return CourseLimitingDocumentModel(
      courses: limitedCourseList,
      semester: semester!,
      faculty: faculty,
    );
  }

  List<CourseData> get availableForVoteCourses {
    final courses = nonrestrictedElectedCourses;
    return [
      for (final course in courses)
        if (!previouseCourses.contains(course)) course,
    ];
  }

  List<CourseData> get nonrestrictedElectedCourses {
    final output = <CourseData>[];
    for (final course in courses) {
      if (course.category == CourseCategory.masterNonrestrictedElection) {
        output.add(course);
      }
    }
    output.sort((a, b) => a.id.compareTo(b.id));
    return output;
  }

  List<CourseData> get notVvailableForVoteCourses {
    final courses = nonrestrictedElectedCourses;
    return [
      for (final course in courses)
        if (previouseCourses.contains(course)) course,
    ];
  }

  Set<CourseData> get previouseCourses {
    final Set<String> courseIds = {};
    for (final c in courseClasses) {
      if (c.status == CourseClassStatus.normal) courseIds.add(c.courseId);
    }

    return {
      for (final course in courses)
        if (courseIds.contains(course.id)) course,
    };
  }
}

class CourseLimitingViewModel {
  final CourseData course;
  final SemesterData semester;
  final bool limited;
  const CourseLimitingViewModel({
    required this.course,
    required this.semester,
    required this.limited,
  });
}

class CourseLimitingViewModelNotifier
    extends AsyncNotifier<CourseLimitingViewModel> {
  static final provider = AsyncNotifierProvider.family((
    CourseLimitingViewModelArgs args,
  ) {
    return CourseLimitingViewModelNotifier(
      semesterId: args.semesterId,
      courseId: args.courseId,
    );
  });
  final String courseId;

  final String semesterId;

  CourseLimitingViewModelNotifier({
    required this.courseId,
    required this.semesterId,
  });

  @override
  Future<CourseLimitingViewModel> build() async {
    final course = await ref.watch(courseByIdProvider(courseId).future);
    final semester = await ref.watch(semesterByIdProvider(semesterId).future);
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.courseLimiting.select();
    stmt.where(
      (c) => c.semesterId.equals(semesterId) & c.courseId.equals(courseId),
    );

    final entry = await stmt.getSingleOrNull();
    final limited = entry != null;
    return CourseLimitingViewModel(
      course: course,
      semester: semester,
      limited: limited,
    );
  }
}

class CourseSelection {
  final Set<CourseData> allCourses;
  final Set<CourseData> selectedCourses;

  const CourseSelection({
    required this.allCourses,
    this.selectedCourses = const {},
  });

  Set<CourseData> get leftOverCourses =>
      allCourses.difference(selectedCourses).toSet();

  CourseSelection copyWith({
    Set<CourseData>? allCourses,
    Set<CourseData>? selectedCourses,
  }) {
    return CourseSelection(
      allCourses: allCourses ?? this.allCourses,
      selectedCourses: selectedCourses ?? this.selectedCourses,
    );
  }

  CourseSelection deselectCourse(CourseData course) {
    final newSelected = Set<CourseData>.from(selectedCourses)..remove(course);
    return copyWith(selectedCourses: newSelected);
  }

  List<CourseData> filter({
    String? searchQuery,
    CourseCategory? selectedCategory,
  }) {
    var filtered = leftOverCourses;
    if (selectedCategory != null) {
      filtered = filtered
          .where((course) => course.category == selectedCategory)
          .toSet();
    }

    // Fitler by query
    if (searchQuery == null || searchQuery.isEmpty) {
      return filtered.toList();
    }
    final lowerQuery = searchQuery.toLowerCase();
    return filtered.where((CourseData course) {
      return course.id.toLowerCase().contains(lowerQuery) ||
          course.vietnameseName.toLowerCase().contains(lowerQuery) ||
          course.englishName.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  CourseSelection selectCourse(CourseData course) {
    final newSelected = Set<CourseData>.from(selectedCourses)..add(course);
    return copyWith(selectedCourses: newSelected);
  }
}

class LimitedCourseNotifier extends AsyncNotifier {
  @override
  Future<List<CourseData>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final semesterModel = await ref.watch(
      semesterSelectionModelProvider.future,
    );
    final semester = semesterModel.selected;

    if (semester == null) {
      return [];
    }

    final idsStmt = db.courseLimiting.selectOnly();
    idsStmt.addColumns([db.courseLimiting.courseId]);
    idsStmt.where(db.courseLimiting.semesterId.equals(semester.id));

    final stmt = db.course.select();
    stmt.where((c) => c.id.isInQuery(idsStmt));

    final courses = await stmt.get();

    return courses;
  }

  void setCourseLimited({
    required SemesterData semester,
    required CourseData course,
    required bool limited,
  }) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    if (limited) {
      await db.courseLimiting.insertOnConflictUpdate(
        CourseLimitingData(courseId: course.id, semesterId: semester.id),
      );
    } else {
      await db.courseLimiting.deleteWhere(
        (r) => r.courseId.equals(course.id) & r.semesterId.equals(semester.id),
      );
    }
    ref.invalidateSelf();
  }
}

class _CourseSelectionNotifier extends AsyncNotifier<CourseSelection> {
  List<CourseData> searchedHocPhan = [];
  Set<CourseData> selectedHocPhan = {};

  @override
  FutureOr<CourseSelection> build() async {
    final courses = await ref.watch(coursesProvider.future);
    return CourseSelection(allCourses: courses.toSet());
  }

  void deSelectCourse(CourseData course) {
    switch (state) {
      case AsyncLoading<CourseSelection>():
        return;
      case AsyncError<CourseSelection>():
        return;
      case AsyncData<CourseSelection>(:final value):
        state = AsyncData(value.deselectCourse(course));
    }
  }

  void selectCourse(CourseData course) {
    switch (state) {
      case AsyncLoading<CourseSelection>():
        return;
      case AsyncError<CourseSelection>():
        return;
      case AsyncData<CourseSelection>(:final value):
        state = AsyncData(value.selectCourse(course));
    }
  }
}

final courseNotifier = ValueNotifier<CourseData?>(null);

FutureOr<R> Function(Ref) buildWithNotifier<R, T>({
  required ValueNotifier<T> notifier,
  required FutureOr<R> Function(Ref ref, ValueNotifier<T>) builder,
}) {
  FutureOr<R> wrapped(Ref ref) {
    return builder(ref, notifier);
  }

  return wrapped;
}

class SelectionModelNotifier<T> extends AsyncNotifier<SelectionModel<T>> {
  final FutureOr<List<T>> Function(Ref) optionsBuilder;
  final FutureOr<T?> Function(Ref, List<T>, T?) selectionBuilder;
  SelectionModelNotifier({
    required this.optionsBuilder,
    required this.selectionBuilder,
  });

  T? selectedValue() {
    return state.value?.selected;
  }

  void select(T? value) {
    final options = state.requireValue.options;
    final model = SelectionModel<T>(
      selected: value,
      options: options,
    );
    state = AsyncData(model);
  }

  @override
  Future<SelectionModel<T>> build() async {
    final options = await optionsBuilder(ref);
    final selection = await selectionBuilder(ref, options, selectedValue());
    final model = SelectionModel<T>(
      selected: selection,
      options: options,
    );
    return model;
  }
}

class SelectedCourseNotifier extends Notifier<CourseData?> {
  static final provider = NotifierProvider<SelectedCourseNotifier, CourseData?>(
    SelectedCourseNotifier.new,
  );

  @override
  CourseData? build() {
    ref.watch(limitedCourseProvider.future).then((courseList) {
      if (courseList.isNotEmpty) {
        state = courseList.first;
      }
    });
    return null;
  }

  void select(CourseData? course) {
    state = course;
  }
}

class SelectedTeacherNotifier extends Notifier<TeacherData?> {
  static final provider =
      NotifierProvider<SelectedTeacherNotifier, TeacherData?>(
        SelectedTeacherNotifier.new,
      );

  @override
  TeacherData? build() {
    ref.watch(teachersProvider.future).then((teacherList) {
      if (teacherList.isNotEmpty) {
        state = teacherList.first;
      }
    });
    return null;
  }

  void select(TeacherData? teacher) {
    state = teacher;
  }
}

final invitationCourseSelectionProvider = AsyncNotifierProvider(
  () => SelectionModelNotifier<CourseData>(
    optionsBuilder: (ref) async {
      final courses = await ref.watch(limitedCourseProvider.future);
      return courses;
    },
    selectionBuilder: (ref, options, previous) async {
      if (options.contains(previous)) {
        return previous;
      }
      return options.first;
    },
  ),
);

final teachersProvider = FutureProvider(
  (ref) async {
    final course = ref.watch(SelectedCourseNotifier.provider);
    if (course == null) {
      throw AssertionError("Chưa chọn học phần");
    }

    final ids = await ref.watch(teacherIdsByCourseProvider(course.id).future);
    final teachers = <TeacherData>[];
    for (final id in ids) {
      final teacher = await ref.watch(teacherByIdProvider(id).future);
      teachers.add(teacher);
    }
    return teachers;
  },
);

final invitationMessageProvider = FutureProvider<String>((ref) async {
  // Giảng viên đã chọn
  final teacher = ref.watch(SelectedTeacherNotifier.provider);
  if (teacher == null) throw UnselectedException("Chưa chọn giảng viên");

  // Học phần đã chọn
  final course = ref.watch(SelectedCourseNotifier.provider);
  if (course == null) throw UnselectedException("Chưa chọn học phần");

  // Học kỳ đã chọn
  final semesterModel = await ref.watch(
    semesterSelectionModelProvider.future,
  );
  final semester = semesterModel.selected;
  if (semester == null) throw UnselectedException("Chưa chọn học kỳ");

  final pronoun = teacher.pronoun;
  final greeting = pronoun.greeting;
  final classBeginDate = semester.classBeginDate.toDmy(separator: '/');
  final classEndDate = semester.classEndDate.toDmy(separator: '/');
  final courseName = course.vietnameseName;
  final message =
      """$greeting, đợt học cao học ${semester.id} dự kiến sẽ mở lớp $courseName, thời gian giảng dạy là $classBeginDate tới $classEndDate. ${pronoun.capitalized} có muốn nhận dạy không ạ?

${pronoun.capitalized} cân nhắc và phản hồi lại em với ạ. Em hỏi để dự kiến mở môn chứ hiện tại chưa chốt mở học phần nào. Nếu nhận dạy, ${pronoun.pronoun} dự trù trước số GD và đăng ký dạy các môn cử nhân để tránh bị thừa ạ. Em cảm ơn ${pronoun.pronoun} ạ.""";
  return message;
});

// Dự trù thầy cô giảng dạy để copy vào excel
final draftProvider = FutureProvider<String>((ref) async {
  // Học phần giới hạn
  final courses = await ref.watch(limitedCourseProvider.future);

  final List<List<String>> rows = [
    [
      "Mã HP",
      "Tên học phần",
      "Giảng viên",
    ],
  ];

  for (final course in courses) {
    // Giảng viên dạy học phần
    final teacherIds = await ref.watch(
      teacherIdsByCourseProvider(course.id).future,
    );

    // Lưu tên giảng viên
    final teacherNames = <String>[];
    for (final id in teacherIds) {
      final teacher = await ref.watch(teacherByIdProvider(id).future);
      teacherNames.add(teacher.name);
    }

    final teacherNamesStr = teacherNames.isEmpty
        ? "Chưa có"
        : teacherNames.join("\n");

    rows.add([
      course.id,
      course.vietnameseName,
      teacherNamesStr,
    ]);
  }

  return toExcelPastable(rows);
});
