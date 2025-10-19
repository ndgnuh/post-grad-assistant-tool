import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:file_picker/file_picker.dart';

import '../../business/domain_objects.dart';
import '../../custom_widgets.dart';
import '../../custom_tiles.dart';

import './index.dart';
import './widgets.dart';
import './providers.dart';

Future<bool?> goToDetail(Thesis thesis) async {
  // TODO: repimplement
  // return await Get.to<bool>(ThesisDetailPage(thesis: thesis));
}

class _State extends ChangeNotifier {
  late List<Thesis> searchedTheses;
  final TextEditingController searchController = TextEditingController();
  bool? _assigned;
  ConnectionState searching = ConnectionState.none;

  void goToCreatePage([Intent? intent]) async {
    // TODO: re-implement
    // await Get.to(ThesisCreatePage());
    await search();
  }

  Action get goToCreatePageAction => CallbackAction(onInvoke: goToCreatePage);

  // filter get/setter
  bool? get assigned => _assigned;
  set assigned(bool? value) {
    _assigned = value;
    search();
  }

  // search string get/setter
  String get searchQuery => searchController.text;
  set searchQuery(String? value) {
    searchController.text = value ?? "";
    search();
  }

  // Delete theses from DB
  Future<void> deleteThesis(Thesis thesis) async {
    // TODO: re-implement
    // final context = Get.context!;
    // final messenger = ScaffoldMessenger.of(context);
    //
    // final confirmed = await showDialog<bool>(
    //   context: context,
    //   builder: (context) => AlertDialog.adaptive(
    //     title: Text("Xóa đề tài"),
    //     content: Text(
    //       "Chắc chắn muốn xóa đề tài?",
    //     ),
    //     actions: [
    //       TextButton(
    //         onPressed: () => Get.back(result: false),
    //         child: Text("Hủy"),
    //       ),
    //       TextButton(
    //         onPressed: () => Get.back(result: true),
    //         child: Text("Xóa"),
    //       ),
    //     ],
    //   ),
    // );
    //
    // if (confirmed == true) {
    //   await thesis.delete();
    //   messenger.showMessage("Đề tài đã được xóa thành công");
    //   await search();
    // }
  }

  /// Search for theses based on the current search query and assigned filter.
  Future<void> search() async {
    searching = ConnectionState.active;
    notifyListeners();
    searchedTheses = await DeTaiThacSi.search(
      searchQuery: searchQuery,
      assigned: _assigned,
    );
    searching = ConnectionState.done;
    notifyListeners();
  }

  /// Export all unassigned theses to a PDF file.
  Future<void> exportExampleThesesPdf() async {
    // TODO: replace context
    // final context = Get.context!;
    // final messenger = ScaffoldMessenger.of(context);
    //
    // final outputPath = await FilePicker.platform.saveFile(
    //   dialogTitle: "Xuất danh sách đề tài hướng dẫn",
    //   fileName: "DanhSach_DeTai_ThamKhao.pdf",
    // );
    //
    // if (outputPath == null) {
    //   messenger.showMessage("Xuất PDF bị hủy");
    //   return;
    // }
    //
    // final theses = await DeTaiThacSi.search(assigned: false);
    //
    // await exportThesisListPdf(outputPath: outputPath, theses: theses);
    // messenger.showMessage("Xuất danh Pdf thành công");
  }

  /// Initialize the state
  _State() {
    searchedTheses = [];
  }
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

    return ChangeNotifierProvider(
      create: (context) => _State(),
      child: DefaultTabController(
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
                _ThreeDotMenu(),
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
                  Center(child: Text("TODO")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThreeDotMenu extends StatelessWidget {
  @override
  build(BuildContext context) {
    final assigned = context.select((_State state) => state.assigned);
    final state = context.read<_State>();

    return MenuAnchor(
      menuChildren: [
        CheckboxListTile(
          secondary: Icon(Icons.filter_alt),
          tristate: true,
          title: Text("Đã giao", softWrap: false),
          subtitle: switch (assigned) {
            true => Text("Hiện đề tài đã giao"),
            false => Text("Hiện đề tài chưa giao"),
            null => Text("Tất cả đề tài"),
          },
          value: assigned,
          onChanged: (value) => state.assigned = value,
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Thêm đề tài"),
          onTap: () => state.goToCreatePage(),
        ),
        ListTile(
          leading: Icon(Icons.download),
          title: Text("Xuất danh sách"),
          onTap: () {},
        ),
      ],
      builder: (context, controller, _) => IconButton(
        onPressed: () => switch (controller.isOpen) {
          true => controller.close(),
          false => controller.open(),
        },
        icon: Icon(Icons.more_vert),
      ),
    );
  }
}

class _TopicListView extends StatelessWidget {
  const _TopicListView();

  @override
  build(BuildContext context) {
    final topics = context.select((_State state) => state.searchedTheses);

    return ListView.separated(
      separatorBuilder: (context, i) => Divider(),
      itemCount: topics.length,
      itemBuilder: (context, i) {
        final topic = topics[i];
        final autofocus = i == 0;
        return _ThesisItem(thesis: topic, autofocus: autofocus);
      },
    );
  }
}

class _ThesisItem extends StatelessWidget {
  const _ThesisItem({
    required this.thesis,
    this.autofocus = false,
  });

  final Thesis thesis;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final teacher = thesis.giangVien;
    final student = thesis.hocVien;
    final titleText = thesis.tenTiengViet;
    final subtitleText = [
      "Hướng dẫn: ${teacher.hoTenChucDanh}",
      "Thực hiện: ${student?.hoTen}",
    ].join("\n");

    final messenger = ScaffoldMessenger.of(context);

    final state = context.read<_State>();
    final navigator = Navigator.of(context);

    return InkWell(
      key: ValueKey(thesis.id),
      onTap: () async {
        // Navigate to the topic details page
        await showDialog(
          context: context,
          builder: (context) => MenuDialog(
            items: [
              MenuDialogItem(
                icon: Icons.visibility,
                title: "Xem chi tiết",
                subtitle: "Xem chi tiết đề tài",
                onTap: () async {
                  final dirty = await goToDetail(thesis);
                  if (dirty == true) state.search();
                },
              ),
              MenuDialogItem(
                icon: Icons.edit,
                title: "Chỉnh sửa đề tài",
                subtitle: "Sửa tên và ghi chú đề tài",
                onTap: () => messenger.showMessage("TODO"),
              ),
              MenuDialogItem(
                icon: Icons.assignment,
                title: "Giao đề tài",
                subtitle: "Giao đề tài cho học viên",
                onTap: () => messenger.showMessage("TODO"),
              ),
              MenuDialogItem(
                icon: Icons.delete,
                title: "Xóa đề tài",
                subtitle: "Xóa đề tài khỏi CSDL",
                onTap: () async {
                  await state.deleteThesis(thesis);
                },
              ),
            ],
          ),
        );
      },

      child: ListTile(
        leading: Icon(Icons.topic),
        title: Text(titleText),
        subtitle: Text(subtitleText),
        isThreeLine: true,
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  @override
  build(BuildContext context) {
    final state = context.read<_State>();
    return OutlinedButton.icon(
      icon: Icon(Icons.add),
      label: Text("Thêm đề tài"),
      onPressed: () => state.goToCreatePage(),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  build(BuildContext context) {
    final state = context.read<_State>();
    return TextField(
      controller: state.searchController,
      decoration: InputDecoration(
        hintText: "Tìm theo tên đề tài, giảng viên, học viên...",
        labelText: "Tìm kiếm",
      ),
      onSubmitted: (_) => state.search(),
    );
  }
}
