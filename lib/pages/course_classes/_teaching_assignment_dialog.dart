part of 'list.dart';

class _TeachingAssignmentDialog extends ConsumerStatefulWidget {
  final int classId;
  final Map<TeacherData, double> initialAssignments;
  const _TeachingAssignmentDialog({
    required this.classId,
    required this.initialAssignments,
  });

  @override
  ConsumerState<_TeachingAssignmentDialog> createState() =>
      _TeachingAssignmentDialogState();
}

class _TeachingAssignmentDialogState
    extends ConsumerState<_TeachingAssignmentDialog> {
  late Map<TeacherData, double> teachers;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    teachers = widget.initialAssignments;
  }

  String? validate() {
    // Nothing to validate
    if (teachers.isEmpty) {
      return null;
    }

    // check for zero contrinbution
    for (final contribution in teachers.values) {
      if (contribution <= 0.0) {
        return "Đóng góp phải lớn hơn 0.0";
      }
    }

    // Check total contribution
    final total = teachers.values.fold<double>(0.0, (a, b) => a + b);
    if (total != 1.0) {
      return "Tổng đóng góp phải bằng 1.0";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final gutter = context.responsiveGutter;

    return AlertDialog(
      title: Text("Phân công giảng viên"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: gutter,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final assignment in teachers.entries)
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: gutter,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(assignment.key.name),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Đóng góp",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onChanged: (value) {
                          final parsed = double.tryParse(value) ?? 0.0;
                          teachers[assignment.key] = parsed;
                        },
                        controller: TextEditingController(
                          text: assignment.value.toStringAsFixed(2),
                        ),
                      ),
                    ),

                    // Delete button
                    TextButton.icon(
                      onPressed: () {
                        teachers.remove(assignment.key);
                        setState(() {
                          teachers = teachers;
                        });
                      },
                      icon: Icon(Symbols.delete),
                      label: Text("Xóa"),
                    ),
                  ],
                ),
              ),

            // Validator message
            FormField(
              validator: (value) => validate(),
              builder: (state) {
                final errorText = state.errorText;
                if (errorText == null) {
                  return SizedBox.shrink();
                }
                return Text(
                  errorText,
                  style: TextStyle(color: Colors.redAccent),
                );
              },
            ),

            // Button for adding new teacher
            SearchAnchor(
              suggestionsBuilder: (context, controller) async {
                final db = await ref.read(driftDatabaseProvider.future);
                final searchedTeachers = await db
                    .searchTeacher(searchText: controller.text, outsider: false)
                    .get();
                return [
                  for (final teacher in searchedTeachers)
                    if (!teachers.containsKey(teacher))
                      ListTile(
                        title: Text(teacher.name),
                        subtitle: Text(teacher.personalEmail ?? ""),
                        onTap: () {
                          // Add to the list

                          setState(() {
                            teachers = {...teachers, teacher: 1.0};
                          });
                          Navigator.pop(context);
                        },
                      ),
                ];
              },
              builder: (context, controller) => TextButton.icon(
                onPressed: controller.openView,
                icon: Icon(Symbols.add),
                label: Text("Thêm giảng viên"),
              ),
            ),
          ],
        ),
      ),
      actions: [
        // Cancel button
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Đóng"),
        ),

        // Save button
        FilledButton(
          onPressed: () async {
            if (formKey.currentState?.validate() != true) {
              return;
            }
            final notifier = ref.read(
              teachingTeachersProvider(widget.classId).notifier,
            );

            await notifier.set(teachers);
            navigator.pop();
          },
          child: Text("Lưu"),
        ),
      ],
    );
  }
}
