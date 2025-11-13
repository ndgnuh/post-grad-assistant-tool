import 'package:fami_tools/pages/msc_thesis_assignment/providers.dart';
import 'package:fami_tools/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import './_import.dart';

class AdmissionImportPage extends StatelessWidget {
  static const routeName = '/admission/add';
  const AdmissionImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Admission'),
      ),
      body: Padding(
        padding: EdgeInsets.all(gutter),
        child: Column(
          spacing: gutter,
          children: [
            IntrinsicHeight(
              child: Row(
                spacing: gutter,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Spacer(), _SaveToDatabaseButton(), _ImportButton()],
              ),
            ),
            Expanded(child: _ImportTable()),
          ],
        ),
      ),
    );
  }
}

class _ImportButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        final notifier = ref.read(importListProvider.notifier);
        final data = await readProfilesFromJson() ?? [];
        if (data.isEmpty) return;
        notifier.set(data);
      },
      child: Text("Import từ JSON"),
    );
  }
}

class _SaveToDatabaseButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(importListProvider);
    final navigator = Navigator.of(context);
    if (data.isEmpty) {
      return SizedBox.shrink();
    }

    return ElevatedButton(
      onPressed: () async {
        final notifier = ref.read(studentsMutationProvider.notifier);
        notifier.addStudents(data);
        navigator.pop();
      },
      child: Text("Lưu vào CSDL"),
    );
  }
}

class _ImportTable extends ConsumerWidget {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(importListProvider);
    final dateFormat = DateFormat('dd/MM/yyyy');

    return ExpandedScrollView(
      child: DataTable(
        columns: columns,
        rows: [
          for (final item in list)
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
