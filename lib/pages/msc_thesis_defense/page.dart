import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../pages.dart';
import '../../custom_widgets.dart';

class ThesisDefensePage extends StatelessWidget {
  static const String routeName = '/thesis-defense';
  const ThesisDefensePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavigationTile(
        leading: const Icon(Symbols.checklist),
        title: "Danh sách đề tài",
        callback: (nav) => nav.toThesisListPage(),
      ),
      _NavigationTile(
        leading: const Icon(Symbols.assignment),
        title: "Giao đề tài",
        callback: (nav) => nav.toThesisAssignmentPage(),
      ),
      _NavigationTile(
        leading: const Icon(Symbols.school),
        title: "Bảo vệ luận văn",
        callback: (_) {},
      ),
      _NavigationTile(
        leading: const Icon(Symbols.currency_exchange),
        title: "Thanh toán chấm luận văn",
        callback: (_) {},
      ),
    ];

    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text('Luận văn thạc sĩ'),
        ),
      ),
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) => items[index],
          ),
        ),
      ),
    );
  }
}

class _NavigationTile extends StatelessWidget {
  final Widget? leading;
  final Widget? subtitle;
  final String title;
  final Function(AppNavigator) callback;

  const _NavigationTile({
    this.leading,
    this.subtitle,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: subtitle,
      trailing: const Icon(Symbols.chevron_right),
      onTap: () {
        final router = AppNavigator(context);
        callback(router);
      },
    );
  }
}
