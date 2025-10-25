import 'package:riverpod/riverpod.dart';
import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';

final thesisIdsProvider = AsyncNotifierProvider(
  () => ThesisIdsNotifier(),
);

final searchTextProvider = NotifierProvider(
  () => StringNotifier(),
);

final thesisListViewModelProvider = AsyncNotifierProvider(
  () => ThesisListViewModelNotifier(),
);

class ThesisListViewModel {
  final List<ThesisData> theses;
  final Map<ThesisData, TeacherData> supervisors;
  final Map<ThesisData, StudentData> students;
  final bool promptUserInput;

  ThesisListViewModel({
    required this.theses,
    required this.supervisors,
    required this.students,
    required this.promptUserInput,
  });
}

class ThesisListViewModelNotifier extends AsyncNotifier<ThesisListViewModel> {
  @override
  Future<ThesisListViewModel> build() async {
    final searchText = ref.watch(searchTextProvider);

    if (searchText.isEmpty) {
      return ThesisListViewModel(
        theses: [],
        supervisors: {},
        students: {},
        promptUserInput: true,
      );
    }

    final db = await ref.watch(appDatabaseProvider.future);
    final ids = await db.searchTheses(searchText: searchText).get();

    final theses = <ThesisData>[];
    final supervisors = <ThesisData, TeacherData>{};
    final students = <ThesisData, StudentData>{};

    for (final id in ids) {
      final thesisAsync = await ref.watch(thesisByIdProvider(id).future);
      final thesis = thesisAsync!;
      theses.add(thesis);

      final supervisor = await ref.watch(
        teacherByIdProvider(thesis.supervisorId).future,
      );
      supervisors[thesis] = supervisor;

      switch (thesis.studentId) {
        case int id:
          final student = await ref.watch(
            studentByIdProvider(id).future,
          );
          students[thesis] = student!;
      }
    }

    return ThesisListViewModel(
      theses: theses,
      supervisors: supervisors,
      students: students,
      promptUserInput: false,
    );
  }
}
