import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../custom_widgets.dart';

import '../business/domain_objects.dart';
import '../business/tuyen_sinh.dart';
import '../business/tuyen_sinh.dart' as domain;

const xetTuyenStoragePath = "/xt/storage/path";

const listXepLoai = ["Khá", "Giỏi", "Xuất sắc"];
final dateFormat = DateFormat("dd/MM/yyyy");

class _PageState extends ChangeNotifier {
  /// Chỉ mục
  List<HocVien> listCandidate = [];

  /// Trạng thái của form
  HocVien? editHocVien;
  final editSoHoSo = TextEditingController();
  final editHoTen = TextEditingController();
  final editDienThoai = TextEditingController();
  final editEmail = TextEditingController();
  final editGioiTinh = EzSelectionController(values: GioiTinh.values);
  final editNoiSinh = TextEditingController();
  final editTruongTotNghiepDaiHoc = TextEditingController();
  final editNganhTotNghiepDaiHoc = TextEditingController();
  final editHeTotNghiepDaiHoc = TextEditingController();
  final editXepLoaiTotNghiepDaiHoc = EzSelectionController(values: listXepLoai);
  final editNgaySinh = EzDateInputController();
  final editNgayTotNghiepDaiHoc = EzDateInputController();
  final editDinhHuongChuyenSau = TextEditingController();
  final editHocPhanDuocMien = TextEditingController();
  final editNganhDaoTaoThacSi = TextEditingController();
  final editDienTuyenSinh = EzSelectionController(values: DienTuyenSinh.values);
  final editTieuBanXetTuyen = EzSelectionController<TieuBanXetTuyen?>();

  final exportSaveDirectory = EzController<String>();

  /// Cập nhật GUI: đang chỉnh sửa học viên
  edit(HocVien hv) async {
    editHocVien = hv;
    editSoHoSo.text = hv.soHoSo ?? "";
    editHoTen.text = hv.hoTen;
    editDienThoai.text = hv.dienThoai ?? "";
    editEmail.text = hv.email ?? "";
    editGioiTinh.value = hv.gioiTinh;
    editNoiSinh.text = hv.noiSinh ?? "";
    editTruongTotNghiepDaiHoc.text = hv.truongTotNghiepDaiHoc ?? "";
    editNganhTotNghiepDaiHoc.text = hv.nganhTotNghiepDaiHoc ?? "";
    editHeTotNghiepDaiHoc.text = hv.heTotNghiepDaiHoc ?? "";
    editXepLoaiTotNghiepDaiHoc.value = hv.xepLoaiTotNghiepDaiHoc;
    editNgaySinh.value = hv.ngaySinh;
    editNgayTotNghiepDaiHoc.value = hv.ngayTotNghiepDaiHoc;
    editDinhHuongChuyenSau.text = hv.dinhHuongChuyenSau ?? "";
    editHocPhanDuocMien.text = hv.hocPhanDuocMien ?? "";
    editNganhDaoTaoThacSi.text = hv.nganhDaoTaoThacSi ?? "";
    editDienTuyenSinh.value = hv.dienTuyenSinh;
    editTieuBanXetTuyen.value =
        await TieuBanXetTuyen.getById(hv.idTieuBanXetTuyen);
    notifyListeners();
  }

  /// Cập nhật GUI: bỏ chỉnh sửa học viên và reset form
  unedit() {
    editHocVien = null;
    editSoHoSo.text = "";
    editHoTen.text = "";
    editDienThoai.text = "";
    editEmail.text = "";
    editGioiTinh.value = GioiTinh.nam;
    editNoiSinh.text = "";
    editTruongTotNghiepDaiHoc.text = "";
    editNganhTotNghiepDaiHoc.text = "";
    editHeTotNghiepDaiHoc.text = "";
    editXepLoaiTotNghiepDaiHoc.value = null;
    editNgaySinh.value = null;
    editNgayTotNghiepDaiHoc.value = null;
    editDinhHuongChuyenSau.text = "";
    editHocPhanDuocMien.text = "";
    editNganhDaoTaoThacSi.text = "";
    editDienTuyenSinh.value = DienTuyenSinh.xetTuyen;
    notifyListeners();
  }

