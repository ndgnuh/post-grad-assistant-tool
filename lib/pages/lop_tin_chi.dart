import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sqflite/sqflite.dart';

import '../extensions.dart';
import '../drawer.dart';
import '../datamodels.dart';
import '../custom_widgets.dart';

typedef _LopHoc = ({
  int id,
  String hocKy,
  String? maLop,
  String hocPhan,
  int? idGiangVien,
  String? giangVien,
  int ghiChu,
});

class _BangDanhSachLop extends StatefulWidget {
  String? hocKy;
  _BangDanhSachLop({this.hocKy});

  @override
  State<_BangDanhSachLop> createState() => _BangDanhSachLopState();
}

class _BangDanhSachLopState extends State<_BangDanhSachLop> {
  static const columns = [
    "Học kỳ",
    "Mã lớp",
    "Học phần",
    "Giảng viên",
    "Ghi chú",
  ];

  Future<void> updateGiangVien(int idLop, int idGiangVien) async {
    var db = await openDatabase(databasePath);
    await db.rawUpdate(
      "UPDATE LopTinChi SET idGiangVien = ? WHERE id = ?",
      [idGiangVien, idLop],
    );
    await db.close();
  }

  Future<void> updateHuyLop(int idLop, bool huy) async {
    var db = await openDatabase(databasePath);
    await db.rawUpdate(
      "UPDATE LopTinChi SET trangThai = ? where id = ?",
      [huy ? 1 : 0, idLop],
    );
    await db.close();
    setState(() {});
  }

  Widget buildFinished(List<_LopHoc> rows) {
    return DataTable(
      columns: [
        for (final label in columns)
          DataColumn(
            headingRowAlignment: MainAxisAlignment.spaceBetween,
            label: Text(
              label,
              style: TextStyle(
                fontVariations: [FontVariation.weight(700)],
              ),
            ),
          ),
      ],
      rows: [
        for (final _LopHoc row in rows)
          DataRow(
            selected: true,
            cells: [
              DataCell(Text(row.hocKy)),
              DataCell(Text(row.maLop ?? "N/A")),
              DataCell(Text(row.hocPhan)),
              DataCell(DropdownGiangVien(
                selectedId: row.idGiangVien,
                onSelected: (int? idGiangVien) {
                  switch (idGiangVien) {
                    case int id:
                      updateGiangVien(row.id, id).then((_) => {});
                    case null:
                  }
                },
              )),
              DataCell(Checkbox(
                value: row.ghiChu > 0,
                onChanged: (bool? mchecked) {
                  switch (mchecked) {
                    case bool checked:
                      updateHuyLop(row.id, checked);
                    default:
                  }
                },
              )),
            ],
          ),
      ],
    );
  }

