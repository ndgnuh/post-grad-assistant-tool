import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class AdmissionCouncilCreatePage extends StatelessWidget {
  const AdmissionCouncilCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm hội đồng"),
      ),
      body: Expanded(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightForFinite(width: 960),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.gutter),
              child: _AddCouncilForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddCouncilForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: context.gutter,
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Symbols.calendar_check),
              labelText: "Năm xét tuyển",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(null),
              labelText: "Số quyết định",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(null),
              labelText: "Ngày ký",
            ),
          ),

          _TeacherSearchButton(
            labelText: "Chủ tịch",
            icon: Icon(Symbols.person_2),
          ),
          _TeacherSearchButton(
            labelText: "Thư ký",
            icon: Icon(null),
          ),
          _TeacherSearchButton(
            labelText: "Ủy viên 1",
            icon: Icon(null),
          ),
          _TeacherSearchButton(
            labelText: "Ủy viên 2",
            icon: Icon(null),
          ),
          _TeacherSearchButton(
            labelText: "Ủy viên 3",
            icon: Icon(null),
          ),

          FilledButton(onPressed: () {}, child: Text("Lưu")),
        ],
      ),
    );
  }
}

class _TeacherSearchButton extends ConsumerWidget {
  final String labelText;
  final Widget? icon;

  const _TeacherSearchButton({required this.labelText, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        icon: icon,
      ),
    );
  }
}
