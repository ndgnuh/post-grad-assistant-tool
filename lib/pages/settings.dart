// Setting pages
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';

import 'dart:io';

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

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Database path"),
            subtitle: const Text("Database"),
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final filePicker = FilePicker.platform;

              if (Platform.isAndroid || Platform.isIOS) {
                await Permission.camera.request();
                return;
              }

              final directory = await filePicker.getDirectoryPath(
                dialogTitle: "Database directory",
              );

              final status = await Permission.manageExternalStorage.request();
              print(status);

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
          ),
          ListTile(
            title: const Text("Import database"),
            subtitle: const Text("Import from onedrive"),
            onTap: () async {},
          ),
        ],
      ),
    );
  }
}
