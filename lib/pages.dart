import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'datamodels.dart';

import '../business/domain_objects.dart';

import 'pages/lop_tin_chi.dart' show PageLopTinChi;
import 'pages/home.dart' show HomePage;
import 'pages/chi_tiet_giang_vien.dart' show ChiTietGiangVien;
import 'pages/draft.dart' show DraftPage;
import 'pages/phan_cong_hoi_dong_lvths.dart'
    show PagePhanCongHoiDongLuanVanThacSi;
import 'pages/page_xet_tuyen_ncs.dart' show PageXetTuyenNcs;
import 'pages/ql_de_tai.dart' show PageQuanLyDeTai;
import 'pages/han_che_hoc_phan.dart' show PageHanCheHocPhan;
import 'pages/danh_sach_giang_vien.dart' show PageQuanLyGiangVien;
import 'pages/page_copy_pasta.dart' show PageCopyPasta;
import 'pages/ql_hoc_vien.dart' show QlHocVien;
import 'pages/ql_bieu_mau.dart' show QlBieuMau, DienPhieuDiemThs;
import 'pages/dang_ky_bao_ve.dart' show DangKyBaoVePage, DangKyBaoVePage2;
import 'features/manage_thesis_topic/page_export_thesis.dart'
    show PageExportThesis;

import 'pages/course_management.dart'
    show PageCourseList, PageCourseDetailArgs, PageCourseDetail;

import 'pages/academic_year_list.dart'
    show
        PageAcademicYearList,
        PageAcademicYearEdit,
        PageAcademicYearCreate,
        PageAcademicYearArgument;

import 'pages/xet_tuyen.dart' show PageXetTuyen;
import 'pages/mobile/admission.dart'
    show
        PageAdmissionList,
        PageAdmissionDetail,
        PageAdmissionCreate,
        PageAdmissionDetailArgs;

import 'pages/settings.dart' show SettingsPage;

import 'pages/mobile/study_class_list.dart'
    show PageCourseClassList, PageStudyClassListArgs, PageSelectSemester;

import 'pages/mobile/thesis_list.dart'
    show
        ThesisTopicListPage,
        ThesisTopicDetailPageArguments,
        ThesisTopicDetailPage,
        ThesisTopicAddPage;

import 'pages/drift_import.dart' show PageImportHocPhan;

import 'pages/mobile/teacher_list.dart' show MobilePageTeacherList;
import 'pages/mobile/teacher_detail.dart' show MobilePageTeacherDetail;
import 'pages/mobile/thesis_assign_list.dart' show MobilePageThesisAssignList;

import 'pages/mobile/select_class_of.dart'
    show PageSelectClassOf, PageSelectClassOfArgs;

import '../preferences.dart' as preferences;

