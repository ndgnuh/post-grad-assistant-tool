import 'package:flutter/material.dart';
import 'datamodels.dart';
import '../business/domain_objects.dart';

import 'pages/lop_tin_chi.dart' show PageLopTinChi;
import 'pages/home.dart' show HomePage;
import 'pages/chi_tiet_giang_vien.dart' show ChiTietGiangVien;
import 'pages/draft.dart' show DraftPage;
import 'pages/danh_sach_hoc_phan.dart' show DanhSachHocPhan;
import 'pages/phan_cong_hoi_dong_lvths.dart'
    show PagePhanCongHoiDongLuanVanThacSi;
import 'pages/xet_tuyen.dart' show PageXetTuyen;
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

import 'pages/settings.dart' show SettingsPage;

import 'pages/drift_import.dart' show PageImportHocPhan;

import 'pages/mobile/teacher_list.dart' show MobilePageTeacherList;
import 'pages/mobile/teacher_detail.dart' show MobilePageTeacherDetail;
import 'pages/mobile/thesis_assign_list.dart' show MobilePageThesisAssignList;

import 'pages/mobile/select_class_of.dart'
    show PageSelectClassOf, PageSelectClassOfArgs;

// const initialRoute = SettingsPage.routeName;
const initialRoute = MobilePageThesisAssignList.routeName;
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
  (route: PageLopTinChi.routeName, label: "Lớp học", icon: Icons.class_rounded),
  (
    route: PageHanCheHocPhan.routeName,
    label: "Hạn chế học phần",
    icon: Icons.class_rounded
  ),
  (
    route: DraftPage.routeName,
    label: "Draft",
    icon: Icons.drafts,
  ),
  (
    route: DanhSachHocPhan.routeName,
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
      case DanhSachHocPhan.routeName:
        return DanhSachHocPhan();
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

      /// Selection pages
      case PageSelectClassOf.routeName:
        final args = settings.arguments;
        switch (args) {
          case PageSelectClassOfArgs args:
            return PageSelectClassOf.fromArgs(args);
        }
        return HomePage();

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