  Future<List<_LopHoc>> fetch() async {
    Database db = await openDatabase(databasePath);
    List<Map> rows = await db.rawQuery(
      """
    SELECT
        LOPTINCHI.ID AS id,
        LOPTINCHI.HOCKY AS hocKy,
        LOPTINCHI.MALOPHOC AS maLop,
        LOPTINCHI.IDGIANGVIEN as idGiangVien,
        CONCAT(HOCPHAN.TENTIENGVIET, ' (', HOCPHAN.MAHOCPHAN, ')') AS hocPhan,
        CASE
            WHEN IDGIANGVIEN IS NULL THEN NULL
            ELSE CONCAT(CD.CHUCDANH, G.HOTEN, CHAR(10), G.SDT, ' - ', G.EMAIL)
        END AS giangVien,
        LOPTINCHI.TRANGTHAI AS thangThai
    FROM LOPTINCHI
    LEFT JOIN HOCPHAN ON LOPTINCHI.MAHOCPHAN = HOCPHAN.MAHOCPHAN
    LEFT JOIN GIANGVIEN AS G ON LOPTINCHI.IDGIANGVIEN = G.ID
    LEFT JOIN CHUCDANHGIANGVIEN AS CD ON G.ID = CD.ID
    WHERE (HOCKY = ?) OR (? IS NULL)
    """,
      [widget.hocKy, widget.hocKy],
    );
    List<_LopHoc> results = [
      for (final {
            "id": id as int,
            "maLop": maLop as String?,
            "thangThai": trangThai as int,
            "hocPhan": hocPhan as String,
            "idGiangVien": idGiangVien as int?,
            "giangVien": giangVien as String?,
            "hocKy": hocKy as String,
          } in rows)
        (
          id: id,
          hocKy: hocKy,
          maLop: maLop,
          ghiChu: trangThai,
          hocPhan: hocPhan,
          idGiangVien: idGiangVien,
          giangVien: giangVien,
        )
    ];
    await db.close();
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetch(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            List<_LopHoc> data = snapshot.data ?? <_LopHoc>[];
            return buildFinished(data);
          default:
            return CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}

class _DanhSachLopTinChiState extends State<DanhSachLopTinChi> {
  Future<List<String>>? futureDanhSachHocKy;
  Future<List<Map>>? futureDanhSachHocPhan;
  Future<List<Map>>? futureDanhSachLopHoc;
  String? selImportFile;
  String? selHocKy;
  String? selHocPhan;

  Future<List<Map>> getDanhSachHocPhan() async {
    Database db = await openDatabase(databasePath);
    List<Map> rows = await db.rawQuery(
      """
        SELECT DISTINCT
        HocPhan.maHocPhan as value,
        CONCAT(HocPhan.maHocPhan, " ", tenTiengViet, " ", khoiLuong) as label
        FROM
        LOPTINCHI INNER JOIN HOCPHAN ON LOPTINCHI.MAHOCPHAN = HOCPHAN.MAHOCPHAN
        WHERE (? IS NULL) OR (HOCKY = ?) """,
      [selHocKy, selHocKy],
    );

    await db.close();
    return rows;
  }

  Widget childSelectHocKy() {
    return FutureBuilder(
      future: futureDanhSachHocKy,
      builder: (context, snapshot) {
        // default value
        List<DropdownMenuEntry<String?>> items = [
          DropdownMenuEntry(value: null, label: "Tất cả")
        ];

        // load data if any
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            List<String> hocKyList = snapshot.data ?? <String>[];
            items.addAll(
                hocKyList.map((v) => DropdownMenuEntry(label: v, value: v)));
          default:
            return CircularProgressIndicator();
        }

        return DropdownMenu<String?>(
          enableFilter: true,
          label: Text("Học kỳ"),
          dropdownMenuEntries: items,
          onSelected: (String? value) {
            setState(() {
              selHocKy = value;
              futureDanhSachHocPhan = getDanhSachHocPhan();
            });
          },
          initialSelection: selHocKy,
        );
      },
    );
  }

  Widget SelectHocPhan() {
    return FutureBuilder(
      future: futureDanhSachHocPhan,
      builder: (context, snapshot) {
        List<({String? value, String label})> entries = [
          (value: null, label: "Tất cả")
        ];

        // add extra data if any
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            snapshot.data?.forEach((v) {
              entries.add((
                value: v["value"],
                label: v["label"] ?? "??",
              ));
            });
          default:
            return CircularProgressIndicator();
        }

        // Build drop down entries
        List<DropdownMenuEntry<String?>> items = [
          for (final e in entries)
            DropdownMenuEntry(
              label: e.label,
              value: e.value,
            )
        ];

        // find initial selection
        Set<String?> allValues = {for (final e in entries) e.value};
        String? initialSelection =
            allValues.contains(selHocPhan) ? selHocPhan : null;
        return DropdownMenu<String?>(
          label: Text("Học phần"),
          enableFilter: true,
          dropdownMenuEntries: items,
          onSelected: (String? value) {
            setState(() {
              selHocPhan = value;
            });
          },
          initialSelection: initialSelection,
        );
      },
    );
  }

  Future<List> getLopHoc() async {
    Database db = await openDatabase(databasePath);

    var rows = await db.rawQuery("""
        SELECT * FROM ViewLopTinChi
    """);
    await db.close();
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    futureDanhSachHocKy ??= getHocKy();
    futureDanhSachHocPhan ??= getDanhSachHocPhan();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Lớp tín chỉ"),
      ),
      drawer: MyDrawer(),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
            runSpacing: 15,
            spacing: 15,
            children: [
              childSelectHocKy(),
              SelectHocPhan(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _BangDanhSachLop(hocKy: selHocKy),
                  ),
                ],
              ),
              SizedBox(
                width: 700,
                child: FilePickerInput(
                  label: "Nhập danh sách từ trang tác nghiệp",
                  hintText: "File điểm cuối kỳ xls",
                  allowedExtensions: ["xlsx", "xls", "ods", "csv"],
                  selectedFile: switch (selImportFile) {
                    null => null,
                    String file => file.basename(),
                  },
                  onSelected: (String file) {
                    setState(() {
                      selImportFile = file;
                    });
                  },
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                label: Text("Import"),
              ),
              // end of import
              ElevatedButton.icon(
                icon: Icon(Icons.save),
                onPressed: () async {
                  String? mfile = await FilePicker.platform.saveFile();
                  switch (mfile) {
                    case null:
                      return;
                    case String file:
                      ;
                  }
                },
                label: Text("Lưu file TKB"),
              ),
              // End of wrap
            ],
          ),
        ),
      ),
    );
  }
}

class DanhSachLopTinChi extends StatefulWidget {
  static const routeName = "/index/lop-tin-chi";
  const DanhSachLopTinChi({super.key});

  @override
  State<DanhSachLopTinChi> createState() => _DanhSachLopTinChiState();
}
