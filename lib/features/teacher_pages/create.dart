import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class _State extends ChangeNotifier {
  int? editingId;

  _State({this.editingId});
}

class Page extends StatelessWidget {
  final int? editingId;
  const Page({super.key, this.editingId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _State(editingId: editingId),
      child: Scaffold(
        appBar: AppBar(title: const Text("Thêm giảng viên")),
        body: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: context.gutter,
            children: [
              Expanded(child: TeacherForm()),
              _SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class TeacherForm extends StatelessWidget {
  const TeacherForm({super.key});
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextTheme.of(context).titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.gutter,
          children: [
            Text("Thông tin giảng viên", style: titleStyle),
            TextField(decoration: InputDecoration(labelText: "Họ tên")),
            TextField(decoration: InputDecoration(labelText: "Ngày sinh")),
            TextField(decoration: InputDecoration(labelText: "Giới tính")),

            Text("Thông tin liên hệ", style: titleStyle),
            TextField(decoration: InputDecoration(labelText: "Email HUST")),
            TextField(decoration: InputDecoration(labelText: "Điện thoại")),
            TextField(decoration: InputDecoration(labelText: "Email cá nhân")),

            Text("Thông tin công tác", style: titleStyle),
            TextField(decoration: InputDecoration(labelText: "Đơn vị")),
            TextField(decoration: InputDecoration(labelText: "Mã giảng viên")),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle form submission
        Navigator.pop(context);
      },
      child: const Text("Lưu"),
    );
  }
}
