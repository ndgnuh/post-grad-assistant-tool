import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../custom_widgets.dart';

class CourseClassCreatePage extends StatelessWidget {
  static const routeName = "/course_classes/create";

  const CourseClassCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        withTabBar: true,
        child: AppBar(
          title: const Text("Tạo lớp mới"),
        ),
      ),
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            children: [
              Text("TODO"),
            ],
          ),
        ),
      ),
    );
  }
}
