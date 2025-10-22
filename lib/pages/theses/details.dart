import 'package:flutter/material.dart';

import '../../business/domain_objects.dart';
import '../../custom_tiles.dart';

class ThesisDetailPage extends StatelessWidget {
  final Thesis thesis;

  const ThesisDetailPage({super.key, required this.thesis});

  @override
  Widget build(BuildContext context) {
    final teacher = thesis.giangVien;
    final student = thesis.hocVien;

    return Scaffold(
      appBar: AppBar(title: Text("Chi tiết đề tài")),
      body: ListView(
        children: [
          StringTile(
            titleText: "Tên tiếng Việt",
            initialValue: thesis.tenTiengViet,
          ),
          StringTile(
            titleText: "Tên tiếng Anh",
            initialValue: thesis.tenTiengAnh,
          ),
          StringTile(
            titleText: "Giảng viên hướng dẫn",
            initialValue: teacher.hoTenChucDanh,
            readOnly: true,
          ),
          ListTile(
            title: Text("Học viên"),
            subtitle: Text("${student?.hoTen} [${student?.maHocVien}]"),
          ),
          StringTile(
            titleText: "Số QD Giao",
            initialValue: thesis.soQdGiao ?? "",
          ),
          DateTile(
            titleText: "Ngày giao",
            initialValue: thesis.ngayGiao,
            onUpdate: (date) => thesis.setAssignDate(date),
          ),
          DateTile(
            titleText: "Hạn bảo vệ",
            initialValue: thesis.hanBaoVe,
            onUpdate: (date) => thesis.setDefenseDueDate(date),
          ),
          DateTile(
            titleText: "Ngày bảo vệ",
            initialValue: thesis.ngayBaoVe,
            onUpdate: (date) => thesis.setDefenseDate(date),
          ),
        ],
      ),
    );
  }
}
