import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'admission_pages/admission_pages.dart';
import 'course_class_pages/course_class_pages.dart';
import 'course_pages/course_pages.dart';
import 'draft.dart' show DraftPage;
import 'home_page/home_page.dart';
import 'phd_student_pages/phd_student_pages.dart';
import 'semester_pages/semester_pages.dart';
import 'setting_pages/setting_pages.dart';
import 'student_pages/student_pages.dart';
import 'teacher_pages/teacher_pages.dart';
import 'thesis_pages/thesis_pages.dart';
import 'document_pages/document_pages.dart';

import 'msc_thesis_defense/page.dart' as msc_thesis;
import 'msc_thesis_assignment/page.dart' as msc_thesis;
import 'msc_thesis_defense/msc_thesis_details.dart' as msc_thesis;
import 'thesis_defense_payment/page.dart' as msc_thesis;

import 'phd_admission_payment/index.dart' as phd_pages;

const initialLoadingRoute = InitialLoadingPage.routeName;
const intialSettingsRoute = InitialSetupPage.routeName;

class AppRoute {
  final String name;
  final IconData? icon;
  final WidgetBuilder builder;
  final String? group;

  AppRoute({
    required this.name,
    required this.builder,
    this.group,
    this.icon,
  });
}

final routes = [
  /// Functional pages
  AppRoute(
    name: "/initial-loading",
    builder: (context) => InitialLoadingPage(),
  ),
  AppRoute(
    name: "/initial-setup",
    builder: (context) => InitialSetupPage(),
  ),

  // Home page
  // ---------
  AppRoute(
    name: "/",
    icon: Symbols.home,
    builder: (context) => HomePage(),
  ),

  // Student management
  // ------------------
  AppRoute(
    name: "msc/students/list",
    icon: Symbols.person_search,
    group: "Thạc sĩ",
    builder: (context) => StudentListPage(),
  ),

  // Msc Thesis
  AppRoute(
    name: "msc/thesis/list",
    icon: Symbols.checklist,
    group: "Thạc sĩ",
    builder: (context) => ThesisListPage(),
  ),
  AppRoute(
    name: "msc/thesis/assignment",
    icon: Symbols.assignment,
    group: "Thạc sĩ",
    builder: (context) => msc_thesis.MscThesisAssignmentPage(),
  ),
];

final routeLookups = {
  for (final route in routes) route.name: route,
};

final routeGroups = [
  for (final route in routes) route.group,
].whereType<String>().toList();

class AppNavigator {
  BuildContext context;
  AppNavigator(this.context);

  NavigatorState get navigator => Navigator.of(context);

  void moveTo(WidgetBuilder builder) {
    navigator.push(
      MaterialPageRoute(builder: builder),
    );
  }

  /// Detail pages
  /// ============
  void toSemesterDetailsPage({required String semesterId}) => moveTo(
    (context) => SemesterDetailsPage(semesterId: semesterId),
  );

  void toPdfPreviewPage({
    required String title,
    required Uint8List pdfData,
    required String sourceName,
  }) => moveTo(
    (context) => PdfDataPreviewPage(
      title: title,
      pdfData: pdfData,
      sourceName: sourceName,
    ),
  );

  void toHome() => navigator.pushNamed(HomePage.routeName);

  // Thesis defense payment page
  void toThesisListPage() => navigator.pushNamed(ThesisListPage.routeName);

  void toThesisDefensePaymentPage() =>
      navigator.pushNamed(msc_thesis.ThesisDefensePaymentPage.routeName);

  /// Navigate to thesis details page
  void toThesisDetailsPage({required int thesisId}) =>
      moveTo((context) => MscThesisDetailsPage(thesisId: thesisId));

  /// Navigate to thesis defense council assignment page
  void toThesisDefenseCouncilAssignmentPage({required int thesisId}) => moveTo(
    (context) => msc_thesis.MscThesisDetailsPage.assignDefenseCouncil(
      thesisId: thesisId,
    ),
  );

  void toThesisAssignmentPage() => moveTo(
    (context) => msc_thesis.MscThesisAssignmentPage(),
  );

  void toThesisHub() =>
      navigator.pushNamed(msc_thesis.ThesisEverythingPage.routeName);

  void toThesisDefenseRegisterPage() => moveTo(
    (context) => msc_thesis.ThesisDefenseRegisterPage(),
  );
}

