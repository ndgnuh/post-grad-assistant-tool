import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/custom_widgets/pdf_viewer.dart';
import 'package:fami_tools/shortcuts.dart';
import 'package:fami_tools/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:signals/signals_flutter.dart'
    show FlutterReadonlySignalUtils, SignalsMixin, Watch, signal;

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
                          model.thesis.defenseDecisionNumber ?? 'N/A',
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

class _ActionTabViewState extends State<_ActionTabView> with SignalsMixin {
  final atmPdfConfig = signal(PaymentAtmModel.defaultPdfConfig);

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
              PdfViewerTile(
                title: Text("Đề nghị thanh toán"),
                pdfBuilder: (config) async {
                  final ref = ProviderScope.containerOf(context);
                  return ref.read(paymentRequestPdfProvider(config).future);
                },
              ),
              Watch(
                (context) => PdfViewerTile(
                  title: Text("Bảng tổng hợp ATM (x2)"),
                  subtitle: Text("Click để xem trước"),
                  initialConfig: atmPdfConfig.value,
                  onConfigChanged: (PdfConfig config) {
                    atmPdfConfig.value = config;
                  },
                  pdfBuilder: (PdfConfig config) async {
                    final ref = ProviderScope.containerOf(context);
                    return await ref.read(paymentAtmPdf(config).future);
                  },
                ),
              ),
              ListTile(
                title: const Text('Bản kê thanh toán'),
                subtitle: const Text('TODO'),
                enabled: false,
              ),
              ListTile(
                title: const Text('Quyết định trích tiên'),
                subtitle: const Text('TODO'),
                enabled: false,
              ),
              ListTile(
                title: const Text('Bảng kiểm tra'),
                subtitle: const Text('TODO'),
                enabled: false,
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
