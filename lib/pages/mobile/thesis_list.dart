import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../../business/domain_objects.dart';
import '../../custom_widgets.dart';

class ThesisTopicListPageState extends ChangeNotifier {
  late FutureOr<List<DeTaiThacSi>> futureTopics;
  String _searchQuery = "";
  bool? _assigned;

  bool? get assigned => _assigned;
  set assigned(bool? value) {
    _assigned = value;
    search();
  }

  String get searchQuery => _searchQuery;
  set searchQuery(String? value) {
    _searchQuery = value ?? "";
    search();
  }

  void search() {
    futureTopics = DeTaiThacSi.search(
      searchQuery: _searchQuery,
      assigned: _assigned,
    );
    notifyListeners();
  }

  ThesisTopicListPageState() {
    // Empty topic list
    futureTopics = Future.value([]);
  }
}

class _TopicListView extends StatelessWidget {
  final List<DeTaiThacSi> topics;

  const _TopicListView({
    required this.topics,
  });

  @override
  build(BuildContext context) {
    final navigator = Navigator.of(context);

    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, i) {
        final topic = topics[i];
        final teacher = topic.giangVien;
        final student = topic.hocVien;
        final titleText = topic.tenTiengViet;
        final subtitleText = [
          "Hướng dẫn: ${teacher.hoTenChucDanh}",
          "Thực hiện: ${student?.hoTen}",
        ].join("\n");
        return ListTile(
          leading: Icon(Icons.topic),
          title: Text(titleText),
          subtitle: Text(subtitleText),
          isThreeLine: true,
          onTap: () async {
            final arguments = ThesisTopicDetailPageArguments(
              topic: topic,
            );
            await navigator.pushNamed(
              ThesisTopicDetailPage.routeName,
              arguments: arguments,
            );
          },
        );
      },
    );
  }
}

class _ThreeDotMenu extends StatelessWidget {
  @override
  build(BuildContext context) {
    final state = Provider.of<ThesisTopicListPageState>(context, listen: false);
    final navigator = Navigator.of(context);

    return MenuAnchor(
      menuChildren: [
        Selector<ThesisTopicListPageState, bool?>(
          selector: (_, state) => state.assigned,
          builder: (_, assigned, __) => CheckboxListTile(
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
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Thêm đề tài"),
          onTap: () => navigator.pushNamed(
            ThesisTopicAddPage.routeName,
          ),
        ),
        ListTile(
          leading: Icon(Icons.download),
          title: Text("Xuất danh sách tham khảo"),
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

class _SearchBar extends StatelessWidget {
  @override
  build(BuildContext context) {
    final state = Provider.of<ThesisTopicListPageState>(context);
    return ListTile(
      leading: Icon(Icons.search),
      title: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Tìm theo tên đề tài, giảng viên, học viên...",
        ),
        onFieldSubmitted: (text) => state.searchQuery = text,
      ),
    );
  }
}

class ThesisTopicDetailPageArguments {
  final DeTaiThacSi topic;

  const ThesisTopicDetailPageArguments({required this.topic});
}

class ThesisTopicAddPage extends StatefulWidget {
  static const routeName = '/thesis/topic/add';

  const ThesisTopicAddPage({super.key});

  @override
  State<ThesisTopicAddPage> createState() => _ThesisTopicAddPageState();
}

class _ThesisTopicAddPageState extends State<ThesisTopicAddPage> {
  final titleVi = ValueNotifier<String>("");
  final titleEn = ValueNotifier<String>("");
  final description = ValueNotifier<String>("");
  final teacher = ValueNotifier<GiangVien?>(null);

  ValueListenableBuilder<String> buildStringInput({
    required ValueNotifier<String> valueListenable,
    required String title,
  }) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, _) => ListTile(
        title: Text(title),
        subtitle: Text(value),
        onTap: () async {
          final newValue = await TextEditingDialog.show(
            initialValue: value,
            context: context,
            title: title,
          );
          switch (newValue) {
            case String newValue:
              valueListenable.value = newValue;
          }
        },
      ),
    );
  }

  void validateAndSave({
    required ScaffoldMessengerState messenger,
    required NavigatorState navigator,
  }) async {
    if (teacher.value == null) {
      messenger.showMessage("Người hướng dẫn không được trống");
      return;
    }

    if (titleVi.value.isEmpty) {
      messenger.showMessage("Tên đề tài trống!");
      return;
    }

    if (titleEn.value.isEmpty) {
      messenger.showMessage("Tên đề tài trống!");
      return;
    }

    final topic = DeTaiThacSi(
      idGiangVien: teacher.value!.id,
      tenTiengViet: titleVi.value,
      tenTiengAnh: titleEn.value,
      giangVien: teacher.value!,
      ghiChu: description.value,
    );
    await topic.create();
    navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm đề tài"),
        actions: [
          TextButton.icon(
            label: Text("Lưu"),
            icon: Icon(Icons.save),
            onPressed: () => validateAndSave(
              messenger: messenger,
              navigator: navigator,
            ),
          ),
        ],
      ),
      body: ListView(children: [
        SearchAnchor(
          suggestionsBuilder: (context, searchController) async {
            final searchQuery = searchController.text;
            final teachers = await GiangVien.search(searchQuery);

            return [
              for (final teacher_ in teachers)
                ListTile(
                  title: Text(teacher_.hoTenChucDanh),
                  subtitle: Text(teacher_.donVi ?? ""),
                  onTap: () {
                    teacher.value = teacher_;
                    searchController.closeView(null);
                  },
                )
            ];
          },
          builder: (context, searchController) => ValueListenableBuilder(
            valueListenable: teacher,
            builder: (context, teacher, _) => ListTile(
                title: Text("Giảng viên"),
                subtitle: Text(teacher?.hoTenChucDanh ?? ""),
                onTap: () {
                  final searchQuery = searchController.text;
                  searchController.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: searchQuery.length,
                  );
                  searchController.openView();
                }),
          ),
        ),
        buildStringInput(
          valueListenable: titleVi,
          title: "Tên đề tài (tiếng Việt)",
        ),
        buildStringInput(
          valueListenable: titleEn,
          title: "Tên đề tài (tiếng Anh)",
        ),
        buildStringInput(
          valueListenable: description,
          title: "Ghi chú",
        ),
      ]),
    );
  }
}

