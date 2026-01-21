import '../../business/copy_pasta.dart';
import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import 'teaching_assignment_providers.dart';
import '../pages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'course_class_pages.dart';
import 'providers.dart';
import 'widgets.dart';

class CourseClassActionTab extends StatelessWidget {
  const CourseClassActionTab({super.key});
  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;

    final actionCards = [
      CardSection(
        title: "Thông báo & Email",
        children: [
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

          _ClassAccessUrlNotificationButton(),

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
        ],
      ),

      CardSection(
        title: "Phân công giảng dạy",
        children: [
          _TeachingAssignmentPdfButton(),
          _TeachingAssignmentSaveButton(),
          _TeachingAssignmentEmailButton(),
        ],
      ),

      CardSection(
        title: "Thông tin liên quan",
        children: [
          _ToSemesterPageButton(),
        ],
      ),

      // Import/add classes
      CardSection(
        title: "Thêm lớp mới",
        children: [
          ListTile(
            leading: const Icon(Symbols.upload_file),
            title: const Text('Nhập danh sách lớp'),
            subtitle: const Text(
              'Nhập danh sách lớp từ file số lượng đăng ký của BĐT',
            ),
            onTap: () {
              final tabController = DefaultTabController.maybeOf(
                context,
              );

              CourseClassImportPage.pickFileAndNavigateTo(context).then((
                bool? success,
              ) {
                if (success == true) {
                  tabController?.animateTo(0);
                }
              });
            },
          ),
          ListTile(
            leading: const Icon(Symbols.add_circle),
            title: const Text('Tạo lớp học'),
            subtitle: const Text('Tạo lớp học mới thủ công'),
            onTap: () {
              Navigator.of(context).pushNamed(
                CourseClassCreatePage.routeName,
              );
            },
          ),
        ],
      ),
    ];

    return Padding(
      padding: EdgeInsets.all(gutter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        verticalDirection: context.verticalDirection,
        spacing: gutter,
        children: [
          /// The input section
          SemesterPicker(
            key: Key("semester-picker-1"),
          ),

          /// The action sections
          Expanded(
            child: ListView.separated(
              itemCount: actionCards.length,
              separatorBuilder: (context, index) => SizedBox(height: gutter),
              itemBuilder: (context, index) => actionCards[index],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClassAccessUrlNotificationButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    final message = ref.watch(courseClassUrlNotificationProvider).value;

    return ListTile(
      leading: const Icon(Symbols.class_),
      title: const Text('Thông báo danh sách lớp'),
      subtitle: const Text('Thông báo nhóm lớp cho học viên'),
      trailing: const Icon(Symbols.content_copy),
      onTap: () {
        if (message == null) return;
        final data = ClipboardData(text: message);
        Clipboard.setData(data);
        messenger.showSnackBar(
          SnackBar(
            content: Text(
              'Đã sao chép thông báo vào clipboard',
            ),
          ),
        );
      },
      enabled: message != null,
    );
  }
}

class _TeachingAssignmentSaveButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfFileAsync = ref.watch(teachingAssignmentPdfProvider);
    final xlsxFileAsync = ref.watch(teachingAssignmentXlsxProvider);
    final pdfFile = pdfFileAsync.maybeWhen(
      data: (pdfFile) => pdfFile,
      orElse: () => null,
    );
    final xlsxFile = xlsxFileAsync.maybeWhen(
      data: (xlsxFile) => xlsxFile,
      orElse: () => null,
    );

    final subtitle = switch (xlsxFile?.name) {
      String name => 'Lưu file $name.xlsx và .pdf',
      _ => 'Lưu file xlsx và pdf',
    };

    final messenger = ScaffoldMessenger.of(context);

    return ListTile(
      leading: const Icon(Symbols.download),
      title: const Text('Lưu bảng phân công'),
      subtitle: Text(subtitle),
      trailing: const Icon(Symbols.chevron_forward),
      enabled: (pdfFile != null) && (xlsxFile != null),
      onTap: () async {
        final saveDirectory = await FilePicker.platform.getDirectoryPath();
        if (saveDirectory == null) return;
        await xlsxFile!.save(directory: saveDirectory);
        await pdfFile!.save(directory: saveDirectory);

        final saveDirectoryUri = Uri.directory(saveDirectory);

        messenger.showSnackBar(
          SnackBar(
            content: Link(
              uri: saveDirectoryUri,
              builder: (context, followLink) => InkWell(
                onTap: followLink,
                child: Text('Đã lưu file vào $saveDirectory'),
              ),
            ),
            action: SnackBarAction(
              label: 'Mở',
              onPressed: () => launchUrl(
                saveDirectoryUri,
                mode: LaunchMode.externalApplication,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ToSemesterPageButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(semesterSelectionModelProvider).value;
    final semester = model?.selected;

    final subtitle = switch (semester) {
      SemesterData(:final id) => 'Tới trang đợt học $id',
      _ => '',
    };

    return ListTile(
      leading: const Icon(Symbols.info),
      title: const Text('Xem đợt học'),
      subtitle: Text(subtitle),
      trailing: const Icon(Symbols.chevron_forward),
      enabled: semester != null,
      onTap: () {
        final nav = AppNavigator(context);
        nav.toSemesterDetailsPage(semesterId: semester!.id);
      },
    );
  }
}

class _TeachingAssignmentPdfButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfFileAsync = ref.watch(teachingAssignmentPdfProvider);
    switch (pdfFileAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError(:final error):
        return ListTile(
          title: Text('Bảng phân công'),
          subtitle: Text(error.toString()),
        );
      default:
    }

    final pdfFile = pdfFileAsync.value;
    return ListTile(
      leading: const Icon(Symbols.docs),
      title: const Text('Bảng phân công'),
      subtitle: const Text('trước bảng phân công'),
      trailing: const Icon(Symbols.chevron_forward),
      enabled: pdfFile != null,
      onTap: () async {
        final nav = AppNavigator(context);
        nav.toPdfPreviewPage(
          title: pdfFile!.name,
          pdfData: pdfFile.bytes,
          sourceName: pdfFile.name,
        );
      },
    );
  }
}

class _TeachingAssignmentEmailButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailAsync = ref.watch(teachingAssignmentEmailProvider);
    switch (emailAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError(:final error):
        return ListTile(
          title: Text('Email thông báo giảng dạy'),
          subtitle: Text(error.toString()),
        );
      default:
    }

    final email = emailAsync.value;
    return ListTile(
      leading: const Icon(Symbols.email),
      title: const Text('Email thông báo giảng dạy'),
      subtitle: const Text('Xem và sao chép email thông báo giảng dạy'),
      trailing: const Icon(Symbols.chevron_forward),
      enabled: email != null,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => EmailCopyDialog(email: email!),
        );
      },
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
