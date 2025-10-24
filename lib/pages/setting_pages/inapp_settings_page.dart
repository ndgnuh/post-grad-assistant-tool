// Setting pages
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../custom_tiles.dart';
import '../../preferences.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _DatabaseTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Database path"),
      subtitle: const Text("Database"),
      onTap: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final filePicker = FilePicker.platform;

        if (Platform.isAndroid || Platform.isIOS) {
          await Permission.camera.request();
          return;
        }

        final directory = await filePicker.getDirectoryPath(
          dialogTitle: "Database directory",
        );

        final status = await Permission.manageExternalStorage.request();

        switch (directory) {
          case null:
            // User canceled the picker
            return;
          case String path:
            // User selected a directory
            final databasePath = p.join(
              directory,
              "database.sqlite",
            );
            final file = File(databasePath);
            print(await file.readAsBytes());

            prefs.setString('database_path', databasePath);
        }
        // final path = results?.paths.single;
        // switch (path) {
        //   case null:
        //     break;
        //   case String path:
        //     prefs.setString('database_path', path);
        // }
        // print(path);
        // print(prefs.getString('database_path'));
      },
    );
  }
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          _DatabaseTile(),
          _DarkModeSwitchTile(),
          MyNameSettingTile(),
          MyDivisionSettingTile(),
        ],
      ),
    );
  }
}

class _DarkModeSwitchTile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkModeState = ref.watch(isDarkModeProvider);

    final isDarkMode = switch (isDarkModeState) {
      AsyncData(:final value) => value,
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
        await setDarkMode(shouldBeDark);
        ref.invalidate(isDarkModeProvider);
      },
    );
  }
}

class MyDivisionSettingTile extends ConsumerWidget {
  final String title;
  const MyDivisionSettingTile({super.key, this.title = "Đơn vị công tác"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myDivisionState = ref.watch(myDivisionProvider);

    final myDivisionText = switch (myDivisionState) {
      AsyncData(:final value) => value,
      AsyncLoading() => "Loading...",
      AsyncError(:final error) => "Error: $error",
    };

    return ListTile(
      title: Text(title),
      subtitle: Text(myDivisionText),
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
            await ref.read(myDivisionProvider.notifier).setDivision(value);
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
            await ref.read(myNameProvider.notifier).setName(value);
        }
      },
    );
  }
}
