import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../datamodels.dart' show databasePath;

const _routeName = "/index/hoc-phan";
typedef _Lst = List<Map<String, Object?>>;

const fields = (
  maHP: "maHocPhan",
  tenVi: "tenTiengViet",
  tenEn: "tenTiengAnh",
  soTC: "soTinChi",
  khoiKT: "tenKhoiKienThuc",
  khoiLuong: "khoiLuong",
);

class _ListDSHP extends StatelessWidget {
  Widget buildComplete(BuildContext context, _Lst danhSach) {
    return ListView(
      children: [
        for (final row in danhSach)
          Material(
            child: ListTile(
              title: Text("${row[fields.tenVi]} ${row[fields.khoiLuong]}"),
              leading: Text(""),
              subtitle: Text(row[fields.tenEn] as String),
              trailing: Text(row[fields.khoiKT] as String),
              // [onTap] enable default [hoverColor]
              onTap: () {},
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _DSHP.of(context).futureHocPhan,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            switch (snapshot.data) {
              case _Lst data:
                return buildComplete(context, data);
              default:
                return CircularProgressIndicator();
            }
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}

class DanhSachHocPhan extends StatefulWidget {
  static const routeName = _routeName;
  const DanhSachHocPhan({super.key});

  @override
  State<DanhSachHocPhan> createState() => _DanhSachHocPhanState();
}

class _DSHP extends InheritedWidget {
  _DSHP({
    required super.child,
    this.searchKeyword,
  });

  String? searchKeyword;

  Future<List> get futureHocPhan async {
    Database db = await openDatabase(databasePath);
    final rows = await db.rawQuery("""
SELECT
    A.MAHOCPHAN AS ${fields.maHP},
    A.TENTIENGVIET AS ${fields.tenVi},
    A.TENTIENGANH AS ${fields.tenEn},
    A.SOTINCHI AS ${fields.soTC},
    A.KHOILUONG AS ${fields.khoiLuong},
    B.TENKHOIKIENTHUC AS ${fields.khoiKT}
FROM
HOCPHAN AS A INNER JOIN KHOIKIENTHUC AS B
ON A.KHOIKIENTHUC = B.KHOIKIENTHUC
WHERE (? IS NULL) OR (MAHOCPHAN LIKE ?) OR (TENTIENGVIET LIKE ?) OR (TENTIENGANH LIKE ?)
""", [
      searchKeyword,
      "%$searchKeyword%",
      "%$searchKeyword%",
      "%$searchKeyword%",
    ]);
    await db.close();
    return rows;
  }

  static _DSHP of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_DSHP>()!;

  @override
  bool updateShouldNotify(_DSHP oldWidget) {
    return oldWidget.searchKeyword != searchKeyword;
  }
}

class _DanhSachHocPhanState extends State<DanhSachHocPhan> {
  String? searchKeyword;

  @override
  Widget build(BuildContext context) {
    return _DSHP(
      searchKeyword: searchKeyword,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text("Danh sách học phần"),
        ),
        body: Column(
          children: [
            ListTile(
              leading: Icon(Icons.search),
              title: TextFormField(
                onChanged: (String? text) {
                  setState(() {
                    searchKeyword = text;
                  });
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Mã học phần, tên học phần",
                  labelText: "Tìm kiếm",
                ),
              ),
            ),
            Expanded(child: _ListDSHP()),
          ],
        ),
      ),
    );
  }
}
