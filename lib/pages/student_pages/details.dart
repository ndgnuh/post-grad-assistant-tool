import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_tiles.dart';
import '../../custom_widgets.dart';

class StudentDetailPage extends ConsumerWidget {
  static const String routeName = '/students/detail';

  final int id;

  const StudentDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentAsync = ref.watch(studentByIdProvider(id));
    switch (studentAsync) {
      case AsyncLoading():
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case AsyncError(:final error):
        return Scaffold(
          body: Center(child: Text('Error loading student: $error')),
        );
      default:
    }

    final student = studentAsync.value!;
    final title = "${student.name} - ${student.studentId ?? "N/A"}";
    final notifier = ref.read(
      studentByIdProvider(student.id).notifier,
    );

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
        initialValue: student.name,
        readOnly: true,
      ),

      StringTile(
        leading: Icon(Symbols.id_card),
        titleText: "Mã học viên",
        initialValue: student.studentId ?? "",
        onUpdate: (value) => notifier.updateManagementId(value!),
      ),

      StringTile(
        leading: Icon(Symbols.email),
        titleText: "Email HUST",
        initialValue: student.schoolEmail ?? "",
        onUpdate: (value) => notifier.updateSchoolEmail(value),
      ),
      StringTile(
        leading: Icon(null),
        titleText: "Email cá nhân",
        initialValue: student.personalEmail ?? "",
        onUpdate: (value) => notifier.updatePersonalEmail(value),
      ),

      StringTile(
        leading: Icon(Symbols.phone),
        titleText: "Điện thoại",
        initialValue: student.phone ?? "",
        onUpdate: (value) => notifier.updatePhoneNumber(value),
      ),

      ListTile(
        title: Text("Trạng thái"),
        leading: Icon(Symbols.info),
        subtitle: Text(student.status.toString()),
        onTap: () => showDialog(
          context: context,
          builder: (context) => MenuDialog(
            items: [
              MenuDialogItem(
                title: "Tốt nghiệp",
                subtitle: "Đánh dấu học viên đã tốt nghiệp",
                onTap: () => notifier.markAsGraduated(),
              ),
              MenuDialogItem(
                title: "Bỏ học",
                subtitle: "Đánh dấu học viên đã bỏ học",
                onTap: () => notifier.markAsDroppedOut(),
              ),
              MenuDialogItem(
                title: "Đang học",
                subtitle: "Đánh dấu học viên là đang học",
                onTap: () => notifier.markAsNormal(),
              ),
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: Text(title),
          primary: true,
        ),
      ),
      body: ConstrainedBody(
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
