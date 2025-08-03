import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'custom_widgets.dart';

final dateFormat = DateFormat("dd/MM/yyyy");

class StringTile extends StatefulWidget {
  final String titleText;
  final Widget? leading;
  final String initialValue;
  final ValueNotifier<String>? valueNotifier;
  final ValueChanged<String>? onUpdate;
  final bool readOnly;

  const StringTile({
    super.key,
    required this.titleText,
    this.onUpdate,
    this.readOnly = false,
    this.valueNotifier,
    this.leading,
    this.initialValue = "",
  });

  @override
  State<StringTile> createState() => _StringTileState();
}

class _StringTileState extends State<StringTile> {
  late ValueNotifier<String> valueNotifier;

  String get value => valueNotifier.value;

  @override
  initState() {
    super.initState();
    valueNotifier = switch (widget.valueNotifier) {
      null => ValueNotifier(widget.initialValue),
      ValueNotifier<String> notifier => notifier,
    };

    valueNotifier.addListener(() => setState(() {}));
  }

  @override
  dispose() {
    super.dispose();
    if (widget.valueNotifier == null) valueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleText = widget.titleText;
    final messenger = ScaffoldMessenger.of(context);

    void copyCurrentValue() {
      final data = ClipboardData(text: value);
      Clipboard.setData(data);
      messenger.showMessage("Copied $value");
    }

    return ListTile(
      title: Text(titleText),
      subtitle: Text(valueNotifier.value),
      leading: widget.leading,
      trailing: IconButton(
        icon: Icon(Icons.copy),
        onPressed: copyCurrentValue,
      ),
      onLongPress: copyCurrentValue,
      onTap: () async {
        if (widget.readOnly) {
          return copyCurrentValue();
        }

        String? newValue = await TextEditingDialog.show(
          title: titleText,
          context: context,
          initialValue: value,
        );

        switch (newValue) {
          case String newString:
            valueNotifier.value = newString;
            if (widget.onUpdate is ValueChanged<String>) {
              widget.onUpdate!(newString);
            }
        }
      },
    );
  }
}

class IntegerTile extends StatefulWidget {
  final String titleText;
  final Widget? leading;
  final int initialValue;
  final ValueNotifier<int>? valueNotifier;
  final ValueChanged<int>? onUpdate;
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
  State<IntegerTile> createState() => _IntegerTileState();
}

class _IntegerTileState extends State<IntegerTile> {
  late ValueNotifier<int> valueNotifier;

  int get value => valueNotifier.value;

  @override
  initState() {
    super.initState();
    valueNotifier = switch (widget.valueNotifier) {
      null => ValueNotifier(widget.initialValue),
      ValueNotifier<int> notifier => notifier,
    };

    valueNotifier.addListener(() => setState(() {}));
  }

  @override
  dispose() {
    super.dispose();
    if (widget.valueNotifier == null) valueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleText = widget.titleText;
    final messenger = ScaffoldMessenger.of(context);

    void copyCurrentValue() {
      final data = ClipboardData(text: value.toString());
      Clipboard.setData(data);
      messenger.showMessage("Copied $value");
    }

    return ListTile(
      title: Text(titleText),
      subtitle: Text(value.toString()),
      leading: widget.leading,
      trailing: IconButton(
        icon: Icon(Icons.copy),
        onPressed: copyCurrentValue,
      ),
      onLongPress: copyCurrentValue,
      onTap: () async {
        String? newValue = await TextEditingDialog.show(
          title: titleText,
          context: context,
          initialValue: value.toString(),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );

        switch (newValue) {
          case String newString:
            try {
              final int newInt = int.parse(newString);
              valueNotifier.value = newInt;
              if (widget.onUpdate is ValueChanged<int>) {
                widget.onUpdate!(newInt);
              }
            } catch (e) {
              messenger.showMessage("Invalid integer: $newString");
            }
        }
      },
    );
  }
}

class EnumTile<T> extends StatefulWidget {
  final String titleText;
  final Widget? leading;
  final T? initialValue;
  final List<T> options;
  final ValueNotifier<T>? valueNotifier;
  final ValueChanged<T>? onUpdate;

  const EnumTile({
    super.key,
    required this.titleText,
    required this.options,
    this.initialValue,
    this.onUpdate,
    this.valueNotifier,
    this.leading,
  });

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
    final titleText = widget.titleText;
    final messenger = ScaffoldMessenger.of(context);

    void copyCurrentValue() {
      final data = ClipboardData(text: value.toString());
      Clipboard.setData(data);
      messenger.showMessage("Copied $value");
    }

    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          return ListTile(
            title: Text(titleText),
            subtitle: Text(value.toString()),
            leading: widget.leading,
            trailing: IconButton(
              icon: Icon(Icons.copy),
              onPressed: copyCurrentValue,
            ),
            onLongPress: copyCurrentValue,
            onTap: () async {
              final newValue = await showDialog<T>(
                context: context,
                builder: (context) => EnumSelectionDialog<T>(
                  title: titleText,
                  options: widget.options,
                  initialValue: value,
                ),
              );
              if (newValue != null) {
                valueNotifier.value = newValue;
                widget.onUpdate?.call(newValue);
              }
            },
          );
        });
  }
}

class EnumSelectionDialog<T> extends StatelessWidget {
  final String title;
  final T? initialValue;
  final List<T> options;

  const EnumSelectionDialog({
    super.key,
    required this.title,
    required this.options,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(title),
      content: Column(
        children: [
          for (final option in options)
            RadioListTile(
              title: Text(option.toString()),
              selected: option == initialValue,
              groupValue: initialValue,
              value: option,
              onChanged: (T? newValue) {
                Navigator.of(context).pop(newValue);
              },
            )
        ],
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

  const DateTile({
    super.key,
    required this.titleText,
    this.onUpdate,
    this.valueNotifier,
    this.leading,
    this.initialValue,
  });

  @override
  State<DateTile> createState() => _DateTileState();
}

class _DateTileState extends State<DateTile> {
  late ValueNotifier<DateTime?> valueNotifier;

  DateTime? get value => valueNotifier.value;

  @override
  initState() {
    super.initState();
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
    final titleText = widget.titleText;
    final messenger = ScaffoldMessenger.of(context);

    void copyCurrentValue() {
      if (value == null) {
        messenger.showMessage("No date selected");
        return;
      }

      final text = dateFormat.format(value!);
      final data = ClipboardData(text: text);
      Clipboard.setData(data);
      messenger.showMessage("Copied ");
    }

    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return ListTile(
          title: Text(titleText),
          subtitle: Text(value == null ? "N/A" : dateFormat.format(value)),
          leading: widget.leading,
          trailing: IconButton(
            icon: Icon(Icons.copy),
            onPressed: copyCurrentValue,
          ),
          onLongPress: copyCurrentValue,
          onTap: () async {
            final newDate = await showDatePicker(
              context: context,
              initialDate: value ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (newDate != null) {
              valueNotifier.value = newDate;
              widget.onUpdate?.call(newDate);
            }
          },
        );
      },
    );
  }
}
