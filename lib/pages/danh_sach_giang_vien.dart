import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../business/domain_objects.dart';
import '../custom_widgets.dart';

class _PageState extends ChangeNotifier {
  // Search state
  final searchKeywordController = TextEditingController();
  Timer? searchDebounce;
  List<GiangVien> listGiangVien = [];

  // Edit state
  GiangVien? editGiangVien;
  final editHoTen = TextEditingController();
  final editEmail = TextEditingController();
  final editSdt = TextEditingController();
  final editChuyenNganh = TextEditingController();
  final editGioiTinh = EzSelectionController(
    values: prependNull(GioiTinh.values),
  );
  final editHocHam = EzSelectionController(
    values: prependNull(HocHam.values),
  );
  final editHocVi = EzSelectionController(
    values: prependNull(HocVi.values),
  );
  final editDonVi = TextEditingController();
  final editStk = TextEditingController();
  final editNganHang = TextEditingController();
  final editMst = TextEditingController();

  GiangVien _giangVienFromData() {
    return GiangVien(
      id: editGiangVien?.id ?? -1,
      hoTen: editHoTen.text,
      email: editEmail.nonEmptyValue,
      sdt: editSdt.nonEmptyValue,
      gioiTinh: editGioiTinh.value,
      chuyenNganh: editChuyenNganh.nonEmptyValue,
      donVi: editDonVi.nonEmptyValue,
      hocHam: editHocHam.value,
      hocVi: editHocVi.value,
      stk: editStk.nonEmptyValue,
      nganHang: editNganHang.nonEmptyValue,
      mst: editMst.nonEmptyValue,
    );
  }

  edit(GiangVien gv) {
    editGiangVien = gv;
    editHoTen.text = gv.hoTen;
    editEmail.text = gv.email ?? "";
    editChuyenNganh.text = gv.chuyenNganh ?? "";
    editSdt.text = gv.sdt ?? "";
    editGioiTinh.value = gv.gioiTinh;
    editHocHam.value = gv.hocHam;
    editHocVi.value = gv.hocVi;
    editDonVi.text = gv.donVi ?? "";
    editStk.text = gv.stk ?? "";
    editNganHang.text = gv.nganHang ?? "";
    editMst.text = gv.mst ?? "";
    notifyListeners();
  }

  unedit() {
    editGiangVien = null;
    editHoTen.text = "";
    editEmail.text = "";
    editSdt.text = "";
    editGioiTinh.value = GioiTinh.nam;
    editHocHam.value = null;
    editHocVi.value = null;
    editChuyenNganh.text = "";
    editDonVi.text = "";
    editStk.text = "";
    editNganHang.text = "";
    editMst.text = "";
    notifyListeners();
  }

  create() async {
    final gv = _giangVienFromData();
    await gv.create();
    await refresh();
  }

  update() async {
    final gv = _giangVienFromData();
    await gv.update();
    await refresh();
  }

  @override
  dispose() {
    searchKeywordController.dispose();
    searchDebounce?.cancel();
    super.dispose();
  }

  refresh() async {
    final keyword = searchKeywordController.text;
    if (keyword.isEmpty) {
      listGiangVien = await GiangVien.all();
    } else {
      listGiangVien = await GiangVien.search(keyword);
    }
    notifyListeners();
  }

  _PageState() {
    refresh();
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_PageState>(context, listen: false);
    return EzTextInput(
      placeholder: "Họ tên, email, SĐT, STK, Mã số thuế",
      controller: state.searchKeywordController,
      icon: Icons.search,
      onChanged: (_) {
        Timer? timer = state.searchDebounce;
        if (timer?.isActive ?? false) {
          timer?.cancel();
        }
        state.searchDebounce = Timer(
          const Duration(milliseconds: 300),
          () => state.refresh(),
        );
      },
    );
  }
}

class _GiangVienDataSource extends DataTableSource {
  final _PageState state;
  _GiangVienDataSource(this.state);

  @override
  DataRow getRow(int i) {
    final gv = state.listGiangVien[i];
    return DataRow(cells: [
      DataCell(EzCopy(gv.id.toString())),
      DataCell(EzCopy(gv.hoTenChucDanh)),
      DataCell(EzCopy(gv.email ?? "-")),
      DataCell(EzCopy(gv.sdt ?? "-")),
      DataCell(EzCopy(gv.donVi ?? "-")),
      DataCell(EzCopy(gv.stk ?? "")),
      DataCell(EzCopy(gv.nganHang ?? "")),
      DataCell(EzCopy(gv.mst ?? "")),
      DataCell(TextButton.icon(
        label: Text("Sửa"),
        icon: Icon(Icons.edit),
        onPressed: () => state.edit(gv),
      )),
    ]);
  }

