import 'dart:io';

import 'package:fami_tools/business/copy_pasta.dart';
import 'package:fami_tools/business/pdfs/pdfs.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as path;

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import '../setting_pages/setting_pages.dart';
import 'providers.dart';
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
            ],
          ),

          /// Preparation for the admission
          CardSection(
            title: "Tổ chức xét tuyển",
            children: [
              _PdfPreviewButton(
                title: "Phiếu đề xuất tiểu ban",
                pdfProvider: councilSuggestionPdfProvider(studentId),
              ),
              _PdfPreviewButton(
                title: "Phiếu điểm",
                pdfProvider: scoreSheetPdfProvider(studentId),
              ),
              _PdfPreviewButton(
                title: "Phiếu thanh toán",
                pdfProvider: paymentTablePdfProvider(studentId),
              ),
              ListTile(
                title: Text("Biên bản"),
                subtitle: Text("Biên bản xét tuyển"),
                leading: Icon(Symbols.file_copy),
                trailing: Icon(Symbols.preview),
              ),
              _SaveAdmissionFilesButton(studentId: studentId),
            ],
          ),
        ],
      ),
    );
  }
}

class _SaveAdmissionFilesButton extends ConsumerWidget {
  final int studentId;
  const _SaveAdmissionFilesButton({
    required this.studentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text("Lưu hồ sơ"),
      subtitle: Text("Lưu hồ sơ ra một thư mc"),
      leading: Icon(Symbols.download),
      trailing: Icon(Symbols.chevron_right),
      onTap: () async {
        final directory = await FilePicker.platform.getDirectoryPath();
        if (directory == null) return;

        final councilSuggestion = await ref.read(
          councilSuggestionPdfProvider(studentId).future,
        );
        final scoreSheet = await ref.read(
          scoreSheetPdfProvider(studentId).future,
        );
        final paymentTable = await ref.read(
          paymentTablePdfProvider(studentId).future,
        );

        final files = [
          councilSuggestion,
          scoreSheet,
          paymentTable,
        ].whereType<PdfFile>().toList();
        for (final pdfFile in files) {
          final savePath = path.join(directory, pdfFile.name);
          final file = File(savePath);
          await file.writeAsBytes(pdfFile.bytes);
        }
        messenger.showSnackBar(
          SnackBar(content: Text("Đã lưu hồ sơ vào thư mục $directory")),
        );
      },
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

class _PdfPreviewButton extends ConsumerWidget {
  final String title;
  final FutureProvider<PdfFile?> pdfProvider;

  const _PdfPreviewButton({
    required this.title,
    required this.pdfProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfAsync = ref.watch(pdfProvider);
    final pdf = pdfAsync.maybeWhen(
      data: (data) => data,
      orElse: () => null,
    );

    return ListTile(
      title: Text(title),
      subtitle: Text("Xem trước PDF"),
      leading: Icon(Symbols.picture_as_pdf),
      trailing: Icon(Symbols.preview),
      enabled: pdf != null,
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PdfDataPreviewPage(
              sourceName: pdf!.name,
              title: title,
              pdfData: pdf.bytes,
            ),
          ),
        );
      },
    );
  }
}