  HocVien _dataFromEditState({int defaultId = -1}) {
    return HocVien(
      id: editHocVien?.id ?? defaultId,
      soHoSo: editSoHoSo.text,
      hoTen: editHoTen.text,
      dienThoai: editDienThoai.text,
      email: editEmail.text,
      gioiTinh: editGioiTinh.value,
      noiSinh: editNoiSinh.text,
      truongTotNghiepDaiHoc: editTruongTotNghiepDaiHoc.text,
      nganhTotNghiepDaiHoc: editNganhTotNghiepDaiHoc.text,
      heTotNghiepDaiHoc: editHeTotNghiepDaiHoc.text,
      xepLoaiTotNghiepDaiHoc: editXepLoaiTotNghiepDaiHoc.value,
      ngaySinh: editNgaySinh.value,
      ngayTotNghiepDaiHoc: editNgayTotNghiepDaiHoc.value,
      dinhHuongChuyenSau: editDinhHuongChuyenSau.text,
      hocPhanDuocMien: editHocPhanDuocMien.text,
      idTieuBanXetTuyen: editTieuBanXetTuyen.value?.id,
      nganhDaoTaoThacSi: editNganhDaoTaoThacSi.text,
      idDienTuyenSinh: editDienTuyenSinh.value,
      maTrangThai: TrangThaiHocVien.xetTuyen,
    );
  }

  /// Thêm hồ sơ
  Future<void> create() async {
    final hocVien = _dataFromEditState();
    await hocVien.create();
    unedit();
    await _initAsync();
  }

  // Update hồ sơ
  Future<void> update() async {
    final hocVien = _dataFromEditState();
    await hocVien.update();
    await _initAsync();
  }

  // Xóa hồ sơ
  Future<HocVien> delete(HocVien hocVien) async {
    await hocVien.delete();
    await _initAsync();
    return hocVien;
  }

  /// Export hồ sơ tuyển sinh
  exportFiles({
    required ScaffoldMessengerState scaffoldMessenger,
  }) async {
    switch ((exportSaveDirectory.value, editTieuBanXetTuyen.value)) {
      case (String saveDir, TieuBanXetTuyen tb):
        saveBienBanTuyenSinh(
          saveDirectory: saveDir,
          listCandidates: listCandidate,
          tb: tb,
        );
        scaffoldMessenger.showMessage("Đã lưu");
      case (_, TieuBanXetTuyen _):
        scaffoldMessenger.showMessage("Chọn thư mục lưu trước!");
      case (String _, _):
        scaffoldMessenger.showMessage("Chọn tiểu ban xét tuyển trước!");
    }
  }

  /// Tải hồ sơ học viên
  downloadStudentFiles({
    required ScaffoldMessengerState scaffoldMessenger,
  }) async {
    final listCandidateXetTuyen = [
      for (HocVien student in listCandidate)
        if (student.dienTuyenSinh == DienTuyenSinh.xetTuyen) student
    ];
    switch (exportSaveDirectory.value) {
      case String saveDir:
        for (final student in listCandidateXetTuyen) {
          final (success, error) = await downloadAdmissionFiles(
            student: student,
            outputDirectory: saveDir,
          );
          if (success) {
            scaffoldMessenger
                .showMessage("Đã tải hồ sơ ứng viên ${student.hoTen}!");
          } else {
            scaffoldMessenger.showMessage(
                "Xảy ra lỗi khi tải hồ sơ ứng viên ${student.hoTen}! ($error)");
          }
        }
      default:
        scaffoldMessenger.showMessage("Chọn thư mục lưu trước!");
    }
  }

  /// Khởi tạo, constructor không được async, nên...
  _initAsync() async {
    listCandidate = await domain.fetchCandidates();
    editTieuBanXetTuyen.values = await TieuBanXetTuyen.all();
    notifyListeners();
  }

  _PageState() {
    _initAsync();
  }
}

class _PanelListCandidateState extends State<_PanelListCandidate> {
  static const columns = [
    ("MHS", "Mã hồ sơ", IntrinsicColumnWidth()),
    ("Họ và tên", null, IntrinsicColumnWidth()),
    ("Email", null, IntrinsicColumnWidth()),
    ("SĐT", "Số điện thoại", IntrinsicColumnWidth()),
    ("Nơi sinh", null, IntrinsicColumnWidth()),
    ("Ngày sinh", null, IntrinsicColumnWidth()),
    (
      "Tích hợp",
      "Hồ sơ Tích hợp Cử nhân - Thạc sĩ",
      IntrinsicColumnWidth(),
    ),
    ("BCN", "Bằng cử nhân", IntrinsicColumnWidth()),
    ("PLVB", "Phụ lục văn bằng cử nhân", IntrinsicColumnWidth()),
    ("CCNN", "Chứng chỉ ngoại ngữ", IntrinsicColumnWidth()),
    ("Xóa", null, IntrinsicColumnWidth()),
    ("Sửa", null, IntrinsicColumnWidth()),
  ];

