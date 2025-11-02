// Setting pages
import 'dart:io';

import 'package:external_path/external_path.dart' as ext_path;
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path_provider/path_provider.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_tiles.dart';
import '../../custom_widgets.dart';
import 'widgets.dart';

class MyFalcutyTile extends ConsumerWidget {
  final String title;
  const MyFalcutyTile({super.key, this.title = "Đơn vị công tác"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myDivisionState = ref.watch(myFalcutyProvider);

    final myDivisionText = switch (myDivisionState) {
      AsyncData(:final value) => value,
      AsyncLoading() => "Loading...",
      AsyncError(:final error) => "Error: $error",
    };

    return ListTile(
      title: Text(title),
      subtitle: Text(myDivisionText ?? "Chưa cài đặt"),
      onTap: () async {
        final newDivision = await showDialog(
          context: context,
          builder: (context) => TextEditingDialog2(
            title: title,
            initialText: myDivisionText,
          ),
        );

        switch (newDivision) {
          case DialogValue(:final value):
            await ref.read(myFalcutyProvider.notifier).set(value);
        }
      },
    );
  }
}

class MyNameSettingTile extends ConsumerWidget {
  final String title;
  const MyNameSettingTile({super.key, this.title = "Tên dùng trong văn bản"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myNameState = ref.watch(myNameProvider);

    final myNameText = switch (myNameState) {
      AsyncData(:final value) => value,
      _ => null,
    };

    return ListTile(
      title: Text(title),
      subtitle: Text(myNameText ?? "Chưa đặt tên"),
      onTap: () async {
        final newName = await showDialog(
          context: context,
          builder: (context) => TextEditingDialog2(
            title: title,
            initialText: myNameText ?? "",
          ),
        );

        switch (newName) {
          case DialogValue(:final value):
            await ref.read(myNameProvider.notifier).set(value);
        }
      },
    );
  }
}

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(title: const Text("Cài đặt")),
      ),
      body: ConstrainedBody(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            spacing: context.gutter,
            children: [
              CardSection(
                title: "Cài đặt chung",
                children: [
                  AppDataDirectoryPicker(
                    builder: (context, dbPath, callback) => ListTile(
                      leading: const Icon(Symbols.folder_open),
                      title: const Text("Thư mục lưu dữ liệu"),
                      trailing: const Icon(Symbols.edit),
                      subtitle: Text(dbPath ?? "Chưa chọn thư mục"),
                      onTap: callback,
                    ),
                  ),
                  AppDatabaseImportButtonBuilder(
                    builder: (context, dbPath, callback) => ListTile(
                      title: const Text("CSDL chính"),
                      subtitle: Text(dbPath ?? "Chưa chọn CSDL"),
                      onTap: callback,
                    ),
                  ),
                  FileDatabaseImportButtonBuilder(
                    builder: (context, dbPath, callback) => ListTile(
                      title: const Text("CSDL file"),
                      subtitle: Text(dbPath ?? "Chưa chọn CSDL"),
                      onTap: callback,
                    ),
                  ),
                  _DarkModeSwitchTile(),
                ],
              ),

              /// Interpersonnal settings
              CardSection(
                title: "Cài đặt công việc",
                children: [
                  MyNameSettingTile(),
                  MyFalcutyTile(),
                ],
              ),

              /// Misc
              CardSection(
                title: "Khác",
                children: [
                  ListTile(
                    title: Text("Chọn file (test)"),
                    onTap: () async {
                      late Directory rootDirectory;
                      if (Platform.isAndroid || Platform.isIOS) {
                        final storages = await ext_path
                            .ExternalPath.getExternalStorageDirectories();
                        rootDirectory = Directory(
                          storages?.first ?? '/storage/emulated/0',
                        );
                      } else {
                        final downloadsDir = await getDownloadsDirectory();
                        rootDirectory = downloadsDir ?? Directory.current;
                      }

                      // rootParts.removeLast();
                      // rootParts.removeLast();
                      // rootParts.removeLast();
                      // rootParts.removeLast();

                      final filePath = await FilesystemPicker.openBottomSheet(
                        // ignore: use_build_context_synchronously
                        context: context,
                        rootDirectory: rootDirectory,
                        fsType: FilesystemType.all,
                        pickText: "Chọn file",
                        folderIconColor: Colors.blue,
                        showGoUp: true,
                        permissionText: "Ứng dụng cần quyền truy cập bộ nhớ",
                      );
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text("Chose file: $filePath"),
                        ),
                      );
                    },
                  ),
                  AboutListTile(
                    icon: const Icon(Symbols.info),
                    applicationName: "FaMI-PGMS",
                    applicationVersion: "0.1.0",
                    applicationLegalese: "",
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

class _DarkModeSwitchTile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkModeState = ref.watch(isDarkModeProvider);

    final isDarkMode = switch (isDarkModeState) {
      AsyncData(:final value) => value ?? false,
      _ => false,
    };

    return SwitchListTile(
      value: isDarkMode,
      title: const Text("Dark mode"),
      subtitle: switch (isDarkMode) {
        true => const Text("Dark mode is enabled"),
        false => const Text("Dark mode is disabled"),
      },
      onChanged: (shouldBeDark) async {
        final notifier = ref.read(isDarkModeProvider.notifier);
        await notifier.set(shouldBeDark);
        ref.invalidate(isDarkModeProvider);
      },
    );
  }
}
