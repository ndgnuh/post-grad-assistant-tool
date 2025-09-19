import 'dart:async';

import 'package:fami_tools/datamodels.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v1_providers.dart';
import '../domain_objects.dart';

final thesesByIdsProvider = AsyncNotifierProvider.family(
  ThesesByIds.new,
);
final thesisByCohortProvider = AsyncNotifierProvider.family(
  ThesisByCohortNotifier.new,
);

final thesisByIdProvider = AsyncNotifierProvider.family(
  ThesisByIdNotifier.new,
);

final thesisByStudentIdProvider = AsyncNotifierProvider.family(
  ThesisByStudentId.new,
);

class ThesesByIds extends AsyncNotifier<List<Thesis>> {
  List<int> thesisIds;
  ThesesByIds(this.thesisIds);

  @override
  FutureOr<List<Thesis>> build() async {
    final futures = thesisIds.map(
      (id) => ref.watch(thesisByIdProvider(id).future),
    );
    final theses = await Future.wait(futures);
    return theses.whereType<Thesis>().toList();
  }
}

class ThesisByCohortNotifier extends AsyncNotifier<Map<Student, Thesis?>> {
  Cohort cohort;
  ThesisByCohortNotifier(this.cohort);

  @override
  FutureOr<Map<Student, Thesis?>> build() async {
    final students = await ref.watch(studentByCohortProvider(cohort).future);
    final result = <Student, Thesis?>{};
    for (final student in students) {
      result[student] = await ref.watch(
        thesisByStudentIdProvider(student.id).future,
      );
    }
    return result;
  }
}

class ThesisByIdNotifier extends AsyncNotifier<Thesis> {
  int thesisId;
  ThesisByIdNotifier(this.thesisId);

  @override
  FutureOr<Thesis> build() async {
    return await Thesis.getById(thesisId);
  }
}

class ThesisByStudentId extends AsyncNotifier<Thesis?> {
  int studentId;
  ThesisByStudentId(this.studentId);

  @override
  FutureOr<Thesis?> build() async {
    return await Thesis.getByStudentId(studentId);
  }
}
