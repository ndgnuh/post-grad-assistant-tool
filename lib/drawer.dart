import 'package:flutter/material.dart';
import 'pages.dart';

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
          for (final route in routes)
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
