import 'dart:async';
import 'dart:math';

import 'package:diacritic/diacritic.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'datamodels.dart' show toSqliteDate;
import 'datamodels.dart' show tryFormatHumanDate;
import 'datamodels.dart' show tryParseDMY;

export 'custom_widgets/datetime_picker.dart';
export 'custom_widgets/directory_picker.dart';
export 'custom_widgets/expanded_scrollview.dart';
export 'custom_widgets/menu_dialog.dart';
export 'custom_widgets/responsive_breakpoints.dart';

extension CustomFormatter on TextEditingController {
  static TextInputFormatter get trimmedText => TextInputFormatter.withFunction(
    (oldValue, newValue) {
      final text = newValue.text.trim();
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    },
  );
}

final formattedDateInputFormatter = TextInputFormatter.withFunction(
  // this function is AI generated slop
  // A function that auto format text as dd/MM/yyyy
  // This function does not use date library
  (oldValue, newValue) {
    final newLength = newValue.text.length;
    final oldLength = oldValue.text.length;
    if (newLength < oldLength) {
      return newValue;
    }

    int consectuiveInt = 0;
    int numberOfSeparator = 0;
    for (int i = 0; i < newValue.text.length; i++) {
      final c = newValue.text[i];
      final isNumeric = c.codeUnitAt(0) >= 48 && c.codeUnitAt(0) <= 57;
      final isSpace = c == ' ' || c == '\t';
      final isSeparator = c == '/' || c == '-';
      if (isNumeric) {
        consectuiveInt = consectuiveInt + 1;
        // is day or month
        if (consectuiveInt > 2 && numberOfSeparator < 2) {
          return oldValue;
        } else if (consectuiveInt > 4) {
          return oldValue;
        }
      } else if (isSpace) {
        return oldValue;
      } else if (i > 0 && isSeparator && numberOfSeparator < 2) {
        consectuiveInt = 0;
        numberOfSeparator = numberOfSeparator + 1;
      } else {
        return oldValue;
      }
    }

    // Validate date values
    if (numberOfSeparator < 2) {
      return newValue;
    }
    final newText = newValue.text;
    final parts = newText.split(RegExp(r'[/\-]'));
    final day = int.tryParse(parts[0]) as int;
    final month = int.tryParse(parts[1]) as int;
    final year = int.tryParse(parts[2]) as int;
    final correctedMonth = (month > 12) ? 12 : month;
    final correctedDate = switch (correctedMonth) {
      2 => switch (year % 4) {
        0 => day > 29 ? 29 : day, // Leap year
        _ => day > 28 ? 28 : day, // Non-leap year
      },
      4 || 6 || 9 || 11 => day > 30 ? 30 : day, // Months with 30 days
      _ => day > 31 ? 31 : day,
    };

    // Reconstruct the date string
    final newDateString = "$correctedDate/$correctedMonth/$year";
    return TextEditingValue(
      text: newDateString,
      selection: newValue.selection,
    );
  },
);

ValueChanged<T> debouncedValueChanged<T>({
  required ValueChanged<T> callback,
  required Duration duration,
}) {
  var timer = Timer(duration, () {});
  void debounced(T value) {
    timer.cancel();
    timer = Timer(duration, () => callback(value));
  }

  return debounced;
}

Function debouncedCallback<F extends Function>({
  required F function,
  required Duration duration,
}) {
  var timer = Timer(duration, () {});
  debounced() {
    timer.cancel();
    timer = Timer(duration, () {
      function();
    });
  }

  return debounced as Function;
}

String defaultFormatter(Object? obj) {
  return obj?.toString() ?? "";
}

/// Common interface for widget controllers?
T? ezGetValue<T>(ChangeNotifier controller, {bool textNullable = true}) {
  switch (controller) {
    case EzSelectionController<T> ctl:
      return ctl.value;
    case TextEditingController tec:
      if (textNullable) {
        return tec.nonEmptyValue as T?;
      } else {
        return tec.text as T;
      }
    default:
      throw "Invalid controller $controller";
  }
}

