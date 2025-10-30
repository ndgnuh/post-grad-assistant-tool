import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../custom_widgets.dart';
import './widgets.dart';

class PhdStudentDetailsTab extends StatelessWidget {
  final int studentId;
  const PhdStudentDetailsTab({super.key, required this.studentId});

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
            title: "Thông tin cơ bản",
            children: [
              PhdStudentInfo(
                studentId: studentId,
                builder: (_, student) => _InfoTile(
                  title: "Họ tên",
                  content: student.name,
                ),
              ),

              PhdStudentInfo(
                studentId: studentId,
                builder: (_, student) => _InfoTile(
                  title: "SĐT",
                  content: student.phone,
                ),
              ),

              PhdStudentInfo(
                studentId: studentId,
                builder: (_, student) => _InfoTile(
                  title: "Email",
                  content: student.phone,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String content;
  final Widget? leading;
  final Widget? trailing;

  const _InfoTile({
    required this.title,
    required this.content,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      trailing: trailing,
      title: Text(title),
      subtitle: Text(content),
    );
  }
}
