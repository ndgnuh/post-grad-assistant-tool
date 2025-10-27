import 'package:fami_tools/custom_tiles.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/business_enums.dart';
import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../course_pages/course_pages.dart';
import '../semester_pages/semester_pages.dart';
import '../teacher_pages/teacher_pages.dart';
import 'providers.dart';

class CourseClassDetailsPage extends ConsumerWidget {
  final int classId;
  const CourseClassDetailsPage({super.key, required this.classId});

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

    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: Text('Thông tin lớp học: ${model.courseClass.classId}'),
        ),
      ),
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            spacing: context.gutter,
            children: [
              CardSection(
                title: "Thông tin chung",
                children: [
                  ListTile(
                    title: Text('Mã lớp'),
                    subtitle: Text(courseClass.classId),
                  ),
                  ListTile(
                    title: Text('Số lượng đăng ký'),
                    subtitle: Text(model.registrationCount.toString()),
                  ),
                  EnumTile<CourseClassStatus>(
                    titleText: 'Trạng thái lớp',
                    options: CourseClassStatus.values,
                    enumFormatter: (status) => status?.label ?? "-",
                    initialValue: classStatus,
                    onUpdate: (value) {
                      final notifier = ref.read(
                        courseClassByIdProvider(classId).notifier,
                      );
                      notifier.updateStatus(value);
                    },
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
                      subtitle: Text("${teacher.key.name} (${teacher.value})"),
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
        ),
      ),
    );
  }
}
