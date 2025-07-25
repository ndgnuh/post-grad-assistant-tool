import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../business/domain_objects.dart';
import '../../shortcuts.dart';
import 'dart:async';

class TeacherInfoPageState with ChangeNotifier {
  final FocusNode searchFocusNode = FocusNode();
  final FocusNode globalFocusNode = FocusNode();
  final searchController = SearchController();
  GiangVien? selectedTeacher;
  bool isSearching = false;

  final foundTeachers = <GiangVien>{};

  int get numFoundTeachers => foundTeachers.length;
  bool get shouldUserPrompted => searchController.text.trim().isEmpty;

  void closeSearch() {
    isSearching = false;
    searchFocusNode.unfocus();
    globalFocusNode.requestFocus();
    notifyListeners();
  }

  Object? openSearch() {
    isSearching = true;
    searchController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: searchController.text.length,
    );
    searchFocusNode.requestFocus();
    notifyListeners();
    return null;
  }

  TeacherInfoPageState toggleSearch() {
    isSearching = !isSearching;
    if (isSearching) {
      final currentQuery = searchController.text;
      final selection = TextSelection(
        baseOffset: 0,
        extentOffset: currentQuery.length,
      );

      searchController.selection = selection;
    }
    globalFocusNode.requestFocus();
    notifyListeners();
    return this;
  }

  static Duration debounceDuration = const Duration(milliseconds: 400);
  Timer debounceTimer = Timer(Duration.zero, () {});
  debounceSearch() {
    // Cancel previous debounce timer if it's active
    if (debounceTimer.isActive) {
      debounceTimer.cancel();
    }

    // Debounce search
    debounceTimer = Timer(debounceDuration, () {
      commitSearch();
    });
  }

  commitSearch() async {
    final query = searchController.text.trim();
    final teachers = await GiangVien.search(query);

    foundTeachers.clear();
    foundTeachers.addAll(teachers);
    globalFocusNode.requestFocus();

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

class SearchToggleButton extends StatelessWidget {
  const SearchToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TeacherInfoPageState>(context);
    if (state.isSearching) {
      // If searching, show close button
      return IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => state.closeSearch(),
      );
    } else {
      return IconButton(
        icon: Icon(Icons.search),
        onPressed: Actions.handler<SearchIntent>(
          context,
          const SearchIntent(),
        ),
      );
    }
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

class MobilePageTeacherShortcutManager extends ShortcutManager {
  @override
  get shortcuts => {
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyF):
            const SearchIntent(),
      };
}

class TeacherSearchBar extends StatelessWidget {
  const TeacherSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TeacherInfoPageState>(context);
    return ListTile(
      leading: const Icon(Icons.search),
      title: SearchBar(
        controller: state.searchController,
        focusNode: state.searchFocusNode,
        hintText: "Tìm giảng viên",
        onChanged: (query) => state.debounceSearch(),
        onSubmitted: (query) => state.commitSearch(),
      ),
    );
  }
}

class MobilePageTeacherList extends StatelessWidget {
  static const routeName = "/mobile/teacher_list";

  const MobilePageTeacherList({super.key});

  static Widget initialize() => ChangeNotifierProvider<TeacherInfoPageState>(
        create: (_) => TeacherInfoPageState(),
        child: const MobilePageTeacherList(),
      );

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TeacherInfoPageState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách giảng viên"),
        actions: [
          SearchToggleButton(),
          AddButton(),
        ],
      ),
      body: Actions(
        actions: {
          SearchIntent:
              CallbackAction(onInvoke: (intent) => state.openSearch()),
        },
        child: FocusScope(
          autofocus: true,
          canRequestFocus: true,
          child: Column(
            children: [
              TeacherSearchBar(),
              Expanded(child: ListTeachers()),
            ],
          ),
        ),
      ),
    );
  }
}
