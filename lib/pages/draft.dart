import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../business/copy_pasta.dart';
// import '../business/domain_objects.dart';
import '../business/db_v2_providers.dart';

MaterialPageRoute ezRoute(Widget page) {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(),
      body: page,
    ),
  );
}

class DraftPage extends ConsumerWidget {
  static const routeName = '/draft';
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draft Page'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            final email = Email(
              subject: "Về chương trình thạc sĩ Toán Tin",
              body: """

Mình là Hùng, trợ lý đào tạo sau đại học của khoa Toán - Tin. Chúc mừng các bạn trúng tuyển chương trình Thạc sĩ Toán - Tin. Ban Đào tạo sẽ gửi email nhập học cho các bạn.

Sau khi thực hiện các thủ tục nhập học xong, các bạn phản hồi lại cho mình qua email những thông tin sau để phục vụ cho công tác quản lý:

- Họ tên đầy đủ,
- Mã học viên,
- Mã lớp quản lý/tên khóa,
- Email học viên (email với đuôi sis.hust.edu.vn).

Ngoài ra, các bạn tham gia nhóm Zalo học viên ở dưới để tiện cho việc nhận thông báo và phổ biến công việc. Các bạn nếu gặp vấn đề gì trong quá trình nhập học cũng có thể liên hệ với mình thông qua email này.

Link nhóm Zalo: TBA""",
              recipients: {"ndgnuh99@gmail.com"},
            );
            final mailto = email.mailtoLink;
            url_launcher.launchUrl(
              mailto,
              mode: url_launcher.LaunchMode.externalApplication,
            );

            Clipboard.setData(ClipboardData(text: mailto.toString()));
          },
          child: const Text('Send mailto'),
        ),
      ),
    );
  }
}

class _PageBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbState = ref.watch(driftDatabaseProvider);
    switch (dbState) {
      case AsyncLoading():
        return CircularProgressIndicator();
      case AsyncError(:final error):
        return Text('Error: $error');
      default:
    }

    final MyDriftDatabase db = dbState.value!;

    final allTables = db.allTables.toList();

    return ListView.builder(
      itemCount: db.allTables.length,
      itemBuilder: (context, index) {
        final table = allTables[index];
        return ListTile(
          title: Text(table.actualTableName),
          subtitle: Text(table.entityName),
          onTap: () async {
            switch (table.actualTableName) {
              case 'giangvien':
                Navigator.of(context).push(
                  ezRoute(_TeacherDataAll()),
                );
              default:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'No handler for table ${table.actualTableName}',
                    ),
                  ),
                );
            }
          },
        );
      },
    );
  }
}

class _TeacherDataAll extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox();
    // final allTeachers = ref.watch(allTeachersProvider);
    //
    // return allTeachers.when(
    //   data: (teachers) {
    //     return ListView.builder(
    //       itemCount: teachers.length,
    //       itemBuilder: (context, index) {
    //         final teacher = teachers[index];
    //         return ListTile(
    //           title: Text(teacher.name ?? ""),
    //           subtitle: Text(teacher.gender.toString()),
    //         );
    //       },
    //     );
    //   },
    //   loading: () => CircularProgressIndicator(),
    //   error: (error, stack) => Text('Error: $error'),
    // );
  }
}