final initialRoute = switch (kReleaseMode) {
  true => HomePage.routeName,

  // Document management pages
  // false => DocumentManagementPage.routeName,

  // false => DraftPage.routeName,

  // Settings
  // false => InitialSetupPage.routeName,
  // false => SettingsPage.routeName,

  // Semester pages
  // false => SemesterListPage.routeName,

  // Student pages
  // false => StudentListPage.routeName,

  // Debug home page
  // false => HomePage.routeName,

  // Admission
  // false => AdmissionListPage.routeName,
  // false => AdmissionEnrollmentPage.routeName,
  // false => AdmissionPaymentPage.routeName,

  // Course classes pages
  // ====================
  // false => CourseClassListPage.routeName,
  // false => CourseLimitingPage.routeName,

  // Course pages
  // false => CourseListPage.routeName,

  // Thesis defends
  // false => ThesisDefenseRegisterPage.routeName,
  // false => msc_thesis.ThesisDefensePaymentPage.routeName,
  // false => ThesisListPage.routeName,
  // false => msc_thesis.ThesisEverythingPage.routeName,
  false => msc_thesis.ThesisDefenseRegisterPage.routeName,
  // false => msc_thesis.MscThesisAssignmentPage.routeName,
  // false => msc_thesis.MscThesisSelectionPage.routeName,
  // false => ThesisCreatePage.routeName,
  false => ThesisDefensePaymentPage.routeName,

  // PhD students pages
  // false => PhdStudentListPage.routeName,
  // false => PhdStudentCreatePage.routeName,
  // false => phd_pages.PhdAdmissionPaymentPage.routeName,

  // Teacher pages
  // false => TeacherSearchPage.routeName,

  // false => DraftPage.routeName,
  // false => PageCourseClassList.routeName,
  // false => TeacherSearchPage.routeName,
  // false => PageAcademicYearList.routeName,
  // false => PhdStudentListPage.routeName,
  // false => PhdStudentCreatePage.routeName,

  /* Courses related pages */
  // false => CourseLimitingPage.routeName,
};

final routesBySections = <String, List<RouteItem>>{
  "Danh mục": [
    (
      route: null,
      label: "Công việc sắp tới",
      icon: Symbols.event_upcoming,
      subtitle: null,
    ),
    (
      route: StudentListPage.routeName,
      label: "Học viên",
      icon: Symbols.person_search,
      subtitle: null,
    ),
    (
      route: TeacherSearchPage.routeName,
      label: "Giảng viên",
      icon: Symbols.person,
      subtitle: null,
    ),
    (
      route: CourseListPage.routeName,
      label: "Học phần",
      icon: Symbols.book,
      subtitle: null,
    ),
    (
      route: SemesterListPage.routeName,
      label: "Đợt học",
      icon: Symbols.calendar_month,
      subtitle: null,
    ),
    (
      label: "Cài đặt",
      route: SettingsPage.routeName,
      icon: Symbols.settings,
      subtitle: null,
    ),
    (
      label: "Văn bản, quy định",
      route: DocumentManagementPage.routeName,
      icon: Symbols.rule,
      subtitle: null,
    ),
  ],

  "Thạc sĩ / công việc": [
    (
      route: AdmissionListPage.routeName,
      label: "Xét tuyển",
      icon: Symbols.person_add,
      subtitle: null,
    ),
    (
      route: AdmissionPaymentPage.routeName,
      label: "Thanh toán xét tuyển",
      icon: Symbols.attach_money,
      subtitle: null,
    ),
    (
      route: CourseLimitingPage.routeName,
      label: "Hạn chế học phần",
      icon: Symbols.checklist,
      subtitle: null,
    ),
    (
      route: CourseClassListPage.routeName,
      label: "Phân công giảng dạy",
      icon: Symbols.co_present,
      subtitle: null,
    ),
    (
      route: msc_thesis.ThesisEverythingPage.routeName,
      label: "Luận văn thạc sĩ",
      icon: Symbols.school,
      subtitle: null,
    ),
  ],

  // Index, but for MsC students
  // "Thạc sĩ / danh mục": [
  //   (
  //     route: null,
  //     label: "Niên khóa",
  //     icon: Symbols.group,
  //     subtitle: null,
  //   ),
  //   (
  //     route: ThesisListPage.routeName,
  //     label: "Đề tài hướng dẫn",
  //     icon: Symbols.assignment,
  //     subtitle: null,
  //   ),
  // ],

  // PhD students
  "Nghiên cứu sinh": [
    (
      route: PhdStudentCreatePage.routeName,
      label: "Xét tuyển",
      icon: Symbols.person_add,
      subtitle: null,
    ),
    (
      route: PhdStudentListPage.routeName,
      label: "Nghiên cứu sinh",
      icon: Symbols.school,
      subtitle: null,
    ),
    (
      route: null,
      label: "Học bổ sung",
      icon: Symbols.menu_book,
      subtitle: null,
    ),
    (
      route: phd_pages.PhdAdmissionPaymentPage.routeName,
      label: "Thanh toán xét tuyển",
      icon: Symbols.attach_money,
      subtitle: null,
    ),
  ],

  "Debug": [
    (
      route: DraftPage.routeName,
      label: "Trang nháp",
      icon: Symbols.bug_report,
      subtitle: null,
    ),
  ],
};

