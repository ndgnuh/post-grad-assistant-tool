import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../../business/domain_objects.dart';
import '../../custom_widgets.dart';
import '../../shortcuts.dart';
import '../../business/copy_pasta.dart' as copy_pasta;

import '../multiple_selection_page.dart';
import '../single_selection_page.dart';
import 'thesis_list.dart'
    show ThesisTopicListPage, ThesisTopicAddPage, ThesisTopicDetailPage;

class _ThesisSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context, listen: false);
    return TextField(
      key: searchFieldKey,
      controller: state.searchController,
      decoration: InputDecoration(labelText: 'Tìm kiếm'),
      onEditingComplete: () => state.search(),
      onSubmitted: (value) => state.search(),
      onChanged: (value) => state.debounceSearch(),
    );
  }
}

class MobilePageThesisAssignList extends StatelessWidget {
  static const String routeName = '/mobile/thesis_assign_list';
  const MobilePageThesisAssignList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Get.put(_State()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Giao đề tài'),
          actions: [_GotoMenu()],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Wrap(
                  runSpacing: 8.0,
                  spacing: 8.0,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.start,
                  children: [
                    _ThesisSearchBar(),
                    _SelectClassOfYearButton(),
                  ],
                ),
                Expanded(child: _ThesisListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThesisItem extends StatelessWidget {
  final Student student;

  const ThesisItem({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context, listen: false);
    final thesis = state.mapThesis[student];
    final teacher = state.mapSupervisor[student];

    final assigned = thesis != null;
    final subtitle = assigned
        ? "Đề tài: ${thesis.tenTiengViet} - Giảng viên: ${teacher!.hoTenChucDanh}"
        : "Chưa có đề tài";

    return ListTile(
      leading: Icon(null),
      title: Text(student.hoTen),
      subtitle: Text(subtitle),
      onTap: () async {
        if (assigned) {
          Get.to(
            ThesisTopicDetailPage(topic: thesis),
          );
        } else {
          final page = PageSelectThings<Thesis>(
            title: "Chọn đề tài",
            includeNull: true,
            searchFunction: (query) => Thesis.search(
              searchQuery: query,
              assigned: false,
            ),
            itemBuilder: (context, Thesis? thesis) => switch (thesis) {
              Thesis thesis => ListTile(
                  title: Text(thesis.tenTiengViet),
                  subtitle: Text(thesis.giangVien.hoTenChucDanh),
                  onTap: () => Get.back(result: thesis),
                ),
              null => ListTile(
                  title: Text("Hủy"),
                  subtitle: Text("Không chọn đề tài"),
                  onTap: () => Get.back(result: null),
                ),
            },
          );

          final selectedThesis = await Get.to<Thesis?>(page);
          switch (selectedThesis) {
            case Thesis thesis:
              await thesis.assignStudent(student);
              state.mapThesis[student] = selectedThesis;
              state.mapSupervisor[student] = selectedThesis.giangVien;
              state.search();
          }
        }
      },
    );
  }
}

class _GotoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: controller.open,
          tooltip: "Menu",
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () async {
            final state = Provider.of<_State>(context, listen: false);
            final students = state.listStudents;
            final maybeTheses = [
              for (final student in students) state.mapThesis[student]
            ];
            final theses = [
              for (final thesis in maybeTheses)
                if (thesis != null) thesis
            ];

            copy_pasta.copyThesisAssignment(theses: theses);
          },
          child: ListTile(
            title: const Text("Copy bảng giao đề tài"),
            subtitle: Text("Có thể paste vào excel"),
            leading: const Icon(Icons.copy),
          ),
        ),
        MenuItemButton(
          onPressed: () => navigator.pushNamed(ThesisTopicAddPage.routeName),
          child: ListTile(
            leading: const Icon(Icons.add),
            title: Text("Thêm đề tài"),
          ),
        ),
        MenuItemButton(
          onPressed: () => navigator.pushNamed(ThesisTopicListPage.routeName),
          child: ListTile(
            leading: const Icon(Icons.forward),
            title: Text("Tới trang danh sách đề tài"),
          ),
        ),
      ],
    );
  }
}

class _SelectClassOfYearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);

    return SearchAnchor(
      suggestionsBuilder: (context, searchController) async {
        final query = searchController.text;
        final classOfYears = await NienKhoa.search(query);

        final suggestions = <Widget>[];
        for (final classOfYear in classOfYears) {
          final widget = ListTile(
            title: Text(classOfYear.nienKhoa),
            onTap: () {
              state.selectedClassOfYear = classOfYear;
              searchController.closeView("");
            },
          );
          suggestions.add(widget);
        }
        return suggestions;
      },
      builder: (context, searchController) => ListTile(
        leading: Icon(Icons.search),
        title: const Text('Khóa học viên'),
        subtitle: switch (state.selectedClassOfYear) {
          null => const Text("Click để chọn"),
          NienKhoa nienKhoa => Text(nienKhoa.nienKhoa),
        },
        onTap: () => searchController.openView(),
      ),
    );
  }
}

class _State extends ChangeNotifier {
  final searchController = SearchController();
  final ValueNotifier<NienKhoa?> classOfYearNotifier = ValueNotifier(null);
  List<Student> listStudents = [];
  Map<Student, Thesis?> mapThesis = {};
  Map<Student, Teacher?> mapSupervisor = {};

  final duration = const Duration(milliseconds: 300);
  Timer debounceTimer = Timer(Duration(milliseconds: 10), () {});

  String get searchQuery => searchController.text;
  ClassOfYear? get selectedClassOfYear => classOfYearNotifier.value;

  set selectedClassOfYear(ClassOfYear? value) {
    classOfYearNotifier.value = value;
    search();
  }

  @override
  void dispose() {
    searchController.dispose();
    Get.delete<_State>();
    super.dispose();
  }

  void refresh() {
    // Notify listeners to rebuild the UI
    notifyListeners();
  }

  void debounceSearch() {
    // Cancel the previous timer
    debounceTimer.cancel();

    // Start a new timer
    debounceTimer = Timer(duration, () {
      search();
    });
  }

  void search() async {
    // Cancel any debounce timer
    debounceTimer.cancel();

    // Get all students in the selected class of year
    final students = await Student.search(
      searchQuery: searchQuery,
      classOfYear: selectedClassOfYear,
    );

    // Add data and notify listeners
    final listStudents = <Student>[];
    final mapThesis = <Student, Thesis?>{};
    final mapSupervisor = <Student, Teacher?>{};
    for (final student in students) {
      listStudents.add(student);
      final thesis = await Thesis.getByStudentId(student.id);
      mapThesis[student] = thesis;
      mapSupervisor[student] = thesis?.giangVien;
    }

    // Update the state
    this.listStudents = listStudents;
    this.mapThesis = mapThesis;
    this.mapSupervisor = mapSupervisor;

    notifyListeners();
  }
}

class _ThesisListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context, listen: false);
    final students = state.listStudents;

    // Width
    return Selector(
      selector: (context, _State state) => state.listStudents,
      builder: (context, students, child) => ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, idx) {
          final student = students[idx];
          return ThesisItem(student: student);
        },
      ),
    );
  }
}
