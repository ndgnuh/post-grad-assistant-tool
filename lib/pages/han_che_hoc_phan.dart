import 'dart:async';
import 'dart:math';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../business/copy_pasta.dart';
import '../business/db_v2_providers.dart';
import '../business/drift_orm.dart';
import '../business/han_che_hoc_phan.dart';
import '../custom_widgets.dart';

final _courseSelectionProvider = AsyncNotifierProvider(
  _CourseSelectionNotifier.new,
);

final _searchQueryProvider = NotifierProvider<_SearchQueryNotifier, String>(
  _SearchQueryNotifier.new,
);

final _selectedCourseCategoryProvider = NotifierProvider(
  _SelectedCourseCategoryNotifier.new,
);

final _selectedSemesterProvider = NotifierProvider(
  _SelectedSemesterNotifier.new,
);

class _SelectedSemesterNotifier extends Notifier<SemesterData?> {
  @override
  SemesterData? build() => null;

  void set(SemesterData? semester) {
    state = semester;
  }
}

class _SelectedCourseCategoryNotifier extends Notifier<CourseCategory?> {
  @override
  CourseCategory? build() => null;

  void set(CourseCategory? category) {
    state = category;
  }
}

class _SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => "";

  Timer debounceTimer = Timer(Duration.zero, () {});

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

class CourseLimitingPage extends StatelessWidget {
  static const routeName = "/lop-tc/han-che-hp";

  const CourseLimitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;
    final flexDirection = switch (context.screenSize) {
      ScreenSize.large => Axis.horizontal,
      ScreenSize.medium => Axis.horizontal,
      ScreenSize.small => Axis.vertical,
    };

    final gutter = context.responsiveGutter;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tạo danh mục hạn chế học phần"),
        leading: BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.all(gutter),
        child: Column(
          spacing: gutter,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tool bar in medium and large screen only
            if (context.isLargeScreen) ...[_ActionMenuLarge(), Divider()],
            if (context.isMediumScreen) ...[_ActionMenuMedium(), Divider()],

            // The courses
            Expanded(
              child: Flex(
                direction: flexDirection,
                spacing: gutter,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "Danh sách học phần",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(child: _LeftOverCourseListView()),
                      ],
                    ),
                  ),
                  if (context.isMediumOrLargerScreen)
                    VerticalDivider()
                  else
                    Divider(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SelectedCourseLabel(),
                        Expanded(
                          child: _SelectedCourseListView(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Flex(
            //     direction: flexDirection,
            //     children: [
            //       // _HeaderRow.daTimKiem(),
            //       Flexible(
            //         child: _DanhSachHocPhan.daTimKiem(),
            //       ),
            //       // _HeaderRow.daChon(),
            //       Flexible(
            //         child: _DanhSachHocPhan.daLuaChon(),
            //       ),
            //     ],
            //   ),
            // ),
            if (context.isSmallScreen) ...[Divider(), _ActionButton()],
          ],
        ),
      ),
    );
  }
}

class _ActionMenuMedium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: context.responsiveGutter,
      children: [
        EzRow(
          children: [
            Expanded(
              child: _SearchField(),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: _CourseCategorySelector(),
            ),
          ],
        ),
        Divider(),
        EzRow(
          children: [
            _LinkToSemesterPage(),
            _SemesterSelector(),
            _ExportPdfButton(),
            _EmailButton(),
          ],
        ),
      ],
    );
  }
}

class _ActionMenuLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EzRow(
      spacing: context.responsiveGutter,
      children: [
        Expanded(
          child: _SearchField(),
        ),
        _CourseCategorySelector(),
        _SemesterSelector(),
        _LinkToSemesterPage(),
        _ExportPdfButton(),
        _EmailButton(),
      ],
    );
  }
}

class _LinkToSemesterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed("/academic_year/list");
      },
      child: Text("Đợt học"),
    );
  }
}

class _EmailButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton.icon(
      onPressed: () {
        final selectedSemester = ref.read(_selectedSemesterProvider);
        final semester = selectedSemester?.semester;
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
  Future<void> saveOutputFiles(
    List<CourseData> courses,
    SemesterData semester,
  ) async {
    // final output = FilePicker.platform.saveFile();
    final data = await createPdf(
      courses: courses,
      semester: semester.semester,
    );

    final outputPath = await FilePicker.platform.saveFile(
      dialogTitle: "Chọn thư mục lưu",
      fileName: "Danh mục hạn chế học phần ${semester.semester}.pdf",
    );
    if (outputPath != null) {
      final file = File(outputPath);
      await file.create();
      await file.writeAsBytes(data);
    }
  }

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
      onPressed: () {
        final selectedSemester = ref.read(_selectedSemesterProvider);
        saveOutputFiles(selectedCourses.toList(), selectedSemester!);
      },
      child: Text("Export"),
    );
  }
}

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

