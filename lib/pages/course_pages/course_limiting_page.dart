import 'dart:async';

import 'package:drift/drift.dart' hide Column;
import 'package:fami_tools/shortcuts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../business/copy_pasta.dart';
import '../../business/db_v2_providers.dart';
import '../../business/selection_models.dart';
import '../../custom_widgets.dart';

class CourseLimitingModel {
  final SemesterData? semester;
  final SemesterData? prevSemester;
  final List<CourseData> courses;
  final Set<CourseData> limitedCourses;
  final Set<CourseClassData> courseClasses;

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

  List<CourseData> get availableForVoteCourses {
    final courses = nonrestrictedElectedCourses;
    return [
      for (final course in courses)
        if (!previouseCourses.contains(course)) course,
    ];
  }

  List<CourseData> get notVvailableForVoteCourses {
    final courses = nonrestrictedElectedCourses;
    return [
      for (final course in courses)
        if (previouseCourses.contains(course)) course,
    ];
  }

  const CourseLimitingModel({
    required this.limitedCourses,
    required this.courses,
    required this.courseClasses,
    required this.semester,
    required this.prevSemester,
  });
}

typedef CourseLimitingViewModelArgs = ({String semesterId, String courseId});

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
  final String courseId;
  final String semesterId;

  static final provider = AsyncNotifierProvider.family((
    CourseLimitingViewModelArgs args,
  ) {
    return CourseLimitingViewModelNotifier(
      semesterId: args.semesterId,
      courseId: args.courseId,
    );
  });

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

