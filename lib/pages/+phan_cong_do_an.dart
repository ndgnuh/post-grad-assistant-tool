import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../datamodels.dart';
import '../custom_widgets.dart';
import 'dart:core';

const fields = (
  idHV: 'idHocVien',
  maHV: 'maHocVien',
  tenHV: 'tenHocVien',
  idGV: 'idGiangVien',
  tenGV: 'tenGiangVien',
  deTaiVi: 'tenTiengViet',
  deTaiEn: 'tenTiengAnh',
  hanBV: 'hanBaoVe',
  ngayGiao: 'ngayGiao',
  qdGiao: 'qdGiao',
  tenTrangThai: 'tenTrangThai',
  idTrangThai: 'idTrangThai',
  giaHan: 'giaHan',
  selected: 'selected',
);

class PageState extends ChangeNotifier {
  // all data
  List<NienKhoa?> allNienKhoa = [];
  List<HocVien> allHocVien = [];
  Map<int, GiangVien?> allGvhd = {};

  // UI state
  Map<int, bool?> selected = {};
  bool canSave = false;
  EzController<bool> showDeTai = EzController(value: false);
  final ScrollController scroller = ScrollController();

  // Search states
  EzSelectionController<NienKhoa?> nienKhoaCtl = EzSelectionController(
    values: [null],
    labelFormatter: (NienKhoa? nk) => nk?.nienKhoa ?? "Tất cả",
  );
  TextEditingController searchText = TextEditingController();
  EzController<bool> daPhanCong = EzController(
    labelFormatter: (bool? state) {
      return switch (state) {
        true => "Chỉ những HV đã phân công đồ án",
        false => "Chỉ những HV chưa phân công đồ án",
        null => "Tất cả",
      };
    },
  );

  // Form states
  HocVien? editingHocVien;
  EzSelectionController<GiangVien?> giangVienHuongDan = EzSelectionController(
    values: [null],
    labelFormatter: (GiangVien? gv) => switch (gv) {
      null => "Chưa phân công",
      GiangVien gv => "${gv.hoTenChucDanh} (${gv.email ?? 'không rõ email'})",
    },
  );
  TextEditingController maHocVien = TextEditingController();
  TextEditingController tenHocVien = TextEditingController();
  TextEditingController deTaiVi = TextEditingController();
  TextEditingController deTaiEn = TextEditingController();
  TextEditingController soQuyetDinhGiao = TextEditingController();
  TextEditingController soQuyetDinhBaoVe = TextEditingController();
  EzController<DateTime?> ngayGiaoDeTai = EzController.forDateTime();
  EzController<DateTime?> hanBaoVe = EzController.forDateTime();
  EzController<DateTime?> ngayKyQuyetDinhBaoVe = EzController.forDateTime();
  EzController<DateTime?> ngayBaoVe = EzController.forDateTime();

  // Constructors
  PageState() {
    Repository.searchGiangVien(trongTruong: true).then((data) {
      giangVienHuongDan.values = data;
      notifyListeners();
    });
    Repository.allNienKhoa().then((data) {
      nienKhoaCtl.values = [null, ...data];
      nienKhoaCtl.value = nienKhoaCtl.values.last;
      refresh().then((data) {});
    });
  }

  factory PageState.of(BuildContext context, {bool listen = false}) {
    return Provider.of<PageState>(context, listen: listen);
  }

  // Actions
  Future<void> refresh({bool fetchData = true}) async {
    if (fetchData) {
      allHocVien = await Repository.searchHocVien(
        hoTen: searchText.text,
        dangHoc: true,
        coGvhd: daPhanCong.value,
        nienKhoa: nienKhoaCtl.value?.nienKhoa,
      );
      allGvhd = {};
      for (final hv in allHocVien) {
        allGvhd[hv.id] = await hv.giangVienHuongDan;
      }
      selected = {};
    }
    notifyListeners();
  }

  void setSelection(int i, bool? sel) {
    selected[i] = sel;
    notifyListeners();
  }

  // Form actions
  void edit(HocVien hv) async {
    editingHocVien = hv;
    maHocVien.text = hv.maHocVien ?? "";
    tenHocVien.text = hv.hoTen;
    deTaiVi.text = hv.deTaiLuanVanTiengViet ?? "";
    deTaiEn.text = hv.deTaiLuanVanTiengAnh ?? "";
    giangVienHuongDan.value = await hv.giangVienHuongDan;
    ngayGiaoDeTai.value = hv.ngayGiaoDeTai;
    hanBaoVe.value = hv.hanBaoVe;
    ngayKyQuyetDinhBaoVe.value = hv.ngayKyQuyetDinhBaoVe;
    ngayBaoVe.value = hv.ngayBaoVe;
    canSave = true;
    notifyListeners();
  }

  void updateHocVien() async {}

  void resetEditForm() {
    canSave = false;
    notifyListeners();
  }
}

