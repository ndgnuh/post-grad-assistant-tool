import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pdfrx/pdfrx.dart';

import '../business/documents.dart';

class _SaveIntent extends Intent {
  const _SaveIntent();
}

class _EditIntent extends Intent {
  const _EditIntent();
}

typedef OnConfigChanged = void Function(PdfConfig config);

class PdfViewerTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final PdfBuilder pdfBuilder;
  final PdfConfig? initialConfig;
  final OnConfigChanged? onConfigChanged;

  const PdfViewerTile({
    super.key,
    required this.title,
    required this.pdfBuilder,
    this.onConfigChanged,
    this.initialConfig,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => _PdfViewerPage(
              pdfBuilder: pdfBuilder,
              initialConfig: initialConfig,
              onConfigChanged: onConfigChanged,
            ),
          ),
        );
      },
    );
  }
}

class _PdfViewerPage extends HookWidget {
  final PdfBuilder pdfBuilder;
  final OnConfigChanged? onConfigChanged;
  final PdfConfig? initialConfig;

  const _PdfViewerPage({
    required this.pdfBuilder,
    this.initialConfig,
    this.onConfigChanged,
  });

  @override
  Widget build(BuildContext context) {
    final configState = useState<PdfConfig>(
      initialConfig ?? PdfConfig(),
    );
    final pdfFileResult = useMemoized(
      () => Future.value(pdfBuilder(configState.value)),
      [configState.value],
    );
    final pdfFileState = useFuture<PdfFile>(pdfFileResult);

    switch (pdfFileState.connectionState) {
      case ConnectionState.waiting:
      case ConnectionState.none:
      case ConnectionState.active:
        return Scaffold(
          appBar: AppBar(
            title: Text("Đang tải PDF..."),
          ),
          body: Center(child: LinearProgressIndicator()),
        );
      case ConnectionState.done:
    }

    if (pdfFileState.hasError) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Lỗi tải PDF"),
        ),
        body: Center(
          child: ErrorWidget(pdfFileState.error!),
        ),
      );
    }

    final pdfFile = pdfFileState.data!;

    final messenger = ScaffoldMessenger.of(context);

    saveFile() async {
      final savePath = await FilePicker.platform.saveFile(
        fileName: pdfFile.fileName,
        bytes: pdfFile.bytes,
      );

      switch (savePath) {
        case String path:
          if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
            await File(path).writeAsBytes(pdfFile.bytes);
          }
          messenger.showSnackBar(
            SnackBar(content: Text("Đã lưu file tại $path")),
          );
      }
    }

    final fabClass =
        (Platform.isMacOS || Platform.isWindows || Platform.isLinux)
        ? FloatingActionButton.large
        : FloatingActionButton.new;

    // final pdfViewerController = PdfViewerController();

    void showEditDialog() {
      showDialog(
        context: context,
        builder: (context) => _PdfConfigDialog(
          initialConfig: configState.value,
          onConfigChanged: (config) {
            configState.value = config;
            return onConfigChanged != null
                ? onConfigChanged!.call(config)
                : pdfBuilder(config);
          },
        ),
      );
    }

    return Shortcuts(
      shortcuts: {
        SingleActivator(LogicalKeyboardKey.keyE, control: true):
            const _EditIntent(),
        SingleActivator(LogicalKeyboardKey.keyS, control: true):
            const _SaveIntent(),
      },
      child: Actions(
        actions: {
          _SaveIntent: CallbackAction<_SaveIntent>(
            onInvoke: (intent) => saveFile(),
          ),
          _EditIntent: CallbackAction<_EditIntent>(
            onInvoke: (intent) => showEditDialog(),
          ),
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(pdfFile.name),
            actions: [
              IconButton(
                onPressed: showEditDialog,
                icon: const Icon(Symbols.settings),
                tooltip: "Lưu file",
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: PdfViewer.data(
                  pdfFile.bytes,
                  sourceName: pdfFile.fileName,
                ),
              ),
            ],
          ),
          floatingActionButton: fabClass(
            onPressed: saveFile,
            child: const Icon(Symbols.save),
          ),
        ),
      ),
    );
  }
}

