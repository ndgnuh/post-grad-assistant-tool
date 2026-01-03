import '../../custom_widgets.dart' show UserFacingException;
import '../db_v2_providers.dart';
import 'package:riverpod/riverpod.dart';

import '../view_models.dart';

/// View model dùng cho việc hiển thị dữ liệu của luận vân thạc sĩ
class ThesisViewModel {
  final StudentData? student;
  final ThesisData thesis;
  final TeacherData supervisor;
  final TeacherData? secondarySupervisor;

  final TeacherData? president;
  final TeacherData? secretary;
  final TeacherData? firstReviewer;
  final TeacherData? secondReviewer;
  final TeacherData? member;

  final DocumentViewModel? councilDecisionViewModel;

  DocumentViewModel get requireCouncilDecision {
    if (councilDecisionViewModel == null) {
      throw UserFacingException('Chưa có quyết định thành lập hội đồng');
    }
    return councilDecisionViewModel!;
  }

  StudentData get requireStudent {
    if (student == null) {
      throw UserFacingException('Chưa giao đề tài cho sinh viên nào');
    }
    return student!;
  }

  TeacherData get requirePresident {
    if (president == null) {
      throw UserFacingException('Chưa có chủ tịch hội đồng');
    }
    return president!;
  }

  TeacherData get requireSecretary {
    if (secretary == null) {
      throw UserFacingException('Chưa có thư ký hội đồng');
    }
    return secretary!;
  }

  TeacherData get requireFirstReviewer {
    if (firstReviewer == null) {
      throw UserFacingException('Chưa có phản biện 1');
    }
    return firstReviewer!;
  }

  TeacherData get requireSecondReviewer {
    if (secondReviewer == null) {
      throw UserFacingException('Chưa có phản biện 2');
    }
    return secondReviewer!;
  }

  TeacherData get requireMember {
    if (member == null) {
      throw UserFacingException('Chưa có ủy viên hội đồng');
    }
    return member!;
  }

  const ThesisViewModel({
    required this.student,
    required this.thesis,
    required this.supervisor,
    this.secondarySupervisor,
    this.president,
    this.secretary,
    this.firstReviewer,
    this.secondReviewer,
    this.member,
    this.councilDecisionViewModel,
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

    final secondarySupervisor = switch (thesis.secondarySupervisorId) {
      null => null,
      int id => await ref.watch(teacherByIdProvider(id).future),
    };

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
      int id => await ref.watch(DocumentViewModel.provider(id).future),
    };

    return ThesisViewModel(
      student: student,
      thesis: thesis,
      supervisor: supervisor,
      secondarySupervisor: secondarySupervisor,
      president: president,
      secretary: secretary,
      firstReviewer: firstReviewer,
      secondReviewer: secondReviewer,
      member: member,
      councilDecisionViewModel: councilDecision,
    );
  },
);

/// Get thesis view model from [studentId]
final _byStudentIdProvider = StreamProvider.autoDispose.family(
  (ref, int studentId) async* {
    final thesisId = (await ref.watch(
      thesisIdByStudentProvider(studentId).future,
    ))!;

    final viewModel = await ref.watch(
      _byIdProvider(thesisId).future,
    );

    yield viewModel;
  },
);
