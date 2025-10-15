import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../custom_tiles.dart';
import '../../business/domain_objects.dart';
import '../../custom_widgets.dart';

class StudentDetailPage extends StatelessWidget {
  static const String routeName = '/students/detail';

  final HocVien student;

  const StudentDetailPage({super.key, required this.student});

  String get title => "${student.hoTen} - ${student.maHocVien ?? "N/A"}";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final children = [
      StringTile(
        leading: Icon(Symbols.numbers),
        titleText: "UUID",
        initialValue: (student.id).toString(),
        readOnly: true,
      ),
      StringTile(
        leading: Icon(Symbols.person),
        titleText: "Họ tên",
        initialValue: student.hoTen,
        readOnly: true,
      ),

      StringTile(
        leading: Icon(Symbols.id_card),
        titleText: "Mã học viên",
        initialValue: student.maHocVien ?? "",
        onUpdate: (value) => student.updateStudentId(value!),
      ),

      StringTile(
        leading: Icon(Symbols.email),
        titleText: "Email HUST",
        initialValue: student.emailHust ?? "",
        onUpdate: (value) => student.updateStudentEmail(value!),
      ),
      StringTile(
        leading: Icon(null),
        titleText: "Email cá nhân",
        initialValue: student.email ?? "",
        onUpdate: (value) => student.updateStudentEmail(value!),
      ),

      StringTile(
        leading: Icon(Symbols.phone),
        titleText: "Điện thoại",
        initialValue: student.dienThoai ?? "",
        onUpdate: (value) => student.updatePhoneNumber(value!),
      ),
    ];
    return Scaffold(
      appBar: ConstrainedScreen(
        child: AppBar(
          title: Text(title),
          primary: true,
        ),
      ),
      body: ConstrainedScreen(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            spacing: context.gutter,
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, i) => children[i],
                  itemCount: children.length,
                  separatorBuilder: (_, _) => Divider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
