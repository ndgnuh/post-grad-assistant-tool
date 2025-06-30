import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

// import '../datamodels.dart';
import '../custom_widgets.dart';
import '../business/domain_objects.dart';
import '../business/domain_editors.dart';
import '../business/ql_de_tai.dart';

const _defaultPadding = EdgeInsets.symmetric(vertical: 5, horizontal: 10);

String labelFormatter(GiangVien? gv) {
  return gv?.hoTenChucDanh ?? "";
}

class _State extends ChangeNotifier {
  static of(context) => Provider.of<_State>(context);

  List<DeTaiThacSi> listDeTai = [];
  final editController = DeTaiThsEditingController();

  final Set<DeTaiThacSi> selectedDeTai = {};
  final Map<DeTaiThacSi, GiangVien> mapGiangVien = {};
  final Map<DeTaiThacSi, HocVien?> mapHocVien = {};

  final TextEditingController searchDeTai = TextEditingController();
  final searchGiangVien = SearchChoiceController<GiangVien>(
    labelFormatter: (gv) => gv?.hoTenChucDanh ?? "Không",
    searchFunction: GiangVien.search,
    nullable: true,
  );

  Future<void> refresh({
    bool resetPage = false,
  }) async {
    final listGiangVien = await GiangVien.all();
    final listHocVien = await HocVien.all();

    listDeTai = await DeTaiThacSi.search(
      searchQuery: searchDeTai.text,
      idGiangVien: searchGiangVien.valueOrNull?.id,
    );

    for (final deTai in listDeTai) {
      mapGiangVien[deTai] = await deTai.giangVien;
      mapHocVien[deTai] = await deTai.hocVien;
    }

    editController.listGiangVien = listGiangVien;
    editController.listHocVien = listHocVien;

    notifyListeners();
  }

  void addDeTai() async {
    notifyListeners();
  }

  bool get editing => editController.id != null;

  edit(DeTaiThacSi value) {
    editController.value = value;
    notifyListeners();
  }

  unedit() {
    editController.value = null;
    notifyListeners();
  }

  Function? get delete => editing ? _delete : null;
  Future<void> _delete() async {
    final deTai = editController.value;
    await deTai.delete();
    unedit();
    refresh();
  }

  Function? get update => editing ? _update : null;
  Future<void> _update() async {
    final deTai = editController.value;
    await deTai.update();
    refresh();
  }

  Function? get create => editing ? null : _create;
  Future<void> _create() async {
    final deTai = editController.value;
    await deTai.create();
    unedit();
    refresh();
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
    final giangVien = state.mapGiangVien[deTai];
    final hocVien = state.mapHocVien[deTai];
    return DataRow(cells: [
      DataCell(EzCopy(deTai.id.toString())),
      DataCell(EzCopy(giangVien?.hoTenChucDanh ?? "")),
      DataCell(EzCopy(deTai.tenTiengViet)),
      DataCell(EzCopy(hocVien?.hoTen ?? "-")),
      DataCell(EzDmyText(deTai.hanBaoVe, placeholder: "-")),
      DataCell(TextButton(
        onPressed: () => state.edit(deTai),
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
    ("ID", IntrinsicColumnWidth()),
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

class _EditForm extends StatelessWidget {
  const _EditForm({super.key});

  @override
  Widget build(BuildContext context) {
    final state = _State.of(context);
    final textTheme = TextTheme.of(context);

    return EzFixed(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Chỉnh sửa",
          style: textTheme.titleLarge,
        ),
        Text(
          "Thông tin chung",
          style: textTheme.titleMedium,
        ),
        SearchChoice<GiangVien>(
          controller: state.editController.giangVien,
        ),
        EzTextInput(
          label: "Tên tiếng Việt",
          controller: state.editController.tenTiengViet,
          onEditingComplete: state.refresh,
          onUnfocus: state.refresh,
        ),
        EzTextInput(
          label: "Tên tiếng Anh",
          controller: state.editController.tenTiengAnh,
        ),
        EzTextInput(
          label: "Ghi chú",
          controller: state.editController.ghiChu,
          multiline: true,
        ),
        Divider(height: 10, color: Colors.transparent),
        Text("Giao đề tài", style: textTheme.titleMedium),
        SearchChoice(
          label: "Học viên",
          controller: state.editController.hocVien,
        ),
        EzTextInput(
          label: "Số quyết định",
          controller: state.editController.soQdGiao,
        ),
        EzDateInput(
          label: "Hạn bảo vệ",
          controller: state.editController.hanBaoVe,
        ),
        Divider(height: 20, color: Colors.transparent),
        if (!state.editing)
          ElevatedButton(
            focusNode: FocusNode(),
            statesController: state.editController.canCreate,
            onPressed: state.create,
            child: Text("Thêm"),
          ),
        if (state.editing)
          ElevatedButton(
            focusNode: FocusNode(),
            onPressed: state.delete,
            statesController: state.editController.canUpdate,
            child: Text("Xóa"),
          ),
        if (state.editing)
          ElevatedButton(
            focusNode: FocusNode(),
            onPressed: state.update,
            statesController: state.editController.canUpdate,
            child: Text("Cập nhật"),
          ),
        if (state.editing)
          ElevatedButton(
            onPressed: state.unedit,
            statesController: state.editController.canUpdate,
            child: Text("Hủy"),
          ),
        ElevatedButton(
          focusNode: FocusNode(),
          onPressed: state.fnExportDanhSachDeTaiExcel,
          child: Text("Lưu excel"),
        ),
        ElevatedButton(
          focusNode: FocusNode(),
          onPressed: state.fnExportDanhSachDeTaiPdf,
          child: Text("Lưu Pdf"),
        ),
      ],
    );
  }
}

class _SearchForm extends StatelessWidget {
  const _SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    final state = _State.of(context);
    return EzFlex(
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
        SearchChoice<GiangVien>(
          label: "Giảng viên",
          controller: state.searchGiangVien,
          onSelected: (_) => state.refresh(
            resetPage: true,
          ),
        ),
      ],
    );
  }
}

class PageQuanLyDeTai extends StatelessWidget {
  const PageQuanLyDeTai({super.key});
  static const routeName = "/quan-ly-de-tai";

  @override
  String get pageName => "Quản lý đề tài";

  @override
  _State createState(BuildContext context) => _State();

  @override
  Widget build(BuildContext context) {
    final body = EzFlex(
      direction: Axis.horizontal,
      flex: [2, 1],
      children: [
        EzFixed(
          direction: Axis.vertical,
          children: [
            const _SearchForm(),
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
          child: const _EditForm(),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Đề tài hướng dẫn cao học"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => _State(),
        child: body,
      ),
    );
  }
}
