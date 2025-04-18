import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// import '../datamodels.dart';
import '../custom_widgets.dart';
import '../business/domain_objects.dart';
import '../business/giao_de_tai.dart';

const _defaultPadding = EdgeInsets.symmetric(vertical: 5, horizontal: 10);

String labelFormatter(GiangVien? gv) {
  return gv?.hoTenChucDanh ?? "";
}

class _State extends ChangeNotifier {
  List<DeTaiThacSi> listDeTai = [];
  final Set<DeTaiThacSi> selectedDeTai = {};
  final Map<DeTaiThacSi, GiangVien> mapGiangVien = {};
  final Map<DeTaiThacSi, HocVien?> mapHocVien = {};

  final TextEditingController searchDeTai = TextEditingController();
  final EzSelectionController<GiangVien> searchGiangVien =
      EzSelectionController(
    labelFormatter: labelFormatter,
  );

  final EzSelectionController<GiangVien> giangVien = EzSelectionController(
    labelFormatter: labelFormatter,
  );
  final TextEditingController tenTiengViet = TextEditingController();
  final TextEditingController tenTiengAnh = TextEditingController();

  final updateButtonController = WidgetStatesController();
  final deleteButtonController = WidgetStatesController();

  @override
  void dispose() {
    super.dispose();
    searchGiangVien.dispose();
    giangVien.dispose();
    tenTiengViet.dispose();
    tenTiengAnh.dispose();
  }

  Future<void> refresh({
    bool resetPage = false,
  }) async {
    final listGv = await GiangVien.all();
    searchGiangVien.values = listGv;
    giangVien.values = listGv;
    listDeTai = await DeTaiThacSi.search(
      name: searchDeTai.text,
      idGiangVien: searchGiangVien.value?.id,
    );

    for (final deTai in listDeTai) {
      mapGiangVien[deTai] = await deTai.giangVien;
      mapHocVien[deTai] = await deTai.hocVien;
    }
    notifyListeners();
  }

  void addDeTai() async {
    await DeTaiThacSi(
      idGiangVien: giangVien.value!.id,
      tenTiengViet: tenTiengViet.text,
      tenTiengAnh: tenTiengAnh.text,
    ).create();
    tenTiengViet.text = "";
    tenTiengAnh.text = "";
    await refresh();
    notifyListeners();
  }

  void edit(DeTaiThacSi dt) {
    tenTiengViet.text = dt.tenTiengViet;
    tenTiengAnh.text = dt.tenTiengAnh;
    giangVien.value = mapGiangVien[dt];
  }

  void select(DeTaiThacSi dt) {
    selectedDeTai.add(dt);
    notifyListeners();
  }

  void deselect(DeTaiThacSi dt) {
    selectedDeTai.remove(dt);
    notifyListeners();
  }

  Future<void> _delete() async {}

  Future<void> _update() async {}

  Function()? get fnUpdate {
    if (selectedDeTai.length != 1 || giangVien.value == null) {
      return null;
    }
    return _update;
  }

  Function()? get fnAddDeTai {
    if (giangVien.value == null) {
      return null;
    }
    if (tenTiengViet.text == "") {
      return null;
    }
    return addDeTai;
  }

  _exportDanhSachDeTai({
    required String extention,
    required exporter,
  }) async {
    final outputFile = await FilePicker.platform.saveFile(
      dialogTitle: "Chọn vị trí lưu",
      fileName: "Danh sách đề tài hướng dẫn.$extention",
    );

    switch (outputFile) {
      case String outputFile:
        final data = listDeTai;
        await exporter(
          outputPath: outputFile,
          listDeTaiThacSi: data,
        );
    }
  }

  fnExportDanhSachDeTaiExcel() async {
    _exportDanhSachDeTai(
      extention: "xlsx",
      exporter: exportDanhSachDeTaiExcel,
    );
  }

  fnExportDanhSachDeTaiPdf() async {
    _exportDanhSachDeTai(
      extention: "pdf",
      exporter: exportDanhSachDeTaiPdf,
    );
  }

  _State() {
    refresh(resetPage: true);
  }
}

class _DeTaiSource extends DataTableSource {
  final _State state;
  _DeTaiSource(this.state);