/// Common interface to set value for widget controllers?
/// We pass value as Object? here so that if null is passed,
/// the parameter T is inferred from the controller, not the value.
/// Therefore, there is no need to call this function with type
/// parameters
void ezSetValue<T>(ChangeNotifier controller, Object? value) {
  switch (controller) {
    case EzSelectionController<T> ctl:
      ctl.value = value as T;
    case EzSelectionController<T?> ctl:
      ctl.value = value as T?;
    case TextEditingController tec:
      tec.text = value?.toString() ?? "";
    default:
      throw "Invalid controller $controller";
  }
}

/// Set controller value, supports
/// [TextEditingController], [EzController], [EzSEzSelectionController],
void setControllerValue(ChangeNotifier controller, Object? value) {
  switch ((controller, value)) {
    case (TextEditingController c, String? v):
      c.text = v ?? "";
    case (EzController c, Object? v):
      c.value = v;
    case (EzSelectionController c, Object? v):
      c.value = v;
    default:
      throw "Unsupported controller";
  }
}

class DateEditingDialog extends StatelessWidget {
  final DateTime? initialDate;
  final String title;
  final void Function(DateTime) onSubmit;

  const DateEditingDialog({
    super.key,
    this.title = "Chỉnh sửa ngày",
    this.initialDate,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final controller = EzDateInputController(
      value: initialDate,
      dateFormat: DateFormat("dd/MM/yyyy"),
    );
    return AlertDialog(
      title: Text(title),
      content: EzDateInput(controller: controller, label: "Ngày"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Hủy"),
        ),
        TextButton(
          onPressed: () {
            onSubmit(controller.value!);
            Navigator.of(context).pop();
          },
          child: const Text("Lưu"),
        ),
      ],
    );
  }

  static void show({
    required BuildContext context,
    DateTime? initialDate,
    String title = "Chỉnh sửa ngày",
    required void Function(DateTime) onSubmit,
  }) {
    showDialog(
      context: context,
      builder: (context) => DateEditingDialog(
        title: title,
        initialDate: initialDate,
        onSubmit: onSubmit,
      ),
    );
  }
}

/// A box for drafting page layout.
/// Parameters:
/// - [width] width of the box, default to infinity
/// - [height] height of the box, default to infinity
/// - [color] color of the box, default to red
class EzBox extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const EzBox({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(decoration: BoxDecoration(color: color)),
    );
  }
}

class EzCheckBox extends StatefulWidget {
  final String label;
  final bool triState;
  final EzController<bool?>? controller;
  final ValueChanged<bool?>? onChanged;

  const EzCheckBox({
    super.key,
    required this.label,
    this.onChanged,
    this.controller,
    this.triState = false,
  });

  @override
  State<EzCheckBox> createState() => _EzCheckBoxState();
}

// NVM: use BackButton
// ignore: non_constant_identifier_names
// Widget BackNavButton(BuildContext context) {
//   return IconButton(
//     onPressed: () => Navigator.of(context).pop(),
//     icon: Icon(Icons.arrow_back),
//   );
// }
class EzController<T> extends ChangeNotifier {
  final TextEditingController formatController;
  final String Function(T?)? _labelFormatter;
  final bool useFormatController = true;
  T? _value;

  EzController({labelFormatter, value})
    : _value = value,
      _labelFormatter = labelFormatter,
      formatController = TextEditingController(
        text: switch ((labelFormatter, value)) {
          (String Function(T?) fmt, T? value) => fmt(value),
          _ => "",
        },
      );

  String Function(T?)? get labelFormatter {
    return _labelFormatter;
  }

  // If
  T? get value {
    return _value;
  }

