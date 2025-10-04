import 'package:flutter/services.dart';

import '../../business/drift_orm.dart';

Future<List<CourseClassCompanion>> parseClassesFromClipboard({
  required String semester,
}) async {
  final clipboardText = await Clipboard.getData('text/plain');
  if (clipboardText == null || clipboardText.text == null) {
    return [];
  }

  final lines = clipboardText.text!.split('\n');
  final classes = <CourseClassCompanion>[];

  for (final line in lines) {
    final parts = line.split('\t');
    if (parts.length < 3) continue; // Skip invalid lines

    final classId = parts[0].trim();
    final courseId = classId.split('-').first.trim();
    final numRegistered = int.tryParse(parts[2].trim()) ?? 0;
    final status = switch (numRegistered < 5) {
      true => CourseClassStatus.canceled,
      false => CourseClassStatus.normal,
    };

    CourseClassCompanion newClass = CourseClassCompanion(
      semester: Value(semester),
      registrationCount: Value(numRegistered),
      courseId: Value(courseId),
      classId: Value(classId),
      status: Value(status),
    );

    classes.add(newClass);
  }

  return classes;
}
