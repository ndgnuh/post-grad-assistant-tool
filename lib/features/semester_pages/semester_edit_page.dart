import '../../utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';

class SemesterDetailsPage extends ConsumerWidget {
  static const routeName = "/semester/details";

  final String semesterId;
  const SemesterDetailsPage({
    super.key,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final semesterAsync = ref.watch(semesterByIdProvider(semesterId));
    switch (semesterAsync) {
      case AsyncLoading():
        return const ListTile(
          title: Text("Loading..."),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text("Lỗi rồi"),
          subtitle: Text(error.toString()),
        );
      default:
    }

    final messenger = ScaffoldMessenger.of(context);
    void copyToClipboard(String text) {
      Clipboard.setData(ClipboardData(text: text));
      messenger.showSnackBar(
        SnackBar(content: Text("Copied: $text")),
      );
    }

    // Information, formatted and stored as variables
    final semester = semesterAsync.value!;
    final semesterName = semester.id;
    final registrationOpenDate = semester.registrationBeginDate.toDmy(
      separator: '/',
    );
    final registrationCloseDate = semester.registrationEndDate.toDmy(
      separator: '/',
    );
    final studyEndDate = semester.classEndDate.toDmy(separator: '/');
    final studyStartDate = semester.classBeginDate.toDmy(separator: '/');
    final gradeSubmissionDeadline = semester.gradeSubmissionDeadline.toDmy(
      separator: '/',
    );

    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: Text(semesterName),
          actions: [
            // Delete button
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Xóa đợt học"),
                    content: Text(
                      "Bạn có chắc muốn xóa đợt học ${semester.id}?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text("Hủy"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text("Xóa"),
                      ),
                    ],
                  ),
                );

                if (confirm == true) {
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text(
                        "LMAO NO",
                      ),
                    ),
                  );
                  // await semester.delete();
                  // notifier.value = academicYear;
                  // navigator.pop();
                }
              },
            ),

            // Copy pastas
            // MenuAnchor(
            //   menuChildren: [
            //     MenuItemButton(
            //       onPressed: () => copyPasta.copyThongBaoDangKyHoc(),
            //       child: const Text("Thông báo đăng ký học"),
            //     ),
            //     MenuItemButton(
            //       onPressed: () => copyPasta.copyThongBaoGiangDay(),
            //       child: const Text("Thông báo giảng dạy"),
            //     ),
            //     MenuItemButton(
            //       onPressed: () => copyPasta.copyNhacNhoNopDiem(),
            //       child: const Text("Nhắc nộp điểm"),
            //     ),
            //   ],
            //   builder: (context, controller, child) => IconButton(
            //     icon: const Icon(Icons.copy),
            //     onPressed: controller.open,
            //   ),
            // ),
          ],
        ),
      ),

      // TODO: pick and update function
      // Body
      body: ConstrainedBody(
        child: ListView(
          // List tiles with information
          // Tap to edit
          // Long tap to copy
          children: [
            ListTile(
              title: Text("Mở đăng ký học"),
              subtitle: Text(registrationOpenDate),
              trailing: const Icon(Icons.edit),
              onLongPress: () => copyToClipboard(registrationOpenDate),
              onTap: () async {},
            ),
            ListTile(
              title: Text("Đóng đăng ký học"),
              subtitle: Text(registrationCloseDate),
              trailing: const Icon(Icons.edit),
              onLongPress: () => copyToClipboard(registrationCloseDate),
              onTap: () async {},
            ),
            ListTile(
              title: Text("Bắt đầu học"),
              subtitle: Text(studyStartDate),
              trailing: const Icon(Icons.edit),
              onLongPress: () => copyToClipboard(studyStartDate),
              onTap: () async {},
            ),

            Divider(),
            ListTile(
              title: Text("Kết thúc học"),
              subtitle: Text(studyEndDate),
              trailing: const Icon(Icons.edit),
              onLongPress: () => copyToClipboard(studyStartDate),
              onTap: () async {},
            ),

            Divider(),
            ListTile(
              title: Text("Hạn nhập điểm"),
              subtitle: Text(gradeSubmissionDeadline),
              trailing: const Icon(Icons.edit),
              onLongPress: () => copyToClipboard(gradeSubmissionDeadline),
              onTap: () async {},
            ),
          ],
        ),
      ),
    );
  }
}
