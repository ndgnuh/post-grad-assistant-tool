import 'dart:async';
import 'dart:io';

import '../../custom_widgets.dart';
import '../../shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';

// import 'package:provider/provider.dart';
// import 'dart:async';
// import 'package:flutter_gutter/flutter_gutter.dart';
//
// import '../../custom_widgets.dart';
// // import '../../custom_tiles.dart';
//
String? titleValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Không được để trống tiêu đề";
  }
  return null;
}

FutureOr<List<Widget>> Function(BuildContext, SearchController)
teacherSuggestionBuilder(ValueNotifier<TeacherData?> notifier) {
  Future<List<Widget>> builder(
    BuildContext context,
    SearchController controller,
  ) async {
    final ref = ProviderScope.containerOf(context);
    final db = await ref.read(mainDatabaseProvider.future);
    final searchText = controller.text;
    final teachers = await db.searchTeachers(searchText: searchText).get();

    return [
      for (final teacher in teachers)
        ListTile(
          title: Text(teacher.name),
          subtitle: Text(teacher.email ?? "Unknown email"),
          onTap: () {
            notifier.value = teacher;
            controller.closeView("");
          },
        ),
    ];
  }

  return builder;
}

class _FormStates {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<TeacherData?> supervisorNotifer = ValueNotifier(null);
  final ValueNotifier<TeacherData?> secondarySupervisorNotifer = ValueNotifier(
    null,
  );
  final TextEditingController vietnameseTitleNotifer = TextEditingController();
  final TextEditingController englishTitleNotifer = TextEditingController();
  final TextEditingController descriptionNotifer = TextEditingController();

  final TextEditingController supervisorFormatNotifier =
      TextEditingController();
  final TextEditingController secondarySupervisorFormatNotifier =
      TextEditingController();

  String get vietnameseTitle => vietnameseTitleNotifer.text.trim();
  String get englishTitle => englishTitleNotifer.text.trim();
  String get description => descriptionNotifer.text.trim();

  _FormStates() {
    supervisorNotifer.addListener(() {
      final teacher = supervisorNotifer.value;
      supervisorFormatNotifier.text = teacher != null ? teacher.name : "";
    });
    secondarySupervisorNotifer.addListener(() {
      final teacher = secondarySupervisorNotifer.value;
      secondarySupervisorFormatNotifier.text = teacher != null
          ? teacher.name
          : "";
    });
  }
}

class ThesisCreatePage extends StatelessWidget {
  static const routeName = '/thesis/create';
  const ThesisCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formStates = _FormStates();

