import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'custom_widgets.dart';

typedef Formatter<T> = String Function(T? value);

final dateFormat = DateFormat("dd/MM/yyyy");

/// A class to hold the value returned from a dialog.
/// This is used to distinguish between a successful dialog result and a cancelled one.
/// A successful dialog will return a [DialogValue] with the not-[null] property [value].
/// A cancelled dialog will return [null], while a successful dialog with null value
/// will return a [DialogValue] with [value] field set to [null].
class DialogValue<T> {
  final T? value;

  DialogValue(this.value);
}

class InformationTile<T> extends StatefulWidget {
  final bool editOnTap;
  final String titleText;
  final Widget? leading;
  final Widget? trailing;
  final T? initialValue;
  final String Function(T? value)? formatValue;
  final ValueNotifier<T?>? valueNotifier;
  final ValueChanged<T?>? onUpdate;
  final bool readOnly;
  final FutureOr<DialogValue<T>?> Function(
    BuildContext context,
    ValueNotifier<T?>,
  )?
  showEditingDialog;

  const InformationTile({
    super.key,
    required this.titleText,
    required this.initialValue,
    this.editOnTap = false,
    this.trailing,
    this.onUpdate,
    this.valueNotifier,
    this.leading,
    this.readOnly = false,
    this.formatValue,
    this.showEditingDialog,
  });

  @override
  State<InformationTile<T>> createState() => _InformationTileState<T>();
}

class _InformationTileState<T> extends State<InformationTile<T>> {
  late ValueNotifier<T?> valueNotifier;

  T? get value => valueNotifier.value;

  @override
  initState() {
    super.initState();
    valueNotifier = switch (widget.valueNotifier) {
      null => ValueNotifier(widget.initialValue),
      ValueNotifier<T?> notifier => notifier,
    };
  }

  @override
  dispose() {
    super.dispose();
    if (widget.valueNotifier == null) valueNotifier.dispose();
  }

  void copyCurrentValue(BuildContext context) {
    final data = ClipboardData(text: value.toString());
    Clipboard.setData(data);
    final messenger = ScaffoldMessenger.of(context);
    messenger.showMessage("Copied $value");
  }

  void showEditDialog(BuildContext context) async {
    if (widget.readOnly == true) {
      return;
    }

    final dialogValue = await widget.showEditingDialog!(context, valueNotifier);
    switch (dialogValue) {
      case DialogValue value:
        valueNotifier.value = value.value;
        widget.onUpdate?.call(value.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleText = widget.titleText;
    final readOnly = widget.readOnly;

    final editButton = readOnly
        ? null
        : IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => showEditDialog(context),
          );

    return GestureDetector(
      onSecondaryTap: () => showEditDialog(context),
      child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          final valueText = switch (widget.formatValue) {
            null => value.toString(),
            String Function(T? value) formatter => formatter(value),
          };

          return ListTile(
            title: Text(titleText),
            subtitle: Text(valueText),
            leading: widget.leading,
            trailing: widget.trailing ?? editButton,
            onLongPress: () {
              if (widget.editOnTap && !readOnly) {
                copyCurrentValue(context);
              } else if (!readOnly) {
                showEditDialog(context);
              }
            },
            onTap: () {
              if (widget.editOnTap && !readOnly) {
                showEditDialog(context);
              } else {
                copyCurrentValue(context);
              }
            },
          );
        },
      ),
    );
  }
}

class TextEditingDialog2 extends StatelessWidget {
  final String? initialText;
  final String title;
  final bool highlightOnFocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const TextEditingDialog2({
    super.key,
    this.initialText,
    this.highlightOnFocus = true,
    this.keyboardType,
    this.inputFormatters,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialText);
    if (highlightOnFocus) {
      controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: controller.text.length,
      );
    }

    final nav = Navigator.of(context);

    return AlertDialog(
      title: Text(title),
      content: TextFormField(
        controller: controller,
        autofocus: true,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onSaved: (String? value) => nav.pop(DialogValue(value)),
        onFieldSubmitted: (String? value) => nav.pop(DialogValue(value)),
      ),
      actions: [
        TextButton(
          onPressed: () => nav.pop(DialogValue(initialText)),
          child: const Text("Hủy"),
        ),
        TextButton(
          onPressed: () => nav.pop(DialogValue(controller.text)),
          child: const Text("Lưu"),
        ),
      ],
    );
  }

  static FutureOr<DialogValue<String>> show({
    required BuildContext context,
    required String title,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool highlightOnFocus = true,
    String? initialValue,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) => TextEditingDialog2(
        highlightOnFocus: highlightOnFocus,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        title: title,
        initialText: initialValue,
      ),
    );
  }
}

