import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'dart:io';

const _magicPreferenceKey = '<widget-selected-directory>';
String _getDirectoryPreferenceKey(String name) {
  return '$_magicPreferenceKey/$name';
}

/// A widget that allows users to pick a directory.
/// The base widget is a [TextFormField] with a suffix icon that opens a directory picker dialog.
/// The selected directory path is stored in a [TextEditingController] and can be validated.
/// The widget can also save the selected directory to shared preferences if a [name] is provided.
/// Additionally, user can specify an [initialDirectory] and a callback [onDirectorySelected] for when a directory is selected.
/// The label on the text field can be customized with [labelText] and [hintText].
class DirectoryPicker extends StatefulWidget {
  final String? initialDirectory;
  final String? name;
  final ValueChanged<String>? onDirectorySelected;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;

  const DirectoryPicker({
    super.key,
    this.name,
    this.labelText,
    this.hintText,
    this.initialDirectory,
    this.controller,
    this.onDirectorySelected,
  });

  @override
  State<DirectoryPicker> createState() => _DirectoryPickerState();
}

class _DirectoryPickerState extends State<DirectoryPicker> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController valueNotifier;

  @override
  initState() {
    super.initState();
    // Initialize the value notifier if it is provided
    if (widget.controller != null) {
      valueNotifier = widget.controller!;
    } else {
      valueNotifier = TextEditingController();
    }

    _loadInitialDirectory();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      // Only dispose the notifier if it was created in this widget
      valueNotifier.dispose();
    }
    super.dispose();
  }

  Future<void> _loadInitialDirectory() async {
    final name = widget.name;
    if (name == null) {
      valueNotifier.text = widget.initialDirectory ?? '';
      return;
    }

    final key = _getDirectoryPreferenceKey(name);
    final prefs = await SharedPreferences.getInstance();
    final savedDirectory = prefs.getString(key);
    if (savedDirectory != null) {
      widget.onDirectorySelected?.call(savedDirectory);
      valueNotifier.text = savedDirectory;
    }
    return;
  }

  Future<void> _saveDirectoryToPreference(String directory) async {
    if (widget.name == null) return;

    final key = _getDirectoryPreferenceKey(widget.name!);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, directory);
  }

  Future<void> validateAndSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      final directory = valueNotifier.text;
      widget.onDirectorySelected?.call(directory);
      await _saveDirectoryToPreference(directory);
    }
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng chọn thư mục lưu';
    }

    final dir = Directory(value);
    if (!dir.existsSync()) {
      return 'Thư mục không tồn tại';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: valueNotifier,
        validator: validator,
        onChanged: (_) => formKey.currentState!.validate(),
        onFieldSubmitted: (_) => validateAndSubmit(),
        decoration: InputDecoration(
          labelText: widget.labelText ?? "Chọn thư mục",
          hintText: widget.hintText ?? "Click vào icon bên phải để chọn",
          suffixIcon: IconButton(
            icon: Icon(Symbols.folder),
            onPressed: () async {
              final dirPath = await FilePicker.platform.getDirectoryPath(
                lockParentWindow: true,
                dialogTitle: 'Chọn thư mục lưu',
              );
              if (dirPath == null) return;

              valueNotifier.text = dirPath;
              validateAndSubmit();
            },
          ),
        ),
      ),
    );
  }
}