class _PanelEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = PageState.of(
      context,
    );
    final fields = [
      EzTextInput(
        label: "Mã học viên",
        readOnly: true,
        controller: state.maHocVien,
      ),
      EzTextInput(
        label: "Tên học viên",
        readOnly: true,
        controller: state.tenHocVien,
      ),
      LayoutBuilder(
        builder: (context, box) {
          return EzDropdown<GiangVien?>(
            width: box.maxWidth,
            label: "Giảng viên hướng dẫn",
            controller: state.giangVienHuongDan,
            initialSelection: null,
            labelFormat: (GiangVien? gv) {
              return gv?.hoTenChucDanh ?? "";
            },
          );
        },
      ),

      EzDatePicker(
        label: "Hạn bảo vệ",
      ),

      // Tên đề tài
      EzTextInput(
        label: "Tên đề tài (tiếng Việt)",
        multiline: true,
        controller: state.deTaiVi,
      ),
      EzTextInput(
        label: "Tên đề tài (tiếng Anh)",
        multiline: true,
        controller: state.deTaiEn,
      ),

      // Ngày tháng
      EzTextInput(
        label: "Số quyết định giao đề tài",
        controller: state.soQuyetDinhGiao,
      ),
      EzDatePicker(
        label: "Ngày giao đề tài",
        controller: state.ngayGiaoDeTai,
      ),
      EzDatePicker(
        label: "Hạn bảo vệ",
        controller: state.hanBaoVe,
      ),
      EzTextInput(
        label: "Số quyết định bảo vệ",
        controller: state.soQuyetDinhBaoVe,
      ),
      EzDatePicker(
        label: "Ngày ký quyết định bảo vệ",
        controller: state.ngayKyQuyetDinhBaoVe,
      ),
      EzDatePicker(
        label: "Ngày bảo vệ",
        controller: state.ngayBaoVe,
      ),

      Selector<PageState, bool>(
        selector: (_, model) => model.canSave,
        builder: (context, canSave, _) => ElevatedButton.icon(
          onPressed: canSave ? () => state.updateHocVien() : null,
          icon: Icon(Icons.save_sharp),
          label: Text("Lưu"),
        ),
      ),
      ElevatedButton.icon(
        onPressed: () => state.resetEditForm(),
        icon: Icon(Icons.restore),
        label: Text("Reset"),
      )
    ];
    final tiles = [for (final field in fields) ListTile(title: field)];
    return ListView(
      children: tiles,
    );
  }
}

class _PanelTimKiem extends StatelessWidget {
  const _PanelTimKiem();
  @override
  Widget build(context) {
    final state = PageState.of(context);
    return Column(
      spacing: 20,
      children: [
        EzTextInput(
          label: "Tìm kiếm",
          controller: state.searchText,
          onChanged: (_) => state.refresh(),
        ),
        LayoutBuilder(builder: (context, constraint) {
          return Selector<PageState, List<NienKhoa?>>(
            builder: (context, values, _) {
              return EzDropdown<NienKhoa?>(
                controller: state.nienKhoaCtl,
                width: constraint.maxWidth,
                initialSelection: null,
                label: "Niên khóa",
                onSelected: (_) => state.refresh(),
              );
            },
            selector: (context, model) => model.allNienKhoa,
          );
        }),
        EzCheckBox(
          label: "Đã phân công",
          triState: true,
          controller: state.daPhanCong,
          onChanged: (_) => state.refresh(),
        ),
        EzCheckBox(
          label: "Hiển thị đề tài",
          triState: false,
          controller: state.showDeTai,
          onChanged: (_) => state.refresh(fetchData: false),
        ),
      ],
    );
  }
}

class _PanelListHocVien extends StatelessWidget {
  const _PanelListHocVien();

  @override
  Widget build(BuildContext context) {
    final state = PageState.of(context, listen: true);
    final showDeTai = state.showDeTai.value ?? false;

    final columns = [
      "Mã HV",
      "Họ và tên",
      "Giảng viên hướng dẫn",
      "Hạn bảo vệ",
      if (showDeTai) "Đề tài",
      "",
    ];

    final columnsWidgets = [
      for (final label in columns) DataColumn(label: Text(label))
    ];
    final table = Selector<PageState, List<HocVien>>(
      builder: (context, allHocVien, child) {
        final rows = [
          for (final (int i, HocVien hv) in allHocVien.indexed)
            DataRow(
              selected: state.selected[i] ?? false,
              onSelectChanged: (bool? sel) {
                state.setSelection(i, sel);
              },
              cells: [
                DataCell(Text(hv.maHocVien ?? "")),
                DataCell(Text(hv.hoTen)),
                DataCell(Text(state.allGvhd[hv.id]?.hoTenChucDanh ?? "")),
                DataCell(Text(hv.hanBaoVe?.toDmy() ?? "N/A")),
                if (showDeTai) DataCell(Text(hv.deTaiLuanVanTiengViet ?? "")),
                DataCell(
                  Text("Sửa"),
                  onTap: () => state.edit(hv),
                ),
              ],
            ),
        ];

        return Expanded(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                onSelectAll: (bool? sel) {
                  for (final (int i, _) in allHocVien.indexed) {
                    state.selected[i] = sel;
                    if (i == allHocVien.length - 1) {
                      state.setSelection(i, sel);
                    }
                  }
                },
                columns: columnsWidgets,
                rows: rows,
              ),
            ),
          ),
        );
      },
      selector: (context, model) => (model.allHocVien),
    );
    return table;
  }
}

class PagePhanCongDoAn extends StatelessWidget {
  const PagePhanCongDoAn();
  static const routeName = "/phan-cong-do-an";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Phân công đồ án"),
          leading: BackButton(),
        ),
        body: HBox(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PanelTimKiem(),
                _PanelListHocVien(),
              ],
            ),
            VBox(
              children: [_PanelEdit()],
            )
          ],
        ),
      ),
    );
  }
}