  DataRow buildRow(context, HocVien hv) {
    final sm = ScaffoldMessenger.of(context);
    final model = Provider.of<_PageState>(context);

    final openDegreeButton = EzLink(
      text: "Xem",
      onPressed: () => openBachelorDegree(hv.soHoSo),
    );
    final openDegreeAppendixButton = EzLink(
      text: "Xem",
      onPressed: () => openDegreeAppendix(hv.soHoSo),
    );
    final openEnglishCertButton = EzLink(
      text: "Xem",
      onPressed: () => openEnglishCert(hv.soHoSo),
    );

    final deleteButton = EzLink(
      text: "Xóa",
      onPressed: () => model
          .delete(hv)
          .then((hv) => sm.showMessage("Đã xóa hồ sơ ${hv.hoTen}")),
    );

    final editButton = EzLink(
      text: "Sửa",
      onPressed: () => model.edit(hv),
    );

    return DataRow(
      cells: [
        DataCell(EzCopy(hv.soHoSo ?? "")),
        DataCell(EzCopy(hv.hoTen)),
        DataCell(EzCopy(hv.email ?? "")),
        DataCell(EzCopy(hv.dienThoai ?? "")),
        DataCell(EzCopy(hv.noiSinh ?? "")),
        DataCell(EzDmyText(hv.ngaySinh)),
        DataCell(
          Checkbox(
            value: (hv.dienTuyenSinh == DienTuyenSinh.tichHop),
            onChanged: null,
          ),
        ),
        DataCell(openDegreeButton),
        DataCell(openDegreeAppendixButton),
        DataCell(openEnglishCertButton),
        DataCell(deleteButton),
        DataCell(editButton),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_PageState>(context);
    return Expanded(
      child: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: 0,
          columnSpacing: 20,
          columns: [
            for (final (columnName, tooltip, columnWidth) in columns)
              DataColumn(
                headingRowAlignment: MainAxisAlignment.spaceBetween,
                tooltip: tooltip,
                columnWidth: columnWidth,
                label: Text(columnName),
              )
          ],
          rows: [
            for (final row in state.listCandidate)
              buildRow(
                context,
                row,
              ),
          ],
        ),
      ),
    );
  }
}

class _PanelListCandidate extends StatefulWidget {
  @override
  State<_PanelListCandidate> createState() => _PanelListCandidateState();
}

class _EditPanelAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sm = ScaffoldMessenger.of(context);
    final model = Provider.of<_PageState>(context);
    final editHocVien = model.editHocVien;
    return EzFixed(
      margin: EdgeInsets.all(0),
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (editHocVien == null)
          FilledButton.icon(
            onPressed: () => model.create(),
            icon: Icon(Icons.add),
            label: Text("Thêm hồ sơ"),
          )
        else
          FilledButton.icon(
            onPressed: () => model
                .update()
                .then((hv) => sm.showMessage("Đã cập nhật hồ sơ học viên")),
            icon: Icon(Icons.update),
            label: Text("Cập nhật"),
          ),
        OutlinedButton.icon(
          onPressed: () => model.unedit(),
          icon: Icon(Icons.refresh),
          label: Text("Xóa form"),
        ),
      ],
    );
  }
}

class _EditPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_PageState>(context);
    final editHocVien = model.editHocVien;
    return EzFixed(
      margin: EdgeInsets.all(0),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      direction: Axis.vertical,
      children: [
        // Mã hồ sơ tùy theo chế độ thêm or sửa
        if (editHocVien == null)
          EzTextInput(
            label: "Số hồ sơ",
            controller: model.editSoHoSo,
          )
        else
          EzFlex(
            margin: EdgeInsets.all(0),
            direction: Axis.horizontal,
            children: [
              EzTextInput(
                label: "Số hồ sơ",
                readOnly: true,
                controller: model.editSoHoSo,
              ),
              OutlinedButton.icon(
                onPressed: () => model.unedit(),
                label: Text("Hủy chỉnh sửa"),
              ),
            ],
          ),

        // Thông tin khác
        EzTextInput(
          label: "Tên học viên:",
          controller: model.editHoTen,
        ),
        EzDropdown.fullWidth(
          label: "Giới tính",
          controller: model.editGioiTinh,
        ),
        EzDateInput(
          label: "Ngày sinh",
          controller: model.editNgaySinh,
        ),
        EzTextInput(
          label: "Nơi sinh",
          controller: model.editNoiSinh,
        ),
        EzTextInput(
          label: "Email",
          controller: model.editEmail,
        ),
        EzTextInput(
          label: "Điện thoại",
          controller: model.editDienThoai,
        ),
        EzTextInput(
          label: "Trường tốt nghiệp đại học",
          controller: model.editTruongTotNghiepDaiHoc,
        ),
        EzTextInput(
          label: "Ngành tốt nghiệp",
          controller: model.editNganhTotNghiepDaiHoc,
        ),
        EzTextInput(
          label: "Hệ tốt nghiệp đại học",
          controller: model.editHeTotNghiepDaiHoc,
        ),
        EzDateInput(
          label: "Ngày tốt nghiệp đại học",
          controller: model.editNgayTotNghiepDaiHoc,
        ),
        EzDropdown.fullWidth(
          label: "Xếp loại tốt nghiệp đại học",
          controller: model.editXepLoaiTotNghiepDaiHoc,
        ),
        EzTextInput(
          label: "Ngành đào tạo thạc sĩ",
          controller: model.editNganhDaoTaoThacSi,
        ),
        EzTextInput(
          label: "Định hướng chuyên sâu (nếu có)",
          controller: model.editDinhHuongChuyenSau,
        ),
        EzDropdown.fullWidth<TieuBanXetTuyen?>(
          label: "Tiểu ban xét tuyển",
          controller: model.editTieuBanXetTuyen,
        ),
        EzTextInput(
          label: "Học phần được miễn",
          controller: model.editHocPhanDuocMien,
        ),
        EzDropdown.fullWidth(
          label: "Diện tuyển sinh",
          controller: model.editDienTuyenSinh,
        ),
      ],
    );
  }
}

