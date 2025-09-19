import 'package:fami_tools/business/db_v2_providers/phd_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import '../../business/drift_orm.dart';
import '../../custom_widgets.dart';

const _pagePreferenceKey = 'phd_student/create';
const _lastCohortKey = '$_pagePreferenceKey/cohort';

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

class _GenderPickerState extends State<GenderPicker> {
  late ValueNotifier<Gender> notifier;

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

  @override
  dispose() {
    super.dispose();
    if (widget.valueNotifier == null) {
      notifier.dispose();
    }
  }

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
}

Future<String> _getLastCohort() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(_lastCohortKey) ?? '';
}

Future<void> _setLastCohort(String cohort) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_lastCohortKey, cohort);
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

  Future<void> create(MyDriftDatabase db) async {
    await db.into(db.phdStudent).insert(phdStudentCompanion);
  }

  PhdStudentCompanion get phdStudentCompanion {
    return PhdStudentCompanion.insert(
      // management information
      cohort: cohortController.text,
      admissionId: Value(admissionIdController.text),

      // basic information
      name: nameController.text,
      gender: Value(genderController.value),
      dateOfBirth: Value(dateOfBirthController.value),
      placeOfBirth: Value(placeOfBirthController.text),

      // contact information
      personalEmail: emailController.text,
      phone: phoneController.text,

      supervisorId: supervisorNotifier.value!.id,
      secondarySupervisorId: Value(secondarySupervisorNotifier.value?.id),
      thesis: thesisController.text,
      majorSpecialization: Value(specializationController.text),
    );
  }

  _ViewModel() {
    _getLastCohort().then((value) => cohortController.text = value);
  }
}

final _viewModelNotifier = Provider<_ViewModel>((ref) {
  return _ViewModel();
});

class PhdStudentCreatePage extends StatelessWidget {
  static const routeName = '/phd-students/create';
  const PhdStudentCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuyển sinh NCS'),
      ),
      body: Column(
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
    );
  }
}

class _SaveButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbState = ref.watch(driftDatabaseProvider);
    switch (dbState) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error, :final stackTrace):
        return Text('Error: $error\n$stackTrace');
      default:
    }

    final model = ref.watch(_viewModelNotifier);
    final formKey = model.formKey;
    return FilledButton(
      onPressed: () async {
        if (formKey.currentState?.validate() ?? false) {
          final db = dbState.value!;
          await model.create(db);
          Navigator.of(context).pop();
          ref.invalidate(phdCohortsProvider);
          ref.invalidate(phdStudentsByCohortProvider);
        }
      },
      child: const Text('Save'),
    );
  }
}

class _InformationForm extends ConsumerWidget {
  String? Function(String?) notEmptyValidator(String message) {
    return (value) => (value == null || value.isEmpty) ? message : null;
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(_viewModelNotifier);
    final formKey = model.formKey;
    final gutter = context.gutter;

    return FocusScope(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(gutter),
          child: Column(
            spacing: gutter,
            children: [
              // Thông tin quản lý chung
              TextFormField(
                controller: model.cohortController,
                decoration: labelText('Khóa tuyển sinh'),
                validator: notEmptyValidator('Vui lòng nhập khóa học'),
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
    final dbState = ref.watch(driftDatabaseProvider);
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
