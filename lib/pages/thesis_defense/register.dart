import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../business/domain_objects.dart';
import '../single_selection_page.dart';

import './council.dart' as council;

typedef Student = HocVien;
typedef Supervisor = GiangVien;
typedef Thesis = DeTaiThacSi;

class ActionDialog extends StatelessWidget {
  final Thesis thesis;
  const ActionDialog({super.key, required this.thesis});

  void arrangeCouncil() async {
    final page = council.Page(thesis: thesis);
    Get.back(closeOverlays: true);
    await Get.to(page, fullscreenDialog: true);
    final state = Get.find<State>();
    state.refresh();
  }

  void untrack() async {
    await thesis.untrack();
    final state = Get.find<State>();
    state.refresh();
    Get.back(closeOverlays: true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Hành động"),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.account_circle),
              onTap: arrangeCouncil,
              title: Text("Xếp hội đồng"),
            ),
            ListTile(
              leading: Icon(Icons.check_box),
              onTap: untrack,
              title: Text("Hoàn thành"),
            ),
          ],
        ),
      ),
    );
  }

  static void show(Thesis thesis) async {
    final context = Get.context!;
    showDialog(
      context: context,
      builder: (context) => ActionDialog(thesis: thesis),
    );
  }
}

class AddThesisToTrackingButton extends StatelessWidget {
  const AddThesisToTrackingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: selectThesisToTrack,
      icon: const Icon(Icons.add),
      label: const Text('Thêm đề tài để theo dõi'),
    );
  }

  Future<void> selectThesisToTrack() async {
    final page = PageSelectThings<Thesis>(
      title: "Chọn đề tài",
      includeNull: false,
      itemBuilder: <T>(BuildContext context, Thesis? item) {
        if (item == null) return SizedBox.shrink();

        final student = item.hocVien!;

        return ListTile(
          title: Text(item.tenTiengViet),
          subtitle: Text("${student.maHocVien} ${student.hoTen}"),
          onTap: () => Get.back<Thesis>(result: item),
        );
      },
      searchFunction: <T>(query) => Thesis.search(
        searchQuery: query,
        assigned: true,
        tracked: false,
      ),
    );

    final selectedThesis = await Get.to<Thesis?>(page);
    switch (selectedThesis) {
      case Thesis thesis:
        await thesis.track();
        final state = Get.find<State>();
        state.refresh();
    }
  }
}

class Page extends StatelessWidget {
  static const routeName = "/thesis/defense/register";
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final double spacing = 8.0;
    return ChangeNotifierProvider(
      create: (context) => Get.put(State()),
      builder: (context, child) {
        final screenSize = MediaQuery.of(context).size;
        final itemSize = screenSize.width / (GetPlatform.isMobile ? 1 : 3) -
            spacing * 2; // 8.0 padding on each side

        var buttons = [
          AddThesisToTrackingButton(),
          OutlinedButton.icon(
            onPressed: () => Get.toNamed(PageSelectThings.routeName),
            icon: const Icon(Icons.search),
            label: const Text('Lập phiếu thanh toán'),
          ),
        ];

        final buttonPlace = switch (GetPlatform.isMobile) {
          true => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              spacing: spacing,
              children: buttons,
            ),
          false => GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: 8,
              children: buttons,
            ),
        };

        var widgets = [
          buttonPlace,
          Expanded(child: TrackedThesesListView()),
        ];

        if (GetPlatform.isMobile) {
          widgets = widgets.reversed.toList();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Đăng ký bảo vệ'),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(spacing),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: spacing,
                children: widgets,
              ),
            ),
          ),
        );
      },
    );
  }
}

class State extends ChangeNotifier {
  final searchController = SearchController();

  List<Thesis> trackedTheses = [];

  @override
  dispose() {
    super.dispose();
    Get.delete<State>();
  }

  State() {
    refresh();
  }

  Future<void> refresh() async {
    final futureTheses = Thesis.search(
      assigned: true,
      tracked: true,
    );
    trackedTheses = await futureTheses;
    notifyListeners();
  }
}

class TrackedThesesListView extends StatelessWidget {
  const TrackedThesesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<State>(context);

    final aspectRatio = 4.0;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: GetPlatform.isMobile ? 1 : 4,
        childAspectRatio: aspectRatio,
      ),
      itemCount: state.trackedTheses.length,
      itemBuilder: (context, index) {
        final thesis = state.trackedTheses[index];
        final student = thesis.hocVien!;

        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () => ActionDialog.show(thesis),
            child: Center(
              child: ListTile(
                title: Text("${student.maHocVien} ${student.hoTen}"),
                subtitle: Text(
                  thesis.tenTiengViet,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