    return CommonShortcuts(
      child: Scaffold(
        appBar: ConstrainedAppBar(
          child: AppBar(title: const Text("Thêm đề tài")),
        ),
        body: ConstrainedBody(
          child: Form(
            key: formStates.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.gutter),
              child: Column(
                spacing: context.gutter,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                verticalDirection: context.verticalDirection,
                children: [
                  SearchAnchor(
                    suggestionsBuilder: teacherSuggestionBuilder(
                      formStates.supervisorNotifer,
                    ),
                    builder: (context, controller) {
                      final focusNode = FocusNode();
                      focusNode.addListener(() {
                        if (focusNode.hasPrimaryFocus) {
                          controller.openView();
                        }
                      });
                      return TextFormField(
                        focusNode: focusNode,
                        controller: formStates.supervisorFormatNotifier,
                        decoration: InputDecoration(
                          labelText: "Giảng viên hướng dẫn",
                          suffixIcon: Icon(Symbols.search),
                        ),
                        readOnly: true,
                        validator: (_) {
                          if (formStates.supervisorNotifer.value == null) {
                            return "Chọn giảng viên hướng dẫn!";
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SearchAnchor(
                    suggestionsBuilder: teacherSuggestionBuilder(
                      formStates.secondarySupervisorNotifer,
                    ),
                    builder: (context, controller) {
                      final focusNode = FocusNode();
                      focusNode.addListener(() {
                        if (focusNode.hasPrimaryFocus) {
                          controller.openView();
                        }
                      });
                      return TextFormField(
                        focusNode: focusNode,
                        controller:
                            formStates.secondarySupervisorFormatNotifier,
                        decoration: InputDecoration(
                          labelText: "Giảng viên đồng hướng dẫn",
                          suffixIcon: Icon(Symbols.search),
                        ),
                        readOnly: true,
                      );
                    },
                  ),

                  TextFormField(
                    controller: formStates.vietnameseTitleNotifer,
                    decoration: InputDecoration(
                      labelText: "Tên tiếng Việt",
                    ),
                    validator: titleValidator,
                  ),
                  TextFormField(
                    controller: formStates.englishTitleNotifer,
                    decoration: InputDecoration(labelText: "Tên tiếng Anh"),
                    validator: titleValidator,
                  ),
                  TextFormField(
                    controller: formStates.descriptionNotifer,
                    scrollPadding: EdgeInsets.only(
                      top: context.gutter,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(context.gutter),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Mô tả đề tài",
                      hintText: "Hiện tại CSDL chưa lưu mô tả đề tài",
                    ),
                    maxLines: 10,
                    readOnly: true,
                    enabled: false,
                  ),
                  if (Platform.isAndroid || Platform.isIOS) Spacer(),
                  _SaveButton(formStates: formStates),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// class _Field extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final int? maxLines;
//   final String? Function(String?)? validator;
//
//   const _Field({
//     required this.controller,
//     required this.label,
//     this.maxLines,
//     this.validator,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       maxLines: maxLines ?? 2,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//       ),
//     );
//   }
// }
//
// class _TeacherSearchField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final state = context.read<_State>();
//
//     return SearchAnchor(
//       suggestionsBuilder: (context, controller) async {
//         final teachers = await Teacher.search(
//           controller.text,
//           isLocalStaff: true,
//         );
//
//         return [
//           for (final teacher in teachers)
//             ListTile(
//               title: Text(teacher.hoTenChucDanh),
//               subtitle: Text(teacher.email ?? "Unknown email"),
//               onTap: () {
//                 state.teacherNotifer.value = teacher;
//                 controller.closeView("");
//               },
//             ),
//         ];
//       },
//       builder: (context, controller) {
//         return ValueListenableBuilder(
//           valueListenable: state.teacherNotifer,
//           builder: (context, Teacher? teacher, child) {
//             final focusNode = FocusNode();
//             focusNode.addListener(() {
//               if (focusNode.hasFocus) {
//                 controller.openView();
//               }
//             });
//
//             final iconFocusNode = FocusNode(skipTraversal: true);
//
//             return TextFormField(
//               onTap: () => controller.openView(),
//               focusNode: focusNode,
//               controller: TextEditingController(
//                 text: teacher?.hoTenChucDanh ?? "",
//               ),
//               validator: (value) {
//                 if (teacher == null || value?.isEmpty == true) {
//                   return "Chọn giảng viên hướng dẫn!";
//                 }
//                 return null;
//               },
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: "Giảng viên hướng dẫn",
//                 hintText: "Chọn giảng viên hướng dẫn",
//                 suffixIcon: switch (teacher) {
//                   null => Icon(Icons.search),
//                   _ => IconButton(
//                     icon: Icon(Icons.clear),
//                     focusNode: iconFocusNode,
//                     onPressed: () => state.teacherNotifer.value = null,
//                   ),
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   SearchAnchor buildSearchAnchor(_State state) {
//     return SearchAnchor(
//       suggestionsBuilder: (context, controller) async {
//         final teachers = await Teacher.search(
//           controller.text,
//           isLocalStaff: true,
//         );
//
//         return [
//           for (final teacher in teachers)
//             ListTile(
//               title: Text(teacher.hoTenChucDanh),
//               subtitle: Text(teacher.email ?? "Unknown email"),
//               onTap: () {
//                 state.teacherNotifer.value = teacher;
//                 controller.closeView("");
//               },
//             ),
//         ];
//       },
//       builder: (context, controller) {
//         return ValueListenableBuilder(
//           valueListenable: state.teacherNotifer,
//           builder: (context, Teacher? teacher, child) {
//             return TextFormField(
//               onTap: () => controller.openView(),
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: "Giảng viên hướng dẫn",
//                 suffixIcon: Icon(Icons.search),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//

class _SaveButton extends ConsumerWidget {
  final _FormStates formStates;
  const _SaveButton({required this.formStates});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = Navigator.of(context);
    return FilledButton.icon(
      icon: const Icon(Icons.save),
      onPressed: () async {
        final ok = formStates.formKey.currentState!.validate();
        if (!ok) return;

        final db = await ref.read(mainDatabaseProvider.future);
        final supervisor = formStates.supervisorNotifer.value;
        final secondarySupervisor = formStates.secondarySupervisorNotifer.value;
        db.createThesis(
          vietnameseTitle: formStates.vietnameseTitle,
          englishTitle: formStates.englishTitle,
          description: formStates.description,
          supervisor: supervisor!,
          secondarySupervisor: secondarySupervisor,
        );

        navigator.pop();

        WidgetsBinding.instance.addPostFrameCallback((duration) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Đã thêm đề tài thành công!")),
          );
        });
      },
      label: const Text("Lưu"),
    );
  }
}