class _ActionPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<_PageState>(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return EzFixed(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      margin: EdgeInsets.all(0),
      children: [
        EzFilePicker(
          controller: pageState.exportSaveDirectory,
          isDirectory: true,
          label: "Thư mục lưu",
          onSelected: (value) async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setString(xetTuyenStoragePath, value);
          },
        ),
        FilledButton.icon(
          onPressed: () async {
            await pageState.exportFiles(
              scaffoldMessenger: scaffoldMessenger,
            );
          },
          icon: Icon(Icons.download),
          label: Text("Export biểu mẫu tuyển sinh"),
        ),
        FilledButton.icon(
          onPressed: () async {
            await pageState.downloadStudentFiles(
              scaffoldMessenger: scaffoldMessenger,
            );
          },
          icon: Icon(Icons.download),
          label: Text("Download hồ sơ xét tuyển"),
        ),
      ],
    );
  }
}

class PageXetTuyen extends StatelessWidget {
  const PageXetTuyen({super.key});

  static const routeName = "/xet-tuyen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xét tuyển cao học"),
        leading: BackButton(),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => _PageState(),
          ),
        ],
        builder: (context, _) {
          return EzFlex(
            direction: Axis.horizontal,
            flex: [2, 1],
            children: [
              EzFixed(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EzHeader(text: "Danh sách xét tuyển", level: 0),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _PanelListCandidate(),
                    ),
                  ),
                ],
              ),
              EzFlex(
                flex: [0, 1, 0, 0, 0],
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                direction: Axis.vertical,
                children: [
                  EzHeader(text: "Thông tin học viên", level: 0),
                  SingleChildScrollView(
                    child: _EditPanel(),
                  ),
                  _EditPanelAction(),
                  EzHeader(text: "Hành động", level: 0),
                  _ActionPanel(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

/* TODO: code cũ */
//         ListTile(
//           title: _PageWidget<(List<HocVien>?, String?)>(
//             selector: (_, model) {
//               return (model.listCandidate, model.saveDirectory.value);
//             },
//             builder: (_, data, __) {
//               var onPressed = switch (data) {
//                 (List<HocVien> listStudents, String saveDirectory) => () async {
//                     scaffoldMessenger.showSnackBar(SnackBar(
//                       content:
//                           Text("File tuyển sinh sẽ được tải về $saveDirectory"),
//                     ));
//                     for (final student in listStudents) {
//                       final (success, error) = await downloadAdmissionFiles(
//                         student: student,
//                         outputDirectory: saveDirectory,
//                       );
//                       if (success) {
//                         scaffoldMessenger.showSnackBar(SnackBar(
//                           content: Text(
//                               "Đã tải hồ sơ của học viên ${student.hoTen}"),
//                         ));
//                       } else {
//                         scaffoldMessenger.showSnackBar(SnackBar(
//                           content: Text(
//                               "Có lỗi khi tải hồ sơ của học viên ${student.hoTen}: $error"),
//                         ));
//                       }
//                     }
//                   },
//                 _ => null,
//               };
//               return ElevatedButton(
//                 onPressed: onPressed,
//                 child: Text("Tải hồ sơ học viên"),
//               );
//             },
//           ),
//         ),
//         ListTile(
//           title: _PageWidget<(List<HocVien>, String?)>(
//             selector: (_, model) {
//               return (model.listCandidate, model.saveDirectory.value);
//             },
//             builder: (_, data, __) => ElevatedButton(
//               onPressed: switch (data) {
//                 (List<HocVien> candidates, String saveDirectory) => () async {
//                     final tb = pageState.tieuBanXetTuyen.value;
//                     if (tb == null) return;
//                     saveBienBanTuyenSinh(
//                       saveDirectory: saveDirectory,
//                       listCandidates: candidates,
//                       tb: tb,
//                     );
//                   },
//                 _ => null,
//               },
//               child: Text("Lưu giấy tờ xét tuyển"),
//             ),
//           ),
//         ),
