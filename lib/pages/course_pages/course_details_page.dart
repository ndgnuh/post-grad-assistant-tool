import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business/domain_objects.dart' show HocPhan, GiangVien;
import '../../custom_widgets.dart';

class CourseDetailPage extends StatelessWidget {
  static const String routeName = "/courses/detail";
  final HocPhan course;

  const CourseDetailPage({
    super.key,
    required this.course,
  });

  factory CourseDetailPage.fromArguments(CourseDetailPageArgs args) {
    return CourseDetailPage(course: args.course);
  }

  @override
  Widget build(context) {
    return ChangeNotifierProvider(
      create: (_) => PageCourseDetailState(course: course),
      child: Scaffold(
        appBar: ConstrainedAppBar(
          child: AppBar(
            title: Text("Học phần ${course.maHocPhan}"),
          ),
        ),
        body: ConstrainedBody(
          child: Selector(
            selector: (context, PageCourseDetailState state) {
              return state.scrollController;
            },
            builder: (context, scrollController, child) => ListView(
              children: [
                // thông tin chugn
                HeadingListTile(
                  title: "Thông tin chung",
                ),
                ListTile(
                  title: Text("Mã học phần"),
                  subtitle: Text(course.maHocPhan),
                ),
                ListTile(
                  title: Text("Tên học phần"),
                  subtitle: Text(course.tenTiengViet),
                ),
                ListTile(
                  title: Text("Tên học phần (tiếng Anh)"),
                  subtitle: Text(course.tenTiengAnh ?? "Chưa có thông tin"),
                ),
                ListTile(
                  title: Text("Số tín chỉ"),
                  subtitle: Text(course.soTinChi.toString()),
                ),
                ListTile(
                  title: Text("Khối lượng"),
                  subtitle: Text(course.khoiLuong),
                ),
                ListTile(
                  title: Text("Khối kiến thức"),
                  subtitle: Text(course.khoiKienThuc.label),
                ),

                // Giảng viên
                HeadingListTile(
                  title: "Giảng viên giảng dạy",
                ),
                _AddTeachingStaffTile(course: course),
                Selector<PageCourseDetailState, Future<List<GiangVien>>>(
                  selector: (context, state) => state.futureTeachingStaffs,
                  builder: (context, futureStaffs, child) => FutureBuilder(
                    future: futureStaffs,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          final staffs = snapshot.data!;
                          return _ListTeachingStaffs(
                            course: course,
                            teachers: staffs,
                          );
                        default:
                          return SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(),
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseDetailPageArgs {
  final HocPhan course;
  const CourseDetailPageArgs({
    required this.course,
  });
}

class PageCourseDetailState extends ChangeNotifier {
  late HocPhan course;
  late Future<List<GiangVien>> futureTeachingStaffs;
  late ScrollController scrollController;

  PageCourseDetailState({required this.course}) {
    scrollController = ScrollController();
    futureTeachingStaffs = course.teachingStaffs;
  }

  void refresh({bool scrollToEnd = false}) {
    futureTeachingStaffs = course.teachingStaffs;
    notifyListeners();
    if (scrollToEnd) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

class _AddTeachingStaffTile extends StatelessWidget {
  final HocPhan course;
  const _AddTeachingStaffTile({required this.course});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PageCourseDetailState>(
      context,
      listen: false,
    );

    return SearchAnchor(
      suggestionsBuilder: (context, searchController) async {
        final searchQuery = searchController.text;
        final teachers = await GiangVien.search(
          searchQuery,
          isLocalStaff: true,
        );

        return [
          for (final teacher in teachers)
            ListTile(
              title: Text(teacher.hoTenChucDanh),
              subtitle: Text(teacher.email ?? ""),
              onTap: () async {
                await course.addTeachingStaff(teacher.id);
                searchController.closeView("");
                state.refresh(scrollToEnd: true);
              },
            ),
        ];
      },
      builder: (context, searchController) => ListTile(
        leading: Icon(Icons.add),
        subtitle: Text("Click để tìm giảng viên"),
        title: Text("Thêm giảng viên giảng dạy"),
        onTap: () => searchController.openView(),
      ),
    );
  }
}

class _CourseListView extends StatelessWidget {
  final List<HocPhan> courses;
  const _CourseListView({
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];

        final title = course.tenTiengViet;
        final subtitle = [
          "Mã học phần: ${course.maHocPhan}",
          "Khối lượng: ${course.khoiLuong}",
          "Khối kiến thức: ${course.khoiKienThuc.label}",
        ].join("\n");
        return ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: () {
            Navigator.pushNamed(
              context,
              CourseDetailPage.routeName,
              arguments: CourseDetailPageArgs(course: course),
            );
          },
        );
      },
    );
  }
}

class _ListTeachingStaffs extends StatelessWidget {
  final HocPhan course;

  final List<GiangVien> teachers;
  const _ListTeachingStaffs({
    required this.course,
    required this.teachers,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PageCourseDetailState>(
      context,
      listen: false,
    );
    return ListView.builder(
      shrinkWrap: true,
      itemCount: teachers.length,
      itemBuilder: (context, index) {
        final teacher = teachers[index];
        return ListTile(
          title: Text(teacher.hoTenChucDanh),
          subtitle: Text(teacher.email ?? "N/A"),
          onTap: () async {
            // Open confirmation dialog
            final confirm = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Xác nhận"),
                content: Text("Bạn có chắc muốn xóa giảng viên này?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text("Hủy"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("Xóa"),
                  ),
                ],
              ),
            );

            // cancel
            if (confirm != true) return;

            // Proceed with deletion
            await course.removeTeachingStaff(teacher.id);
            state.refresh(scrollToEnd: true);
          },
        );
      },
    );
  }
}
