import 'dart:async';
import 'dart:io';

import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/shortcuts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:riverpod/riverpod.dart';

import '../business/documents.dart';

class _SaveIntent extends Intent {
  const _SaveIntent();
}

final _futureProvider = FutureProvider.family(
  (ref, FutureOr<PdfFile> future) => future,
);

typedef OnConfigChanged = void Function(PdfConfig config);

class PdfViewerButton extends StatelessWidget {
  final PdfBuilder pdfBuilder;
  final PdfConfig? initialConfig;
  final OnConfigChanged? onConfigChanged;
  final Widget Function(BuildContext, VoidCallback) builder;

  const PdfViewerButton({
    super.key,
    required this.pdfBuilder,
    required this.builder,
    this.onConfigChanged,
    this.initialConfig,
  });

  Future<dynamic> onPresssed(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _PdfViewerPage(
          pdfBuilder: pdfBuilder,
          initialConfig: initialConfig,
          onConfigChanged: onConfigChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return builder(context, () => onPresssed(context));
  }
}

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

class _PdfViewerPage extends StatefulWidget {
  final PdfBuilder pdfBuilder;
  final OnConfigChanged? onConfigChanged;
  final PdfConfig? initialConfig;

  const _PdfViewerPage({
    required this.pdfBuilder,
    this.initialConfig,
    this.onConfigChanged,
  });

  @override
  State<_PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<_PdfViewerPage> {
  late PdfConfig config;

  @override
  initState() {
    super.initState();
    config = widget.initialConfig ?? PdfConfig();
  }

  void showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _PdfConfigDialog(
        initialConfig: config,
        onConfigChanged: (newConfig) {
          setState(() {
            config = newConfig;
          });
          widget.onConfigChanged?.call(newConfig);
        },
      ),
    );
  }

  void saveFile(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final pdfFile = await pdfFileResult;
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

  FutureOr<PdfFile> get pdfFileResult {
    return widget.pdfBuilder(config);
  }

  @override
  Widget build(BuildContext context) {
    final fabClass =
        (Platform.isMacOS || Platform.isWindows || Platform.isLinux)
        ? FloatingActionButton.large
        : FloatingActionButton.new;

    return CommonShortcuts(
      navigator: Navigator.of(context),
      onEdit: showEditDialog,
      onSave: saveFile,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          child: AppBar(
            title: _PdfTitle(pdfFileFuture: pdfFileResult),
          ),
        ),
        body: ConstrainedBody(
          child: Center(
            child: _PdfViewer(
              pdfFileFuture: pdfFileResult,
            ),
          ),
        ),
        floatingActionButton: fabClass(
          onPressed: () => saveFile(context),
          child: Icon(Symbols.save),
        ),
      ),
    );
  }
}

class _PdfViewer extends ConsumerWidget {
  final FutureOr<PdfFile> pdfFileFuture;
  const _PdfViewer({required this.pdfFileFuture});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfFileAsync = ref.watch(_futureProvider(pdfFileFuture));
    switch (pdfFileAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return Text("Lỗi: $error");
      case AsyncData(:final value):
        final pdfFile = value;
        return PdfViewer.data(
          pdfFile.bytes,
          sourceName: pdfFile.fileName,
          params: PdfViewerParams(
            keyHandlerParams: PdfViewerKeyHandlerParams(
              canRequestFocus: false,
              enabled: false,
            ),
          ),
        );
    }
  }
}

class _PdfTitle extends ConsumerWidget {
  final FutureOr<PdfFile> pdfFileFuture;
  const _PdfTitle({required this.pdfFileFuture});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfFileAsync = ref.watch(_futureProvider(pdfFileFuture));
    switch (pdfFileAsync) {
      case AsyncLoading():
        return Text("Đang tải...");
      case AsyncError(:final error):
        return Text("Lỗi: $error");
      case AsyncData(:final value):
        return Text(value.fileName);
    }
  }
}

