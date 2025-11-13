import 'package:fami_tools/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'main_tab.dart';
import 'action_tab.dart';

class ThesisDefensePaymentPage extends StatelessWidget {
  static const routeName = '/msc/thesis/defense/payment';
  const ThesisDefensePaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Danh sách"),
                Tab(text: "Thao tác"),
              ],
            ),
            title: const Text('Luận văn cần thanh toán'),
          ),
        ),
        body: ConstrainedBody(
          child: Center(
            child: TabBarView(
              children: [
                ListTabView(),
                ActionTabView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
