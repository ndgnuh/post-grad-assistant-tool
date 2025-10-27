import 'package:fami_tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import 'teaching_assignment_providers.dart';

class TeachingAssignmentTab extends StatelessWidget {
  final int classId;

  const TeachingAssignmentTab({
    super.key,
    required this.classId,
  });

  @override
  Widget build(BuildContext context) {
    final gutter = context.responsiveGutter;

    return Padding(
      padding: EdgeInsets.all(gutter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: gutter,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _CandidateTeachersSection(classId: classId),
                SizedBox(height: gutter),
                _TeachingInvitationPanel(classId: classId),
                SizedBox(height: gutter),
                _AssignmentSection(courseClassId: classId),
              ],
            ),
          ),

          // Add to the temporary list
          _AddCurrentTeacherButton(
            courseClassId: classId,
            builder: (context, onPressed) => OutlinedButton.icon(
              onPressed: onPressed,
              label: Text("Thêm giảng viên đã chọn"),
              icon: Icon(Symbols.add),
            ),
          ),

          // Reset to initial state
          _ResetButton(
            courseClassId: classId,
            builder: (context, onPressed) => OutlinedButton.icon(
              onPressed: onPressed,
              label: Text("Reset về trạng thái ban đầu"),
              icon: Icon(Symbols.refresh),
            ),
          ),

          // Store assignment
          _SaveButton(
            courseClassId: classId,
            builder: (context, callback) => FilledButton.icon(
              onPressed: callback,
              icon: Icon(Symbols.save),
              label: Text("Lưu"),
            ),
          ),
        ],
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
        teachingAssignmentViewModelProvider(courseClassId).notifier,
      );
      notifier.reset();
    }

    return builder(context, onPress);
  }
}

class _AddCurrentTeacherButton extends ConsumerWidget {
  final int courseClassId;
  final Widget Function(BuildContext, VoidCallback?) builder;

  const _AddCurrentTeacherButton({
    required this.courseClassId,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionModelAsync = ref.watch(
      candidateSelectionProvider(courseClassId),
    );
    switch (selectionModelAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      default:
    }

    final selectionModel = selectionModelAsync.value!;
    final selected = selectionModel.selected;
    if (selected == null) {
      return builder(context, null);
    }

    return builder(context, () {
      final notifier = ref.read(
        teachingAssignmentViewModelProvider(courseClassId).notifier,
      );
      notifier.addTeacher(selected, 1.0);
    });
  }
}

class _TeachingInvitationPanel extends ConsumerWidget {
  final int classId;

  const _TeachingInvitationPanel({required this.classId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelAsync = ref.watch(
      teachingAssignmentViewModelProvider(classId),
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
    final invitationState = ref.watch(
      teachingInvitationMessageProvider(classId),
    );
    switch (invitationState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      default:
    }

    final invitation = invitationState.value!;

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
              _PolitenessSwitch(classId: classId),
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

class _PolitenessSwitch extends ConsumerWidget {
  /// This is a bit anti-intuitive
  /// As politeness is a preference for "teachers" not the "course clas"
  const _PolitenessSwitch({required this.classId});

  final int classId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final politeAsync = ref.watch(politenessProvider(classId));
    final value = switch (politeAsync) {
      AsyncLoading() => true,
      AsyncError() => true,
      AsyncData(:final value) => value,
    };

    final politeSubtitle = value
        ? "Sử dụng cách xưng hô lịch sự (Thầy/Cô)"
        : "Sử dụng cách xưng hô thân mật (Anh/Chị)";

    return SwitchListTile(
      value: value,
      title: Text("Lịch sự"),
      subtitle: Text(politeSubtitle),
      onChanged: (value) => {
        ref.read(politenessProvider(classId).notifier).set(value),
      },
    );
  }
}

class _AssignmentSection extends ConsumerWidget {
  final int courseClassId;
  const _AssignmentSection({
    required this.courseClassId,
  });

  void askForWeight({
    required WidgetRef ref,
    required BuildContext context,
    required TeacherData teacher,
    required double initialWeight,
  }) async {
    final controller = TextEditingController(
      text: initialWeight.toString(),
    );
    final key = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Trọng số (GV: ${teacher.name})"),
        content: Form(
          key: key,
          child: TextFormField(
            validator: (value) {
              final weight = double.tryParse(value ?? '');
              if (weight == null || weight <= 0.0 || weight > 1.0) {
                return "Trọng số phải là số lớn hơn 0.0, nhỏ hơn hoặc bằng 1.0";
              }
              return null;
            },
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Trọng số",
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (key.currentState?.validate() != true) {
                return;
              }
              final weight = double.tryParse(controller.text) ?? initialWeight;
              final notifier = ref.read(
                teachingAssignmentViewModelProvider(courseClassId).notifier,
              );
              notifier.setWeight(teacher, weight);
              Navigator.of(context).pop();
            },
            child: Text("Lưu"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(
      teachingAssignmentViewModelProvider(courseClassId),
    );
    switch (modelAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      default:
    }

    final model = modelAsync.value!;
    final teachers = model.assignedTeachers;
    final weights = model.weights;
    final notifier = ref.read(
      teachingAssignmentViewModelProvider(courseClassId).notifier,
    );

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
                for (final (i, teacher) in teachers.indexed) ...[
                  ListTile(
                    key: ValueKey(teacher.id),
                    leading: Icon(Symbols.edit),
                    title: Text(teacher.name),
                    subtitle: Text("Trọng số: ${weights[i]}"),
                    onTap: () => askForWeight(
                      ref: ref,
                      context: context,
                      teacher: teacher,
                      initialWeight: weights[i],
                    ),
                    trailing: IconButton(
                      icon: Icon(Symbols.remove),
                      onPressed: () => notifier.removeTeacher(teacher),
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
    final modelAsync = ref.watch(
      candidateSelectionProvider(classId),
    );
    switch (modelAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      default:
    }

    final model = modelAsync.value!;
    final teachers = model.options;
    final selectedTeacher = model.selected;

    return DropdownMenu<TeacherData>(
      enableFilter: true,
      label: Text("Giảng viên"),
      expandedInsets: EdgeInsets.zero,
      initialSelection: selectedTeacher,
      dropdownMenuEntries: [
        for (final teacher in teachers)
          DropdownMenuEntry(
            value: teacher,
            label: teacher.name,
          ),
      ],
      onSelected: (value) {
        final notifier = ref.read(
          candidateSelectionProvider(classId).notifier,
        );
        notifier.selectTeacher(value);
      },
    );
  }
}

class _SaveButton extends ConsumerWidget {
  final Widget Function(BuildContext, VoidCallback) builder;
  final int courseClassId;

  const _SaveButton({required this.courseClassId, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    return builder(
      context,
      () async {
        // Check if all the weights add to 1
        final viewModel = await ref.read(
          teachingAssignmentViewModelProvider(courseClassId).future,
        );

        // Only check if there is at least one teacher assigned
        if (viewModel.assignedTeachers.isNotEmpty) {
          final totalWeight = viewModel.totalWeight;
          if (totalWeight != 1.0) {
            messenger.showSnackBar(
              SnackBar(
                content: Text(
                  "Tổng trọng số hiện tại là $totalWeight, vui lòng điều chỉnh để tổng bằng 1.0 trước khi lưu",
                ),
              ),
            );
            return;
          }
        }

        final notifier = ref.read(
          teachingAssignmentViewModelProvider(courseClassId).notifier,
        );
        notifier.commit();
        messenger.showSnackBar(
          const SnackBar(content: Text("Đã lưu phân công giảng dạy")),
        );
      },
    );
  }
}