  @override
  DataRow? getRow(int index) {
    final deTai = state.listDeTai[index];
    final giangVien = state.mapGiangVien[deTai] as GiangVien;
    final hocVien = state.mapHocVien[deTai];
    return DataRow(cells: [
      DataCell(Text(giangVien.hoTenChucDanh)),
      DataCell(Text(deTai.tenTiengViet)),
      DataCell(Text(hocVien?.hoTen ?? "-")),
      DataCell(Text(deTai.hanBaoVe?.toString() ?? "-")),
      DataCell(TextButton(
        onPressed: null,
        child: Text("Sửa"),
      )),
    ]);
  }

  @override
  int get rowCount => state.listDeTai.length;

  @override
  int get selectedRowCount => 0;
  @override
  bool get isRowCountApproximate => false;
}

class _TableDeTai extends StatelessWidget {
  final _columns = [
    ("Giảng viên", IntrinsicColumnWidth()),
    ("Tên đề tài", FlexColumnWidth(1)),
    ("Giao cho", IntrinsicColumnWidth()),
    ("Hạn bảo vệ", IntrinsicColumnWidth()),
    ("", IntrinsicColumnWidth()),
  ];

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);
    final columns = [
      for (final (column, columnWidth) in _columns)
        DataColumn(
          label: Text(column),
          columnWidth: columnWidth,
        )
    ];
    return PaginatedDataTable(
      rowsPerPage: 20,
      columns: columns,
      source: _DeTaiSource(state),
    );
  }
}

class PageQuanLyDeTai extends EzPage<_State> {
  const PageQuanLyDeTai({super.key});
  static const routeName = "/quan-ly-de-tai";

  @override
  String get pageName => "Quản lý đề tài";

  @override
  _State createState(BuildContext context) => _State();

  @override
  Widget buildBody(BuildContext context) {
    final state = Provider.of<_State>(context, listen: true);
    return EzFlex(
      direction: Axis.horizontal,
      flex: [2, 1],
      children: [
        EzFixed(
          direction: Axis.vertical,
          children: [
            EzFlex(
              flex: [89, 55],
              margin: EdgeInsetsDirectional.all(0),
              direction: Axis.horizontal,
              children: [
                EzTextInput(
                  label: "Tìm kiếm",
                  controller: state.searchDeTai,
                  onUnfocus: () => state.refresh(
                    resetPage: true,
                  ),
                  onEditingComplete: () => state.refresh(
                    resetPage: true,
                  ),
                ),
                EzDropdown.fullWidth(
                  label: "Giảng viên",
                  controller: state.searchGiangVien,
                  onSelected: (_) => state.refresh(
                    resetPage: true,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _TableDeTai(),
                  ),
                ],
              ),
            ),
          ],
        ),

        // The editting panel
        FocusTraversalGroup(
          child: EzFixed(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Chỉnh sửa",
                style: DefaultTextStyle.of(context).style.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              EzDropdown.fullWidth(
                label: "Giảng viên",
                controller: state.giangVien,
                onSelected: (_) => state.refresh(),
              ),
              EzTextInput(
                label: "Tên tiếng Việt",
                controller: state.tenTiengViet,
                onEditingComplete: state.refresh,
                onUnfocus: state.refresh,
              ),
              EzTextInput(
                label: "Tên tiếng Anh",
                controller: state.tenTiengAnh,
              ),
              Divider(height: 20, color: Colors.transparent),
              ElevatedButton(
                focusNode: FocusNode(),
                onPressed: state.fnAddDeTai,
                child: Text("Thêm"),
              ),
              ElevatedButton(
                focusNode: FocusNode(),
                onPressed: null,
                child: Text("Xóa"),
                statesController: state.deleteButtonController,
              ),
              ElevatedButton(
                focusNode: FocusNode(),
                onPressed: state.fnUpdate,
                child: Text("Cập nhật"),
                statesController: state.updateButtonController,
              ),
              ElevatedButton(
                focusNode: FocusNode(),
                onPressed: state.fnExportDanhSachDeTaiExcel,
                child: Text("Lưu excel"),
                statesController: state.updateButtonController,
              ),
              ElevatedButton(
                focusNode: FocusNode(),
                onPressed: state.fnExportDanhSachDeTaiPdf,
                child: Text("Lưu Pdf"),
                statesController: state.updateButtonController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
