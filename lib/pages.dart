import 'package:flutter/material.dart';
import 'datamodels.dart';

import 'pages/lop_tin_chi.dart' show PageLopTinChi;
import 'pages/home.dart' show HomePage;
import 'pages/chi_tiet_giang_vien.dart' show ChiTietGiangVien;
import 'pages/draft.dart' show DraftPage;
import 'pages/danh_sach_hoc_phan.dart' show DanhSachHocPhan;
import 'pages/+phan_cong_do_an.dart' show PagePhanCongDoAn;
import 'pages/phan_cong_hoi_dong_lvths.dart'
    show PagePhanCongHoiDongLuanVanThacSi;
import 'pages/xet_tuyen.dart' show PageXetTuyen;
import 'pages/page_xet_tuyen_ncs.dart' show PageXetTuyenNcs;
import 'pages/de_tai_ths.dart' show PageQuanLyDeTai;
import 'pages/han_che_hoc_phan.dart' show PageHanCheHocPhan;
import 'pages/danh_sach_giang_vien.dart' show PageQuanLyGiangVien;
import 'pages/page_copy_pasta.dart' show PageCopyPasta;

// const initialRoute = PagePhanCongHoiDongLuanVanThacSi.routeName;
// const initialRoute = PageQuanLyGiangVien.routeName;
//const initialRoute = PageCopyPasta.routeName;
// const initialRoute = PageXetTuyen.routeName;
const initialRoute = PageQuanLyDeTai.routeName;
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
    route: PageQuanLyGiangVien.routeName,
    label: "Giảng viên",
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
    route: PagePhanCongDoAn.routeName,
    label: "Phân công đồ án",
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
    route: PagePhanCongHoiDongLuanVanThacSi.routeName,
    label: "Phân hội đồng bảo vệ",
    icon: Icons.person_add,
  ),
  (
    route: PageCopyPasta.routeName,
    label: "Văn mẫu",
    icon: Icons.book,
  ),
];

MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
  String? name = settings.name;
  Object? args = settings.arguments;
  return MaterialPageRoute(builder: (BuildContext context) {
    switch (name) {
      case PagePhanCongDoAn.routeName:
        return PagePhanCongDoAn();
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
      default:
        return HomePage();
    }
  });
}
