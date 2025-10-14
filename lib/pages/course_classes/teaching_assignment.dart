import 'dart:async';
import 'dart:math';

import 'package:fami_tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business/db_v2_providers.dart';
import '../../business/drift_orm.dart';
// import './_view_model.dart';
import './_interpersonal.dart' as interpersonal;

part 'teaching_assignment.view_model.dart';

class TeachingAssignmentPage extends StatelessWidget {
  static const String routeName = '/course-class/teaching-assignment';
  final int courseClassId;

  const TeachingAssignmentPage({
    super.key,
    required this.courseClassId,
  });

  @override
  Widget build(BuildContext context) {
    final gutter = context.responsiveGutter;
    final textTheme = TextTheme.of(context);
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Phân công giảng dạy'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: min(960, width),
          child: Padding(
            padding: EdgeInsets.all(gutter),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: gutter,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      _CandidateTeachersSection(classId: courseClassId),
                      SizedBox(height: gutter),
                      TeachingInvitationPanel(courseClassId: courseClassId),
                      SizedBox(height: gutter),
                      _AssignmentSection(courseClassId: courseClassId),
                    ],
                  ),
                ),

                // Add to the temporary list
                _AddCurrentTeacherButton(
                  courseClassId: courseClassId,
                  builder: (context, onPressed) => OutlinedButton.icon(
                    onPressed: onPressed,
                    label: Text("Thêm giảng viên đã chọn"),
                    icon: Icon(Symbols.add),
                  ),
                ),

                // Reset to initial state
                _ResetButton(
                  courseClassId: courseClassId,
                  builder: (context, onPressed) => OutlinedButton.icon(
                    onPressed: onPressed,
                    label: Text("Reset về trạng thái ban đầu"),
                    icon: Icon(Symbols.refresh),
                  ),
                ),

                // Store assignment
                FilledButton.icon(
                  onPressed: null,
                  icon: Icon(Symbols.save),
                  label: Text("Lưu"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResetButton extends ConsumerWidget {
  final int courseClassId;
  final Widget Function(BuildContext, VoidCallback) builder;

  const _ResetButton({
    required this.courseClassId,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onPress() {
      final notifier = ref.read(
        assignedTeachersProvider(courseClassId).notifier,
      );
      notifier.reset();
    }

    return builder(context, onPress);
  }
}

class _AddCurrentTeacherButton extends ConsumerWidget {
  final int courseClassId;
  final Widget Function(BuildContext, VoidCallback) builder;

  const _AddCurrentTeacherButton({
    required this.courseClassId,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onPress() {
      final notifier = ref.read(
        assignedTeachersProvider(courseClassId).notifier,
      );
      notifier.addSelectedTeacher();
    }

    return builder(context, onPress);
  }
}

class TeachingInvitationPanel extends ConsumerWidget {
  final int courseClassId;

  const TeachingInvitationPanel({
    super.key,
    required this.courseClassId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelAsync = ref.watch(
      teachingAssignmentViewModelProvider(courseClassId),
    );
    switch (viewModelAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      case AsyncData(:final value):
        return buildContent(context, ref, value);
    }
  }

  Widget buildContent(
    BuildContext context,
    WidgetRef ref,
    TeachingAssignmentViewModel viewModel,
  ) {
    final modelState = ref.watch(
      teachingAssignmentViewModelProvider(courseClassId),
    );
    final politeState = ref.watch(
      politenessProvider(courseClassId),
    );

    // Polite depends on everything
    switch (politeState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      default:
    }
    final polite = politeState.value!;
    final model = modelState.value!;

    // No teacher selected
    if (model.selectedTeacher == null) return SizedBox.shrink();

    final pronoun = switch ((polite, model.selectedTeacher!.gender)) {
      (true, Gender.male) => Pronoun.thay,
      (true, Gender.female) => Pronoun.co,
      (false, Gender.male) => Pronoun.anh,
      (false, Gender.female) => Pronoun.chi,
      (_, _) => Pronoun.sir,
    };

    // Politeness subtitle
    final politeSubtitle = switch (polite) {
      true => "Xưng hô lịch sự với \"${pronoun.pronoun}\"",
      false => "Xưng hô thân mật với \"${pronoun.pronoun}\"",
    };

    final invitation = interpersonal.teachingInvitationMessage(
      pronoun: pronoun,
      semester: viewModel.semester,
      courseName: viewModel.course.vietnameseTitle,
      numberOfRegisteredStudents: viewModel.registrationCount,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(title: Text("Mời giảng")),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: context.gutterTiny),
              SwitchListTile(
                value: polite,
                title: Text("Lịch sự"),
                subtitle: Text(politeSubtitle),
                onChanged: (value) => ref
                    .read(politenessProvider(courseClassId).notifier)
                    .set(value),
              ),
              Divider(),
              ListTile(
                title: Text("Văn mẫu"),
                subtitle: Text(invitation),
                onTap: () {
                  final data = ClipboardData(text: invitation);
                  Clipboard.setData(data);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đã sao chép vào clipboard")),
                  );
                },
                trailing: Icon(Symbols.content_copy),
              ),
              SizedBox(height: context.gutterTiny),
            ],
          ),
        ),
      ],
    );
  }
}

