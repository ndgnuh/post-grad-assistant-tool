import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../business/drift_orm.dart';
import '../../custom_widgets.dart';
import './common.providers.dart';
import './index.dart';

Widget Function(BuildContext, bool) _simpleExpansionHeading(String text) {
  Widget buildHeading(context, isExpanded) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorScheme.of(context).primary,
        ),
      ),
    );
  }

  return buildHeading;
}

class AdmissionListTabView extends ConsumerStatefulWidget {
  const AdmissionListTabView({super.key});

  @override
  ConsumerState<AdmissionListTabView> createState() =>
      _AdmissionListTabViewState();
}

class _AdmissionListTabViewState extends ConsumerState<AdmissionListTabView> {
  List<bool> expansionState = [true, true];

  @override
  Widget build(BuildContext context) {
    final modelState = ref.watch(admissionListViewModelProvider);
    switch (modelState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return const Center(child: Text("Lỗi tải dữ liệu."));
      default:
    }

    final model = modelState.value!;
    final admissionList = model.admissionList;
    final delayedList = model.delayedList;

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          ExpansionPanelList(
            expansionCallback: expansionCallback,
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: expansionState[0],
                headerBuilder: _simpleExpansionHeading(
                  "Ứng viên (${admissionList.length})",
                ),
                body: ListBody(
                  children: [
                    for (final (i, student) in admissionList.indexed) ...[
                      _StudentTile(index: i, student: student),
                    ],
                  ],
                ),
              ),
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: expansionState[1],
                headerBuilder: _simpleExpansionHeading(
                  "Tạm hoãn  (${delayedList.length})",
                ),
                body: ListBody(
                  children: [
                    for (final (i, student) in delayedList.indexed) ...[
                      _StudentTile(index: i, student: student),
                    ],
                  ],
                ),
              ),
            ],
          ),
          // EzRow(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     CouncilSelector(),
          //     VerticalDivider(),
          //     Expanded(
          //       child: _SaveDirectoryPicker(),
          //     ),
          //     _ProfileDownloadButton(
          //       controller: saveDirectoryController,
          //     ),
          //     _SavePaperworkButton(
          //       controller: saveDirectoryController,
          //     ),
          //     VerticalDivider(),
          //     _ImportButton(),
          //     _AddButton(),
          //     _CopyButton(),
          //     VerticalDivider(),
          //     _PaymentButton(),
          //   ],
          // ),
          // Divider(),
          // EzRow(
          //   spacing: context.gutter,
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Expanded(child: _InterviewLocationEdit()),
          //     Expanded(flex: 2, child: _InterviewDatePicker()),
          //     _InterviewEmailButton(),
          //     VerticalDivider(),
          //     Expanded(child: _EnrollGroupLinkEdit()),
          //     _EnrollEmailButton(),
          //     VerticalDivider(),
          //     _DelayButton(),
          //     OutlinedButton(onPressed: null, child: Text("Sửa")),
          //     _EnrollButton(),
          //   ],
          // ),
          // Divider(),
          // Expanded(child: _AdmissionTableView()),
        ],
      ),
    );
  }

  void expansionCallback(int panelIndex, bool isExpanded) {
    setState(() {
      expansionState[panelIndex] = isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    ref.read(admissionListViewModelProvider);
  }
}

class _StudentTile extends ConsumerWidget {
  final int index;

  final StudentData student;
  const _StudentTile({
    required this.index,
    required this.student,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final subtitleLines = [
      if (student.personalEmail != null) student.personalEmail!,
      if (student.phone != null) student.phone.toString(),
      student.admissionType.toString(),
    ];
    return ListTile(
      key: ValueKey(student.id),
      leading: SizedBox.square(
        dimension: context.gutterLarge,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: BoxBorder.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),

            borderRadius: BorderRadius.circular(
              context.gutter,
            ),
          ),
          child: Center(
            child: Text(
              "${index + 1}",
              style: textTheme.labelLarge,
            ),
          ),
        ),
      ),
      title: Text(student.name),
      subtitle: Text(subtitleLines.join("\n")),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("#${student.admissionId}"),
          Icon(Symbols.chevron_right),
        ],
      ),
      onTap: () => showPerStudentActions(context, ref),
    );
  }

  void showPerStudentActions(BuildContext context, WidgetRef ref) {
    final navigator = Navigator.of(context);
    showDialog(
      context: context,
      builder: (context) => MenuDialog(
        items: [
          MenuDialogItem(
            title: "Chi tiết",
            onTap: null,
            icon: Symbols.info,
          ),

          MenuDialogItem(
            title: "Hoãn/tiếp tục xét tuyển",
            onTap: () async {
              final notifier = ref.read(
                studentMutationProvider(student.id).notifier,
              );
              notifier.playPauseAdmission();
            },
            icon: Symbols.play_pause,
          ),

          MenuDialogItem(
            title: "Nhập học",
            icon: Symbols.school,
            onTap: () {
              navigator.push(
                MaterialPageRoute(
                  builder: (context) => AdmissionEnrollmentPage(
                    studentId: student.id,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // End of widget
}