class _PdfConfigDialog extends HookWidget {
  final PdfConfig initialConfig;
  final OnConfigChanged? onConfigChanged;

  const _PdfConfigDialog({
    required this.initialConfig,
    this.onConfigChanged,
  });

  String? validate(String? valueString) {
    final value = double.tryParse(valueString ?? '');
    if (value == null) {
      return "Vui lòng nhập số hợp lệ";
    }
    return null;
  }

  static final inputFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'^\d*\.?\d*'),
  );

  @override
  Widget build(BuildContext context) {
    final state = useState<PdfConfig>(initialConfig);

    final config = state.value;
    final verticalMargin = config.verticalMargin / inch;
    final horizontalMargin = config.horizontalMargin / inch;
    final baseFontSize = config.baseFontSize / pt;
    final verticalCellPadding = config.verticalTableCellPadding / pt;
    final horizontalCellPadding = config.horizontalTableCellPadding / pt;

    // controllers
    final baseFontSizeController = useTextEditingController(
      text: baseFontSize.toStringAsFixed(2),
    );
    final verticalMarginController = useTextEditingController(
      text: verticalMargin.toStringAsFixed(2),
    );
    final horizontalMarginController = useTextEditingController(
      text: horizontalMargin.toStringAsFixed(2),
    );
    final verticalCellPaddingController = useTextEditingController(
      text: verticalCellPadding.toStringAsFixed(2),
    );
    final horizontalCellPaddingController = useTextEditingController(
      text: horizontalCellPadding.toStringAsFixed(2),
    );

    final formKey = GlobalKey<FormState>();

    validateAndSave() {
      // Validate form
      if (!formKey.currentState!.validate()) {
        return;
      }

      // new config
      final config = PdfConfig(
        baseFontSize: double.parse(baseFontSizeController.text) * pt,
        verticalMargin: double.parse(verticalMarginController.text) * inch,
        horizontalMargin: double.parse(horizontalMarginController.text) * inch,
        verticalTableCellPadding:
            double.parse(verticalCellPaddingController.text) * pt,
        horizontalTableCellPadding:
            double.parse(horizontalCellPaddingController.text) * pt,
      );
      onConfigChanged?.call(config);

      // Save configuration changes
      Navigator.of(context).pop();
    }

    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.enter): const _SaveIntent(),
      },
      child: FocusScope(
        child: AlertDialog(
          title: Text("Cài đặt PDF"),
          content: Actions(
            actions: {
              _SaveIntent: CallbackAction<_SaveIntent>(
                onInvoke: (intent) => validateAndSave(),
              ),
            },
            child: Form(
              key: formKey,
              child: Column(
                spacing: context.gutterSmall,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // baseFontSize
                  TextFormField(
                    autofocus: true,
                    controller: baseFontSizeController,
                    decoration: InputDecoration(labelText: "Cỡ font (pt)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [inputFormatter],
                    validator: validate,
                  ),

                  // Vertical margin
                  TextFormField(
                    controller: verticalMarginController,
                    decoration: InputDecoration(labelText: "Lề dọc (inch)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [inputFormatter],
                    validator: validate,
                  ),

                  // Horizontal margin
                  TextFormField(
                    controller: horizontalMarginController,
                    decoration: InputDecoration(labelText: "Lề ngang (inch)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [inputFormatter],
                    validator: validate,
                  ),

                  // Vertical cell padding
                  TextFormField(
                    controller: verticalCellPaddingController,
                    decoration: InputDecoration(
                      labelText: "Padding ô bảng dọc (pt)",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [inputFormatter],
                    validator: validate,
                  ),

                  // HOrizontal cell padding
                  TextFormField(
                    controller: horizontalCellPaddingController,
                    decoration: InputDecoration(
                      labelText: "Padding ô bảng ngang (pt)",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [inputFormatter],
                    validator: validate,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Hủy"),
            ),
            ElevatedButton(
              onPressed: validateAndSave,
              child: Text("Lưu"),
            ),
          ],
        ),
      ),
    );
  }
}