class _SearchField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      decoration: InputDecoration(labelText: "Tìm kiếm"),
      onChanged: (value) {
        ref.read(_searchQueryProvider.notifier).set(value);
      },
      onSubmitted: (value) {
        ref.read(_searchQueryProvider.notifier).setNow(value);
      },
    );
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
      (sum, course) => sum + course.credits,
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

  CourseSelection selectCourse(CourseData course) {
    final newSelected = Set<CourseData>.from(selectedCourses)..add(course);
    return copyWith(selectedCourses: newSelected);
  }

  List<CourseData> filter({
    String? searchQuery,
    CourseCategory? selectedCategory,
  }) {
    var filtered = leftOverCourses;
    if (selectedCategory != null) {
      filtered = filtered
          .where((course) => course.courseCategory == selectedCategory)
          .toSet();
    }

    // Fitler by query
    if (searchQuery == null || searchQuery.isEmpty) {
      return filtered.toList();
    }
    final lowerQuery = searchQuery.toLowerCase();
    return filtered.where((CourseData course) {
      return course.id.toLowerCase().contains(lowerQuery) ||
          course.vietnameseTitle.toLowerCase().contains(lowerQuery) ||
          course.englishTitle.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}

class _CourseListView extends StatelessWidget {
  final List<CourseData> courses;
  final IconData actionIcon;
  final Function(CourseData) actionOnPressed;

  const _CourseListView({
    required this.courses,
    required this.actionIcon,
    required this.actionOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: EdgeInsetsDirectional.all(0),
      itemCount: courses.length,
      itemBuilder: (context, i) {
        final course = courses[i];
        final label =
            "${course.id} - ${course.vietnameseTitle} (${course.credits} TC)";
        return ListTile(
          subtitle: Text(course.englishTitle),
          title: Text(label),
          onTap: () => actionOnPressed(course),
          trailing: IconButton(
            onPressed: () => actionOnPressed(course),
            icon: Icon(actionIcon),
          ),
        );
      },
    );
  }
}

class _CourseSelectionNotifier extends AsyncNotifier<CourseSelection> {
  List<HocPhan> searchedHocPhan = [];
  Set<HocPhan> selectedHocPhan = {};

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

class _LeftOverCourseListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(_courseSelectionProvider);
    switch (coursesAsync) {
      case AsyncLoading<CourseSelection>():
        return CircularProgressIndicator();
      case AsyncError<CourseSelection>():
        return Text('Error loading courses');
      default:
    }

    final searchQuery = ref.watch(_searchQueryProvider);
    final selectedCategory = ref.watch(_selectedCourseCategoryProvider);
    final courseSelection = ref.watch(_courseSelectionProvider).value!;
    final courses = courseSelection.filter(
      searchQuery: searchQuery,
      selectedCategory: selectedCategory,
    );

    return _CourseListView(
      courses: courses.toList(),
      actionIcon: Symbols.add,
      actionOnPressed: (course) {
        ref.read(_courseSelectionProvider.notifier).selectCourse(course);
      },
    );
  }
}

class _SelectedCourseListView extends ConsumerWidget {
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
    final courses = courseSelection.selectedCourses;

    return _CourseListView(
      courses: courses.toList(),
      actionIcon: Symbols.remove,
      actionOnPressed: (course) {
        ref.read(_courseSelectionProvider.notifier).deSelectCourse(course);
      },
    );
  }
}

class _SemesterSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final semestersAsync = ref.watch(semestersProvider);
    switch (semestersAsync) {
      case AsyncLoading<List<SemesterData>>():
        return CircularProgressIndicator();
      case AsyncError<List<SemesterData>>():
        return Text('Error loading semesters');
      default:
    }

    final semesters = semestersAsync.value!;

    return Expanded(
      child: DropdownMenu<SemesterData>(
        label: Text("Đợt học"),
        expandedInsets: EdgeInsets.zero,
        dropdownMenuEntries: [
          for (final semester in semesters)
            DropdownMenuEntry(
              value: semester,
              label: semester.semester,
            ),
        ],
        onSelected: (value) {
          final notifier = ref.read(_selectedSemesterProvider.notifier);
          notifier.set(value);
        },
      ),
    );
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
