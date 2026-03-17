import 'package:riverpod/riverpod.dart';

import '../../../../business/db_v2_providers.dart';

final teacherListProvider = NotifierProvider(TeacherListNotifier.new);

class TeacherListNotifier extends Notifier<List<TeacherData>> {
  @override
  List<TeacherData> build() => List.empty(growable: false);

  void addTeacher(TeacherData teacher) {
    state = [...state, teacher];
  }

  void popTeacher() {
    if (state.isNotEmpty) {
      state = List.unmodifiable(state.sublist(0, state.length - 1));
    }
  }
}
