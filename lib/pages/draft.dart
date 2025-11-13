import 'dart:io';
import 'package:fami_tools/business/document_models/payment_atm.dart';
import 'package:fami_tools/business/excel_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fami_tools/gen/assets.gen.dart';

// import '../business/domain_objects.dart';
import '../business/db_v2_providers.dart';

import 'package:fami_tools/utilities/docx_template.dart';

Future<ExcelFile> buildExcel(WidgetRef ref) async {
  final thesisIds = await ref.watch(trackedThesisIdsProvider.future);
  final theses = await Future.wait([
    for (final id in thesisIds) ref.watch(thesisByIdProvider(id).future),
  ]);

  theses.sort((a, b) {
    final aName = a.defenseDecisionNumber ?? "";
    final bName = b.defenseDecisionNumber ?? "";
    return aName.compareTo(bName);
  });

  final teachers = <TeacherData>{};
  final timesPresident = <TeacherData, int>{};
  final timesSecretary = <TeacherData, int>{};
  final timesReviewer = <TeacherData, int>{};
  final timesMember = <TeacherData, int>{};

  Future<TeacherData> getTeacher(int? id) async {
    final teacher = await ref.watch(teacherByIdProvider(id!).future);
    teachers.add(teacher);
    return teacher;
  }

  for (final thesis in theses) {
    final president = await getTeacher(thesis.presidentId);
    final secretary = await getTeacher(thesis.secretaryId);
    final reviewer1 = await getTeacher(thesis.firstReviewerId);
    final reviewer2 = await getTeacher(thesis.secondReviewerId);
    final member = await getTeacher(thesis.memberId);

    timesPresident[president] = (timesPresident[president] ?? 0) + 1;
    timesSecretary[secretary] = (timesSecretary[secretary] ?? 0) + 1;
    timesReviewer[reviewer1] = (timesReviewer[reviewer1] ?? 0) + 1;
    timesReviewer[reviewer2] = (timesReviewer[reviewer2] ?? 0) + 1;
    timesMember[member] = (timesMember[member] ?? 0) + 1;
  }

  final moneyPerRole = (
    president: 400_000,
    secretary: 400_000,
    reviewer: 1_050_000,
    member: 300_000,
  );

  final entries = <PaymentAtmEntry>[];
  final sortedTeachers = teachers.toList(growable: false);
  sortedTeachers.sort((a, b) {
    final c1 = a.isOutsider ? 1 : 0;
    final c2 = b.isOutsider ? 1 : 0;
    if (c1 != c2) return c1 - c2;

    final aFirstName = a.name.split(" ").last;
    final bFirstName = b.name.split(" ").last;

    return aFirstName.compareTo(bFirstName);
  });
  for (final teacher in sortedTeachers) {
    final timesAsPresident = timesPresident[teacher] ?? 0;
    final timesAsSecretary = timesSecretary[teacher] ?? 0;
    final timesAsReviewer = timesReviewer[teacher] ?? 0;
    final timesAsMember = timesMember[teacher] ?? 0;

    final totalAmount =
        (timesAsPresident * moneyPerRole.president) +
        (timesAsSecretary * moneyPerRole.secretary) +
        (timesAsReviewer * moneyPerRole.reviewer) +
        (timesAsMember * moneyPerRole.member);

    final entry = PaymentAtmEntry(
      teacher: teacher,
      amount: totalAmount,
    );
    entries.add(entry);
  }

  final model = PaymentAtmModel(
    reason: "HỘI ĐỒNG CHẤM LUẬN VĂN THẠC SĨ",
    entries: entries,
  );
  final file = ExcelFile.payment.atmTable(model: model);
  return file;
}

Future<Uint8List?> buildDocx(WidgetRef ref) async {
  final docxAsset = await rootBundle.load(Assets.templates.phdAdmissionRecord);

  final studentId = 18; // Example student ID
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
    'president': president.toJson(),
    'secretary': secretary.toJson(),
    'first_member': firstMember.toJson(),
    'second_member': secondMember.toJson(),
    'third_member': thirdMember.toJson(),
    'supervisor': supervisor.toJson(),
    'secondary_supervisor': secondarySupervisor?.toJson() ?? (name: ""),
  };
  final output = template.render(context);

  return output;
}

class DraftPage extends ConsumerWidget {
  static const routeName = '/draft';
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    buildExcel(ref).then((file) {
      final bytes = file.save(directory: "/tmp");
      print("Excel file created successfully.");
    });
    buildDocx(ref).then((data) {
      if (data == null) {
        return;
      }
      File("test.docx").writeAsBytesSync(data);
      print("Document created successfully.");
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draft Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),

      body: Center(
        child: Text('Draft Page Content'),
      ),
    );
  }
}
