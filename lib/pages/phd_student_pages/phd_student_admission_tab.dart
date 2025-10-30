import 'package:fami_tools/business/copy_pasta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../custom_widgets.dart';
import 'providers.dart';

class PhdStudentAdmissionTab extends StatelessWidget {
  final int studentId;
  const PhdStudentAdmissionTab({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: gutter,
        verticalDirection: context.verticalDirection,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Phd's student basic information
          CardSection(
            title: "Hội đồng xét tuyển",
            children: [
              _CouncilArrangementEmailButton(studentId: studentId),
              ListTile(
                title: Text("Chủ tịch hội đồng"),
                subtitle: Text("TODO"),
              ),
              ListTile(
                title: Text("Thư ký"),
                subtitle: Text("TODO"),
              ),
              ListTile(
                title: Text("Ủy viên 1"),
                subtitle: Text("TODO"),
              ),
              ListTile(
                title: Text("Ủy viên 2"),
                subtitle: Text("TODO"),
              ),
              ListTile(
                title: Text("Ủy viên 3"),
                subtitle: Text("TODO"),
              ),
            ],
          ),

          /// Preparation for the admission
          CardSection(
            title: "Tổ chức xét tuyển",
            children: [
              ListTile(
                title: Text("Phiếu điểm"),
                subtitle: Text("Xem trước phiếu điểm"),
                leading: Icon(Symbols.file_copy),
                trailing: Icon(Symbols.preview),
              ),
              ListTile(
                title: Text("Giấy thanh toán"),
                subtitle: Text("Xem trước giấy thanh toán"),
                leading: Icon(Symbols.file_copy),
                trailing: Icon(Symbols.preview),
              ),
              ListTile(
                title: Text("Biên bản"),
                subtitle: Text("Biên bản xét tuyển"),
                leading: Icon(Symbols.file_copy),
                trailing: Icon(Symbols.preview),
              ),
              ListTile(
                title: Text("Lưu hồ sơ"),
                subtitle: Text("Lưu hồ sơ ra một thư mc"),
                leading: Icon(Symbols.download),
                trailing: Icon(Symbols.chevron_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CouncilArrangementEmailButton extends StatelessWidget {
  final int studentId;
  const _CouncilArrangementEmailButton({required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => ListTile(
        title: Text("Gửi email xếp hội đồng"),
        subtitle: Text(
          "Gửi email mời xếp hội đồng xét tuyển cho các GVHD",
        ),
        leading: Icon(Symbols.email),
        trailing: Icon(Symbols.chevron_right),
        onTap: () async {
          final email = await ref.watch(
            admissionCouncilArrangementEmailNotifier(studentId).future,
          );

          showDialog(
            context: context,
            builder: (_) => EmailCopyDialog(email: email),
          );
        },
      ),
    );
  }
}
