/// This is part of [custom_tiles_v2.dart] package.
///
/// Provides [StringTile] widget that displays and edits string values.
library;

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../custom_tiles_v2.dart';

/// A ListTile that allow displaying and editing strings.
///
/// Extra options:
/// - [validator]: Validator function for [TextFormField]
/// - [emptyIsNull]: Make empty value [null] instead returning empty strings
/// - [trim]: Should the text be trimmed before checking for [emptyIsNull] and passed to [onChanged]
///
/// See [InformationTile] for all the other properties.
class StringTile extends InformationTile<String?> {
  final String? Function(String?)? validator;

  final bool emptyIsNull;
  final bool trim;

  @override
  String valueFormatter(String? value) => value ?? "";

  const StringTile({
    super.key,
    required super.title,
    required super.value,
    super.deleteConfirmationMessage,
    super.cannotDeleteMessage,
    super.cannotEditMessage,
    super.leading,
    super.trailing,
    super.onDelete,
    super.mode,
    super.onChanged,
    required this.emptyIsNull,
    this.trim = true,
    this.validator,
  });

  @override
  Widget buildEditingDialog(BuildContext context) {
    return StringTileEditingDialog(
      title: title,
      initialValue: value,
      emptyIsNull: emptyIsNull,
      onChanged: onChanged,
      trim: trim,
      validator: validator,
    );
  }
}

class StringTileEditingDialog extends StatefulWidget {
  final Widget title;
  final String? initialValue;
  final bool emptyIsNull;
  final bool trim;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;

  const StringTileEditingDialog({
    super.key,
    required this.title,
    required this.initialValue,
    required this.emptyIsNull,
    required this.onChanged,
    required this.trim,
    this.validator,
  });

  @override
  State<StringTileEditingDialog> createState() =>
      _StringTileEditingDialogState();
}

class _StringTileEditingDialogState extends State<StringTileEditingDialog> {
  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue ?? "";
  }

  @override
  void dispose() {
    controller.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  bool validateAndSave() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return false;

    final trimmed = switch (widget.trim) {
      true => controller.text.trim(),
      false => controller.text,
    };

    final value = switch (widget.emptyIsNull) {
      true => trimmed.isEmpty ? null : trimmed,
      false => trimmed,
    };

    widget.onChanged?.call(value);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SimpleDialog(
        title: widget.title,
        contentPadding: EdgeInsets.all(context.gutter),

        children: [
          TextFormField(
            controller: controller,
            autofocus: true,
            validator: widget.validator,
            decoration: const InputDecoration(
              labelText: "Giá trị",
            ),
          ),
          SizedBox(height: context.gutterSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: context.gutterSmall,
            children: [
              TextButton.icon(
                icon: const Icon(Symbols.delete),
                label: const Text("Hủy"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FilledButton.icon(
                icon: const Icon(Symbols.save),
                label: const Text("Lưu"),
                onPressed: () {
                  if (validateAndSave()) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
