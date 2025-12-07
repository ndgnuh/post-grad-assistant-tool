import 'package:riverpod/riverpod.dart';
import 'package:drift/drift.dart';
import '../../business/documents.dart';
import '../../business/db_v2_providers.dart';

import 'package:fami_tools/business/view_models.dart';

final registeredStudentIdsProvider = FutureProvider<List<int>>((ref) async {
  final AppDatabase db = await ref.watch(mainDatabaseProvider.future);

  final studentIdStmt = db.select(db.student).join([
    innerJoin(db.thesis, db.thesis.studentId.equalsExp(db.student.id)),
    innerJoin(db.teacher, db.thesis.supervisorId.equalsExp(db.teacher.id)),
  ]);
  studentIdStmt.where(
    db.thesis.studentId.isNotNull() &
        (db.thesis.defenseStatus.equals(ThesisStatus.defenseApplied.value) |
            db.thesis.defenseStatus.equals(ThesisStatus.defenseIntended.value) |
            db.thesis.defenseStatus.equals(ThesisStatus.defenseApproved.value)),
  );
  studentIdStmt.addColumns([db.thesis.studentId]);
  studentIdStmt.orderBy([
    OrderingTerm.asc(db.teacher.teacherGroupId),
    OrderingTerm.asc(db.thesis.supervisorId),
    OrderingTerm.asc(db.student.cohort),
  ]);

  final ids = await studentIdStmt.map((row) {
    final studentId = row.read(db.thesis.studentId);
    return studentId as int;
  }).get();

  return ids;
});

/// Score sheets
final scoreSheetsPdfProvider = FutureProvider<PdfFile>(
  (ref) async {
    final ids = await ref.watch(registeredStudentIdsProvider.future);
    final names = <String>[];
    for (final studentId in ids) {
      final student = await ref.watch(studentByIdProvider(studentId).future);
      names.add(student.name);
    }

    return PdfFile.mscThesis.multipleScoreSheets(studentNames: names);
  },
);

/// Council suggestions
final councilSuggestionsPdfProvider = FutureProvider<PdfFile>(
  (ref) async {
    final ids = await ref.watch(registeredStudentIdsProvider.future);
    final models = <ThesisViewModel>[];
    for (final studentId in ids) {
      final model = await ref.watch(
        ThesisViewModel.providerByStudentId(studentId).future,
      );
      models.add(model);
    }

    return PdfFile.mscThesis.multipleCouncilSuggestion(models: models);
  },
);

/// Get thesis view model from [thesisId]

/// Get thesis view model from [studentId]
