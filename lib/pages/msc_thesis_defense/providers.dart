import 'package:fami_tools/business/copy_pasta.dart';
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

  if (ref.isFirstBuild) {
    studentIdStmt.watch().listen((event) {
      ref.invalidateSelf();
    });
  }
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

    final model = MscThesisScoreSheetDocument(studentNames: names);
    return await model.buildPdf(
      config: MscThesisScoreSheetDocument.defaultPdfConfig,
    );
  },
);

final councilDecisionDocxFilesProvider = FutureProvider(
  (Ref ref) async {
    final ids = await ref.read(registeredStudentIdsProvider.future);
    final docx = <DocxFile>[];

    for (final id in ids) {
      final thesisViewModel = await ref.read(
        ThesisViewModel.providerByStudentId(id).future,
      );
      final model = MscThesisCouncilDecisionDocument(
        thesisViewModel: thesisViewModel,
        major: "Toán - Tin", // TODO: no magic value
      );
      docx.add(await model.buildDocx());
    }
    return docx;
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

    return MscThesisCouncilSuggestionDocument.buildCombinedPdf(
      models: models,
      config: MscThesisCouncilSuggestionDocument.defaultPdfConfig,
    );
  },
);

/// Get thesis view model from [thesisId]

/// Get thesis view model from [studentId]

final thesisFinishingEmailProvider = FutureProvider<Email>(
  (Ref ref) async {
    final ids = await ref.watch(registeredStudentIdsProvider.future);
    final viewModels = <StudentViewModel>[];
    for (final studentId in ids) {
      final studentViewModel = await ref.watch(
        StudentViewModel.providerById(studentId).future,
      );
      viewModels.add(studentViewModel);
    }

    // my name and supervisor
    final myName = await ref.watch(myNameProvider.future);
    final mySupervisor = await ref.watch(mySupervisorProvider.future);
    final ccRecipients = {mySupervisor.requireEmail};

    // Tiêu đề, người nhận, nội dung email
    final title = "Về việc tính GD cho các luận văn thạc sĩ đã bảo vệ";
    final recipients = <String>{};

    final body = StringBuffer();
    body.writeln("Kính gửi các Thầy/Cô hướng dẫn luận văn thạc sĩ,");
    body.writeln("");
    body.writeln(
      "Luận văn thạc sĩ của các học viên mà Thầy/Cô hướng dẫn đã hoàn thành bảo vệ:",
    );

    for (final model in viewModels) {
      // Write body
      final student = model.student;
      final supervisor = model.supervisor!;
      final secondary = model.secondarySupervisor;
      body.write(
        "- ${student.name} (${student.studentId}), GVHD: ${supervisor.nameWithTitle}",
      );
      switch (secondary?.nameWithTitle) {
        case String name:
          body.writeln(", GVHD2: $name");
        default:
          body.writeln("");
      }

      // Collect recipients
      recipients.add(supervisor.requireEmail);
      if (secondary != null) {
        recipients.add(secondary.requireEmail);
      }
    }
    body.writeln("");
    body.writeln(
      "Kính mời Thầy/Cô xem danh sách kèm theo ở trên và thực hiện chọn kỳ kết thúc, kỳ tính GD trên hệ thống Quản lý Đào tạo. "
      "Kỳ tính GD phải là kỳ kết thúc hoặc nằm trước kỳ kết thúc. Kỳ hè không được chọn là kỳ tính GD ạ.",
    );
    body.writeln("Em cảm ơn Thầy/Cô ạ.");
    body.writeln("");
    body.writeln("Trân trọng,");
    body.writeln(myName);

    final email = Email(
      subject: title,
      body: body.toString(),
      ccRecipients: ccRecipients,
      recipients: recipients,
    );
    return email;
  },
);
