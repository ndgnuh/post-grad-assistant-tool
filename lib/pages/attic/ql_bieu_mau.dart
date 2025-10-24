import 'package:flutter/material.dart';

class DienPhieuDiemThs extends StatelessWidget {
  static const routeName = "/bieu_mau/phieu_diem_ths";
  const DienPhieuDiemThs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phiếu điểm luận văn thạc sĩ"),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Hướng dẫn"),
              subtitle:
                  const Text("Hướng dẫn điền phiếu điểm luận văn thạc sĩ"),
              onTap: () => Navigator.pushNamed(
                context,
                DienPhieuDiemThs.routeName,
              ),
            ),
            ListTile(
              title: const Text("Điền phiếu điểm"),
              subtitle: const Text("Điền thông tin vào phiếu điểm"),
              onTap: () {
                // Navigate to the form page
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QlBieuMau extends StatelessWidget {
  static const routeName = "/bieu_mau";
  const QlBieuMau({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Điền biểu mẫu"),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Phiếu điểm NCS"),
              subtitle: const Text("Phiếu điểm cho bảo vệ đề cương NCS"),
              onTap: () {
                // Navigate to the list of forms
              },
            ),
            ListTile(
              title: const Text("Phiếu điểm thạc sĩ"),
              subtitle: const Text("Phiếu điểm cho bảo vệ luận văn thạc sĩ"),
              onTap: () => Navigator.pushNamed(
                context,
                DienPhieuDiemThs.routeName,
              ),
            ),
            ListTile(
              title: const Text("Phiếu thanh toán"),
              subtitle: const Text("Hồ sơ thanh toán (chung)"),
              onTap: () {
                // Navigate to the form page
              },
            ),
          ],
        ),
      ),
    );
  }
}
