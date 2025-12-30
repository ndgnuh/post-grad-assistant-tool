import 'package:fami_tools/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import 'teacher_pages.dart';
import 'teacher_search_providers.dart';

final _searchFocusNode = FocusNode();

class TeacherSearchPage extends StatelessWidget {
  static const routeName = '/teacher/search';
  const TeacherSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: Text("Giảng viên"),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "Tìm kiêm"),
                Tab(text: "Quản trị"),
              ],
            ),
          ),
        ),
        body: CommonShortcuts(
          onSearch: (_) => _searchFocusNode.requestFocus(),
          child: ConstrainedBody(
            child: TabBarView(
              children: [
                // Search tab
                Padding(
                  padding: EdgeInsets.all(context.gutter),
                  child: Column(
                    spacing: context.gutter,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    verticalDirection: context.verticalDirection,
                    children: [
                      _SearchBar(),

                      Expanded(
                        child: _TeacherListView(),
                      ),
                    ],
                  ),
                ),

                Text("TODO"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TeacherListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idsAsync = ref.watch(teacherIdsProvider);
    switch (idsAsync) {
      case AsyncLoading():
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Text("Lỗi khi tải giảng viên: $error");
      default:
    }

    final (needUserInput, ids) = idsAsync.value!;
    if (needUserInput) {
      return Center(child: Text("Vui lòng nhập từ khóa tìm kiếm."));
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: ids.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final id = ids[index];
        return _TeacherListTile(teacherId: id);
      },
    );
  }
}

class _TeacherListTile extends ConsumerWidget {
  final int teacherId;
  const _TeacherListTile({required this.teacherId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherAsync = ref.watch(teacherByIdProvider(teacherId));
    final title = switch (teacherAsync) {
      AsyncLoading() => Text("[$teacherId] Đang tải..."),
      AsyncError(:final error) => Text("Lỗi khi tải giảng viên: $error"),
      AsyncData(:final value) => Text(value.name),
    };

    final leading = switch (teacherAsync) {
      AsyncData(:final value) => CircleAvatar(
        child: Text(value.name.substring(0, 1)),
      ),
      _ => CircleAvatar(child: Icon(Symbols.person)),
    };

    final subtitleTexts = [];
    switch (teacherAsync) {
      case AsyncLoading():
        subtitleTexts.add("[$teacherId] Đang tải...");
      case AsyncError(:final error):
        subtitleTexts.add("Lỗi khi tải thông tin: $error");
      case AsyncData(:final value):
        if (value.university != null) {
          subtitleTexts.add(value.university!);
        }
        if (value.falcuty != null) {
          subtitleTexts.add("Email: ${value.falcuty!}");
        }
        if (value.phoneNumber != null) {
          subtitleTexts.add("SĐT: ${value.phoneNumber!}");
        }
    }

    return ListTile(
      title: title,
      leading: leading,
      subtitle: Text(subtitleTexts.join("\n")),
      onTap: () {
        Navigator.pushNamed(
          context,
          TeacherDetailsPage.routeName,
          arguments: teacherId,
        );
      },
    );
  }
}

class _SearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(searchQueryProvider.notifier);

    return TextField(
      focusNode: _searchFocusNode,
      controller: notifier.controller,
      onChanged: (value) => notifier.debounceSet(value),
      onSubmitted: (value) => notifier.set(value),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        labelText: "Tìm giảng viên",
        hintText: "Tên, mã số, bộ môn...",
      ),
    );
  }
}
