import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../custom_widgets.dart';
import '../datamodels.dart';
import '../printers.dart';

part 'xet_tuyen_state.dart';

typedef _FormWidget<T> = Selector<_FormState, T>;
typedef _PageWidget<T> = Selector<_State, T>;

class _PanelListCandidateState extends State<_PanelListCandidate> {
  static const cols = [
    "Mã hồ sơ",
    "Họ tên",
    "Email",
    "SĐT",
    "Nơi sinh",
    "Ngày sinh",
    "",
  ];

  DataRow buildRow(context, HocVien hv) {
    final sm = ScaffoldMessenger.of(context);
    final state = _State.of(context);
    final formState = Provider.of<_FormState>(
      context,
      listen: false,
    );
    final openDegreeButton = EzLink(
      text: "Bằng CN",
      onPressed: () => openBachelorDegree(hv.soHoSo),
    );
    final openDegreeAppendixButton = EzLink(
      text: "Phụ lục VB",
      onPressed: () => openDegreeAppendix(hv.soHoSo),
    );
    final openEnglishCertButton = EzLink(
      text: "Chứng chỉ NN",
      onPressed: () => openEnglishCert(hv.soHoSo),
    );

    final deleteButton = EzLink(
      text: "Xóa",
      onPressed: () async {
        final db = await openDatabase(databasePath);
        await db.delete(
          "HocVien",
          where: "id = ?",
          whereArgs: [hv.id],
        );
        await state.refresh();
        await db.close();
        sm.showSnackBar(
          SnackBar(
            content: Text("Đã xóa ứng viên ${hv.hoTen}"),
          ),
        );
      },
    );

    final editButton = EzLink(
      text: "Sửa",
      onPressed: () => formState.edit(hv),
    );
    final buttons = Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        openDegreeButton,
        openDegreeAppendixButton,
        openEnglishCertButton,
        deleteButton,
        editButton,
      ],
    );
    return DataRow(
      cells: [
        DataCell(EzCopy(hv.soHoSo ?? "")),
        DataCell(EzCopy(hv.hoTen)),
        DataCell(EzCopy(hv.email ?? "")),
        DataCell(EzCopy(hv.dienThoai ?? "")),
        DataCell(EzCopy(hv.noiSinh ?? "")),
        DataCell(EzCopy(hv.ngaySinh?.toDmy() ?? "")),
        DataCell(buttons),
      ],
    );
  }

  Widget listCandidate(context, List<HocVien> value, child) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [for (final col in cols) DataColumn(label: Text(col))],
          rows: [
            for (final row in value) buildRow(context, row),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EzHeader(text: "Danh sách xét tuyển", level: 0),
        _PageWidget<List?>(
          selector: (_, model) => model.listCandidate,
          builder: (context, value, child) => switch (value) {
            null => CircularProgressIndicator(),
            List<HocVien> candidates => listCandidate(
                context,
                candidates,
                child,
              ),
            _ => Text("Error"),
          },
        ),
      ],
    );
  }
}

class _PanelListCandidate extends StatefulWidget {
  @override
  State<_PanelListCandidate> createState() => _PanelListCandidateState();
}

