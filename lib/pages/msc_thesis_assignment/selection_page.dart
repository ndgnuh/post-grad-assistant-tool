import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';

class MscThesisSelectionPage extends StatelessWidget {
  final int studentId;
  const MscThesisSelectionPage({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: StudentName(studentId: studentId),
        ),
      ),
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            verticalDirection: context.verticalDirection,
            spacing: context.gutter,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Tìm kiểm',
                ),
              ),
              OutlinedButton(onPressed: () {}, child: Text("Tạo mới")),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentName extends ConsumerWidget {
  final int studentId;
  const StudentName({super.key, required this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentAsync = ref.watch(studentByIdProvider(studentId));
    return studentAsync.when(
      data: (student) => Text("${student.name} - ${student.studentId}"),
      loading: () => LinearProgressIndicator(),
      error: (error, stack) => Text('Lỗi: $error'),
    );
  }
}
