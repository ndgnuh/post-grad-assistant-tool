import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../business/domain_objects.dart';
import '../business/domain_editors.dart';
import '../services/database.dart';
import '../custom_widgets.dart';
import '../services/sqlbuilder/sqlbuilder.dart';

class HocPhanSearcher extends StatelessWidget {
  const HocPhanSearcher({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);
    return EzDropdown.fullWidth(
      controller: state.searchController,
      searchFunction: HocPhan.search,
    );
  }
}

class _State extends ChangeNotifier {
  final searchController = EzSelectionController<HocPhan>();
  final controller = SearchChoiceController<HocPhan?>(
    nullable: true,
    searchFunction: HocPhan.search,
    labelFormatter: (HocPhan? obj) => obj.toString(),
  );
}

final _state = _State();

class DraftPage extends StatelessWidget {
  static const routeName = "/draft";
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nháp")),
      body: ChangeNotifierProvider(
        create: (context) => _state,
        child: Column(
          spacing: 20,
          children: [
            HocPhanSearcher(),
            SearchAnchor(
              builder: (context, controller) {
                return TextField(
                  onTap: () {
                    final text = controller.text;
                    controller.openView();
                    controller.clear();
                  },
                  controller: controller,
                );
              },
              suggestionsBuilder: (context, controller) async {
                final text = controller.text;
                final listHocPhan = await HocPhan.search(text);
                return [
                  for (final hocPhan in listHocPhan)
                    ListTile(
                      onTap: () {
                        controller.closeView(hocPhan.tenTiengViet);
                      },
                      leading: Icon(null),
                      title: Text(hocPhan.tenTiengViet),
                      subtitle: Text(
                          "${hocPhan.soTinChi} tín chỉ - khối lượng ${hocPhan.khoiLuong}"),
                    )
                ];
              },
            ),
            TextField(),
            SearchAnchor.bar(
              barLeading: null,
              viewElevation: 0,
              viewShape: RoundedRectangleBorder(),
              suggestionsBuilder: (context, controller) async {
                final text = controller.text;
                final listHocPhan = await HocPhan.search(text);
                return [
                  ListTile(
                    onTap: () {
                      controller.closeView("");
                    },
                    leading: Icon(Icons.close),
                    title: Text("Không"),
                    subtitle: Text("Bỏ chọn"),
                  ),
                  for (final hocPhan in listHocPhan)
                    ListTile(
                      onTap: () {
                        controller.closeView(hocPhan.tenTiengViet);
                      },
                      leading: Icon(null),
                      title: Text(hocPhan.tenTiengViet),
                      subtitle: Text(
                          "${hocPhan.soTinChi} tín chỉ - khối lượng ${hocPhan.khoiLuong}"),
                    )
                ];
              },
            ),
            SearchChoice(
              controller: _state.controller,
              label: "Học phần",
            ),
          ],
        ),
      ),
    );
  }
}
