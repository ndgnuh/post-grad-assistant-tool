import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/custom_widgets/pdf_preview_tile.dart';
import 'package:fami_tools/custom_widgets/pref_hooks.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'providers.dart';
import 'widgets.dart';

class PhdAdmissionPaymentPage extends StatelessWidget {
  static const routeName = '/phd/admission/payment';
  const PhdAdmissionPaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: Text('Thanh toán chấm đề cương NCS'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Danh sách'),
                Tab(text: 'Thao tác'),
              ],
            ),
          ),
        ),
        body: ConstrainedBody(
          child: TabBarView(
            children: [
              // List view tab
              Padding(
                padding: EdgeInsets.all(context.gutter),
                child: Column(
                  spacing: context.gutter,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CohortDropdown(),
                    Expanded(child: PhdStudentListView()),
                  ],
                ),
              ),

              // Action tab
              _ActionTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionTab extends HookWidget {
  const _ActionTab();

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final saveDirectory = usePreference<String?>(
      'phd_admission_payment_save_directory',
      defaultValue: null,
    );

    final paymentProfileButtons = [
      Consumer(
        builder: (context, ref, _) => PdfPreviewTile(
          title: Text("Đề nghị thanh toán"),
          subtitle: Text("Xem trước PDF"),
          pdfFileAsync: ref.watch(paymentRequestPdfProvider),
        ),
      ),

      Consumer(
        builder: (context, ref, _) => PdfPreviewTile(
          title: Text("Bảng ATM (x2)"),
          subtitle: Text("Xem trước PDF"),
          pdfFileAsync: ref.watch(paymentAtmPdfProvider),
        ),
      ),

      Consumer(
        builder: (context, ref, _) => PdfPreviewTile(
          title: Text("Bảng kiểm tra thanh toán"),
          subtitle: Text("Xem trước PDF"),
          pdfFileAsync: ref.watch(paymentDoubleCheckPdfProvider),
        ),
      ),

      Consumer(
        builder: (context, ref, _) => PdfPreviewTile(
          title: Text("Bảng kiểm tra thanh toán (tổng hợp)"),
          subtitle: Text("Xem trước PDF"),
          pdfFileAsync: ref.watch(paymentDoubleCheckSummaryPdfProvider),
        ),
      ),

      ListTile(
        title: Text("Chọn thư mục lưu"),
        subtitle: Text(saveDirectory.value ?? "Chưa chọn"),
        trailing: Icon(Symbols.chevron_forward),
        onTap: () async {
          FilePicker.platform.getDirectoryPath().then((path) {
            switch (path) {
              case null:
                return;
              default:
                saveDirectory.value = path;
            }
          });
        },
      ),

      Consumer(
        builder: (context, ref, _) => ListTile(
          title: Text("Lưu hồ sơ"),
          subtitle: Text("Lưu các file liên quan"),
          trailing: Icon(Symbols.chevron_forward),
          onTap: () async {
            final saveDir = saveDirectory.value;
            if (saveDir == null) {
              messenger.showSnackBar(
                SnackBar(content: Text("Vui lòng chọn thư mục lưu trước")),
              );
              return;
            }
            final requestPdf = ref.read(paymentRequestPdfProvider.future);
            final requestDocx = ref.read(paymentRequestDocxProvider.future);
            final atmPdf = ref.read(paymentAtmPdfProvider.future);
            final atmXlsx = ref.read(paymentAtmXlsxProvider.future);
            final checkPdf = ref.read(paymentDoubleCheckPdfProvider.future);

            final checkModel = await ref.read(
              paymentDoubleCheckProvider.future,
            );

            (await requestDocx).save(directory: saveDir);
            (await requestPdf).save(directory: saveDir);
            (await atmXlsx).save(directory: saveDir);
            (await atmPdf).save(directory: saveDir);
            (await checkPdf).save(directory: saveDir);
            (await checkModel.summaryPdf).save(directory: saveDir);

            checkModel.xlsx.save(directory: saveDir);
            messenger.showSnackBar(
              SnackBar(content: Text("Đã lưu hồ sơ vào $saveDir")),
            );
          },
        ),
      ),
    ];

    final troubleshootingButtons = [
      ListTile(
        title: Text("Mail bổ sung thông tin (ngoài trường)"),
        subtitle: Text("Bổ sung STK, Ngân hàng, CCCD"),
        trailing: Icon(Symbols.chevron_forward),
        onTap: () {},
      ),

      ListTile(
        title: Text("Mail bổ sung trong trường"),
        subtitle: Text("Bổ sung STK và ngân hàng"),
        trailing: Icon(Symbols.chevron_forward),
        onTap: () {},
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        children: [
          CardSection(
            title: "Hồ sơ thanh toán",
            children: paymentProfileButtons,
          ),

          CardSection(
            title: "Sự cố",
            children: troubleshootingButtons,
          ),
        ],
      ),
    );
  }
}
