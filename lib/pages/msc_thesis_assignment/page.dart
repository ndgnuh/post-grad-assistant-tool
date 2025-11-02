import 'package:fami_tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../pages.dart';
import 'providers.dart';
import 'selection_page.dart';

class MscThesisAssignmentPage extends StatelessWidget {
  const MscThesisAssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: Text('Giao đề tài'),
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
              CohortDropdownMenu(),
              Expanded(
                child: StudentThesisListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentThesisListView extends ConsumerWidget {
  const StudentThesisListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentIdsAsync = ref.watch(studentIdsProvider);
    switch (studentIdsAsync) {
      case AsyncLoading():
        return Center(
          child: CircularProgressIndicator(),
        );
      case AsyncError(:final error):
        return Center(
          child: Text('Đã có lỗi xảy ra: $error'),
        );
      default:
    }

    final ids = studentIdsAsync.value;
    if (ids == null) {
      return Center(
        child: Text('Vui lòng chọn khóa học viên để xem danh sách.'),
      );
    }

    if (ids.isEmpty) {
      return Center(
        child: Text('Không có học viên nào trong khóa học này.'),
      );
    }

    return ListView.separated(
      itemCount: ids.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final studentId = ids[index];
        return StudentThesisItem(
          key: ValueKey(studentId),
          studentId: studentId,
        );
      },
    );
  }
}

class StudentThesisItem extends ConsumerWidget {
  final int studentId;
  const StudentThesisItem({super.key, required this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(assignmentViewModelProvider(studentId));
    switch (modelAsync) {
      case AsyncLoading():
        return ListTile(
          title: Text('Loading student ID: $studentId'),
          subtitle: LinearProgressIndicator(),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text('Error loading student ID: $studentId'),
          subtitle: Text('Error: $error'),
        );
      default:
    }

    final model = modelAsync.value!;
    final supervisor = model.supervisor;
    final thesis = model.thesis;
    final student = model.student;
    final subtitle = [
      thesis?.vietnameseTitle ?? 'Chưa có đề tài',
      if (supervisor != null) 'Giảng viên hướng dẫn: ${supervisor.name}',
    ].join('\n');

    return ListTile(
      title: Text(student.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Symbols.numbers),
          Text(student.studentId ?? "N/A"),
          Icon(Symbols.chevron_right),
        ],
      ),
      subtitle: Text(subtitle),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MscThesisSelectionPage(
              studentId: studentId,
            ),
          ),
        );
      },
    );
  }
}

class CohortDropdownMenu extends ConsumerWidget {
  const CohortDropdownMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(cohortSelectionProvider);

    final List<CohortData> options = modelAsync.maybeWhen(
      data: (model) => model.options,
      orElse: () => [],
    );

    final CohortData? selected = modelAsync.maybeWhen(
      data: (model) => model.selected,
      orElse: () => null,
    );

    // Placeholder for the actual dropdown menu implementation
    return DropdownMenu<CohortData>(
      label: const Text('Khóa học viên'),
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: [
        for (final option in options)
          DropdownMenuEntry(
            value: option,
            label: option.id,
          ),
      ],
      initialSelection: selected,
      onSelected: (CohortData? cohort) {
        ref.read(cohortSelectionProvider.notifier).select(cohort);
      },
    );
  }
}
