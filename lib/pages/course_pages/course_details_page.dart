import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import '../teacher_pages/teacher_pages.dart';

class CourseDetailsPage extends StatelessWidget {
  static const String routeName = "/courses/detail";
  final String courseId;

  const CourseDetailsPage({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: Text("Học phần $courseId"),
            bottom: TabBar(
              tabs: [
                Tab(text: "Chi tiết"),
                Tab(text: "Lớp học phần"),
                Tab(text: "Giảng viên"),
              ],
            ),
          ),
        ),
        body: ConstrainedBody(
          child: TabBarView(
            children: [
              _CourseInfoTab(courseId: courseId),
              Center(
                child: Text("TODO: danh sách lớp với học phần này..."),
              ),
              _CourseTeachingRegistrationTab(courseId: courseId),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddTeacherInput extends ConsumerWidget {
  final String courseId;

  const _AddTeacherInput({
    required this.courseId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchAnchor(
      suggestionsBuilder: (context, controller) async {
        final db = await ref.read(mainDatabaseProvider.future);
        final stmt = db.searchTeachers(
          searchText: controller.text,
          isOutsider: false,
        );
        final teachers = await stmt.get();

        final suggestions = <Widget>[];
        for (final teacher in teachers) {
          final suggestion = ListTile(
            leading: CircleAvatar(
              child: Icon(Symbols.person),
            ),
            title: Text(teacher.name),
            subtitle: Text(teacher.emails.join(', ')),
            onTap: () {
              final notifier = ref.read(
                teacherIdsByCourseProvider(courseId).notifier,
              );
              notifier.addTeacher(teacher.id);
              controller.closeView("");
            },
          );

          suggestions.add(suggestion);
        }

        return suggestions;
      },
      builder: (context, controller) => TextField(
        onChanged: (_) => controller.openView(),
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Symbols.search),
          suffixIcon: Icon(Symbols.add),
          hintText: "Tìm kiếm giảng viên...",
          labelText: "Thêm giảng viên dạy học phần này",
        ),
      ),
    );
  }
}

class _CourseInfoTab extends ConsumerWidget {
  final String courseId;

  const _CourseInfoTab({required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseAsync = ref.watch(courseByIdProvider(courseId));
    switch (courseAsync) {
      case AsyncLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );
      case AsyncError(:final error):
        return Center(
          child: Text("Lỗi khi tải thông tin học phần: $error"),
        );
      default:
    }

    final course = courseAsync.value!;
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: context.gutter,
        children: [
          CardSection(
            title: "Thông tin chung",
            children: [
              ListTile(
                title: Text("Mã học phần"),
                subtitle: Text(course.id),
              ),
              ListTile(
                title: Text("Tên học phần"),
                subtitle: Text(course.vietnameseName),
              ),
              ListTile(
                title: Text("Tên học phần (tiếng Anh)"),
                subtitle: Text(course.englishName),
              ),
              ListTile(
                title: Text("Số tín chỉ"),
                subtitle: Text(course.numCredits.toString()),
              ),
            ],
          ),
          CardSection(
            title: "Khối lượng",
            children: [
              ListTile(
                title: Text("Số tiết lý thuyết"),
                subtitle: Text(course.numTheoryHours.toString()),
              ),
              ListTile(
                title: Text("Số tiết bài tập"),
                subtitle: Text(course.numPracticeHours.toString()),
              ),
              ListTile(
                title: Text("Số tiết thực hành"),
                subtitle: Text(course.numLabHours.toString()),
              ),
              ListTile(
                title: Text("Số tiết tự học"),
                subtitle: Text(course.numSelfStudyHours.toString()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CourseTeachingRegistrationTab extends StatelessWidget {
  final String courseId;

  const _CourseTeachingRegistrationTab({required this.courseId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        verticalDirection: context.verticalDirection,
        children: [
          _AddTeacherInput(courseId: courseId),
          TickerMode(
            enabled: true,
            child: _TeachingTeachersList(courseId: courseId),
          ),
        ],
      ),
    );
  }
}

class _TeachingTeachersList extends ConsumerWidget {
  final String courseId;
  const _TeachingTeachersList({required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherIdsAsync = ref.watch(
      teacherIdsByCourseProvider(courseId),
    );
    switch (teacherIdsAsync) {
      case AsyncLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );
      case AsyncError(:final error):
        return Center(
          child: Text("Lỗi khi tải danh sách giảng viên: $error"),
        );
      default:
    }

    final teacherIds = teacherIdsAsync.value!;
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Divider(),
        itemCount: teacherIds.length,
        itemBuilder: (context, index) {
          final teacherId = teacherIds[index];
          return _TeachingTeacherTile(
            key: ValueKey((courseId, teacherId)),
            teacherId: teacherId,
            courseId: courseId,
          );
        },
      ),
    );
  }
}

class _TeachingTeacherTile extends ConsumerWidget {
  final int teacherId;
  final String courseId;
  const _TeachingTeacherTile({
    super.key,
    required this.courseId,
    required this.teacherId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherAsync = ref.watch(teacherByIdProvider(teacherId));
    switch (teacherAsync) {
      case AsyncLoading():
        return const ListTile(
          title: Text("Loading..."),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text("Lỗi khi tải thông tin giảng viên: $error"),
        );
      default:
    }

    final teacher = teacherAsync.value!;
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Symbols.person),
      ),
      title: Text(teacher.name),
      subtitle: Text(teacher.emails.join(", ")),
      onTap: () => showDialog(
        context: context,
        builder: (context) => MenuDialog(
          items: [
            MenuDialogItem(
              icon: Symbols.info,
              title: "Chi tiết",
              subtitle: "Xem thông tin chi tiết của giảng viên",
              onTap: () => goToTeacherDetails(context),
            ),
            MenuDialogItem(
              icon: Symbols.delete,
              title: "Xóa",
              subtitle: "Gỡ đăng ký giảng dạy của giảng viên khỏi học phần",
              onTap: () {
                removeTeacher(context, ref, teacher);
              },
            ),
          ],
        ),
      ),
    );
  }

  void goToTeacherDetails(BuildContext context) {
    final navigator = Navigator.of(context);
    navigator.pushNamed(
      TeacherDetailsPage.routeName,
      arguments: teacherId,
    );
  }

  void removeTeacher(BuildContext context, WidgetRef ref, TeacherData teacher) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Xác nhận"),
        content: Text(
          "Xóa đăng ký giảng dạy của giảng viên ${teacher.name} khỏi học phần này",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              final notifier = ref.read(
                teacherIdsByCourseProvider(courseId).notifier,
              );
              notifier.removeTeacher(teacherId);
              Navigator.of(context).pop();
            },
            child: Text("Gỡ"),
          ),
        ],
      ),
    );
  }
}