  @override
  int get selectedRowCount => 0;

  @override
  int get rowCount => state.listGiangVien.length;

  @override
  bool get isRowCountApproximate => false;
}

class _TableGiangVien extends StatelessWidget {
  static const columns = [
    ("ID", IntrinsicColumnWidth()),
    ("Họ và tên", IntrinsicColumnWidth()),
    ("Email", IntrinsicColumnWidth()),
    ("SĐT", IntrinsicColumnWidth()),
    ("Cơ quan", IntrinsicColumnWidth()),
    ("STK", IntrinsicColumnWidth()),
    ("Bank", IntrinsicColumnWidth()),
    ("MST", IntrinsicColumnWidth()),
    ("", IntrinsicColumnWidth())
  ];

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_PageState>(context);
    final source = _GiangVienDataSource(state);
    return PaginatedDataTable(
      columnSpacing: 0,
      columns: [
        for (final (column, columnWidth) in columns)
          DataColumn(
            label: Text(column),
            columnWidth: columnWidth,
          ),
      ],
      rowsPerPage: 20,
      source: source,
    );
  }
}

class _EditPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_PageState>(context, listen: true);
    final editGv = state.editGiangVien;

    return EzFixed(
      direction: Axis.vertical,
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        EzHeader(text: "Chi tiết", level: 0),
        if (editGv != null)
          IntrinsicHeight(
            child: EzFlex(
              direction: Axis.horizontal,
              children: [
                Text("ID chỉnh sửa: ${editGv.id}"),
                Spacer(),
                OutlinedButton(
                  onPressed: () => state.unedit(),
                  child: Text("Xóa"),
                ),
              ],
            ),
          ),
        EzHeader(text: "Thông tin cá nhân", level: 3),
        EzTextInput(
          icon: Icons.person,
          label: "Họ và tên",
          controller: state.editHoTen,
        ),
        EzTextInput(
          icon: Icons.email,
          label: "Email",
          controller: state.editEmail,
        ),
        EzTextInput(
          icon: Icons.phone,
          label: "SĐT",
          controller: state.editSdt,
        ),
        EzTextInput(
          icon: Icons.work,
          label: "Đơn vị công tác",
          controller: state.editDonVi,
        ),
        EzTextInput(
          icon: Icons.work,
          label: "Chuyên môn",
          controller: state.editChuyenNganh,
        ),
        EzFlex(
          direction: Axis.horizontal,
          children: [
            EzDropdown.fullWidth(
              label: "Giới tính",
              controller: state.editGioiTinh,
            ),
            EzDropdown.fullWidth(
              label: "Học hàm",
              controller: state.editHocHam,
            ),
            EzDropdown.fullWidth(
              label: "Học vị",
              controller: state.editHocVi,
            ),
          ],
        ),
        EzHeader(text: "Thông tin thanh toán", level: 3),
        EzTextInput(
          label: "STK",
          controller: state.editStk,
        ),
        EzTextInput(
          label: "Ngân hàng",
          controller: state.editNganHang,
        ),
        EzTextInput(
          label: "Mã số thuế",
          controller: state.editMst,
        ),
        if (editGv == null)
          FilledButton.icon(
            onPressed: () => state.create(),
            icon: Icon(Icons.update),
            label: Text("Thêm"),
          )
        else
          FilledButton.icon(
            icon: Icon(Icons.update),
            onPressed: () => state.update(),
            label: Text("Cập nhật"),
          ),
      ],
    );
  }
}

class PageQuanLyGiangVien extends StatelessWidget {
  static const routeName = "/list-giang-vien";

  const PageQuanLyGiangVien({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _PageState(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Danh sách giảng viên"),
        ),
        body: EzFlex(
          flex: [2, 1],
          direction: Axis.horizontal,
          children: [
            EzFlex(
              flex: [0, 1],
              mainAxisAlignment: MainAxisAlignment.start,
              direction: Axis.vertical,
              margin: EdgeInsets.all(10),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 0,
                  ),
                  child: _SearchBar(),
                ),
                SingleChildScrollView(
                  child: EzFlex(
                    direction: Axis.horizontal,
                    children: [
                      (_TableGiangVien()),
                    ],
                  ),
                )
              ],
            ),
            _EditPanel(),
          ],
        ),
      ),
    );
  }
}
