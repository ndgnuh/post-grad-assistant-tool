import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../business/domain_objects.dart';
import 'datamodels.dart';
import 'features/manage_thesis_topic/page_export_thesis.dart'
    show PageExportThesis;
import 'pages/academic_year_list.dart'
    show
        PageAcademicYearList,
        PageAcademicYearEdit,
        PageAcademicYearCreate,
        PageAcademicYearArgument;
import 'pages/admission/index.dart';
import 'pages/chi_tiet_giang_vien.dart' show ChiTietGiangVien;
import 'pages/course_classes/index.dart';
import 'pages/course_management.dart'
    show PageCourseList, PageCourseDetailArgs, PageCourseDetail;
import 'pages/dang_ky_bao_ve.dart' show DangKyBaoVePage, DangKyBaoVePage2;
import 'pages/danh_sach_giang_vien.dart' show PageQuanLyGiangVien;
import 'pages/draft.dart' show DraftPage;
import 'pages/han_che_hoc_phan.dart' show CourseLimitingPage;
import 'pages/home.dart' show HomePage;
import 'pages/mobile/course_classes.dart'
    show PageCourseClassList, PageSelectSemester, CourseClassCreatePage;
import 'pages/mobile/select_class_of.dart'
    show PageSelectClassOf, PageSelectClassOfArgs;
import 'pages/mobile/students.dart' show StudentListPage, StudentDetailPage;
import 'pages/mobile/thesis_assign_list.dart' show MobilePageThesisAssignList;
import 'pages/multiple_selection_page.dart'
    show MultipleSelectionPage, MultipleSelectionPageArgs;
import 'pages/page_xet_tuyen_ncs.dart' show PageXetTuyenNcs;
import 'pages/phan_cong_hoi_dong_lvths.dart'
    show PagePhanCongHoiDongLuanVanThacSi;
import 'pages/phd_students/index.dart';
import 'pages/ql_bieu_mau.dart' show QlBieuMau, DienPhieuDiemThs;
import 'pages/ql_de_tai.dart' show PageQuanLyDeTai;
import 'pages/ql_hoc_vien.dart' show QlHocVien;
import 'pages/settings.dart' show SettingsPage;
import 'pages/teachers/index.dart' show TeacherSearchPage;
import 'pages/theses/list.dart';
import 'pages/thesis_defense/index.dart';
import 'pages/xet_tuyen.dart' show PageXetTuyen;

final initialRoute = switch (kReleaseMode) {
  true => HomePage.routeName,

  // false => DraftPage.routeName,
  // false => PageCourseClassList.routeName,
  // false => TeacherSearchPage.routeName,
  // false => MobilePageThesisAssignList.routeName,
  // false => ThesisListPage.routeName,
  // false => SettingsPage.routeName,
  // false => ThesisDefenseRegisterPage.routeName,
  // false => ThesisDefensePaymentPage.routeName,
  // false => PageAcademicYearList.routeName,
  // false => PhdStudentListPage.routeName,
  // false => PhdStudentCreatePage.routeName,
  false => CourseClassListPage.routeName,

  // false => AdmissionListPage.routeName,
  // false => AdmissionEnrollmentPage.routeName,
  false => CourseLimitingPage.routeName,
};

// const initialRoute = SettingsPage.routeName;
// const initialRoute = MobilePageThesisAssignList.routeName;
// const initialRoute = PageAcademicYearList.routeName;
// const initialRoute = MobilePageTeacherList.routeName;

// const initialRoute = PageImportHocPhan.routeName;

// const initialRoute = PagePhanCongHoiDongLuanVanThacSi.routeName;
// const initialRoute = PageQuanLyDeTai.routeName;
// const initialRoute = QlBieuMau.routeName;

//const initialRoute = QlHocVien.routeName;

// const initialRoute = PageXetTuyen.routeName;

// const initialRoute = DraftPage.routeName;
// const initialRoute = PageQuanLyGiangVien.routeName;
// const initialRoute = DangKyBaoVePage.routeName;
// const initialRoute = PageHanCheHocPhan.routeName;
// const initialRoute = PageLopTinChi.routeName;

const routes = [
  (route: HomePage.routeName, label: "Trang chính", icon: Icons.home),
  (
    route: TeacherSearchPage.routeName,
    label: "Giảng viên (M)",
    icon: Icons.person,
  ),
  (
    route: PageQuanLyGiangVien.routeName,
    label: "Giảng viên",
    icon: Icons.person,
  ),
  (
    route: StudentListPage.routeName,
    label: "Học viên",
    icon: Icons.person,
  ),
  (
    route: PhdStudentListPage.routeName,
    label: "Nghiên cứu sinh",
    icon: PageXetTuyenNcs.icon,
  ),
  (
    route: MobilePageThesisAssignList.routeName,
    label: "Giao đề tài (v2)",
    icon: Icons.assignment_turned_in,
  ),
  (
    route: ThesisListPage.routeName,
    label: "Quản lý đề tài (v2)",
    icon: Icons.assignment_turned_in,
  ),
  (
    route: PageAcademicYearList.routeName,
    label: "Quản lý đợt học",
    icon: Icons.lock_clock,
  ),
  (
    route: PageCourseClassList.routeName,
    label: "Lớp tín chỉ (v2)",
    icon: Icons.class_,
  ),
  (
    route: AdmissionListPage.routeName,
    label: "Xét tuyển (v2)",
    icon: Icons.person_add,
  ),
  (
    route: CourseClassListPage.routeName,
    label: "Lớp tín chỉ (v3)",
    icon: Icons.class_rounded,
  ),
  (
    route: CourseLimitingPage.routeName,
    label: "Hạn chế học phần",
    icon: Icons.class_rounded,
  ),
  (route: PageCourseList.routeName, label: "Học phần", icon: Icons.book),
  (route: PageQuanLyDeTai.routeName, label: "Quản lý đề tài", icon: Icons.book),
  (
    route: ThesisDefenseRegisterPage.routeName,
    label: "Bảo vệ luận văn",
    icon: null,
  ),
  (
    route: PageXetTuyen.routeName,
    label: "Xét tuyển cao học",
    icon: Icons.person_add,
  ),
  (
    route: PagePhanCongHoiDongLuanVanThacSi.routeName,
    label: "Phân hội đồng bảo vệ",
    icon: Icons.person_add,
  ),
  (
    route: SettingsPage.routeName,
    label: "Cài đặt",
    icon: Icons.settings,
  ),
];

