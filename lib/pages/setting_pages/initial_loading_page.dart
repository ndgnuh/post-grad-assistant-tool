import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/db_v2_providers.dart';
import 'setting_pages.dart';
import '../pages.dart' as pages;

class InitialLoadingPage extends ConsumerWidget {
  static const routeName = '/initial-loading';
  const InitialLoadingPage({super.key});

  Widget get loading => const Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = Navigator.of(context);
    final databaseAsync = ref.watch(nullableDatabaseProvider);
    switch (databaseAsync) {
      case AsyncLoading():
        return loading;
      case AsyncError(:final error):
        return ErrorPage(error: error);
      case AsyncData(:final value):
        // Navigate to the initial setup page
        switch (value) {
          case null:
            Future.microtask(() {
              navigator.pushReplacementNamed(InitialSetupPage.routeName);
            });
          default:
            Future.microtask(() {
              navigator.pushReplacementNamed(pages.initialRoute);
            });
        }
        return loading;
    }
  }
}

class ErrorPage extends StatelessWidget {
  static const routeName = '/error';
  final Object error;
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Lỗi: $error'),
      ),
    );
  }
}

class TodoPage extends StatelessWidget {
  static const routeName = '/todo';
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('TODO: Implement this page'),
      ),
    );
  }
}
