import '../../business/documents.dart';
import '../../gen/assets.gen.dart';
import '../../business/documents/utilities/docx_template.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod/riverpod.dart';
import '../../business/db_v2_providers.dart';
import '../../business/documents.dart' as pdfs;
import '../../utilities/strings.dart';

final scoreSheetPdfProvider = FutureProvider.family((ref, int studentId) async {
  final provider = phdStudentByIdProvider(studentId);
  final phdStudent = await ref.watch(provider.future);
  final model = pdfs.PhdAdmissionScoreSheetDocument(student: phdStudent);
  return await model.pdf;
});

final councilSuggestionModelProvider = FutureProvider.family((
  ref,
  int studentId,
) async {
  final phdStudent = await ref.watch(phdStudentByIdProvider(studentId).future);
  final supervisor = await ref.watch(
    teacherByIdProvider(phdStudent.supervisorId).future,
  );

  final secondarySupervisor = switch (phdStudent.secondarySupervisorId) {
    null => null,
    int id => await ref.watch(teacherByIdProvider(id).future),
  };

  Future<TeacherData?> getIfNotNull(int? id) async {
    if (id == null) return null;
    return await ref.watch(teacherByIdProvider(id).future);
  }

  final president = await getIfNotNull(phdStudent.admissionPresidentId);
  final secretary = await getIfNotNull(phdStudent.admissionSecretaryId);
  final firstMember = await getIfNotNull(phdStudent.admission1stMemberId);
  final secondMember = await getIfNotNull(phdStudent.admission2ndMemberId);
  final thirdMember = await getIfNotNull(phdStudent.admission3rdMemberId);

  if (president == null ||
      secretary == null ||
      firstMember == null ||
      secondMember == null ||
      thirdMember == null) {
    return null;
  }

  final model = pdfs.PhdAdmissionCouncilSuggestionDocument(
    phdStudent: phdStudent,
    supervisor: supervisor,
    secondarySupervisor: secondarySupervisor,
    president: president,
    secretary: secretary,
    firstMember: firstMember,
    secondMember: secondMember,
    thirdMember: thirdMember,
  );
  return model;
});

final councilSuggestionPdfProvider = FutureProvider.family(
  (ref, int studentId) async {
    final model = await ref.watch(
      councilSuggestionModelProvider(studentId).future,
    );
    if (model == null) {
      return null;
    }
    return await model.buildPdf(
      config: pdfs.PhdAdmissionCouncilSuggestionDocument.defaultPdfConfig,
    );
  },
);

final councilSuggestionDocxProvider = FutureProvider.family(
  (ref, int studentId) async {
    final model = await ref.watch(
      councilSuggestionModelProvider(studentId).future,
    );
    if (model == null) {
      return null;
    }
    return await model.buildDocx();
  },
);

final admissionRecordDocxProvider = FutureProvider.family(
  (ref, int studentId) async {
    final docxAsset = await rootBundle.load(
      Assets.templates.phdAdmissionRecord,
    );

    final student = await ref.read(phdStudentByIdProvider(studentId).future);
    final president = await ref.read(
      teacherByIdProvider(student.admissionPresidentId!).future,
    );
    final secretary = await ref.read(
      teacherByIdProvider(student.admissionSecretaryId!).future,
    );
    final firstMember = await ref.read(
      teacherByIdProvider(student.admission1stMemberId!).future,
    );
    final secondMember = await ref.read(
      teacherByIdProvider(student.admission2ndMemberId!).future,
    );
    final thirdMember = await ref.read(
      teacherByIdProvider(student.admission3rdMemberId!).future,
    );
    final supervisor = await ref.read(
      teacherByIdProvider(student.supervisorId).future,
    );
    final TeacherData? secondarySupervisor;
    if (student.secondarySupervisorId != null) {
      secondarySupervisor = await ref.read(
        teacherByIdProvider(student.secondarySupervisorId!).future,
      );
    } else {
      secondarySupervisor = null;
    }

    final docx = docxAsset.buffer.asUint8List();
    final template = DocxTemplate.fromBytes(docx);
    final context = {
      'student': student.toJson(),
      'president': president.toJsonExt(),
      'secretary': secretary.toJsonExt(),
      'first_member': firstMember.toJsonExt(),
      'second_member': secondMember.toJsonExt(),
      'third_member': thirdMember.toJsonExt(),
      'supervisor': supervisor.toJsonExt(),
      'secondary_supervisor':
          secondarySupervisor?.toJsonExt() ?? {"name_with_title": ""},
    };
    final output = template.render(context);
    final name =
        "${student.admissionId}_${student.name.toPascalCase()}_BienBan";

    return DocxFile(name: name, bytes: output);
  },
);

final paymentTablePdfProvider = FutureProvider.family((
  ref,
  int studentId,
) async {
  final student = await ref.watch(phdStudentByIdProvider(studentId).future);
  if (student.admissionPresidentId == null ||
      student.admissionSecretaryId == null ||
      student.admission1stMemberId == null ||
      student.admission2ndMemberId == null ||
      student.admission3rdMemberId == null) {
    return null;
  }

  final president = await ref.watch(
    teacherByIdProvider(student.admissionPresidentId!).future,
  );
  final secretary = await ref.watch(
    teacherByIdProvider(student.admissionSecretaryId!).future,
  );
  final member1 = await ref.watch(
    teacherByIdProvider(student.admission1stMemberId!).future,
  );
  final member2 = await ref.watch(
    teacherByIdProvider(student.admission2ndMemberId!).future,
  );
  final member3 = await ref.watch(
    teacherByIdProvider(student.admission3rdMemberId!).future,
  );

  final model = pdfs.PhdAdmissionPaymentDocument(
    student: student,
    president: president,
    secretary: secretary,
    firstMember: member1,
    secondMember: member2,
    thirdMember: member3,
  );

  /// TODO: configuration
  return model.buildPdf(
    pdfs.PhdAdmissionCouncilSuggestionDocument.defaultPdfConfig,
  );
});