class _PanelThemHocVien extends StatelessWidget {
  Future<void> callbackThemHocVien({
    required scaffoldMessenger,
    required formState,
    required pageState,
  }) async {
    final (rowAffected, errors) = await formState.themHocVien();
    if (errors != null) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(errors),
      ));
    } else {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text("Thêm học viên thành công"),
      ));
      formState.reset();
      pageState.refresh();
    }
  }

  Future<void> callbackUpdateHocVien({
    required formState,
    required pageState,
    required scaffoldMessenger,
  }) async {
    final (rowAffected, errors) = await formState.updateHocVien();
    if (errors != null) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(errors),
      ));
    } else {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text("Cập nhật học viên thành công"),
      ));
      formState.reset();
      pageState.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _FormState formState = _FormState.of(context);
    final pageState = _State.of(context);

    final scaffoldMessenger = getMessenger(context);
    return FocusTraversalGroup(
      child: Consumer<_FormState>(
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                EzHeader(text: "Thông tin học viên", level: 0),
                ListTile(
                  title: EzTextInput(
                    label: "Số hồ sơ",
                    readOnly: formState.mode == _FormMode.update,
                    controller: formState.soHoSo,
                  ),
                ),
                ListTile(
                  title: EzTextInput(
                    label: "Tên học viên:",
                    controller: formState.hoTen,
                  ),
                ),
                ListTile(
                  title: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return EzDropdown(
                        width: constraints.maxWidth,
                        label: "Giới tính",
                        values: ["Nam", "Nữ"],
                        controller: formState.gioiTinh,
                      );
                    },
                  ),
                ),
                ListTile(
                  title: EzDatePicker(
                    label: "Ngày sinh",
                    controller: formState.ngaySinh,
                  ),
                ),
                ListTile(
                  title: EzTextInput(
                    label: "Email",
                    controller: formState.email,
                  ),
                ),
                ListTile(
                  title: EzTextInput(
                    label: "Điện thoại",
                    controller: formState.dienThoai,
                  ),
                ),
                ListTile(
                  title: EzTextInput(
                    label: "Trường tốt nghiệp đại học",
                    controller: formState.truongTotNghiepDaiHoc,
                  ),
                ),
                ListTile(
                  title: EzTextInput(
                    label: "Ngành tốt nghiệp",
                    controller: formState.nganhTotNghiepDaiHoc,
                  ),
                ),
                ListTile(
                  title: EzTextInput(
                    label: "Hệ tốt nghiệp đại học",
                    controller: formState.heTotNghiepDaiHoc,
                  ),
                ),
                ListTile(
                  title: EzDatePicker(
                    label: "Ngày tốt nghiệp đại học",
                    controller: formState.ngayTotNghiepDaiHoc,
                  ),
                ),
                ListTile(
                  title: LayoutBuilder(
                    builder: (context, constraint) {
                      return EzDropdown(
                        width: constraint.maxWidth,
                        values: ["Khá", "Giỏi", "Xuất sắc"],
                        label: "Xếp loại tốt nghiệp đại học",
                        controller: formState.xepLoaiTotNghiepDaiHoc,
                      );
                    },
                  ),
                ),
                ListTile(
                  title: EzTextInput(
                    label: "Ngành đào tạo thạc sĩ",
                    controller: formState.nganhDaoTaoThacSi,
                  ),
                ),
                ListTile(
                  title: EzTextInput(
                    label: "Định hướng chuyên sâu (nếu có)",
                    controller: formState.dinhHuongChuyenSau,
                  ),
                ),
                ListTile(
                  title: LayoutBuilder(
                    builder: (context, constraint) {
                      return _PageWidget<List<TieuBanXetTuyen>>(
                        selector: (_, model) => model.allTieuBanXetTuyen,
                        builder: (_, allTieuBanXetTuyen, __) {
                          return EzDropdown<TieuBanXetTuyen>(
                            width: constraint.maxWidth,
                            label: "Tiểu ban xét tuyển",
                            values: allTieuBanXetTuyen,
                            controller: pageState.tieuBanXetTuyen,
                          );
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: EzTextInput(
                    label: "Học phần được miễn",
                    controller: formState.hocPhanDuocMien,
                  ),
                ),
                ListTile(
                  title: ElevatedButton(
                    onPressed: () => formState.reset(),
                    child: Tooltip(
                      message:
                          "Xóa những thông tin trên form, không phải trong CSDL",
                      child: Text("Xóa thông tin"),
                    ),
                  ),
                ),
                ListTile(
                  title: ElevatedButton(
                    onPressed: switch (formState.mode) {
                      _FormMode.create => () async {
                          await callbackThemHocVien(
                            scaffoldMessenger: scaffoldMessenger,
                            formState: formState,
                            pageState: pageState,
                          );
                        },
                      _ => null,
                    },
                    child: Text("Thêm học viên"),
                  ),
                ),
                ListTile(
                  title: ElevatedButton(
                    onPressed: switch ((
                      formState.mode,
                      pageState.tieuBanXetTuyen.value
                    )) {
                      (_FormMode.update, TieuBanXetTuyen tb) => () async {
                          await formState.updateHocVien(tb);
                          pageState.refresh();
                        },
                      _ => null,
                    },
                    child: Tooltip(
                      message: "Sửa thông tin",
                      child: Text("Cập nhật"),
                    ),
                  ),
                ),
                Divider(height: 40),
                EzHeader(text: "Thao tác", level: 0),
                ListTile(
                  title: EzFilePicker(
                    controller: pageState.saveDirectory,
                    isDirectory: true,
                    label: "Thư mục lưu",
                    onSelected: (_) => pageState.refresh(),
                  ),
                ),
                ListTile(
                  title: _PageWidget<(List<HocVien>?, String?)>(
                    selector: (_, model) {
                      return (model.listCandidate, model.saveDirectory.value);
                    },
                    builder: (_, data, __) {
                      var onPressed = switch (data) {
                        (List<HocVien> listStudents, String saveDirectory) =>
                          () async {
                            scaffoldMessenger.showSnackBar(SnackBar(
                              content: Text(
                                  "File tuyển sinh sẽ được tải về $saveDirectory"),
                            ));
                            for (final student in listStudents) {
                              final (success, error) =
                                  await downloadAdmissionFiles(
                                student: student,
                                outputDirectory: saveDirectory,
                              );
                              if (success) {
                                scaffoldMessenger.showSnackBar(SnackBar(
                                  content: Text(
                                      "Đã tải hồ sơ của học viên ${student.hoTen}"),
                                ));
                              } else {
                                scaffoldMessenger.showSnackBar(SnackBar(
                                  content: Text(
                                      "Có lỗi khi tải hồ sơ của học viên ${student.hoTen}: $error"),
                                ));
                              }
                            }
                          },
                        _ => null,
                      };
                      return ElevatedButton(
                        onPressed: onPressed,
                        child: Text("Tải hồ sơ học viên"),
                      );
                    },
                  ),
                ),
                ListTile(
                  title: _PageWidget<(List<HocVien>?, String?)>(
                    selector: (_, model) {
                      return (model.listCandidate, model.saveDirectory.value);
                    },
                    builder: (_, data, __) => ElevatedButton(
                      onPressed: switch (data) {
                        (List<HocVien> candidates, String saveDirectory) =>
                          () async {
                            final tb = pageState.tieuBanXetTuyen.value;
                            if (tb == null) {
                              return;
                            }

                            await buildBang2DanhSachThiSinh(
                              candidates: candidates,
                              saveDirectory: saveDirectory,
                              year: tb.nam,
                            );
                            await buildBang3NhanXet(
                              candidates: candidates,
                              saveDirectory: saveDirectory,
                              gv: await tb.chuTich,
                              role: "Chủ tịch tiểu ban",
                              year: tb.nam,
                            );
                            await buildBang3NhanXet(
                              candidates: candidates,
                              saveDirectory: saveDirectory,
                              gv: await tb.thuKy,
                              role: "Thư ký tiểu ban",
                              year: tb.nam,
                            );
                            await buildBang3NhanXet(
                              candidates: candidates,
                              saveDirectory: saveDirectory,
                              gv: await tb.uyVien1,
                              role: "Ủy viên",
                              year: tb.nam,
                            );
                            await buildBang3NhanXet(
                              candidates: candidates,
                              saveDirectory: saveDirectory,
                              gv: await tb.uyVien2,
                              role: "Ủy viên",
                              year: tb.nam,
                            );
                            await buildBang3NhanXet(
                              candidates: candidates,
                              saveDirectory: saveDirectory,
                              gv: await tb.uyVien3,
                              role: "Ủy viên",
                              year: tb.nam,
                            );
                            await buildBang4TongHopKq(
                              candidates: candidates,
                              saveDirectory: saveDirectory,
                              year: tb.nam,
                            );
                          },
                        _ => null,
                      },
                      child: Text("Lưu giấy tờ xét tuyển"),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
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
          ChangeNotifierProvider(create: (_) => _FormState()),
          ChangeNotifierProvider(create: (_) => _State()),
        ],
        builder: (context, _) {
          return HBox(
            flex: [2, 1],
            children: [
              _PanelListCandidate(),
              _PanelThemHocVien(),
            ],
          );
        },
      ),
    );
  }
}
