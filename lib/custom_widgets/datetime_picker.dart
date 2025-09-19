import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:intl/intl.dart';
import 'dart:io';

final _dateFormat = DateFormat('dd-MM-yyyy');

const _magicPreferenceKey = '<widget-selected-datetime>';
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
  late ValueNotifier<DateTime?> valueNotifier;

  @override
  initState() {
    super.initState();
    // Initialize the value notifier if it is provided
    if (widget.controller != null) {
      valueNotifier = widget.controller!;
    } else {
      valueNotifier = ValueNotifier(widget.initialDateTime);
    }

    // Load initial datetime from preferences if name is provided
    switch (widget.name) {
      case String name:
        _loadDateTime(
          name: name,
          fallback: widget.initialDateTime,
        ).then((datetime) => valueNotifier.value = datetime);
    }
  }

  @override
  void dispose() {
    // Only dispose the notifier if it was created in this widget
    if (widget.controller == null) valueNotifier.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    final iconData = widget.iconData ?? Icons.calendar_today;

    // show date picker when focus is gained
    final focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        focusNode.unfocus();
        _showDatePicker(context);
      }
    });

    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, _) => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: context.gutterSmall,
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                focusNode: focusNode,
                controller: formatController,
                validator: (text) => widget.validator?.call(value),
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  hintText: widget.hintText,
                ),
              ),
            ),

            FilledButton.icon(
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
}