class StringTile extends StatelessWidget {
  final String titleText;
  final bool editOnTap;
  final Widget? leading;
  final Widget? trailing;
  final String initialValue;
  final ValueNotifier<String>? valueNotifier;
  final ValueChanged<String?>? onUpdate;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const StringTile({
    super.key,
    required this.titleText,
    this.editOnTap = false,
    this.onUpdate,
    this.readOnly = false,
    this.valueNotifier,
    this.leading,
    this.trailing,
    this.initialValue = "",
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return InformationTile<String>(
      titleText: titleText,
      initialValue: initialValue,
      valueNotifier: valueNotifier,
      editOnTap: editOnTap,
      onUpdate: onUpdate,
      leading: leading,
      trailing: trailing,
      readOnly: readOnly,
      formatValue: (value) => value ?? "",
      showEditingDialog: (context, valueNotifier) async {
        return await TextEditingDialog2.show(
          title: titleText,
          context: context,
          initialValue: valueNotifier.value,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
        );
      },
    );
  }
}

class IntegerTile extends StatelessWidget {
  final String titleText;
  final Widget? leading;
  final int initialValue;
  final ValueNotifier<int>? valueNotifier;
  final ValueChanged<int?>? onUpdate;
  final bool readOnly;

  const IntegerTile({
    super.key,
    required this.titleText,
    this.onUpdate,
    this.valueNotifier,
    this.leading,
    this.initialValue = 0,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return InformationTile<int>(
      titleText: titleText,
      initialValue: initialValue,
      valueNotifier: valueNotifier,
      onUpdate: onUpdate,
      leading: leading,
      readOnly: readOnly,
      formatValue: (value) => value?.toString() ?? "0",
      showEditingDialog: (context, valueNotifier) async {
        final dialogValue = await TextEditingDialog2.show(
          title: titleText,
          context: context,
          initialValue: valueNotifier.value.toString(),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );

        final parsed = int.tryParse(dialogValue.value ?? "");
        if (parsed != null) {
          return DialogValue(parsed);
        } else {
          return null;
        }
      },
    );
  }
}

class SingleSelectionTile<T> extends StatelessWidget {
  final String titleText;
  final Widget? leading;
  final T? initialValue;
  final List<T?> options;
  final ValueNotifier<T?>? valueNotifier;
  final ValueChanged<T?>? onUpdate;
  final Formatter<T>? valueFormatter;

