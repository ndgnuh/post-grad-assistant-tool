import 'package:flutter/material.dart';

typedef ValueFormatter<T> = String Function(T?);

class EnumPicker<T> extends StatefulWidget {
  final Widget? label;
  final List<T> values;
  final T? initialValue;
  final ValueFormatter<T>? valueFormatter;
  final ValueChanged<T?>? onSelected;
  final String? Function(T?)? validator;
  final ValueNotifier<T?>? controller;

  const EnumPicker({
    super.key,
    required this.values,
    this.initialValue,
    this.valueFormatter,
    this.label,
    this.onSelected,
    this.validator,
    this.controller,
  });

  @override
  State<EnumPicker<T>> createState() => _EnumPickerState<T>();
}

class _EnumPickerState<T> extends State<EnumPicker<T>> {
  final formatController = TextEditingController();
  late ValueNotifier<T?> controller;

  @override
  void initState() {
    super.initState();
    switch (widget.controller) {
      case ValueNotifier<T?> ctl:
        controller = ctl;
      default:
        controller = ValueNotifier<T?>(null);
    }

    controller.addListener(_updateFormat);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(_updateFormat);
    formatController.dispose();
    if (widget.controller != controller) {
      controller.dispose();
    }
  }

  String _format(T? value) {
    final formatted = widget.valueFormatter?.call(value) ?? value.toString();
    return formatted;
  }

  void _updateFormat() {
    formatController.text = _format(controller.value);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenuFormField(
      initialSelection: widget.controller?.value,
      expandedInsets: EdgeInsets.all(0),
      label: widget.label,
      controller: formatController,
      onSelected: (value) {
        switch (widget.controller) {
          case ValueNotifier<T?> notifier:
            notifier.value = value;
        }

        final formatted =
            widget.valueFormatter?.call(value) ?? value.toString();
        formatController.text = formatted;

        widget.onSelected?.call(value);
      },
      validator: widget.validator,
      dropdownMenuEntries: widget.values.map((value) {
        final label = switch (widget.valueFormatter) {
          null => value.toString(),
          ValueFormatter<T> fn => fn(value),
        };

        return DropdownMenuEntry(value: value, label: label);
      }).toList(),
    );
  }
}
