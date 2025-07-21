import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import '../business/domain_objects.dart' show HocPhan;
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
    final infos = [
      ("Mã học phần", course.maHocPhan),
      ("Tên học phần", course.tenTiengViet),
      ("Tên học phần (tiếng Anh)", course.tenTiengAnh),
      ("Số tín chỉ", course.soTinChi.toString()),
      ("Khối lượng", course.khoiLuong),
      ("Khối kiến thức", course.khoiKienThuc.label),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Học phần ${course.maHocPhan}"),
      ),
      body: ListView.builder(
        itemCount: infos.length,
        itemBuilder: (context, int i) => ListTile(
          title: Text(infos[i].$1),
          subtitle: Text(infos[i].$2),
        ),
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
