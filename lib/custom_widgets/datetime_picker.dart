import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_widgets.dart';

const _magicPreferenceKey = '<widget-selected-datetime>';

final dateInputFormatter = TextInputFormatter.withFunction(
  (oldValue, newValue) {
    final newText = newValue.text;
    final format1 = DateFormat('dd/MM/yyyy');
    final format2 = DateFormat('dd-MM-yyyy');

    // If new date is parsed
    final parsed1 = format1.tryParseLoose(newText);
    if (parsed1 != null) {
      final formatted = format1.format(parsed1);
      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }

    // If new date is parsed with alternative format
    final parsed2 = format2.tryParseLoose(newText);
    if (parsed2 != null) {
      final formatted = format1.format(parsed2);
      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }

    final invalid = RegExp(r'[^0-9/-]');
    return TextEditingValue(
      text: newText.replaceAll(invalid, ''),
      selection: newValue.selection,
    );
  },
);

final _dateFormat = DateFormat('dd-MM-yyyy');
String _getDateTimePreferenceKey(String name) {
  return '$_magicPreferenceKey/$name';
}

Future<DateTime?> _loadDateTime({
  required String name,
  DateTime? fallback,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final key = _getDateTimePreferenceKey(name);
  final savedString = prefs.getString(key);
  if (savedString == null) return null;
  return DateTime.tryParse(savedString) ?? fallback;
}

Future<void> _saveDateTime({
  required String name,
  required DateTime dateTime,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final key = _getDateTimePreferenceKey(name);
  await prefs.setString(key, dateTime.toIso8601String());
}

class DateTimePicker extends StatefulWidget {
  final DateTime? initialDateTime;
  final String? name;
  final ValueChanged<DateTime>? onDateTimeSelected;
  final ValueNotifier<DateTime?>? controller;
  final FormFieldValidator<DateTime>? validator;
  final String? labelText;
  final String? hintText;
  final IconData? iconData;

  const DateTimePicker({
    super.key,
    this.name,
    this.labelText,
    this.initialDateTime,
    required this.controller, // lint error if you forget
    this.onDateTimeSelected,
    this.validator,
    this.hintText = "Click to select date",
    this.iconData = Icons.calendar_today,
  });

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  final formKey = GlobalKey<FormState>();
  final formatController = TextEditingController();
  String? error;
  late ValueNotifier<DateTime?> valueNotifier;

  void tryParseDateAndUpdate(String text) {
    final altDateFormat = DateFormat('dd/MM/yyyy');

    final parsedDate =
        _dateFormat.tryParseLoose(text) ?? altDateFormat.tryParseLoose(text);
    if (parsedDate == null) {
      setState(() {
        error = "Ngày đã nhập không hợp lệ";
      });
      return;
    }
    valueNotifier.value = parsedDate;
    widget.onDateTimeSelected?.call(parsedDate);
    setState(() {
      error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconData = widget.iconData ?? Icons.calendar_today;

    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, _) => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: context.gutterSmall,
          children: [
            Expanded(
              child: TextFormField(
                inputFormatters: [dateInputFormatter],
                controller: formatController,
                validator: (text) {
                  if (error != null) return error;
                  return widget.validator?.call(value);
                },
                onChanged: tryParseDateAndUpdate,
                onFieldSubmitted: tryParseDateAndUpdate,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  hintText: widget.hintText,
                ),
              ),
            ),

            OutlinedButton.icon(
              label: const Text('Select'),
              icon: Icon(iconData),
              onPressed: () => _showDatePicker(context),
            ),

            if (value != null)
              OutlinedButton.icon(
                label: const Text('Clear'),
                icon: Icon(Icons.clear),
                onPressed: () {
                  valueNotifier.value = null;
                  formatController.text = '';
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Only dispose the notifier if it was created in this widget
    if (widget.controller == null) valueNotifier.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    // Initialize the value notifier if it is provided
    if (widget.controller != null) {
      valueNotifier = widget.controller!;
    } else {
      valueNotifier = ValueNotifier(widget.initialDateTime);
    }

    // Make the formatting controller reflect the value notifier
    valueNotifier.addListener(() {
      final dateTime = valueNotifier.value;
      if (dateTime != null) {
        formatController.text = _dateFormat.format(dateTime);
      } else {
        formatController.text = '';
      }
    });

    // Load initial datetime from preferences if name is provided
    switch (widget.name) {
      case String name:
        _loadDateTime(
          name: name,
          fallback: widget.initialDateTime,
        ).then((datetime) => valueNotifier.value = datetime);
    }
  }

  Future<void> _showDatePicker(BuildContext context) async {
    var defaultDate = valueNotifier.value;
    defaultDate ??= widget.initialDateTime;
    defaultDate ??= DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime(2100),
      firstDate: DateTime(1900),
      initialDate: defaultDate,
    );

    // User cancelled
    if (pickedDate == null) return;
    formatController.text = _dateFormat.format(pickedDate);
    valueNotifier.value = pickedDate;

    switch (widget.name) {
      case String name:
        _saveDateTime(
          name: name,
          dateTime: pickedDate,
        );
    }
  }
}
