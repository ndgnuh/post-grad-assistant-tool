import 'package:flutter/material.dart';
import 'datamodels.dart';

export 'pages/lop_tin_chi.dart' show PageLopTinChi;
export 'pages/danh_sach_giang_vien.dart' show DanhSachGiangVien;
export 'pages/home.dart' show HomePage;
export 'pages/chi_tiet_giang_vien.dart' show ChiTietGiangVien;
export 'pages/draft.dart' show DraftPage;
export 'pages/danh_sach_hoc_phan.dart' show DanhSachHocPhan;
export 'pages/+phan_cong_do_an.dart' show PagePhanCongDoAn;
export 'pages/xet_tuyen.dart' show PageXetTuyen;
export 'pages/de_tai_ths.dart' show PageQuanLyDeTai;
export 'pages/han_che_hoc_phan.dart' show PageHanCheHocPhan;

import 'pages/lop_tin_chi.dart' show PageLopTinChi;
import 'pages/danh_sach_giang_vien.dart' show DanhSachGiangVien;
import 'pages/home.dart' show HomePage;
import 'pages/chi_tiet_giang_vien.dart' show ChiTietGiangVien;
import 'pages/draft.dart' show DraftPage;
import 'pages/danh_sach_hoc_phan.dart' show DanhSachHocPhan;
import 'pages/+phan_cong_do_an.dart' show PagePhanCongDoAn;
import 'pages/xet_tuyen.dart' show PageXetTuyen;
import 'pages/de_tai_ths.dart' show PageQuanLyDeTai;
import 'pages/han_che_hoc_phan.dart' show PageHanCheHocPhan;

const initialRoute = PageXetTuyen.routeName;
// const initialRoute = PageQuanLyDeTai.routeName;
// const initialRoute = PageHanCheHocPhan.routeName;
// const initialRoute = PageLopTinChi.routeName;

const routes = [
  (
    route: HomePage.routeName,
    label: "Trang chính",
    icon: Icons.home,
  ),
  (
    route: DanhSachGiangVien.routeName,
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
    route: PageXetTuyen.routeName,
    label: "Xét tuyển cao học",
    icon: Icons.person_add,
  ),
];

MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
  String? name = settings.name;
  Object? args = settings.arguments;
  return MaterialPageRoute(builder: (BuildContext context) {
    switch (name) {
      case PagePhanCongDoAn.routeName:
        return PagePhanCongDoAn();
      case DanhSachGiangVien.routeName:
        return DanhSachGiangVien();
      case "/edit/giang-vien":
        return switch (args) {
          (GiangVien gv) => ChiTietGiangVien(gv: gv),
          _ => const DanhSachGiangVien(),
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
      case PageQuanLyDeTai.routeName:
        return PageQuanLyDeTai();
      case PageHanCheHocPhan.routeName:
        return PageHanCheHocPhan();
      default:
        return HomePage();
    }
  });
}
