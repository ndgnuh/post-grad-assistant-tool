import 'package:fami_tools/business/pdfs/pdfs.dart' show PdfFile;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfrx/pdfrx.dart';

// import '../business/domain_objects.dart';
import '../business/db_v2_providers.dart';
import '../business/pdfs/teaching_assignment_pdf.dart';
import '../business/excel_files.dart';

final pdfProvider = FutureProvider((ref) async {
  final semesterId = "2025.1B";
  final semester = await ref.watch(semesterByIdProvider(semesterId).future);
  final courseClassIds = await ref.watch(
    courseClassIdsBySemesterProvider(semester.id).future,
  );

  final courseClasses = <CourseClassData>[];
  final mapTeachers = <int, List<TeacherData>>{};
  final mapWeights = <int, List<double>>{};
  final mapCourses = <int, CourseData>{};

  for (final classId in courseClassIds) {
    final courseClass = await ref.watch(
      courseClassByIdProvider(classId).future,
    );
    if (!courseClass.courseId.startsWith("MI")) continue;

    final course = await ref.watch(
      courseByIdProvider(courseClass.courseId).future,
    );
    final assignment = await ref.watch(
      teachingAssignmentsProvider(classId).future,
    );
    final teachers = [
      for (final a in assignment)
        await ref.watch(teacherByIdProvider(a.teacherId).future),
    ];
    final weights = [for (final a in assignment) a.weight];

    courseClasses.add(courseClass);
    mapCourses[classId] = course;
    mapTeachers[classId] = teachers;
    mapWeights[classId] = weights;
  }

  return buildTeachingAssignmentPdf(
    semester: semester,
    courseClasses: courseClasses,
    mapCourses: mapCourses,
    mapTeachers: mapTeachers,
    mapWeights: mapWeights,
  );
});

Future<ExcelFile> buildExcelFile(
  WidgetRef ref, [
  String semesterId = "2025.1A",
]) async {
  final semester = await ref.watch(semesterByIdProvider(semesterId).future);
  final courseClassIds = await ref.watch(
    courseClassIdsBySemesterProvider(semester.id).future,
  );

  final courseClasses = <CourseClassData>[];
  final mapTeachers = <int, List<TeacherData>>{};
  final mapWeights = <int, List<double>>{};
  final mapCourses = <int, CourseData>{};

  for (final classId in courseClassIds) {
    final courseClass = await ref.watch(
      courseClassByIdProvider(classId).future,
    );
    if (!courseClass.courseId.startsWith("MI")) continue;

    final course = await ref.watch(
      courseByIdProvider(courseClass.courseId).future,
    );
    final assignment = await ref.watch(
      teachingAssignmentsProvider(classId).future,
    );
    final teachers = [
      for (final a in assignment)
        await ref.watch(teacherByIdProvider(a.teacherId).future),
    ];
    final weights = [for (final a in assignment) a.weight];

    courseClasses.add(courseClass);
    mapCourses[classId] = course;
    mapTeachers[classId] = teachers;
    mapWeights[classId] = weights;
  }

  return ExcelFile.msc.teachingAssignment(
    semester: semester,
    courseClasses: courseClasses,
    mapCourses: mapCourses,
    mapTeachers: mapTeachers,
    mapWeights: mapWeights,
  );
}

class DraftPage extends ConsumerWidget {
  static const routeName = '/draft';
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfAsync = ref.watch(pdfProvider);
    buildExcelFile(ref, "2025.1B").then((excelFile) {
      excelFile.save(directory: '/tmp/');
      print("Built ${excelFile.fileName} ");
    });

    switch (pdfAsync) {
      case AsyncError(:final error, :final stackTrace):
        print(error);
        print(stackTrace);
      default:
    }

    final pdf = switch (pdfAsync) {
      AsyncData<PdfFile> data => data.value,
      AsyncLoading() => null,
      AsyncError() => null,
    };

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
        child: switch (pdf) {
          null => const CircularProgressIndicator(),
          PdfFile file => PdfViewer.data(file.bytes, sourceName: file.name),
        },
      ),
    );
  }
}