  set value(T? newValue) {
    _value = newValue;
    if (useFormatController) {
      switch (_labelFormatter) {
        case String Function(T?) format:
          formatController.text = format(_value);
        default:
          formatController.text = _value?.toString() ?? "";
      }
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    formatController.dispose();
  }

  void rawSetValue(T? newValue) {
    _value = newValue;
    switch (_labelFormatter) {
      case String Function(T?) format:
        formatController.text = format(_value);
      default:
        formatController.text = _value?.toString() ?? "";
    }
  }

  /// Create an [EzController] for [DateTime] class.
  /// This controller use [dateFormat] to format the date value to [String].
  static EzController<DateTime> forDateTime({
    DateTime? date,
    DateFormat? dateFormat,
  }) {
    dateFormat ??= DateFormat("dd/MM/yyyy");
    return EzController<DateTime>(
      value: date,
      labelFormatter: (DateTime? date) {
        return switch (date) {
          DateTime date => dateFormat?.format(date) ?? date.toString(),
          _ => "",
        };
      },
    );
  }
}

class EzCopy extends StatelessWidget {
  final String text;
  const EzCopy(this.text, {super.key});

  ClipboardData get data => ClipboardData(text: text);

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await Clipboard.setData(data);
                messenger.showSnackBar(
                  SnackBar(content: Text("Đã copy '$text' vào clipboard")),
                );
              },
          ),
        ],
      ),
    );
  }
}

class EzDateInput extends StatelessWidget {
  final EzDateInputController controller;
  final String? label;
  final bool enabled;
  final bool readOnly;

  const EzDateInput({
    super.key,
    required this.controller,
    this.label,
    this.enabled = true,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [formattedDateInputFormatter],
      controller: controller.formatController,
      decoration: InputDecoration(
        labelText: label ?? "Chọn ngày",
        hintText: "dd/mm/yyyy",
        filled: true,
        fillColor: Colors.transparent,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      readOnly: readOnly,
      enabled: enabled,
    );
  }
}

class EzDateInputController extends ChangeNotifier {
  final TextEditingController formatController = TextEditingController();
  late DateFormat dateFormat;

  EzDateInputController({DateTime? value, DateFormat? dateFormat}) {
    this.dateFormat = dateFormat ?? DateFormat("dd/MM/yyyy");
    formatController.text = switch (value) {
      DateTime date => toSqliteDate(date) ?? "",
      _ => "",
    };
  }

  DateTime? get value {
    final text = formatController.text.trim();
    if (text.isEmpty) return null;

    // Try to parse the date from the text
    final parsedDate = tryParseDMY(text);
    if (parsedDate != null) {
      return parsedDate;
    }

    // If parsing fails, return null
    return null;
  }

  set value(DateTime? newValue) {
    // Set the text in the format controller
    formatController.text = switch (newValue) {
      DateTime date => dateFormat.format(date),
      _ => "",
    };
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    formatController.dispose();
  }
}

class EzDatePicker extends StatelessWidget {
  final String? label;
  final DateTime? value;
  final ValueChanged<DateTime?>? onSelected;
  final EzController<DateTime?>? controller;
  final bool enabled;
  final bool readOnly;

  const EzDatePicker({
    super.key,
    this.label,
    this.enabled = true,
    this.readOnly = false,
    this.controller,
    this.value,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final valueString = tryFormatHumanDate(value);
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Click để chọn",
        labelText: label,
      ),
      controller:
          controller?.formatController ??
          TextEditingController(text: valueString ?? ""),
      enabled: enabled,
      readOnly: true,
      onTap: switch (readOnly) {
        true => null,
        false => (() => trigger(context)),
      },
    );
  }

  Future<void> trigger(BuildContext context) async {
    // Pop the date picker up
    final mDate = await showDatePicker(
      // locale: Locale('vi'),
      initialEntryMode: DatePickerEntryMode.input,
      context: context,
      currentDate: value,
      firstDate: DateTime(1970, 1, 1),
      lastDate: DateTime(2099, 12, 31),
    );

    // Update text value
    switch (mDate) {
      case (DateTime value):
        controller?.value = value;
    }

    // Run callback if any
    switch ((onSelected, mDate)) {
      case (ValueChanged callback, DateTime value):
        callback(value);
    }
  }
}

/// A wrapper for [Text] widget that display
/// [DateTime] as dd/mm/yyyy
class EzDmyText extends StatelessWidget {
  final DateTime? date;
  final String? placeholder;

  const EzDmyText(this.date, {super.key, this.placeholder = "N/A"});

  @override
  Widget build(BuildContext context) {
    final formattedDate = tryFormatHumanDate(date);
    return Text(formattedDate ?? placeholder!);
  }
}

