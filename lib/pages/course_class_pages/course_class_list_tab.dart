import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../custom_widgets.dart';
import '../../business/db_v2_providers.dart';
import '../course_pages/course_pages.dart';
import 'course_class_pages.dart';
import 'providers.dart';
import 'widgets.dart';

part '_teaching_assignment_dialog.dart';

class CourseClassListTab extends StatelessWidget {
  const CourseClassListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        verticalDirection: context.verticalDirection,
        children: [
          // Input section
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: context.gutter,
              children: [
                Expanded(
                  child: SemesterPicker(),
                ),
                FilledButton.icon(
                  onPressed: null,
                  label: Text("Thêm"),
                  icon: Icon(Symbols.add),
                ),
              ],
            ),
          ),

          // Data section
          Expanded(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: context.gutterSmall),
                  Expanded(child: _CourseClassesView()),
                  SizedBox(height: context.gutterSmall),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
        padding: EdgeInsetsDirectional.all(context.gutter),
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
      final courseName = "${course.id} ${course.vietnameseName}";
      final creditCount = course.numCredits.toString();
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
          DataCell(Text(cc.courseClass.dayOfWeek.toString())),
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
    final idsAsync = ref.watch(courseClassIdsProvider);
    switch (idsAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error):
        return Text("Error: $error");
      default:
    }

    final (ids, shouldPrompt) = idsAsync.value!;

    if (shouldPrompt) {
      return Center(child: Text("Vui lòng chọn đợt học"));
    }

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: ids.length,
      itemBuilder: (context, index) {
        final classId = ids[index];
        return _CourseClassTile(classId: classId);
      },
    );
  }
}

class _CourseClassTile extends ConsumerWidget {
  final int classId;
  const _CourseClassTile({required this.classId});

  onTap(BuildContext context, WidgetRef ref) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TeachingAssignmentPage(
          courseClassId: classId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelAsync = ref.watch(courseClassViewModelByIdProvider(classId));
    switch (viewModelAsync) {
      case AsyncLoading():
        return ListTile(
          title: Text("Loading..."),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text("Error: $error"),
        );
      default:
    }

    final viewModel = viewModelAsync.value!;
    final courseClass = viewModel.courseClass;
    final course = viewModel.course;
    final teachers = viewModel.teachers;
    final teacherNames = teachers.keys.map((t) => t.name).join(", ");

    final subtitles = [
      if (teacherNames.isNotEmpty)
        "Giảng viên: $teacherNames"
      else
        "Chưa phân công giảng viên",
      "Số đăng ký: ${viewModel.registrationCount}",
      "Trạng thái: ${courseClass.status?.label ?? "N/A"}",
    ];

    return ListTile(
      title: Text("${course.id} - ${course.vietnameseName}"),
      subtitle: Text(subtitles.join("\n")),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showDialog(
        context: context,
        builder: (context) => _CourseClassActionDialog(
          courseClass: viewModel,
        ),
      ),
    );
  }
}

class _CourseClassActionDialog extends ConsumerWidget {
  final CourseClassViewModel courseClass;
  const _CourseClassActionDialog({required this.courseClass});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classId = courseClass.courseClass.id;
    final notifier = ref.read(courseClassByIdProvider(classId).notifier);

    return MenuDialog(
      items: [
        MenuDialogItem(
          title: "Mời dạy",
          subtitle: "Mời và phân công giảng viên cho lớp",
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TeachingAssignmentPage(
                courseClassId: classId,
              ),
            ),
          ),
        ),

        switch (courseClass.courseClass.status) {
          CourseClassStatus.canceled => MenuDialogItem(
            title: "Mở lại lớp",
            subtitle: "Mở lại lớp đã hủy",
            onTap: () => notifier.reopenClass(),
          ),
          _ => MenuDialogItem(
            title: "Hủy lớp",
            subtitle: "Hủy lớp có ít học viên",
            onTap: () => notifier.cancelClass(),
          ),
        },

        MenuDialogDivider(),
        MenuDialogItem(
          title: "Xem học phần",
          subtitle: "Xem thông tin học phần của lớp này",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CourseDetailsPage(
                  courseId: courseClass.course.id,
                ),
              ),
            );
          },
        ),

        MenuDialogItem(
          title: "Xem danh sách lớp",
          subtitle: "Xem danh sách học viên đăng ký lớp",
          onTap: null,
        ),
      ],
    );
  }
}
