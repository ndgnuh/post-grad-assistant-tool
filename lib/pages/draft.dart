import 'package:fami_tools/business/enums/phd_student.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfrx/pdfrx.dart';

// import '../business/domain_objects.dart';
import '../business/db_v2_providers.dart';
import '../business/pdfs/pdfs.dart';
import 'phd_student_pages/phd_student_admission_providers.dart';

final pdfProvider = FutureProvider((ref) async {
  final id = 21;
  final student = await ref.watch(phdStudentByIdProvider(id).future);
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
  final pdfFile = await PdfFile.phdAdmission.paymentTable(
    student: student,
    president: president,
    secretary: secretary,
    firstMember: member1,
    secondMember: member2,
    thirdMember: member3,
  );

  return pdfFile;
});

MaterialPageRoute ezRoute(Widget page) {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(),
      body: page,
    ),
  );
}

class DraftPage extends ConsumerWidget {
  static const routeName = '/draft';
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfAsync = ref.watch(pdfProvider);
    final pdf = switch (pdfAsync) {
      AsyncData<PdfFile> data => data.value,
      AsyncLoading() => null,
      AsyncError() => null,
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draft Page'),
      ),
      body: Center(
        child: switch (pdf) {
          null => const CircularProgressIndicator(),
          PdfFile file => PdfViewer.data(file.bytes, sourceName: file.fileName),
        },
      ),
    );
  }
}
