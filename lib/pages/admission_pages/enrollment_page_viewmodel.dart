import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers.dart';

class StudentEnrollmentViewModel {
  final int studentId;
  // final StudentData student;
  StudentEnrollmentViewModel(this.studentId);
}
