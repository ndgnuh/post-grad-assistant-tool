import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import './providers.dart';

const _lastCohortKey = '$_pagePreferenceKey/cohort';
const _pagePreferenceKey = 'phd_student/create';

final _viewModelProvider = NotifierProvider(_ViewModelNotifier.new);

Future<String> _getLastCohort() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(_lastCohortKey) ?? '';
}

Future<void> _setLastCohort(String cohort) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_lastCohortKey, cohort);
}

class GenderPicker extends StatefulWidget {
  final Gender initialSelection;
  final ValueChanged<Gender?>? onChanged;
  final ValueNotifier<Gender>? valueNotifier;

  const GenderPicker({
    super.key,
    this.onChanged,
    this.valueNotifier,
    this.initialSelection = Gender.unknown,
  });

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

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
      body: ConstrainedBody(
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
                child: _SaveButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenderPickerState extends State<GenderPicker> {
  late ValueNotifier<Gender> notifier;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (gender) {
        if (gender == null) return "Không được để trống";
        return null;
      },
      decoration: InputDecoration(
        labelText: "Giới tính",
      ),
      onChanged: (gender) {
        notifier.value = gender ?? notifier.value;
        widget.onChanged?.call(gender);
      },
      items: [
        DropdownMenuItem(value: Gender.male, child: Text("Nam")),
        DropdownMenuItem(value: Gender.female, child: Text("Nữ")),
        DropdownMenuItem(value: Gender.unknown, child: Text("Không rõ")),
      ],
    );
  }

  @override
  dispose() {
    super.dispose();
    if (widget.valueNotifier == null) {
      notifier.dispose();
    }
  }

  @override
  initState() {
    final widgetNotifier = widget.valueNotifier;
    if (widgetNotifier != null) {
      notifier = widgetNotifier;
    } else {
      notifier = ValueNotifier<Gender>(widget.initialSelection);
    }
    super.initState();
  }
}

