import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../../business/domain_objects.dart';
import '../../shortcuts.dart';
import '../../custom_widgets.dart';
import '../../custom_tiles.dart';

class StudentDetailPage extends StatelessWidget {
  static const String routeName = '/students/detail';

  final HocVien student;

  String get title => "${student.hoTen} - ${student.maHocVien ?? "N/A"}";

  const StudentDetailPage({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          StringTile(
            titleText: "Họ tên",
            initialValue: student.hoTen,
          ),
          StringTile(
            titleText: "Mã học viên",
            initialValue: student.maHocVien ?? "",
            onUpdate: (value) => student.updateStudentId(value),
          ),
          StringTile(
            titleText: "Email HUST",
            initialValue: student.emailHust ?? "",
            onUpdate: (value) => student.updateStudentEmail(value),
          ),
          StringTile(
            titleText: "Điện thoại",
            initialValue: student.dienThoai ?? "",
            onUpdate: (value) => student.updatePhoneNumber(value),
          ),
          StringTile(
            titleText: "Email",
            initialValue: student.email ?? "",
            onUpdate: (value) => student.updatePrivateEmail(value),
          ),
        ],
      ),
    );
  }
}

class StudentListPageState extends ChangeNotifier {
  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();
  final debounceDuration = const Duration(milliseconds: 400);
  late Future<List<HocVien>> futureSearchedStudents;
  late Timer debounceTimer;

  void searchNow() {
    final searchText = searchController.text.trim();
    if (searchText.isEmpty) {
      futureSearchedStudents = Future.value([]);
      notifyListeners();
      return;
    }

    futureSearchedStudents = HocVien.search(searchText);
    notifyListeners();
  }

  void debounceAndSearch() {
    debounceTimer.cancel();
    debounceTimer = Timer(debounceDuration, () {
      searchNow();
    });
  }

  StudentListPageState() {
    debounceTimer = Timer(debounceDuration, () {});
    futureSearchedStudents = Future.value([]);

    // Search when change
    searchController.addListener(() => debounceAndSearch());

    // Highligh all when focused
    searchFocusNode.addListener(() {
      if (searchFocusNode.hasFocus) {
        searchController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: searchController.text.length,
        );
      }
    });
  }
}

class _StudentSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StudentListPageState>(
      context,
      listen: false,
    );
    return ListTile(
      leading: Icon(Icons.search),
      title: Focus(
        key: globalFocusKey,
        child: TextField(
          autofocus: true,
          focusNode: state.searchFocusNode,
          controller: state.searchController,
          decoration: InputDecoration(
            labelText: 'Search Students',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (_) => state.searchNow(),
        ),
      ),
    );
  }
}

class _StudentListPageActions extends StatelessWidget {
  final Widget child;
  const _StudentListPageActions({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StudentListPageState>(context, listen: false);
    print(state);
    return Actions(
      actions: {
        SearchIntent: CallbackAction<SearchIntent>(
          onInvoke: (intent) {
            print(state);
            state.searchFocusNode.requestFocus();
            return;
          },
        ),
        EscapeIntent: CallbackAction<EscapeIntent>(
          onInvoke: (intent) {
            state.searchFocusNode.unfocus();
            return;
          },
        ),
      },
      child: child,
    );
  }
}

class StudentListPage extends StatelessWidget {
  static const String routeName = '/students/list';

  const StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StudentListPageState(),
      child: _StudentListPageActions(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Student List'),
          ),
          body: Column(
            children: [
              _StudentSearchBar(),
              Expanded(
                child: Selector(
                  selector: (context, StudentListPageState state) {
                    return state.futureSearchedStudents;
                  },
                  builder: (context, futureSearchedStudents, child) {
                    return FutureBuilder(
                      future: futureSearchedStudents,
                      builder: (context, connection) {
                        switch (connection.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator());
                          case ConnectionState.active:
                          case ConnectionState.done:
                            if (connection.hasError) {
                              return Center(
                                child: Text('Error: ${connection.error}'),
                              );
                            }
                            final students = connection.data ?? [];
                            return _StudentListView(students: students);
                        }
                      },
                    );
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

class _StudentListView extends StatelessWidget {
  const _StudentListView({
    required this.students,
  });

  final List<HocVien> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        final subtitles = [
          "${student.nienKhoa} - ${student.maHocVien ?? "N/A"}",
          "Email: ${student.emailHust}",
          "Email cá nhân: ${student.email}",
          student.trangThai?.label ?? "Unknown status",
        ].join("\n");

        final state = Provider.of<StudentListPageState>(
          context,
          listen: false,
        );

        return ListTile(
          title: Text(student.hoTen),
          subtitle: Text(subtitles),
          isThreeLine: true,
          onTap: () async {
            await Navigator.pushNamed(
              context,
              StudentDetailPage.routeName,
              arguments: student,
            );

            state.searchNow();
          },
        );
      },
    );
  }
}
