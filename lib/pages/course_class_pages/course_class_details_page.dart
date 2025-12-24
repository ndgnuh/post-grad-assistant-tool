import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_tiles.dart';
import '../../custom_widgets.dart';
import '../course_pages/course_pages.dart';
import '../semester_pages/semester_pages.dart';
import '../teacher_pages/teacher_pages.dart';
import 'providers.dart';
import 'teaching_assignment_tab.dart';

class CourseClassDetailsPage extends ConsumerWidget {
  final int classId;
  final int initialTabIndex;

  factory CourseClassDetailsPage.teachingAssignment({
    required int classId,
  }) => CourseClassDetailsPage(
    classId: classId,
    initialTabIndex: 2,
  );

  const CourseClassDetailsPage({
    super.key,
    required this.classId,
    this.initialTabIndex = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      initialIndex: initialTabIndex,
      length: 3,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: Text('Thông tin lớp học'),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "Thông tin chung"),
                Tab(text: "Học viên"),
                Tab(text: "Phân công giảng dạy"),
              ],
            ),
          ),
        ),
        body: ConstrainedBody(
          child: TabBarView(
            children: [
              CourseClassDetailsTab(
                classId: classId,
              ),
              Text("TODO"),
              TeachingAssignmentTab(classId: classId),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseClassDetailsTab extends ConsumerWidget {
  final int classId;
  const CourseClassDetailsTab({
    super.key,
    required this.classId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(courseClassViewModelByIdProvider(classId));
    switch (modelAsync) {
      case AsyncLoading():
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case AsyncError(:final error, :final stackTrace):
        return ErrorScaffold(
          error: error,
          stackTrace: stackTrace,
        );
      default:
    }

    final model = modelAsync.value!;
    final courseClass = model.courseClass;
    final course = model.course;
    final classStatus = courseClass.status ?? CourseClassStatus.normal;

    /// For update actions
    final messenger = ScaffoldMessenger.of(context);
    final notifier = ref.read(
      courseClassByIdProvider(classId).notifier,
    );

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          CardSection(
            title: "Thông tin quản lý",
            children: [
              ListTile(
                title: Text('Mã lớp'),
                subtitle: Text(courseClass.classId),
              ),

              ListTile(
                title: Text('Tên lớp'),
                subtitle: Text(model.className),
                onTap: () {
                  ClipboardData data = ClipboardData(text: model.className);
                  Clipboard.setData(data);
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text('Đã sao chép tên lớp vào clipboard'),
                    ),
                  );
                },
              ),

              ListTile(
                title: Text('Số lượng đăng ký'),
                subtitle: Text(model.registrationCount.toString()),
              ),

              StringTile(
                title: 'Nhóm lớp',
                initialValue: courseClass.accessUrl ?? "",
                editOnTap: true,
                trailing: Icon(Symbols.edit),
                onUpdate: (value) => notifier.updateAccessUrl(value),
              ),

              EnumTile<CourseClassStatus>(
                titleText: 'Trạng thái lớp',
                options: CourseClassStatus.values,
                trailing: Icon(Symbols.edit),
                enumFormatter: (status) => status?.label ?? "-",
                initialValue: classStatus,
                onUpdate: (value) => notifier.updateStatus(value),
              ),
            ],
          ),

          /// Course class schedule
          CardSection(
            title: "Lịch học",
            children: [
              StringTile(
                title: "Phòng học",
                editOnTap: true,
                trailing: Icon(Symbols.edit),
                initialValue: courseClass.classroom ?? "",
                onUpdate: (value) => notifier.updateClassroom(value),
              ),
              EnumTile<DayOfWeek>(
                options: DayOfWeek.values,
                trailing: Icon(Symbols.edit),
                titleText: "Ngày học",
                initialValue: courseClass.dayOfWeek,
                onUpdate: (value) => notifier.updateDayOfWeek(value),
              ),
              EnumTile<int?>(
                options: [null, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
                trailing: Icon(Symbols.edit),
                titleText: "Tiết bắt đầu",
                initialValue: courseClass.startPeriod,
                onUpdate: (value) => notifier.updateStartPeriod(value),
              ),
              EnumTile<int?>(
                options: [null, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
                trailing: Icon(Symbols.edit),
                titleText: "Tiết kết thúc",
                initialValue: courseClass.endPeriod,
                onUpdate: (value) => notifier.updateEndPeriod(value),
              ),
            ],
          ),

          /// Links to other pages
          CardSection(
            title: "Thông tin liên quan",
            children: [
              ListTile(
                title: Text('Học phần'),
                trailing: Icon(Symbols.chevron_right),
                subtitle: Text(
                  "${courseClass.courseId} - ${course.vietnameseName}",
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    CourseDetailsPage.routeName,
                    arguments: course.id,
                  );
                },
              ),
              ListTile(
                title: Text('Đợt học'),
                subtitle: Text(courseClass.semester),
                trailing: Icon(Symbols.chevron_right),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    SemesterDetailsPage.routeName,
                    arguments: courseClass.semester,
                  );
                },
              ),
              for (final teacher in model.teachers.entries)
                ListTile(
                  title: Text("Giảng viên"),
                  subtitle: Text(
                    "${teacher.key.name} (${teacher.value})",
                  ),
                  trailing: Icon(Symbols.chevron_right),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      TeacherDetailsPage.routeName,
                      arguments: teacher.key.id,
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