class _PdfConfigDialog extends StatefulWidget {
  final PdfConfig? initialConfig;
  final OnConfigChanged? onConfigChanged;

  const _PdfConfigDialog({
    required this.initialConfig,
    this.onConfigChanged,
  });

  static final inputFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'^\d*\.?\d*'),
  );

  @override
  State<_PdfConfigDialog> createState() => _PdfConfigDialogState();
}

class _PdfConfigDialogState extends State<_PdfConfigDialog> {
  final formKey = GlobalKey<FormState>();
  late final PdfConfig initialConfig;
  final TextEditingController baseFontSizeController = .new();
  final TextEditingController verticalMarginController = .new();
  final TextEditingController horizontalMarginController = .new();
  final TextEditingController verticalCellPaddingController = .new();
  final TextEditingController horizontalCellPaddingController = .new();

  @override
  void initState() {
    super.initState();
    final config = widget.initialConfig ?? PdfConfig();
    initialConfig = config;

    /// Initialize controllers
    baseFontSizeController.text = (config.baseFontSize / pt).toStringAsFixed(2);
    verticalMarginController.text = (config.verticalMargin / inch)
        .toStringAsFixed(2);
    horizontalMarginController.text = (config.horizontalMargin / inch)
        .toStringAsFixed(2);
    verticalCellPaddingController.text = (config.verticalTableCellPadding / pt)
        .toStringAsFixed(2);
    horizontalCellPaddingController.text =
        (config.horizontalTableCellPadding / pt).toStringAsFixed(2);
  }

  @override
  void dispose() {
    super.dispose();
    baseFontSizeController.dispose();
    verticalMarginController.dispose();
    horizontalMarginController.dispose();
    verticalCellPaddingController.dispose();
    horizontalCellPaddingController.dispose();
  }

  PdfConfig get pdfConfig => initialConfig.copyWith(
    baseFontSize: double.parse(baseFontSizeController.text) * pt,
    verticalMargin: double.parse(verticalMarginController.text) * inch,
    horizontalMargin: double.parse(horizontalMarginController.text) * inch,
    verticalTableCellPadding:
        double.parse(verticalCellPaddingController.text) * pt,
    horizontalTableCellPadding:
        double.parse(horizontalCellPaddingController.text) * pt,
  );

  String? validate(String? valueString) {
    final value = double.tryParse(valueString ?? '');
    if (value == null) {
      return "Vui lòng nhập số hợp lệ";
    }
    return null;
  }

  void validateAndSave() {
    // Validate form
    if (!formKey.currentState!.validate()) {
      return;
    }

    // new config
    widget.onConfigChanged?.call(pdfConfig);

    // Save configuration changes
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // controllers

    return Shortcuts(
      shortcuts: {
        SingleActivator(LogicalKeyboardKey.enter): const _SaveIntent(),
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
                    inputFormatters: [_PdfConfigDialog.inputFormatter],
                    validator: validate,
                  ),

                  // Vertical margin
                  TextFormField(
                    controller: verticalMarginController,
                    decoration: InputDecoration(labelText: "Lề dọc (inch)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [_PdfConfigDialog.inputFormatter],
                    validator: validate,
                  ),

                  // Horizontal margin
                  TextFormField(
                    controller: horizontalMarginController,
                    decoration: InputDecoration(labelText: "Lề ngang (inch)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [_PdfConfigDialog.inputFormatter],
                    validator: validate,
                  ),

                  // Vertical cell padding
                  TextFormField(
                    controller: verticalCellPaddingController,
                    decoration: InputDecoration(
                      labelText: "Padding ô bảng dọc (pt)",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [_PdfConfigDialog.inputFormatter],
                    validator: validate,
                  ),

                  // Horizontal cell padding
                  TextFormField(
                    controller: horizontalCellPaddingController,
                    decoration: InputDecoration(
                      labelText: "Padding ô bảng ngang (pt)",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [_PdfConfigDialog.inputFormatter],
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
