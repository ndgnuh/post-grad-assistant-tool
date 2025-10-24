import 'dart:core';

import 'package:fami_tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../pages.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gutter = context.responsiveGutter;
    VoidCallback? navigatorCallback(String? route) {
      if (route == null) return null;
      return () => Navigator.of(context).pushNamed(route);
    }

    return Scaffold(
      body: ConstrainedBody(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(gutter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: gutter,
            children: [
              for (final entry in routesBySections.entries)
                _NavigationSection(
                  title: entry.key,
                  children: [
                    for (final route in entry.value)
                      ListTile(
                        title: Text(route.label),
                        leading: Icon(route.icon),
                        subtitle: route.subtitle != null
                            ? Text(route.subtitle!)
                            : null,
                        trailing: const Icon(Icons.chevron_right),
                        onTap: navigatorCallback(route.route),
                        enabled: route.route != null,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _NavigationSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final childrenWithDividers = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      childrenWithDividers.add(children[i]);
      if (i < children.length - 1) {
        childrenWithDividers.add(Divider());
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(title: Text(title)),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: context.gutterTiny),
              ...childrenWithDividers,
              SizedBox(height: context.gutterTiny),
            ],
          ),
        ),
      ],
    );
  }
}
