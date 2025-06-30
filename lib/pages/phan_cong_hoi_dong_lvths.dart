import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';

import '../business/bao_ve_lvths.dart' as domain;
import '../business/common.dart';
import '../business/domain_editors.dart';
import '../business/domain_objects.dart';
import '../custom_widgets.dart';

part 'phan_cong_hoi_dong_lvths.freezed.dart';

int _compareHocVienByFirstName(HocVien h1, HocVien h2) {
  final c1 = (h1.nienKhoa ?? "").compareTo(h2.nienKhoa ?? "");
  final n1 = firstName(h1.hoTen);
  final n2 = firstName(h2.hoTen);
  return n1.compareTo(n2);
}

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

typedef _GvController = EzSelectionController<GiangVien>;

class PagePhanCongHoiDongLuanVanThacSi extends StatelessWidget {
  static const routeName = "/hoi-dong-lvths/";
  const PagePhanCongHoiDongLuanVanThacSi({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final spacing = 50.0;

    final body = Column(
      spacing: spacing,
      children: [
        _SearchBar(),
        Row(
          spacing: spacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: _HocVienTable(),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: _EditPanel(),
            ),
          ],
        ),
        Flexible(
          child: Flex(
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              Expanded(child: _BangThanhToan()),
              Expanded(child: _EditPanel()),
            ],
          ),
        ),
      ],
    );

    final body2 = Padding(
      padding: EdgeInsetsDirectional.all(10),
      child: EzFlex(
        direction: Axis.vertical,
        flex: [5, 2],
        children: [
          Column(
            children: [
              _SearchBar(),
              _HocVienTable(),
              _BangThanhToan(),
            ],
          ),
          ListView(
            children: [
              Text("Chỉnh sửa", style: textTheme.titleLarge),
              Text("Phân hội đồng", style: textTheme.titleMedium),
              _EditPanel(),
              Text("Thanh toán", style: textTheme.titleMedium),
              CheckboxListTile(
                title: Text("Đã thanh toán"),
                value: true,
                onChanged: null,
              ),

              // Biểu mẫu
              EzHeader(text: "Hành động", level: 0),
              EzFilePicker(
                label: "Thư mục lưu",
                isDirectory: true,
              ),
              FilledButton.icon(
                onPressed: null,
                icon: Icon(Icons.download),
                label: Text("Lưu hồ sơ về máy"),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Hội đồng luận văn thạc sĩ"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => _State(),
        child: body,
      ),
    );
  }
}

class _BangThanhToan extends StatelessWidget {
  static const columnNames = <String>[
    "Giảng viên",
    "Chủ tịch",
    "Phản biện",
    "Thư ký",
    "Ủy viên",
    "Bồi dưỡng (đ)"
  ];

  @override
  Widget build(BuildContext context) {
    final state = _State.of(context, listen: true);
    final columns = [
      for (final column in columnNames)
        DataColumn(
          label: Text(column),
        )
    ];
    return DataTable(
      columns: columns,
      rows: [
        for (final row in state.bangThanhToan)
          DataRow(
            cells: [
              DataCell(Text(row.giangVien.hoTenChucDanh)),
              DataCell(Text(row.chuTich.toString())),
              DataCell(Text(row.phanBien.toString())),
              DataCell(Text(row.thuKy.toString())),
              DataCell(Text(row.uyVien.toString())),
              DataCell(Text(row.thanhTien.toStringAsFixed(3))),
            ],
          )
      ],
    );
  }
}

class _EditPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = _State.of(context);
    final textTheme = TextTheme.of(context);
    final deTai = state.editController.value;
    final children = [
      Text("Chỉnh sửa", style: textTheme.titleLarge),
      Text("Đề tài: ${deTai.tenTiengViet}"),
      SearchChoice(
        controller: state.editController.chuTich,
        label: "Chủ tịch",
      ),
      SearchChoice(
        controller: state.editController.phanBien1,
        label: "Phản biện 1",
      ),
      SearchChoice(
        controller: state.editController.phanBien2,
        label: "Phản biện 2",
      ),
      SearchChoice(
        controller: state.editController.thuKy,
        label: "Thư ký",
      ),
      SearchChoice(
        controller: state.editController.uyVien,
        label: "Ủy viên",
      ),
      FilledButton.icon(
        onPressed: state.update,
        icon: Icon(Icons.update),
        label: Text("Cập nhập"),
        statesController: state.editController.canUpdate,
      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: children.length,
      itemBuilder: (_, i) => children[i],
      separatorBuilder: (_, i) => Divider(
        thickness: 10,
        height: 20,
        color: Colors.transparent,
      ),
    );
  }

  Future<List<GiangVien?>> searchFunction(String query) async {
    if (query.isEmpty) return [null];
    return [null, ...(await GiangVien.search(query))];
  }
}

@freezed
abstract class _FilterState with _$FilterState {
  factory _FilterState({
    @Default(false) bool showGraduated,
    bool? showSelected,
  }) = __FilterState;
}

class _HocVienDataSource extends DataTableSource {
  _State state;
  _HocVienDataSource(this.state);

  List<DeTaiThacSi> get dataByOrder {
    final query = state.searchText.text;
    final showGrad = state.searchShowGraduated;

    return state.listDeTai.where((deTai) {
      var ok = true;
      final hv = state.mapHocVien[deTai] as HocVien;

      switch (showGrad) {
        case true:
          ok &= hv.trangThai == TrangThaiHocVien.totNghiep;
        case false:
          ok &= hv.trangThai != TrangThaiHocVien.totNghiep;
        case null:
          ;
      }

      var queryOk = false;
      queryOk |= hv.maHocVien?.contains(query) ?? false;
      queryOk |= hv.hoTen.contains(query);
      queryOk |= deTai.tenTiengViet.contains(query);
      queryOk |= deTai.tenTiengAnh.contains(query);

      return ok && queryOk;
    }).toList();
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => dataByOrder.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow? getRow(int i) {
    final deTai = dataByOrder[i];
    HocVien? hv = state.mapHocVien[deTai];
    GiangVien? giangVien = state.mapGiangVien[deTai];
    GiangVien? chuTich = state.mapChuTich[deTai];
    GiangVien? phanBien1 = state.mapPhanBien1[deTai];
    GiangVien? phanBien2 = state.mapPhanBien2[deTai];
    GiangVien? uyVien = state.mapUyVien[deTai];
    GiangVien? thuKy = state.mapThuKy[deTai];
    final hocVienString = switch (hv) {
      null => "-",
      HocVien h => "${h.maHocVien} - ${h.hoTen}",
    };
    return DataRow(
      onSelectChanged: (_) => state.toggleSelection(deTai),
      selected: state.selected.contains(deTai.id),
      cells: [
        DataCell(Text(hocVienString)),
        DataCell(Text(giangVien?.hoTenChucDanh ?? "-")),
        //DataCell(Text(deTai.tenTiengViet)),
        DataCell(Text(chuTich?.hoTenChucDanh ?? "-")),
        DataCell(Text(phanBien1?.hoTenChucDanh ?? "-")),
        DataCell(Text(phanBien2?.hoTenChucDanh ?? "-")),
        DataCell(Text(thuKy?.hoTenChucDanh ?? "-")),
        DataCell(Text(uyVien?.hoTenChucDanh ?? "-")),
        DataCell(EzLink(
          text: "Sửa",
          onPressed: () => state.edit(deTai),
        )),
        DataCell(EzLink(
          text: "Thêm",
          onPressed: () {},
        )),
      ],
    );
  }
}

class _HocVienTable extends StatelessWidget {
  static const columns = [
    ("Học viên", IntrinsicColumnWidth()),
    ("GVHD", IntrinsicColumnWidth()),
    // ("Đề tài", IntrinsicColumnWidth()),
    ("Chủ tịch", IntrinsicColumnWidth()),
    ("Phản biện 1", IntrinsicColumnWidth()),
    ("Phản biện 2", IntrinsicColumnWidth()),
    ("Thư ký", IntrinsicColumnWidth()),
    ("Ủy viên", IntrinsicColumnWidth()),
    ("", IntrinsicColumnWidth()),
    ("", IntrinsicColumnWidth()),
  ];

  @override
  Widget build(BuildContext context) {
    final state = _State.of(context);
    final table = PaginatedDataTable(
      columnSpacing: 0,
      rowsPerPage: 10,
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
    return table;
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
    return EzFixed(
      direction: Axis.horizontal,
      spacing: 10,
      children: [
        Flexible(
          child: SearchBar(
            enabled: true,
            leading: Icon(Icons.search),
            hintText: "Họ tên, mã học viên hoặc tên đề tài",
            controller: state.searchText,
            onSubmitted: (_) => state.refresh(),
          ),
        ),
        Text("Hiện học viên đã tốt nghiệp"),
        Checkbox(
          tristate: true,
          value: state.searchShowGraduated,
          onChanged: (value) => state.searchShowGraduated = value,
        ),
        Text("Hiện học viên đã chọn"),
        Checkbox(
          tristate: true,
          value: state.searchShowSelected,
          onChanged: (value) => state.searchShowSelected = value,
        ),
      ],
    );
    return EzTextInput(
      label: "Tìm kiếm",
      controller: state.searchText,
      onSubmitted: (_) => state.refresh(),
      icon: Icons.search,
    );
  }
}

class _State extends ChangeNotifier {
  /// Các loại chỉ mục
  List<HocVien> searchedHocVien = [];
  Set<HocVien> selectedHocVien = {};
  List<GiangVien> listGiangVien = [];

  /// Chỉ mục (DB mới)
  final List<DeTaiThacSi> listDeTai = [];
  final Map<DeTaiThacSi, HocVien?> mapHocVien = {};
  final Map<DeTaiThacSi, GiangVien> mapGiangVien = {};
  final Map<DeTaiThacSi, GiangVien?> mapChuTich = {};
  final Map<DeTaiThacSi, GiangVien?> mapThuKy = {};
  final Map<DeTaiThacSi, GiangVien?> mapPhanBien1 = {};
  final Map<DeTaiThacSi, GiangVien?> mapPhanBien2 = {};
  final Map<DeTaiThacSi, GiangVien?> mapUyVien = {};

  /// Chọn đề tài
  final Set<int?> selected = {};
  final List<domain.RowBangThanhToan> bangThanhToan = [];

  /// Trạng thái search
  final searchText = TextEditingController();

  bool? _searchShowGraduated = false;

  bool? searchShowSelected = null;

  /// Trạng thái edit
  final editController = DeTaiThsEditingController();

  /// Constructors
  _State() {
    refresh();
  }

  factory _State.of(BuildContext context, {bool listen = true}) {
    return Provider.of<_State>(context, listen: listen);
  }
  bool? get searchShowGraduated => _searchShowGraduated;

  set searchShowGraduated(bool? value) {
    _searchShowGraduated = value;
    notifyListeners();
  }

  VoidCallback? get update => editController.id == null ? null : _update;

  /// Chọn học viên
  deselectAll() {
    selectedHocVien = {};
    notifyListeners();
  }

  /// Hành động edit
  edit(DeTaiThacSi deTai) {
    editController.value = deTai;
    notifyListeners();
  }

  /// Re-fetch all data
  Future<void> refresh() async {
    listDeTai.clear();
    mapHocVien.clear();
    mapGiangVien.clear();
    mapChuTich.clear();
    mapThuKy.clear();
    mapPhanBien1.clear();
    mapPhanBien2.clear();
    mapUyVien.clear();

    listDeTai.addAll(await DeTaiThacSi.search(
      searchQuery: searchText.text,
      assigned: true,
    ));

    for (final deTai in listDeTai) {
      mapHocVien[deTai] = await deTai.hocVien;
      mapGiangVien[deTai] = await deTai.giangVien;
      mapHocVien[deTai] = await deTai.hocVien;
      mapGiangVien[deTai] = await deTai.giangVien;
      mapChuTich[deTai] = await deTai.chuTich;
      mapThuKy[deTai] = await deTai.thuKy;
      mapPhanBien1[deTai] = await deTai.phanBien1;
      mapPhanBien2[deTai] = await deTai.phanBien2;
      mapUyVien[deTai] = await deTai.uyVien;
    }

    searchedHocVien = await domain.listHocVien(
      searchQuery: searchText.text,
    );

    List<GiangVien> listGiangVien = await GiangVien.all();
    editController.listGiangVien = listGiangVien;
    editController.listHocVien = await HocVien.all();
    notifyListeners();
  }

  refresh2() {
    notifyListeners();
  }

  toggleSelection(DeTaiThacSi deTai) async {
    if (selected.contains(deTai.id)) {
      selected.remove(deTai.id);
    } else {
      selected.add(deTai.id);
    }
    await updateBangThanhToan();
    notifyListeners();
  }

  unedit(DeTaiThacSi deTai) {
    editController.value = null;
    notifyListeners();
  }

  updateBangThanhToan() async {
    final listSelectedDeTai = [
      for (final id in selected.whereType<int>())
        await DeTaiThacSi.getById(
          id,
        )
    ];
    final rows = await domain.bangThanhToan(listSelectedDeTai);
    bangThanhToan.clear();
    bangThanhToan.addAll(rows);
  }

  _update() async {
    final value = editController.value;
    await value.update();
    await updateBangThanhToan();
    refresh();
  }
}
