import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:material_symbols_icons/symbols.dart';
import './router.dart' show navigationKey;

Future<String?> showTextEditingDialog({
  Widget? title,
  String? titleText,
  String? initialValue,
  String? Function(String?)? validator,
  BuildContext? context,
  InputDecoration textFieldDecoration = const InputDecoration(),
}) async {
  final controller = TextEditingController(text: initialValue);

  if (title == null && titleText != null) {
    title = Text(titleText);
  } else if (title == null) {
    throw "Title or titleText is required";
  }

  context ??= navigationKey.currentContext!;
  return await showDialog<String?>(
    context: context,
    builder: (context) {
      final navigator = Navigator.of(context);

      return SimpleDialog(
        title: title,
        contentPadding: EdgeInsets.all(context.gutter),
        children: [
          TextFormField(
            decoration: textFieldDecoration,
            validator: validator,
            controller: controller,
            autofocus: true,
          ),
          SizedBox(height: context.gutterSmall),
          IntrinsicHeight(
            child: Row(
              spacing: context.gutterSmall,
              children: [
                FilledButton(
                  onPressed: () => navigator.pop(controller.text),
                  child: Text("Ok"),
                ),
                OutlinedButton(
                  onPressed: () => navigator.pop(),
                  child: Text("Hủy"),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

/// Return [option, selected], as option can also be null
Future<(T?, bool)> showSingleSelectionDialog<T>({
  Widget title = const Text("Lựa chọn"),
  required List<T> options,
  String Function(T)? valueFormatter,
  T? initialValue,
  BuildContext? context,
  bool showDelete = true,
}) async {
  context ??= navigationKey.currentContext!;

  final ret = await showDialog(
    context: context,
    builder: (context) {
      final navigator = Navigator.of(context);
      return SimpleDialog(
        title: title,
        children: [
          RadioGroup(
            groupValue: initialValue,
            onChanged: (value) => navigator.pop((value, true)),
            child: Column(
              children: [
                ...options.map((option) {
                  final label = switch (valueFormatter) {
                    Function fn => fn(option),
                    _ => option.toString(),
                  };
                  return RadioListTile(
                    title: Text(label),
                    value: option,
                  );
                }),
                Divider(),
                if (showDelete)
                  ListTile(
                    leading: Icon(Symbols.clear),
                    title: Text("Xóa"),
                    onTap: () => navigator.pop((null, true)),
                  ),
                ListTile(
                  leading: Icon(Symbols.chevron_backward),
                  title: Text("Quay lại"),
                  onTap: () => navigator.pop((null, false)),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );

  return (ret == null) ? (null, false) : ret;
}
