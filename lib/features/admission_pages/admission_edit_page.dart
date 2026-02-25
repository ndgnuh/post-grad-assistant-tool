import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../custom_widgets.dart';

class AdmissionEditPage extends StatelessWidget {
  final String? admissionId;

  const AdmissionEditPage({
    super.key,
    this.admissionId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(admissionId == null ? "Thêm hồ sơ" : "Chỉnh sửa hồ sơ"),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.gutter),
        child: Column(
          spacing: context.gutter,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EzRow(
              children: [
                FilledButton(
                  onPressed: null,
                  child: Text("Lưu"),
                ),
              ],
            ),

            EzRow(
              children: [
                // email: email,
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                // dienThoai: phoneNumber,
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                Spacer(),
              ],
            ),
            // Expanded(
            //   child: Text(
            //     "ABC",
            //     // crossAxisAlignment: CrossAxisAlignment.stretch,
            //     // mainAxisSize: MainAxisSize.min,
            //     // children: [
            //     //   CouncilSelector(),
            //     //
            //     //   // soHoSo: admissionId,
            //     //   TextFormField(
            //     //     decoration: InputDecoration(
            //     //       labelText: "Mã số hồ sơ",
            //     //     ),
            //     //   ),
            //     //
            //     //   // hoTen: name,
            //     //   TextFormField(
            //     //     decoration: InputDecoration(
            //     //       labelText: "Họ tên",
            //     //     ),
            //     //   ),
            //     //
            //     //   // admission type
            //     //   // TODO: select
            //     //
            //     //   // gioiTinh: gender,
            //     //   // TODO: select
            //     //
            //     //   // ngaySinh: dateOfBirth,
            //     //   // TODO: date picker
            //     //
            //     //   // noiSinh: placeOfBirth,
            //     //   TextFormField(
            //     //     decoration: InputDecoration(labelText: "Nơi sinh"),
            //     //   ),
            //     //
            //     //   // truongTotNghiepDaiHoc: bachelorUniversity,
            //     //   TextFormField(
            //     //     decoration: InputDecoration(
            //     //       labelText: "Trường tốt nghiệp đại học",
            //     //     ),
            //     //   ),
            //     //
            //     //   // nganhTotNghiepDaiHoc: bachelorMajor,
            //     //   TextFormField(
            //     //     decoration: InputDecoration(
            //     //       labelText: "Ngành tốt nghiệp đại học",
            //     //     ),
            //     //   ),
            //     //
            //     //   // heTotNghiepDaiHoc: bachelorDegreeType,
            //     //   // TODO: select
            //     //
            //     //   // ngayTotNghiepDaiHoc: bachelorGraduationDate,
            //     //   // TODO: date picker
            //     //
            //     //   // xepLoaiTotNghiepDaiHoc: bachelorGraduationRank,
            //     //   // TODO: select
            //     //
            //     //   // nganhDaoTaoThacSi: masterMajor,
            //     //   // TODO: select + default
            //     //
            //     //   // dinhHuongChuyenSau: specializationOrientation,
            //     //   TextFormField(
            //     //     decoration: InputDecoration(
            //     //       labelText: "Định hướng chuyên sâu",
            //     //     ),
            //     //   ),
            //     // ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class PageState extends ChangeNotifier {
  final String admissionId;

  PageState({
    required this.admissionId,
  });
}
