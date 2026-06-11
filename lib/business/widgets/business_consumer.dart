import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _loading = Center(
  child: LinearProgressIndicator(),
);

Widget _buildLoading(BuildContext context) {
  return _loading;
}

Widget _buildError(BuildContext context, Object error, StackTrace stackTrace) {
  return Center(
    child: Text("Error $error\n$stackTrace"),
  );
}

class BusinessConsumer<T> extends ConsumerWidget {
  final Widget Function(BuildContext, T) builder;
  final Widget Function(BuildContext, Object, StackTrace) errorBuilder;
  final Widget Function(BuildContext) loadingBuilder;
  final AsyncValue<T> asyncValue;

  const BusinessConsumer({
    super.key,
    required this.builder,
    required this.asyncValue,
    Widget Function(BuildContext, Object, StackTrace)? errorBuilder,
    Widget Function(BuildContext)? loadingBuilder,
  }) : errorBuilder = errorBuilder ?? _buildError,
       loadingBuilder = loadingBuilder ?? _buildLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (asyncValue) {
      case AsyncLoading():
        return loadingBuilder(context);
      case AsyncError(:final error, :final stackTrace):
        print(error);
        return errorBuilder(
          context,
          error,
          stackTrace,
        );
      case AsyncData(:final value):
        return builder(context, value);
    }
  }
}
