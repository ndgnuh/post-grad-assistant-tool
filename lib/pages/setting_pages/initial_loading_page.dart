import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../pages.dart' as pages;
import 'providers.dart';
import 'setting_pages.dart';

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

    final initialSetupDoneAsync = ref.watch(initialSetupDoneProvider);

    switch (initialSetupDoneAsync) {
      case AsyncLoading():
        return loading;
      case AsyncError(:final error):
        return ErrorPage(error: error);
      case AsyncData(:final value):
        // Navigate to the initial setup page
        switch (value) {
          case false:
            Future.microtask(() {
              navigator.pushReplacementNamed(InitialSetupPage.routeName);
            });
          default:
            ref.watch(isDarkModeProvider.future).then((_) {
              Future.microtask(() {
                navigator.pushReplacementNamed(pages.initialRoute);
              });
            });
        }
        return loading;
    }
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
