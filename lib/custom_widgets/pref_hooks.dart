import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHookResult<T> {
  final ValueNotifier<T?> notifier;
  final Future<void> Function(T?) setValue;

  set value(T? newValue) => setValue(newValue);

  T? get value => notifier.value;

  const PreferenceHookResult({
    required this.notifier,
    required this.setValue,
  });
}

ValueNotifier<T> usePreference<T>(
  String key, {
  required T defaultValue,
}) {
  // 1. State for holding the preference value. Initialized with the default.
  final state = useState<T>(defaultValue);

  // 2. A Future to represent the async loading of the preference.
  useEffect(() {
    Future<void> load() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.get(key);
      switch (value) {
        case T val:
          state.value = val;
          break;
      }
    }

    load();
    return null;
  }, [key]); // Re-run if the key changes

  // 4. Create a memoized callback for updating the preference.
  useEffect(() {
    void callback() async {
      // print("Preference '$key' updated to: ${state.value}");
      final value = state.value;
      final prefs = await SharedPreferences.getInstance();
      switch (value) {
        case null:
          await prefs.remove(key);
        case int newValue:
          await prefs.setInt(key, newValue);
        case double newValue:
          await prefs.setDouble(key, newValue);
        case bool newValue:
          await prefs.setBool(key, newValue);
        case String newValue:
          await prefs.setString(key, newValue);
        case List<String> newValue:
          await prefs.setStringList(key, newValue);
        default:
          throw Exception('Unsupported preference type: $T');
      }
    }

    state.addListener(callback);

    return () => state.removeListener(callback);
  }, [state]);

  // 5. Return the current value and the update function.
  return state;
}
