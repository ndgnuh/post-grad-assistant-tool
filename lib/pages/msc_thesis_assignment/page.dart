import 'package:fami_tools/business/copy_pasta.dart';
import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/custom_widgets/pdf_preview_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../business/view_models.dart';
import '../msc_thesis_defense/msc_thesis_details.dart';
import 'providers.dart';
import 'selection_page.dart';

export 'selection_page.dart' show MscThesisSelectionPage;

class MscThesisAssignmentPage extends StatelessWidget {
  static const routeName = '/msc/thesis/assignment';
  const MscThesisAssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: Text('Giao đề tài'),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Danh sách'),
                Tab(text: 'Quản trị'),
              ],
            ),
          ),
        ),
        body: ConstrainedBody(
          child: TabBarView(
            children: [
              _ListTabView(),
              _ActionTabView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionTabView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final saveDirectory = useState<String?>(null);

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        verticalDirection: context.verticalDirection,
        spacing: context.gutter,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CohortDropdownMenu(),
          CardSection(
            title: "Gửi học viên",
            children: [
              ListTile(
                title: Text("Thông báo đăng ký đề tài"),
                subtitle: Text("Gửi email thông báo cho học viên"),
              ),
              ListTile(
                title: Text("Nhắc đăng ký đề tài"),
                subtitle: Text("Nhắc nhở đăng ký"),
              ),
            ],
          ),
          CardSection(
            title: "Giấy tờ",
            children: [
              Consumer(
                builder: (context, ref, _) => PdfPreviewTile(
                  pdfFileAsync: ref.watch(assignmentPdfProvider),
                  title: Text("PDF giao đề tài"),
                  subtitle: Text(
                    "ĐT.QT10.BM04. Danh sách đề tài luận văn thạc sĩ (Chính thức)",
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.folder_open),
                title: DirectoryPicker(
                  name: "thesis-assignment-save-directory",
                  labelText: "Chọn thư mục lưu file",
                  onDirectorySelected: (dir) {
                    saveDirectory.value = dir;
                  },
                ),
              ),
              Consumer(
                builder: (context, ref, _) => ListTile(
                  title: Text("Lưu giấy tờ"),
                  subtitle: Text("Lưu mẫu PDF & Excel giao đề tài"),
                  enabled: saveDirectory.value != null,
                  onTap: () async {
                    final directory = saveDirectory.value!;
                    final assignmentPdf = await ref.read(
                      assignmentPdfProvider.future,
                    );
                    final assignmentExcel = await ref.read(
                      assignmentXlsxProvider.future,
                    );

                    if (assignmentPdf == null || assignmentExcel == null) {
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text('Không có file PDF để lưu.'),
                        ),
                      );
                      return;
                    }

                    assignmentPdf.save(directory: directory);
                    assignmentExcel.save(directory: directory);
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text('Đã lưu file vào $directory'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          CardSection(
            title: "Email",
            children: [
              _EmailToSupervisorsButton(),

              Consumer(
                builder: (context, ref, _) => ListTile(
                  title: Text("Gửi email cho BĐT"),
                  subtitle: Text("Gửi file giao đề tài cho BĐT"),
                  onTap: () async {
                    final email = await ref.read(
                      assignmentProcessingEmailProvider.future,
                    );
                    if (email == null) {
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text('Vui lòng chọn khóa học viên.'),
                        ),
                      );
                      return;
                    }

                    await showDialog(
                      context: context,
                      builder: (context) => EmailCopyDialog(
                        email: email,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmailToSupervisorsButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailAsync = ref.watch(supervisorsEmailProvider);
    switch (emailAsync) {
      case AsyncLoading():
        return ListTile(
          title: Text("Gửi email cho giảng viên hướng dẫn"),
          subtitle: Text("Đang tải thông tin email..."),
          enabled: false,
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text("Gửi email cho giảng viên hướng dẫn"),
          subtitle: ErrorWidget(error),
          enabled: false,
        );
      default:
    }

    final email = emailAsync.value!;

    return ListTile(
      title: Text("Gửi email cho giảng viên hướng dẫn"),
      subtitle: Text("Gửi file giao đề tài cho giảng viên hướng dẫn"),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => EmailCopyDialog(email: email),
        );
      },
    );
  }
}

class _ListTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        verticalDirection: context.verticalDirection,
        spacing: context.gutter,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CohortDropdownMenu(),
          Expanded(
            child: StudentThesisListView(),
          ),
        ],
      ),
    );
  }
}

class StudentThesisListView extends ConsumerWidget {
  const StudentThesisListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentIdsAsync = ref.watch(studentIdsProvider);
    switch (studentIdsAsync) {
      case AsyncLoading():
        return Center(
          child: CircularProgressIndicator(),
        );
      case AsyncError(:final error):
        return Center(
          child: Text('Đã có lỗi xảy ra: $error'),
        );
      default:
    }

    final ids = studentIdsAsync.value;
    if (ids == null) {
      return Center(
        child: Text('Vui lòng chọn khóa học viên để xem danh sách.'),
      );
    }

    if (ids.isEmpty) {
      return Center(
        child: Text('Không có học viên nào trong khóa học này.'),
      );
    }

    return ListView.separated(
      itemCount: ids.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final studentId = ids[index];
        return StudentThesisItem(
          key: ValueKey(studentId),
          studentId: studentId,
        );
      },
    );
  }
}

class StudentThesisItem extends ConsumerWidget {
  final int studentId;
  const StudentThesisItem({super.key, required this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(StudentViewModel.providerById(studentId));
    switch (modelAsync) {
      case AsyncLoading():
        return ListTile(
          title: Text('Loading student ID: $studentId'),
          subtitle: LinearProgressIndicator(),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text('Error loading student ID: $studentId'),
          subtitle: Text('Error: $error'),
        );
      default:
    }

    final model = modelAsync.value!;
    final supervisor = model.supervisor;
    final secondarySupervisor = model.secondarySupervisor;
    final thesis = model.thesis;
    final student = model.student;
    final subtitle = [
      thesis?.vietnameseTitle ?? 'Chưa có đề tài',
      if (supervisor != null) 'Giảng viên hướng dẫn: ${supervisor.name}',
      if (secondarySupervisor != null)
        'Giảng viên hướng dẫn 2: ${secondarySupervisor.name}',
    ].join('\n');

    void goToAssignPage() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MscThesisSelectionPage(
            studentId: studentId,
          ),
        ),
      );
    }

    void goToDetailsPage() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MscThesisDetailsPage(
            thesisId: thesis!.id,
          ),
        ),
      );
    }

    return ListTile(
      title: Text(student.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Symbols.numbers),
          Text(student.studentId ?? "N/A"),
          Icon(Symbols.chevron_right),
        ],
      ),
      subtitle: Text(subtitle),
      onTap: () async {
        if (thesis == null) {
          goToAssignPage();
        } else {
          goToDetailsPage();
        }
      },
    );
  }
}

class CohortDropdownMenu extends ConsumerWidget {
  const CohortDropdownMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(cohortSelectionProvider);

    final List<CohortData> options = modelAsync.maybeWhen(
      data: (model) => model.options,
      orElse: () => [],
    );

    final CohortData? selected = modelAsync.maybeWhen(
      data: (model) => model.selected,
      orElse: () => null,
    );

    // Placeholder for the actual dropdown menu implementation
    return DropdownMenu<CohortData>(
      label: const Text('Khóa học viên'),
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: [
        for (final option in options)
          DropdownMenuEntry(
            value: option,
            label: option.id,
          ),
      ],
      initialSelection: selected,
      onSelected: (CohortData? cohort) {
        ref.read(cohortSelectionProvider.notifier).select(cohort);
      },
    );
  }
}
