import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../business/lop_tin_chi.dart' as domain;
import '../business/lop_tin_chi.dart';
import '../custom_widgets.dart';

const strings = (
  // Thông báo
  msgSelectTerm: "Vui lòng chọn năm học trước",
  msgNotImplemented: "Tính năng này chưa được cài đặt",
  msgCopySuccess: "Copy thành công, dùng Ctrl+Shift+V để paste vào bảng tính",
  // Hỗ trợ
  tooltipCopyTable: "Copy bảng phân công",
  tooltipCopyTitle: "Copy tiêu đề bảng phân công",
  tooltipCopyDatePeriod: "Copy thời gian giảng dạy",
);

const List<NgayTrongTuan?> _listNgayHoc = [null, ...NgayTrongTuan.values];
const List<int?> _listTietHoc = [null, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
List<T?> withNull<T>(List<T> items) {
  return [null, for (final item in items) item];
}

typedef _Esc<T> = EzSelectionController<T>;

typedef _TT = TrangThaiLopTinChi;

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
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: _ClassTable(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _EditPanel(),
          ],
        ),
      ),
    );
  }
}

class _ClassTable extends StatelessWidget {
  static const columns = [
    ("Học kỳ", IntrinsicColumnWidth()),
    ("Mã lớp", IntrinsicColumnWidth()),
    ("Số TC", IntrinsicColumnWidth()),
    ("Số HV", IntrinsicColumnWidth()),
    ("Mã học phần", IntrinsicColumnWidth()),
    ("Tên học phần", IntrinsicColumnWidth()),
    ("Phòng học", IntrinsicColumnWidth()),
    ("Ngày", IntrinsicColumnWidth()),
    ("Tiết", IntrinsicColumnWidth()),
    ("URL", IntrinsicColumnWidth()),
    ("Giảng viên", IntrinsicColumnWidth()),
    ("Email", IntrinsicColumnWidth()),
    ("Trạng thái", IntrinsicColumnWidth()),
    ("", IntrinsicColumnWidth()),
  ];

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_PageState>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
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
          final soHocVien = model.mapCount[row];
          return DataRow(
            selected: model.editLopTinChi == row,
            onSelectChanged: (_) => model.edit(row),
            cells: [
              DataCell(EzCopy(row.hocKy ?? "-")),
              DataCell(EzCopy(row.maLopHoc ?? "-")),
              DataCell(EzCopy(hocPhan?.soTinChi.toString() ?? "-")),
              DataCell(EzCopy(soHocVien.toString())),
              DataCell(EzCopy(hocPhan?.maHocPhan ?? "-")),
              DataCell(EzCopy(hocPhan?.tenTiengViet ?? "-")),
              DataCell(EzCopy(row.phongHoc ?? "")),
              DataCell(EzCopy(row.ngayHoc?.toString() ?? "")),
              if (row.tietBatDau != null)
                DataCell(EzCopy("${row.tietBatDau}-${row.tietKetThuc}"))
              else
                DataCell(EzCopy("")),
              DataCell(EzCopy(row.urlTruyCap ?? "")),
              DataCell(EzCopy(giangVien?.hoTenChucDanh ?? "-")),
              DataCell(EzCopy(giangVien?.email ?? "-")),
              DataCell(EzCopy(row.trangThai.toString())),
              DataCell(
                EzLink(
                  text: "Sửa",
                  onPressed: () => model.edit(row),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _EditPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sm = ScaffoldMessenger.of(context);
    final model = Provider.of<_PageState>(context);
    final edit = model.editLopTinChi;
    return SingleChildScrollView(
      child: EzFixed(
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
                ),
              ],
            ),
          EzDropdown.fullWidth(
            label: "Học kỳ",
            controller: model.editHocKy,
            onSelected: (hocKy) => model.notify(),
          ),
          EzDropdown.fullWidth(
            label: "Học phần",
            controller: model.editHocPhan,
          ),
          EzTextInput(
            label: "Mã lớp học",
            controller: model.editMaLop,
          ),
          EzTextInput(
            label: "Phòng học",
            controller: model.editPhongHoc,
          ),
          EzDropdown.fullWidth(
            label: "Ngày học",
            controller: model.editNgayHoc,
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
          EzTextInput(
            label: "URL truy cập",
            controller: model.editUrlTruyCap,
          ),
          if (edit == null)
            OutlinedButton.icon(
              onPressed: () => model.themLop(),
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
            onPressed: switch (model.editHocKy.value) {
              null => null,
              _ => () => model.importLop(),
            },
            label: Text("Import file đăng ký"),
            icon: Icon(Icons.upload),
          ),
          OutlinedButton.icon(
            onPressed: () {
              sm.showMessage(strings.msgNotImplemented);
            } /* TODO */,
            label: Text("Export file phân công"),
            icon: Icon(Icons.download),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              if (await model.copyBm09Title()) {
                sm.showMessage(strings.msgCopySuccess);
              } else {
                sm.showMessage(strings.msgSelectTerm);
              }
            },
            label: Text("Copy tiêu đề bảng"),
            icon: Icon(Icons.content_copy),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              if (await model.copyBm09DatePreriod()) {
                sm.showMessage(strings.msgCopySuccess);
              } else {
                sm.showMessage(strings.msgSelectTerm);
              }
            },
            label: Text("Copy thời gian học"),
            icon: Icon(Icons.content_copy),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              if (await model.copyBm09Text()) {
                sm.showMessage(strings.msgCopySuccess);
              } else {
                sm.showMessage(strings.msgSelectTerm);
              }
            },
            label: Text("Copy nội dung phân công"),
            icon: Icon(Icons.content_copy),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              if (await model.copyUrlNotificationText()) {
                sm.showMessage(strings.msgCopySuccess);
              } else {
                sm.showMessage(strings.msgSelectTerm);
              }
            },
            label: Text("Copy thông báo cho học viên"),
            icon: Icon(Icons.content_copy),
          ),
        ],
      ),
    );
  }
}

