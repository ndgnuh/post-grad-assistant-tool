import 'dart:math';

import 'package:fami_tools/business/db_v1_providers/thesis.dart';
import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/copy_pasta.dart' as copy_pasta;
import '../../business/copy_pasta.dart';
import '../../business/drift_orm.dart';
import '../../custom_widgets.dart';
import '../multiple_selection_page.dart';
import './_download.dart';
import './_forms.dart';
import './_widgets.dart';
import './common.providers.dart';
import './index.dart';
import 'list.list_tab.dart';

part 'list.action_tab.dart';
part 'list.procedure_tab.dart';

final _cohortGroupLinkController = TextEditingController(text: "");

final _interviewLocationController = TextEditingController(text: "");

final _interviewTimeProvider = NotifierProvider(_InterviewDate.new);

/// Create a heading for expansion panel
Widget Function(BuildContext, bool) _simpleExpansionHeading(String text) {
  Widget buildHeading(context, isExpanded) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  return buildHeading;
}

class AdmissionListPage extends StatelessWidget {
  static const routeName = "/admission/list";

  const AdmissionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Danh sách"),
              Tab(text: "Hành động"),
              Tab(text: "Quy trình"),
            ],
          ),
          title: const Text("Xét tuyển"),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Center(
            child: SizedBox(
              width: min(width, 960),
              child: TabBarView(
                children: [
                  AdmissionListTabView(),
                  _AdmissionActionTabView(),
                  _AdmissionProcedureTabView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class PageAdmissionDetail extends StatefulWidget {
//   static const routeName = "/admission/detail";
//   final HocVien admission;
//
//   const PageAdmissionDetail({
//     super.key,
//     required this.admission,
//   });
//
//   @override
//   State<PageAdmissionDetail> createState() => _PageAdmissionDetailState();
// }

// class _AdmissionTableView extends ConsumerWidget {
//   static const columns = [
//     DataColumn(label: Text("Trạng thái")),
//     DataColumn(label: Text("Mã hồ sơ")),
//     DataColumn(label: Text("Họ và tên")),
//     DataColumn(label: Text("Diện tuyển sinh")),
//     DataColumn(label: Text("Giới tính")),
//     DataColumn(label: Text("Ngày sinh")),
//     DataColumn(label: Text("Nơi sinh")),
//     DataColumn(label: Text("Email")),
//     DataColumn(label: Text("Số điện thoại")),
//     DataColumn(label: Text("Trường TN đại học")),
//     DataColumn(label: Text("Ngành TN đại học")),
//     DataColumn(label: Text("Hệ TN đại học")),
//     DataColumn(label: Text("Ngày TN đại học")),
//     DataColumn(label: Text("Hạng TN đại học")),
//     DataColumn(label: Text("Ngành thạc sĩ")),
//     DataColumn(label: Text("Định hướng chuyên sâu")),
//     DataColumn(label: Text("Học phần miễn")),
//   ];
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final studentState = ref.watch(admissionStudentsProvider);
//     switch (studentState) {
//       case AsyncLoading():
//         return const Center(child: CircularProgressIndicator());
//       case AsyncError():
//         return const Center(child: Text("Lỗi tải dữ liệu."));
//       default:
//     }
//
//     final selectedId = ref.watch(_selectedIdxProvider);
//     final students = studentState.value!;
//
//     return ExpandedScrollView(
//       child: DataTable(
//         columns: columns,
//         columnSpacing: context.gutter,
//         showCheckboxColumn: true,
//         rows: [
//           for (final (idx, student) in students.indexed)
//             DataRow(
//               selected: selectedId.contains(idx),
//               onSelectChanged: (selected) {
//                 final notifier = ref.read(
//                   _selectedIdxProvider.notifier,
//                 );
//                 if (selected == true) {
//                   notifier.select(idx);
//                 } else {
//                   notifier.deselect(idx);
//                 }
//               },
//               cells: [
//                 DataCell(Text(student.trangThai.toString())),
//                 DataCell(Text(student.soHoSo ?? "N/A")),
//                 DataCell(Text(student.hoTen)),
//                 DataCell(Text(student.dienTuyenSinh?.label ?? "N/A")),
//                 DataCell(Text(student.gioiTinh?.label ?? "N/A")),
//                 DataCell(Text(student.ngaySinh?.toDmy() ?? "N/A")),
//                 DataCell(Text(student.noiSinh ?? "N/A")),
//                 DataCell(Text(student.email ?? "N/A")),
//                 DataCell(Text(student.dienThoai ?? "N/A")),
//                 DataCell(Text(student.truongTotNghiepDaiHoc ?? "N/A")),
//                 DataCell(Text(student.nganhTotNghiepDaiHoc ?? "N/A")),
//                 DataCell(Text(student.heTotNghiepDaiHoc ?? "N/A")),
//                 DataCell(
//                   Text(student.ngayTotNghiepDaiHoc?.toDmy() ?? "N/A"),
//                 ),
//                 DataCell(Text(student.xepLoaiTotNghiepDaiHoc ?? "N/A")),
//                 DataCell(Text(student.nganhDaoTaoThacSi ?? "N/A")),
//                 DataCell(Text(student.dinhHuongChuyenSau ?? "N/A")),
//                 DataCell(Text(student.hocPhanDuocMien ?? "N/A")),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }

// class _CopyButton extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final actions = _PageActions(context, ref);
//
//     return OutlinedButton.icon(
//       icon: Icon(Symbols.content_copy),
//       label: Text("Sao chép"),
//       onPressed: () {
//         showDialog(
//           context: context,
//           builder: (context) => MenuDialog(
//             items: [
//               // MenuDialogItem(
//               //   title: "Email (tất cả)",
//               //   onTap: actions.copyEmailAll,
//               // ),
//               // MenuDialogItem(
//               //   title: "Email (tích hợp)",
//               //   onTap: actions.copyEmailDirectAdmission,
//               // ),
//               // MenuDialogItem(
//               //   title: "Email (phỏng vấn)",
//               //   onTap: actions.copyEmailInterviewAdmission,
//               // ),
//
//               // Thông báo trúng tuyển, phỏng vấn, etc.
//               MenuDialogDivider(),
//               MenuDialogItem(
//                 title: "Thông báo phỏng vấn",
//                 onTap: actions.copyInterviewInvitation,
//               ),
//               MenuDialogItem(
//                 title: "Thông báo trúng tuyển",
//                 onTap: actions.copyEnrollmentConfirmation,
//               ),
//
//               // Báo trượt
//               MenuDialogDivider(),
//               MenuDialogItem(
//                 title: "Thông báo sai diện tuyển sinh",
//                 icon: null,
//                 onTap: actions.copyWrongCategoryEmail,
//               ),
//               MenuDialogItem(
//                 title: "Thông báo không đủ điều kiện",
//                 icon: null,
//                 onTap: actions.copyAdmissionRejection,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// TODO: reword as popup for each student
// class _DelayButton extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final messenger = ScaffoldMessenger.of(context);
//
//     return OutlinedButton(
//       onPressed: () async {
//         final students = await ref.watch(_selectedAdmissionsProvider.future);
//         final count = students.length;
//
//         for (final student in students) {
//           final notifier = ref.read(studentByIdProvider(student.id).notifier);
//           switch (student.trangThai) {
//             case TrangThaiHocVien.xetTuyenTriHoan:
//               await notifier.updateStatus(TrangThaiHocVien.xetTuyen);
//             default:
//               await notifier.updateStatus(TrangThaiHocVien.xetTuyenTriHoan);
//           }
//         }
//
//         ref.invalidate(activeAdmissionStudentsProvider);
//
//         messenger.showSnackBar(
//           SnackBar(
//             content: Text("Đã cập nhật trạng thái xét tuyển $count học viên."),
//           ),
//         );
//       },
//       child: Text("Hoãn"),
//     );
//   }
// }

// class _EnrollButton extends ConsumerWidget {
//   final int studentUid; // ID of student
//   final Widget Function(BuildContext context, VoidCallback onPressed) builder;
//
//   const _EnrollButton({required this.studentUid, required this.builder});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final navigator = Navigator.of(context);
//
//     void callback() async {
//       final route = MaterialPageRoute(
//         builder: (context) => AdmissionEnrollmentPage(studentId: studentUid),
//       );
//
//       await navigator.push(route);
//     }
//
//     return builder(context, callback);
//   }
// }

// class _EnrollEmailButton extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final actions = _PageActions(context, ref);
//     return FilledButton.icon(
//       icon: Icon(Symbols.email),
//       label: Text("Email trúng tuyển"),
//       onPressed: actions.copyEnrollmentConfirmation,
//     );
//   }
// }

// class _EnrollGroupLinkEdit extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         labelText: "Link nhóm học viên",
//       ),
//       controller: _cohortGroupLinkController,
//     );
//   }
// }

class _InterviewDate extends Notifier<DateTime> {
  @override
  DateTime build() => DateTime.now();

  Future<void> pick(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: state,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selectedDate == null) return;

    final selectedTime = await showTimePicker(
      // ignore: use_build_context_synchronously
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime == null) return;

    state = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );
  }
}

// class _InterviewDatePicker extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final interviewDate = ref.watch(_interviewTimeProvider);
//     final interviewDateNotifier = ref.watch(_interviewTimeProvider.notifier);
//     final dateString = DateFormat('HH:mm dd/MM/yyyy').format(interviewDate);
//     final controller = TextEditingController(text: dateString);
//
//     // pick date on focus
//     final focusNode = FocusNode();
//     focusNode.addListener(() async {
//       if (focusNode.hasFocus) {
//         focusNode.unfocus();
//         await interviewDateNotifier.pick(context);
//       }
//     });
//
//     return TextField(
//       decoration: InputDecoration(
//         labelText: "Thời gian phỏng vấn",
//       ),
//       focusNode: focusNode,
//       controller: controller,
//     );
//   }
// }

// class _InterviewEmailButton extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final actions = _PageActions(context, ref);
//     return FilledButton.icon(
//       onPressed: actions.copyInterviewInvitation,
//       icon: Icon(Symbols.email),
//       label: Text("Email phỏng vấn"),
//     );
//   }
// }

// class _InterviewLocation extends Notifier<String> {
//   @override
//   String build() => "";
//
//   void set(String location) => state = location;
// }
//
// class _InterviewLocationEdit extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return TextField(
//       decoration: InputDecoration(
//         labelText: "Địa điểm phỏng vấn",
//       ),
//       controller: _interviewLocationController,
//     );
//   }
// }

/// Actions that can be performed on the page.
class _PageActions {
  BuildContext context;
  WidgetRef ref;

  _PageActions(this.context, this.ref);

  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(context);
  NavigatorState get navigator => Navigator.of(context);

  void copyAdmissionRejection() async {
    final candidateName = await showDialog<String>(
      context: context,
      builder: (context) => TextEditingDialog(
        title: "Nhập tên ứng viên",
        initialText: "",
        keyboardType: TextInputType.text,
      ),
    );

    if (candidateName == null || candidateName.isEmpty) {
      return;
    }

    final selectionPage = MultipleSelectionPage<AdmissionCondition>(
      title: "Chọn lý do không đủ điều kiện",
      options: AdmissionCondition.values,
      subtitleBuilder: <T>(condition) => Text(condition.description),
      titleBuilder: <T>(condition) => Text(condition.unmetDescription),
    );

    final failedReasons = await navigator.push<Set<AdmissionCondition>?>(
      MaterialPageRoute(
        builder: (context) => selectionPage,
      ),
    );
    if (failedReasons == null || failedReasons.isEmpty) {
      return;
    }

    copy_pasta.copyAdmissionRejection(
      candidateName: candidateName,
      unmetConditions: failedReasons.toList(),
    );
  }

  // void copyEmail(List<HocVien> admissionList) {
  //   final emails = admissionList
  //       .map((ad) => ad.email ?? "")
  //       .where((email) => email.isNotEmpty)
  //       .join("\n");
  //
  //   copyToClipboard(
  //     context: context,
  //     text: emails,
  //     notification:
  //         "Đã sao chép ${admissionList.length} email(s) vào clipboard.",
  //   );
  // }
  //
  // Future<void> copyEmailAll() async {
  //   final students = await ref.read(admissionStudentsProvider.future);
  //   copyEmail(students);
  // }
  //
  // Future<void> copyEmailDirectAdmission() async {
  //   final students = await ref.read(directAdmissionStudentsProvider.future);
  //   copyEmail(students);
  // }
  //
  // Future<void> copyEmailInterviewAdmission() async {
  //   final students = await ref.read(interviewAdmissionStudentsProvider.future);
  //   copyEmail(students);
  // }

  /// Copy email thông báo trúng tuyển
  // Future<void> copyEnrollmentConfirmation() async {
  //   final students = await ref.read(admissionStudentsProvider.future);
  //   final recipients = [for (final student in students) student.email!];
  //   final cohortGroupLink = _cohortGroupLinkController.text;
  //   final email = enrollmentConfirmationEmail(
  //     recipients: recipients.toSet(),
  //     cohortGroupLink: cohortGroupLink,
  //   );
  //
  //   await showDialog(
  //     // ignore: use_build_context_synchronously
  //     context: context,
  //     builder: (context) => EmailCopyDialog(email: email),
  //   );
  // }

  /// Copy email mời phỏng vấn
  // Future<void> copyInterviewInvitation() async {
  //   final studentIds = await ref.read(admissionStudentIdsProvider.future);
  //
  //   final time = ref.read(_interviewTimeProvider);
  //   final location = _interviewLocationController.text;
  //   final recipients = [for (final student in students) student.email!];
  //   final email = interviewInvitationEmail(
  //     time: time,
  //     location: location,
  //     recipients: recipients.toSet(),
  //   );
  //   await showDialog(
  //     // ignore: use_build_context_synchronously
  //     context: context,
  //     builder: (context) => EmailCopyDialog(email: email),
  //   );
  // }

  void copyWrongCategoryEmail() async {
    final candidateName = await showDialog<String>(
      context: context,
      builder: (context) => TextEditingDialog(
        title: "Nhập tên ứng viên",
      ),
    );

    if (candidateName == null || candidateName.isEmpty) {
      return;
    }

    copyAdmissionWrongCategory(
      candidateName: candidateName,
    );
  }

  Future<void> getStudents(AdmissionType? admissionType) async {
    await ref.read(admissionStudentIdsProvider.future);
  }
}

// class _PageAdmissionDetailState extends State<PageAdmissionDetail> {
//   ValueNotifier<String> studentIdNotifier = ValueNotifier<String>("");
//   ValueNotifier<String> studentEmailNotifier = ValueNotifier<String>("");
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final colorScheme = Theme.of(context).colorScheme;
//
//     Widget mkHeadline(String text) {
//       return ListTile(
//         title: Text(
//           text,
//           style: textTheme.headlineSmall?.copyWith(
//             color: colorScheme.primary,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         subtitle: Divider(
//           color: colorScheme.primary,
//         ),
//       );
//     }
//
//     final messenger = ScaffoldMessenger.of(context);
//     final navigator = Navigator.of(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Chi tiết xét tuyển"),
//       ),
//       body: ListView(
//         children: [
//           mkHeadline("Thông tin cơ bản"),
//           ListTile(
//             title: const Text("Số hồ sơ"),
//             subtitle: Text(widget.admission.soHoSo ?? "N/A"),
//           ),
//           ListTile(
//             title: const Text("Họ tên"),
//             subtitle: Text(widget.admission.hoTen),
//           ),
//           ListTile(
//             title: const Text("Quê quán"),
//             subtitle: Text(widget.admission.noiSinh ?? "N/A"),
//           ),
//           ListTile(
//             title: const Text("Ngày sinh"),
//             subtitle: Text(
//               widget.admission.ngaySinh?.toIso8601String() ?? "N/A",
//             ),
//           ),
//           ListTile(
//             title: const Text("Giới tính"),
//             subtitle: Text(widget.admission.gioiTinh?.label ?? "N/A"),
//           ),
//
//           // Thông tin liên hệ
//           mkHeadline("Thông tin liên hệ"),
//           ListTile(
//             title: const Text("Email"),
//             subtitle: Text(widget.admission.email ?? "N/A"),
//           ),
//           ListTile(
//             title: const Text("Điện thoại"),
//             subtitle: Text(widget.admission.dienThoai ?? "N/A"),
//           ),
//
//           // Thông tin học vấn
//           mkHeadline("Thông tin học vấn"),
//           ListTile(
//             title: const Text("Trường đại học"),
//             subtitle: Text(widget.admission.truongTotNghiepDaiHoc ?? "N/A"),
//           ),
//           ListTile(
//             title: const Text("Ngành học đại học"),
//             subtitle: Text(widget.admission.nganhTotNghiepDaiHoc ?? "N/A"),
//           ),
//           ListTile(
//             title: const Text("Hệ tốt nghiệp đại học"),
//             subtitle: Text(widget.admission.heTotNghiepDaiHoc ?? " N/A"),
//           ),
//           ListTile(
//             title: const Text("Ngày tốt nghiệp đại học"),
//             subtitle: Text(
//               widget.admission.ngayTotNghiepDaiHoc?.toIso8601String() ?? "N/A",
//             ),
//           ),
//
//           // Thông tin tuyển sinh
//           mkHeadline("Thông tin tuyển sinh"),
//           ListTile(
//             title: const Text("Ngành tuyển sinh thạc sĩ"),
//             subtitle: Text(widget.admission.nganhDaoTaoThacSi ?? "N/A"),
//           ),
//           ListTile(
//             title: const Text("Diện tuyển sinh"),
//             subtitle: Text(
//               widget.admission.dienTuyenSinh?.label ?? "Không xác định",
//             ),
//           ),
//           ListTile(
//             title: const Text("Học phần được miễn"),
//             subtitle: Text(widget.admission.hocPhanDuocMien ?? "N/A"),
//           ),
//           ListTile(
//             title: const Text("Trạng thái hồ sơ"),
//             subtitle: Text(widget.admission.trangThai?.label ?? "N/A"),
//           ),
//
//           // Nhập học
//           mkHeadline("Thông tin nhập học"),
//           ValueListenableBuilder(
//             valueListenable: studentEmailNotifier,
//             builder: (context, value, _) => ListTile(
//               title: Text("Email học viên"),
//               subtitle: Text(value),
//               onTap: () async {
//                 final newValue = await showDialog<String>(
//                   context: context,
//                   builder: (context) => TextEditingDialog(
//                     title: "email học viên",
//                     initialText: value,
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                 );
//
//                 switch (newValue) {
//                   case String newValue:
//                     // Update the admission's email
//                     studentEmailNotifier.value = newValue;
//                 }
//               },
//             ),
//           ),
//           ValueListenableBuilder(
//             valueListenable: studentIdNotifier,
//             builder: (context, value, _) => ListTile(
//               title: Text("Mã học viên"),
//               subtitle: Text(value),
//               onTap: () async {
//                 final newValue = await showDialog<String>(
//                   context: context,
//                   builder: (context) => TextEditingDialog(
//                     title: "Nhập mã học viên",
//                     initialText: value,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(
//                         RegExp(r'^[M0-9]+$'),
//                       ),
//                     ],
//                   ),
//                 );
//
//                 switch (newValue) {
//                   case String newValue:
//                     studentIdNotifier.value = newValue;
//                 }
//               },
//             ),
//           ),
//
//           // Nút nhập học
//           ListTile(
//             title: FilledButton(
//               onPressed: () async {
//                 // Validate the admission status
//                 final studentEmail = studentEmailNotifier.value;
//                 final studentId = studentIdNotifier.value;
//
//                 // validate email
//                 if (studentEmail.isEmpty) {
//                   messenger.showSnackBar(
//                     const SnackBar(
//                       content: Text("Vui lòng nhập email học viên."),
//                     ),
//                   );
//                   return;
//                 }
//
//                 // Validate student ID
//                 if (studentId.isEmpty) {
//                   messenger.showSnackBar(
//                     const SnackBar(
//                       content: Text("Vui lòng nhập mã học viên."),
//                     ),
//                   );
//                   return;
//                 }
//
//                 // Validate class of year
//
//                 // Confirm first
//                 final confirm = await showDialog<bool>(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: const Text("Xác nhận nhập học"),
//                     content: Text(
//                       """Bạn có chắc chắn muốn nhập học cho học viên này?
// hồ sơ sẽ được gỡ khỏi danh sách xét tuyển""",
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context, false),
//                         child: const Text("Hủy"),
//                       ),
//                       TextButton(
//                         onPressed: () => Navigator.pop(context, true),
//                         child: const Text("Xác nhận"),
//                       ),
//                     ],
//                   ),
//                 );
//
//                 // If confirmed, proceed with enrollment
//                 if (confirm == null || confirm == false) return;
//
//                 // Update in the database
//                 final student = widget.admission.copyWith(
//                   maHocVien: studentId,
//                   emailHust: studentEmail,
//                   maTrangThai: TrangThaiHocVien.dangHoc,
//                 );
//                 student.update();
//
//                 // Go back to the list page
//                 navigator.pop();
//               },
//               child: const Text("Nhập học"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _PaymentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(Symbols.payment),
      label: Text("Thanh toán"),
      onPressed: null,
    );
  }
}

