import 'dart:io';
import 'dart:typed_data';

import 'package:diacritic/diacritic.dart';
import 'package:fami_tools/business/copy_pasta.dart';
import 'package:fami_tools/business/pdfs/phd_admission_council_suggestion_pdf.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import '../setting_pages/setting_pages.dart';
import 'providers.dart';
import 'widgets.dart';
import 'phd_student_admission_providers.dart';

class PhdStudentAdmissionTab extends StatelessWidget {
  final int studentId;
  const PhdStudentAdmissionTab({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: gutter,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Phd's student basic information
          CardSection(
            title: "Hội đồng xét tuyển",
            children: [
              _CouncilArrangementEmailButton(studentId: studentId),
              _PhdAdmissionTeacher.president(studentId: studentId),
              _PhdAdmissionTeacher.secretary(studentId: studentId),
              _PhdAdmissionTeacher.member1(studentId: studentId),
              _PhdAdmissionTeacher.member2(studentId: studentId),
              _PhdAdmissionTeacher.member3(studentId: studentId),
              _CouncilSuggestionPdf.preview(
                context: context,
                studentId: studentId,
              ),
              _CouncilSuggestionPdf.save(
                context: context,
                studentId: studentId,
              ),
            ],
          ),

          /// Preparation for the admission
          CardSection(
            title: "Tổ chức xét tuyển",
            children: [
              ListTile(
                title: Text("Phiếu điểm"),
                subtitle: Text("Xem trước phiếu điểm"),
                leading: Icon(Symbols.file_copy),
                trailing: Icon(Symbols.preview),
              ),
              ListTile(
                title: Text("Giấy thanh toán"),
                subtitle: Text("Xem trước giấy thanh toán"),
                leading: Icon(Symbols.file_copy),
                trailing: Icon(Symbols.preview),
              ),
              ListTile(
                title: Text("Biên bản"),
                subtitle: Text("Biên bản xét tuyển"),
                leading: Icon(Symbols.file_copy),
                trailing: Icon(Symbols.preview),
              ),
              ListTile(
                title: Text("Lưu hồ sơ"),
                subtitle: Text("Lưu hồ sơ ra một thư mc"),
                leading: Icon(Symbols.download),
                trailing: Icon(Symbols.chevron_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PhdAdmissionTeacher extends ConsumerWidget {
  final String title;
  final int studentId;
  final int? Function(PhdStudentData phd) getTeacherId;
  final Function(PhdStudentByIdNotifier notifier, int) onSelected;

  const _PhdAdmissionTeacher({
    required this.title,
    required this.studentId,
    required this.getTeacherId,
    required this.onSelected,
  });

  factory _PhdAdmissionTeacher.president({required int studentId}) {
    return _PhdAdmissionTeacher(
      title: "Chủ tịch hội đồng",
      studentId: studentId,
      getTeacherId: (phd) => phd.admissionPresidentId,
      onSelected: (notifier, id) =>
          notifier.setAdmissionCouncil(presidentId: id),
    );
  }

  factory _PhdAdmissionTeacher.secretary({required int studentId}) {
    return _PhdAdmissionTeacher(
      title: "Thư ký",
      studentId: studentId,
      getTeacherId: (phd) => phd.admissionSecretaryId,
      onSelected: (notifier, id) =>
          notifier.setAdmissionCouncil(secretaryId: id),
    );
  }

  factory _PhdAdmissionTeacher.member1({required int studentId}) {
    return _PhdAdmissionTeacher(
      title: "Ủy viên 1",
      studentId: studentId,
      getTeacherId: (phd) => phd.admission1stMemberId,
      onSelected: (notifier, id) => notifier.setAdmissionCouncil(member1Id: id),
    );
  }

  factory _PhdAdmissionTeacher.member2({required int studentId}) {
    return _PhdAdmissionTeacher(
      title: "Ủy viên 2",
      studentId: studentId,
      getTeacherId: (phd) => phd.admission2ndMemberId,
      onSelected: (notifier, id) => notifier.setAdmissionCouncil(member2Id: id),
    );
  }

  factory _PhdAdmissionTeacher.member3({required int studentId}) {
    return _PhdAdmissionTeacher(
      title: "Ủy viên 3",
      studentId: studentId,
      getTeacherId: (phd) => phd.admission3rdMemberId,
      onSelected: (notifier, id) => notifier.setAdmissionCouncil(member3Id: id),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phdStudent = ref.watch(phdStudentByIdProvider(studentId));
    final teacherId = phdStudent.maybeWhen(
      data: (phd) => getTeacherId(phd),
      orElse: () => null,
    );

    final teacherAsync = switch (teacherId) {
      null => null,
      int id => ref.watch(teacherByIdProvider(id)),
    };

    final name =
        teacherAsync?.when(
          data: (teacher) => teacher.name,
          loading: () => "Đang tải...",
          error: (_, _) => "Lỗi khi tải",
        ) ??
        "Chưa xếp";

    return SearchAnchor(
      suggestionsBuilder: (context, controller) async {
        final db = await ref.watch(mainDatabaseProvider.future);
        final stmt = db.searchTeachers(searchText: controller.text);
        final teachers = await stmt.get();
        final widgets = [
          for (final teacher in teachers)
            ListTile(
              title: Text(teacher.name),
              subtitle: Text(
                teacher.university ?? teacher.email ?? teacher.falcuty ?? "",
              ),
              onTap: () {
                final notifier = ref.read(
                  phdStudentByIdProvider(studentId).notifier,
                );
                onSelected(notifier, teacher.id);
                controller.closeView("");
              },
            ),
        ];
        return widgets;
      },
      builder: (context, controller) => ListTile(
        title: Text(title),
        subtitle: Text(name),
        onTap: () => controller.openView(),
      ),
    );
  }
}

class _CouncilSuggestionPdf extends ConsumerWidget {
  final int studentId;
  final String hintText;
  final Widget icon;
  final ValueChanged<(Uint8List, PhdStudentData)> pdfCallback;

  const _CouncilSuggestionPdf({
    required this.studentId,
    required this.pdfCallback,
    required this.hintText,
    required this.icon,
  });

  factory _CouncilSuggestionPdf.preview({
    required BuildContext context,
    required int studentId,
  }) {
    final navigator = Navigator.of(context);
    return _CouncilSuggestionPdf(
      studentId: studentId,
      icon: Icon(Symbols.preview),
      hintText: "Xem trước file PDF đề xuất hội đồng xét tuyển",
      pdfCallback: (data) {
        final (pdfData, student) = data;
        final fileName =
            "${student.admissionId}_${student.name}_DeXuatTieuBan.pdf";
        navigator.push(
          MaterialPageRoute(
            builder: (context) => PdfDataPreviewPage(
              sourceName: removeDiacritics(fileName).replaceAll(" ", ""),
              title: "Đề xuất hội đồng xét tuyển",
              pdfData: pdfData,
            ),
          ),
        );
      },
    );
  }

  factory _CouncilSuggestionPdf.save({
    required BuildContext context,
    required int studentId,
  }) {
    final messenger = ScaffoldMessenger.of(context);
    callback(data) async {
      final (pdfData, student) = data;
      final fileName =
          "${student.admissionId}_${student.name}_DeXuatTieuBan.pdf";
      final savePath = await FilePicker.platform.saveFile(
        fileName: fileName,
        bytes: pdfData,
      );

      switch (savePath) {
        case String path:
          if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
            await File(path).writeAsBytes(pdfData);
          }
          messenger.showSnackBar(
            SnackBar(content: Text("Đã lưu file tại $path")),
          );
      }
    }

    return _CouncilSuggestionPdf(
      icon: Icon(Symbols.download),
      hintText: "Lưu file PDF đề xuất hội đồng xét tuyển",
      studentId: studentId,
      pdfCallback: callback,
    );
  }

  Widget get title => Text("Đề xuất hội đồng");

  Widget get subtitle => Text(hintText);

  Widget get leadingIcon => Icon(Symbols.picture_as_pdf);

  Widget get trailingIcon => icon;

  Widget get disabled => ListTile(
    title: title,
    subtitle: subtitle,
    leading: leadingIcon,
    trailing: trailingIcon,
    enabled: false,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membersAsync = ref.watch(councilMembersProvider(studentId));
    switch (membersAsync) {
      case AsyncLoading():
        return disabled;
      case AsyncError():
        return disabled;
      default:
    }

    final members = membersAsync.value!;
    for (final member in members) {
      if (member == null) return disabled;
    }

    final navigator = Navigator.of(context);

    return ListTile(
      title: title,
      subtitle: subtitle,
      leading: leadingIcon,
      trailing: trailingIcon,
      onTap: () async {
        final student = await ref.watch(
          phdStudentByIdProvider(studentId).future,
        );
        final supervisor = await ref.watch(
          teacherByIdProvider(student.supervisorId).future,
        );
        final secondarySupervisor = switch (student.secondarySupervisorId) {
          null => null,
          int id => await ref.watch(teacherByIdProvider(id).future),
        };
        final pdfData = await phdAdmissionCouncilSuggestionPdf(
          phdStudent: student,
          councilMembers: members.whereType<TeacherData>().toList(),
          supervisor: supervisor,
          secondarySupervisor: secondarySupervisor,
        );
        pdfCallback((pdfData, student));
      },
    );
  }
}

class _CouncilArrangementEmailButton extends StatelessWidget {
  final int studentId;
  const _CouncilArrangementEmailButton({required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => ListTile(
        title: Text("Gửi email xếp hội đồng"),
        subtitle: Text(
          "Gửi email mời xếp hội đồng xét tuyển cho các GVHD",
        ),
        leading: Icon(Symbols.email),
        trailing: Icon(Symbols.chevron_right),
        onTap: () async {
          final email = await ref.watch(
            admissionCouncilArrangementEmailNotifier(studentId).future,
          );

          showDialog(
            context: context,
            builder: (_) => EmailCopyDialog(email: email),
          );
        },
      ),
    );
  }
}