class _PageState extends ChangeNotifier {
  // Các chỉ mục
  List<LopTinChi> listLopTinChi = [];
  Map<LopTinChi, GiangVien?> mapGiangVien = {};
  Map<LopTinChi, HocPhan> mapHocPhan = {};
  Map<LopTinChi, int> mapCount = {};

  // Trạng thái tìm kiếm
  _Esc<HocKy?> searchHocKy = _Esc();
  _Esc<HocPhan?> searchHocPhan = _Esc();
  _Esc<_TT?> searchTrangThai = _Esc(values: withNull(_TT.values));

  // Trạng thái edit
  LopTinChi? editLopTinChi;
  TextEditingController editUrlTruyCap = TextEditingController();
  TextEditingController editPhongHoc = TextEditingController();
  TextEditingController editMaLop = TextEditingController();
  _Esc<int?> editTietBatDau = _Esc(values: _listTietHoc);
  _Esc<int?> editTietKetThuc = _Esc(values: _listTietHoc);
  _Esc<NgayTrongTuan?> editNgayHoc = _Esc(values: _listNgayHoc);
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

  // Constructor
  _PageState() {
    init();
  }

  /// Copy thời gian học
  Future<bool> copyBm09DatePreriod() async {
    switch (searchHocKy.value) {
      case HocKy hocKy:
        final thoiGianHoc = hocKy.thoiGianHoc;
        final content = "Thời gian học: $thoiGianHoc";
        final clipboardData = ClipboardData(text: content);
        await Clipboard.setData(clipboardData);
        return true;
      case null:
        return false;
    }
  }

  /// Copy nội dung phân công
  Future<bool> copyBm09Text() async {
    switch (searchHocKy.value) {
      case HocKy hocKy:
        String content = await makeBm09String(
          hocKy: hocKy,
          listLopTinChi: listLopTinChi,
        );
        final clipboardData = ClipboardData(text: content);
        await Clipboard.setData(clipboardData);
        return true;
      case null:
        return false;
    }
  }

  /// Copy tiêu đề phân công
  Future<bool> copyBm09Title() async {
    switch (searchHocKy.value) {
      case HocKy hocKy:
        final dotHoc = hocKy.hocKy;
        final namHoc = hocKy.namHoc;
        final content =
            "BẢNG PHÂN CÔNG ĐĂNG KÝ GIẢNG DẠY CAO HỌC - HỌC KỲ $dotHoc - NĂM HỌC $namHoc";
        final clipboardData = ClipboardData(text: content);
        await Clipboard.setData(clipboardData);
        return true;
      case null:
        return false;
    }
  }

