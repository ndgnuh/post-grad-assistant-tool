import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
// import '../business/domain_objects.dart';
import '../business/drift_orm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DraftPage extends ConsumerWidget {
  static const routeName = '/draft';
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draft Page'),
      ),
      body: Center(
        child: _PageBody(),
      ),
    );
  }
}

MaterialPageRoute ezRoute(Widget page) {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(),
      body: page,
    ),
  );
}

class _TeacherDataAll extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox();
    // final allTeachers = ref.watch(allTeachersProvider);
    //
    // return allTeachers.when(
    //   data: (teachers) {
    //     return ListView.builder(
    //       itemCount: teachers.length,
    //       itemBuilder: (context, index) {
    //         final teacher = teachers[index];
    //         return ListTile(
    //           title: Text(teacher.name ?? ""),
    //           subtitle: Text(teacher.gender.toString()),
    //         );
    //       },
    //     );
    //   },
    //   loading: () => CircularProgressIndicator(),
    //   error: (error, stack) => Text('Error: $error'),
    // );
  }
}

class _PageBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbState = ref.watch(driftDatabaseProvider);
    switch (dbState) {
      case AsyncLoading():
        return CircularProgressIndicator();
      case AsyncError(:final error):
        return Text('Error: $error');
      default:
    }

    final MyDriftDatabase db = dbState.value!;

    final allTables = db.allTables.toList();

    return ListView.builder(
      itemCount: db.allTables.length,
      itemBuilder: (context, index) {
        final table = allTables[index];
        return ListTile(
          title: Text(table.actualTableName),
          subtitle: Text(table.entityName),
          onTap: () async {
            switch (table.actualTableName) {
              case 'giangvien':
                Navigator.of(context).push(
                  ezRoute(_TeacherDataAll()),
                );
              default:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'No handler for table ${table.actualTableName}',
                    ),
                  ),
                );
            }
          },
        );
      },
    );
  }
}
