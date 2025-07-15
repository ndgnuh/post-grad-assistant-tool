/// Setting pages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_onedrive/flutter_onedrive.dart';

import 'dart:io';

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

              await Permission.camera.request();
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
            onTap: () async {
              final redirectUrl =
                  "https://login.microsoftonline.com/common/oauth2/nativeclient";
              final clientId = "2b077247-3e09-40e5-a8f7-3229379fb34d";
              final onedrive = OneDrive(
                redirectURL: redirectUrl,
                clientID: clientId,
              );

              final connected = await onedrive.isConnected();
              print(connected);
            },
          ),
        ],
      ),
    );
  }
}
