import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../business/domain_objects.dart';
import '../../shortcuts.dart';
import 'teacher_pages.dart';

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

class ListTeachers extends StatelessWidget {
  const ListTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);
    if (state.shouldUserPrompted) {
      return const Center(child: Text("Nhập tên giảng viên để tìm kiếm"));
    }

    if (state.numFoundTeachers == 0) {
      return const Center(child: Text("Không tìm thấy giảng viên nào"));
    }

    // https://ui.dev/rwd/develop/browser-feature-support/media-queries-for-common-device-breakpoints
    final screenWidth = MediaQuery.of(context).size.width;
    final double itemWidth = switch (screenWidth) {
      < 480 => 480,
      < 768 => 768.0,
      < 1280 => 1280 / 3,
      _ => 550,
    };
    final itemHeight = 200.0;

    return GridView(
      // runAlignment: WrapAlignment.spaceBetween,
      // alignment: WrapAlignment.spaceEvenly,
      // crossAxisAlignment: WrapCrossAlignment.start,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: itemWidth,
        childAspectRatio: itemWidth / itemHeight,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      children: [
        for (final teacher in state.foundTeachers)
          SizedBox(
            width: itemWidth,
            height: itemHeight,
            child: TeacherCard(key: ValueKey(teacher.id), teacher: teacher),
          ),
      ],
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

class Page extends StatelessWidget {
  static const routeName = "/mobile/teacher_list";

  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_State>(
      create: (_) => _State(),
      builder: (context, _) {
        final totalWidth = MediaQuery.of(context).size.width;
        final smallScreen = totalWidth <= 700;

        return Scaffold(
          appBar: AppBar(
            title: Text("Danh sách giảng viên"),
            actions: [AddButton()],
          ),
          body: Padding(
            padding: EdgeInsets.all(context.gutter),
            child: Column(
              spacing: context.gutter,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!smallScreen)
                  IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: context.gutter,
                      children: [
                        Expanded(child: TeacherSearchBar()),
                        TeacherAddButton(),
                      ],
                    ),
                  ),
                Expanded(child: ListTeachers()),
                if (smallScreen) TeacherSearchBar(),
                if (smallScreen) TeacherAddButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TeacherAddButton extends StatelessWidget {
  const TeacherAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: const Icon(Icons.add),
      label: const Text("Thêm giảng viên"),
      onPressed: () async {
        final state = context.read<_State>();
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherCreatePage(),
          ),
        );
        state.searchNow();
      },
    );
  }
}

class SearchToggleButton extends StatelessWidget {
  const SearchToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);
    if (state.isSearching) {
      // If searching, show close button
      return IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => state.closeSearch(),
      );
    } else {
      return IconButton(
        icon: Icon(Icons.search),
        onPressed: Actions.handler<SearchIntent>(context, const SearchIntent()),
      );
    }
  }
}

class TeacherCard extends StatelessWidget {
  final GiangVien teacher;

  const TeacherCard({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final fontSize = 12.0;
    final titleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      overflow: TextOverflow.ellipsis,
    );
    final subtitleStyle = textTheme.bodyLarge?.copyWith(
      color: colorScheme.secondary,
      overflow: TextOverflow.fade,
    );

    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherDetailsPage(id: teacher.id),
          ),
        ),

        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              leading: CircleAvatar(child: const Icon(Icons.person)),
              title: Text(teacher.hoTenChucDanh, style: titleStyle),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        WidgetSpan(child: const Icon(Icons.business, size: 16)),
                        WidgetSpan(child: SizedBox(width: 8)),
                        TextSpan(text: teacher.donVi, style: subtitleStyle),
                      ],
                    ),
                  ),
                  RichText(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        WidgetSpan(child: const Icon(Icons.email, size: 16)),
                        WidgetSpan(child: SizedBox(width: 8)),
                        TextSpan(
                          text: teacher.email ?? "Không rõ email",
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        WidgetSpan(child: const Icon(Icons.phone, size: 16)),
                        WidgetSpan(child: SizedBox(width: 8)),
                        TextSpan(
                          text: teacher.sdt ?? "Không rõ số điện thoại",
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherSearchBar extends StatelessWidget {
  const TeacherSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);
    return TextField(
      controller: state.searchController,
      focusNode: state.searchFocusNode,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.search),
        hintText: "Họ tên, điện thoại, email, mã số thuế, ...",
        labelText: "Tìm kiếm giảng viên",
      ),
      onChanged: (query) => state.debounceSearch(),
      onSubmitted: (query) => state.searchNow(),
    );
  }
}

class _State with ChangeNotifier {
  static Duration debounceDuration = const Duration(milliseconds: 400);
  final FocusNode searchFocusNode = FocusNode();
  final FocusNode globalFocusNode = FocusNode();
  final searchController = SearchController();
  GiangVien? selectedTeacher;

  bool isSearching = false;

  final foundTeachers = <GiangVien>{};
  Timer debounceTimer = Timer(Duration.zero, () {});

  int get numFoundTeachers => foundTeachers.length;

  bool get shouldUserPrompted => searchController.text.trim().isEmpty;

  void closeSearch() {
    isSearching = false;
    searchFocusNode.unfocus();
    globalFocusNode.requestFocus();
    notifyListeners();
  }

  searchNow() async {
    final query = searchController.text.trim();
    final teachers = await GiangVien.search(query);

    foundTeachers.clear();
    foundTeachers.addAll(teachers);
    globalFocusNode.requestFocus();

    isSearching = false; // Close search bar

    notifyListeners();
  }

  debounceSearch() {
    // Cancel previous debounce timer if it's active
    if (debounceTimer.isActive) {
      debounceTimer.cancel();
    }

    // Debounce search
    debounceTimer = Timer(debounceDuration, () {
      searchNow();
    });
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

  refresh() {
    notifyListeners();
  }

  _State toggleSearch() {
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

  @override
  dispose() {
    searchFocusNode.dispose();
    globalFocusNode.dispose();
    searchController.dispose();
    debounceTimer.cancel();
    super.dispose();
  }
}
