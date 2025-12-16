import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/custom_widgets/pdf_preview_tile.dart';
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
    final saveDirectory = useState<String?>(null);

    final buttons = [
      Consumer(
        builder: (context, ref, _) => PdfPreviewTile(
          title: Text("Đề nghị thanh toán"),
          subtitle: Text("Xem trước PDF"),
          pdfFileAsync: ref.watch(paymentRequestPdfProvider),
        ),
      ),

      ListTile(
        title: Text("Bản kê thanh toán"),
        subtitle: Text("Xem trước PDF"),
        trailing: Icon(Symbols.chevron_forward),
        onTap: () {},
      ),

      Consumer(
        builder: (context, ref, _) => PdfPreviewTile(
          title: Text("Bảng ATM (x2)"),
          subtitle: Text("Xem trước PDF"),
          pdfFileAsync: ref.watch(paymentAtmPdfProvider),
        ),
      ),

      ListTile(
        title: Text("Bảng kiểm tra thanh toán"),
        subtitle: Text("Xem trước PDF"),
        trailing: Icon(Symbols.chevron_forward),
        onTap: () {},
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

      ListTile(
        title: Text("Lưu hồ sơ"),
        subtitle: Text("Lưu các file liên quan"),
        trailing: Icon(Symbols.chevron_forward),
        onTap: () {},
      ),
    ];

    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: ListView.separated(
        itemCount: buttons.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => buttons[index],
      ),
    );
  }
}
