import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business/domain_objects.dart' show HocPhan;
import '../../custom_widgets.dart';
import 'course_pages.dart';

class CourseListPage extends StatelessWidget {
  static const String routeName = "/courses/list";
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _State(),
      child: Scaffold(
        appBar: ConstrainedAppBar(
          child: AppBar(
            title: Text("Danh sách học phần"),
          ),
        ),
        body: ConstrainedBody(
          child: Column(
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
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
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

class _State extends ChangeNotifier {
  static const _debounceDuration = Duration(milliseconds: 400);
  final searchController = TextEditingController();

  late Future<List<HocPhan>> futureSearchedCourses;
  late List<HocPhan> searchedCourses;

  Timer _debounceTimer = Timer(Duration.zero, () {});
  _State() {
    searchCourses("");
  }

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
}
