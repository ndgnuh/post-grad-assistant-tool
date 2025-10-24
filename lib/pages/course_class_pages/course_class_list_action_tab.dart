import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'widgets.dart';

class CourseClassActionTab extends StatelessWidget {
  const CourseClassActionTab({super.key});
  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    return Padding(
      padding: EdgeInsets.all(gutter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: gutter,
        children: [
          SemesterPicker(),

          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: context.gutterSmall),

                RegistrationNotificationButton(
                  builder: (context, message) => ListTile(
                    leading: const Icon(Symbols.app_registration),
                    title: const Text('Thông báo đăng ký học'),
                    subtitle: const Text('Copy thông báo cho học viên'),
                    trailing: const Icon(Symbols.content_copy),
                    enabled: message != null,
                    onTap: () {
                      if (message == null) return;
                      final data = ClipboardData(text: message);
                      Clipboard.setData(data);
                    },
                  ),
                ),

                Divider(),

                ListTile(
                  leading: const Icon(Symbols.class_),
                  title: const Text('Thông báo danh sách lớp'),
                  subtitle: const Text('Thông báo nhóm lớp cho học viên'),
                  trailing: const Icon(Symbols.content_copy),
                  onTap: () {},
                ),

                Divider(),

                ListTile(
                  leading: const Icon(Symbols.email),
                  title: const Text('Thông báo giảng dạy'),
                  subtitle: const Text(
                    'Email giảng dạy đầu đợt học cho giảng viên',
                  ),
                  trailing: const Icon(Symbols.send),
                  onTap: () {},
                ),

                Divider(),

                ListTile(
                  leading: const Icon(Symbols.email),
                  title: const Text('Thông báo nộp điểm'),
                  subtitle: const Text(
                    'Email nhắc nhở hạn nộp điểm cho giảng viên',
                  ),
                  trailing: const Icon(Symbols.send),
                  onTap: () {},
                ),
                SizedBox(height: context.gutterSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
