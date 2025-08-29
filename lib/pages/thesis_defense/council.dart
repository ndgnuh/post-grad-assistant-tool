import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' hide Provider;
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../business/domain_objects.dart';
import '../../business/domain_editors.dart';
import '../../custom_widgets.dart';

import './pods.dart';

class ThesisDefenseCouncilPage extends StatelessWidget {
  final int thesisId;

  const ThesisDefenseCouncilPage({
    super.key,
    required this.thesisId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xếp hội đồng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.gutter),
        child: _ThesisInfo(thesisId: thesisId),
      ),
    );
  }
}

class _ThesisInfo extends ConsumerWidget {
  final int thesisId;

  const _ThesisInfo({
    required this.thesisId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = thesisViewModelByIdProvider(thesisId);
    final thesisState = ref.watch(provider);
    switch (thesisState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Lỗi tải luận văn: $error'));
      default:
    }

    final thesisNotifer = ref.read(provider.notifier);
    final thesisViewModel = thesisState.value!;
    final thesis = thesisViewModel.thesis;
    final student = thesis.hocVien!;
    final messenger = ScaffoldMessenger.of(context);

    String formatTeacher(Teacher? teacher) {
      if (teacher == null) return "Chưa chọn";
      return "${teacher.hoTenChucDanh} - ${teacher.donVi}";
    }

    return Column(
      children: [
        // Đề tài
        ListTile(
          title: Text("Đề tài"),
          subtitle: Text(thesis.tenTiengViet),
        ),

        // Học viên
        ListTile(
          title: Text("Học viên"),
          subtitle: Text("${student.maHocVien} - ${student.hoTen}"),
        ),

        // Chủ tịch hội đồng
        TeacherSearchTile(
          label: "Chủ tịch",
          initialValue: thesisViewModel.president,
          itemFormatter: formatTeacher,
          onSelected: (Teacher? v) {
            if (v?.id != null) thesisNotifer.assignPresident(v?.id as int);
            messenger.showMessage("Đã gán chủ tịch");
          },
        ),

        TeacherSearchTile(
          label: "Phản biện 1",
          initialValue: thesisViewModel.reviewer1,
          itemFormatter: formatTeacher,
          onSelected: (Teacher? v) {
            switch (v?.id) {
              case int id:
                if (v?.id != null) thesisNotifer.assignReviewer1(id);
                messenger.showMessage("Đã gán phản biện 1");
            }
          },
        ),

        TeacherSearchTile(
          label: "Phản biện 2",
          initialValue: thesisViewModel.reviewer2,
          itemFormatter: formatTeacher,
          onSelected: (Teacher? v) {
            switch (v?.id) {
              case int id:
                if (v?.id != null) thesisNotifer.assignReviewer2(id);
                messenger.showMessage("Đã gán phản biện 2");
            }
          },
        ),

        TeacherSearchTile(
          label: "Thư ký",
          initialValue: thesisViewModel.secretary,
          itemFormatter: formatTeacher,
          onSelected: (Teacher? v) {
            switch (v?.id) {
              case int id:
                if (v?.id != null) thesisNotifer.assignSecretary(id);
                messenger.showMessage("Đã gán thư ký");
            }
          },
        ),

        TeacherSearchTile(
          label: "Ủy viên",
          initialValue: thesisViewModel.member,
          itemFormatter: formatTeacher,
          onSelected: (Teacher? v) {
            switch (v?.id) {
              case int id:
                if (v?.id != null) thesisNotifer.assignMember(id);
                messenger.showMessage("Đã gán ủy viên");
            }
          },
        ),

        // TODO: Nhóm bảo vệ
      ],
    );
  }
}
