import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets.dart';
import '../business/domain_objects.dart';
import '../business/common.dart';
import '../business/bao_ve_lvths.dart' as domain;

typedef _GvController = EzSelectionController<GiangVien>;

_GvController _initGvController() {
  String labelFormatter(GiangVien? gv) {
    if (gv == null) {
      return "";
    }
    return "${gv.hoTenChucDanh} (${gv.email})\n${gv.donVi}";
  }

  return _GvController(
    labelFormatter: labelFormatter,
  );
}

class _State extends ChangeNotifier {
  /// Các loại chỉ mục
  List<HocVien> searchedHocVien = [];
  Set<HocVien> selectedHocVien = {};
  List<GiangVien> listGiangVien = [];

  /// Trạng thái search
  TextEditingController searchText = TextEditingController();

  /// Trạng thái edit
  _GvController editChuTich = _initGvController();
  _GvController editThuKy = _initGvController();
  _GvController editUyVien = _initGvController();
  _GvController editPhanBien1 = _initGvController();
  _GvController editPhanBien2 = _initGvController();

  /// Re-fetch all data
  Future<void> refresh() async {
    print(searchText.text);
    searchedHocVien = await domain.listHocVien(
      searchQuery: searchText.text,
    );

    List<GiangVien> listGiangVien = await GiangVien.all();
    editChuTich.values = listGiangVien;
    editThuKy.values = listGiangVien;
    editUyVien.values = listGiangVien;
    editPhanBien1.values = listGiangVien;
    editPhanBien2.values = listGiangVien;

    notifyListeners();
  }

  /// Chọn học viên
  deselectAll() {
    selectedHocVien = {};
    notifyListeners();
  }

  selectHocVien(HocVien hv, bool? sel) {
    if (sel == true) {
      selectedHocVien.add(hv);
    } else {
      selectedHocVien.remove(hv);
    }

    notifyListeners();
  }

  /// Constructors
  _State() {
    refresh();
  }

  factory _State.of(BuildContext context, {bool listen = true}) {
    return Provider.of<_State>(context, listen: listen);
  }
}

int _compareHocVienByFirstName(HocVien h1, HocVien h2) {
  final c1 = (h1.nienKhoa ?? "").compareTo(h2.nienKhoa ?? "");
  final n1 = firstName(h1.hoTen);
  final n2 = firstName(h2.hoTen);
  return n1.compareTo(n2);
}

class _HocVienDataSource extends DataTableSource {
  _State state;
  _HocVienDataSource(this.state);

  List<HocVien> get dataByOrder {
    final lst1 = [for (final hv in state.selectedHocVien) hv]
      ..sort(_compareHocVienByFirstName);
    final lst2 = [
      for (final hv in state.searchedHocVien)
        if (!state.selectedHocVien.contains(hv)) hv
    ]..sort(_compareHocVienByFirstName);
    return lst1 + lst2;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => state.selectedHocVien.length;

  @override
  int get rowCount => state.searchedHocVien.length;

  @override
  DataRow? getRow(int i) {
    final data = dataByOrder;
    HocVien hv = data[i];
    return DataRow(
      onSelectChanged: (bool? sel) => state.selectHocVien(hv, sel),
      selected: state.selectedHocVien.contains(hv),
      cells: [
        DataCell(Text(hv.maHocVien ?? "-")),
        DataCell(Text(hv.hoTen)),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
      ],
    );
  }
}

class _HocVienTable extends StatelessWidget {
  static const columns = [
    ("MSHV", IntrinsicColumnWidth()),
    ("Họ và tên", FlexColumnWidth()),
    ("GVHD", FlexColumnWidth()),
    ("Chủ tịch", FlexColumnWidth()),
    ("Phản biện 1", FlexColumnWidth()),
    ("Phản biện 2", FlexColumnWidth()),
    ("Thư ký", FlexColumnWidth()),
    ("Ủy viên", FlexColumnWidth()),
  ];

  @override
  Widget build(BuildContext context) {
    final state = _State.of(context);
    final table = PaginatedDataTable(
      rowsPerPage: 20,
      onSelectAll: (_) => state.deselectAll(),
      columns: [
        for (final (col, width) in columns)
          DataColumn(
            label: Text(col),
            columnWidth: width,
          )
      ],
      source: _HocVienDataSource(state),
      showFirstLastButtons: true,
    );

    return SingleChildScrollView(
      child: LayoutBuilder(builder: (context, constraint) {
        return SizedBox(
          width: constraint.maxWidth,
          child: table,
        );
      }),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = _State.of(context, listen: true);
    return SearchBar(
      enabled: true,
      leading: Icon(Icons.search),
      hintText: "Họ tên hoặc mã học viên",
      controller: state.searchText,
      onSubmitted: (_) => state.refresh(),
    );
    return EzTextInput(
      label: "Tìm kiếm",
      controller: state.searchText,
      onSubmitted: (_) => state.refresh(),
      icon: Icons.search,
    );
  }
}

class _EditPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = _State.of(context);
    return ListView(
      itemExtent: 55,
      children: [
        EzDropdown.fullWidth(
          controller: state.editChuTich,
          label: "Chủ tịch",
        ),
        EzDropdown.fullWidth(
          controller: state.editPhanBien1,
          label: "Phản biện 1",
        ),
        EzDropdown.fullWidth(
          controller: state.editPhanBien2,
          label: "Phản biện 2",
        ),
        EzDropdown.fullWidth(
          controller: state.editUyVien,
          label: "Ủy viên",
        ),
        EzDropdown.fullWidth(
          controller: state.editThuKy,
          label: "Thư ký",
        ),
        FilledButton.icon(
          onPressed: () {} /* TODO */,
          icon: Icon(Icons.add),
          label: Text("Thêm vào danh sách bảo vệ"),
        ),
      ],
    );
  }
}

class _ThanhToanTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("TODO");
  }
}

class PagePhanCongHoiDongLuanVanThacSi extends StatelessWidget {
  const PagePhanCongHoiDongLuanVanThacSi({super.key});
  static const routeName = "/hoi-dong-lvths/";

  @override
  Widget build(BuildContext context) {
    final body = Padding(
      padding: EdgeInsetsDirectional.all(10),
      child: EzFlex(
        direction: Axis.horizontal,
        flex: [5, 2],
        children: [
          EzFlex(
            flex: [0, 1, 1],
            direction: Axis.vertical,
            children: [
              _SearchBar(),
              _HocVienTable(),
              _ThanhToanTable(),
            ],
          ),
          EzFlex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            flex: [0, 1, 0, 1],
            children: [
              EzHeader(text: "Học viên", level: 0),
              _EditPanel(),

              // Biểu mẫu
              EzHeader(text: "Hành động", level: 0),
              ListView(
                itemExtent: 55,
                children: [
                  EzFilePicker(
                    label: "Thư mục lưu",
                    isDirectory: true,
                  ),
                  FilledButton.icon(
                    onPressed: () {} /* TODO */,
                    icon: Icon(Icons.download),
                    label: Text("Lưu hồ sơ về máy"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Hội đồng luận văn thạc sĩ"),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => _State(),
        child: body,
      ),
    );
  }
}
