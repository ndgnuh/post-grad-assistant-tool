import 'package:flutter/material.dart';
import 'datamodels.dart';

import 'pages/lop_tin_chi.dart' show DanhSachLopTinChi;
import 'pages/danh_sach_giang_vien.dart' show DanhSachGiangVien;
import 'pages/home.dart' show HomePage;
import 'pages/chi_tiet_giang_vien.dart' show ChiTietGiangVien;
import 'pages/draft.dart' show DraftPage;
import 'pages/danh_sach_hoc_phan.dart' show DanhSachHocPhan;
import 'pages/+phan_cong_do_an.dart' show PagePhanCongDoAn;
import 'pages/xet_tuyen.dart' show PageXetTuyen;

export 'pages/lop_tin_chi.dart' show DanhSachLopTinChi;
export 'pages/danh_sach_giang_vien.dart' show DanhSachGiangVien;
export 'pages/home.dart' show HomePage;
export 'pages/chi_tiet_giang_vien.dart' show ChiTietGiangVien;
export 'pages/draft.dart' show DraftPage;
export 'pages/danh_sach_hoc_phan.dart' show DanhSachHocPhan;
export 'pages/+phan_cong_do_an.dart' show PagePhanCongDoAn;
export 'pages/xet_tuyen.dart' show PageXetTuyen;

const initialRoute = PageXetTuyen.routeName;

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
      case DanhSachLopTinChi.routeName:
        return DanhSachLopTinChi();
      case DraftPage.routeName:
        return DraftPage();
      case DanhSachHocPhan.routeName:
        return DanhSachHocPhan();
      case PageXetTuyen.routeName:
        return PageXetTuyen();
      default:
        return HomePage();
    }
  });
}
