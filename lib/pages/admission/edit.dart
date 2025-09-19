import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageState extends ChangeNotifier {
  final String admissionId;

  PageState({
    required this.admissionId,
  });
}

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
      body: Center(
        child: Text("Admission Edit Page for ID: ${admissionId ?? "New"}"),
      ),
    );
  }
}
