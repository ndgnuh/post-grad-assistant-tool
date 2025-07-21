import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:file_picker/file_picker.dart';

import 'dart:core';
import '../drawer.dart';
import '../preferences.dart' as preferences;

class HomePage extends StatelessWidget {
  static const String routeName = "/";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("FamiTools")),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text("Cơ sở dữ liệu"),
            subtitle: FutureBuilder<String?>(
              future: preferences.getDatabasePath(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading...");
                } else if (snapshot.hasError) {
                  return Text("Lỗi: ${snapshot.error}");
                } else if (snapshot.hasData && snapshot.data != null) {
                  return Text("${snapshot.data}");
                } else {
                  return const Text("Chưa chọn cơ sở dữ liệu");
                }
              },
            ),
            onTap: () async {
              final databasePath = await preferences.selectDatabaseDirectory();
              switch (databasePath) {
                case String databasePath:
                  messenger.showSnackBar(
                    SnackBar(
                        content: Text("Đã chọn cơ sở dữ liệu: $databasePath")),
                  );
                  navigator.pushReplacementNamed(routeName);
                default:
                  messenger.showSnackBar(
                    const SnackBar(
                        content: Text("Không tìm thấy cơ sở dữ liệu")),
                  );
              }
            },
          ),
          Expanded(
            child: TableCalendar(
              focusedDay: now,
              firstDay: DateTime(1970, 1, 1),
              lastDay: DateTime(2099, 12, 31),
            ),
          ),
        ],
      ),
    );
  }
}
