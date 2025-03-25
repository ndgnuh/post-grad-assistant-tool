import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

import 'dart:typed_data';
import 'dart:io';

import '../custom_widgets.dart';
import '../business/han_che_hoc_phan.dart';

class _State extends ChangeNotifier {
  TextEditingController editKeyword = TextEditingController();
  TextEditingController editHocKy = TextEditingController(
    text: "2024.2B",
  );

  // Output files
  Uint8List? fileDanhMucHanChePdf;
  Uint8List? fileDanhMucHanCheXlsx;

  List<HocPhan> searchedHocPhan = [];
  Set<HocPhan> selectedHocPhan = {};

  rebuild() async {
    notifyListeners();
  }

  selectHocPhan(HocPhan hp) {
    selectedHocPhan.add(hp);
    rebuild();
    notifyListeners();
  }

  deselectHocPhan(HocPhan hp) {
    selectedHocPhan.remove(hp);
    rebuild();
    notifyListeners();
  }

  saveOutputFiles() async {
    // final output = FilePicker.platform.saveFile();
    final data = await createPdf(
      listHocPhan: selectedHocPhan.toList(),
      hocKy: editHocKy.text,
    );

    final outputPath = await FilePicker.platform.saveFile(
      dialogTitle: "Chọn thư mục lưu",
      fileName: "Danh mục hạn chế học phần ${editHocKy.text}.pdf",
    );
    if (outputPath != null) {
      final file = File(outputPath);
      await file.create();
      await file.writeAsBytes(data);
    }
  }

  refresh() async {
    final keyword = editKeyword.text;
    print(keyword);
    searchedHocPhan = await searchHocPhan(
      keyword: keyword,
    );
    notifyListeners();
  }

  _State() {
    refresh();
  }
}

class _EditPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context, listen: false);
    return EzFixed(
      direction: Axis.vertical,
      children: [
        EzTextInput(
          label: "Tìm học phần",
          controller: state.editKeyword,
          onSubmitted: (_) => state.refresh(),
          onChanged: (_) => state.refresh(),
        ),
        EzTextInput(
          label: "Học kỳ/đợt học",
          controller: state.editHocKy,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Clear"),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state.saveOutputFiles,
            child: Text("Lưu danh sách"),
          ),
        ),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  final String Function(_State state) titleBuilder;
  const _HeaderRow({
    required this.titleBuilder,
  });

  factory _HeaderRow.daTimKiem() {
    return _HeaderRow(
      titleBuilder: (state) => "Học phần đã tìm kiếm",
    );
  }

  factory _HeaderRow.daChon() {
    return _HeaderRow(titleBuilder: (_State state) {
      int soTc = 0;
      for (final hp in state.selectedHocPhan) {
        soTc = soTc + hp.soTinChi;
      }
      return "Học phần đã chọn (tổng: ${soTc} TC)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<_State, String>(
      selector: (context, state) => titleBuilder(state),
      builder: (context, title, child) => ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  final HocPhan hocPhan;
  final Function() onPressed;
  final IconData icon;

  const _DataRow({
    required this.hocPhan,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final label =
        "${hocPhan.maHocPhan} - ${hocPhan.tenTiengViet} (${hocPhan.soTinChi} TC)";
    return ListTile(
      subtitle: Text(hocPhan.tenTiengAnh),
      title: Text(label),
      onTap: onPressed,
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}

class _DanhSachHocPhan extends StatelessWidget {
  final String title;
  final List<HocPhan> Function(_State) getListHocPhan;
  final Function(_State, HocPhan) actionOnPressed;
  final IconData actionIcon;

  const _DanhSachHocPhan({
    required this.title,
    required this.actionIcon,
    required this.actionOnPressed,
    required this.getListHocPhan,
  });

  factory _DanhSachHocPhan.daTimKiem() {
    return _DanhSachHocPhan(
      title: "Học phần đã tìm kiếm",
      actionIcon: Icons.add,
      getListHocPhan: (_State state) => state.searchedHocPhan,
      actionOnPressed: (_State state, HocPhan hp) {
        state.selectHocPhan(hp);
      },
    );
  }

  factory _DanhSachHocPhan.daLuaChon() {
    return _DanhSachHocPhan(
      title: "Học phần đã chọn",
      actionIcon: Icons.remove,
      getListHocPhan: (_State state) => state.selectedHocPhan.toList(),
      actionOnPressed: (_State state, HocPhan hp) {
        state.deselectHocPhan(hp);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _State state = Provider.of<_State>(context, listen: false);
    return Selector<_State, List<HocPhan>>(
      selector: (context, state) => getListHocPhan(state),
      builder: (BuildContext context, data, Widget? child) {
        return ListView.builder(
          padding: EdgeInsetsDirectional.all(0),
          itemCount: data.length,
          itemBuilder: (context, i) {
            final hocPhan = data[i];
            return _DataRow(
              hocPhan: hocPhan,
              icon: actionIcon,
              onPressed: () => actionOnPressed(state, hocPhan),
            );
          },
        );
      },
    );
  }
}

class PageHanCheHocPhan extends StatelessWidget {
  const PageHanCheHocPhan({super.key});

  static const routeName = "/lop-tc/han-che-hp";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _State(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tạo danh mục hạn chế học phần"),
          leading: BackButton(),
        ),
        body: EzFlex(
          direction: Axis.horizontal,
          flex: [2, 1],
          children: [
            EzFlex(
              flex: [0, 1, 0, 1],
              direction: Axis.vertical,
              children: [
                _HeaderRow.daTimKiem(),
                _DanhSachHocPhan.daTimKiem(),
                _HeaderRow.daChon(),
                _DanhSachHocPhan.daLuaChon(),
              ],
            ),
            _EditPanel(),
          ],
        ),
      ),
    );
  }
}