/// Quickly create a [DropdownMenu] from a list of [labels] and [values]
/// If [labels] is [null] then [labels] is converted from [values] with [toString()].
class EzDropdown<T> extends StatefulWidget {
  final String Function(T?)? labelFormat;
  final double? width;
  final String? label;
  final T? initialSelection;
  final EzSelectionController<T> controller;
  final ValueChanged<T?>? onSelected;
  final FocusNode? focusNode;
  final FutureOr<List<T>> Function(String query)? searchFunction;

  const EzDropdown({
    super.key,
    required this.controller,
    this.labelFormat,
    this.width,
    this.label,
    this.initialSelection,
    this.onSelected,
    this.focusNode,
    this.searchFunction,
  });

  @override
  State<StatefulWidget> createState() => _EzDropdownState<T>();

  static Widget fullWidth<T>({
    required controller,
    labelFormat,
    width,
    label,
    initialSelection,
    onSelected,
    focusNode,
    searchFunction,
  }) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return EzDropdown<T>(
          width: constraint.maxWidth,
          controller: controller,
          labelFormat: labelFormat,
          label: label,
          initialSelection: initialSelection,
          onSelected: onSelected,
          focusNode: focusNode,
          searchFunction: searchFunction,
        );
      },
    );
  }
}

class EzFilePicker extends StatelessWidget {
  final String label;
  final String? value;
  final bool isSave;
  final bool isDirectory;
  final List<String>? allowedExtensions;
  final String? dialogTitle;
  final String? hintText;
  final EzController<String>? controller;
  final Function(String)? onSelected;

  const EzFilePicker({
    super.key,
    this.value,
    this.isSave = false,
    this.isDirectory = false,
    this.allowedExtensions,
    this.dialogTitle,
    this.hintText,
    this.onSelected,
    this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: switch (value) {
        String value => TextEditingController(text: value),
        _ => controller?.formatController,
      },
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText ?? "Tap to select a file",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onTap: () async {
        final file = switch ((isSave, isDirectory)) {
          (_, true) => await loadDirectory(),
          (true, false) => await saveFile(),
          (false, false) => await loadDirectory(),
        };

        switch (file) {
          case (String path):
            controller?.value = path;
        }

        switch ((onSelected, file)) {
          case (ValueChanged<String> callback, String path):
            callback(path);
        }
      },
    );
  }

  Future<String?> loadDirectory() async {
    String? result = await FilePicker.platform.getDirectoryPath(
      dialogTitle: dialogTitle,
      lockParentWindow: true,
    );
    return result;
  }

  Future<String?> loadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
      dialogTitle: dialogTitle,
    );
    final path = result?.files.first.path;
    return path;
  }

  Future<String?> saveFile() async {
    String? file = await FilePicker.platform.saveFile(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
      dialogTitle: dialogTitle,
    );
    return file;
  }
}

