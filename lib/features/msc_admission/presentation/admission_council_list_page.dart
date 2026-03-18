import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../business/db_v2_providers.dart';
import '../../../core/router.dart';
import '../../../custom_widgets.dart';
import '../../../shortcuts.dart';
import 'providers.dart';

class AdmissionCouncilListPage extends StatelessWidget {
  const AdmissionCouncilListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hội đồng tuyển sinh"),
        actions: [
          TextButton.icon(
            onPressed: () => AppRouter().msc.toAdmissionCouncilCreatePage(),
            icon: Icon(Symbols.add),
            label: Text("Tạo mới"),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(context.gutter),
        child: PlatformAdaptiveLayout(
          mobile: _CouncilList(),
          desktop: _CouncilTable(),
        ),
      ),
    );
  }
}

class _TeacherNameCell extends ConsumerWidget {
  final int teacherId;

  const _TeacherNameCell({super.key, required this.teacherId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherAsync = ref.watch(teacherByIdProvider(teacherId));
    switch (teacherAsync) {
      case AsyncLoading():
        return Text("...");
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return Text(error.toString());
      case AsyncData(value: final teacher):
        return Text(teacher.nameWithTitle);
    }
  }
}

class _CouncilTable extends ConsumerWidget {
  static const columns = [
    DataColumn(label: Text("Tiểu ban")),
    DataColumn(
      label: Text("Chủ tịch"),
      columnWidth: FlexColumnWidth(),
    ),
    DataColumn(
      label: Text("Thư ký"),
      columnWidth: FlexColumnWidth(),
    ),
    DataColumn(
      label: Text("Ủy viên 1"),
      columnWidth: FlexColumnWidth(),
    ),
    DataColumn(
      label: Text("Ủy viên 2"),
      columnWidth: FlexColumnWidth(),
    ),
    DataColumn(
      label: Text("Ủy viên 3"),
      columnWidth: FlexColumnWidth(),
    ),
    DataColumn(
      label: Text("Quyết định"),
      columnWidth: FlexColumnWidth(),
    ),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final councils = ref.watch(councilsProvider);
    switch (councils) {
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return Center(child: Text("Error: $error"));
      case AsyncLoading():
        return Center(child: LinearProgressIndicator());
      case AsyncData(value: final councils):
        final rows = [
          for (final council in councils)
            DataRow(
              cells: [
                DataCell(Text(council.year)),
                DataCell(_TeacherNameCell(teacherId: council.presidentId)),
                DataCell(_TeacherNameCell(teacherId: council.secretaryId)),
                DataCell(_TeacherNameCell(teacherId: council.member1Id)),
                DataCell(_TeacherNameCell(teacherId: council.member2Id)),
                DataCell(_TeacherNameCell(teacherId: council.member3Id)),

                /// TODO: use the new document stuff
                DataCell(Text(council.establishmentDecisionId)),
              ],
            ),
        ];
        return Expanded(
          child: DataTable(columns: columns, rows: rows),
        );
    }
  }
}

class _CouncilList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final councils = ref.watch(councilsProvider);
    switch (councils) {
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return Center(child: Text("Error: $error"));
      case AsyncLoading():
        return Center(child: LinearProgressIndicator());
      case AsyncData(value: final councils):
        return ListView.separated(
          itemBuilder: (context, i) {
            final council = councils[i];
            return ListTile(
              title: Text("Hội đồng năm ${council.year}"),
              subtitle: Text("Click để xem"),
              leading: Icon(Symbols.group),
              trailing: Icon(Symbols.chevron_forward),
            );
          },
          separatorBuilder: (context, _) => Divider(),
          itemCount: councils.length,
        );
    }
  }
}