class _AssignmentSection extends ConsumerWidget {
  final int courseClassId;
  const _AssignmentSection({
    required this.courseClassId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignedTeachersAsync = ref.watch(
      assignedTeachersProvider(courseClassId),
    );
    switch (assignedTeachersAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      default:
    }

    final teachers = assignedTeachersAsync.value!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(title: Text("Giảng viên được phân công")),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: context.gutterTiny),
              if (teachers.isNotEmpty)
                for (final (i, teacher) in teachers.entries.indexed) ...[
                  ListTile(
                    key: ValueKey(teacher.key.id),
                    leading: Icon(Symbols.edit),
                    title: Text(teacher.key.name),
                    subtitle: Text("Trọng số: ${teacher.value}"),
                    onTap: () {
                      // Edit contribution weight
                    },
                    trailing: IconButton(
                      icon: Icon(Symbols.remove),
                      onPressed: () {
                        final notifier = ref.read(
                          assignedTeachersProvider(courseClassId).notifier,
                        );
                        notifier.removeTeacher(teacher.key);
                      },
                    ),
                  ),
                  if (i < teachers.length - 1) Divider(),
                ]
              else
                ListTile(
                  title: Text("Không có"),
                  subtitle: Text("Thêm giảng viên từ danh sách bên trên"),
                ),
              SizedBox(height: context.gutterTiny),
            ],
          ),
        ),
      ],
    );
  }
}

class _CandidateTeachersSection extends ConsumerWidget {
  final int classId;
  const _CandidateTeachersSection({
    required this.classId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTeacherAsync = ref.watch(
      selectedCandidateTeacherProvider(classId),
    );
    final teachersAsync = ref.watch(
      candidateTeachersProvider(classId),
    );
    switch (selectedTeacherAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      default:
    }

    final teachers = teachersAsync.value!;
    final selectedTeacher = selectedTeacherAsync.value;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(title: Text("Chọn giảng viên")),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: context.gutterTiny),
              for (final (i, teacher) in teachers.indexed) ...[
                RadioListTile<TeacherData>(
                  value: teacher,
                  groupValue: selectedTeacher,
                  onChanged: (value) {
                    final notifier = ref.read(
                      selectedCandidateTeacherProvider(classId).notifier,
                    );
                    notifier.select(teacher);
                  },
                  title: Text(teacher.name),
                  subtitle: Text(teacher.personalEmail ?? ""),
                ),
                if (i < teachers.length - 1) Divider(),
              ],
              SizedBox(height: context.gutterTiny),
            ],
          ),
        ),
      ],
    );
  }
}
