import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../datamodels.dart';
import '../custom_widgets.dart';
import '../business/giao_de_tai.dart';

const _defaultPadding = EdgeInsets.symmetric(vertical: 5, horizontal: 10);

String labelFormatter(GiangVien? gv) {
  return gv?.hoTenChucDanh ?? "";
}

class _State extends ChangeNotifier {
  List<DeTaiThacSi> listDeTai = [];
  final Set<DeTaiThacSi> selectedDeTai = {};
  final Map<DeTaiThacSi, GiangVien> mapDeTaiGiangVien = {};

  // Pagination state
  int page = 0;
  int total = 0;
  final int perpage = 10;
  int get offset => page * perpage;
  int get totalPage => (total / perpage).round();

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
    if (resetPage) {
      total = await Repository.countDeTai(
        name: searchDeTai.text,
        idGiangVien: searchGiangVien.value?.id,
      );
      page = 0;
    }

    final listGv = await Repository.searchGiangVien();
    searchGiangVien.values = listGv;
    giangVien.values = listGv;
    listDeTai = await Repository.searchDeTai(
      name: searchDeTai.text,
      idGiangVien: searchGiangVien.value?.id,
      limit: perpage,
      offset: offset,
    );

    for (final deTai in listDeTai) {
      mapDeTaiGiangVien[deTai] = await deTai.giangVien;
    }
    notifyListeners();
  }

  void addDeTai() async {
    await DeTaiThacSi(
      idGiangVien: giangVien.value!.id,
      tenTiengViet: tenTiengViet.text,
      tenTiengAnh: tenTiengAnh.text,
    ).insert();
    tenTiengViet.text = "";
    tenTiengAnh.text = "";
    await refresh();
    notifyListeners();
  }

  void edit(DeTaiThacSi dt) {
    tenTiengViet.text = dt.tenTiengViet;
    tenTiengAnh.text = dt.tenTiengAnh;
    giangVien.value = mapDeTaiGiangVien[dt];
  }

  void select(DeTaiThacSi dt) {
    selectedDeTai.add(dt);
    notifyListeners();
  }

  void deselect(DeTaiThacSi dt) {
    selectedDeTai.remove(dt);
    notifyListeners();
  }

  Future<void> _delete() async {
    final db = await getDefaultDatabase();
    // TODO: add delete method
    // dt.delete(db)
    await Future.wait([
      for (final dt in selectedDeTai) Future.delayed(Duration(microseconds: 1))
    ]);
    await db.close();
    refresh();
  }

  Function()? get fnDelete {
    if (selectedDeTai.isEmpty) {
      return null;
    }
    return _delete;
  }

  Future<void> _update() async {
    final db = await getDefaultDatabase();
    final deTaiNew = selectedDeTai.single.copyWith(
      idGiangVien: giangVien.value!.id,
      tenTiengViet: tenTiengViet.text,
      tenTiengAnh: tenTiengAnh.text,
    );
    // TODO: update de tai
    await db.close();
    refresh();
  }

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

  Function()? get fnPrevPage {
    if (page == 0) {
      return null;
    }
    return () async {
      page = page - 1;
      await refresh();
      notifyListeners();
    };
  }

  Function()? get fnNextPage {
    if (page == totalPage) {
      return null;
    }
    return () async {
      page = page + 1;
      await refresh();
      notifyListeners();
    };
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
        final data = await Repository.searchDeTai(
          limit: 9999999,
        );
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
            Consumer<_State>(
              builder: (context, state, child) {
                return EzFlex(
                  margin: EdgeInsets.all(0),
                  direction: Axis.horizontal,
                  children: [
                    ElevatedButton.icon(
                      onPressed: state.fnPrevPage,
                      label: Text("Trang trước"),
                      icon: Icon(Icons.arrow_left),
                    ),
                    ElevatedButton.icon(
                      onPressed: state.fnNextPage,
                      label: Text("Trang sau"),
                      icon: Icon(Icons.arrow_right),
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Consumer<_State>(
                  builder: (context, state, _) {
                    return EzTable<DeTaiThacSi>(
                      padding: EdgeInsetsDirectional.all(10),
                      columnWidths: {
                        0: IntrinsicColumnWidth(),
                        1: IntrinsicColumnWidth(),
                        4: IntrinsicColumnWidth(),
                        5: IntrinsicColumnWidth(),
                      },
                      alignments: {
                        1: Alignment.centerLeft,
                        2: Alignment.centerLeft,
                        3: Alignment.centerLeft,
                      },
                      headers: [
                        "TT",
                        "Giảng viên",
                        "Tên tiếng Việt",
                        "Tên tiếng Anh",
                        Checkbox(value: false, onChanged: (_) {}),
                        "",
                      ],
                      data: state.listDeTai,
                      rowBuilder: (int i, DeTaiThacSi dt) {
                        return [
                          (state.offset + i + 1).toString(),
                          state.mapDeTaiGiangVien[dt]?.hoTenChucDanh.toString(),
                          dt.tenTiengViet,
                          dt.tenTiengAnh,
                          Checkbox(
                            value: state.selectedDeTai.contains(dt),
                            onChanged: (bool? sel) {
                              if (sel == true) {
                                state.select(dt);
                              } else {
                                state.deselect(dt);
                              }
                            },
                          ),
                          IconButton(
                            onPressed: () => state.edit(dt),
                            icon: Icon(
                              Icons.edit_rounded,
                            ),
                          ),
                        ];
                      },
                    );
                  },
                ),
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
                onPressed: state.fnDelete,
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
