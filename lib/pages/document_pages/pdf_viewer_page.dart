import 'dart:async';
import 'dart:io';

import 'package:fami_tools/custom_widgets/responsive_breakpoints.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../business/documents.dart';
import '../../shortcuts.dart';

class _GoToPrevious extends Intent {
  final _PdfTextSearchState state;
  const _GoToPrevious(this.state);
}

class _GoToNext extends Intent {
  final _PdfTextSearchState state;
  const _GoToNext(this.state);
}

final _futureProvider = FutureProvider.family(
  (ref, FutureOr<PdfFile> future) => future,
);

class _PdfTextSearchState extends InheritedWidget {
  final ValueNotifier<PdfTextSearcher?> textSearcherNotifier = .new(null);

  /// Get current text searcher
  PdfTextSearcher? get textSearcher => textSearcherNotifier.value;

  /// Set current text searcher
  set textSearcher(PdfTextSearcher? searcher) {
    final current = textSearcherNotifier.value;
    if (current != null) {
      current.dispose();
    }

    textSearcherNotifier.value = searcher;
  }

  /// Start a new text search
  void startSearch(String query) {
    textSearcher?.startTextSearch(query);
    textSearcher?.goToMatchOfIndex(0);
  }

  /// Go to next match
  void goToNextMatch() => textSearcher?.goToNextMatch();

  /// Go to previous match
  void goToPrevMatch() => textSearcher?.goToPrevMatch();

  /// Paint text matches on page
  void pageTextMatchPaintCallback(Canvas canvas, Rect pageRect, PdfPage page) {
    if (textSearcher != null) {
      textSearcher!.pageTextMatchPaintCallback(canvas, pageRect, page);
    }
  }

  _PdfTextSearchState({
    required super.child,
  });

  static _PdfTextSearchState? maybeOf(BuildContext context) {
    final state = context
        .dependOnInheritedWidgetOfExactType<_PdfTextSearchState>();
    return state;
  }

  static _PdfTextSearchState of(BuildContext context) {
    final state = maybeOf(context);
    if (state == null) {
      throw FlutterError(
        '_PdfTextSearchState.of() called with a context that does not contain a _PdfTextSearchState.',
      );
    }
    return state;
  }

  /// No need to udpate
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

/// Hiển thị cài đặt PDF
class EditPdfAction extends Action<EditIntent> {
  final BuildContext context;
  final ProviderListenable<AsyncValue<PdfFile>> pdfProvider;
  final ValueChanged<PdfConfig> onConfigChanged;

  EditPdfAction({
    required this.context,
    required this.pdfProvider,
    required this.onConfigChanged,
  });

  @override
  void invoke(covariant EditIntent intent) {
    showDialog<PdfConfig>(
      context: context,
      builder: (context) => PdfConfigDialog(
        pdfProvider: pdfProvider,
        onConfigChanged: onConfigChanged,
      ),
    );
  }
}

/// Lưu PDF ra đĩa
class SavePdfAction extends Action<SaveIntent> {
  final BuildContext context;
  final ProviderListenable<AsyncValue<PdfFile>> pdfProvider;

  SavePdfAction({required this.context, required this.pdfProvider});

  Future<String?> pickAndSave(PdfFile file) async {
    final result = await FilePicker.platform.saveFile(
      dialogTitle: "Lưu file",
      fileName: file.fileName,
      bytes: file.bytes,
    );

    if (result == null) return null;
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      await File(result).writeAsBytes(file.bytes);
    }

    return result;
  }

  @override
  void invoke(covariant SaveIntent intent) {
    final ref = ProviderScope.containerOf(context);
    final messenger = ScaffoldMessenger.of(context);
    final pdfFileAsync = ref.read(pdfProvider);
    switch (pdfFileAsync) {
      case AsyncLoading():
        messenger.showSnackBar(
          SnackBar(content: Text("Đang tải PDF, vui lòng chờ...")),
        );
        return;

      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        messenger.showSnackBar(
          SnackBar(content: Text("Lỗi tải PDF: $error")),
        );

      case AsyncData(:final value):
        final pdfFile = value;
        // Save file
        pickAndSave(pdfFile).then((outputPath) {
          if (outputPath == null) return;
          messenger.showSnackBar(
            SnackBar(content: Text("Đã lưu file tại $outputPath")),
          );
        });
    }
  }
}

class PdfViewerPage extends StatelessWidget {
  final ProviderListenable<AsyncValue<PdfFile>> pdfProvider;
  final ValueChanged<PdfConfig>? onConfigChanged;

  factory PdfViewerPage.fromPdfFile({required PdfFile pdfFile}) {
    return PdfViewerPage(
      pdfProvider: _futureProvider(Future.value(pdfFile)),
    );
  }

