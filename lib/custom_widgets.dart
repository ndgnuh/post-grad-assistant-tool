import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

export 'custom_widgets/dropdown_giangvien.dart' show DropdownGiangVien;
export 'custom_widgets/dropdowns.dart' show DropdownFromEnums;
export 'custom_widgets/dropdowns.dart' show DropdownNienKhoa;
export 'custom_widgets/dropdowns.dart' show DropdownFromSql;
export 'custom_widgets/file_picker_input.dart' show FilePickerInput;
import 'datamodels.dart' show tryParseDate;
import 'datamodels.dart' show tryFormatHumanDate;
import 'datamodels.dart' show tryParseDMY;
import 'datamodels.dart' show toSqliteDate;

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
  T? _value;

  EzController({
    labelFormatter,
    value,
  })  : _value = value,
        _labelFormatter = labelFormatter,
        formatController = TextEditingController(
          text: switch ((labelFormatter, value)) {
            (String Function(T?) fmt, T? value) => fmt(value),
            _ => "",
          },
        );

  /// Create an [EzController] for [DateTime] class.
  /// This controller use [dateFormat] to format the date value to [String].
  factory EzController.forDateTime({
    DateTime? date,
    DateFormat? dateFormat,
  }) {
    return EzController(
      value: date,
      labelFormatter: switch (dateFormat) {
        DateFormat dateFormat => (DateTime? date) {
            return switch (date) {
              DateTime date => dateFormat.format(date),
              _ => "",
            };
          },
        null => null,
      },
    );
  }

  T? get value {
    return _value;
  }

  String Function(T?)? get labelFormatter {
    return _labelFormatter;
  }

  set value(T? newValue) {
    _value = newValue;
    switch (_labelFormatter) {
      case String Function(T?) format:
        formatController.text = format(_value);
      default:
        formatController.text = _value?.toString() ?? "";
    }
    notifyListeners();
  }
}

class EzDatePicker extends StatelessWidget {
  final String? label;
  final DateTime? value;
  final ValueChanged<DateTime?>? onSelected;
  final EzController<DateTime>? controller;
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

  @override
  Widget build(BuildContext context) {
    final valueString = tryFormatHumanDate(value);
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Click để chọn",
        labelText: label,
      ),
      controller: controller?.formatController ??
          TextEditingController(text: valueString ?? ""),
      enabled: enabled,
      readOnly: true,
      onTap: switch (readOnly) {
        true => null,
        false => (() => trigger(context))
      },
    );
  }
}

class EzTextInput extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final String? value;
  final ValueChanged<String?>? onSubmitted;
  final ValueChanged<String?>? onChanged;
  final bool multiline;
  final EzController<String>? controller;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool readOnly;

  const EzTextInput({
    super.key,
    this.label,
    this.controller,
    this.keyboardType,
    this.multiline = false,
    this.enabled = true,
    this.readOnly = false,
    this.placeholder,
    this.value,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final fmtController = controller?.formatController;
    return TextField(
      enabled: enabled,
      readOnly: readOnly,
      maxLines: multiline ? null : 1,
      keyboardType: multiline ? TextInputType.multiline : keyboardType,
      onSubmitted: onSubmitted,
      onChanged: (text) {
        Future.delayed(Duration.zero, () {
          switch (onChanged) {
            case ValueChanged<String> callback:
              callback(text);
          }
        });
      },
      controller:
          value == null ? fmtController : TextEditingController(text: value),
      decoration: InputDecoration(
        hintText: placeholder,
        labelText: label,
        floatingLabelBehavior: switch (placeholder) {
          null => FloatingLabelBehavior.auto,
          _ => FloatingLabelBehavior.always
        },
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
      child: DecoratedBox(
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}

/// Quicky create a [Flex] with vertical direction and wrap the [children] in [Flexible]
Flex VBox({List<int>? flex, required List<Widget> children}) {
  flex ??= [for (final _ in children) 1];
  return Flex(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    direction: Axis.vertical,
    children: [
      for (final (i, child) in children.indexed)
        Flexible(
          fit: FlexFit.tight,
          flex: flex[i],
          child: child,
        )
    ],
  );
}

/// Quicky create a [Flex] with horizontal direction and wrap the [children] in [Flexible]
Flex HBox({List<int>? flex, required List<Widget> children}) {
  flex ??= [for (final _ in children) 1];
  return Flex(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    direction: Axis.horizontal,
    children: [
      for (final (i, child) in children.indexed)
        Flexible(
          fit: FlexFit.tight,
          flex: flex[i],
          child: child,
        )
    ],
  );
}

/// Quickly create a [DropdownMenu] from a list of [labels] and [values]
/// If [labels] is [null] then [labels] is converted from [values] with [toString()].
class EzDropdown<T> extends StatelessWidget {
  final List<T> values;
  final String Function(T?)? labelFormat;
  final double? width;
  final String? label;
  final T? initialSelection;
  final EzController<T>? controller;
  final ValueChanged<T?>? onSelected;

  const EzDropdown({
    super.key,
    required this.values,
    this.labelFormat,
    this.width,
    this.label,
    this.initialSelection,
    this.controller,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      controller: controller?.formatController,
      onSelected: (T? value) {
        controller?.value = value;
        switch (onSelected) {
          case ValueChanged<T?> callback:
            callback(value);
        }
      },
      initialSelection: initialSelection,
      width: width,
      label: label == null ? null : Text(label as String),
      enableFilter: false,
      enableSearch: false,
      dropdownMenuEntries: [
        for (final value in values)
          DropdownMenuEntry(
            value: value,
            label: switch (labelFormat ?? controller?.labelFormatter) {
              String Function(T?) format => format(value),
              _ => value.toString()
            },
          )
      ],
    );
  }
}

/// Create header text
class EzHeader extends StatelessWidget {
  final String text;
  final int level;
  const EzHeader({
    super.key,
    required this.text,
    required this.level,
  });

  double? get fontSize {
    return switch (level) {
      0 => 24.0,
      1 => 21.0,
      2 => 18.0,
      3 => 15.0,
      4 => 13.0,
      _ => 24.0
    };
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
      child: Text(text),
    );
  }
}

ScaffoldMessengerState getMessenger(context) {
  return ScaffoldMessenger.of(context);
}

class EzSelector<S, T> extends StatelessWidget {
  final T Function(BuildContext, S) selector;
  final Widget Function(BuildContext, S, T, Widget?) builder;

  const EzSelector({
    super.key,
    required this.builder,
    required this.selector,
  });

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

class EzLink extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const EzLink({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            style: TextStyle(color: Colors.black),
            text: text,
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
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
            style: TextStyle(color: Colors.black),
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await Clipboard.setData(data);
                messenger.showSnackBar(SnackBar(
                  content: Text("Đã copy '$text' vào clipboard"),
                ));
              },
          ),
        ],
      ),
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: switch (value) {
        String value => TextEditingController(text: value),
        _ => controller?.formatController,
      },
      decoration: InputDecoration(
        labelText: label,
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
}
