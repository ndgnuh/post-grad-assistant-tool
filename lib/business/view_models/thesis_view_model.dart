import 'dart:typed_data';

import '../db_v2_providers.dart';
import 'package:riverpod/riverpod.dart';

/// View model dùng cho việc hiển thị dữ liệu của luận vân thạc sĩ
class ThesisViewModel {
  final StudentData? student;
  final ThesisData thesis;
  final TeacherData supervisor;

  final TeacherData? president;
  final TeacherData? secretary;
  final TeacherData? firstReviewer;
  final TeacherData? secondReviewer;
  final TeacherData? member;

  final DocumentData? councilDecision;
  final Uint8List? councilDecisionContent;

  const ThesisViewModel({
    required this.student,
    required this.thesis,
    required this.supervisor,
    this.president,
    this.secretary,
    this.firstReviewer,
    this.secondReviewer,
    this.member,
    this.councilDecision,
    this.councilDecisionContent,
  });

  /* Providers */

  /// [FutureProvider] for [ThesisViewModel] by Thesis ID
  static final providerById = _byIdProvider;

  /// [FutureProvider] for [ThesisViewModel] by Student's ID
  static final providerByStudentId = _byStudentIdProvider;

  List<TeacherData?> get councilMembers {
    return [
      president,
      secretary,
      firstReviewer,
      secondReviewer,
      member,
    ];
  }
}

final _byIdProvider = FutureProvider.family(
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

    final councilDecision = switch (thesis.councilDecisionId) {
      null => null,
      int id => await ref.watch(documentByIdProvider(id).future),
    };

    final councilDecisionContent = switch (councilDecision?.contentId) {
      null => null,
      int id => await ref.watch(documentContentProvider(id).future),
    };

    return ThesisViewModel(
      student: student,
      thesis: thesis,
      supervisor: supervisor,
      president: president,
      secretary: secretary,
      firstReviewer: firstReviewer,
      secondReviewer: secondReviewer,
      member: member,
      councilDecision: councilDecision,
      councilDecisionContent: councilDecisionContent,
    );
  },
);

/// Get thesis view model from [studentId]
final _byStudentIdProvider = FutureProvider.family(
  (ref, int studentId) async {
    final thesisId = (await ref.watch(
      thesisIdByStudentProvider(studentId).future,
    ))!;

    final viewModel = await ref.watch(
      _byIdProvider(thesisId).future,
    );

    return viewModel;
  },
);
