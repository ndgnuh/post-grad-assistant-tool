import 'package:excel/excel.dart';
import 'package:fami_tools/datamodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../custom_widgets.dart';
import './_import.dart';

final importListProvider = NotifierProvider(
  ImportListProvider.new,
);

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

class ImportListProvider extends Notifier<List<JsonSchema>> {
  @override
  List<JsonSchema> build() {
    return [];
  }

  void set(List<JsonSchema> data) {
    state = data;
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
      onPressed: null,
      // TODO: port to drift
      // onPressed: () async {
      // await saveDataToDatabase(data);
      // final notifier = ref.read(importListProvider.notifier);
      // notifier.set([]);
      // ref.invalidate(admissionStudentsProvider);
      // navigator.pop();
      // },
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
                DataCell(Text(item.admissionId)),
                DataCell(Text(item.admissionType.label)),
                DataCell(Text(item.name)),
                DataCell(Text(item.gender.label)),
                DataCell(Text(item.dateOfBirth.toDmy())),
                DataCell(Text(item.placeOfBirth)),
                DataCell(Text(item.email)),
                DataCell(Text(item.phoneNumber)),
                DataCell(Text(item.bachelorUniversity)),
                DataCell(Text(item.bachelorMajor)),
                DataCell(Text(item.bachelorDegreeType)),
                DataCell(Text(dateFormat.format(item.bachelorGraduationDate))),
                DataCell(Text(item.bachelorGraduationRank)),
                DataCell(Text(item.masterMajor)),
                DataCell(Text(item.specializationOrientation)),
              ],
            ),
        ],
      ),
    );
  }
}
