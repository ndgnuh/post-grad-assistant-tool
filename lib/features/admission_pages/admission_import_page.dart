import 'package:material_symbols_icons/symbols.dart';

import '../../business/widgets/admission_council_consumer.dart';
import '../../utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import './_import.dart';

class AdmissionImportPage extends StatefulWidget {
  static const routeName = '/admission/add';
  const AdmissionImportPage({super.key});

  @override
  State<AdmissionImportPage> createState() => _AdmissionImportPageState();
}

class _AdmissionImportPageState extends State<AdmissionImportPage> {
  final ValueNotifier<AdmissionCouncilData?> councilNotifier = .new(null);
  final ValueNotifier<List<StudentCompanion>> studentListNotifier = .new([]);
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    councilNotifier.dispose();
    studentListNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final gutter = context.gutter;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhập hồ sơ tuyển sinh'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(gutter),
          child: Column(
            spacing: gutter,
            children: [
              // Chọn hội đồng tuyển sinh
              AdmissionCouncilPicker(
                notifier: councilNotifier,
                validator: (_) {
                  if (councilNotifier.value == null) {
                    return "Không được để trống";
                  }
                  return null;
                },
              ),

              // Nhập dữ liệu
              IntrinsicHeight(
                child: ValueListenableBuilder(
                  valueListenable: councilNotifier,
                  builder: (context, council, child) {
                    return ValueListenableBuilder(
                      valueListenable: studentListNotifier,
                      builder: (context, studentList, child) {
                        // Show conditions
                        final showImportButtons = council != null;
                        final showSaveButton = studentList.isNotEmpty;

                        return Row(
                          spacing: gutter,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Spacer(),
                            if (showImportButtons) ...[
                              OutlinedButton(
                                onPressed: null,
                                child: Text("Nhập từ clipboard"),
                              ),
                              OutlinedButton(
                                onPressed: null,
                                child: Text("Nhập XLSX"),
                              ),
                              OutlinedButton(
                                onPressed: () async {
                                  try {
                                    studentListNotifier.value =
                                        await readProfilesFromJson(
                                          council: council,
                                        );
                                  } catch (error) {
                                    messenger.showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Lỗi khi nhập JSON: $error",
                                        ),
                                      ),
                                    );
                                    studentListNotifier.value = [];
                                  }
                                },
                                child: Text("Nhập từ file JSON"),
                              ),
                            ],

                            if (showSaveButton)
                              /// Save button
                              FilledButton.icon(
                                icon: Icon(Symbols.save),
                                label: Text("Lưu"),
                                onPressed: () {
                                  final ok = formKey.currentState!.validate();
                                  if (!ok) return;

                                  final ref = ProviderScope.containerOf(
                                    context,
                                  );

                                  /// TODO: use something more proper here
                                  final notifier = ref.read(
                                    studentsMutationProvider.notifier,
                                  );
                                  notifier.addStudents(studentList);
                                  navigator.pop();
                                },
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: studentListNotifier,
                  builder: (context, studentList, child) {
                    return _ImportTable(studentList: studentList);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImportTable extends ConsumerWidget {
  final List<StudentCompanion> studentList;

  // Thông tin cần thiết:
  // số hồ sơ, tên, giới tính, ngày sinh, nơi sinh,
  // email, số điện thoại
  // trường đại học, ngành đại học, năm tốt nghiệp, hệ tốt nghiệp, ngày tốt nghiện, hạng tốt nghiệp,
  // ngành thạc sĩ, định hướng chuyên sâu
  // Kéo từ web:
  static const columns = [
    DataColumn(label: Text("Mã hồ sơ")),
    DataColumn(label: Text("Diện tuyển sinh")),
    DataColumn(label: Text("Họ và tên")),
    DataColumn(label: Text("Giới tính")),
    DataColumn(label: Text("Ngày sinh")),
    DataColumn(label: Text("Nơi sinh")),
    DataColumn(label: Text("Email")),
    DataColumn(label: Text("Số điện thoại")),
    DataColumn(label: Text("Trường TN đại học")),
    DataColumn(label: Text("Ngành TN đại học")),
    DataColumn(label: Text("Hệ TN đại học")),
    DataColumn(label: Text("Ngày TN đại học")),
    DataColumn(label: Text("Xếp loại TN đại học")),
    DataColumn(label: Text("Ngành thạc sĩ")),
    DataColumn(label: Text("Định hướng chuyên sâu")),
  ];

  const _ImportTable({required this.studentList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (studentList.isEmpty) {
      return Center(child: Text("Không có hồ sơ nào"));
    }

    return ExpandedScrollView(
      child: DataTable(
        columns: columns,
        rows: [
          for (final item in studentList)
            DataRow(
              cells: [
                DataCell(Text(item.admissionId.value!)),
                DataCell(Text(item.admissionType.value!.label)),
                DataCell(Text(item.name.value)),
                DataCell(Text(item.gender.value!.label)),
                DataCell(
                  Text(item.dateOfBirth.value!.toDmy(separator: '/')),
                ),
                DataCell(Text(item.placeOfBirth.value!)),
                DataCell(Text(item.personalEmail.value!)),
                DataCell(Text(item.phone.value!)),
                DataCell(Text(item.bachelorUniversity.value!)),
                DataCell(Text(item.bachelorMajor.value!)),
                DataCell(Text(item.bachelorProgram.value!)),
                DataCell(
                  Text(
                    item.bachelorGraduationDate.value!.toDmy(separator: '/'),
                  ),
                ),
                DataCell(Text(item.bachelorGraduationRank.value!)),
                DataCell(Text(item.masterMajor.value!)),
                DataCell(Text(item.intendedSpecialization.value!)),
              ],
            ),
        ],
      ),
    );
  }
}
