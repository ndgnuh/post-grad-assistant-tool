import 'package:fami_tools/business/copy_pasta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'providers.dart';
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
          SemesterPicker(
            key: Key("semester-picker-1"),
          ),

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

                EmailNotificationButtonBuilder(
                  provider: teachingAnnouncementProvider,
                  builder: (context, callback) => ListTile(
                    leading: const Icon(Symbols.email),
                    title: const Text('Thông báo giảng dạy'),
                    subtitle: const Text(
                      'Email giảng dạy đầu đợt học cho giảng viên',
                    ),
                    trailing: const Icon(Symbols.send),
                    onTap: callback,
                    enabled: callback != null,
                  ),
                ),

                Divider(),

                EmailNotificationButtonBuilder(
                  provider: gradeSubmissionAnnouncementProvider,
                  builder: (context, callback) => ListTile(
                    leading: const Icon(Symbols.email),
                    title: const Text('Thông báo nộp điểm'),
                    subtitle: const Text(
                      'Email nhắc nhở hạn nộp điểm cho giảng viên',
                    ),
                    trailing: const Icon(Symbols.send),
                    enabled: callback != null,
                    onTap: callback,
                  ),
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

class EmailNotificationButtonBuilder extends ConsumerWidget {
  final AsyncNotifierProvider<AsyncNotifier<Email?>, Email?> provider;
  final Widget Function(BuildContext context, VoidCallback? callback) builder;

  const EmailNotificationButtonBuilder({
    super.key,
    required this.provider,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageAsync = ref.watch(provider);
    switch (messageAsync) {
      case AsyncLoading _:
        return builder(context, null);
      case AsyncError(:final error):
        return Text("Error: $error");
      case AsyncData(:final value):
        if (value == null) return builder(context, null);
        return builder(context, () {
          showDialog(
            context: context,
            builder: (context) => EmailCopyDialog(email: value),
          );
        });
    }
  }
}