class _InformationForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(_viewModelProvider);
    final formKey = model.formKey;
    final gutter = context.gutter;

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(gutter),
        child: FocusScope(
          child: Column(
            spacing: gutter,
            children: [
              // Thông tin quản lý chung
              TextFormField(
                controller: model.cohortController,
                decoration: labelText('Khóa tuyển sinh'),
                validator: notEmptyValidator('Vui lòng nhập khóa học'),
                onFieldSubmitted: (value) => {
                  model.cohortController.text = value.trim(),
                },
                onChanged: (value) => _setLastCohort(value),
              ),

              Divider(),

              // Thông tin cơ bản
              TextFormField(
                controller: model.admissionIdController,
                decoration: labelText('Mã số hồ sơ tuyển sinh'),
                validator: notEmptyValidator('Vui lòng nhập mã số NCS'),
              ),
              TextFormField(
                controller: model.nameController,
                validator: notEmptyValidator('Vui lòng nhập họ tên NCS'),
                decoration: labelText('Họ tên NCS'),
              ),
              DateTimePicker(
                labelText: 'Ngày sinh',
                validator: (date) =>
                    date == null ? 'Vui lòng chọn ngày sinh' : null,
                controller: model.dateOfBirthController,
              ),
              TextFormField(
                controller: model.placeOfBirthController,
                decoration: labelText('Nơi sinh'),
                validator: notEmptyValidator('Vui lòng chọn ngày sinh'),
              ),

              GenderPicker(
                valueNotifier: model.genderController,
              ),

              // TextFormField(
              //   decoration: labelText('Giới tính'),
              //   validator: notEmptyValidator('Vui lòng chọn giới tính'),
              // ),
              Divider(),

              // Thông tin liên lạc
              TextFormField(
                decoration: labelText('Số điện thoại'),
                controller: model.phoneController,
                validator: notEmptyValidator('Không được bỏ trống'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: labelText('Email cá nhân'),
                controller: model.emailController,
                validator: emailValidator('Không được bỏ trống'),
              ),

              Divider(),

              // TextFormField(
              //   controller: model.specializationController,
              //   decoration: labelText('Hướng chuyên sâu'),
              //   validator: notEmptyValidator('Không được để trống'),
              // ),

              // Thông tin đề tài nghiên cứu
              TextFormField(
                controller: model.thesisController,
                decoration: labelText('Tên đề tài dự kiến'),
                validator: notEmptyValidator('Không được để trống'),
              ),

              _TeacherSelector(
                secondary: false,
                valueController: model.supervisorNotifier,
              ),
              _TeacherSelector(
                secondary: true,
                valueController: model.secondarySupervisorNotifier,
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

class _SaveButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(_viewModelProvider);
    final formKey = model.formKey;
    return FilledButton(
      onPressed: () async {
        if (formKey.currentState?.validate() ?? false) {
          final mutation = ref.read(phdStudentsMutationProvider.notifier);
          mutation.addPhdStudent(
            cohort: model.cohortController.text.trim(),
            admissionId: (model.admissionIdController.text.trim()),

            // basic information
            name: model.nameController.text.trim(),
            gender: model.genderController.value,
            dateOfBirth: model.dateOfBirthController.value!,
            placeOfBirth: model.placeOfBirthController.text.trim(),

            // contact information
            personalEmail: model.emailController.text.trim(),
            phone: model.phoneController.text.trim(),

            supervisorId: model.supervisorNotifier.value!.id,
            secondarySupervisorId: model.secondarySupervisorNotifier.value?.id,
            thesis: model.thesisController.text.trim(),
            majorSpecialization: model.specializationController.text.trim(),
          );
          ref.invalidate(_viewModelProvider);
          Navigator.of(context).pop();
        }
      },
      child: const Text('Save'),
    );
  }
}

class _TeacherSelector extends ConsumerWidget {
  final bool secondary;
  final ValueNotifier<TeacherData?> valueController;

  const _TeacherSelector({
    this.secondary = false,
    required this.valueController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbState = ref.watch(appDatabaseProvider);
    switch (dbState) {
      case AsyncError(:final error, :final stackTrace):
        return Text('Error: $error\n$stackTrace');
      case AsyncLoading():
        return const CircularProgressIndicator();
      default:
    }

    final db = dbState.value!;
    final formatController = TextEditingController(
      text: valueController.value?.name ?? '',
    );

    return SearchAnchor(
      suggestionsBuilder: (context, controller) async {
        if (controller.text.isEmpty) {
          return const [
            ListTile(
              title: Text('Vui lòng nhập tên giáo viên'),
            ),
          ];
        }

        final query = db.searchTeacher(
          searchText: controller.text,
          outsider: false,
        );

        final teachers = await query.get();

        return [
          for (final teacher in teachers)
            ListTile(
              title: Text(teacher.name ?? ''),
              subtitle: Text(teacher.personalEmail ?? ''),
              onTap: () {
                valueController.value = teacher;
                formatController.text = teacher.name;
                controller.closeView(null);
              },
            ),
        ];
      },
      builder: (context, controller) => TextFormField(
        controller: formatController,
        decoration: InputDecoration(
          labelText: secondary
              ? 'Giáo viên hướng dẫn phụ'
              : 'Giáo viên hướng dẫn',
        ),
        readOnly: true,
        onTap: () {
          controller.clear();
          controller.openView();
        },
        validator: (value) {
          if (secondary) return null;
          if (valueController.value == null) return 'Không được bỏ trống';
          return null;
        },
      ),
    );
  }
}

class _ViewModelNotifier extends Notifier<_ViewModel> {
  @override
  _ViewModel build() {
    return _ViewModel();
  }
}

class _ViewModel {
  final formKey = GlobalKey<FormState>();
  final supervisorNotifier = ValueNotifier<TeacherData?>(null);
  final secondarySupervisorNotifier = ValueNotifier<TeacherData?>(null);
  final specializationController = TextEditingController();
  final thesisController = TextEditingController();

  final cohortController = TextEditingController();

  final admissionIdController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = ValueNotifier<Gender>(Gender.unknown);

  final dateOfBirthController = ValueNotifier<DateTime?>(null);
  final placeOfBirthController = TextEditingController();

  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  _ViewModel() {
    _getLastCohort().then((value) => cohortController.text = value);
  }
}
