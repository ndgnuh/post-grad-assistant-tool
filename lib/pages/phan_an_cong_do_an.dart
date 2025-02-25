import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../datamodels.dart' show databasePath, tryParseDate, toSqliteDate;
import '../custom_widgets.dart';
import '../bedrock.dart';
import 'package:sqflite/sqflite.dart';
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

enum AssignedMode {
  all,
  notAssigned,
  assigned,
}

class _StudentModel extends ChangeNotifier {
  int? idHocVien;

  Future<Map?> get data async {
    switch (idHocVien) {
      case null:
        return null;
      case int id:
        final db = await openDatabase(
          databasePath,
          readOnly: true,
        );
        final row = await db.rawQuery(
          """
    SELECT
        A.ID AS ${fields.idHV},
        MAHOCVIEN AS ${fields.maHV},
        TENHOCVIEN AS ${fields.tenHV},
        B.HOTEN AS ${fields.tenGV},
        B.ID AS ${fields.idGV},
        A.DETAILUANVANTIENGVIET AS ${fields.deTaiVi},
        A.DETAILUANVANTIENGANH AS ${fields.deTaiEn},
        A.HANBAOVE AS ${fields.hanBV},
        A.NGAYGIAODETAI AS ${fields.qdGiao},
        A.langiahan as ${fields.giaHan},
        A.SOQUYETDINHGIAO AS ${fields.ngayGiao}
    WHERE A.ID = ?
        """,
          [id],
        );
        await db.close();
        return row.first;
    }
  }
}

class PageState extends ChangeNotifier {
  AssignedMode assignedMode = AssignedMode.all;
  String? nienKhoa;
  String? searchQuery;
  Map? selectedEntry;
  List nestedData = [
    {"value": 1},
  ];

  void incValue() {
    nestedData[0]["value"] += 1;
    notifyListeners();
  }

  void setSearchQuery(String? text) {
    searchQuery = text;
    notifyListeners();
  }

  void setAssignedMode(AssignedMode mode) {
    assignedMode = mode;
    notifyListeners();
  }

  void setNienKhoa(String? nienKhoa) {
    this.nienKhoa = nienKhoa;
    notifyListeners();
  }

  void setSelectedEntry(Map? row) {
    selectedEntry = row;
    notifyListeners();
  }

  Future<void> updateHanBaoVe({
    required idHocVien,
    required DateTime? hanBaoVe,
  }) async {
    print(idHocVien);
    print(hanBaoVe);
    var db = await openDatabase(databasePath);
    await db.rawUpdate(
      """UPDATE hocvien
    set hanBaoVe = ? 
    where id = ?""",
      [toSqliteDate(hanBaoVe), idHocVien],
    );
    await db.close();
    notifyListeners();
  }

  Future<void> updateGVHD({
    required idHV,
    required idGV,
  }) async {
    var db = await openDatabase(databasePath);
    await db.rawUpdate(
      """UPDATE hocvien
    set idGiangVienHuongDan = ? 
    where id = ?""",
      [idGV, idHV],
    );
    await db.close();
    // notifyListeners();
  }

  Future<List<Map>> listDoAn() async {
    var db = await openDatabase(databasePath);

    final where1 = switch (assignedMode) {
      AssignedMode.all => "AND TRUE",
      AssignedMode.notAssigned => "AND A.IDGIANGVIENHUONGDAN IS NULL",
      AssignedMode.assigned => "AND A.IDGIANGVIENHUONGDAN IS NOT NULL",
    };

    final query = """
    SELECT
        A.ID AS ${fields.idHV},
        MAHOCVIEN AS ${fields.maHV},
        TENHOCVIEN AS ${fields.tenHV},
        B.HOTEN AS ${fields.tenGV},
        B.ID AS ${fields.idGV},
        A.DETAILUANVANTIENGVIET AS ${fields.deTaiVi},
        A.DETAILUANVANTIENGANH AS ${fields.deTaiEn},
        A.HANBAOVE AS ${fields.hanBV},
        A.NGAYGIAODETAI AS ${fields.qdGiao},
        A.SOQUYETDINHGIAO AS ${fields.ngayGiao},
        A.trangthai as ${fields.idTrangThai},
        C.tenTrangthai as ${fields.tenTrangThai}
    FROM
    HOCVIEN AS A LEFT JOIN GIANGVIEN AS B
    ON A.IDGIANGVIENHUONGDAN = B.ID
    INNER JOIN TRANGTHAIHOCVIEN AS C
    ON A.trangthai = C.matrangthai
    WHERE 
    ((? is null) OR (A.nienKhoa = ?)) $where1
    AND ((? is null) OR (MAHOCVIEN like ?) OR (TENHOCVIEN LIKE ?))
    """;
    final rows = await db.rawQuery(
      query,
      [nienKhoa, nienKhoa, searchQuery, "%$searchQuery%", "%$searchQuery%"],
    );
    await db.close();
    return rows;
  }
}

