import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'admission_pages/admission_pages.dart';
import 'course_class_pages/course_class_pages.dart';
import 'course_pages/course_pages.dart';
import 'draft.dart' show DraftPage;
import 'home_page/home_page.dart';
import 'mobile/thesis_assign_list.dart' show MobilePageThesisAssignList;
import 'phd_students/index.dart';
import 'semester_pages/semester_pages.dart';
import 'setting_pages/setting_pages.dart';
import 'student_pages/student_pages.dart';
import 'teacher_pages/teacher_pages.dart';
import 'thesis_defense/index.dart';
import 'thesis_pages/thesis_pages.dart';
import 'document_pages/document_pages.dart';

const initialLoadingRotue = InitialLoadingPage.routeName;
const intialSettingsRoute = InitialSetupPage.routeName;

final initialRoute = switch (kReleaseMode) {
  true => HomePage.routeName,

  // Settings
  // false => InitialSetupPage.routeName,
  // false => SettingsPage.routeName,

  // Student pages
  // false => StudentListPage.routeName,

  // Debug home page
  // false => HomePage.routeName,

  // Admission
  // false => AdmissionListPage.routeName,
  // false => AdmissionEnrollmentPage.routeName,
  false => AdmissionPaymentPage.routeName,

  // Course classes pages
  // ====================
  // false => CourseClassListPage.routeName,

  // Thesis defends
  // false => ThesisDefenseRegisterPage.routeName,
  // false => ThesisDefensePaymentPage.routeName,
  // false => ThesisListPage.routeName,

  // PhD students pages
  // false => PhdStudentListPage.routeName,

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
      label: "Cài đặt",
      route: SettingsPage.routeName,
      icon: Symbols.settings,
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
      route: MobilePageThesisAssignList.routeName,
      label: "Giao đề tài",
      icon: Symbols.assignment_turned_in,
      subtitle: null,
    ),
    (
      route: ThesisDefenseRegisterPage.routeName,
      label: "Bảo vệ luận văn",
      icon: Symbols.school,
      subtitle: null,
    ),
  ],

  // Index, but for MsC students
  "Thạc sĩ / danh mục": [
    (
      route: null,
      label: "Niên khóa",
      icon: Symbols.group,
      subtitle: null,
    ),
    (
      route: SemesterListPage.routeName,
      label: "Đợt học",
      icon: Symbols.calendar_month,
      subtitle: null,
    ),
    (
      route: ThesisListPage.routeName,
      label: "Đề tài hướng dẫn",
      icon: Symbols.assignment,
      subtitle: null,
    ),
  ],

  // PhD students
  "Nghiên cứu sinh": [
    (
      route: PhdStudentCreatePage.routeName,
      label: "Xét tuyển",
      icon: Symbols.person_add,
      subtitle: null,
    ),
    (
      route: PhdStudentListV1Page.routeName,
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
      route: null,
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

  switch (name) {
    case HomePage.routeName:
      return HomePage();
    case DraftPage.routeName:
      return DraftPage();
    case CourseLimitingPage.routeName:
      return CourseLimitingPage();

    // Course classes
    case CourseClassListPage.routeName:
      return CourseClassListPage();

    // Manage courses
    case CourseListPage.routeName:
      return CourseListPage();
    case CourseDetailPage.routeName:
      switch (args) {
        case CourseDetailPageArgs args:
          return CourseDetailPage.fromArguments(args);
        default:
          return CourseListPage();
      }

    /// Mobiles
    case TeacherSearchPage.routeName:
      return TeacherSearchPage();

    case MobilePageThesisAssignList.routeName:
      return const MobilePageThesisAssignList();

    /// Academic year pages
    case SemesterListPage.routeName:
      return const SemesterListPage();
    case PageAcademicYearCreate.routeName:
      return const PageAcademicYearCreate();

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
    case ThesisDefenseRegisterPage.routeName:
      return const ThesisDefenseRegisterPage();
    case ThesisDefensePaymentPage.routeName:
      return const ThesisDefensePaymentPage();

    // PhD Student pages
    case PhdStudentListPage.routeName:
      return const PhdStudentListPage();
    case PhdStudentCreatePage.routeName:
      return const PhdStudentCreatePage();

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
