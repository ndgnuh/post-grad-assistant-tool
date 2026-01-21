import '../../business/db_v2_providers.dart';
import '../../shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/business_enums.dart';
import '../../business/view_models.dart';
import '../../custom_widgets.dart';
import './providers.dart';
import './widgets.dart';
import 'phd_student_pages.dart';

class _ActionDispatcher {
  _ActionDispatcher();

  void focusSearchField(BuildContext context) {
    final searchFocusNode = FocusNodeProvider.of(context);
    FocusScope.of(context).requestFocus(searchFocusNode);
  }

  void goToCreatePhdStudent(BuildContext context) {
    final navigator = Navigator.of(context);
    navigator.pushNamed(PhdStudentCreatePage.routeName);
  }
}

class PhdStudentListPage extends StatelessWidget {
  static const routeName = '/phd-students';
  const PhdStudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    final actions = _ActionDispatcher();

    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text('PhD Students'),
        ),
      ),
      body: FocusNodeProvider(
        child: CommonShortcuts(
          onCreateNew: actions.goToCreatePhdStudent,
          onSearch: actions.focusSearchField,
          child: ConstrainedBody(
            child: Padding(
              padding: EdgeInsets.all(context.gutter),
              child: Column(
                spacing: gutter,
                verticalDirection: context.verticalDirection,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      spacing: gutter,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CohortSelector(),
                        ),
                        _GotoCreateButton(),
                      ],
                    ),
                  ),
                  Expanded(child: _PhdStudentListView()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhdStudentListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idsAsync = ref.watch(filteredPhdStudentIdsProvider);
    switch (idsAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return Center(child: Text('Error: ${idsAsync.error}'));
      default:
    }

    final ids = idsAsync.value!;
    if (ids.isEmpty) {
      return const Center(child: Text('Không có NCS trong khóa này'));
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return _PhdStudentInfo(studentId: ids[index]);
      },
      itemCount: ids.length,
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

class _PhdStudentInfo extends ConsumerWidget {
  final int studentId;
  const _PhdStudentInfo({
    required this.studentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(PhdStudentViewModel.providerById(studentId));
    switch (modelAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return Center(child: Text('Error: ${modelAsync.error}'));
      default:
    }

    final model = modelAsync.value!;
    final student = model.student;
    final supervisor = model.supervisor;
    final secondarySupervisor = model.secondarySupervisor;

    final supervisorNames = [
      supervisor.name,
      if (secondarySupervisor != null) secondarySupervisor.name,
    ].join(", ");

    // Stauts line
    final studentStatus = switch (student.status) {
      StudentStatus.admission => "Đợi xét tuyển",
      StudentStatus.normal => "Đang học",
      StudentStatus.studying => "Đang học",
      StudentStatus.quit => "Thôi học",
      StudentStatus.graduated => "Đã tốt nghiệp",
      StudentStatus.delayedAdmission => "Hoãn xét tuyển",
    };

    final subtitle = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Trạng thái: $studentStatus"),
        Text("Hướng dẫn: $supervisorNames"),
      ],
    );

    return ListTile(
      title: Text(student.name),
      titleAlignment: ListTileTitleAlignment.titleHeight,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('#${student.managementId}'),
          Icon(Symbols.chevron_right),
        ],
      ),
      leading: CircleAvatar(
        child: Text(student.name.split(" ").last.substring(0, 1)),
      ),
      subtitle: IntrinsicWidth(child: subtitle),
      onTap: () => Navigator.of(context).pushNamed(
        PhdStudentDetailsPage.routeName,
        arguments: studentId,
      ),
    );
  }
}
