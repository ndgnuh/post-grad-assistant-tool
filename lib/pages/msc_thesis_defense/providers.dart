import 'package:fami_tools/business/pdfs/pdfs.dart';
import 'package:riverpod/riverpod.dart';
import 'package:drift/drift.dart';
import '../../business/db_v2_providers.dart';

import 'models.dart';

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
    final models = <StudentThesisViewModel>[];
    for (final studentId in ids) {
      final model = await ref.watch(
        viewModelByStudentProvider(studentId).future,
      );
      models.add(model);
    }

    return PdfFile.mscThesis.multipleCouncilSuggestion(models: models);
  },
);

/// Get thesis view model from [thesisId]
final viewModelByIdProvider = FutureProvider.family(
  (ref, int thesisId) async {
    final thesis = await ref.watch(
      thesisByIdProvider(thesisId).future,
    );

    final student = switch (thesis.studentId) {
      null => null,
      int id => await ref.watch(studentByIdProvider(id).future),
    };

    final supervisor = await ref.watch(
      teacherByIdProvider(thesis.supervisorId).future,
    );

    final president = switch (thesis.presidentId) {
      null => null,
      int id => await ref.watch(teacherByIdProvider(id).future),
    };

    final secretary = switch (thesis.secretaryId) {
      null => null,
      int id => await ref.watch(teacherByIdProvider(id).future),
    };

    final firstReviewer = switch (thesis.firstReviewerId) {
      null => null,
      int id => await ref.watch(teacherByIdProvider(id).future),
    };

    final secondReviewer = switch (thesis.secondReviewerId) {
      null => null,
      int id => await ref.watch(teacherByIdProvider(id).future),
    };

    final member = switch (thesis.memberId) {
      null => null,
      int id => await ref.watch(teacherByIdProvider(id).future),
    };

    return StudentThesisViewModel(
      student: student,
      thesis: thesis,
      supervisor: supervisor,
      president: president,
      secretary: secretary,
      firstReviewer: firstReviewer,
      secondReviewer: secondReviewer,
      member: member,
    );
  },
);

/// Get thesis view model from [studentId]
final viewModelByStudentProvider = FutureProvider.family(
  (ref, int studentId) async {
    final thesisId = (await ref.watch(
      thesisIdByStudentProvider(studentId).future,
    ))!;

    final viewModel = await ref.watch(
      viewModelByIdProvider(thesisId).future,
    );

    return viewModel;
  },
);
