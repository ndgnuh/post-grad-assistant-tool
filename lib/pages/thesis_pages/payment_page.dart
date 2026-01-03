import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/custom_widgets/pdf_viewer.dart';
import 'package:fami_tools/shortcuts.dart';
import 'package:fami_tools/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:riverpod/misc.dart' show FutureProviderFamily;

import '../../business/db_v2_providers.dart';
import '../../business/documents.dart';
import '../msc_thesis_defense/msc_thesis_details.dart';
import 'payment_providers.dart';

class ThesisDefensePaymentPage extends StatelessWidget {
  static const routeName = '/thesis/payment';

  const ThesisDefensePaymentPage({super.key});

  static final tabs = [
    Tab(text: 'Chưa thanh toán'),
    Tab(text: 'Thao tác'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: CommonShortcuts(
        child: Scaffold(
          appBar: ConstrainedAppBar(
            withTabBar: true,
            child: AppBar(
              title: const Text('Thanh toán luận văn'),
              bottom: TabBar(tabs: tabs, isScrollable: true),
            ),
          ),
          body: ConstrainedBody(
            child: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.all(context.gutter),
                  child: _ThesisListView(),
                ),
                _ActionTabView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ThesisListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(studentsProvider);
    switch (studentsAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        return Center(child: Text('Error: $error\n$stackTrace'));
      case AsyncData(:final value):
        final models = value;
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: models.length,
          itemBuilder: (context, index) {
            final model = models[index];
            final student = model.student!;
            final defenseDate = model.thesis.defenseDate?.toDmy(separator: '/');
            String teacherLine(TeacherData? teacher) {
              if (teacher == null) return "N/A";
              return '${teacher.name} - ${teacher.university}';
            }

            TableRow infoRow(String label, String value) {
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.only(right: context.gutterSmall),
                      child: Text(label),
                    ),
                  ),
                  TableCell(child: Text(value)),
                ],
              );
            }

            return InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MscThesisDetailsPage(
                      thesisId: model.thesis.id,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: context.gutterSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: context.gutterSmall,
                  children: [
                    Text(
                      student.name,
                      style: TextTheme.of(context).titleMedium,
                    ),
                    Table(
                      columnWidths: {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.top,
                      children: [
                        infoRow('Ngày bảo vệ:', defenseDate ?? 'Chưa có'),
                        infoRow(
                          'Số QĐ bảo vệ:',
                          model.councilDecisionViewModel?.document.fullLabel ??
                              'N/A',
                        ),
                        infoRow("Chủ tịch", teacherLine(model.president)),
                        infoRow(
                          'Phản biện 1:',
                          teacherLine(model.firstReviewer),
                        ),
                        infoRow(
                          'Phản biện 2:',
                          teacherLine(model.secondReviewer),
                        ),
                        infoRow('Thư ký:', teacherLine(model.secretary)),
                        infoRow('Ủy viên:', teacherLine(model.member)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
    }
  }
}

class _ActionTabView extends StatefulWidget {
  @override
  State<_ActionTabView> createState() => _ActionTabViewState();
}

class _PdfPreviewButton extends ConsumerWidget {
  final ValueNotifier<PdfConfig> configNotifier;
  final FutureProviderFamily<PdfFile, PdfConfig> pdfProvider;
  final String title;

  const _PdfPreviewButton({
    required this.title,
    required this.configNotifier,
    required this.pdfProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder(
      valueListenable: configNotifier,
      builder: (context, value, child) {
        return PdfViewerTile(
          title: Text(title),
          subtitle: Text("Click để xem trước"),
          initialConfig: configNotifier.value,
          onConfigChanged: (config) {
            configNotifier.value = config;
          },
          pdfBuilder: (config) async {
            return await ref.read(pdfProvider(config).future);
          },
        );
      },
    );
  }
}

typedef PdfConfigNotifier = ValueNotifier<PdfConfig>;

class _ActionTabViewState extends State<_ActionTabView> {
  final PdfConfigNotifier requestConfigNotifier = .new(PdfConfig());

  final PdfConfigNotifier atmPdfConfigNotifier = .new(
    PaymentAtmModel.defaultPdfConfig,
  );

  final PdfConfigNotifier listingPdfConfigNotifier = .new(
    PaymentListingModel.defaultPdfConfig,
  );
  final PdfConfigNotifier doubleCheckConfigProvider = .new(PdfConfig());
  final PdfConfigNotifier doubleCheckSummaryConfigProvider = .new(PdfConfig());

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          // Preview section
          FramedSection.withListTile(
            title: "Xem trước",
            children: [
              _PdfPreviewButton(
                title: "Yêu cầu thanh toán",
                configNotifier: doubleCheckConfigProvider,
                pdfProvider: paymentRequestPdfProvider,
              ),
              _PdfPreviewButton(
                title: "Bảng ATM (x2)",
                configNotifier: atmPdfConfigNotifier,
                pdfProvider: paymentAtmPdfProvider,
              ),
              _PdfPreviewButton(
                title: "Bản kê thanh toán",
                configNotifier: listingPdfConfigNotifier,
                pdfProvider: paymentListingPdfProvider,
              ),

              ListTile(
                title: const Text('Quyết định trích tiên'),
                subtitle: const Text('TODO'),
                enabled: false,
              ),
              _PdfPreviewButton(
                title: "Bảng kiểm tra thanh toán",
                configNotifier: doubleCheckConfigProvider,
                pdfProvider: paymentDoubleCheckPdfProvider,
              ),
              _PdfPreviewButton(
                title: "Bảng kiểm tra thanh toán (tổng hợp)",
                configNotifier: doubleCheckSummaryConfigProvider,
                pdfProvider: paymentDoubleCheckSummaryPdfProvider,
              ),
            ],
          ),

          // Save section
          FramedSection(
            title: 'Lưu hồ sơ',
            padding: EdgeInsets.all(context.gutter),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: context.gutter,
              mainAxisSize: MainAxisSize.min,
              children: [
                DirectoryPicker(
                  name: "thanh-toan-lvths",
                  labelText: 'Chọn thư mục lưu hồ sơ',
                ),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Symbols.save),
                  label: const Text('Lưu hồ sơ'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
