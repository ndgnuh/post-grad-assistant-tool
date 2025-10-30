import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../business/business_enums.dart';
import '../../custom_widgets.dart';
import './widgets.dart';
import 'phd_student_details_tab.dart';
import 'phd_student_admission_tab.dart';

class PhdStudentDetailsPage extends StatelessWidget {
  static const routeName = '/phd-student/details';
  final int studentId;
  const PhdStudentDetailsPage({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: PhdStudentInfo(
              studentId: studentId,
              loading: Text("NCS [$studentId]"),
              builder: (context, phdStudent) => Text(
                'NCS ${phdStudent.name}',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: "Thông tin"),
                PhdStudentInfo(
                  studentId: studentId,
                  loading: Tab(text: "Quản trị"),
                  builder: (context, student) => switch (student.status) {
                    StudentStatus.admission => Tab(text: "Xét tuyển"),
                    _ => Tab(text: "Quản trị"),
                  },
                ),
              ],
            ),
          ),
        ),
        body: ConstrainedBody(
          child: TabBarView(
            children: [
              PhdStudentDetailsTab(studentId: studentId),
              PhdStudentInfo(
                studentId: studentId,
                builder: (_, student) {
                  switch (student.status) {
                    case StudentStatus.admission:
                      return PhdStudentAdmissionTab(studentId: studentId);
                    default:
                      return Text("TODO");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
