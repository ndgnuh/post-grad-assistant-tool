import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import './_import_from_clipboard.dart';
import './index.dart';
import './providers.dart';
import './widgets.dart';

part '_teaching_assignment_dialog.dart';

class CourseClassListPage extends StatelessWidget {
  static const routeName = "/course_classes/list";

  const CourseClassListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gutter = context.responsiveGutter;
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: const Text("Danh sách lớp tín chỉ"),
            bottom: TabBar(
              isScrollable: true,
              tabs: [Tab(text: "Lớp tín chỉ")],
            ),
          ),
        ),
        body: ConstrainedBody(
          child: TabBarView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(gutter),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: gutter,
                        children: [
                          Expanded(
                            child: SemesterPicker(),
                          ),
                          FilledButton.icon(
                            onPressed: null,
                            label: Text("Thêm"),
                            icon: Icon(Symbols.add),
                          ),
                          _ImportButton(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: gutter),
                    child: Divider(),
                  ),
                  Expanded(child: _CourseClassesView()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SemesterPicker extends ConsumerWidget {
//   const SemesterPicker({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Load selected semester
//     final selectedSemesterAsync = ref.watch(semesterSelectionModelProvider);
//     final semestersAsync = ref.watch(semestersProvider);
//     switch (selectedSemesterAsync) {
//       case AsyncLoading():
//         return const CircularProgressIndicator();
//       case AsyncError(:final error):
//         return Text("Error: $error");
//       default:
//     }
//
//     final semesters = semestersAsync.value!;
//     final selectedSemester = selectedSemesterAsync.value;
//
//     return DropdownMenu<SemesterData>(
//       label: Text("Đợt học"),
//       initialSelection: selectedSemester,
//       dropdownMenuEntries: [
//         for (final semester in semesters)
//           DropdownMenuEntry(value: semester, label: semester.semester),
//       ],
//       onSelected: (value) async {
//         final notifier = ref.read(semesterSelectionModelProvider.notifier);
//         notifier.set(value);
//       },
//     );
//   }
// }

class _AssignedTeachersButton extends ConsumerWidget {
  final int classId;
  const _AssignedTeachersButton({required this.classId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelAsync = ref.watch(courseClassViewModelByIdProvider(classId));
    switch (viewModelAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error):
        return Text("Error: $error");
      default:
    }

    final viewModel = viewModelAsync.value!;
    final teachers = viewModel.teachers;
    final text = format(teachers);

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        textStyle: TextStyle(fontSize: 14),
      ),
      onPressed: () => onPressed(context, initialAssignments: teachers),
      child: Text(text),
    );
  }

  String format(Map<TeacherData, double> teachers) {
    if (teachers.isEmpty) {
      return "<Phân công>";
    }

    // First teacher only
    if (teachers.length == 1) {
      return teachers.keys.first.name;
    }

    // Multiple teachers
    final lines = <String>[];
    for (final entry in teachers.entries) {
      final teacher = entry.key;
      final contribution = entry.value;
      final contributionStr = contribution.toStringAsFixed(2);
      lines.add("${teacher.name} ($contributionStr)");
    }

    return lines.join("\n");
  }

  void onPressed(
    BuildContext context, {
    required Map<TeacherData, double> initialAssignments,
  }) async {
    showDialog(
      context: context,
      builder: (context) => _TeachingAssignmentDialog(
        classId: classId,
        initialAssignments: initialAssignments,
      ),
    );
  }
}

class _CourseClassesTableView extends StatelessWidget {
  static const columns = [
    DataColumn(label: Text("Mã lớp")),
    DataColumn(label: Text("Học phần")),
    DataColumn(label: Text("TC")),
    DataColumn(label: Text("Giảng viên")),
    DataColumn(label: Text("Thứ")),
    DataColumn(label: Text("Tiết")),
    DataColumn(label: Text("Phòng học")),
    DataColumn(label: Text("Sĩ số")),
    DataColumn(label: Text("Trạng thái")),
  ];
  final List<CourseClassViewModel> courseClasses;
  final SemesterData semester;

  const _CourseClassesTableView({
    required this.courseClasses,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(context.responsiveGutter),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraint.maxWidth,
              ),
              child: DataTable(
                dataRowMaxHeight: double.infinity,
                columns: columns,
                rows: rows(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DataRow> rows(BuildContext context) {
    return courseClasses.map((cc) {
      final period = switch ((
        cc.courseClass.startPeriod,
        cc.courseClass.endPeriod,
      )) {
        (int a, int b) when a == b => "$a",
        (int a, int b) => "$a-$b",
        _ => "N/A",
      };

      final course = cc.course;
      final courseName = "${course.id} ${course.vietnameseTitle}";
      final creditCount = course.credits.toString();
      final assignments = cc.teachers;

      final teachers = cc.teachers.keys.map((t) => t.name).join(", ");

      return DataRow(
        onSelectChanged: (selected) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TeachingAssignmentPage(
                courseClassId: cc.courseClass.id,
              ),
            ),
          );
        },
        cells: [
          DataCell(Text(cc.courseClass.classId)),
          DataCell(Text(courseName)),
          DataCell(Text(creditCount)),
          DataCell(_AssignedTeachersButton(classId: cc.courseClass.id)),
          DataCell(Text(cc.courseClass.dayOfWeek.toString() ?? "N/A")),
          DataCell(Text(period)),
          DataCell(Text(cc.courseClass.classroom ?? "N/A")),
          DataCell(Text(cc.registrationCount.toString())),
          DataCell(Text(cc.courseClass.status?.label ?? "N/A")),
        ],
      );
    }).toList();
  }
}

class _CourseClassesView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSemesterAsync = ref.watch(semesterSelectionModelProvider);
    switch (selectedSemesterAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error):
        return Text("Error: $error");
      default:
    }

    final selectedSemester = selectedSemesterAsync.value;
    if (selectedSemester == null) {
      return Center(child: Text("Vui lòng chọn đợt học"));
    }

    final courseClassesAsync = ref.watch(
      courseClassViewModelsProvider,
    );

    switch (courseClassesAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error):
        return Text("Error: $error");
      default:
    }

    final courseClasses = courseClassesAsync.value!;
    if (courseClasses.isEmpty) {
      return Center(child: Text("Không có lớp tín chỉ nào trong đợt học này"));
    }

    return _CourseClassesTableView(
      courseClasses: courseClasses,
      semester: selectedSemester.selected!,
    );
  }
}

class _ImportButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);

    return FilledButton.icon(
      onPressed: () async {
        final model = await ref.read(semesterSelectionModelProvider.future);
        final semester = model.selected;
        if (semester == null) {
          messenger.showSnackBar(
            SnackBar(content: Text("Vui lòng chọn đợt học trước")),
          );
          return;
        }

        final ok = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Hướng dẫn"),
            content: Text(
              'Copy cột "Mã lớp học phần", "Tên lớp học phần", "Số HV đăng ký" từ file hướng "Kết quả đăng ký" mà Ban Đào tạo gửi, sau đó nhấn "Ok" để tiếp tục.',
            ),
            actions: [
              TextButton(
                child: Text("Hủy"),
                onPressed: () => Navigator.pop(context, false),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        );
        if (ok != true) return;

        final newClasses = await parseClassesFromClipboard(
          semester: semester.semester,
        );
        if (newClasses.isEmpty) {
          messenger.showSnackBar(
            SnackBar(
              content: Text("Không tìm thấy lớp nào trong clipboard"),
            ),
          );
          return;
        }
      },
      label: Text("Import"),
      icon: Icon(Symbols.file_upload),
    );
  }
}