final previousSemesterCourseClassesProvider =
    FutureProvider<List<CourseClassData>>(
      (ref) async {
        /// Check selected semester
        final semesterModel = await ref.watch(
          _semesterSelectionModelProvider.future,
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

final courseLimitingModelProvider = FutureProvider(
  (ref) async {
    final semesterModel = await ref.watch(
      _semesterSelectionModelProvider.future,
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

    return CourseLimitingModel(
      semester: semester,
      prevSemester: prevSemester,
      courseClasses: courseClasses.toSet(),
      limitedCourses: limitedCourses.toSet(),
      courses: courses,
    );
  },
);

final _courseSelectionProvider = AsyncNotifierProvider(
  _CourseSelectionNotifier.new,
);

final limitedCourseProvider = AsyncNotifierProvider(
  LimitedCourseNotifier.new,
);

class LimitedCourseNotifier extends AsyncNotifier {
  @override
  Future<List<CourseData>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final semesterModel = await ref.watch(
      _semesterSelectionModelProvider.future,
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
    print("Set course ${course.id} to limited $limited");
    ref.invalidateSelf();
    // ref.invalidate(courseLimitingModelProvider);
  }
}

final _searchQueryProvider = NotifierProvider<_SearchQueryNotifier, String>(
  _SearchQueryNotifier.new,
);

final _selectedCourseCategoryProvider = NotifierProvider(
  _SelectedCourseCategoryNotifier.new,
);

final _semesterSelectionModelProvider = AsyncNotifierProvider(
  () => SemesterSelectionModelNotifier("course-limiting"),
);

class CourseLimitingPage extends StatelessWidget {
  static const routeName = "/lop-tc/han-che-hp";

  const CourseLimitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final flexDirection = switch (context.screenSize) {
      ScreenSize.large => Axis.horizontal,
      ScreenSize.medium => Axis.horizontal,
      ScreenSize.small => Axis.vertical,
    };

    final gutter = context.responsiveGutter;

    return TrackedTabController(
      length: 2,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: Text("Hạn chế học phần"),
            actions: [
              Consumer(
                builder: (context, ref, _) => TextButton.icon(
                  onPressed: () {
                    ref.invalidate(courseLimitingModelProvider);
                  },
                  label: Text("Refresh"),
                  icon: Icon(Symbols.refresh),
                ),
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "Danh mục"),
                Tab(text: "Quản lý"),
              ],
            ),
          ),
        ),
        body: ConstrainedBody(
          child: TabBarView(
            children: [
              _CourseListTabView(),
              _ActionTabView(),
              // Padding(
              //   padding: EdgeInsets.all(gutter),
              //   child: Column(
              //     spacing: gutter,
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: [
              //       // Tool bar in medium and large screen only
              //       if (context.isLargeScreen) ...[
              //         _ActionMenuLarge(),
              //         Divider(),
              //       ],
              //       if (context.isMediumScreen) ...[
              //         _ActionMenuMedium(),
              //         Divider(),
              //       ],
              //
              //       // The courses
              //       Expanded(
              //         child: Flex(
              //           direction: flexDirection,
              //           spacing: gutter,
              //           children: [
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   ListTile(
              //                     title: Text(
              //                       "Danh sách học phần",
              //                       style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   ),
              //                   Expanded(child: _LeftOverCourseListView()),
              //                 ],
              //               ),
              //             ),
              //             if (context.isMediumOrLargerScreen)
              //               VerticalDivider()
              //             else
              //               Divider(),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   _SelectedCourseLabel(),
              //                   Expanded(
              //                     child: _SelectedCourseListView(),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       // Expanded(
              //       //   child: Flex(
              //       //     direction: flexDirection,
              //       //     children: [
              //       //       // _HeaderRow.daTimKiem(),
              //       //       Flexible(
              //       //         child: _DanhSachHocPhan.daTimKiem(),
              //       //       ),
              //       //       // _HeaderRow.daChon(),
              //       //       Flexible(
              //       //         child: _DanhSachHocPhan.daLuaChon(),
              //       //       ),
              //       //     ],
              //       //   ),
              //       // ),
              //       if (context.isSmallScreen) ...[Divider(), _ActionButton()],
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseListTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          _SemesterSelector(),
          Expanded(child: _CourseLimitingListView()),
        ],
      ),
    );
  }
}

class _CourseLimitingListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(courseLimitingModelProvider);
    switch (modelAsync) {
      case AsyncLoading():
        return Center(child: LinearProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ErrorWidget(error);
      default:
    }

    final model = modelAsync.value!;
    final courses = model.courses;
    final limitedCourses = model.limitedCourses;
    final semester = model.semester;
    final previousCourses = model.previouseCourses;

    return ListView.separated(
      separatorBuilder: (_, _) => Divider(),
      itemCount: courses.length,
      itemBuilder: (context, int i) {
        final course = courses[i];
        final previouslyOpenned = previousCourses.contains(course);
        final limited = limitedCourses.contains(course);

        return _CourseLimitingListTile(
          courseId: course.id,
          semesterId: semester!.id,
          previouslyOpenned: previouslyOpenned,
          limited: limited,
        );
      },
    );
  }
}

class _CourseLimitingListTile extends ConsumerWidget {
  final String courseId;
  final String semesterId;
  final bool previouslyOpenned;
  final bool limited;

  const _CourseLimitingListTile({
    required this.courseId,
    required this.semesterId,
    required this.previouslyOpenned,
    required this.limited,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = CourseLimitingViewModelNotifier.provider((
      semesterId: semesterId,
      courseId: courseId,
    ));

    final modelAsync = ref.watch(provider);
    switch (modelAsync) {
      case AsyncLoading():
        return ListTile(
          title: LinearProgressIndicator(),
        );
      case AsyncError(:final error, :final stackTrace):
        return ErrorWidget(error);
      default:
    }

    final model = modelAsync.value!;
    final course = model.course;
    final title = [course.id, course.vietnameseName].join(" ");

    return CheckboxListTile(
      key: ValueKey((courseId, semesterId)),
      title: Text(title),
      subtitle: Text(course.category.label),
      value: limited,
      enabled: previouslyOpenned == false,
      onChanged: (value) {
        final notifier = ref.watch(limitedCourseProvider.notifier);
        notifier.setCourseLimited(
          semester: model.semester,
          course: course,
          limited: value ?? limited,
        );
      },
    );
  }
}

@immutable
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

class _ActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: null,
      child: Text("Hành động"),
    );
  }
}

// class _ActionMenuLarge extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return EzRow(
//       spacing: context.responsiveGutter,
//       children: [
//         Expanded(
//           child: _SearchField(),
//         ),
//         _CourseCategorySelector(),
//         _SemesterSelector(),
//         _LinkToSemesterPage(),
//         _ExportPdfButton(),
//         _EmailButton(),
//       ],
//     );
//   }
// }

// class _ActionMenuMedium extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       spacing: context.responsiveGutter,
//       children: [
//         EzRow(
//           children: [
//             Expanded(
//               child: _SearchField(),
//             ),
//             Flexible(
//               flex: 1,
//               fit: FlexFit.tight,
//               child: _CourseCategorySelector(),
//             ),
//           ],
//         ),
//         Divider(),
//         EzRow(
//           children: [
//             _LinkToSemesterPage(),
//             _SemesterSelector(),
//             _ExportPdfButton(),
//             _EmailButton(),
//           ],
//         ),
//       ],
//     );
//   }
// }

class _CourseCategorySelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: DropdownMenu<CourseCategory?>(
        expandedInsets: EdgeInsets.zero,
        label: Text("Nhóm học phần"),
        onSelected: (value) {
          ref.read(_selectedCourseCategoryProvider.notifier).set(value);
        },
        dropdownMenuEntries: [
          DropdownMenuEntry(value: null, label: "Tất cả"),
          for (final category in CourseCategory.values)
            DropdownMenuEntry(
              value: category,
              label: category.label,
            ),
        ],
      ),
    );
  }
}

