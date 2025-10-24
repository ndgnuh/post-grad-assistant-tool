import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:diacritic/diacritic.dart' as diacritic;

import '../../business/db_v2_providers.dart';
import 'widgets.dart';

class AdmissionEnrollmentPage extends StatelessWidget {
  static const routeName = '/admission/enrollment';
  final int studentId;
  const AdmissionEnrollmentPage({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final gutter = context.gutter;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhập học'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: min(width, 960),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              gutter,
              context.gutterTiny,
              gutter,
              context.gutterTiny,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: context.gutterLarge,
              children: [
                _StudentInfoSection(studentId: studentId),
                _EnrollFormSection(studentId: studentId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EnrollFormSection extends ConsumerStatefulWidget {
  final int studentId;

  const _EnrollFormSection({required this.studentId});

  @override
  ConsumerState<_EnrollFormSection> createState() => _EnrollFormSectionState();
}

class _EnrollFormSectionState extends ConsumerState<_EnrollFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _studentIdController = TextEditingController();
  final _schoolEmailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _studentIdController.addListener(() async {
      // TODO: this should be its own function (from name and id to email)
      final studentId = _studentIdController.text.trim();
      final student = await ref.read(
        studentByIdProvider(widget.studentId).future,
      );
      final studentName = student?.name ?? "Học viên";

      // Cut the first two character of student ID
      // Normally, it is /^20/
      final pattern = RegExp(r'^20');
      final studentIdCut = switch (pattern.firstMatch(studentId)) {
        null => studentId,
        _ => studentId.substring(2),
      };

      // Auto email from student ID
      // first name is de-accented
      final firstName = diacritic.removeDiacritics(studentName.split(' ').last);
      final lastNameInitials = studentName
          .split(' ')
          .reversed
          .skip(1)
          .map((e) => e[0].toUpperCase())
          .join();

      // Set the email to controller
      final emailDomain = "sis.hust.edu.vn";
      final emailName = "$firstName.$lastNameInitials$studentIdCut";
      final email = "$emailName@$emailDomain";
      _schoolEmailController.text = email;
    });
  }

  @override
  void dispose() {
    _studentIdController.dispose();
    _schoolEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: context.gutter,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(title: Text("Nhập học")),
          CouncilSelector(),
          CohortSelector(),
          TextFormField(
            controller: _studentIdController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập mã học viên';
              }
              return null;
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Mã học viên",
              hintText: "Mã học viên do BĐT cấp",
              prefixIcon: Icon(Symbols.numbers),
            ),
          ),
          TextFormField(
            controller: _schoolEmailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập email học viên';
              }
              if (!RegExp(r'^[\w-\.]+@sis\.hust\.edu\.vn$').hasMatch(value)) {
                return 'Email không hợp lệ. Vui lòng sử dụng email @sis.hust.edu.vn';
              }
              return null;
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Email",
              hintText: "Email @sis.hust.edu.vn",
              prefixIcon: Icon(Symbols.email),
            ),
          ),

          // Enroll button
          EnrollButtonBuilder(
            studentUid: widget.studentId,
            builder: (context, callback) => FilledButton.icon(
              icon: Icon(Symbols.save),
              label: Text("Nhập học"),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                callback();
              },
            ),
            studentIdController: _studentIdController,
            schoolEmailController: _schoolEmailController,
          ),
        ],
      ),
    );
  }
}

// class _EnrollmentForm extends ConsumerWidget {
//   const _EnrollmentForm();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final studentsState = ref.watch(admissionStudentsProvider);
//     switch (studentsState) {
//       case AsyncLoading():
//         return const Center(child: CircularProgressIndicator());
//       case AsyncError():
//         return const Center(child: Text("Lỗi tải dữ liệu."));
//       default:
//     }
//
//     final students = studentsState.value!;
//
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.all(context.gutter),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           spacing: context.gutter,
//           children: [
//             for (final student in students)
//               Flex(
//                 direction: Axis.horizontal,
//                 spacing: context.gutter,
//                 children: [
//                   Flexible(fit: FlexFit.tight, child: Text(student.hoTen)),
//                   Flexible(
//                     fit: FlexFit.tight,
//                     flex: 3,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         labelText: "Mã số sinh viên",
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     fit: FlexFit.tight,
//                     flex: 3,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         labelText: "Email học viên",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _StudentInfoSection extends ConsumerWidget {
  final int studentId;
  const _StudentInfoSection({required this.studentId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentAsync = ref.watch(studentByIdProvider(studentId));
    switch (studentAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return const Center(child: Text("Lỗi tải dữ liệu."));
      default:
    }

    final student = studentAsync.value!;

    copyCallback(String? text) {
      void callback() {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Không có dữ liệu để sao chép")),
        );
        return;
      }

      void callbackCopy() {
        ScaffoldMessenger.of(context).clearSnackBars();
        Clipboard.setData(ClipboardData(text: text as String));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Đã sao chép: $text")),
        );
      }

      return text == null ? callback : callbackCopy;
    }

    return Column(
      key: ValueKey(studentId),
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(title: Text("Học viên")),
        Card(
          child: Column(
            children: [
              SizedBox(height: context.gutterTiny),
              ListTile(
                leading: Icon(Symbols.numbers),
                title: Text("Mã số hồ sơ"),
                subtitle: Text(student.admissionId ?? "N/A"),
                onTap: copyCallback(student.admissionId),
              ),
              Divider(),
              ListTile(
                leading: Icon(Symbols.person),
                title: Text("Họ tên"),
                subtitle: Text(student.name),
                onTap: copyCallback(student.name),
              ),
              Divider(),
              // ListTile(
              //   leading: Icon(null),
              //   title: Text("Giới tính"),
              //   subtitle: Text(student.gender.toString()),
              // ),
              // Divider(),
              ListTile(
                leading: Icon(Symbols.email),
                title: Text("Email"),
                subtitle: Text(student.personalEmail ?? "N/A"),
                onTap: copyCallback(student.personalEmail),
              ),
              // Divider(),
              // ListTile(
              //   leading: Icon(Symbols.phone),
              //   title: Text("Điện thoại"),
              //   subtitle: Text(student.phone ?? "N/A"),
              //   onTap: copyCallback(student.phone),
              // ),
              SizedBox(height: context.gutterTiny),
            ],
          ),
        ),
      ],
    );
  }
}
