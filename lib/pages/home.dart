import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:core';
import '../drawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return Scaffold(
      appBar: AppBar(title: const Text("FamiTools")),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
