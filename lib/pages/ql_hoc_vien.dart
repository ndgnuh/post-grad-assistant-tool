import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/domain_objects.dart';
import '../custom_widgets.dart';

class _State extends ChangeNotifier {
  static of(BuildContext context) => Provider.of<_State>(context);
  final List<HocVien> listHocVien = [];
  final searchController = TextEditingController();

  refresh() async {
    final query = searchController.text;
    listHocVien.clear();
    if (query.trim().isEmpty) {
      listHocVien.addAll(await HocVien.all());
    } else {
      listHocVien.addAll(await HocVien.search(searchQuery: query));
    }
    notifyListeners();
  }
}

class _TableHocVienDataSource extends DataTableSource {
  final _State state;
  _TableHocVienDataSource({required this.state});

  static get columns {
    final names = [
      "ID",
      "Khóa",
      "Mã học viên",
      "Tên học viên",
      "Email",
      "Email hust",
      "SĐT",
      "Trạng thái"
    ];
    return [for (final name in names) DataColumn(label: Text(name))];
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => state.listHocVien.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int i) {
    HocVien hocVien = state.listHocVien[i];
    return DataRow(cells: [
      DataCell(EzCopy(hocVien.id.toString())),
      DataCell(EzCopy(hocVien.nienKhoa ?? "")),
      DataCell(EzCopy(hocVien.maHocVien ?? "-")),
      DataCell(EzCopy(hocVien.hoTen)),
      DataCell(EzCopy(hocVien.email ?? "")),
      DataCell(EzCopy(hocVien.emailHust ?? "")),
      DataCell(EzCopy(hocVien.dienThoai ?? "")),
      DataCell(EzCopy(hocVien.trangThai.toString())),
    ]);
  }
}

class _TableHocVien extends StatelessWidget {
  const _TableHocVien({super.key});

  @override
  Widget build(BuildContext context) {
    final state = _State.of(context);
    return PaginatedDataTable(
      rowsPerPage: 5,
      columns: _TableHocVienDataSource.columns,
      source: _TableHocVienDataSource(state: state),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = _State.of(context);
    return SearchBar(
      leading: Icon(Icons.search),
      hintText: "Tìm theo họ tên, mã học viên, sdt hoặc email",
      controller: state.searchController,
      onSubmitted: (_) => state.refresh(),
    );
  }
}

class QlHocVien extends StatelessWidget {
  const QlHocVien({super.key});
  static const routeName = "/hoc-vien";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Học viên"),
        actions: [
          TextButton(
            onPressed: null,
            child: Text("Copy email"),
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) {
          final state = _State();
          state.refresh();
          return state;
        },
        child: Column(
          children: [
            _SearchBar(),
            _TableHocVien(),
          ],
        ),
      ),
    );
  }
}
