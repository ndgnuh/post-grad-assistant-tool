import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';
import '../../business/db_v2_providers.dart';
import '../../business/view_models.dart';
import '../../business/documents.dart';

final studentsProvider = FutureProvider<List<ThesisViewModel>>((ref) async {
  final db = await ref.watch(mainDatabaseProvider.future);
  final stmt = db.thesis.select().join([
    innerJoin(db.student, db.thesis.studentId.equalsExp(db.student.id)),
  ]);

  stmt.where(db.thesis.paymentStatus.equals(PaymentStatus.unpaid.value));
  stmt.where(
    db.thesis.defenseStatus.equals(ThesisStatus.defenseIntended.value) |
        db.thesis.defenseStatus.equals(ThesisStatus.defenseApplied.value) |
        db.thesis.defenseStatus.equals(ThesisStatus.defenseApproved.value) |
        db.thesis.defenseStatus.equals(ThesisStatus.defenseFailed.value),
  );

  stmt.orderBy([
    OrderingTerm(expression: db.thesis.defenseDecisionNumber),
    OrderingTerm(expression: db.thesis.defenseDate),
  ]);

  if (ref.isFirstBuild) {
    stmt.watch().listen((rows) {
      // Just to trigger updates
      ref.invalidateSelf();
    });
  }

  final ids = await stmt.map((r) => r.read(db.thesis.id)).get();

  final viewModels = <ThesisViewModel>[];
  for (final id in ids.whereType<int>()) {
    final vm = await ref.watch(ThesisViewModel.providerById(id).future);
    viewModels.add(vm);
  }
  return viewModels;
});

class PaymentEntry {
  final TeacherData teacher;
  final String role;
  const PaymentEntry({required this.teacher, required this.role});
}

class _ThesisPaymentModel {
  final List<ThesisData> theses;
  final List<Map<ThesisPaymentRole, int>> payPerRole;
  final List<TeacherData> presidents;
  final List<TeacherData> firstReviewers;
  final List<TeacherData> secondReviewers;
  final List<TeacherData> members;

  int getPaymentPerRole(ThesisPaymentRole role) {
    return switch (role) {
      ThesisPaymentRole.president => 400_000,
      ThesisPaymentRole.reviewer => 400_000,
      ThesisPaymentRole.secretary => 400_000,
      ThesisPaymentRole.member => 400_000,
      ThesisPaymentRole.commentation => 650_000,
    };
  }

  List<PaymentEntry> get paymentEntries {
    final entries = <PaymentEntry>[];
    return entries;
  }

  List<TeacherData> get allTeachers {
    final teachers = <TeacherData>{};
    for (final t in presidents) {
      teachers.add(t);
    }
    for (final t in firstReviewers) {
      teachers.add(t);
    }
    return teachers.toList();
  }

  const _ThesisPaymentModel({
    required this.theses,
    required this.presidents,
    required this.firstReviewers,
    required this.secondReviewers,
    required this.members,
    required this.payPerRole,
  });
}
