import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets.dart';
import '../../business/ql_de_tai.dart' show MasterThesisTopic, searchDeTai;
import '../../business/domain_objects.dart';

class State extends ChangeNotifier {
  static of(context) => Provider.of<State>(context);

  final Set<DeTaiThacSi> selectedTopics = {};
  final Set<DeTaiThacSi> searchedTopics = {};
  final TextEditingController searchDeTaiController = TextEditingController();
  final TextEditingController editClassOfYear = TextEditingController();

  Future<void> refresh() async {
    searchedTopics.clear();
    if (searchDeTaiController.text.isEmpty) {
      notifyListeners();
      return;
    }
    final searched = await DeTaiThacSi.search(
      searchQuery: searchDeTaiController.text,
      assigned: true,
    );
    searchedTopics.addAll(searched);
    notifyListeners();
  }
}

class ThesisSearchBar extends StatelessWidget {
  const ThesisSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = State.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: state.searchDeTaiController,
        onSubmitted: (_) => state.refresh(),
        decoration: InputDecoration(
          labelText: "Tìm kiếm đề tài",
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => state.refresh(),
          ),
        ),
      ),
    );
  }
}

class ExportButton extends StatelessWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = State.of(context);
    return ElevatedButton(
      onPressed: () async {
        final result = await FilePicker.platform.saveFile(
          dialogTitle: "Xuất đề tài thạc sĩ",
          fileName: "de_tai_thac_si.xlsx",
        );
        if (result != null) {
          // Call the export function here
          // TODO
        }
      },
      child: const Text("Xuất danh sách đề tài"),
    );
  }
}

class TopicList extends StatelessWidget {
  final Set<DeTaiThacSi> topics;
  final String title;
  final Function(DeTaiThacSi) onTap;
  final IconData icon;

  const TopicList({
    super.key,
    required this.topics,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics.elementAt(index);
          final giangVien = topic.giangVien;
          final hocVien = topic.hocVien;
          return ListTile(
            trailing: Icon(icon),
            onTap: () => onTap(topic),
            title: Text(topic.tenTiengViet),
            subtitle: Text(
              "${giangVien.hoTenChucDanh} - [${hocVien?.maHocVien}] ${hocVien?.hoTen}",
            ),
          );
        },
      ),
    );
  }
}

class SearchedTopicList extends StatelessWidget {
  const SearchedTopicList({super.key});

  @override
  Widget build(BuildContext context) {
    final state = State.of(context);
    return TopicList(
      icon: Icons.add,
      topics: state.searchedTopics,
      title: "Đề tài tìm kiếm",
      onTap: (topic) {
        state.selectedTopics.add(topic);
        state.notifyListeners();
      },
    );
  }
}

class SelectedTopicList extends StatelessWidget {
  const SelectedTopicList({super.key});

  @override
  Widget build(BuildContext context) {
    final state = State.of(context);
    return TopicList(
      icon: Icons.remove,
      topics: state.selectedTopics,
      title: "Đề tài đã chọn",
      onTap: (topic) {
        state.selectedTopics.remove(topic);
        state.notifyListeners();
      },
    );
  }
}

class InputClassOfYear extends StatelessWidget {
  const InputClassOfYear({super.key});

  @override
  Widget build(BuildContext context) {
    final state = State.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: EzTextInput(
        label: "Lớp năm",
        placeholder: "Nhập lớp năm (ví dụ: 2023)",
        controller: state.editClassOfYear,
      ),
    );
  }
}

class PageExportThesis extends StatelessWidget {
  const PageExportThesis({super.key});
  static const routeName = "/manage-thesis/export-registration";

  @override
  Widget build(BuildContext context) {
    final body = Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 3,
              child: InputClassOfYear(),
            ),
            Flexible(
              child: ExportButton(),
            ),
          ],
        ),
        ThesisSearchBar(),
        Expanded(
          child: Row(
            children: [
              Expanded(child: SearchedTopicList()),
              Expanded(child: SelectedTopicList()),
            ],
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xuất phiếu giao đề tài"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => State(),
        child: body,
      ),
    );
  }
}