abstract class PageWidget extends StatelessWidget {
  const PageWidget({super.key});

  Widget builder(BuildContext context, PageState model, child);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageState>(builder: builder);
  }
}

abstract class _SelPageWidget<T> extends StatelessWidget {
  const _SelPageWidget({super.key});

  Widget builder(BuildContext context, T state, child);
  T selector(BuildContext context, PageState model);

  @override
  Widget build(BuildContext context) {
    return Selector<PageState, T>(builder: builder, selector: selector);
  }
}

class ListDoAn extends _SelPageWidget<Future> {
  const ListDoAn({super.key});

  static const cols = [
    "Mã HV",
    "Tên học viên",
    "GVHD",
    "Tên đề tài (VI)",
    "Hạn bảo vệ",
    "Gia hạn",
    "Trạng thái",
    "",
  ];

  Widget updaterTextField(
    context, {
    required String idHv,
    required String field,
    required String value,
  }) {
    return TextFormField(
      onFieldSubmitted: (value) {},
      controller: TextEditingController(text: value),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }

  Widget buildDone(context, List<Map> data) {
    final model = Provider.of<PageState>(context);
    double colW = MediaQuery.of(context).size.width * 0.1;
    return DataTable(
      dataRowMaxHeight: double.infinity,
      columns: [
        for (final col in cols)
          DataColumn(
            label: Text(col),
          ),
      ],
      rows: [
        for (final (Map row) in data)
          DataRow(
            onSelectChanged: (bool? sel) {},
            onLongPress: () => model.setSelectedEntry(row),
            selected: row[fields.selected] ?? false,
            cells: [
              DataCell(Text(row[fields.maHV] as String? ?? "N/A")),
              DataCell(
                Text(row[fields.tenHV] as String),
              ),
              DataCell(
                Text(row[fields.tenGV] ?? "", softWrap: false),
              ),
              DataCell(
                SizedBox(
                  width: 300,
                  child: Text(row[fields.deTaiVi] ?? ""),
                ),
              ),
              DataCell(
                Text(row[fields.hanBV] ?? "N/A"),
              ),
              DataCell(
                Text(row[fields.giaHan] ?? "0"),
              ),
              DataCell(Text(row[fields.tenTrangThai] as String)),
              DataCell(
                Icon(Icons.edit),
                onTap: () {
                  model.setSelectedEntry(row);
                },
              ),
            ],
          ),
      ],
    );
  }

  @override
  Future selector(_, model) {
    return model.listDoAn();
  }

  @override
  Widget builder(BuildContext context, listDoAn, _) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: listDoAn,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return buildDone(context, snapshot.data ?? []);
            default:
              return CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}

class AssignModeSelect extends PageWidget {
  const AssignModeSelect({super.key});

  @override
  Widget builder(context, model, child) {
    return DropdownMenu(
      initialSelection: AssignedMode.all,
      onSelected: (AssignedMode? mmode) {
        switch (mmode) {
          case AssignedMode mode:
            model.setAssignedMode(mode);
          default:
        }
      },
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: AssignedMode.all,
          label: "Tất cả",
        ),
        DropdownMenuEntry(
          value: AssignedMode.notAssigned,
          label: "Chưa giao đề tài",
        ),
        DropdownMenuEntry(
          value: AssignedMode.assigned,
          label: "Đã giao đề tài",
        ),
      ],
    );
  }
}

class _SelectNienKhoa extends _SelPageWidget<String?> {
  const _SelectNienKhoa();

  @override
  String? selector(context, model) {
    return model.nienKhoa;
  }

  @override
  Widget builder(context, nienKhoa, _) {
    return DropdownNienKhoa(
      allowEmpty: true,
      emptyLabel: "Tất cả",
      initialSelection: nienKhoa,
      onSelected: Provider.of<PageState>(context).setNienKhoa,
    );
  }
}

class _SearchBox extends PageWidget {
  const _SearchBox({super.key});