Widget buildRoute(BuildContext context, RouteSettings settings) {
  String? name = settings.name;
  Object? args = settings.arguments;

  // final route = routeLookups[name];
  // switch (route) {
  //   case AppRoute():
  //     return route.builder(context);
  //   default:
  //     return HomePage();
  // }

  switch (name) {
    case HomePage.routeName:
      return HomePage();
    case DraftPage.routeName:
      return DraftPage();
    case CourseLimitingPage.routeName:
      return CourseLimitingPage();

    // Document manegement pages
    case DocumentManagementPage.routeName:
      return DocumentManagementPage();

    // Course classes
    case CourseClassListPage.routeName:
      return CourseClassListPage();
    case CourseClassCreatePage.routeName:
      return CourseClassCreatePage();

    // Manage courses
    case CourseListPage.routeName:
      return CourseListPage();
    case CourseDetailsPage.routeName:
      switch (args) {
        case String args:
          return CourseDetailsPage(courseId: args);
        default:
          return CourseListPage();
      }

    /// Rules and document
    case RulesPage.routeName:
      return RulesPage();

    /// Mobiles
    case TeacherSearchPage.routeName:
      return TeacherSearchPage();
    case TeacherDetailsPage.routeName:
      switch (args) {
        case int id:
          return TeacherDetailsPage(id: id);
        default:
          return TeacherSearchPage();
      }

    // case MobilePageThesisAssignList.routeName:
    //   return const MobilePageThesisAssignList();

    /// Academic year pages
    case SemesterListPage.routeName:
      return const SemesterListPage();
    case SemesterCreatePage.routeName:
      return const SemesterCreatePage();
    case SemesterDetailsPage.routeName:
      switch (args) {
        case String semesterId:
          return SemesterDetailsPage(semesterId: semesterId);
        default:
          return const SemesterListPage();
      }

    /// Admission pages
    case AdmissionListPage.routeName:
      return const AdmissionListPage();
    case AdmissionImportPage.routeName:
      return const AdmissionImportPage();
    case AdmissionEnrollmentPage.routeName:
      return const AdmissionEnrollmentPage(studentId: 67);
    case AdmissionPaymentPage.routeName:
      return const AdmissionPaymentPage();

    /// Thesis topic management pages
    case ThesisListPage.routeName:
      return const ThesisListPage();

    /// Student management pages
    case StudentListPage.routeName:
      return const StudentListPage();
    case StudentDetailPage.routeName:
      switch (args) {
        case int id:
          return StudentDetailPage(id: id);
        default:
          return const StudentListPage();
      }

    // Thesis defense pages
    case msc_thesis.ThesisEverythingPage.routeName:
      return const msc_thesis.ThesisEverythingPage();
    case msc_thesis.ThesisDefensePaymentPage.routeName:
      return const msc_thesis.ThesisDefensePaymentPage();
    case msc_thesis.ThesisDefenseRegisterPage.routeName:
      return const msc_thesis.ThesisDefenseRegisterPage();
    case msc_thesis.MscThesisAssignmentPage.routeName:
      return const msc_thesis.MscThesisAssignmentPage();
    case msc_thesis.MscThesisSelectionPage.routeName:
      return const msc_thesis.MscThesisSelectionPage(studentId: 61);
    case ThesisDefensePaymentPage.routeName:
      return const ThesisDefensePaymentPage();
    case ThesisCreatePage.routeName:
      return const ThesisCreatePage();

    // case ThesisDefensePaymentPage.routeName:
    //   return const ThesisDefensePaymentPage();

    // PhD Student pages
    case PhdStudentListPage.routeName:
      return const PhdStudentListPage();
    case PhdStudentDetailsPage.routeName:
      switch (args) {
        case int id:
          return PhdStudentDetailsPage(studentId: id);
        default:
          return const PhdStudentListPage();
      }
    case PhdStudentCreatePage.routeName:
      return const PhdStudentCreatePage();
    case phd_pages.PhdAdmissionPaymentPage.routeName:
      return const phd_pages.PhdAdmissionPaymentPage();

    /// Functional pages
    case SettingsPage.routeName:
      return const SettingsPage();
    case InitialSetupPage.routeName:
      return const InitialSetupPage();
    case InitialLoadingPage.routeName:
      return const InitialLoadingPage();
    case TodoPage.routeName:
      return const TodoPage();
    case ErrorPage.routeName:
      switch (args) {
        case Object error:
          return ErrorPage(error: error);
        default:
          return ErrorPage(error: "Unknown error");
      }

    default:
      return HomePage();
  }
}

MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (BuildContext context) {
      final page = buildRoute(context, settings);
      return page;
    },
  );
}

// const initialRoute = SettingsPage.routeName;
// const initialRoute = MobilePageThesisAssignList.routeName;
// const initialRoute = PageAcademicYearList.routeName;
// const initialRoute = MobilePageTeacherList.routeName;

// const initialRoute = PageImportHocPhan.routeName;

// const initialRoute = PagePhanCongHoiDongLuanVanThacSi.routeName;
// const initialRoute = QlBieuMau.routeName;

//const initialRoute = QlHocVien.routeName;

// const initialRoute = PageXetTuyen.routeName;

// const initialRoute = DraftPage.routeName;
// const initialRoute = PageQuanLyGiangVien.routeName;
// const initialRoute = DangKyBaoVePage.routeName;
// const initialRoute = PageHanCheHocPhan.routeName;
// const initialRoute = PageLopTinChi.routeName;

typedef RouteItem = ({
  String? route,
  String label,
  IconData? icon,
  String? subtitle,
});
