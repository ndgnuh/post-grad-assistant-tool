import 'package:flutter/material.dart';

import '../features/course_classes/course_classes.dart';
import '../features/course_pages/course_details_page.dart';
import '../features/msc_admission/msc_admission.dart';

final navigationKey = GlobalKey<NavigatorState>();

sealed class _BaseRouter {
  final BuildContext context;

  _BaseRouter([BuildContext? context])
    : context = context ?? navigationKey.currentContext!;

  NavigatorState get navigator => Navigator.of(context);

  void moveTo(WidgetBuilder builder) {
    navigator.push(
      MaterialPageRoute(builder: builder),
    );
  }

  void simplePush(Widget page) {
    navigator.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pop<T>(T obj) => navigator.pop<T>(obj);
}

/// App router
/// Because the app is big, we divide into sub routers
/// This is DX stuff, tab completion should be nicer
class AppRouter extends _BaseRouter {
  AppRouter([super.context]);

  MscRouter get msc => MscRouter(context);

  void toCourseDetailsPage({required String courseId}) =>
      simplePush(CourseDetailsPage(courseId: courseId));
}

/// Router for MSC pages
class MscRouter extends _BaseRouter {
  MscRouter([super.context]);

  void toAdmissionCouncilListPage() {
    simplePush(AdmissionCouncilListPage());
  }

  void toAdmissionCouncilCreatePage() {
    simplePush(AdmissionCouncilCreatePage());
  }
}