  const PdfViewerPage({
    super.key,
    required this.pdfProvider,
    this.onConfigChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _PdfTextSearchState(
      child: Shortcuts(
        shortcuts: {
          SingleActivator(LogicalKeyboardKey.keyS, control: true):
              const SaveIntent(),
          SingleActivator(LogicalKeyboardKey.keyE, control: true):
              const EditIntent(),
          SingleActivator(LogicalKeyboardKey.arrowLeft, alt: true):
              const GoBackIntent(),
        },
        child: Actions(
          actions: {
            if (onConfigChanged != null)
              EditIntent: EditPdfAction(
                context: context,
                pdfProvider: pdfProvider,
                onConfigChanged: onConfigChanged!,
              ),
            GoBackIntent: CallbackAction<GoBackIntent>(
              onInvoke: (intent) {
                Navigator.of(context).pop();
                return null;
              },
            ),
            _GoToPrevious: CallbackAction<_GoToPrevious>(
              onInvoke: (intent) {
                intent.state.goToPrevMatch();
                return null;
              },
            ),
            _GoToNext: CallbackAction<_GoToNext>(
              onInvoke: (intent) {
                intent.state.goToNextMatch();
                return null;
              },
            ),
            FocusIntent: FocusAction(),
            SaveIntent: SavePdfAction(
              context: context,
              pdfProvider: pdfProvider,
            ),
          },
          child: FocusScope(
            autofocus: true,
            child: Scaffold(
              appBar: AppBar(
                title: _PdfTitle(provider: pdfProvider),
                actions: [
                  if (onConfigChanged != null)
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: Icon(Symbols.settings),
                          tooltip: "Cài đặt PDF",
                          onPressed: () => Actions.invoke(
                            context,
                            const EditIntent(),
                          ),
                        );
                      },
                    ),
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () => Actions.invoke(
                          context,
                          const SaveIntent(),
                        ),
                        icon: Icon(Symbols.save),
                        tooltip: "Lưu PDF",
                      );
                    },
                  ),
                ],
              ),
              body: Center(
                child: _PdfViewer(
                  provider: pdfProvider,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PdfViewerState extends ConsumerState<_PdfViewer> {
  @override
  void dispose() {
    final textSearcherState = _PdfTextSearchState.of(context);
    textSearcherState.textSearcher?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pdfFileAsync = ref.watch(widget.provider);
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
        final searcherState = _PdfTextSearchState.of(context);
        final goToNext = _GoToNext(searcherState);
        final goToPrevious = _GoToPrevious(searcherState);
        final focusNode = FocusNode();
        final focusIntent = FocusIntent(focusNode);

        return Shortcuts(
          shortcuts: {
            SingleActivator(LogicalKeyboardKey.f3): goToNext,
            SingleActivator(LogicalKeyboardKey.f3, shift: true): goToPrevious,
            SingleActivator(LogicalKeyboardKey.keyG, control: true): goToNext,
            SingleActivator(LogicalKeyboardKey.keyG, shift: true): goToPrevious,
            SingleActivator(LogicalKeyboardKey.keyF, control: true):
                focusIntent,
          },
          child: FocusScope(
            autofocus: true,
            child: Padding(
              padding: EdgeInsets.all(context.gutter),
              child: Column(
                verticalDirection: context.verticalDirection,
                spacing: context.gutterSmall,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      spacing: context.gutterSmall,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Nhập từ khóa tìm kiếm",
                              suffixIcon: Icon(Symbols.search),
                            ),
                            onSubmitted: (value) =>
                                searcherState.startSearch(value),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () => Actions.invoke(
                            context,
                            _GoToPrevious(searcherState),
                          ),
                          label: Text("Trước"),
                          icon: Icon(Symbols.arrow_back),
                        ),

                        OutlinedButton.icon(
                          label: Text("Sau"),
                          onPressed: () => Actions.invoke(
                            context,
                            _GoToNext(searcherState),
                          ),
                          icon: Icon(Symbols.arrow_forward),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PdfViewer.data(
                      pdfFile.bytes,
                      sourceName: pdfFile.fileName,
                      params: PdfViewerParams(
                        onViewerReady: (document, controller) {
                          searcherState.textSearcher = PdfTextSearcher(
                            controller,
                          );
                        },
                        pagePaintCallbacks: [
                          _PdfTextSearchState.of(
                            context,
                          ).pageTextMatchPaintCallback,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}

class _PdfViewer extends ConsumerStatefulWidget {
  final ProviderListenable<AsyncValue<PdfFile>> provider;
  const _PdfViewer({required this.provider});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PdfViewerState();
  }
}

class _PdfTitle extends ConsumerWidget {
  final ProviderListenable<AsyncValue<PdfFile>> provider;
  const _PdfTitle({required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfFileAsync = ref.watch(provider);
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

class PdfConfigDialog extends ConsumerStatefulWidget {
  final ProviderListenable<AsyncValue<PdfFile>> pdfProvider;
  final ValueChanged<PdfConfig> onConfigChanged;

  const PdfConfigDialog({
    super.key,
    required this.pdfProvider,
    required this.onConfigChanged,
  });

  static final inputFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'^\d*\.?\d*'),
  );

  @override
  ConsumerState<PdfConfigDialog> createState() => _PdfConfigDialogState();
}

class _PdfConfigDialogState extends ConsumerState<PdfConfigDialog> {
  final GlobalKey<FormState> formKey = .new();
  final TextEditingController baseFontSizeController = .new();
  final TextEditingController verticalMarginController = .new();
  final TextEditingController horizontalMarginController = .new();
  final TextEditingController verticalCellPaddingController = .new();
  final TextEditingController horizontalCellPaddingController = .new();
  final ValueNotifier<PdfConfig> configNotifier = .new(PdfConfig());

  @override
  void initState() {
    super.initState();
    final pdfAsync = ref.read(widget.pdfProvider);
    pdfAsync.whenData((pdfFile) {
      final config = pdfFile.config;
      final baseFontSize = (config.baseFontSize / pt).toStringAsFixed(2);
      final verticalMargin = (config.verticalMargin / inch).toStringAsFixed(2);
      final horizontalMargin = (config.horizontalMargin / inch).toStringAsFixed(
        2,
      );
      final verticalCellPadding = (config.verticalTableCellPadding / pt)
          .toStringAsFixed(2);
      final horizontalCellPadding = (config.horizontalTableCellPadding / pt)
          .toStringAsFixed(2);

      baseFontSizeController.text = baseFontSize;
      verticalMarginController.text = verticalMargin;
      horizontalMarginController.text = horizontalMargin;
      verticalCellPaddingController.text = verticalCellPadding;
      horizontalCellPaddingController.text = horizontalCellPadding;
      configNotifier.value = config;
    });
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

  PdfConfig get pdfConfig => configNotifier.value.copyWith(
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
    widget.onConfigChanged.call(pdfConfig);

    // Save configuration changes
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        SingleActivator(LogicalKeyboardKey.enter): const SaveIntent(),
        SingleActivator(LogicalKeyboardKey.keyS, control: true):
            const SaveIntent(),
        SingleActivator(LogicalKeyboardKey.escape): const GoBackIntent(),
      },
      child: FocusScope(
        autofocus: true,
        child: AlertDialog(
          title: Text("Cài đặt PDF"),
          content: Actions(
            actions: {
              SaveIntent: CallbackAction<SaveIntent>(
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
                    inputFormatters: [PdfConfigDialog.inputFormatter],
                    validator: validate,
                  ),

                  // Vertical margin
                  TextFormField(
                    controller: verticalMarginController,
                    decoration: InputDecoration(labelText: "Lề dọc (inch)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [PdfConfigDialog.inputFormatter],
                    validator: validate,
                  ),

                  // Horizontal margin
                  TextFormField(
                    controller: horizontalMarginController,
                    decoration: InputDecoration(labelText: "Lề ngang (inch)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [PdfConfigDialog.inputFormatter],
                    validator: validate,
                  ),

                  // Vertical cell padding
                  TextFormField(
                    controller: verticalCellPaddingController,
                    decoration: InputDecoration(
                      labelText: "Padding ô bảng dọc (pt)",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [PdfConfigDialog.inputFormatter],
                    validator: validate,
                  ),

                  // Horizontal cell padding
                  TextFormField(
                    controller: horizontalCellPaddingController,
                    decoration: InputDecoration(
                      labelText: "Padding ô bảng ngang (pt)",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [PdfConfigDialog.inputFormatter],
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

// class PdfDataPreviewPage extends StatelessWidget {
//   final Uint8List pdfData;
//   final String sourceName;
//   final String title;
//
//   const PdfDataPreviewPage({
//     super.key,
//     required this.sourceName,
//     required this.pdfData,
//     required this.title,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final messenger = ScaffoldMessenger.of(context);
//     saveFile() async {
//       final savePath = await FilePicker.platform.saveFile(
//         fileName: sourceName,
//         bytes: pdfData,
//       );
//
//       switch (savePath) {
//         case String path:
//           if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
//             await File(path).writeAsBytes(pdfData);
//           }
//           messenger.showSnackBar(
//             SnackBar(content: Text("Đã lưu file tại $path")),
//           );
//       }
//     }
//
//     final fabClass =
//         (Platform.isMacOS || Platform.isWindows || Platform.isLinux)
//         ? FloatingActionButton.large
//         : FloatingActionButton.new;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: PdfViewer.data(pdfData, sourceName: sourceName),
//           ),
//         ],
//       ),
//       floatingActionButton: fabClass(
//         onPressed: saveFile,
//         child: const Icon(Symbols.save),
//       ),
//     );
//   }
// }
