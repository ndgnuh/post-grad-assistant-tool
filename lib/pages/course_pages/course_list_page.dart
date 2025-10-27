import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import 'course_pages.dart';
import 'providers.dart';

class CourseListPage extends StatelessWidget {
  static const String routeName = "/courses/list";
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: Text("Danh sách học phần"),
        ),
      ),
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            verticalDirection: context.verticalDirection,
            spacing: context.gutter,
            children: [
              ListTile(
                leading: Icon(Icons.search),
                title: _SearchBar(),
              ),
              Expanded(
                child: _CourseListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseItem extends ConsumerWidget {
  final String courseId;

  const _CourseItem({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseAsync = ref.watch(courseByIdProvider(courseId));
    switch (courseAsync) {
      case AsyncLoading():
        return const ListTile(
          title: Text("Loading..."),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text("Lỗi rồi"),
          subtitle: Text(error.toString()),
        );
      default:
    }

    final course = courseAsync.value!;
    final title = course.vietnameseName;

    final subtitle = [
      "Mã học phần: ${course.id}",
      "Số tín chỉ: ${course.numCredits}",
      "Khối kiến thức: ${course.category.label}",
    ].join("\n");

    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.pushNamed(
          context,
          CourseDetailsPage.routeName,
          arguments: course.id,
        );
      },
    );
  }
}

class _CourseListView extends ConsumerWidget {
  const _CourseListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseIdsAsync = ref.watch(courseIdsProvider);
    switch (courseIdsAsync) {
      case AsyncLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );
      case AsyncError(:final error):
        return Center(child: Text("Error: $error"));
      default:
    }

    final courseIds = courseIdsAsync.value!;
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: courseIds.length,
      itemBuilder: (context, index) {
        final courseId = courseIds[index];
        return _CourseItem(
          key: ValueKey(courseId),
          courseId: courseId,
        );
      },
    );
  }
}

class _SearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(searchTextProvider.notifier);
    return TextFormField(
      onChanged: notifier.setDebounce,
      onFieldSubmitted: notifier.set,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Mã học phần, tên học phần",
        labelText: "Tìm kiếm",
      ),
    );
  }
}
