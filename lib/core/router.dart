import 'package:flutter/material.dart';

final navigationKey = GlobalKey<NavigatorState>();

class AppRouter {
  final BuildContext context;

  AppRouter([BuildContext? context])
    : context = context ?? navigationKey.currentContext!;

  NavigatorState get navigator => Navigator.of(context);

  void moveTo(WidgetBuilder builder) {
    navigator.push(
      MaterialPageRoute(builder: builder),
    );
  }

  void pop<T>(T obj) => navigator.pop<T>(obj);
}
