import 'package:riverpod/riverpod.dart';

import '../../business/db_v2_providers.dart';

final semesterListViewModelProvider = FutureProvider((
  ref,
) async {
  final semesters = <SemesterData>[];
  final ids = await ref.watch(semesterIdsProvider.future);
  for (final id in ids) {
    final semester = await ref.watch(semesterByIdProvider(id).future);
    semesters.add(semester);
  }

  return SemesterListViewModel(semesters: semesters);
});

class SemesterListViewModel {
  final List<SemesterData> semesters;
  const SemesterListViewModel({required this.semesters});
}
