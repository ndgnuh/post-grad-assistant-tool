import 'package:fami_tools/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../custom_widgets.dart';
import './providers.dart';
import './widgets.dart';
import 'thesis_create_page.dart';
import 'thesis_details_page.dart';
import 'thesis_list_action_tab.dart' show ThesisListActionTab;

void _goToCreatePage(BuildContext context) {
  final navigator = Navigator.of(context);
  navigator.push(
    MaterialPageRoute(
      builder: (context) => ThesisCreatePage(),
    ),
  );
}

class ThesisListPage extends StatelessWidget {
  static const routeName = '/thesis/topic/list';
  const ThesisListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final largeScreen = MediaQuery.sizeOf(context).width > 800;
    final smallScreen = !largeScreen;

    final exportPdfButton = ExportPdfButton(
      builder: (context, callback) => OutlinedButton(
        onPressed: callback,
        child: Text("Xuất PDF"),
      ),
    );

    return DefaultTabController(
      length: 3,
      child: FocusNodeProvider(
        child: CommonShortcuts(
          onCreateNew: _goToCreatePage,
          onSearch: (context) {
            final searchFocusNode = FocusNodeProvider.of(context);
            FocusScope.of(context).requestFocus(searchFocusNode);
          },
          child: Scaffold(
            appBar: ConstrainedAppBar(
              withTabBar: true,
              child: AppBar(
                title: Text("Đề tài hướng dẫn"),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: "Danh sách đề tài"),
                    Tab(text: "Giao đề tài"),
                    Tab(text: "Quản trị"),
                  ],
                ),
                actions: [
                  // _ThreeDotMenu(),
                ],
              ),
            ),
            body: FocusScope(
              child: ConstrainedBody(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(context.gutter),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: context.gutter,
                        children: [
                          if (largeScreen)
                            IntrinsicHeight(
                              child: Row(
                                spacing: context.gutter,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(child: _SearchBar()),
                                  exportPdfButton,
                                  _CreateButton(),
                                ],
                              ),
                            ),
                          if (smallScreen) _SearchBar(),
                          Expanded(
                            child: _TopicListView(),
                          ),
                          if (smallScreen) exportPdfButton,
                          if (smallScreen) _CreateButton(),
                        ],
                      ),
                    ),

                    // TODO: actual views
                    Center(child: Text("TODO")),
                    ThesisListActionTab(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  @override
  build(BuildContext context) {
    final navigator = Navigator.of(context);
    return OutlinedButton.icon(
      icon: Icon(Icons.add),
      label: Text("Thêm đề tài"),
      onPressed: () {
        navigator.push(
          MaterialPageRoute(
            builder: (context) => ThesisCreatePage(),
          ),
        );
      },
    );
  }
}

class _SearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(searchTextProvider.notifier);
    return TextField(
      focusNode: FocusNodeProvider.of(context),
      decoration: InputDecoration(
        hintText: "Tìm theo tên đề tài, giảng viên, học viên...",
        labelText: "Tìm kiếm",
      ),
      onSubmitted: (text) => notifier.set(text),
      onChanged: (text) => notifier.debounceSet(text),
    );
  }
}

class _ThesisItem extends StatelessWidget {
  final ThesisListViewModel viewModel;

  final int index;
  const _ThesisItem({
    required this.viewModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final thesis = viewModel.theses[index];
    final supervisor = viewModel.supervisors[thesis]!;
    final student = viewModel.students[thesis];

    final titleText = thesis.vietnameseTitle;
    final subtitleText = [
      "Hướng dẫn: ${supervisor.name}",
      if (student != null) "Thực hiện: ${student.name}" else "Chưa giao",
    ].join("\n");

    return InkWell(
      key: ValueKey(thesis.id),
      onTap: () {
        final navigator = Navigator.of(context);
        navigator.push(
          MaterialPageRoute(
            builder: (context) => MscThesisDetailsPage(thesisId: thesis.id),
          ),
        );
      },
      child: ListTile(
        leading: Icon(Symbols.topic),
        title: Text(titleText),
        subtitle: Text(subtitleText),
      ),
    );
  }
}

class _TopicListView extends ConsumerWidget {
  const _TopicListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncViewModel = ref.watch(thesisListViewModelProvider);
    switch (asyncViewModel) {
      case AsyncLoading():
        return Center(child: CircularProgressIndicator());
      case AsyncError(error: var error):
        return Center(child: Text("Lỗi khi tải đề tài: $error"));
      default:
    }

    final viewModel = asyncViewModel.value!;
    if (viewModel.promptUserInput) {
      return Center(
        child: Text("Nhập từ khóa tìm kiếm"),
      );
    }

    if (viewModel.theses.isEmpty) {
      return Center(
        child: Text("Không tìm thấy đề tài nào"),
      );
    }

    final theses = viewModel.theses;
    // final students = viewModel.students;
    // final teachers = viewModel.supervisors;

    return ListView.separated(
      separatorBuilder: (context, i) => Divider(),
      itemCount: theses.length,
      itemBuilder: (context, i) {
        return _ThesisItem(viewModel: viewModel, index: i);
      },
    );
  }
}
