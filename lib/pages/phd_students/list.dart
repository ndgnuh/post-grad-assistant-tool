import 'package:fami_tools/business/db_v2_providers/phd_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../custom_widgets.dart';
import './drift_model.dart';

final _viewModelProvider = Provider<_ViewModel>((ref) => _ViewModel());

class PhdStudentListPage extends StatelessWidget {
  static const routeName = '/phd-students';
  const PhdStudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    final largeScreen = context.isLargeScreen600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nghiên cứu sinh'),
      ),
      body: Padding(
        padding: EdgeInsets.all(gutter),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: gutter,
          children: [
            if (largeScreen)
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: gutter,
                  children: [
                    _CohortSelector(),
                    Expanded(
                      child: _SearchBar(),
                    ),
                    _ActionButton(),
                  ],
                ),
              ),

            if (!largeScreen) _CohortSelector(),
            if (!largeScreen) _SearchBar(),
            Expanded(child: _ListView()),
            if (!largeScreen) _ActionButton(),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return FilledButton.icon(
      label: Text("Thêm NCS"),
      icon: Icon(Icons.add),
      onPressed: () => navigator.pushNamed('/phd-students/create'),
    );
  }
}

class _CohortSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cohortsAsync = ref.watch(phdCohortsProvider);
    switch (cohortsAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error):
        return Text('Error: $error');
      default:
    }

    final cohorts = cohortsAsync.value!;
    final selectedCohort = ref.watch(selectedCohortProvider);

    return DropdownMenu<String?>(
      initialSelection: selectedCohort,
      onSelected: (value) {
        final notifier = ref.read(selectedCohortProvider.notifier);
        notifier.select(value);
      },
      dropdownMenuEntries: [
        DropdownMenuEntry<String?>(
          value: null,
          label: ('Chọn khóa NCS'),
        ),
        ...cohorts.map(
          (cohort) => DropdownMenuEntry<String?>(
            value: cohort,
            label: (cohort),
          ),
        ),
      ],
    );
  }
}

class _ListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCohort = ref.watch(selectedCohortProvider);
    if (selectedCohort == null) {
      return Center(
        child: Text("Chọn niên khóa để hiển thị NCS"),
      );
    }

    final phdStudentsAsync = ref.watch(filteredPhdStudentsProvider);
    switch (phdStudentsAsync) {
      case AsyncLoading():
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      default:
    }

    final phdStudents = phdStudentsAsync.value!;

    return _buildListView(context, phdStudents, ref);
  }

  Widget _buildListView(
    BuildContext context,
    List<PhdStudentViewModel> data,
    WidgetRef ref,
  ) {
    final rows = <DataRow>[];
    for (final (i, data) in data.indexed) {
      final student = data.student;
      final supervisor = data.supervisor;
      // final secondarySupervisor = data.secondarySupervisor;

      final infos = <String>[
        (i + 1).toString(),
        student.name,
        student.dateOfBirth.toString(),
        student.phone,
        student.personalEmail,
        supervisor.name,
        student.thesis,
      ];

      final cells = [for (final info in infos) DataCell(Text(info))];
      rows.add(DataRow(cells: cells));
    }
    return ExpandedScrollView(
      child: DataTable(
        columns: [
          DataColumn(label: Text("STT")),
          DataColumn(label: Text("Họ tên")),
          DataColumn(label: Text("Ngày sinh")),
          DataColumn(label: Text("Số điện thoại")),
          DataColumn(label: Text("Email")),
          DataColumn(label: Text("GVHD")),
          DataColumn(label: Text("Đề tài")),
        ],
        rows: rows,
      ),
    );
  }
}

class _SearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(_viewModelProvider);
    return SearchBar(
      hintText: "Tìm kiếm",
      controller: viewModel.searchTextController,
    );
  }
}

@immutable
class _ViewModel {
  final ValueNotifier<String?> selectedCohortNotifier = ValueNotifier(null);
  final SearchController searchTextController = SearchController();

  bool get noop => selectedCohort == null;
  String? get searchText => searchTextController.text;
  String? get selectedCohort => selectedCohortNotifier.value;
}

// class _PhdStudentList extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final viewModel = ref.read(_viewModelProvider);
//     final viewModel.selectedCohort.value;
//     final allStudents = ref.watch(phdStudentsByCohorts());
//
//     return allStudents.when(
//       data: (students) {
//         return ListView.builder(
//           itemCount: students.length,
//           itemBuilder: (context, index) {
//             final student = students[index];
//             return ListTile(
//               title: Text(student.name),
//               subtitle: Text('Cohort: ${student.cohortYear}'),
//             );
//           },
//         );
//       },
//       loading: () => CircularProgressIndicator(),
//       error: (error, stack) => Text('Error: $error'),
//     );
//   }
// }
