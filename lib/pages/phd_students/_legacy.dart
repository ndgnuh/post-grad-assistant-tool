import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:provider/provider.dart';

import '../../business/domain_objects.dart';
import '../../custom_tiles.dart';
import '../../custom_widgets.dart';
import '../../shortcuts.dart';
import '../../business/copy_pasta.dart';

class StudentCard extends StatelessWidget {
  static const double width = 480.0;
  static const double height = 200.0;
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    void onTap() async {
      Navigator.pushNamed(
        context,
        StudentDetailPage.routeName,
        arguments: student,
      );
    }

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = textTheme.bodyLarge?.copyWith(
      color: colorScheme.secondary,
      fontSize: 16.0,
      overflow: TextOverflow.ellipsis,
    );

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(context.gutterSmall),
        onTap: onTap,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text(student.hoTen, overflow: TextOverflow.ellipsis),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconText(
                    icon: Icons.school,
                    text: student.nienKhoa ?? "N/A",
                    style: textStyle,
                  ),
                  IconText(
                    icon: Icons.email,
                    text: student.email ?? "N/A",
                    style: textStyle,
                  ),
                  IconText(
                    icon: Icons.email,
                    text: student.emailHust ?? "N/A",
                    style: textStyle,
                  ),
                  IconText(
                    icon: Icons.phone,
                    text: student.dienThoai ?? "N/A",
                    style: textStyle,
                  ),
                  IconText(
                    icon: Icons.info,
                    text: student.trangThai?.label ?? "Unknown status",
                    style: textStyle,
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          ),
        ),
      ),
    );
  }
}

class StudentDetailPage extends StatelessWidget {
  static const String routeName = '/students/detail';

  final HocVien student;

  const StudentDetailPage({super.key, required this.student});

  String get title => "${student.hoTen} - ${student.maHocVien ?? "N/A"}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          StringTile(titleText: "Họ tên", initialValue: student.hoTen),
          StringTile(
            titleText: "Mã học viên",
            initialValue: student.maHocVien ?? "",
            onUpdate: (value) => student.updateStudentId(value!),
          ),
          StringTile(
            titleText: "Email HUST",
            initialValue: student.emailHust ?? "",
            onUpdate: (value) => student.updateStudentEmail(value!),
          ),
          StringTile(
            titleText: "Điện thoại",
            initialValue: student.dienThoai ?? "",
            onUpdate: (value) => student.updatePhoneNumber(value!),
          ),
          StringTile(
            titleText: "Email",
            initialValue: student.email ?? "",
            onUpdate: (value) => student.updatePrivateEmail(value!),
          ),
        ],
      ),
    );
  }
}

class StudentListPage extends StatelessWidget {
  static const String routeName = '/students/list';

  const StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final smallScreen = totalWidth < 600;

    return ChangeNotifierProvider(
      create: (_) => StudentListPageState(),
      child: CommonShortcuts(
        onSearch: () => onSearch(context),
        child: Scaffold(
          appBar: AppBar(title: Text('Học viên')),
          body: Padding(
            padding: EdgeInsets.all(context.gutter),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: context.gutter,
              children: [
                if (!smallScreen)
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: context.gutterSmall,
                      children: [
                        Expanded(child: _StudentSearchBar()),
                        _CopyButton(),
                      ],
                    ),
                  ),
                if (smallScreen) _StudentSearchBar(),
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
                if (smallScreen) _CopyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSearch(BuildContext context) {
    final state = Provider.of<StudentListPageState>(context, listen: false);
    state.searchFocusNode.requestFocus();
  }
}

class _CopyButton extends StatelessWidget {
  const _CopyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    return OutlinedButton.icon(
      icon: Icon(Icons.copy),
      label: Text('Copy email'),
      onPressed: () {
        final state = context.read<StudentListPageState>();
        final students = state.searchedStudents;

        // No student
        if (students.isEmpty) {
          messenger.showSnackBar(
            SnackBar(content: Text("Không có học viên nào để copy email.")),
          );
          return;
        }

        bool hasMissingEmail = false;
        final emails = <String>[];
        for (final student in students) {
          if (student.emailHust == null) {
            hasMissingEmail = true;
          } else {
            emails.add(student.emailHust!);
          }
        }

        final missingMsg = switch (hasMissingEmail) {
          true => ". Một số học viên không có email HUST",
          false => ".",
        };

        copyToClipboard(
          text: emails.join('\n'),
          notification: "Đã copy email học viên$missingMsg",
        );
      },
    );
  }
}

class StudentListPageState extends ChangeNotifier {
  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();
  final debounceDuration = const Duration(milliseconds: 400);
  late Future<List<HocVien>> futureSearchedStudents;
  late Timer debounceTimer;
  late List<HocVien> searchedStudents;

  StudentListPageState() {
    debounceTimer = Timer(debounceDuration, () {});
    searchedStudents = [];
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

  @override
  void dispose() {
    searchFocusNode.dispose();
    searchController.dispose();
    debounceTimer.cancel();
    super.dispose();
  }

  void debounceAndSearch() {
    debounceTimer.cancel();
    debounceTimer = Timer(debounceDuration, () {
      searchNow();
    });
  }

  void searchNow() {
    debounceTimer.cancel();
    final searchText = searchController.text.trim();
    if (searchText.isEmpty) {
      futureSearchedStudents = Future.value([]);
      searchedStudents = [];
      notifyListeners();
      return;
    }

    futureSearchedStudents =
        HocVien.search(searchQuery: searchText) as Future<List<HocVien>>;
    futureSearchedStudents.then((data) {
      searchedStudents = data;
      notifyListeners();
    });
    notifyListeners();
  }
}

class _StudentListView extends StatelessWidget {
  final List<HocVien> students;

  const _StudentListView({required this.students});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: StudentCard.width,
        mainAxisExtent: StudentCard.height,
        mainAxisSpacing: context.gutterSmall,
        crossAxisSpacing: context.gutterSmall,
      ),
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return StudentCard(student: student);
      },
    );
  }
}

class _StudentSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StudentListPageState>(context, listen: false);
    return TextField(
      key: searchFieldKey,
      focusNode: state.searchFocusNode,
      controller: state.searchController,
      decoration: InputDecoration(labelText: 'Tìm kiếm học viên'),
      onSubmitted: (_) => state.searchNow(),
    );
  }
}
