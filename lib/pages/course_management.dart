import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import '../business/domain_objects.dart' show HocPhan, GiangVien;
import '../custom_widgets.dart';
import '../../services/database.dart';

class _State extends ChangeNotifier {
  static const _debounceDuration = Duration(milliseconds: 400);
  final searchController = TextEditingController();

  late Future<List<HocPhan>> futureSearchedCourses;
  late List<HocPhan> searchedCourses;

  Timer _debounceTimer = Timer(Duration.zero, () {});
  Future<void> debounceAndSearch(String query) async {
    _debounceTimer.cancel();
    _debounceTimer = Timer(_debounceDuration, () => searchCourses(query));
  }

  Future<void> searchCourses(String query) async {
    if (query.isEmpty) {
      futureSearchedCourses = HocPhan.all();
    } else {
      futureSearchedCourses = HocPhan.search(query);
    }
    searchedCourses = await futureSearchedCourses;
    notifyListeners();
  }

  _State() {
    searchCourses("");
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
              PageCourseDetail.routeName,
              arguments: PageCourseDetailArgs(course: course),
            );
          },
        );
      },
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context, listen: false);
    return ListTile(
      title: TextFormField(
        autofocus: true,
        onChanged: (value) => state.debounceAndSearch(value),
        onFieldSubmitted: (value) => state.searchCourses(value),
        onTap: () {
          final controller = state.searchController;
          controller.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.text.length,
          );
        },
        controller: state.searchController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "Mã học phần, tên học phần",
          labelText: "Tìm kiếm",
        ),
      ),
    );
  }
}

class PageCourseDetailArgs {
  final HocPhan course;
  const PageCourseDetailArgs({
    required this.course,
  });
}

class PageCourseDetailState extends ChangeNotifier {
  late HocPhan course;
  late Future<List<GiangVien>> futureTeachingStaffs;
  late ScrollController scrollController;

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

  PageCourseDetailState({required this.course}) {
    scrollController = ScrollController();
    futureTeachingStaffs = course.teachingStaffs;
  }
}

class PageCourseDetail extends StatelessWidget {
  static const String routeName = "/courses/detail";
  final HocPhan course;

  const PageCourseDetail({
    super.key,
    required this.course,
  });

  factory PageCourseDetail.fromArguments(PageCourseDetailArgs args) {
    return PageCourseDetail(course: args.course);
  }

  @override
  Widget build(context) {
    final infos = [];

    return ChangeNotifierProvider(
      create: (_) => PageCourseDetailState(course: course),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Học phần ${course.maHocPhan}"),
        ),
        body: Selector(
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
    );
  }
}

class _ListTeachingStaffs extends StatelessWidget {
  const _ListTeachingStaffs({
    required this.course,
    required this.teachers,
  });

  final HocPhan course;
  final List<GiangVien> teachers;

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
            )
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

class PageCourseList extends StatelessWidget {
  static const String routeName = "/courses/list";
  const PageCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _State(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Danh sách học phần"),
        ),
        body: Column(
          children: [
            ListTile(
              leading: Icon(Icons.search),
              title: _SearchBar(),
            ),
            Expanded(
              child: Selector<_State, Future>(
                selector: (context, state) => state.futureSearchedCourses,
                builder: (context, futureCourses, child) => FutureBuilder(
                  future: futureCourses,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        return _CourseListView(courses: snapshot.data!);
                      default:
                        return SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(),
                        );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
