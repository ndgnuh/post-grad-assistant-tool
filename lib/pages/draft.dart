import 'package:flutter/material.dart';
import '../drawer.dart';

class DraftPage extends StatelessWidget {
  static const routeName = "/draft";
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          IntrinsicWidth(
            child: MyDrawer(selectedRoute: routeName),
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                leading: null,
                title: const Text("FamiTools"),
                automaticallyImplyLeading: false,
              ),
              body: Center(
                child: Text("ADASDSD"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
