import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../business/db_v2_providers.dart';
import '../../data/dao.dart';
import 'providers.dart';

final _addCouncilMutation = Mutation<void>();

class AdmissionCouncilCreatePage extends StatelessWidget {
  const AdmissionCouncilCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm hội đồng"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.gutter),
        child: _AddCouncilForm(),
      ),
    );
  }
}

class _AddCouncilForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<_AddCouncilForm> createState() => _AddCouncilFormState();
}

class _AddCouncilFormState extends ConsumerState<_AddCouncilForm> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController yearController = .new();
  final TextEditingController decisionNumberController = .new();
  final ValueNotifier<DateTime?> decisionSignDateController = .new(null);
  final TextEditingController decisionSignDateFormatController = .new();
  final ValueNotifier<List<TeacherData>> teacherListNotifier = .new([]);

  @override
  initState() {
    super.initState();
    decisionSignDateController.addListener(() {
      final date = decisionSignDateController.value;
      switch (date) {
        case null:
          decisionSignDateFormatController.text = "";
        case DateTime date:
          final fmt = DateFormat("dd/MM/yyyy");
          decisionSignDateFormatController.text = fmt.format(date);
      }
    });
    decisionSignDateController.value = DateTime.now();
  }

  @override
  dispose() {
    yearController.dispose();
    decisionNumberController.dispose();
    decisionSignDateController.dispose();
    decisionSignDateFormatController.dispose();
    super.dispose();
  }

  String? Function(String? value) notEmpty(String message) {
    return (String? value) {
      if ((value ?? "").isEmpty) {
        return message;
      }
      return null;
    };
  }

  @override
  Widget build(BuildContext context) {
    final addCouncilState = ref.watch(_addCouncilMutation);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: context.gutter,
        children: [
          TextFormField(
            controller: yearController,
            decoration: InputDecoration(
              icon: Icon(Symbols.calendar_check),
              labelText: "Năm xét tuyển",
            ),
            validator: notEmpty("Nhập năm xét tuyển"),
          ),
          TextFormField(
            controller: decisionNumberController,
            decoration: InputDecoration(
              icon: Icon(null),
              labelText: "Số quyết định",
            ),
            validator: notEmpty("Nhập số quyết định"),
          ),
          TextFormField(
            controller: decisionSignDateFormatController,
            decoration: InputDecoration(
              icon: Icon(null),
              labelText: "Ngày ký",
            ),
            validator: notEmpty("Nhập số ngày ký"),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1970, 1, 1),
                lastDate: DateTime(2099),
                initialEntryMode: .input,
                initialDate: DateTime.now(),
              );
              if (date == null) return;
              decisionSignDateController.value = date;
            },
          ),
          Divider(),
          _TeacherListFormField(
            controller: teacherListNotifier,
          ),
          FilledButton(
            onPressed: () async {
              final ok = formKey.currentState!.validate();
              if (!ok) return;
              _addCouncilMutation.run(ref, (tsx) async {
                final db = await ref.watch(mainDatabaseProvider.future);
                final teacherList = teacherListNotifier.value;
                await db.updateAdmissionCouncil(
                  councilId: null,
                  year: yearController.text.trim(),
                  president: teacherList[0],
                  secretary: teacherList[1],
                  member1: teacherList[2],
                  member2: teacherList[3],
                  member3: teacherList[4],
                  decisionId: decisionNumberController.text.trim(),
                  decisionDate: decisionSignDateController.value!,
                );
                return;
              });
            },
            child: Text("Lưu"),
          ),
          switch (addCouncilState) {
            MutationIdle() => SizedBox.shrink(),
            MutationPending() => LinearProgressIndicator(),
            MutationSuccess() => Text("Đã thêm hội đồng!"),
            MutationError(:final error) => _ErrorText(error.toString()),
          },
        ],
      ),
    );
  }
}

class _TeacherListTable extends StatelessWidget {
  final ValueNotifier<List<TeacherData>> controller;
  final FormFieldState<List<TeacherData>> state;

  const _TeacherListTable({
    required this.controller,
    required this.state,
  });

  static const roles = [
    "Chủ tịch",
    "Thư ký",
    "Ủy viên 1",
    "Ủy viên 2",
    "Ủy viên 3",
  ];

  @override
  Widget build(BuildContext context) {
    final teacherList = controller.value;

    final rows = [
      for (final (i, teacher) in teacherList.indexed)
        DataRow(
          cells: [
            DataCell(Text(teacher.nameWithTitle)),
            DataCell(Text(roles.elementAtOrNull(i) ?? "Ủy viên")),
            DataCell(
              TextButton.icon(
                onPressed: () {
                  final newTeacherList = [
                    for (final (j, teacher) in teacherList.indexed)
                      if (i != j) teacher,
                  ];
                  controller.value = newTeacherList;
                  state.didChange(newTeacherList);
                },
                label: Text("Xóa"),
              ),
            ),
          ],
        ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable(
          showBottomBorder: true,
          columns: [
            DataColumn(
              label: Text("Giảng viên"),
              columnWidth: FlexColumnWidth(),
            ),
            DataColumn(
              label: Text("Nhiệm vụ"),
              columnWidth: FlexColumnWidth(),
            ),
            DataColumn(label: Text(""), columnWidth: IntrinsicColumnWidth()),
          ],
          rows: rows,
        ),
        SizedBox(height: context.gutterTiny),
        _AddTeacherButton(
          onSelect: (teacher) {
            controller.value = [...controller.value, teacher];
            state.didChange(controller.value);
          },
        ),
        Divider(),
        if (state.errorText != null) _ErrorText(state.errorText!),
      ],
    );
  }
}

class _TeacherListFormField extends FormField<List<TeacherData>> {
  final ValueNotifier<List<TeacherData>> controller;

  _TeacherListFormField({required this.controller})
    : super(
        builder: (FormFieldState<List<TeacherData>> state) => _TeacherListTable(
          state: state,
          controller: controller,
        ),
        validator: _validator,
        initialValue: const [],
      );

  static String? _validator(List<TeacherData>? state) {
    final teacherList = state ?? [];
    final n = teacherList.length;
    if (n != 5) {
      return "Phải có 5 thành viên trong hội đồng";
    }

    if (teacherList.toSet().length != n) {
      return "Có thành viên trùng trong danh sách hội đồng";
    }

    return null;
  }
}

class _ErrorText extends StatelessWidget {
  final String errorMessage;
  const _ErrorText(this.errorMessage);
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final style = TextStyle(color: colorScheme.error);
    return Text(errorMessage, style: style);
  }
}

class _AddTeacherButton extends ConsumerWidget {
  final ValueChanged<TeacherData> onSelect;

  const _AddTeacherButton({required this.onSelect});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchAnchor(
      builder: (context, controller) => TextButton.icon(
        icon: Icon(Symbols.add),
        onPressed: () => controller.openView(),
        label: Text("Thêm GV"),
      ),
      suggestionsBuilder: (context, controller) async {
        final searchText = controller.text;
        final db = await ref.read(mainDatabaseProvider.future);
        final stmt = db.searchTeachers(
          searchText: searchText,
          isOutsider: false,
        );
        final teachers = await stmt.get();

        final notifier = ref.read(teacherListProvider.notifier);
        return [
          for (final teacher in teachers)
            ListTile(
              title: Text(teacher.nameWithTitle),
              subtitle: Text(teacher.email ?? "No email"),
              onTap: () {
                notifier.addTeacher(teacher);
                onSelect(teacher);
                controller.closeView("");
              },
            ),
        ];
      },
    );
  }
}