class ThesisTopicDetailPage extends StatelessWidget {
  static const routeName = '/thesis/topic/detail';
  final DeTaiThacSi topic;

  const ThesisTopicDetailPage({
    super.key,
    required this.topic,
  });

  factory ThesisTopicDetailPage.fromArguments(
    ThesisTopicDetailPageArguments args,
  ) =>
      ThesisTopicDetailPage(
        topic: args.topic,
      );

  @override
  Widget build(BuildContext context) {
    final teacher = topic.giangVien;
    final student = topic.hocVien;

    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết đề tài"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Tên tiếng Việt"),
            subtitle: Text(topic.tenTiengViet),
          ),
          ListTile(
            title: Text("Tên tiếng Anh"),
            subtitle: Text(topic.tenTiengAnh),
          ),
          ListTile(
            title: Text("Giảng viên hướng dẫn"),
            subtitle: Text(teacher.hoTenChucDanh),
          ),
          ListTile(
            title: Text("Học viên"),
            subtitle: Text("${student?.hoTen} [${student?.maHocVien}]"),
          ),
          ListTile(
            title: Text("Số QD Giao"),
            subtitle: Text(topic.soQdGiao ?? ""),
          ),
          ListTile(
            title: Text("Ngày giao"),
            subtitle: Text(topic.ngayGiao.toString()),
          ),
          ListTile(
            title: Text("Hạn bảo vệ"),
            subtitle: Text(topic.hanBaoVe.toString()),
          ),
          ListTile(
            title: Text("Ngày bảo vệ"),
            subtitle: Text(topic.ngayBaoVe.toString()),
          ),
        ],
      ),
    );
  }
}

class ThesisTopicListPage extends StatelessWidget {
  static const routeName = '/thesis/topic/list';
  const ThesisTopicListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThesisTopicListPageState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Đề tài hướng dẫn"),
          actions: [
            _ThreeDotMenu(),
          ],
        ),
        body: Column(
          children: [
            _SearchBar(),
            Expanded(
              child:
                  Selector<ThesisTopicListPageState, Future<List<DeTaiThacSi>>>(
                selector: (context, state) => Future.value(
                  state.futureTopics,
                ),
                builder: (context, future, _) => FutureBuilder(
                  future: future,
                  builder: (context, connection) {
                    switch (connection.connectionState) {
                      case ConnectionState.done:
                        final topics = connection.data!;
                        return _TopicListView(topics: topics);
                      default:
                        return SizedBox.shrink(
                          child: CircularProgressIndicator(),
                        );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
