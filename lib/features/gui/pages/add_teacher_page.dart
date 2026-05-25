import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/experimental/mutation.dart';

import '../../../business/business_enums.dart';
import '../../../business/db_v2_providers.dart' show TeacherData;
import '../../../custom_widgets.dart';
import '../../teacher_management/teacher_management.dart';
import '../../teacher_pages/details.dart';
import '../widgets/business_inputs.dart';

class AddTeacherPage extends StatefulWidget {
  const AddTeacherPage({super.key});

  @override
  State<AddTeacherPage> createState() => _AddTeacherPageState();
}

class _AddTeacherPageState extends State<AddTeacherPage> {
  final formKey = GlobalKey<FormState>();
  final controllers = (
    // Basic
    name: TextEditingController(),
    email: TextEditingController(),
    phoneNumber: TextEditingController(),
    gender: ValueNotifier<Gender>(Gender.male),
    pronoun: ValueNotifier<Pronoun>(Pronoun.thay),

    // Academic titles
    academicDegree: ValueNotifier<AcademicDegree?>(null),
    academicRank: ValueNotifier<AcademicRank?>(null),

    // Workplace
    university: TextEditingController(),
    faculty: TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
    controllers.gender.addListener(() {
      switch (controllers.gender.value) {
        case Gender.female:
          controllers.pronoun.value = Pronoun.co;
        default:
          controllers.pronoun.value = Pronoun.thay;
      }
    });
  }

  @override
  void dispose() {
    controllers.name.dispose();
    controllers.phoneNumber.dispose();
    controllers.email.dispose();
    controllers.gender.dispose();
    controllers.pronoun.dispose();

    controllers.academicDegree.dispose();
    controllers.academicDegree.dispose();
    controllers.academicRank.dispose();

    controllers.university.dispose();
    controllers.faculty.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm GV"),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(context.gutter),
        child: Form(
          key: formKey,
          child: Column(
            spacing: context.gutter,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: context.gutterSmall,
                    children: [
                      TextFormField(
                        validator: (value) => (value ?? "").isEmpty
                            ? "Không được để trống"
                            : null,
                        controller: controllers.name,
                        decoration: InputDecoration(
                          labelText: "Họ tên giảng viên",
                        ),
                      ),

                      EzRow(
                        children: [
                          EnumPicker<Gender>(
                            label: Text("Giới tính"),
                            controller: controllers.gender,
                            values: [Gender.male, Gender.female],
                          ),
                          EnumPicker<Pronoun>(
                            label: Text("Xưng hô"),
                            controller: controllers.pronoun,
                            valueFormatter: (pronoun) {
                              return pronoun?.pronoun ?? "-";
                            },
                            values: Pronoun.values,
                          ),
                        ],
                      ),
                      EnumPicker<AcademicRank>(
                        label: Text("Học hàm"),
                        controller: controllers.academicRank,
                        values: AcademicRank.values,
                      ),
                      EnumPicker<AcademicDegree>(
                        label: Text("Học vị"),
                        controller: controllers.academicDegree,
                        values: AcademicDegree.values,
                      ),

                      Divider(),
                      TextFormField(
                        controller: controllers.email,
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                      TextFormField(
                        controller: controllers.phoneNumber,
                        decoration: InputDecoration(
                          labelText: "Số điện thoại",
                        ),
                      ),

                      Divider(),
                      TextFormField(
                        controller: controllers.university,
                        decoration: InputDecoration(
                          labelText: "Công tác tại đại học",
                        ),
                      ),
                      TextFormField(
                        controller: controllers.faculty,
                        decoration: InputDecoration(
                          labelText: "Khoa, trường",
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              _SaveButton(state: this),
            ],
          ),
        ),
      ),
    );
  }
}

final _addTeacherMutation = Mutation<TeacherData>();

class _SaveButton extends ConsumerWidget {
  final _AddTeacherPageState state;
  const _SaveButton({required this.state});

  static const title = Text("Lưu");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mState = ref.watch(_addTeacherMutation);
    switch (mState) {
      // Waiting to be run
      case MutationIdle():
        return FilledButton(
          onPressed: () {
            _addTeacherMutation.run(ref, (tsx) async {
              final sv = await tsx.get(
                teacherManagementServiceProvider.future,
              );
              final controllers = state.controllers;

              return sv.addTeacher(
                name: controllers.name.text,
                gender: controllers.gender.value,
                email: controllers.email.text,
                phoneNumber: controllers.phoneNumber.text,
                academicRank: controllers.academicRank.value,
                academicDegree: controllers.academicDegree.value,
                university: controllers.university.text,
                faculty: controllers.faculty.text,
              );
            });
          },
          child: title,
        );

      // Running
      case MutationPending():
        return FilledButton.icon(
          onPressed: null,
          label: title,
          icon: CircularProgressIndicator(),
        );

      /// error
      case MutationError(:final error):
        return FilledButton(
          onPressed: () => _addTeacherMutation.reset(ref),
          child: Text("Lỗi: $error"),
        );

      case MutationSuccess(:final value):
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Thêm thành công"),
            IntrinsicHeight(
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherDetailsPage(id: value.id),
                      ),
                    ),
                    child: Text("Xem thông tin giảng viên"),
                  ),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Quay lại"),
                  ),
                ],
              ),
            ),
          ],
        );
    }
  }
}
