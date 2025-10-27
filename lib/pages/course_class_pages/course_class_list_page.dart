import 'package:flutter/material.dart';

import '../../custom_widgets.dart';
import 'course_class_list_action_tab.dart';
import 'course_class_list_tab.dart';

class CourseClassListPage extends StatelessWidget {
  static const routeName = "/course_classes/list";

  const CourseClassListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: const Text("Danh sách lớp tín chỉ"),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "Lớp tín chỉ"),
                Tab(text: "Thao tác"),
              ],
            ),
          ),
        ),
        body: ConstrainedBody(
          child: TabBarView(
            children: [
              CourseClassListTab(),
              CourseClassActionTab(),
            ],
          ),
        ),
      ),
    );
  }
}

// class SemesterPicker extends ConsumerWidget {
//   const SemesterPicker({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Load selected semester
//     final selectedSemesterAsync = ref.watch(semesterSelectionModelProvider);
//     final semestersAsync = ref.watch(semestersProvider);
//     switch (selectedSemesterAsync) {
//       case AsyncLoading():
//         return const CircularProgressIndicator();
//       case AsyncError(:final error):
//         return Text("Error: $error");
//       default:
//     }
//
//     final semesters = semestersAsync.value!;
//     final selectedSemester = selectedSemesterAsync.value;
//
//     return DropdownMenu<SemesterData>(
//       label: Text("Đợt học"),
//       initialSelection: selectedSemester,
//       dropdownMenuEntries: [
//         for (final semester in semesters)
//           DropdownMenuEntry(value: semester, label: semester.semester),
//       ],
//       onSelected: (value) async {
//         final notifier = ref.read(semesterSelectionModelProvider.notifier);
//         notifier.set(value);
//       },
//     );
//   }
// }
