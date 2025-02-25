import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../datamodels.dart';

const double _margin = 10;
const fields = (
  id: "id",
  hoTen: "hoTen",
  donVi: "donVi",
  sdt: "sdt",
  email: "email",
  chucDanh: "chucDanh",
  idChucDanh: "idChucDanh",
);

class _BodyState extends State<_Body> {
  String query = "";
  Set<GiangVien> results = {};
  final Set<GiangVien> selected = {};
  Future<List<GiangVien>> giangVienResult = fetchGiangVien();

  Future<List<GiangVien>> _searchGiangVien([String? hoTen]) async {
    var gv = await fetchGiangVien(hoTen: query);
    results = gv.toSet();
    return gv;
  }

  List<GiangVien> giangVienList() {
    return selected.toList() + results.toList();
  }

  Widget giangVienListTile(GiangVien gv, bool isSelected) {
    // bool isSelected = selected.contains(gv);

    void onSelected(bool? val) {
      switch (val) {
        case true:
          selected.add(gv);
        case false:
          selected.remove(gv);
        default:
      }

      // update layout
      setState(() {});
    }

    return ListTile(
      leading: Icon(Icons.person),
      title: Text(gv.hoTen),
      subtitle: Text(gv.donVi ?? "(Không có thông tin đơn vị)"),
      trailing: IntrinsicWidth(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/edit/giang-vien",
                  arguments: gv,
                );
              },
              icon: Icon(Icons.edit),
            ),
            Icon(Icons.details),
            Checkbox(value: isSelected, onChanged: onSelected),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return SizedBox(
      child: Column(
        children: [
          SearchBar(
            leading: Icon(Icons.search),
            hintText: "Keyword",
            onSubmitted: (keyword) {
              setState(() {
                giangVienResult = _searchGiangVien(keyword);
              });
            },
          ),
          Expanded(
            child: FutureBuilder(
              future: giangVienResult,
              builder: (context, snapshot) {
                // future state
                ConnectionState state = snapshot.connectionState;
                List<GiangVien>? result = snapshot.data;

                // error widget
                List<Widget> errorWidget = switch (state) {
                  ConnectionState.done => [],
                  ConnectionState.active => [CircularProgressIndicator()],
                  _ => [Center(child: Text("Some error has occured"))],
                };

                // list of entries to be rendered
                List<GiangVien> emptyGv = List.empty(growable: false);
                List<GiangVien> resGvList = switch (state) {
                  ConnectionState.done => result ?? emptyGv,
                  _ => emptyGv,
                };

                // filter out selected entries
                resGvList = resGvList.where((GiangVien gv) {
                  return !selected.contains(gv);
                }).toList();

                // selected list tiles
                List<Widget> resGvTiles = resGvList
                    .map((GiangVien gv) => giangVienListTile(gv, false))
                    .toList();
                List<Widget> selGvTiles = selected
                    .map((GiangVien gv) => giangVienListTile(gv, true))
                    .toList();

                // the full widget
                return ListView(children: selGvTiles + resGvTiles);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _PageState extends InheritedWidget {
  final String? searchKeyword;
  const _PageState({
    required super.child,
    this.searchKeyword,
  });

  static _PageState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_PageState>()!;

  @override
  bool updateShouldNotify(_PageState oldWidget) {
    return oldWidget.searchKeyword != searchKeyword;
  }
}

class _DanhSachGiangVienState extends State<DanhSachGiangVien> {
  String? searchKeyword;

  @override
  Widget build(BuildContext context) {
    return _PageState(
      searchKeyword: searchKeyword,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Danh sách giảng viên"),
        ),
        body: _Body(),
      ),
    );
  }
}

class DanhSachGiangVien extends StatefulWidget {
  static const String routeName = "/index/giang-vien";
  const DanhSachGiangVien({super.key});

  @override
  State<DanhSachGiangVien> createState() => _DanhSachGiangVienState();
}
