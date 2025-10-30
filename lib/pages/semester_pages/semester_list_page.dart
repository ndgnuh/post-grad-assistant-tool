import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fami_tools/custom_widgets.dart';
import 'package:intl/intl.dart';

import 'semester_pages.dart';

class _SemesterTile extends ConsumerWidget {
  final String semesterId;

  const _SemesterTile({
    super.key,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final semesterAsync = ref.watch(semesterByIdProvider(semesterId));
    switch (semesterAsync) {
      case AsyncLoading():
        return const ListTile(
          title: Text("Loading..."),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text("Lỗi rồi"),
          subtitle: Text(error.toString()),
        );
      default:
    }

    final semester = semesterAsync.value!;

    final dateFormat = DateFormat('dd/MM/yyyy');
    final registrationOpenDate = dateFormat.format(
      semester.registrationBeginDate,
    );
    final registrationCloseDate = dateFormat.format(
      semester.registrationEndDate,
    );
    final studyStartDate = dateFormat.format(
      semester.classBeginDate,
    );
    final studyEndDate = dateFormat.format(
      semester.classEndDate,
    );
    final gradeSubmissionDeadline = dateFormat.format(
      semester.gradeSubmissionDeadline,
    );

    final subtiles = [
      "Đăng ký học: $registrationOpenDate - $registrationCloseDate",
      "Thời gian học: $studyStartDate - $studyEndDate",
      "Hạn nhập điểm: $gradeSubmissionDeadline",
    ];

    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    return ListTile(
      title: Text(semester.id),
      subtitle: Text(subtiles.join('\n')),
      onTap: () async {
        messenger.showSnackBar(
          SnackBar(content: Text("Chức năng đang được phát triển.")),
        );
        final route = MaterialPageRoute(
          builder: (context) => SemesterDetailsPage(semesterId: semesterId),
        );
        await navigator.push(route);
      },
    );
  }
}

class SemesterListPage extends StatelessWidget {
  static const routeName = '/academic_year/list';
  const SemesterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text("Đợt học"),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  PageAcademicYearCreate.routeName,
                );
              },
            ),
          ],
        ),
      ),
      body: ConstrainedBody(child: _SemesterListView()),
    );
  }
}

class _SemesterListView extends ConsumerWidget {
  Widget _buildAcademicYearList(List<String> semesterIds) {
    return ListView.builder(
      itemCount: semesterIds.length,
      itemBuilder: (context, index) {
        final semesterId = semesterIds[index];
        return _SemesterTile(
          key: ValueKey(semesterId),
          semesterId: semesterId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idsAsync = ref.watch(semesterIdsProvider);
    switch (idsAsync) {
      case AsyncLoading():
        return const Center(
          child: SizedBox.square(
            dimension: 42,
            child: CircularProgressIndicator(),
          ),
        );
      case AsyncError(:final error):
        return Center(child: Text("Error: $error"));
      case AsyncData(:final value):
        return _buildAcademicYearList(value);
    }
  }
}
