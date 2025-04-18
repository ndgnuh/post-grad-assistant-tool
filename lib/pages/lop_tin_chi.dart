import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

import '../custom_widgets.dart';
import '../business/lop_tin_chi.dart' as domain;
import '../business/lop_tin_chi.dart';

typedef _Esc<T> = EzSelectionController<T>;
typedef _TT = TrangThaiLopTinChi;
const List<int?> _listTietHoc = [null, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

List<T?> withNull<T>(List<T> items) {
  return [null, for (final item in items) item];
}

class _PageState extends ChangeNotifier {
  // Các chỉ mục
  List<LopTinChi> listLopTinChi = [];
  Map<LopTinChi, GiangVien?> mapGiangVien = {};
  Map<LopTinChi, HocPhan> mapHocPhan = {};

  // Trạng thái tìm kiếm
  _Esc<HocKy?> searchHocKy = _Esc();
  _Esc<HocPhan?> searchHocPhan = _Esc();
  _Esc<_TT?> searchTrangThai = _Esc(values: withNull(_TT.values));

  // Trạng thái edit
  LopTinChi? editLopTinChi;
  TextEditingController editPhongHoc = TextEditingController();
  _Esc<int?> editTietBatDau = _Esc(values: _listTietHoc);
  _Esc<int?> editTietKetThuc = _Esc(values: _listTietHoc);
  _Esc<HocKy?> editHocKy = _Esc();
  _Esc<HocPhan?> editHocPhan = _Esc();
  _Esc<_TT> editTrangThai = _Esc(
    values: _TT.values,
    initialSelection: _TT.binhThuong,
  );
  _Esc<GiangVien?> editGiangVien = _Esc(
    labelFormatter: (GiangVien? gv) {
      if (gv == null) return "";
      return "${gv.hoTenChucDanh} (${gv.email})";
    },
  );

  // Cập nhật lớp học
  update() async {
    // Cập nhật cho GUI
    editLopTinChi = editLopTinChi?.copyWith(
      idGiangVien: editGiangVien.value?.id,
      trangThai: editTrangThai.value ?? _TT.binhThuong,
      hocKy: editHocKy.value?.hocKy,
      maHocPhan: editHocPhan.value?.maHocPhan,
    );

    // Cập nhật trên DB
    await editLopTinChi?.commitValue();

    // Load lại dữ liệu
    await refresh();
  }

  // Bỏ không chỉnh sửa lớp học nữa
  unedit() {
    editLopTinChi = null;
    editHocKy.value = searchHocKy.value;
    editGiangVien.value = null;
    editPhongHoc.text = "";
    editTietBatDau.value = null;
    editTietKetThuc.value = null;
    editHocKy.value = null;
    editTrangThai.value = _TT.binhThuong;
    notifyListeners();
  }

  // Chỉ định form chỉnh sửa lớp học
  edit(LopTinChi ltc) async {
    editLopTinChi = ltc;
    editHocKy.value = await ltc.hocKyObject;
    editGiangVien.value = await ltc.giangVien;
    editPhongHoc.text = ltc.phongHoc ?? "";
    editTietBatDau.value = ltc.tietBatDau;
    editTietKetThuc.value = ltc.tietKetThuc;
    editTrangThai.value = ltc.trangThai;
    notifyListeners();
  }

  // Lấy dữ liệu từ DB và load lên trang
  refresh() async {
    listLopTinChi = await getLopTinChi(
      hocKy: searchHocKy.value,
      hocPhan: searchHocPhan.value,
      trangThai: searchTrangThai.value,
    );
    mapGiangVien = {};
    mapHocPhan = {};
    for (final lopTinChi in listLopTinChi) {
      mapGiangVien[lopTinChi] = await lopTinChi.giangVien;
      mapHocPhan[lopTinChi] = await lopTinChi.hocPhan;
    }
    notifyListeners();
  }

  // Khởi tạo các chỉ mục dùng trong trang
  init() async {
    // Danh mục học kỳ
    List<HocKy?> listHocKy = (await domain.listHocKy()).reversed.toList();
    editHocKy.values = [null, for (final hk in listHocKy) hk];
    searchHocKy.values = [null, for (final hk in listHocKy) hk];
    searchHocKy.value = listHocKy.first;

    // Danh mục học phần
    List<HocPhan?> listHocPhan = await domain.listHocPhan();
    searchHocPhan.values = [null, for (final hk in listHocPhan) hk];
    editHocPhan.values = [null, for (final hk in listHocPhan) hk];

    // Danh mục giảng viên
    editGiangVien.values = [
      null,
      for (final gv in await domain.listGiangVien()) gv
    ];
    await refresh();
  }

  // Constructor
  _PageState() {
    init();
  }
}

class _EditPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_PageState>(context);
    final edit = model.editLopTinChi;
    return EzFixed(
      margin: EdgeInsets.all(0),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      direction: Axis.vertical,
      children: [
        EzHeader(text: "Thao tác", level: 0),
        if (edit != null)
          EzFlex(
            direction: Axis.horizontal,
            margin: EdgeInsets.all(0),
            children: [
              EzTextInput(
                label: "ID lớp đang sửa",
                placeholder: "${edit.id}",
                readOnly: true,
              ),
              OutlinedButton.icon(
                label: Text("Hủy"),
                onPressed: () => model.unedit(),
                icon: Icon(Icons.delete),
              )
            ],
          ),
        EzDropdown.fullWidth(
          label: "Học kỳ",
          controller: model.editHocKy,
        ),
        EzDropdown.fullWidth(
          label: "Học phần",
          controller: model.editHocPhan,
        ),
        EzTextInput(
          label: "Phòng học",
          controller: model.editPhongHoc,
        ),
        EzDropdown.fullWidth(
          label: "Tiết bắt đầu",
          controller: model.editTietBatDau,
        ),
        EzDropdown.fullWidth(
          label: "Tiết kết thúc",
          controller: model.editTietKetThuc,
        ),
        EzDropdown.fullWidth<GiangVien?>(
          label: "Giảng viên",
          controller: model.editGiangVien,
        ),
        EzDropdown.fullWidth<TrangThaiLopTinChi>(
          label: "Trạng thái",
          controller: model.editTrangThai,
        ),
        if (edit == null)
          OutlinedButton.icon(
            onPressed: () {} /* TODO */,
            label: Text("Thêm"),
            icon: Icon(Icons.add),
          )
        else
          OutlinedButton.icon(
            onPressed: () => model.update(),
            label: Text("Cập nhật"),
            icon: Icon(Icons.edit),
          ),
        OutlinedButton.icon(
          onPressed: () {} /* TODO */,
          label: Text("Import file đăng ký"),
          icon: Icon(Icons.upload),
        ),
        OutlinedButton.icon(
          onPressed: () {} /* TODO */,
          label: Text("Export file phân công"),
          icon: Icon(Icons.download),
        ),
      ],
    );
  }
}

