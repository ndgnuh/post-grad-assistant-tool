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
import 'widgets.dart';

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
              Text("Hãy cài đặt hai CSDL để sử dụng app"),

              // Create new database card
              CardSection(
                title: "Cơ sở dữ liệu chính",
                subtitle:
                    "Lưu trữ thông tin học viên, giảng viên, lớp tín chỉ, luận văn...",
                children: [
                  _CreateNewButton(),
                  AppDatabaseImportButtonBuilder(
                    builder: (context, fileDatabasePath, callback) {
                      return ListTile(
                        leading: Icon(Symbols.upload),
                        title: Text("Nhập CSDL"),
                        subtitle: Text(switch (fileDatabasePath) {
                          null => "Chọn cơ sở dữ liệu file hiện có trong máy",
                          String path => "Đã chọn: $path",
                        }),
                        trailing: Icon(Symbols.chevron_right),
                        onTap: callback,
                      );
                    },
                  ),
                ],
              ),

              //File Content Database
              CardSection(
                title: "Cơ sở dữ liệu file",
                subtitle: "Lưu trữ các file văn bản PDF",
                children: [
                  _CreateNewFileDatabaseButton(),
                  FileDatabaseImportButtonBuilder(
                    builder: (context, fileDatabasePath, callback) {
                      return ListTile(
                        leading: Icon(Symbols.upload),
                        title: Text("Nhập CSDL"),
                        subtitle: Text(switch (fileDatabasePath) {
                          null => "Chọn cơ sở dữ liệu file hiện có trong máy",
                          String path => "Đã chọn: $path",
                        }),
                        trailing: Icon(Symbols.chevron_right),
                        onTap: callback,
                      );
                    },
                  ),
                ],
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
      title: Text("Tạo mới"),
      subtitle: Text(
        "Tạo cơ sở dữ liệu mới",
      ),
      trailing: Icon(Symbols.chevron_right),
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
      title: Text("Tạo mới"),
      subtitle: Text("Tạo cơ sở dữ liệu mới"),
      trailing: Icon(Symbols.chevron_right),
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
