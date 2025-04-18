import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/domain_objects.dart';
import '../custom_widgets.dart';

class _State extends ChangeNotifier {
  final editHoTen = TextEditingController();
  final editDeTai = TextEditingController();
  final editMaSo = TextEditingController();
  final editHuongChuyenSau = TextEditingController();

  final editGvhd1 = EzSelectionController<GiangVien>();
  final editGvhd2 = EzSelectionController<GiangVien>();
  final editTruongTb = EzSelectionController<GiangVien>();
  final editThuKy = EzSelectionController<GiangVien>();
  final editUyVien1 = EzSelectionController<GiangVien>();
  final editUyVien2 = EzSelectionController<GiangVien>();
  final editUyVien3 = EzSelectionController<GiangVien>();

  refresh() async {
    final allGiangVien = await GiangVien.all();
    editGvhd1.values = allGiangVien;
    editGvhd2.values = allGiangVien;
    editTruongTb.values = allGiangVien;
    editThuKy.values = allGiangVien;
    editUyVien1.values = allGiangVien;
    editUyVien2.values = allGiangVien;
    editUyVien3.values = allGiangVien;
  }

  _State() {
    refresh();
  }
}

class PageXetTuyenNcs extends StatelessWidget {
  static const routeName = "/xet-tuyen-ncs";
  static const icon = Icons.person;
  const PageXetTuyenNcs({super.key});

  @override
  Widget build(BuildContext context) {
    final body = EzFlex(
      direction: Axis.horizontal,
      children: [EzBox(), EzBox()],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Xét tuyển NCS"),
        leading: BackButton(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => _State(),
        child: body,
      ),
    );
  }
}
