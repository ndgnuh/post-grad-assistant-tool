import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../business/db_v2_providers.dart';
import '../../../core/dialogs.dart';
import '../../../core/router.dart';
import '../../../custom_widgets.dart';
import '../../course_pages/course_pages.dart';
import '../course_classes.dart';
import '../domain/dialogs.dart';
import 'providers.dart';
import 'teaching_assignment_tab.dart';
import 'widgets.dart';

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
                  Expanded(
                    child: PlatformAdaptiveLayout(
                      mobile: _CourseClassesListView(),
                      desktop: _CourseClassTableView(),
                    ),
                  ),
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
          title: "Chi tiết",
          subtitle: "Xem thông tin lớp",
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CourseClassDetailsPage(
                classId: classId,
              ),
            ),
          ),
        ),

        MenuDialogItem(
          title: "Mời dạy",
          subtitle: "Mời và phân công giảng viên cho lớp",
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CourseClassDetailsPage.teachingAssignment(
                classId: classId,
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

class _CourseClassTableView extends ConsumerWidget {
  final columns = [
    DataColumn(label: Text("Mã lớp")),
    DataColumn(label: Text("Mã học phần")),
    DataColumn(label: Text("Tên lớp"), columnWidth: FlexColumnWidth()),
    DataColumn(label: Text("ĐK")),
    DataColumn(label: Text("Phân công"), columnWidth: FlexColumnWidth()),
    DataColumn(label: Text("Phòng")),
    DataColumn(label: Text("Ngày")),
    DataColumn(label: Text("Tiết")),
    DataColumn(label: Text("Trạng thái")),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncClassList = ref.watch(classListBySemesterProvider);
    switch (asyncClassList) {
      case AsyncError(:final error, :final stackTrace):
        return Text("Lỗi khi lấy dữ liệu: $error");
      case AsyncLoading():
        return Center(child: LinearProgressIndicator());
      case AsyncValue(value: final viewModels):
        if (viewModels == null) {
          return Text("Chọn học kỳ trước");
        }

        final router = AppRouter();

        return DataTable(
          columns: columns,
          rows: viewModels.map((viewModel) {
            final courseClass = viewModel.courseClass;
            final course = viewModel.course;

            return DataRow(
              cells: [
                DataCell(Text(courseClass.classId)),
                DataCell(
                  InkWell(
                    onTap: () =>
                        router.toCourseDetailsPage(courseId: course.id),
                    child: Text(course.id),
                  ),
                ),
                DataCell(Text(viewModel.className)),
                DataCell(Text(courseClass.registrationCount.toString())),
                DataCell(
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: TeachingAssignmentTab(classId: courseClass.id),
                      ),
                    ),
                    child: Text(viewModel.teacherAssignmentString),
                  ),
                ),
                DataCell(
                  InkWell(
                    onTap: () => showClassRoomUpdateDialog(
                      context: context,
                      courseClass: courseClass,
                    ),
                    child: Text(courseClass.classroom ?? "Chưa có"),
                  ),
                ),
                DataCell(
                  InkWell(
                    onTap: () => showDayUpdateDialog(
                      context: context,
                      courseClass: courseClass,
                    ),
                    child: Text(courseClass.dayOfWeek?.label ?? "Chưa có"),
                  ),
                ),
                DataCell(
                  InkWell(
                    onTap: () => showPeriodSelectionDialog(
                      context: context,
                      courseClass: courseClass,
                    ),
                    child: Text(viewModel.studyTime),
                  ),
                ),
                DataCell(
                  InkWell(
                    onTap: () => showClassStatusUpdateDialog(
                      context: context,
                      courseClass: courseClass,
                    ),
                    child: Text(
                      (courseClass.status ?? CourseClassStatus.normal).label,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        );
    }
  }
}

/// Xem danh sách lớp tín chỉ dưới dạng [ListView]
class _CourseClassesListView extends ConsumerWidget {
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
    final url = courseClass.accessUrl;

    final subtitles = [
      if (teacherNames.isNotEmpty)
        "Giảng viên: $teacherNames"
      else
        "Chưa phân công giảng viên",
      "Số đăng ký: ${viewModel.registrationCount}",
      "Trạng thái: ${courseClass.status?.label ?? "N/A"}",
      if (url != null && url.isNotEmpty) "Nhóm lớp: $url",
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

  void onTap(BuildContext context, WidgetRef ref) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CourseClassDetailsPage.teachingAssignment(
          classId: classId,
        ),
      ),
    );
  }
}
