import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import './index.dart';
import './providers.dart';
import './widgets.dart';
import '../../shortcuts.dart';
import '../../custom_widgets.dart';

final FocusNode searchFocusNode = FocusNode();

class StudentListPage extends StatelessWidget {
  static const String routeName = '/students/list';

  const StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;

    /// Check if mobile
    final isMobile = Platform.isAndroid || Platform.isIOS;
    final direction = isMobile ? VerticalDirection.down : VerticalDirection.up;

    return CommonShortcuts(
      onSearch: () => searchFocusNode.requestFocus(),
      child: Scaffold(
        appBar: ConstrainedScreen(
          child: AppBar(title: Text("Học viên")),
        ),
        body: ConstrainedScreen(
          child: Padding(
            padding: EdgeInsets.all(gutter),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              verticalDirection: direction,
              spacing: gutter,
              children: [
                Expanded(
                  child: _StudentListView(),
                ),
                Column(
                  spacing: gutter,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IntrinsicHeight(
                      child: Flex(
                        direction: Axis.horizontal,
                        spacing: gutter,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 2,
                            child: CohortSelector(),
                          ),
                          CohortReset(),
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        spacing: gutter,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FilterModeButton(),
                          Expanded(child: StudentSearchBar()),
                          StudentReloadButton(),
                        ],
                      ),
                    ),
                  ],
                ),
                // IntrinsicHeight(
                //   child: Row(
                //     spacing: gutter,
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       FilterModeButton(),
                //       StudentSearchBar(),
                //       StudentReloadButton(),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StudentListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(studentListViewModelProvider);
    switch (modelAsync) {
      case AsyncLoading():
        return SizedBox.square(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Text("Error: $error");
      default:
    }

    final model = modelAsync.value!;
    final students = model.students;

    if (model.needToSetFilter) {
      return Center(
        child: Text("Chọn niên khóa hoặc tìm kiếm để hiển thị học viên"),
      );
    }

    return ListView.separated(
      itemBuilder: (context, index) => _StudentTile(model: model, index: index),
      separatorBuilder: (context, _) => Divider(),
      itemCount: students.length,
    );
  }
}

class _StudentTile extends StatelessWidget {
  final StudentListViewModel model;
  final int index;
  const _StudentTile({required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    final student = model.students[index];
    final subtitle = "${student.cohort} - ${student.status.toString()}";
    return ListTile(
      title: Text(student.name),
      subtitle: Text(subtitle),
      leading: CircleAvatar(child: Text("${index + 1}")),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("#${student.studentId}"),
          Icon(Symbols.chevron_forward),
        ],
      ),
      onTap: () {
        final route = MaterialPageRoute(
          builder: (context) =>
              StudentDetailPage(student: model.v1Students[index]),
        );
        Navigator.push(context, route);
      },
    );
  }
}