  @override
  Widget builder(context, model, _) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        onFieldSubmitted: model.setSearchQuery,
        decoration: InputDecoration(
          labelText: "Tìm kiếm",
        ),
      ),
    );
  }
}

class _PageEditDoAnHocVien extends PageWidget {
  @override
  Widget builder(context, model, child) {
    final mrow = model.selectedEntry;
    final headingText = Text(
      "Cập nhật thông tin",
      style: TextStyle(fontSize: 20),
    );
    return switch (mrow) {
      null => ListView(
          children: [
            // ListTile(title: _TestWidgetSet()),
            ListTile(title: headingText),
            ListTile(title: Text("(chưa chọn bản ghi)")),
          ],
        ),
      Map row => ListView(
          children: [
            ListTile(title: headingText),
            ListTile(
              title: EzTextInput(
                label: "Mã học viên",
                value: row[fields.maHV],
                readOnly: true,
              ),
            ),
            ListTile(
              title: EzTextInput(
                label: "Tên học viên",
                value: row[fields.tenHV],
                readOnly: true,
              ),
            ),
            ListTile(
              title: DropdownMenu(
                width: double.infinity,
                enableFilter: true,
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 1, label: "Nguyễn Văn A"),
                  DropdownMenuEntry(value: 2, label: "Nguyễn Văn B"),
                  DropdownMenuEntry(value: 3, label: "Nguyễn Văn C"),
                ],
                label: Text("Giảng viên hướng dẫn"),
              ),
            ),
            ListTile(
              title: Text("GVHD:"),
              trailing: DropdownFromEnums.giangVien(
                onSelected: (idGv) async {
                  await model.updateGVHD(
                    idHV: row[fields.idHV],
                    idGV: idGv,
                  );
                  ezNotify(context, "Cập nhật thành công GVHD");
                },
                selectedId: row[fields.idGV],
              ),
            ),
            ListTile(
              title: EzTextInput(
                label: "Tên đề tài (tiếng Việt)",
                value: row[fields.deTaiVi],
                multiline: true,
              ),
            ),
            ListTile(
              title: EzTextInput(
                label: "Tên đề tài (tiếng Anh)",
                value: row[fields.deTaiEn],
                multiline: true,
              ),
            ),
            ListTile(
              title: Text("Hạn bảo vệ"),
              trailing: EzDatePicker(
                value: tryParseDate(row[fields.hanBV]),
                onSelected: (date) async {
                  await model.updateHanBaoVe(
                    idHocVien: row[fields.idHV],
                    hanBaoVe: date,
                  );
                  ezNotify(context, "Update hạn bảo vệ thành công");
                },
              ),
            ),
            ListTile(
              title: Text("Ngày giao đề tài"),
              trailing: EzDatePicker(
                onSelected: (_) {},
                label: "+",
                value: tryParseDate(row[fields.ngayGiao]),
              ),
            ),
            ListTile(
              title: EzTextInput(
                label: "Số quyết định giao đề tài",
                value: row[fields.qdGiao],
              ),
            ),
          ],
        ),
    };
  }
}

class _TestWidgetGet extends _SelPageWidget<int> {
  @override
  int selector(BuildContext context, model) {
    return model.nestedData[0]['value'];
  }

  @override
  Widget builder(BuildContext context, state, child) {
    return Text("Count is: $state");
  }
}

class _TestWidgetSet extends _SelPageWidget<int> {
  @override
  int selector(BuildContext context, model) {
    return model.nestedData[0]['value'];
  }

  @override
  Widget builder(BuildContext context, value, child) {
    final state = Provider.of<PageState>(
      context,
      listen: false,
    );
    return EzTextInput(
      value: value.toString(),
      keyboardType: TextInputType.number,
      onSubmitted: (value) {
        state.incValue();
      },
    );
  }
}

class PagePhanCongDoAn extends StatelessWidget {
  const PagePhanCongDoAn({super.key});
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
        body: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(title: Text("Tìm kiếm")),
                  ListTile(
                    title: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _SearchBox(),
                        // _TestWidgetGet(),
                        _SelectNienKhoa(),
                        AssignModeSelect(),
                      ],
                    ),
                  ),
                  ListTile(title: Text("Kết quả")),
                  Expanded(
                    child: ListTile(
                      title: ListDoAn(),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: _PageEditDoAnHocVien(),
            ),
          ],
        ),
      ),
    );
  }
}