  /// Copy nội dung phân công
  Future<bool> copyUrlNotificationText() async {
    String content = await makeNotificationText(
      listLopTinChi: listLopTinChi,
    );
    final clipboardData = ClipboardData(text: content);
    await Clipboard.setData(clipboardData);
    return true;
  }

  // Chỉ định form chỉnh sửa lớp học
  Future<void> edit(LopTinChi ltc) async {
    editLopTinChi = ltc;
    ezSetValue(editHocKy, await ltc.hocKyObject);
    ezSetValue(editHocPhan, await ltc.hocPhan);
    ezSetValue(editGiangVien, await ltc.giangVien);
    ezSetValue(editMaLop, ltc.maLopHoc);
    ezSetValue(editPhongHoc, ltc.phongHoc);
    ezSetValue(editNgayHoc, ltc.ngayHoc);
    ezSetValue(editUrlTruyCap, ltc.urlTruyCap);
    ezSetValue(editTietBatDau, ltc.tietBatDau);
    ezSetValue(editTietKetThuc, ltc.tietKetThuc);
    ezSetValue(editTrangThai, ltc.trangThai);
    notifyListeners();
  }

  Future<bool> importLop() async {
    final pickerResult = await FilePicker.platform.pickFiles(
      dialogTitle: "Chọn file danh sách",
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ["xlsx"],
    );
    final maybeFile = pickerResult?.paths.single;

    switch ((maybeFile, editHocKy.value)) {
      case (String file, HocKy hocKy):
        await domain.importFromBangDiem(file, hocKy);
        refresh();
        return true;
      default:
        print((maybeFile, editHocKy.value));
        return false;
    }
  }

  // Khởi tạo các chỉ mục dùng trong trang
  Future<void> init() async {
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
      for (final gv in await domain.listGiangVien()) gv,
    ];
    await refresh();
  }

  Future<void> notify() async {
    notifyListeners();
  }

  // Lấy dữ liệu từ DB và load lên trang
  Future<void> refresh() async {
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
      mapCount[lopTinChi] = await lopTinChi.soLuongHocVien;
    }
    notifyListeners();
  }

  Future<void> themLop() async {
    LopTinChi ltc = _valueFromEdits();
    await ltc.create();
    await refresh();
  }

  // Bỏ không chỉnh sửa lớp học nữa
  void unedit() {
    editLopTinChi = null;
    ezSetValue(editHocKy, searchHocKy.value);
    ezSetValue(editGiangVien, null);
    ezSetValue(editPhongHoc, "");
    ezSetValue(editHocPhan, null);
    ezSetValue(editMaLop, "");
    ezSetValue(editNgayHoc, null);
    ezSetValue(editTietBatDau, null);
    ezSetValue(editTietKetThuc, null);
    ezSetValue(editHocKy, null);
    ezSetValue(editTrangThai, _TT.binhThuong);
    ezSetValue(editUrlTruyCap, "");
    notifyListeners();
  }

  // Cập nhật lớp học
  Future<void> update() async {
    // Cập nhật trên DB
    editLopTinChi = _valueFromEdits();
    await editLopTinChi?.update();

    // Load lại dữ liệu
    await refresh();
  }

  domain.LopTinChi _valueFromEdits() {
    return LopTinChi(
      id: editLopTinChi?.id ?? -1,
      hocKy: ezGetValue<HocKy?>(editHocKy)?.hocKy,
      maLopHoc: ezGetValue(editMaLop),
      maHocPhan: (ezGetValue<HocPhan?>(editHocPhan) as HocPhan).maHocPhan,
      idGiangVien: ezGetValue<GiangVien?>(editGiangVien)?.id,
      phongHoc: ezGetValue(editPhongHoc),
      ngayHoc: ezGetValue<NgayTrongTuan?>(editNgayHoc),
      tietBatDau: ezGetValue<int?>(editTietBatDau),
      tietKetThuc: ezGetValue<int?>(editTietKetThuc),
      urlTruyCap: ezGetValue<String?>(editUrlTruyCap),
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