class EzFixed extends StatelessWidget {
  final Axis direction;
  final List<Widget> children;
  final double spacing;
  final EdgeInsetsGeometry margin;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const EzFixed({
    super.key,
    required this.direction,
    required this.children,
    this.spacing = 10.0,
    this.margin = const EdgeInsets.all(0),
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final layout = switch (direction) {
      Axis.horizontal => Row(
        spacing: spacing,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
      Axis.vertical => Column(
        spacing: spacing,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    };

    return Container(padding: margin, child: layout);
  }
}

class EzFlex extends StatelessWidget {
  final Axis direction;
  final List<int>? flex;
  final List<Widget> children;
  final double spacing;
  final EdgeInsetsGeometry? margin;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const EzFlex({
    super.key,
    required this.direction,
    required this.children,
    this.flex,
    this.spacing = 10.0,
    this.margin,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.all(0),
      child: Flex(
        spacing: spacing,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        direction: direction,
        children: [
          for (final (i, child) in children.indexed)
            Flexible(
              fit: FlexFit.tight,
              flex: flex?[i] ?? 1,
              child: Container(child: child),
            ),
        ],
      ),
    );
  }
}

/// Easy grid with fixed number of columns.
class EzGrid extends StatelessWidget {
  final int crossAxisCount;
  final List<Widget> children;
  final double? spacing;
  final EdgeInsetsGeometry? margin;

  const EzGrid({
    super.key,
    required this.crossAxisCount,
    required this.children,
    this.spacing,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    if (crossAxisCount <= 0) {
      throw ArgumentError("crossAxisCount must be greater than 0");
    }

    // If crossAxisCount is 1, use a ListView
    if (crossAxisCount == 1) {
      return ListView(children: children);
    }

    final numChildren = children.length;
    final numRows = (numChildren / crossAxisCount).ceil();

    // Partition children into rows
    final childrenPartitions = <List<Widget>>[];
    for (int i = 0; i < numRows; i++) {
      final start = i * crossAxisCount;
      final end = start + crossAxisCount;
      childrenPartitions.add(
        children.sublist(start, end.clamp(0, numChildren)),
      );
    }

    final actualSpacing = spacing ?? context.gutterSmall;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            constraints.maxWidth / crossAxisCount -
            actualSpacing * (crossAxisCount - 1) / crossAxisCount;

        // Check if last row is full, if not then add spacer
        if (childrenPartitions.isNotEmpty &&
            childrenPartitions.last.length < crossAxisCount) {
          final lastRow = childrenPartitions.last;
          final spacerCount = crossAxisCount - lastRow.length;
          childrenPartitions.last.addAll(
            List.generate(spacerCount, (_) => Spacer()),
          );
        }

        return SingleChildScrollView(
          child: Column(
            spacing: spacing ?? context.gutterSmall,
            children: [
              for (final row in childrenPartitions)
                IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: actualSpacing,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final child in row)
                        SizedBox(width: itemWidth, child: child),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// Create header text
class EzHeader extends StatelessWidget {
  final String text;
  final int level;
  const EzHeader({super.key, required this.text, required this.level});

  double? get fontSize {
    return switch (level) {
      0 => 24.0,
      1 => 21.0,
      2 => 18.0,
      3 => 15.0,
      4 => 13.0,
      _ => 24.0,
    };
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      child: Text(text),
    );
  }
}

class EzLink extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const EzLink({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = ColorScheme.of(context);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            style: TextStyle(color: theme.primary),
            text: text,
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}

abstract class EzPage<T extends ChangeNotifier> extends StatelessWidget {
  const EzPage({super.key});

  /// Returns the page's name, this will be displayed on the [AppBar]
  String get pageName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: createState,
      child: Scaffold(
        body: Builder(builder: buildBody),
        appBar: AppBar(leading: BackButton(), title: Text(pageName)),
      ),
    );
  }

  /// Build the body widget
  Widget buildBody(BuildContext context);

  /// Page state
  T createState(BuildContext context);
}

class EzRow extends StatelessWidget {
  final double? spacing;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  const EzRow({
    super.key,
    required this.children,
    this.spacing,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: mainAxisAlignment,
        spacing: spacing ?? context.gutter,
        children: children,
      ),
    );
  }
}

class EzSelectionController<T> extends ChangeNotifier {
  List<T> _values;
  T? _value;
  final String Function(T?) _labelFormatter;
  final TextEditingController labelController;

  EzSelectionController({
    List<T> values = const [],
    T? initialSelection,
    labelFormatter = defaultFormatter,
  }) : _values = values,
       _value = initialSelection,
       _labelFormatter = labelFormatter,
       labelController = TextEditingController(
         text: labelFormatter(initialSelection),
       );

  String get label {
    return _labelFormatter(_value);
  }

  List<String> get labels {
    return [for (final opt in _values) _labelFormatter(opt)];
  }

  T? get value {
    return _value;
  }

  set value(T? value) {
    _value = value;
    labelController.text = _labelFormatter(_value);
    notifyListeners();
  }

  List<T> get values {
    return _values;
  }

  set values(List<T> values) {
    _values = values;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    labelController.dispose();
  }
}

class EzSelector<S, T> extends StatelessWidget {
  final T Function(BuildContext, S) selector;
  final Widget Function(BuildContext, S, T, Widget?) builder;

  const EzSelector({super.key, required this.builder, required this.selector});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<S>(context, listen: false);
    return Selector<S, T>(
      selector: selector,
      builder: (BuildContext context, T value, Widget? child) {
        return builder(context, state, value, child);
      },
    );
  }
}

class EzTable<T> extends StatelessWidget {
  final List<Object?> headers;
  final List<TextAlign>? textAligns;
  final TableBorder? border;
  final EdgeInsetsGeometry padding;
  final bool dataWrap;
  final bool headerWrap;
  final List<T> data;
  final List<Object?> Function(int, T) rowBuilder;
  final Color? headerForeground;
  final Map<int, TableColumnWidth>? columnWidths;
  final Map<int, Alignment>? alignments;

  const EzTable({
    super.key,
    required this.headers,
    required this.data,
    required this.rowBuilder,
    this.columnWidths,
    this.alignments,
    this.textAligns,
    this.border,
    this.padding = const EdgeInsetsDirectional.symmetric(
      vertical: 5,
      horizontal: 3,
    ),
    this.dataWrap = false,
    this.headerWrap = false,
    this.headerForeground,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: columnWidths,
      border: border ?? TableBorder.all(),
      children: [
        // Headers
        TableRow(children: _headers(context)),
        // Data rows
        for (final (rowCount, row) in data.indexed)
          TableRow(
            children: [
              for (final (colCount, data) in rowBuilder(rowCount, row).indexed)
                switch (data) {
                  Widget widget => widget,
                  _ => Container(
                    padding: padding,
                    alignment: alignments?[colCount] ?? Alignment.center,
                    child: Text(
                      data?.toString() ?? "",
                      softWrap: dataWrap,
                      textAlign: textAligns?[colCount] ?? TextAlign.center,
                    ),
                  ),
                },
            ],
          ),
      ],
    );
  }

  List<Widget> _headers(BuildContext context) {
    return [
      for (final (i, header) in headers.indexed)
        (header is Widget)
            ? header
            : Container(
                padding: padding,
                alignment: Alignment.center,
                child: Text(
                  header?.toString() ?? "",
                  textAlign: textAligns?[i] ?? TextAlign.center,
                  softWrap: headerWrap,
                  style: TextStyle(
                    color: headerForeground,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
    ];
  }
}

/// A text input widget that supports
/// - [label] for the input field
/// - [placeholder] for the input field
/// - [value] for the initial value of the input field
/// - [onSubmitted] callback when the input is submitted
/// - [onChanged] callback when the input is changed
/// - [multiline] for multiline input, default to false
/// - [controller] for the input field controller
class EzTextInput extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final String? value;
  final ValueChanged<String?>? onSubmitted;
  final ValueChanged<String?>? onChanged;
  final bool multiline;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool readOnly;
  final FocusNode? focusNode;
  final IconData? icon;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final void Function()? onFocus;
  final void Function()? onUnfocus;

  const EzTextInput({
    super.key,
    this.inputFormatters,
    this.label,
    this.controller,
    this.keyboardType,
    this.multiline = false,
    this.enabled = true,
    this.readOnly = false,
    this.placeholder,
    this.value,
    this.onEditingComplete,
    this.onUnfocus,
    this.onFocus,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onFocusChange: (bool? focused) {
        if (focused == false && focusNode != null) {
          final ftg = FocusTraversalGroup.of(context);
          ftg.next(focusNode as FocusNode);
        }
        switch ((focused, onFocus, onUnfocus)) {
          case (true, Function() callback, _):
            callback();
          case (false, _, Function() callback):
            callback();
          default:
        }
      },
      child: TextFormField(
        inputFormatters: inputFormatters,
        onEditingComplete: onEditingComplete,
        enabled: enabled,
        readOnly: readOnly,
        maxLines: multiline ? null : 1,
        onFieldSubmitted: onSubmitted,
        keyboardType: multiline ? TextInputType.multiline : keyboardType,
        controller: controller,
        onChanged: (String? text) {
          Future.delayed(Duration.zero, () {
            switch (onChanged) {
              case ValueChanged<String?> callback:
                callback(text);
            }
          });
        },
        decoration: InputDecoration(
          // Transparent fill makes the widget
          // align with everything else
          prefixIcon: (icon != null) ? Icon(icon) : null,
          filled: true,
          fillColor: Colors.transparent,
          hintText: placeholder,
          labelText: label,
          floatingLabelBehavior: switch (placeholder) {
            null => FloatingLabelBehavior.auto,
            _ => FloatingLabelBehavior.always,
          },
        ),
      ),
    );
  }
}

class FutureText extends StatefulWidget {
  Future<String> Function() create;
  FutureText({required this.create, super.key});

  @override
  State<FutureText> createState() => FutureTextState();
}

class FutureTextState extends State<FutureText> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.create(),
      builder: (context, state) {
        switch (state.connectionState) {
          case ConnectionState.done:
            return Text(state.data ?? "");
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}

class HeadingListTile extends StatelessWidget {
  final String title;
  final Widget? icon;
  final Widget? trailing;

  const HeadingListTile({
    super.key,
    required this.title,
    this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final textStyle = textTheme.titleMedium?.copyWith(
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    return ListTile(
      title: Text(title, style: textStyle),
      leading: icon,
      trailing: trailing,
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}

/// A text widget that displays an icon and text together.
class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  final TextStyle? style;

  const IconText({
    super.key,
    required this.text,
    required this.icon,
    this.style,
    this.iconSize = 16,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(icon, size: iconSize ?? 16.0, color: iconColor),
          ),
          WidgetSpan(child: SizedBox(width: context.gutterTiny)),
          TextSpan(text: text, style: style),
        ],
      ),
    );
  }
}

// Listtile that have onTap update behavior
abstract class InfoTile<T> extends StatefulWidget {
  final String title;
  final T? initialValue;
  final Widget? icon;
  final ValueChanged<T?> onSubmit;
  final String Function(T?) format;

  const InfoTile({
    super.key,
    required this.title,
    required this.onSubmit,
    this.icon,
    this.initialValue,
    this.format = defaultFormatter,
  });

  @override
  State<InfoTile<T>> createState() => _InfoTileState<T>();

  // abstract method to tap function
  Future<T?> onTap({required BuildContext context, required T? currentValue});
}

class TextEditingDialog extends StatelessWidget {
  final String? initialText;
  final String title;
  final bool highlightOnFocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const TextEditingDialog({
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
        onSaved: (String? value) => nav.pop(value),
        onFieldSubmitted: (String? value) => nav.pop(value),
      ),
      actions: [
        TextButton(
          onPressed: () => nav.pop(initialText),
          child: const Text("Hủy"),
        ),
        TextButton(
          onPressed: () => nav.pop(controller.text),
          child: const Text("Lưu"),
        ),
      ],
    );
  }

  static FutureOr<String?> show({
    required BuildContext context,
    required String title,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool highlightOnFocus = true,
    String? initialValue,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) => TextEditingDialog(
        highlightOnFocus: highlightOnFocus,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        title: title,
        initialText: initialValue,
      ),
    );
  }
}

class _EzCheckBoxState extends State<EzCheckBox> {
  @override
  Widget build(BuildContext context) {
    final value = widget.controller?.value;
    final valueFormatter = widget.controller?.labelFormatter;
    final desc = switch (valueFormatter) {
      Function(bool?) format => Text(format(value)),
      _ => null,
    };
    return CheckboxListTile(
      title: Text(widget.label),
      subtitle: desc,
      tristate: widget.triState,
      value: value,
      onChanged: (bool? value) {
        widget.controller?.value = value;
        switch (widget.onChanged) {
          case ValueChanged<bool?> callback:
            callback(value);
        }
        // trigger rebuild
        setState(() {});
      },
    );
  }
}

class _EzDropdownState<T> extends State<EzDropdown<T>> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final values = widget.controller.values;
    final labels = widget.controller.labels;
    final entries = [
      for (final (i, value) in values.indexed)
        DropdownMenuEntry(value: value, label: labels[i]),
    ];
    return Focus(
      focusNode: widget.focusNode,
      child: DropdownMenu<T?>(
        controller: widget.controller.labelController,
        onSelected: (T? value) {
          widget.controller.value = value;
          switch (widget.onSelected) {
            case ValueChanged<T?> callback:
              callback(value);
          }
        },
        initialSelection: widget.initialSelection,
        width: widget.width,
        label: widget.label == null ? null : Text(widget.label as String),
        enableFilter: true,
        filterCallback: (entries, query) {
          searchAndUpdate(query);
          return entries;
        },
        dropdownMenuEntries: entries,
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Future<void> searchAndUpdate(String query) async {
    if (query == searchQuery) return;
    if (widget.searchFunction == null) return;

    searchQuery = query;
    final results = await widget.searchFunction!(query);
    widget.controller.values = results;
  }
}

class _InfoTileState<T> extends State<InfoTile<T>> {
  late T? value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: Text(widget.format(value)),
      leading: widget.icon,
      onTap: () async {
        final newValue = await widget.onTap(
          context: context,
          currentValue: value,
        );
        print(newValue);
        widget.onSubmit(newValue);
        setState(() {
          value = newValue;
        });
      },
    );
  }

  @override
  initState() {
    super.initState();
    value = widget.initialValue;
  }
}

extension NonEmptyValue on TextEditingController {
  String? get nonEmptyValue {
    final txt = text.trim();
    return txt.isEmpty ? null : txt;
  }
}

extension ScaffoldMessengerEzMesage on ScaffoldMessengerState {
  void showMessage(String text) {
    hideCurrentSnackBar();
    showSnackBar(SnackBar(content: Text(text)));
  }
}

extension StringSlugify on String {
  String slugify({
    bool removeAccents = true,
    String? replaceSpaces = "_",
    bool toLowerCase = false,
  }) {
    String slug = this;
    if (removeAccents) slug = removeDiacritics(slug);
    if (toLowerCase) slug = slug.toLowerCase();
    if (replaceSpaces != null) {
      slug = slug.replaceAll(RegExp(r'\s+'), replaceSpaces);
    }
    slug = slug.trim();
    return slug;
  }
}

extension ExpandedChildren on Expanded {
  static List<Expanded> children({required List<Widget> children}) {
    return [
      for (final child in children) Expanded(child: child),
    ];
  }
}

const maxScreenWidth = 960.0;
const maxScreenWidthConstraints = BoxConstraints(maxWidth: maxScreenWidth);

class ConstrainedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final bool withTabBar;

  const ConstrainedAppBar({
    super.key,
    required this.child,
    this.withTabBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: maxScreenWidthConstraints,
        child: child,
      ),
    );
  }

  @override
  Size get preferredSize => switch (withTabBar) {
    true => const Size.fromHeight(kToolbarHeight + kTextTabBarHeight),
    _ => const Size.fromHeight(kToolbarHeight),
  };
}

class ConstrainedBody extends StatelessWidget {
  final Widget child;

  const ConstrainedBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: maxScreenWidthConstraints,
        child: child,
      ),
    );
  }
}

class ConsumerWidgetBuilder extends ConsumerWidget {
  final Widget Function(BuildContext, WidgetRef) builder;
  const ConsumerWidgetBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) => builder(context, ref);
}

class StringNotifier extends Notifier<String> {
  final Duration debounceDuration;
  Timer? debounceTimer;

  StringNotifier({
    this.debounceDuration = const Duration(milliseconds: 300),
  });

  @override
  String build() => '';

  void debounceSet(String value) {
    if (debounceTimer?.isActive ?? false) {
      debounceTimer?.cancel();
    }
    debounceTimer = Timer(debounceDuration, () => set(value));
  }

  void set(String value) {
    state = value;
  }
}

class CardSection extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final List<Widget> children;

  const CardSection({
    super.key,
    this.title,
    this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final childrenWithDividers = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      childrenWithDividers.add(children[i]);
      if (i < children.length - 1) {
        childrenWithDividers.add(Divider());
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          ListTile(
            title: Text(title!),
            subtitle: subtitle != null ? Text(subtitle!) : null,
          ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: context.gutterTiny),
              ...childrenWithDividers,
              SizedBox(height: context.gutterTiny),
            ],
          ),
        ),
      ],
    );
  }
}
