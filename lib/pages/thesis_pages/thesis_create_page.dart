import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../business/domain_objects.dart';
import '../../custom_widgets.dart';
// import '../../custom_tiles.dart';

String? titleValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Không được để trống tiêu đề";
  }
  return null;
}

class _State extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final vietnameseTitleNotifer = TextEditingController();
  final englishTitleNotifer = TextEditingController();
  final descriptionNotifer = TextEditingController();
  final teacherNotifer = ValueNotifier<GiangVien?>(null);

  Future<void> saveThesis() async {
    final ok = formKey.currentState!.validate();
    if (!ok) return;

    final thesis = DeTaiThacSi(
      tenTiengViet: vietnameseTitleNotifer.text.trim(),
      tenTiengAnh: englishTitleNotifer.text.trim(),
      ghiChu: descriptionNotifer.text.trim(),
      idGiangVien: teacherNotifer.value!.id,
      giangVien: teacherNotifer.value!,
    );

    // Call the service to save the thesis
    await thesis.create();

    // TODO: re-implement
    // Show a success message
    // final messenger = ScaffoldMessenger.of(context);
    // messenger.showMaterialBanner(
    //   MaterialBanner(
    //     actions: [
    //       TextButton(
    //         onPressed: () => messenger.hideCurrentMaterialBanner(),
    //         child: const Text("Ok"),
    //       ),
    //     ],
    //     content: Text(
    //       "Đề tài đã được lưu thành công!",
    //     ),
    //   ),
    // );

    // Timer(
    //   const Duration(seconds: 3),
    //   () => messenger.hideCurrentMaterialBanner(),
    // );

    // Reset the form fields, but not the teacher
    vietnameseTitleNotifer.clear();
    englishTitleNotifer.clear();
    descriptionNotifer.clear();
  }

  @override
  dispose() {
    vietnameseTitleNotifer.dispose();
    englishTitleNotifer.dispose();
    descriptionNotifer.dispose();
    teacherNotifer.dispose();
    super.dispose();
  }
}

class ThesisCreatePage extends StatelessWidget {
  const ThesisCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _State(),
      builder: (context, child) {
        final state = context.read<_State>();

        final largeScreen = MediaQuery.sizeOf(context).width > 600;

        return Scaffold(
          appBar: AppBar(title: const Text("Thêm đề tài")),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsetsGeometry.all(context.gutter),
                  child: Form(
                    key: state.formKey,
                    child: Column(
                      spacing: context.gutter,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _TeacherSearchField(),
                        _Field(
                          label: "Tên tiếng Việt",
                          controller: state.vietnameseTitleNotifer,
                          validator: titleValidator,
                        ),
                        _Field(
                          label: "Tên tiếng Anh",
                          controller: state.englishTitleNotifer,
                          validator: titleValidator,
                        ),
                        _Field(
                          label: "Ghi chú",
                          controller: state.descriptionNotifer,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(context.gutter),
                child: switch (largeScreen) {
                  true => IntrinsicHeight(
                    child: Row(
                      spacing: context.gutter,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: _SaveButton()),
                        Expanded(child: _ReturnButton()),
                      ],
                    ),
                  ),
                  false => Column(
                    spacing: context.gutter,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _SaveButton(),
                      _ReturnButton(),
                    ],
                  ),
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int? maxLines;
  final String? Function(String?)? validator;

  const _Field({
    required this.controller,
    required this.label,
    this.maxLines,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 2,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}

class _TeacherSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.read<_State>();

    return SearchAnchor(
      suggestionsBuilder: (context, controller) async {
        final teachers = await Teacher.search(
          controller.text,
          isLocalStaff: true,
        );

        return [
          for (final teacher in teachers)
            ListTile(
              title: Text(teacher.hoTenChucDanh),
              subtitle: Text(teacher.email ?? "Unknown email"),
              onTap: () {
                state.teacherNotifer.value = teacher;
                controller.closeView("");
              },
            ),
        ];
      },
      builder: (context, controller) {
        return ValueListenableBuilder(
          valueListenable: state.teacherNotifer,
          builder: (context, Teacher? teacher, child) {
            final focusNode = FocusNode();
            focusNode.addListener(() {
              if (focusNode.hasFocus) {
                controller.openView();
              }
            });

            final iconFocusNode = FocusNode(skipTraversal: true);

            return TextFormField(
              onTap: () => controller.openView(),
              focusNode: focusNode,
              controller: TextEditingController(
                text: teacher?.hoTenChucDanh ?? "",
              ),
              validator: (value) {
                if (teacher == null || value?.isEmpty == true) {
                  return "Chọn giảng viên hướng dẫn!";
                }
                return null;
              },
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Giảng viên hướng dẫn",
                hintText: "Chọn giảng viên hướng dẫn",
                suffixIcon: switch (teacher) {
                  null => Icon(Icons.search),
                  _ => IconButton(
                    icon: Icon(Icons.clear),
                    focusNode: iconFocusNode,
                    onPressed: () => state.teacherNotifer.value = null,
                  ),
                },
              ),
            );
          },
        );
      },
    );
  }

  SearchAnchor buildSearchAnchor(_State state) {
    return SearchAnchor(
      suggestionsBuilder: (context, controller) async {
        final teachers = await Teacher.search(
          controller.text,
          isLocalStaff: true,
        );

        return [
          for (final teacher in teachers)
            ListTile(
              title: Text(teacher.hoTenChucDanh),
              subtitle: Text(teacher.email ?? "Unknown email"),
              onTap: () {
                state.teacherNotifer.value = teacher;
                controller.closeView("");
              },
            ),
        ];
      },
      builder: (context, controller) {
        return ValueListenableBuilder(
          valueListenable: state.teacherNotifer,
          builder: (context, Teacher? teacher, child) {
            return TextFormField(
              onTap: () => controller.openView(),
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Giảng viên hướng dẫn",
                suffixIcon: Icon(Icons.search),
              ),
            );
          },
        );
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.read<_State>();
    return FilledButton.icon(
      icon: const Icon(Icons.save),
      // onPressed: () => state.saveThesis(),
      onPressed: () => state.saveThesis(),
      label: const Text("Lưu"),
    );
  }
}

class _ReturnButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
      label: const Text("Trở về"),
    );
  }
}
