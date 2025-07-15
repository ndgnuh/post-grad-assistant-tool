import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business/domain_objects.dart';

class TeacherInfoPageState with ChangeNotifier {
  final FocusNode searchFocusNode = FocusNode();
  final searchEditingController = TextEditingController();
  GiangVien? selectedTeacher;
  bool isSearching = false;

  final foundTeachers = <GiangVien>{};

  int get numFoundTeachers => foundTeachers.length;
  bool get shouldUserPrompted => searchEditingController.text.trim().isEmpty;

  void closeSearch() {
    isSearching = false;
    searchFocusNode.unfocus();
    notifyListeners();
  }

  TeacherInfoPageState toggleSearch() {
    isSearching = !isSearching;
    if (isSearching) {
      final currentQuery = searchEditingController.text;
      final selection = TextSelection(
        baseOffset: 0,
        extentOffset: currentQuery.length,
      );

      searchEditingController.selection = selection;
    }
    notifyListeners();
    return this;
  }

  commitSearch(String query) async {
    final teachers = await GiangVien.search(query);

    foundTeachers.clear();
    foundTeachers.addAll(teachers);

    isSearching = false; // Close search bar

    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }
}

class ListTeachers extends StatelessWidget {
  const ListTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TeacherInfoPageState>(context);
    if (state.shouldUserPrompted) {
      return const Center(
        child: Text("Nhập tên giảng viên để tìm kiếm"),
      );
    }

    if (state.numFoundTeachers == 0) {
      return const Center(
        child: Text("Không tìm thấy giảng viên nào"),
      );
    }

    return ListView.builder(
      itemCount: state.foundTeachers.length,
      itemBuilder: (context, index) {
        final teacher = state.foundTeachers.elementAt(index);
        final displayName = teacher.hoTenChucDanh;
        final subtitle1 = teacher?.donVi ?? "Không rõ đơn vị";
        final subtitle2 = teacher?.email ?? "Không rõ email";
        return ListTile(
          title: Text(displayName),
          subtitle: Text("$subtitle1\n$subtitle2"),
          onTap: () {
            state.closeSearch(); // Close search bar
            state.selectedTeacher = teacher; // Set selected teacher
            Navigator.pushNamed(
              context,
              "/mobile/teacher_detail",
              arguments: teacher,
            );
          },

          // Actions: Edit, View details
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Navigate to edit teacher page
                  Navigator.pushNamed(context, "/mobile/edit_teacher",
                      arguments: teacher);
                },
              ),
              IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  // Navigate to view details page
                  Navigator.pushNamed(context, "/mobile/teacher_details",
                      arguments: teacher);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  final String title;

  const SearchBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TeacherInfoPageState>(context);
    if (state.isSearching) {
      final node = state.searchFocusNode;
      FocusScope.of(context).requestFocus(node);
      return TextField(
        focusNode: node,
        controller: state.searchEditingController,
        decoration: InputDecoration(
          hintText: title,
        ),
        onSubmitted: (String? query) => state.commitSearch(query ?? ""),
      );
    } else if (state.shouldUserPrompted) {
      return Text(title);
    } else {
      final query = state.searchEditingController.text.trim();
      return Text("Tìm giảng viên: '$query'");
    }
  }
}

class SearchToggleButton extends StatelessWidget {
  const SearchToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TeacherInfoPageState>(context);
    return IconButton(
      icon: Icon(state.isSearching ? Icons.close : Icons.search),
      onPressed: () => state.toggleSearch(),
    );
  }
}

/// Add button to navigate to add page
class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        // Navigate to add teacher page
        Navigator.pushNamed(context, "/mobile/add_teacher");
      },
    );
  }
}

class MobilePageTeacherList extends StatelessWidget {
  static const routeName = "/mobile/teacher_list";

  const MobilePageTeacherList({Key? key}) : super(key: key);

  static Widget initialize() => ChangeNotifierProvider<TeacherInfoPageState>(
        create: (_) => TeacherInfoPageState(),
        child: const MobilePageTeacherList(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(title: "Danh sách giảng viên"),
        actions: [
          SearchToggleButton(),
          AddButton(),
        ],
      ),
      body: ListTeachers(),
    );
  }
}