// class _AdmissionListView extends StatelessWidget {
//   final List<HocVien> admissionList;
//
//   const _AdmissionListView({required this.admissionList});
//
//   @override
//   Widget build(BuildContext context) {
//     final state = Provider.of<_State>(context, listen: false);
//
//     final valueNotifiers = [
//       for (var admission in admissionList) ValueNotifier<HocVien>(admission),
//     ];
//
//     return ListView.builder(
//       itemCount: admissionList.length,
//       itemBuilder: (context, index) {
//         final admission = admissionList[index];
//         final subtitle = [
//           "Số hồ sơ: ${admission.soHoSo}",
//           "Email: ${admission.email}",
//           "Điện thoại: ${admission.dienThoai}",
//           "Diện tuyển sinh: ${admission.dienTuyenSinh?.label}",
//         ].join("\n");
//         return ValueListenableBuilder(
//           valueListenable: valueNotifiers[index],
//           builder: (context, value, child) {
//             return ListTile(
//               titleAlignment: ListTileTitleAlignment.top,
//               leading: Icon(Symbols.person),
//               title: Text(admission.hoTen),
//               subtitle: Text(subtitle),
//               onTap: () async {
//                 await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PageAdmissionDetail(
//                       admission: admission,
//                     ),
//                   ),
//
//                 // Reload the list after returning
//                 await state.loadAdmissionList();
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class _CopyMenu extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final actions = _PageActions(context, ref);
//     return MenuAnchor(
//       builder: (context, controller, _) => IconButton(
//         icon: const Icon(Symbols.content_copy),
//         tooltip: "Sao chép thông tin xét tuyển",
//         onPressed: () => controller.open(),
//       ),
//       menuChildren: [
//         MenuItemButton(
//           onPressed: actions.copyEmailInterviewAdmission,
//           child: const ListTile(
//             title: Text("Lời mời phỏng vấn"),
//             leading: Icon(Symbols.content_copy),
//           ),
//         ),
//         MenuItemButton(
//           child: const ListTile(
//             leading: Icon(Icons.copy),
//             title: Text("Thông báo trúng tuyển"),
//           ),
//         ),
//         MenuItemButton(
//           onPressed: actions.copyWrongCategoryEmail,
//           child: const ListTile(
//             leading: Icon(Icons.copy),
//             title: Text("Thông báo sai diện tuyển sinh"),
//           ),
//         ),
//         MenuItemButton(
//           onPressed: actions.copyAdmissionRejection,
//           child: const ListTile(
//             leading: Icon(Icons.copy),
//             title: Text("Thông báo không đủ điều kiện"),
//           ),
//         ),
//         MenuItemButton(
//           onPressed: actions.copyEmailAll,
//           child: const ListTile(
//             leading: Icon(Icons.copy),
//             title: Text("Email (tất cả)"),
//           ),
//         ),
//         MenuItemButton(
//           onPressed: actions.copyEmailDirectAdmission,
//           child: const ListTile(
//             leading: Icon(Icons.copy),
//             title: Text("Email (tích hợp)"),
//           ),
//         ),
//         MenuItemButton(
//           onPressed: actions.copyEmailInterviewAdmission,
//           child: const ListTile(
//             leading: Icon(Icons.copy),
//             title: Text("Email (xét tuyển)"),
//           ),
//         ),
//       ],
//     );
//   }
// }
