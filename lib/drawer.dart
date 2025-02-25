import 'package:flutter/material.dart';
import 'pages.dart';

const _routes = [
  (route: HomePage.routeName, label: "Trang chính", icon: Icons.home),
  (route: DanhSachGiangVien.routeName, label: "Giảng viên", icon: Icons.person),
  (
    route: DanhSachLopTinChi.routeName,
    label: "Lớp học",
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

class MyDrawer extends StatelessWidget {
  final String? selectedRoute;
  const MyDrawer({super.key, this.selectedRoute});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        DrawerHeader(
          child: Text(
            "Fami Tools",
            style: TextStyle(fontSize: 32),
          ),
        ),
        ...[
          for (final route in _routes)
            ListTile(
              onTap: () => Navigator.pushNamed(context, route.route),
              leading: Icon(route.icon),
              title: Text(route.label),
              selected: selectedRoute == route.route,
              hoverColor: Color.fromRGBO(0, 0, 0, 0.1),
            )
        ]
      ],
    );
  }
}
