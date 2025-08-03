// Setting pages
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes.dart';
import '../preferences.dart';

class PageInitialSetup extends StatelessWidget {
  const PageInitialSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, SettingsPage.routeName);
          },
          child: const Text("Go to Settings"),
        ),
      ),
    );
  }
}

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
  late ValueNotifier<bool> darkModeNotifier;

  @override
  initState() {
    super.initState();
    // Listen to theme changes
    darkModeNotifier = ValueNotifier<bool>(Get.isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          _DatabaseTile(),
          ValueListenableBuilder(
            valueListenable: darkModeNotifier,
            builder: (context, bool isDarkMode, child) => SwitchListTile(
              value: isDarkMode,
              title: const Text("Dark mode"),
              subtitle: switch (isDarkMode) {
                true => const Text("Dark mode is enabled"),
                false => const Text("Dark mode is disabled"),
              },
              onChanged: (shouldBeDark) {
                final themes = Get.find<Themes>();
                if (shouldBeDark) {
                  Get.changeThemeMode(ThemeMode.dark);
                  Get.changeTheme(themes.dark);
                } else {
                  Get.changeThemeMode(ThemeMode.light);
                  Get.changeTheme(themes.light);
                }
                darkModeNotifier.value = shouldBeDark;
                setDarkMode(shouldBeDark);
              },
            ),
          ),
        ],
      ),
    );
  }
}