final initialRoute = switch (kReleaseMode) {
  true => HomePage.routeName,
  false => ThesisTopicListPage.routeName,
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
// const initialRoute = PageCopyPasta.routeName;
// const initialRoute = DangKyBaoVePage.routeName;
// const initialRoute = PageHanCheHocPhan.routeName;
// const initialRoute = PageLopTinChi.routeName;

// const initialRoute = "/";

const routes = [
  (
    route: HomePage.routeName,
    label: "Trang chính",
    icon: Icons.home,
  ),
  (
    route: MobilePageTeacherList.routeName,
    label: "Giảng viên (M)",
    icon: Icons.person,
  ),
  (
    route: PageQuanLyGiangVien.routeName,
    label: "Giảng viên",
    icon: Icons.person,
  ),
  (
    route: QlHocVien.routeName,
    label: "Học viên",
    icon: Icons.person,
  ),
  (
    route: MobilePageThesisAssignList.routeName,
    label: "Giao đề tài (v2)",
    icon: Icons.assignment_turned_in,
  ),
  (
    route: ThesisTopicListPage.routeName,
    label: "Quản lý đề tài (v2)",
    icon: Icons.assignment_turned_in,
  ),
  (
    route: PageAcademicYearList.routeName,
    label: "Quản lý đợt học",
    icon: Icons.lock_clock,
  ),
  (
    route: PageLopTinChi.routeName,
    label: "Lớp tín chỉ (v1)",
    icon: Icons.class_rounded,
  ),
  (
    route: PageCourseClassList.routeName,
    label: "Lớp tín chỉ (v2)",
    icon: Icons.class_,
  ),
  (
    route: PageAdmissionList.routeName,
    label: "Xét tuyển (v2)",
    icon: Icons.person_add
  ),
  (
    route: PageHanCheHocPhan.routeName,
    label: "Hạn chế học phần",
    icon: Icons.class_rounded
  ),
  (
    route: PageCourseList.routeName,
    label: "Học phần",
    icon: Icons.book,
  ),
  (
    route: PageQuanLyDeTai.routeName,
    label: "Quản lý đề tài",
    icon: Icons.book,
  ),
  (
    route: PageXetTuyen.routeName,
    label: "Xét tuyển cao học",
    icon: Icons.person_add,
  ),
  (
    route: PageXetTuyenNcs.routeName,
    label: "Xét tuyển NCS",
    icon: PageXetTuyenNcs.icon,
  ),
  (
    route: DangKyBaoVePage.routeName,
    label: "Nộp hồ sơ bảo vệ",
    icon: Icons.person_add,
  ),
  (
    route: PagePhanCongHoiDongLuanVanThacSi.routeName,
    label: "Phân hội đồng bảo vệ",
    icon: Icons.person_add,
  ),
  (
    route: PageCopyPasta.routeName,
    label: "Văn mẫu",
    icon: Icons.book,
  ),
  (
    route: SettingsPage.routeName,
    label: "Cài đặt",
    icon: Icons.settings,
  ),
];

MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
  String? name = settings.name;
  Object? args = settings.arguments;
  return MaterialPageRoute(builder: (BuildContext context) {
    // Initial setup

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
      case PageLopTinChi.routeName:
        return PageLopTinChi();
      case DraftPage.routeName:
        return DraftPage();
      case PageXetTuyen.routeName:
        return PageXetTuyen();
      case PageXetTuyenNcs.routeName:
        return PageXetTuyenNcs();
      case PageQuanLyDeTai.routeName:
        return PageQuanLyDeTai();
      case PageHanCheHocPhan.routeName:
        return PageHanCheHocPhan();
      case PagePhanCongHoiDongLuanVanThacSi.routeName:
        return PagePhanCongHoiDongLuanVanThacSi();
      case PageCopyPasta.routeName:
        return PageCopyPasta();
      case QlHocVien.routeName:
        return QlHocVien();

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
      case MobilePageTeacherList.routeName:
        return MobilePageTeacherList.initialize();
      case MobilePageTeacherDetail.routeName:
        return switch (args) {
          (GiangVien teacher) => MobilePageTeacherDetail(teacher: teacher),
          _ => const MobilePageTeacherList(),
        };

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

      /// Admission pages
      case PageAdmissionList.routeName:
        return const PageAdmissionList();
      case PageAdmissionCreate.routeName:
        return const PageAdmissionCreate();
      case PageAdmissionDetail.routeName:
        switch (args) {
          case PageAdmissionDetailArgs args:
            return PageAdmissionDetail.fromArgs(args);
          default:
            return const PageAdmissionList();
        }

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

      /// Thesis topic management pages
      case ThesisTopicListPage.routeName:
        return const ThesisTopicListPage();
      case ThesisTopicAddPage.routeName:
        return const ThesisTopicAddPage();
      case ThesisTopicDetailPage.routeName:
        switch (args) {
          case ThesisTopicDetailPageArguments args:
            return ThesisTopicDetailPage.fromArguments(args);
          default:
            return ThesisTopicListPage();
        }

      /// Drift
      case PageImportHocPhan.routeName:
        return const PageImportHocPhan();

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
  });
}