Widget buildRoute(BuildContext context, RouteSettings settings) {
  String? name = settings.name;
  Object? args = settings.arguments;

  switch (name) {
    case PageQuanLyGiangVien.routeName:
      return PageQuanLyGiangVien();
    case "/edit/giang-vien":
      return switch (args) {
        (GiangVien gv) => ChiTietGiangVien(gv: gv),
        _ => const PageQuanLyGiangVien(),
      };
    case HomePage.routeName:
      return HomePage();
    case DraftPage.routeName:
      return DraftPage();
    case PageXetTuyen.routeName:
      return PageXetTuyen();
    case PageXetTuyenNcs.routeName:
      return PageXetTuyenNcs();
    case PageQuanLyDeTai.routeName:
      return PageQuanLyDeTai();
    case CourseLimitingPage.routeName:
      return CourseLimitingPage();
    case PagePhanCongHoiDongLuanVanThacSi.routeName:
      return PagePhanCongHoiDongLuanVanThacSi();
    case QlHocVien.routeName:
      return QlHocVien();

    // Course classes
    case CourseClassListPage.routeName:
      return CourseClassListPage();

    // Manage courses
    case PageCourseList.routeName:
      return PageCourseList();
    case PageCourseDetail.routeName:
      switch (args) {
        case PageCourseDetailArgs args:
          return PageCourseDetail.fromArguments(args);
        default:
          return PageCourseList();
      }

    /// Mobiles
    case TeacherSearchPage.routeName:
      return TeacherSearchPage();

    case MobilePageThesisAssignList.routeName:
      return const MobilePageThesisAssignList();

    /// Academic year pages
    case PageAcademicYearList.routeName:
      return const PageAcademicYearList();
    case PageAcademicYearEdit.routeName:
      switch (args) {
        case PageAcademicYearArgument args:
          return PageAcademicYearEdit.fromArguments(args);
        default:
          return const PageAcademicYearList();
      }
    case PageAcademicYearCreate.routeName:
      return const PageAcademicYearCreate();

    /// Course class list
    case PageCourseClassList.routeName:
      print("Args: $args");
      switch (args) {
        case HocKy initialSemester:
          return PageCourseClassList(initialSemester: initialSemester);
        default:
          return const PageCourseClassList();
      }

    case CourseClassCreatePage.routeName:
      switch (args) {
        case HocKy semester:
          return CourseClassCreatePage(semester: semester);
        default:
          return const PageCourseClassList();
      }

    /// Admission pages
    case AdmissionListPage.routeName:
      return const AdmissionListPage();
    case AdmissionImportPage.routeName:
      return const AdmissionImportPage();
    case AdmissionEnrollmentPage.routeName:
      return const AdmissionEnrollmentPage();

    /// Selection pages
    case PageSelectClassOf.routeName:
      final args = settings.arguments;
      switch (args) {
        case PageSelectClassOfArgs args:
          return PageSelectClassOf.fromArgs(args);
      }
      return HomePage();
    case PageSelectSemester.routeName:
      switch (args) {
        case HocKy initialSemester:
          return PageSelectSemester(initialSemester: initialSemester);
        default:
          return PageSelectSemester(initialSemester: null);
      }
    case MultipleSelectionPage.routeName:
      switch (args) {
        case MultipleSelectionPageArgs args:
          return MultipleSelectionPage(
            options: args.options,
            titleBuilder: args.titleBuilder,
            subtitleBuilder: args.subtitleBuilder,
            onSelected: args.onSelected,
            title: args.title,
          );
        default:
          return const HomePage();
      }

    /// Thesis topic management pages
    case ThesisListPage.routeName:
      return const ThesisListPage();

    /// Student management pages
    case StudentListPage.routeName:
      return const StudentListPage();
    case StudentDetailPage.routeName:
      switch (args) {
        case HocVien student:
          return StudentDetailPage(student: student);
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

    /// Biểu mẫu
    case QlBieuMau.routeName:
      return QlBieuMau();
    case DienPhieuDiemThs.routeName:
      return DienPhieuDiemThs();
    case DangKyBaoVePage.routeName:
      return DangKyBaoVePage();
    case PageExportThesis.routeName:
      return const PageExportThesis();
    case SettingsPage.routeName:
      return const SettingsPage();
    case DangKyBaoVePage2.routeName:
      switch (args) {
        case (
          :final DeTaiThacSi deTai,
          :final GiangVien giangVien,
          :final HocVien hocVien,
        ):
          return DangKyBaoVePage2(
            deTai: deTai,
            giangVien: giangVien,
            hocVien: hocVien,
          );
        default:
          return HomePage();
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
