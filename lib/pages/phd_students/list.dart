import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../custom_widgets.dart';
import './providers.dart';
import './widgets.dart';
import 'create.dart';

class PhdStudentListPage extends StatelessWidget {
  static const routeName = '/phd-students';
  const PhdStudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    return ConstrainedScreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PhD Students'),
        ),
        body: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            spacing: gutter,
            children: [
              IntrinsicHeight(
                child: Row(
                  spacing: gutter,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: CohortSelector()),
                    _GotoCreateButton(),
                  ],
                ),
              ),
              Expanded(child: _PhdStudentListView()),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhdStudentListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(phdStudentListViewModelProvider);
    switch (modelAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return Center(child: Text('Error: ${modelAsync.error}'));
      default:
    }

    final model = modelAsync.value!;
    if (model.cohort == null) {
      return const Center(child: Text('Chọn khóa NCS trước'));
    }

    if (model.students.isEmpty) {
      return const Center(child: Text('Không có NCS trong khóa này'));
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        return _PhdStudentInfo(model: model, index: index);
      },
      itemCount: model.students.length,
    );
  }
}

class _GotoCreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(PhdStudentCreatePage.routeName);
      },
      label: const Text('Thêm'),
      icon: const Icon(Symbols.add),
    );
  }
}

class _PhdStudentInfo extends StatelessWidget {
  final PhdStudentListViewModel model;
  final int index;
  const _PhdStudentInfo({required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    final student = model.students[index];
    final supervisor = model.supervisors[student]!;
    final secondarySupervisor = model.secondarySupervisor[student];

    return ExpansionTile(
      initiallyExpanded: false,
      title: Text(student.name),
      children: [
        ListTile(
          leading: Icon(Symbols.numbers),
          title: Text("Mã hồ sơ"),
          subtitle: Text(student.admissionId),
        ),
        ListTile(
          leading: Icon(Symbols.assignment),
          title: Text("Đề tài"),
          subtitle: Text(student.thesis),
        ),
        ListTile(
          leading: Icon(Symbols.person),
          title: (secondarySupervisor == null)
              ? Text("Giảng viên hướng dẫn")
              : Text("Giảng viên hướng dẫn 1"),
          subtitle: Text(supervisor.name),
        ),
        if (secondarySupervisor != null)
          ListTile(
            leading: Icon(Symbols.person_2),
            title: Text("Giảng viên hướng dẫn 2"),
            subtitle: Text(secondarySupervisor.name),
          ),
      ],
    );
  }
}
