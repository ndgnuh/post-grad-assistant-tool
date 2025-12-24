import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../custom_widgets.dart';
import './providers.dart';
import './widgets.dart';
import 'thesis_list_action_tab.dart' show ThesisListActionTab;

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
            builder: (context) => ThesisListPage(),
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
      onTap: () => showDialog(
        context: context,
        builder: (context) => _ThesisItemActionDialog(
          viewModel: viewModel,
          index: index,
        ),
      ),
      // onTap: () async {
      //   // Navigate to the topic details page
      //   await showDialog(
      //     context: context,
      //     builder: (context) => MenuDialog(
      //       items: [
      //         MenuDialogItem(
      //           icon: Icons.visibility,
      //           title: "Xem chi tiết",
      //           subtitle: "Xem chi tiết đề tài",
      //           onTap: () async {
      //             final dirty = await goToDetail(thesis);
      //             if (dirty == true) state.search();
      //           },
      //         ),
      //         MenuDialogItem(
      //           icon: Icons.edit,
      //           title: "Chỉnh sửa đề tài",
      //           subtitle: "Sửa tên và ghi chú đề tài",
      //           onTap: () => messenger.showMessage("TODO"),
      //         ),
      //         MenuDialogItem(
      //           icon: Icons.assignment,
      //           title: "Giao đề tài",
      //           subtitle: "Giao đề tài cho học viên",
      //           onTap: () => messenger.showMessage("TODO"),
      //         ),
      //         MenuDialogItem(
      //           icon: Icons.delete,
      //           title: "Xóa đề tài",
      //           subtitle: "Xóa đề tài khỏi CSDL",
      //           onTap: () async {
      //             await state.deleteThesis(thesis);
      //           },
      //         ),
      //       ],
      //     ),
      //   );
      // },
      child: ListTile(
        leading: Icon(Symbols.topic),
        title: Text(titleText),
        subtitle: Text(subtitleText),
      ),
    );
  }
}

class _ThesisItemActionDialog extends StatelessWidget {
  final ThesisListViewModel viewModel;
  final int index;
  const _ThesisItemActionDialog({
    required this.viewModel,
    required this.index,
  });

  @override
  build(BuildContext context) {
    return MenuDialog(
      items: [
        MenuDialogItem(
          icon: Symbols.details,
          title: "Chi tiết",
          onTap: () => goToDetail(context),
        ),

        MenuDialogItem(
          title: "Chỉnh sửa",
          icon: Symbols.edit,
        ),

        MenuDialogItem(
          title: "Xóa đề tài",
          icon: Symbols.delete,
        ),
      ],
    );
  }

  void goToDetail(BuildContext context) async {
    // final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final thesis = viewModel.theses[index];
    messenger.showMessage("TODO: navigate to detail page with thesis $thesis");

    // navigator.push(
    //   MaterialPageRoute(
    //     builder: (context) => ThesisDetailPage(thesis: thesis),
    //   ),
    // );
  }
}

// class _ThreeDotMenu extends StatelessWidget {
//   @override
//   build(BuildContext context) {
//     final assigned = context.select((_State state) => state.assigned);
//     final state = context.read<_State>();
//
//     return MenuAnchor(
//       menuChildren: [
//         CheckboxListTile(
//           secondary: Icon(Icons.filter_alt),
//           tristate: true,
//           title: Text("Đã giao", softWrap: false),
//           subtitle: switch (assigned) {
//             true => Text("Hiện đề tài đã giao"),
//             false => Text("Hiện đề tài chưa giao"),
//             null => Text("Tất cả đề tài"),
//           },
//           value: assigned,
//           onChanged: (value) => state.assigned = value,
//         ),
//         ListTile(
//           leading: Icon(Icons.add),
//           title: Text("Thêm đề tài"),
//           onTap: () => state.goToCreatePage(),
//         ),
//         ListTile(
//           leading: Icon(Icons.download),
//           title: Text("Xuất danh sách"),
//           onTap: () {},
//         ),
//       ],
//       builder: (context, controller, _) => IconButton(
//         onPressed: () => switch (controller.isOpen) {
//           true => controller.close(),
//           false => controller.open(),
//         },
//         icon: Icon(Icons.more_vert),
//       ),
//     );
//   }
// }

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
