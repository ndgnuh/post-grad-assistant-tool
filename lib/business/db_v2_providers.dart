import 'package:riverpod/riverpod.dart';

import 'db_v2_providers/database.dart';
import 'main_database.dart';

export 'db_v2_providers/admission_council.dart';
export 'db_v2_providers/local_preferences.dart';
export 'db_v2_providers/cohorts.dart';
export 'db_v2_providers/course_classes.dart';
export 'db_v2_providers/courses.dart';
export 'db_v2_providers/database.dart';
export 'db_v2_providers/phd_students.dart';
export 'db_v2_providers/preference.dart';
export 'db_v2_providers/semesters.dart';
export 'db_v2_providers/students.dart';
export 'db_v2_providers/teachers.dart';
export 'db_v2_providers/teaching_assignment.dart';
export 'db_v2_providers/teaching_registration.dart';
export 'db_v2_providers/thesis.dart';
export 'db_v2_providers/documents.dart';
export 'main_database.dart';

final admissionProfileByIdProvider = StreamProvider.family(
  (ref, int id) async* {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.getAdmissionProfiles(id: id);
    yield* stmt.watchSingle();
  },
);
