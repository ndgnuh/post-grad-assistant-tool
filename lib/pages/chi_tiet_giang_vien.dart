import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../drawer.dart';
import '../datamodels.dart';

class ChiTietGiangVienState extends State<ChiTietGiangVien> {
  @override
  Widget build(BuildContext context) {
    GiangVien gv = widget.gv;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Chi tiết giảng viên"),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          ListTile(
            title: TextFormField(
              controller: TextEditingController.fromValue(
                TextEditingValue(text: gv.hoTen ?? ""),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChiTietGiangVien extends StatefulWidget {
  final GiangVien gv;
  const ChiTietGiangVien({required this.gv, super.key});

  @override
  State<ChiTietGiangVien> createState() => ChiTietGiangVienState();
}
