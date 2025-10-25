import 'dart:io';

import 'package:fami_tools/pages/setting_pages/setting_pages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as path;

import '../../business/db_v2_providers.dart';
import '../../business/file_content_database.dart';
import '../../custom_widgets.dart';
import 'providers.dart';

class InitialSetupPage extends StatelessWidget {
  static const String routeName = "/initial/setup";

  const InitialSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: context.gutter,
            children: [
              Text("Xin chào", style: textTheme.headlineLarge),

              // Create new database card
              Card(
                child: Column(
                  children: [
                    SizedBox(height: context.gutterTiny),
                    _SaveDirectoryPicker(),
                    Divider(),
                    _CreateNewButton(),
                    Divider(),
                    _CreateNewFileDatabaseButton(),
                    Divider(),
                    _ImportDatabaseButton(),
                    SizedBox(height: context.gutterTiny),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateNewButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    final directory = ref.watch(saveDirectoryProvider);

    return ListTile(
      leading: Icon(Symbols.add),
      title: Text("Tạo CSDL"),
      subtitle: Text(
        "Tạo cơ sở dữ liệu mới và bắt đầu sử dụng ứng dụng",
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        if (directory == null) {
          messenger.showSnackBar(
            SnackBar(
              content: Text("Vui lòng chọn thư mục lưu cơ sở dữ liệu"),
            ),
          );
          return;
        }

        final databasePath = path.join(directory, "student_database.db");
        final notifier = ref.read(appDatabasePathProvider.notifier);
        notifier.setDatabasePath(databasePath);
      },
    );
  }
}

class _CreateNewFileDatabaseButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = Navigator.of(context);
    return ListTile(
      leading: Icon(Symbols.add),
      title: Text("Tạo CSDL file"),
      subtitle: Text("Tạo CSDL mới để lưu các văn bản tài liệu"),
      onTap: () async {
        final dbFile = await FileContentDatabase.createTemporaryDatabase();
        final dbFileContent = await dbFile.readAsBytes();
        final savePath = await FilePicker.platform.saveFile(
          dialogTitle: "Lưu CSDL file",
          bytes: dbFileContent,
          fileName: "file-database.sqlite3",
          lockParentWindow: true,
        );

        // Cancelled
        if (savePath == null) return;

        // The desktop is not saved for some reason...
        final outputFile = File(savePath);
        if (Platform.isLinux) {
          await outputFile.writeAsBytes(dbFileContent);
        }

        switch (savePath) {
          case String path:
            final notifier = ref.read(fileContentDatabasePathProvider.notifier);
            notifier.setDatabasePath(path);
            navigator.pushNamed(InitialLoadingPage.routeName);
        }
      },
    );
  }
}

class _ImportDatabaseButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(Symbols.upload),
      title: Text("Nhập CSDL"),
      subtitle: Text(
        "Chọn cơ sở dữ liệu hiện có trong máy",
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () async {
        final databasePath = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          dialogTitle: 'Chọn file cơ sở dữ liệu',
          withData: false,
        );
        final dbPath = databasePath?.files.single.path;
        if (dbPath == null) return;

        final notifer = ref.read(appDatabasePathProvider.notifier);
        notifer.setDatabasePath(dbPath);
      },
    );
  }
}

class _SaveDirectoryPicker extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final directory = ref.watch(saveDirectoryProvider);

    return ListTile(
      leading: Icon(Symbols.folder),
      title: Text("Thư mục lưu CSDL"),
      subtitle: Text(directory ?? "Nhấn để chọn thư mục lưu"),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        final notifier = ref.read(saveDirectoryProvider.notifier);
        notifier.picktDirectory();
      },
    );
  }
}