// class _CourseListView extends StatelessWidget {
//   final List<CourseData> courses;
//   final IconData actionIcon;
//   final Function(CourseData) actionOnPressed;
//
//   const _CourseListView({
//     required this.courses,
//     required this.actionIcon,
//     required this.actionOnPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       // padding: EdgeInsetsDirectional.all(0),
//       itemCount: courses.length,
//       itemBuilder: (context, i) {
//         final course = courses[i];
//         final label =
//             "${course.id} - ${course.vietnameseName} (${course.numCredits} TC)";
//
//         return ListTile(
//           subtitle: Text(course.englishName),
//           title: Text(label),
//           onTap: () => actionOnPressed(course),
//           trailing: IconButton(
//             onPressed: () => actionOnPressed(course),
//             icon: Icon(actionIcon),
//           ),
//         );
//       },
//     );
//   }
// }

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

class _EmailButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton.icon(
      onPressed: () async {
        final selectedSemester = await ref.read(
          _semesterSelectionModelProvider.future,
        );
        final semester = selectedSemester.selected?.id.toString();
        final email = Email(
          subject:
              "Danh mục hạn chế học phần Khoa Toán - Tin, đợt học $semester",
          body: """Kính gửi thầy Nguyễn Huy Hùng,

Em gửi danh mục hạn chế học phần của Khoa Toán - Tin, đợt học $semester. Danh mục được đính kèm trong email. Nhờ thầy xử lý tiếp, em cảm ơn thầy ạ.""",
          recipients: {
            "hung.nguyenhuy@hust.edu.vn",
          }, // TODO: config study specialist recipients
          ccRecipients: {
            "huong.nguyenthithu3@hust.edu.vn",
          }, // TODO: config boss recipients
        );

        showDialog(
          context: context,
          builder: (context) => EmailCopyDialog(email: email),
        );
      },
      icon: Icon(Symbols.email),
      label: Text("Email"),
    );
  }
}

class _ExportPdfButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(_courseSelectionProvider);
    switch (asyncValue) {
      case AsyncLoading<CourseSelection>():
        return CircularProgressIndicator();
      case AsyncError<CourseSelection>():
        return Text('Error loading courses');
      default:
    }

    final courseSelection = asyncValue.value!;
    final selectedCourses = courseSelection.selectedCourses;
    return OutlinedButton(
      onPressed: () async {
        final semesterModel = await ref.read(
          _semesterSelectionModelProvider.future,
        );
        final selectedSemester = semesterModel.selected;

        if (selectedSemester == null) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Vui lòng chọn đợt học")),
          );
          return;
        }
        saveOutputFiles(selectedCourses.toList(), selectedSemester);
      },
      child: Text("Export"),
    );
  }

  Future<void> saveOutputFiles(
    List<CourseData> courses,
    SemesterData semester,
  ) async {
    // final output = FilePicker.platform.saveFile();
    // final data = await createPdf(
    //   courses: courses,
    //   semester: semester.id,
    // );

    // final outputPath = await FilePicker.platform.saveFile(
    //   dialogTitle: "Chọn thư mục lưu",
    //   fileName: "Danh mục hạn chế học phần ${semester.id}.pdf",
    // );
    // if (outputPath != null) {
    //   final file = File(outputPath);
    //   await file.create();
    //   await file.writeAsBytes(data);
    // }
  }
}

// class _LeftOverCourseListView extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final coursesAsync = ref.watch(_courseSelectionProvider);
//     switch (coursesAsync) {
//       case AsyncLoading<CourseSelection>():
//         return CircularProgressIndicator();
//       case AsyncError<CourseSelection>():
//         return Text('Error loading courses');
//       default:
//     }
//
//     final searchQuery = ref.watch(_searchQueryProvider);
//     final selectedCategory = ref.watch(_selectedCourseCategoryProvider);
//     final courseSelection = ref.watch(_courseSelectionProvider).value!;
//     final courses = courseSelection.filter(
//       searchQuery: searchQuery,
//       selectedCategory: selectedCategory,
//     );
//
//     return _CourseListView(
//       courses: courses.toList(),
//       actionIcon: Symbols.add,
//       actionOnPressed: (course) {
//         ref.read(_courseSelectionProvider.notifier).selectCourse(course);
//       },
//     );
//   }
// }

// class _LinkToSemesterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         Navigator.of(context).pushNamed("/academic_year/list");
//       },
//       child: Text("Đợt học"),
//     );
//   }
// }

