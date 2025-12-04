import 'dart:io';
import 'dart:typed_data';

import 'package:fami_tools/business/pdfs/pdfs.dart' show PdfFile;
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as path;

import '../../custom_widgets.dart';
import '../setting_pages/setting_pages.dart';
import 'admission_payment_providers.dart';
import 'providers.dart';
import 'widgets.dart';

final _paymentAtmPdfProvider = FutureProvider((ref) async {
  final pdfFile = await ref.watch(paymentAtmPdfProvider.future);
  return pdfFile.bytes;
});

class AdmissionPaymentPage extends StatelessWidget {
  static const routeName = "/admission/payment";

  const AdmissionPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final verticalDirection = switch (Platform.isAndroid || Platform.isIOS) {
      true => VerticalDirection.up,
      false => VerticalDirection.down,
    };

    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text("Thanh toán xét tuyển"),
        ),
      ),
      body: ConstrainedBody(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            verticalDirection: verticalDirection,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.gutter,
            children: [
              // Input panels
              Card(
                child: Column(
                  children: [
                    SizedBox(height: context.gutterSmall),

                    ListTile(
                      title: CouncilSelector(),
                    ),

                    ListTile(
                      title: _SaveDirectoryPicker(),
                    ),

                    Divider(),
                    _SaveButton(),

                    SizedBox(height: context.gutterSmall),
                  ],
                ),
              ),

              // Actions
              Card(
                child: Column(
                  children: [
                    SizedBox(height: context.gutterSmall),

                    _PdfFileViewButton(
                      title: "Đề thị thanh toán",
                      pdfProvider: paymentRequestPdfProvider,
                    ),

                    Divider(),
                    _PdfViewButton(
                      title: "Bảng thanh toán",
                      sourceName: "bang-thanh-toan.pdf",
                      pdfProvider: paymentTablePdfProvider,
                      builder: (context, callback, error) => ListTile(
                        title: Text("Bảng thanh toán"),
                        subtitle: Text(
                          error ?? "Xem trước bảng ký nhận thanh toán",
                        ),
                        trailing: Icon(Symbols.chevron_forward),
                        enabled: callback != null,
                        onTap: callback,
                      ),
                    ),

                    Divider(),
                    _PdfFileViewButton(
                      title: "Bản kê thanh toán",
                      pdfProvider: paymentListingPdfProvider,
                    ),

                    Divider(),
                    _PdfViewButton(
                      sourceName: "tong-hop-thanh-toan-atm.pdf",
                      pdfProvider: _paymentAtmPdfProvider,
                      title: "Tổng hợp thanh toán",
                      builder: (context, callback, error) => ListTile(
                        title: Text("Tổng hợp thanh toán"),
                        subtitle: Text(
                          error ??
                              "Xem trước bảng tổng hợp thanh toán (bảng ATM)",
                        ),
                        trailing: Icon(Symbols.chevron_forward),
                        enabled: callback != null,
                        onTap: callback,
                      ),
                    ),

                    SizedBox(height: context.gutterSmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String? validate(WidgetRef ref) {
    // Check if save directory is selected
    final saveDirectory = ref.read(saveDirectoryProvider);
    if (saveDirectory == null) {
      return "Chưa chọn thư mục lưu";
    }

    // Check if council is selected
    final councilSelection = ref.read(admissionCouncilSelectionProvider);
    switch (councilSelection) {
      case AsyncLoading():
        return "Đang tải dữ liệu hội đồng xét tuyển...";
      case AsyncError(:final error):
        return "Lỗi tải dữ liệu hội đồng xét tuyển: $error";
      case AsyncData(:final value):
        if (value.selected == null) return "Chưa chọn hội đồng xét tuyển";
    }

    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);

    void onPressed() async {
      // Validate
      final message = validate(ref);
      if (message != null) {
        messenger.showSnackBar(
          SnackBar(
            content: Text(validate(ref)!),
          ),
        );
        return;
      }

      // Actual saving
      final paymentTablePdf = await ref.read(
        paymentTablePdfProvider.future,
      );
      final paymentRequestPdf = await ref.read(
        paymentRequestPdfProvider.future,
      );
      final paymentAtmPdf = await ref.read(
        paymentAtmPdfProvider.future,
      );
      final paymentAtmExcel = await ref.read(
        paymentAtmExcelProvider.future,
      );
      final paymentListingPdf = await ref.read(
        paymentListingPdfProvider.future,
      );

      // Save files
      final saveDirectory = ref.read(saveDirectoryProvider)!;
      File(
        path.join(saveDirectory, "01-bang-thanh-toan.pdf"),
      ).writeAsBytesSync(paymentTablePdf);

      paymentListingPdf.save(directory: saveDirectory);
      paymentRequestPdf.save(directory: saveDirectory);
      paymentAtmPdf.save(directory: saveDirectory);
      paymentAtmExcel.save(directory: saveDirectory);

      messenger.showSnackBar(
        SnackBar(
          content: Text("Đã lưu, nhưng tính năng chưa được hoàn thiện."),
        ),
      );
    }

    return Form(
      key: _formKey,
      child: ListTile(
        title: FormField(
          validator: (_) => validate(ref),
          builder: (state) => FilledButton.icon(
            onPressed: onPressed,
            label: Text("Lưu hồ sơ thanh toán"),
          ),
        ),
      ),
    );
  }
}

class _SaveDirectoryPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => DirectoryPicker(
        name: "admission_payment_save_directory",
        labelText: "Thư mục lưu",
        onDirectorySelected: (saveDirectory) {
          ref.read(saveDirectoryProvider.notifier).set(saveDirectory);
        },
      ),
    );
  }
}

class _PdfViewButton extends ConsumerWidget {
  final FutureProvider<Uint8List> pdfProvider;
  final String sourceName;
  final String title;
  final Widget Function(BuildContext, VoidCallback?, String?) builder;

  const _PdfViewButton({
    required this.title,
    required this.pdfProvider,
    required this.sourceName,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfAsync = ref.watch(pdfProvider);
    final callback = switch (pdfAsync) {
      AsyncLoading() => null,
      AsyncError() => null,
      AsyncData<Uint8List>(:final value) => () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfDataPreviewPage(
              pdfData: value,
              sourceName: sourceName,
              title: title,
            ),
          ),
        );
      },
    };

    switch (pdfAsync) {
      case AsyncError(:final error, :final stackTrace):
        print(error);
        print(stackTrace);
        break;
      default:
        break;
    }

    final error = switch (pdfAsync) {
      AsyncError(:final error) => error.toString(),
      _ => null,
    };

    return builder(context, callback, error);
  }
}

class _PdfFileViewButton extends ConsumerWidget {
  final String title;
  final FutureProvider<PdfFile> pdfProvider;

  const _PdfFileViewButton({
    required this.title,
    required this.pdfProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfAsync = ref.watch(pdfProvider);
    switch (pdfAsync) {
      case AsyncLoading():
        return ListTile(
          title: Text(title),
          subtitle: Text("Đang tải dữ liệu..."),
          trailing: CircularProgressIndicator(),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text(title),
          subtitle: Text("Lỗi tải dữ liệu: $error"),
          trailing: CircularProgressIndicator(),
        );
      default:
    }

    final pdfFile = pdfAsync.value!;

    void onPressed() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfDataPreviewPage(
            pdfData: pdfFile.bytes,
            sourceName: pdfFile.name,
            title: title,
          ),
        ),
      );
    }

    return ListTile(
      title: Text(title),
      subtitle: Text("Xem trước $title"),
      trailing: Icon(Symbols.chevron_forward),
      onTap: onPressed,
    );
  }
}
