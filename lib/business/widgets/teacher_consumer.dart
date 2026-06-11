import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db_v2_providers.dart';
import 'business_consumer.dart';

class TeacherConsumer extends ConsumerWidget {
  final int id;
  final Widget Function(BuildContext, TeacherData) builder;
  final Widget Function(BuildContext, Object, StackTrace)? errorBuilder;
  final Widget Function(BuildContext)? loadingBuilder;

  const TeacherConsumer({
    super.key,
    required this.id,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherAsync = ref.watch(teacherByIdProvider(id));
    return BusinessConsumer(
      builder: builder,
      asyncValue: teacherAsync,
      errorBuilder: errorBuilder,
      loadingBuilder: loadingBuilder,
    );
  }
}

class StudentConsumer extends ConsumerWidget {
  final int id;
  final Widget Function(BuildContext, StudentData) builder;
  final Widget Function(BuildContext, Object, StackTrace)? errorBuilder;
  final Widget Function(BuildContext)? loadingBuilder;

  const StudentConsumer({
    super.key,
    required this.id,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentAsync = ref.watch(studentByIdProvider(id));
    return BusinessConsumer(
      builder: builder,
      asyncValue: studentAsync,
      errorBuilder: errorBuilder,
      loadingBuilder: loadingBuilder,
    );
  }
}

class DatabaseConsumer extends ConsumerWidget {
  final Widget Function(BuildContext, AppDatabase) builder;
  final Widget Function(BuildContext, Object, StackTrace)? errorBuilder;
  final Widget Function(BuildContext)? loadingBuilder;

  const DatabaseConsumer({
    super.key,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(mainDatabaseProvider);
    return BusinessConsumer(
      builder: builder,
      asyncValue: asyncValue,
      errorBuilder: errorBuilder,
      loadingBuilder: loadingBuilder,
    );
  }
}
