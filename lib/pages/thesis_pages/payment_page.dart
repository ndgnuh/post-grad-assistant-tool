import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/custom_widgets/pdf_viewer.dart';
import 'package:fami_tools/shortcuts.dart';
import 'package:fami_tools/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../business/documents.dart';
import '../document_pages/document_pages.dart';
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
  final NotifierProvider<StateNotifier<PdfConfig>, PdfConfig> configProvider;
  final FutureProvider<PdfFile> pdfProvider;
  final String title;

  const _PdfPreviewButton({
    required this.title,
    required this.configProvider,
    required this.pdfProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configNotifier = ref.watch(configProvider.notifier);
    // final pdfFileAsync = ref.watch(pdfProvider);

    // switch (pdfFileAsync) {
    //   case AsyncLoading():
    //     return ListTile(
    //       title: Text(title),
    //       subtitle: Text("Đang tải..."),
    //     );
    //
    //   case AsyncError(:final error, :final stackTrace):
    //     return ListTile(
    //       title: Text(title),
    //       subtitle: Text('Lỗi khi tải PDF: $error\n$stackTrace'),
    //     );
    //   default:
    // }
    // final pdfFile = pdfFileAsync.value!;

    return ListTile(
      title: Text(title),
      subtitle: Text("Click để xem trước"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewerPage(
              pdfProvider: pdfProvider,
              onConfigChanged: (PdfConfig config) {
                configNotifier.set(config);
              },
            ),
          ),
        );
      },
    );
  }
}

typedef PdfConfigNotifier = ValueNotifier<PdfConfig>;

class _ActionTabViewState extends State<_ActionTabView> {
  final saveDirectoryNotifier = ValueNotifier<String?>(null);

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
                configProvider: paymentRequestPdfConfigProvider,
                pdfProvider: paymentRequestPdfProvider,
              ),
              _PdfPreviewButton(
                title: "Bảng ATM (x2)",
                configProvider: paymentAtmPdfConfigProvider,
                pdfProvider: paymentAtmPdfProvider,
              ),
              _PdfPreviewButton(
                title: "Bản kê thanh toán",
                configProvider: paymentListingPdfConfigProvider,
                pdfProvider: paymentListingPdfProvider,
              ),

              // ListTile(
              //   title: const Text('Quyết định trích tiên'),
              //   subtitle: const Text('TODO'),
              //   enabled: false,
              // ),
              _PdfPreviewButton(
                title: "Bảng kiểm tra thanh toán",
                configProvider: paymentDoubleCheckPdfConfigProvider,
                pdfProvider: paymentDoubleCheckPdfProvider,
              ),
              _PdfPreviewButton(
                title: "Bảng kiểm tra thanh toán (tổng hợp)",
                pdfProvider: paymentDoubleCheckSummaryPdfProvider,
                configProvider: paymentDoubleCheckSummaryPdfConfigProvider,
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
                  onDirectorySelected: (saveDirectory) {
                    saveDirectoryNotifier.value = saveDirectory;
                  },
                ),
                _SaveButton(
                  saveDirectoryNotifier: saveDirectoryNotifier,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  final ValueNotifier<String?> saveDirectoryNotifier;

  const _SaveButton({required this.saveDirectoryNotifier});

  void save(
    BuildContext context,
    WidgetRef ref,
    List<InMemoryDocument> documents,
  ) {
    final saveDirectory = saveDirectoryNotifier.value;
    final messenger = ScaffoldMessenger.of(context);
    if (saveDirectory == null) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn thư mục lưu hồ sơ trước khi lưu'),
        ),
      );
    }

    messenger.showSnackBar(
      const SnackBar(
        content: Text('Đang lưu'),
      ),
    );

    for (final document in documents) {
      document.save(directory: saveDirectory!);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          content: Text('Đã lưu ${document.fileName} vào $saveDirectory'),
        ),
      );
    }

    // final docx = await ref.read(paymentSpendingDecisionDocxProvider.future);
    // docx.save(directory: saveDirectory!);
    messenger.showSnackBar(
      SnackBar(
        content: Text('Đã lưu hồ sơ vào $saveDirectory'),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDocumentsAsync = ref.watch(allDocumentsProvider);

    final (title, ok) = switch (allDocumentsAsync) {
      AsyncLoading() => ("Đang chuẩn bị hồ sơ...", false),
      AsyncError(:final error) => ("Lỗi khi chuẩn bị hồ sơ: $error", false),
      _ => ("Lưu hồ sơ", true),
    };

    final onPressed = switch (ok) {
      false => null,
      true => () => save(context, ref, allDocumentsAsync.value!),
    };

    return FilledButton.icon(
      onPressed: onPressed,
      icon: const Icon(Symbols.save),
      label: Text(title),
    );
  }
}