class _SearchPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<_PageState>(
      builder: (context, model, child) {
        return EzFixed(
          margin: EdgeInsets.all(0),
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EzHeader(text: "Tìm kiếm", level: 0),
            EzDropdown.fullWidth(
              label: "Học kỳ",
              controller: model.searchHocKy,
              onSelected: (_) => model.refresh(),
            ),
            EzDropdown.fullWidth(
              label: "Học phần",
              controller: model.searchHocPhan,
              onSelected: (_) => model.refresh(),
            ),
            EzDropdown.fullWidth(
              label: "Trạng thái lớp",
              controller: model.searchTrangThai,
              onSelected: (_) => model.refresh(),
            ),
          ],
        );
      },
    );
  }
}

class _ClassTable extends StatelessWidget {
  static const columns = [
    ("Học kỳ", IntrinsicColumnWidth()),
    ("Mã lớp", IntrinsicColumnWidth()),
    ("Số TC", IntrinsicColumnWidth()),
    ("Mã học phần", IntrinsicColumnWidth()),
    ("Tên học phần", FlexColumnWidth()),
    ("Phòng học", IntrinsicColumnWidth()),
    ("Ngày", IntrinsicColumnWidth()),
    ("Tiết", IntrinsicColumnWidth()),
    ("Giảng viên", FlexColumnWidth()),
    ("Trạng thái", IntrinsicColumnWidth()),
    ("", IntrinsicColumnWidth()),
  ];

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_PageState>(context);
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          for (final (label, width) in columns)
            DataColumn(
              columnWidth: width,
              headingRowAlignment: MainAxisAlignment.spaceBetween,
              label: Text(
                label,
                style: TextStyle(
                  fontVariations: [FontVariation.weight(700)],
                ),
              ),
            ),
        ],
        rows: model.listLopTinChi.map((row) {
          final hocPhan = model.mapHocPhan[row];
          final giangVien = model.mapGiangVien[row];
          return DataRow(
            cells: [
              DataCell(Text(row.hocKy ?? "-")),
              DataCell(Text(row.maLopHoc ?? "-")),
              DataCell(Text(hocPhan?.soTinChi.toString() ?? "-")),
              DataCell(Text(hocPhan?.maHocPhan ?? "-")),
              DataCell(Text(hocPhan?.tenTiengViet ?? "-")),
              DataCell(Text(row.phongHoc ?? "")),
              DataCell(Text(row.ngayHoc?.toString() ?? "")),
              if (row.tietBatDau != null)
                DataCell(Text("${row.tietBatDau}-${row.tietKetThuc}"))
              else
                DataCell(Text("")),
              DataCell(Text(giangVien?.hoTenChucDanh ?? "-")),
              DataCell(Text(row.trangThai.toString())),
              DataCell(EzLink(
                text: "Sửa",
                onPressed: () => model.edit(row),
              )),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class PageLopTinChi extends StatelessWidget {
  static const routeName = "/index/lop-tin-chi";
  const PageLopTinChi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Lớp tín chỉ"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => _PageState(),
        child: EzFlex(
          flex: [2, 1],
          direction: Axis.horizontal,
          children: [
            EzFixed(
              margin: EdgeInsets.all(0),
              direction: Axis.vertical,
              spacing: 20,
              children: [
                _SearchPanel(),
                Expanded(
                  child: EzFixed(
                    margin: EdgeInsets.all(0),
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    direction: Axis.vertical,
                    children: [
                      EzHeader(text: "Kết quả tìm kiếm", level: 0),
                      Expanded(child: _ClassTable()),
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
