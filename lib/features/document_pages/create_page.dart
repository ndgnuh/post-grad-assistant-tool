import 'dart:convert';
import 'dart:io';

import '../../custom_widgets.dart';
import '../../shortcuts.dart';
import '../../utilities/strings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:pdfrx/pdfrx.dart';

import '../../business/db_v2_providers.dart';

class DocumentCreatePage extends StatelessWidget {
  static const routeName = '/document/create';

  const DocumentCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text('Thêm văn bản mới'),
        ),
      ),
      body: CommonShortcuts(
        child: ConstrainedBody(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(context.gutter),
            child: _FormStateProvider.builder(
              builder: (context, state) => Form(
                key: state.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: context.gutter,
                  children: [
                    // Meta data section
                    TextFormField(
                      controller: state.titleController,
                      decoration: InputDecoration(labelText: 'Tiêu đề'),
                      keyboardType: TextInputType.multiline,
                      validator: state.notEmptyValidator("Điền tiêu đề"),
                    ),

                    TextFormField(
                      controller: state.officialCodeController,
                      decoration: InputDecoration(labelText: 'Số ký hiệu'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: state.notEmptyValidator("Điền số ký hiệu"),
                    ),

                    TextFormField(
                      controller: state.officialTypeController,
                      decoration: InputDecoration(
                        labelText: 'Loại văn bản (hiện đang fix cứng)',
                      ),
                      validator: state.notEmptyValidator(
                        "Chọn loại văn bản",
                      ),
                    ),

                    IntrinsicHeight(
                      child: Row(
                        spacing: context.gutter,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              controller: state.signedDateEditController,
                              enableInteractiveSelection: true,
                              autovalidateMode: .onUserInteraction,
                              decoration: InputDecoration(
                                labelText: 'Ngày ký',
                                hintText: 'dd/mm/yyyy',
                              ),
                              validator: state.validateManualDate,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => state.pickDate(context),
                            child: Text("Chọn"),
                          ),
                        ],
                      ),
                    ),

                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: context.gutter,
                        children: [
                          Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: state.fullTextPathNotifier,
                              builder: (context, value, child) {
                                final controller = TextEditingController(
                                  text: switch (value) {
                                    null => "",
                                    String path => p.basename(path),
                                  },
                                );
                                return TextFormField(
                                  controller: controller,
                                  onTap: () => state.pickFullTextFile(context),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Nội dung văn bản',
                                    hintText: 'Click để chọn file',
                                  ),
                                );
                              },
                            ),
                          ),

                          // Preview
                          ValueListenableBuilder(
                            valueListenable: state.fullTextPathNotifier,
                            builder: (context, value, child) {
                              if (value == null) {
                                return OutlinedButton(
                                  onPressed: null,
                                  child: Text('Xem trước'),
                                );
                              }

                              return OutlinedButton(
                                onPressed: () => state.previewPdf(context),
                                child: Text('Xem trước'),
                              );
                            },
                          ),

                          // Delete button
                          ValueListenableBuilder(
                            valueListenable: state.fullTextPathNotifier,
                            builder: (context, value, child) {
                              return TextButton(
                                onPressed: switch (value) {
                                  null => null,
                                  String _ => () {
                                    state.fullTextPathNotifier.value = null;
                                  },
                                },
                                child: Text('Xóa'),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // Save button
                    IntrinsicHeight(
                      child: Row(
                        spacing: context.gutter,
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () =>
                                  state.validateAndSave(context: context),
                              child: Text('Lưu'),
                            ),
                          ),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => state.clearForm(),
                              child: Text('Reset'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormStateProvider extends InheritedWidget {
  final GlobalKey<FormState> formKey = .new();
  final TextEditingController titleController = .new();
  final TextEditingController officialCodeController = .new();
  final TextEditingController officialTypeController = .new();
  final TextEditingController signedDateEditController = .new();
  final ValueNotifier<DateTime?> signedDateNotifier = .new(null);
  final ValueNotifier<String?> fullTextPathNotifier = .new(null);

  _FormStateProvider({required super.child});

  factory _FormStateProvider.builder({
    required Widget Function(BuildContext, _FormStateProvider) builder,
  }) {
    return _FormStateProvider(
      child: Builder(
        builder: (context) {
          final provider = _FormStateProvider.of(context);
          return builder(context, provider);
        },
      ),
    );
  }

  factory _FormStateProvider.of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<_FormStateProvider>();
    if (provider == null) {
      throw FlutterError(
        '_FormStateProvider.of() called with a context that does not contain a _FormStateProvider.',
      );
    }
    return provider;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  /// Validate function with message
  String? Function(String?) notEmptyValidator(String message) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return message;
      }
      return null;
    };
  }

  // Function of date picker
  void pickDate(BuildContext context) async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 10),
      lastDate: DateTime(now.year + 10),
    );
    if (pickedDate != null) {
      signedDateNotifier.value = pickedDate;
      signedDateEditController.text = pickedDate.toDmy(separator: '/');
    }
  }

  /// Clear the form
  void clearForm() {
    titleController.clear();
    officialCodeController.clear();
    signedDateEditController.clear();
    signedDateNotifier.value = null;
    fullTextPathNotifier.value = null;
  }

  // Full text picker function
  void pickFullTextFile(BuildContext context) async {
    // Implement file picker logic here
    // After picking the file, update the notifier and controller
    // Example:
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result == null) return;

    final filePath = result.files.single.path;
    if (filePath == null) {
      return;
    }

    fullTextPathNotifier.value = filePath;

    // Exclusive feature for Linux platform
    if (Platform.isLinux) {
      extractInformationFromPdf(filePath);
    }
  }

  /// Try tot extract the information from the PDF
  /// For some reason, pdfrx refuse to extract the sign date and the official code
  /// pdftotext returns the correct text, but poppler-utils needs to be installed
  void extractInformationFromPdf(String filePath) async {
    final proc = await Process.run(
      "pdftotext",
      [filePath, "-"],
      stdoutEncoding: Encoding.getByName("utf-8"),
    );
    final String text = proc.stdout;

    final officialCode = RegExp(r'Số:\s*(\d+)').firstMatch(text)?.group(1);
    final signDateMatches =
        RegExp(
          r'Hà Nội,\s+ngày\s+(\d+)\s+tháng\s+(\d+)\s+năm\s+(\d{4})',
        ).allMatches(text).firstOrNull?.groups([1, 2, 3]) ??
        <String>[];

    // Set offial number
    if (officialCode != null) {
      officialCodeController.text = officialCode;
    }

    // Set sign date
    if (signDateMatches.length >= 3) {
      final day = int.parse(signDateMatches[0]!);
      final month = int.parse(signDateMatches[1]!);
      final year = int.parse(signDateMatches[2]!);

      final date = DateTime(year, month, day);
      signedDateNotifier.value = date;
      signedDateEditController.text = date.toDmy(separator: '/');
    }

    // Find the title line
    final lines = text.split('\n');
    for (final (i, line) in lines.indexed) {
      switch (line.trim()) {
        // A bunch of magic values
        case "QUYẾT ĐỊNH":
          // Set title from line after "QUYẾT ĐỊNH"
          if (i + 1 < lines.length) {
            final titleLine = lines[i + 1].trim();
            titleController.text = titleLine;
          }
          return;
      }
    }
  }

  // Function of date editing field
  String? validateManualDate(String? value) {
    if (value == null || value.isEmpty) {
      return "Ngày ký không được để trống";
    }

    final trimmed = value.replaceAll(RegExp(r'\s'), ' ');
    final fmt1 = DateFormat("dd/MM/yyyy");
    final fmt2 = DateFormat("dd-MM-yyyy");
    final date = fmt1.tryParseStrict(trimmed) ?? fmt2.tryParseStrict(trimmed);
    if (date != null) {
      signedDateNotifier.value = date;
      return null;
    }

    return "Ngày không hợp lệ";
  }

  /// Function of save button
  void validateAndSave({required BuildContext context}) async {
    final ok = formKey.currentState?.validate() ?? false;
    if (!ok) {
      return;
    }

    // Get stuff from context
    final messenger = ScaffoldMessenger.of(context);
    final ref = ProviderScope.containerOf(context);

    // Get stuff from form
    final fileBytes = await File(fullTextPathNotifier.value!).readAsBytes();
    final title = titleController.text.trim();
    final officialCode = int.parse(officialCodeController.text.trim());
    final officialType = officialTypeController.text.trim();
    final signedDate = signedDateNotifier.value!;
    final db = await ref.read(mainDatabaseProvider.future);
    final fileDb = await ref.read(fileDatabaseProvider.future);

    // Insert into database
    await db.addDocument(
      title: title,
      officialCode: officialCode,
      officialType: officialType,
      signedDate: signedDate,
      fileBytes: fileBytes,
      fileContentDb: fileDb,
    );

    // Show success message
    messenger.showSnackBar(
      SnackBar(content: Text('Đã thêm văn bản "$title"')),
    );

    // Clear form
    clearForm();
  }

  void previewPdf(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final filePath = fullTextPathNotifier.value;
    if (filePath == null) return;

    // Check if file exists
    final file = File(filePath);
    final exists = await file.exists();
    if (!exists) {
      messenger.showSnackBar(
        SnackBar(content: Text('File không tồn tại: $filePath')),
      );
      return;
    }

    // Read file bytes
    final bytes = await file.readAsBytes();
    navigator.push(
      MaterialPageRoute(
        builder: (context) => CommonShortcuts(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Xem trước văn bản'),
            ),
            body: InkWell(
              onSecondaryTapDown: (details) {
                final pos = details.globalPosition;
                showMenu(
                  position: RelativeRect.fromLTRB(
                    pos.dx,
                    pos.dy,
                    pos.dx,
                    pos.dy,
                  ),
                  context: context,
                  items: [
                    PopupMenuItem(
                      child: ListTile(
                        title: Text("Quay lại"),
                        leading: Icon(Icons.arrow_back),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
              child: PdfViewer.data(
                bytes,
                sourceName: 'Xem trước văn bản',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
