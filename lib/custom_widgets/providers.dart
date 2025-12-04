import 'package:riverpod/riverpod.dart';

class StateNotifier<T> extends Notifier<T> {
  final T initialState;
  StateNotifier(this.initialState);

  @override
  T build() => initialState;

  void set(T value) {
    state = value;
  }
}

class NullableStateNotifier<T> extends Notifier<T?> {
  final T? initialState;
  NullableStateNotifier(this.initialState);

  @override
  T? build() => initialState;

  void set(T value) {
    state = value;
  }

  void clear() {
    state = null;
  }
}