// class _SearchField extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return TextField(
//       decoration: InputDecoration(labelText: "Tìm kiếm"),
//       onChanged: (value) {
//         ref.read(_searchQueryProvider.notifier).set(value);
//       },
//       onSubmitted: (value) {
//         ref.read(_searchQueryProvider.notifier).setNow(value);
//       },
//     );
//   }
// }

class _SearchQueryNotifier extends Notifier<String> {
  Timer debounceTimer = Timer(Duration.zero, () {});

  @override
  String build() => "";

  void set(String value) {
    debounceTimer.cancel();
    debounceTimer = Timer(Duration(milliseconds: 300), () {
      state = value;
    });
  }

  void setNow(String value) {
    debounceTimer.cancel();
    state = value;
  }
}

class _SelectedCourseCategoryNotifier extends Notifier<CourseCategory?> {
  @override
  CourseCategory? build() => null;

  void set(CourseCategory? category) {
    state = category;
  }
}

class _SelectedCourseLabel extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(_courseSelectionProvider);
    switch (asyncValue) {
      case AsyncLoading<CourseSelection>():
        return CircularProgressIndicator();
      case AsyncError<CourseSelection>():
        return Text('Error loading courses');
      default:
    }

    final sourseSelection = asyncValue.value!;
    final selectedCourses = sourseSelection.selectedCourses;
    if (selectedCourses.isEmpty) {
      return ListTile(
        title: Text(
          "Chưa chọn học phần",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    final totalCredits = selectedCourses.fold<int>(
      0,
      (sum, course) => sum + course.numCredits,
    );
    final totalCourse = selectedCourses.length;
    return ListTile(
      title: Text(
        "Đã chọn $totalCourse học phần ($totalCredits TC)",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

// class _SelectedCourseListView extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final asyncValue = ref.watch(_courseSelectionProvider);
//     switch (asyncValue) {
//       case AsyncLoading<CourseSelection>():
//         return CircularProgressIndicator();
//       case AsyncError<CourseSelection>():
//         return Text('Error loading courses');
//       default:
//     }
//
//     final courseSelection = asyncValue.value!;
//     final courses = courseSelection.selectedCourses;
//
//     return _CourseListView(
//       courses: courses.toList(),
//       actionIcon: Symbols.remove,
//       actionOnPressed: (course) {
//         ref.read(_courseSelectionProvider.notifier).deSelectCourse(course);
//       },
//     );
//   }
// }

class _SemesterSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(_semesterSelectionModelProvider);
    switch (modelAsync) {
      case AsyncLoading<List<SemesterData>>():
        return CircularProgressIndicator();
      case AsyncError<List<SemesterData>>():
        return Text('Error loading semesters');
      default:
    }

    final model = modelAsync.value;
    final semesters = model?.options ?? [];
    final selected = model?.selected;

    return DropdownMenu<SemesterData>(
      label: Text("Đợt học"),
      expandedInsets: EdgeInsets.zero,
      initialSelection: selected,
      dropdownMenuEntries: [
        for (final semester in semesters)
          DropdownMenuEntry(
            value: semester,
            label: semester.id,
          ),
      ],
      onSelected: (value) {
        final notifier = ref.read(_semesterSelectionModelProvider.notifier);
        notifier.select(value);
      },
    );
  }
}

class _ActionTabView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(courseLimitingModelProvider);
    switch (modelAsync) {
      case AsyncLoading():
        return Center(child: LinearProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ErrorWidget(error);
      default:
    }

    final messager = ScaffoldMessenger.of(context);
    final model = modelAsync.value!;

    void copyCourseNameList(List<CourseData> courses) {
      final copyStr = courses
          .map((course) => "* ${course.id} - ${course.vietnameseName}")
          .join('\n\n');

      final clipboardData = ClipboardData(text: copyStr);
      Clipboard.setData(clipboardData);

      final snackBar = SnackBar(
        content: Text("Đã sao chép ${courses.length} học phần"),
      );
      messager.showSnackBar(snackBar);
    }

    final formWorkActions = [
      ListTile(
        title: Text("Bình chọn học phần tự chọn"),
        subtitle: Text("Copy danh sách học phần tự chọn có thể mở"),
        leading: Icon(Symbols.content_copy),
        onTap: () => copyCourseNameList(model.availableForVoteCourses),
      ),

      ListTile(
        title: Text("Học phần đã mở trước đó"),
        subtitle: Text(
          "Copy danh sách học phần đã mở trước đó (không mở được)",
        ),
        leading: Icon(Symbols.content_copy),
        onTap: () => copyCourseNameList(model.notVvailableForVoteCourses),
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardSection(title: "Làm khảo sát", children: formWorkActions),
          CardSection(title: "Nộp danh sách", children: []),
        ],
      ),
    );
  }
}
