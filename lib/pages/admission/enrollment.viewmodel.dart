import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common.providers.dart';
import '../../business/drift_orm.dart';

class StudentEnrollmentViewModel {
  final int studentId;
  // final StudentData student;
  StudentEnrollmentViewModel(this.studentId);
}