  const SingleSelectionTile({
    super.key,
    required this.titleText,
    required this.options,
    this.initialValue,
    this.onUpdate,
    this.valueNotifier,
    this.leading,
    this.valueFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return InformationTile<T>(
      titleText: titleText,
      initialValue: initialValue,
      valueNotifier: valueNotifier,
      onUpdate: onUpdate,
      leading: leading,
      formatValue: valueFormatter ?? (x) => x.toString(),
      showEditingDialog: (context, valueNotifier) async {
        return await showDialog<DialogValue<T>?>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(titleText),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final option in options)
                    RadioListTile<T?>(
                      title: Text(option.toString()),
                      value: option,
                      groupValue: valueNotifier.value,
                      onChanged: (T? newValue) {
                        final dialogValue = DialogValue(newValue);
                        Navigator.of(context).pop(dialogValue);
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class EnumTile<T> extends StatefulWidget {
  final String? titleText;
  final Widget? title;
  final Widget? leading;
  final Widget? trailing;
  final T? initialValue;
  final List<T> options;
  final ValueNotifier<T>? valueNotifier;
  final ValueChanged<T>? onUpdate;
  final String Function(T? value)? enumFormatter;

  const EnumTile({
    super.key,
    required this.options,
    this.titleText,
    this.title,
    this.initialValue,
    this.onUpdate,
    this.valueNotifier,
    this.enumFormatter,
    this.trailing,
    this.leading,
  });

  Widget get titleWidget {
    assert(
      titleText != null || title != null,
      "Either titleText or title must be provided",
    );
    assert(
      !(titleText != null && title != null),
      "Only one of titleText or title can be provided",
    );
    if (title != null) {
      return title!;
    } else {
      return Text(titleText!);
    }
  }

  @override
  State<EnumTile<T>> createState() => _EnumTileState<T>();
}

class _EnumTileState<T> extends State<EnumTile<T>> {
  late ValueNotifier<T?> valueNotifier;

  T? get value => valueNotifier.value;

  @override
  initState() {
    super.initState();
    valueNotifier = switch (widget.valueNotifier) {
      ValueNotifier<T> notifier => notifier,
      null => ValueNotifier(widget.initialValue),
    };
  }

  @override
  dispose() {
    super.dispose();
    if (widget.valueNotifier == null) valueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    void copyCurrentValue() {
      final data = ClipboardData(text: value.toString());
      Clipboard.setData(data);
      messenger.showMessage("Copied $value");
    }

    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        final subtitle = switch (widget.enumFormatter) {
          null => value.toString(),
          String Function(T? value) formatter => formatter(value),
        };

        return ListTile(
          title: widget.titleWidget,
          subtitle: Text(subtitle),
          leading: widget.leading,
          trailing:
              widget.trailing ??
              IconButton(
                icon: Icon(Icons.copy),
                onPressed: copyCurrentValue,
              ),
          onLongPress: copyCurrentValue,
          onTap: () async {
            final newValue = await showDialog<T>(
              context: context,
              builder: (context) => EnumSelectionDialog<T>(
                title: "Chọn giá trị mới",
                options: widget.options,
                enumFormatter: widget.enumFormatter,
                initialValue: value,
              ),
            );
            if (newValue != null) {
              valueNotifier.value = newValue;
              widget.onUpdate?.call(newValue);
            }
          },
        );
      },
    );
  }
}

class EnumSelectionDialog<T> extends StatelessWidget {
  final String title;
  final T? initialValue;
  final String Function(T? value)? enumFormatter;
  final List<T> options;

  const EnumSelectionDialog({
    super.key,
    required this.title,
    required this.options,
    this.enumFormatter,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final enumFormatter_ = enumFormatter ?? (value) => value.toString();

    return AlertDialog(
      scrollable: true,
      title: Text(title),
      content: RadioGroup(
        groupValue: initialValue,
        onChanged: (T? newValue) {
          Navigator.of(context).pop(newValue);
        },
        child: Column(
          children: [
            for (final option in options)
              RadioListTile(
                title: Text(enumFormatter_(option)),
                selected: option == initialValue,
                value: option,
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}

class DateTile extends StatefulWidget {
  final String titleText;
  final Widget? leading;
  final ValueNotifier<DateTime?>? valueNotifier;
  final ValueChanged<DateTime?>? onUpdate;
  final DateTime? initialValue;
  final DateFormat? dateFormat;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateTile({
    super.key,
    required this.titleText,
    this.onUpdate,
    this.valueNotifier,
    this.leading,
    this.initialValue,
    this.dateFormat,
    this.firstDate,
    this.lastDate,
  });

  @override
  State<DateTile> createState() => _DateTileState();
}

class _DateTileState extends State<DateTile> {
  late ValueNotifier<DateTime?> valueNotifier;
  late DateFormat dateFormat;

  @override
  initState() {
    super.initState();
    dateFormat = widget.dateFormat ?? DateFormat("dd/MM/yyyy");
    valueNotifier = switch (widget.valueNotifier) {
      null => ValueNotifier(widget.initialValue),
      ValueNotifier<DateTime?> notifier => notifier,
    };
  }

  @override
  dispose() {
    super.dispose();
    if (widget.valueNotifier == null) valueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        final dateString = switch (value) {
          null => "N/A",
          DateTime dateTime => dateFormat.format(dateTime),
        };

        return ListTile(
          title: Text(widget.titleText),
          subtitle: Text(dateString),
          leading: widget.leading,
          onTap: () async {
            final newValue = await showDatePicker(
              context: context,
              initialDate: value ?? DateTime.now(),
              firstDate: widget.firstDate ?? DateTime(1900),
              lastDate: widget.lastDate ?? DateTime(2100),
            );
            if (newValue != null) {
              valueNotifier.value = newValue;
              widget.onUpdate?.call(newValue);
            }
          },
        );
      },
    );
  }
}
