import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionModel<T> {
  final T? selected;
  final List<T> options;
  final TextEditingController labelController = TextEditingController();

  SelectionModel({
    required this.selected,
    required this.options,
  });

  SelectionModel<T> deselect() {
    labelController.clear();
    return select(null);
  }

  int? get selectedIndex {
    for (final (idx, opt) in options.indexed) {
      if (opt == selected) return idx;
    }
    return null;
  }

  SelectionModel<T> cycle() {
    switch (selectedIndex) {
      case null:
        return select(options.first);
      case int i:
        final n = options.length;
        final j = (i + 1) % n;
        return select(options[j]);
    }
  }

  SelectionModel<T> select(T? item) {
    return SelectionModel<T>(
      selected: item,
      options: options,
    );
  }
}

mixin SelectionModelMixin<T> on AsyncNotifier<SelectionModel<T>> {
  String get prefKey;

  void deselect() async {
    await saveSelection(null);
    switch (state) {
      case AsyncLoading():
        return;
      case AsyncError():
        return;
      case AsyncData():
        final model = state.value!;
        state = AsyncData(model.deselect());
        await saveSelection(null);
    }
  }

  void cycle() async {
    switch (state) {
      case AsyncLoading():
        return;
      case AsyncError():
        return;
      case AsyncData():
        final model = state.value!.cycle();

        state = AsyncData(model);
        await saveSelection(model.selected);
    }
  }

  Future<void> saveSelection(T? item);
  void select(T? item) async {
    switch (state) {
      case AsyncLoading():
        return;
      case AsyncError():
        return;
      case AsyncData():
        final model = state.value!;
        state = AsyncData(model.select(item));
        await saveSelection(item);
    }
  }
}
