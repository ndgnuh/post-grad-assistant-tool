import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import '../../custom_widgets.dart';
import '../../business/drift_orm.dart';

typedef _FilterArgs = ({String? cohort, String searchText});

class _ViewModel {
  final selectedCohort = ValueNotifier<String?>(null);
  final searchController = SearchController();
}

final _viewModelProvider = Provider<_ViewModel>((ref) => _ViewModel());
final _filterArgsProvider = Provider<_FilterArgs>((ref) {
  final viewModel = ref.watch(_viewModelProvider);
  return (
    cohort: viewModel.selectedCohort.value,
    searchText: viewModel.searchController.text,
  );
});

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

class _ListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Kiểm tra bộ học NCS
    final filterArgs = ref.watch(_filterArgsProvider);
    final noop = filterArgs.cohort == null && filterArgs.searchText.isEmpty;
    if (noop) {
      return Center(
        child: Text("Chọn niên khóa hoặc tìm để hiển thị NCS"),
      );
    }

    return Text("Filter: ${filterArgs.cohort}, ${filterArgs.searchText}");
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

class _SearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(_viewModelProvider);

    return SearchBar(
      controller: viewModel.searchController,
      hintText: "Tìm kiếm",
      onChanged: (_) => ref.invalidate(_filterArgsProvider),
    );
  }
}

class _CohortSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cohortsAsync = ref.watch(allPhdCohortsProvider);
    switch (cohortsAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error):
        return Text('Error: $error');
      default:
    }

    final viewModel = ref.watch(_viewModelProvider);
    final selectedCohortNotifier = viewModel.selectedCohort;

    final cohorts = cohortsAsync.value!.toList()..sort();
    return DropdownMenu(
      onSelected: (value) {
        selectedCohortNotifier.value = value;
        ref.invalidate(_filterArgsProvider);
      },
      initialSelection: selectedCohortNotifier.value,
      hintText: 'Select Cohort',
      dropdownMenuEntries: [
        DropdownMenuEntry<String?>(
          value: null,
          label: 'Chọn khóa NCS',
        ),
        ...cohorts.map(
          (cohort) => DropdownMenuEntry<String?>(
            value: cohort,
            label: cohort,
          ),
        ),
      ],
    );
  }
}

// class _PhdStudentList extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final allStudents = ref.watch(allPhdStudentsProvider);
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
