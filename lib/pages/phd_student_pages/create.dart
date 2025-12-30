import 'package:fami_tools/business/selection_models.dart';
import 'package:fami_tools/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';

final specializationSelectionProvider = AsyncNotifierProvider(
  () => PhdSpecializationSelectionModelNotifier('admission'),
);

class PhdStudentCreatePage extends StatelessWidget {
  static const routeName = '/phd-students/create';
  const PhdStudentCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text('Tuyển sinh NCS'),
        ),
      ),
      body: CommonShortcuts(
        child: ConstrainedBody(
          child: _FormStateProvider(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: gutter,
              children: [
                Expanded(
                  child: _InformationForm(),
                ),
                IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.all(gutter),
                    child: Row(
                      spacing: gutter,
                      children: [
                        Expanded(child: _SaveButton()),
                        _ClearButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GenderPicker extends StatelessWidget {
  final ValueNotifier<Gender> notifier;
  const _GenderPicker({required this.notifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, child) {
        return DropdownMenuFormField(
          enableFilter: true,
          validator: (gender) {
            if (gender == null || gender == Gender.unknown) {
              return "Không được để trống";
            }
            return null;
          },
          label: Text("Giới tính"),
          expandedInsets: EdgeInsets.zero,
          initialSelection: value,
          onSelected: (gender) {
            notifier.value = gender ?? notifier.value;
          },
          dropdownMenuEntries: [
            DropdownMenuEntry(value: Gender.male, label: "Nam"),
            DropdownMenuEntry(value: Gender.female, label: "Nữ"),
            DropdownMenuEntry(value: Gender.unknown, label: "Không rõ"),
          ],
        );
      },
    );
  }
}

class _InformationForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = _FormStateProvider.of(context);
    final gutter = context.gutter;

    return Form(
      key: form.formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(gutter),
        child: FocusScope(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: gutter,
            children: [
              // Thông tin quản lý chung
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: gutter,
                  children: [
                    Expanded(
                      child: _CohortSelector(
                        controller: form.cohortNotifier,
                      ),
                    ),
                  ],
                ),
              ),

              // Thạng thái NCS
              ValueListenableBuilder(
                valueListenable: form.statusNotifier,
                builder: (context, value, child) {
                  return SegmentedButton<StudentStatus>(
                    selected: {value},
                    multiSelectionEnabled: false,
                    onSelectionChanged: (newSelection) {
                      final status = newSelection.first;
                      form.statusNotifier.value = status;
                    },
                    segments: [
                      ButtonSegment(
                        icon: Icon(Symbols.person_add),
                        value: StudentStatus.admission,
                        label: Text('Tuyển sinh'),
                      ),
                      ButtonSegment(
                        icon: Icon(Symbols.pending),
                        value: StudentStatus.studying,
                        label: Text('đang học'),
                      ),
                      ButtonSegment(
                        icon: Icon(Symbols.school),
                        value: StudentStatus.graduated,
                        label: Text('Tốt nghiệp'),
                      ),
                      ButtonSegment(
                        icon: Icon(Symbols.person_cancel),
                        value: StudentStatus.quit,
                        label: Text('Thôi học'),
                      ),
                    ],
                  );
                },
              ),

              // Thông tin cơ bản
              ValueListenableBuilder(
                valueListenable: form.statusNotifier,
                builder: (context, value, child) {
                  final enables = switch (value) {
                    StudentStatus.admission => [true, false],
                    _ => [true, true],
                  };

                  return IntrinsicHeight(
                    child: Row(
                      spacing: gutter,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: TextFormField(
                            enabled: enables[0],
                            controller: form.admissionIdController,
                            decoration: labelText('Mã số hồ sơ tuyển sinh'),
                            validator: notEmptyValidator(
                              'Vui lòng nhập mã hồ sơ NCS',
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            enabled: enables[1],
                            controller: form.managementIdController,
                            decoration: labelText('Mã NCS'),
                            validator: notEmptyValidator(
                              'Vui lòng nhập mã số NCS',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              IntrinsicHeight(
                child: Row(
                  spacing: gutter,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: form.nameController,
                        validator: notEmptyValidator(
                          'Vui lòng nhập họ tên NCS',
                        ),
                        decoration: labelText('Họ tên NCS'),
                      ),
                    ),
                    Expanded(
                      child: _GenderPicker(
                        notifier: form.genderNotifier,
                      ),
                    ),
                  ],
                ),
              ),

              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: gutter,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: form.placeOfBirthController,
                        decoration: labelText('Nơi sinh'),
                        validator: notEmptyValidator('Vui lòng chọn ngày sinh'),
                      ),
                    ),
                    Expanded(
                      child: DateTimePicker(
                        labelText: 'Ngày sinh',
                        validator: (date) =>
                            date == null ? 'Vui lòng chọn ngày sinh' : null,
                        controller: form.dateOfBirthNotifier,
                      ),
                    ),
                  ],
                ),
              ),

              // TextFormField(
              //   decoration: labelText('Giới tính'),
              //   validator: notEmptyValidator('Vui lòng chọn giới tính'),
              // ),
              Divider(),

              // Thông tin liên lạc
              TextFormField(
                decoration: labelText('Số điện thoại'),
                controller: form.phoneController,
                validator: notEmptyValidator('Không được bỏ trống'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: labelText('Email cá nhân'),
                controller: form.emailController,
                validator: emailValidator('Không được bỏ trống'),
              ),

              Divider(),

              ValueListenableBuilder(
                valueListenable: form.specializationNotifier,
                builder: (context, value, child) {
                  return DropdownMenuFormField(
                    expandedInsets: EdgeInsets.zero,
                    label: Text('Hướng chuyên sâu'),
                    onSelected: (value) {
                      form.specializationNotifier.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Vui lòng chọn hướng chuyên sâu';
                      }
                      return null;
                    },
                    dropdownMenuEntries: [
                      for (final option in PhdSpecialization.values)
                        DropdownMenuEntry(
                          value: option,
                          label: option.label,
                        ),
                    ],
                  );
                },
              ),

              // Thông tin đề tài nghiên cứu
              TextFormField(
                controller: form.thesisController,
                decoration: labelText('Tên đề tài dự kiến'),
                validator: notEmptyValidator('Không được để trống'),
              ),

              // Giảng viên hướng dẫn
              Row(
                spacing: gutter,
                children: [
                  Expanded(
                    child: _SupervisorSearch(
                      notifier: form.supervisorNotifier,
                      title: "Giảng viên hướng dẫn",
                      required: true,
                    ),
                  ),
                  Expanded(
                    child: _SupervisorSearch(
                      notifier: form.secondarySupervisorNotifier,
                      title: "Giảng viên đồng hướng dẫn (nếu có)",
                      required: false,
                    ),
                  ),
                ],
              ),

              // Thêm NCS khác hoặc quay về danh sách
              ValueListenableBuilder(
                valueListenable: form.addAnotherNotifier,
                builder: (context, value, child) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: value,
                    onChanged: (value) {
                      form.addAnotherNotifier.value = value ?? false;
                    },
                    title: Text('Thêm NCS khác'),
                    subtitle: switch (value) {
                      true => Text('Ở lại trang này sau khi lưu'),
                      false => Text('Quay về trang danh sách sau khi lưu'),
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? Function(String?) emailValidator(String message) {
    return (value) {
      if (value == null || value.isEmpty) {
        return message;
      }
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (!emailRegex.hasMatch(value)) {
        return 'Vui lòng nhập địa chỉ email hợp lệ';
      }
      return null;
    };
  }

  InputDecoration labelText(String text) {
    return InputDecoration(labelText: text);
  }

  String? Function(String?) notEmptyValidator(String message) {
    return (value) => (value == null || value.isEmpty) ? message : null;
  }
}

class _SupervisorSearch extends StatelessWidget {
  const _SupervisorSearch({
    required this.notifier,
    required this.title,
    required this.required,
  });

  final ValueNotifier<TeacherData?> notifier;
  final bool required;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      suggestionsBuilder: _teacherSuggestionsBuilder(
        onTap: (teacher) => notifier.value = teacher,
      ),
      builder: (context, controller) => ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, child) {
          return TextFormField(
            controller: TextEditingController(
              text: value?.name ?? '',
            ),
            decoration: InputDecoration(
              labelText: title,
            ),
            readOnly: true,
            onTap: () {
              controller.clear();
              controller.openView();
            },
            validator: (value) {
              if (notifier.value == null && required) {
                return 'Không được bỏ trống';
              }
              return null;
            },
          );
        },
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final form = _FormStateProvider.of(context);
    return OutlinedButton.icon(
      icon: const Icon(Symbols.clear),
      label: const Text('Xóa form'),
      onPressed: () => form.clear(),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    return FilledButton(
      onPressed: () async {
        final form = _FormStateProvider.of(context);
        final formKey = form.formKey;
        if (formKey.currentState?.validate() != true) {
          return;
        }

        final db = await ref.read(mainDatabaseProvider.future);

        // final specializationSelection = await ref.read(
        //   specializationSelectionProvider.future,
        // );
        // if (specializationSelection.selected == null) {
        //   messenger.showSnackBar(
        //     const SnackBar(
        //       content: Text('Vui lòng chọn hướng chuyên sâu'),
        //     ),
        //   );
        //   return;
        // }

        final status = form.statusNotifier.value;
        db.addPhdStudent(
          cohort: form.cohortNotifier.value!.cohort,
          admissionId: form.admissionIdController.text.trim(),
          managementId: form.managementIdController.nonEmptyText,

          // basic information
          name: form.nameController.text.trim(),
          gender: form.genderNotifier.value,
          dateOfBirth: form.dateOfBirthNotifier.value!,
          placeOfBirth: form.placeOfBirthController.text.trim(),

          // contact information
          personalEmail: form.emailController.text.trim(),
          phone: form.phoneController.text.trim(),

          supervisorId: form.supervisorNotifier.value!.id,
          secondarySupervisorId: form.secondarySupervisorNotifier.value?.id,
          thesis: form.thesisController.text.trim(),
          majorSpecialization: form.specializationNotifier.value!,

          status: form.statusNotifier.value,
          admissionPaymentStatus: switch (status) {
            StudentStatus.admission => PaymentStatus.unpaid,
            _ => PaymentStatus.paid,
          },
        );

        if (form.addAnotherNotifier.value) {
          // Clear form for next entry
          form.clear();
        } else {
          navigator.pop();
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text('Đã thêm NCS thành công'),
            ),
          );
        });
      },
      child: const Text('Save'),
    );
  }
}

Future<List<Widget>> Function(BuildContext context, SearchController controller)
_teacherSuggestionsBuilder({required ValueChanged<TeacherData> onTap}) {
  Future<List<Widget>> builder(
    BuildContext context,
    SearchController controller,
  ) async {
    final searchText = controller.text;
    if (searchText.isEmpty) {
      return const [
        ListTile(
          title: Text('Vui lòng nhập tên giáo viên'),
        ),
      ];
    }

    final ref = ProviderScope.containerOf(context);
    final db = await ref.read(mainDatabaseProvider.future);
    final teachers = await db.searchTeachers(searchText: searchText).get();

    return [
      for (final teacher in teachers)
        ListTile(
          title: Text(teacher.name),
          subtitle: Text(teacher.email ?? ''),
          onTap: () {
            onTap(teacher);
            controller.closeView(null);
          },
        ),
    ];
  }

  return builder;
}

class _FormStateProvider extends InheritedWidget {
  final GlobalKey<FormState> formKey = .new();
  final ValueNotifier<bool> addAnotherNotifier = .new(false);
  final ValueNotifier<TeacherData?> supervisorNotifier = .new(null);
  final ValueNotifier<TeacherData?> secondarySupervisorNotifier = .new(null);
  final ValueNotifier<PhdCohortData?> cohortNotifier = .new(null);
  final ValueNotifier<PhdSpecialization?> specializationNotifier = .new(null);
  final ValueNotifier<Gender> genderNotifier = .new(Gender.unknown);
  final ValueNotifier<DateTime?> dateOfBirthNotifier = .new(null);
  final ValueNotifier<StudentStatus> statusNotifier = .new(
    StudentStatus.admission,
  );

  final TextEditingController managementIdController = .new();
  final TextEditingController thesisController = .new();
  final TextEditingController admissionIdController = .new();
  final TextEditingController nameController = .new();
  final TextEditingController placeOfBirthController = .new();
  final TextEditingController emailController = .new();
  final TextEditingController phoneController = .new();

  _FormStateProvider({
    required super.child,
  });

  void clear() {
    supervisorNotifier.value = null;
    secondarySupervisorNotifier.value = null;
    genderNotifier.value = Gender.unknown;
    dateOfBirthNotifier.value = null;
    statusNotifier.value = StudentStatus.admission;

    thesisController.clear();
    managementIdController.clear();
    admissionIdController.clear();
    nameController.clear();
    placeOfBirthController.clear();
    emailController.clear();
    phoneController.clear();

    // We don't clear these fields to preserve user convenience
    // statusController.value = StudentStatus.admission;
    // cohortController.value = null;
    // specializationController.value = null;
  }

  static _FormStateProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_FormStateProvider>();
  }

  static _FormStateProvider of(BuildContext context) {
    final instance = maybeOf(context);
    assert(instance != null, 'No _CreateForm found in context');
    return instance!;
  }

  @override
  bool updateShouldNotify(covariant _FormStateProvider oldWidget) => false;
}

class _CohortSelector extends ConsumerWidget {
  final ValueNotifier<PhdCohortData?> controller;
  const _CohortSelector({required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cohortsAsync = ref.watch(phdCohortsProvider);
    final cohorts = cohortsAsync.value ?? [];

    return Skeletonizer(
      enabled: cohortsAsync.isLoading,
      child: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          return DropdownMenuFormField<PhdCohortData?>(
            enableFilter: true,
            expandedInsets: EdgeInsets.zero,
            initialSelection: controller.value,
            label: const Text('Niên khóa NCS'),
            validator: (cohort) {
              if (cohort == null) return "Vui lòng chọn niên khóa";
              return null;
            },
            dropdownMenuEntries: [
              for (final option in cohorts)
                DropdownMenuEntry(
                  value: option,
                  label: option.cohort,
                ),
            ],
            onSelected: (PhdCohortData? value) {
              controller.value = value;
            },
          );
        },
      ),
    );
  }
}
