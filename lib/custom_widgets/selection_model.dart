import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UnselectedException implements Exception {
  final String message;
  UnselectedException([this.message = "No item is selected."]);

  @override
  String toString() => "UnselectedException: $message";
}

class SelectionModel<T> {
  final T? selected;
  final List<T> options;
  final TextEditingController labelController = TextEditingController();
  final ValueChanged<SelectionModel<T>>? onChanged;

  SelectionModel({
    required this.selected,
    required this.options,
    this.onChanged,
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
    final updated = SelectionModel<T>(
      selected: item,
      options: options,
      onChanged: onChanged,
    );
    onChanged?.call(updated);
    return updated;
  }
}

mixin SelectionModelMixin<T> on AsyncNotifier<SelectionModel<T>> {
  // Name of the stored preference String get prefKey;

  // List of options
  FutureOr<List<T>> get options;

  // Load stored selection
  FutureOr<T?> load(SharedPreferences prefs);

  // Save selection
  void save(SharedPreferences prefs, T? item);

  @override
  FutureOr<SelectionModel<T>> build() async {
    final prefs = await SharedPreferences.getInstance();
    final selected = await load(prefs);

    return SelectionModel<T>(
      selected: selected,
      options: await options,
    );
  }

  void deselect() async {
    switch (state) {
      case AsyncLoading():
        return;
      case AsyncError():
        return;
      case AsyncData():
        final model = state.value!;
        state = AsyncData(model.deselect());
        final prefs = await SharedPreferences.getInstance();
        save(prefs, null);
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
        final prefs = await SharedPreferences.getInstance();
        save(prefs, model.selected);
    }
  }

  void select(T? item) async {
    switch (state) {
      case AsyncLoading():
        return;
      case AsyncError():
        return;
      case AsyncData():
        final model = state.value!;
        final prefs = await SharedPreferences.getInstance();
        state = AsyncData(model.select(item));
        save(prefs, item);
    }
  }
}

class SingleSelectionModel<T> {
  T? selected;
  final List<T> options;
  final ValueChanged<T?>? onChanged;

  SingleSelectionModel({
    required this.selected,
    required this.options,
    this.onChanged,
  });

  void deselect() => select(null);

  int? get selectedIndex {
    switch (selected) {
      case null:
        return null;
      case T selected:
        return options.indexOf(selected);
    }
  }

  void cycle() {
    switch (selectedIndex) {
      case null:
        return select(options.first);
      case int i:
        final n = options.length;
        final j = (i + 1) % n;
        return select(options[j]);
    }
  }

  void select(T? item) {
    selected = item;
    onChanged?.call(item);
  }
}
