import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import 'select_class_of.dart' show PageSelectClassOf, PageSelectClassOfArgs;
import '../../business/domain_objects.dart';
import '../../business/domain_objects.dart' as dobj;
import '../../shortcuts.dart';
import '../../custom_widgets.dart';

import '../../services/database.dart';
import '../../services/sqlbuilder/sqlbuilder.dart';

import 'thesis_list.dart'
    show
        ThesisTopicListPage,
        ThesisTopicDetailPageArguments,
        ThesisTopicAddPage,
        ThesisTopicDetailPage;

import '../multiple_selection_page.dart';

part 'thesis_assign_list.freezed.dart';
part 'thesis_assign_list.g.dart';

@freezed
abstract class GiaoDeTai with _$GiaoDeTai {
  /// Represents the assignment of a thesis to a student.
  const GiaoDeTai._();

  const factory GiaoDeTai({
    required int studentId,
    required String studentName,
    required String studentCode,
    int? thesisId,
    int? teacherId,
    String? teacherName,
    String? thesisEnglishName,
    String? thesisVietnameseName,
  }) = _GiaoDeTai;

  bool get assigned => thesisId != null;

  factory GiaoDeTai.fromJson(Map<String, dynamic> json) =>
      _$GiaoDeTaiFromJson(json);

  static Future<List<GiaoDeTai>> getByClassOfYear(NienKhoa? classOfYear) async {
    final query = SelectQuery()
      ..from("HocVien")
      ..select([
        "HocVien.id as studentId",
        "HocVien.hoTen as studentName",
        "HocVien.maHocVien as studentCode",
        "DeTaiThacSi.id as thesisId",
        "DeTaiThacSi.tenTiengAnh as thesisEnglishName",
        "DeTaiThacSi.tenTiengViet as thesisVietnameseName",
        "C.id as teacherId",
        "CONCAT(C.chucDanh, C.hoTen) as teacherName",
      ])
      ..orderBy(["thesisId", "studentCode"])
      ..where(
        "HocVien.nienKhoa = ?",
        [classOfYear?.nienKhoa],
      )
      ..join(
        "DeTaiThacSi",
        "DeTaiThacSi.idHocVien = HocVien.id",
        JoinType.left,
      )
      ..join(
        "ChucDanhGiangVien as C",
        "C.id = DeTaiThacSi.idGiangVien",
        JoinType.left,
      );

    final sql = query.build();

    return dbSessionReadOnly((db) async {
      final rows = await db.rawQuery(sql);
      return [for (final row in rows) GiaoDeTai.fromJson(row)];
    });
  }
}

class _State extends ChangeNotifier {
  final searchController = SearchController();
  final List<GiaoDeTai> listGiaoDeTai = <GiaoDeTai>[];
  NienKhoa? selectedClassOfYear;

  void setSelectedClassOfYear(NienKhoa? classOfYear) async {
    if (classOfYear == null) return;

    selectedClassOfYear = classOfYear;
    listGiaoDeTai.clear();

    final listGiaoDeTai_ = await GiaoDeTai.getByClassOfYear(
      classOfYear,
    );
    listGiaoDeTai.addAll(listGiaoDeTai_);
    notifyListeners();
  }

  void selectClassOfYear(NavigatorState navigator) async {
    final arguments = PageSelectClassOfArgs(
      onSelected: setSelectedClassOfYear,
    );

    navigator.pushNamed(
      PageSelectClassOf.routeName,
      arguments: arguments,
    );
  }
}

class MobilePageThesisAssignList extends StatelessWidget {
  static const String routeName = '/mobile/thesis_assign_list';
  const MobilePageThesisAssignList({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return ChangeNotifierProvider(
      create: (context) => _State(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Giao đề tài'),
          actions: [_GotoMenu()],
        ),
        body: MyShortcuts(
          child: Column(
            children: [
              _SelectClassOfYearButton(),
              Expanded(child: _ThesisListView()),
            ],
          ),
        ),
      ),
    );
  }
}

class _GotoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    return MenuAnchor(
      builder: (context, controller, child) => IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: controller.open,
      ),
      menuChildren: [
        MenuItemButton(
          onPressed: () async {
            final state = Provider.of<_State>(context, listen: false);
            // final res = await showDialog(
            //   context: context,
            //   builder: (context) {
            //     final selectedNotifiers = [
            //       for (var i = 0; i < state.listGiaoDeTai.length; i++)
            //         ValueNotifier<bool>(false)
            //     ];
            //
            //     return AlertDialog(
            //       scrollable: true,
            //       title: const Text("Chọn học viên"),
            //       content: SizedBox(
            //         height: 700,
            //         width: 500,
            //         child: ListView.builder(
            //           shrinkWrap: true,
            //           itemCount: state.listGiaoDeTai.length,
            //           itemBuilder: (context, index) => ValueListenableBuilder(
            //             valueListenable: selectedNotifiers[index],
            //             builder: (context, value, child) {
            //               return CheckboxListTile(
            //                 title: Text(state.listGiaoDeTai[index].studentName),
            //                 subtitle:
            //                     Text(state.listGiaoDeTai[index].studentCode),
            //                 value: value,
            //                 onChanged: (value) {
            //                   selectedNotifiers[index].value = value ?? false;
            //                 },
            //               );
            //             },
            //           ),
            //         ),
            //       ),
            //       actions: [
            //         TextButton(
            //           onPressed: () => Navigator.of(context).pop(null),
            //           child: const Text("Hủy"),
            //         ),
            //         TextButton(
            //           onPressed: () {
            //             Navigator.of(context).pop(true);
            //           },
            //           child: const Text("Chọn"),
            //         ),
            //       ],
            //     );
            //   },
            // );
            // if (res == null) return;

            if (state.selectedClassOfYear == null) {
              messenger.showMessage("Chưa chọn khóa học viên");
              return;
            }

            final listOfThesisTopic = await DeTaiThacSi.search(
              searchQuery: "",
              nienKhoa: state.selectedClassOfYear!,
            );

            final selectedTheses = await navigator.push(
              MaterialPageRoute(
                builder: (_) => MultipleSelectionPage<DeTaiThacSi>(
                  options: listOfThesisTopic,
                  titleBuilder: (thesis) => Text(thesis.tenTiengViet),
                  subtitleBuilder: (thesis) =>
                      Text(thesis.hocVien?.hoTen ?? ""),
                  title: "Chọn đề tài",
                ),
              ),
            );

            if (selectedTheses == null || selectedTheses.isEmpty) {
              messenger.showMessage("Chưa chọn đề tài");
              return;
            }
            await navigator.push(
              MaterialPageRoute(
                builder: (_) => ThesisAssignOperationPage(
                  topics: selectedTheses,
                ),
              ),
            );
          },
          child: Text("Làm giao đề tài"),
        ),
        MenuItemButton(
          onPressed: () => navigator.pushNamed(
            ThesisTopicAddPage.routeName,
          ),
          child: Text("Thêm đề tài"),
        ),
        MenuItemButton(
          onPressed: () => navigator.pushNamed(
            ThesisTopicListPage.routeName,
          ),
          child: Text("Tới trang danh sách đề tài"),
        ),
      ],
    );
  }
}

class _ThesisItem extends StatelessWidget {
  final GiaoDeTai thesis;

  const _ThesisItem({required this.thesis});

  @override
  Widget build(BuildContext context) {
    final title = "${thesis.studentName} (${thesis.studentCode})";
    final assigned = thesis.assigned;

    final subtitle = switch (assigned) {
      false => "Chưa giao đề tài",
      true => "${thesis.thesisVietnameseName}\n${thesis.teacherName}",
    };

    final isThreeLine = assigned;

    final icon = switch (assigned) {
      true => Icons.check_box,
      false => Icons.check_box_outline_blank,
    };

    final navigator = Navigator.of(context);

    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      isThreeLine: isThreeLine,
      onTap: () async {
        final topic = await DeTaiThacSi.getById(thesis.thesisId as int);
        navigator.push(
          MaterialPageRoute(
            builder: (_) => ThesisTopicDetailPage(topic: topic),
          ),
        );
      },
    );
  }
}

class _ThesisListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);
    final data = state.listGiaoDeTai;

    // Width
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, idx) {
        final thesis = data[idx];
        final studentId = thesis.studentId;

        final title = "${thesis.studentName} (${thesis.studentCode})";
        final assigned = thesis.assigned;

        final subtitle = switch (assigned) {
          false => "Chưa giao đề tài",
          true => "${thesis.thesisVietnameseName}\n${thesis.teacherName}",
        };

        final isThreeLine = assigned;

        final icon = switch (assigned) {
          true => Icons.check_box,
          false => Icons.check_box_outline_blank,
        };

        return SearchAnchor(
          suggestionsBuilder: (context, searchController) async {
            final query = searchController.text;
            final theses = await DeTaiThacSi.search(
              searchQuery: query,
              assigned: false,
            );

            return [
              for (final thesis in theses)
                ListTile(
                  title: Text(thesis.tenTiengViet),
                  subtitle: Text(thesis.giangVien.hoTen),
                  onTap: () async {
                    final student = await HocVien.getById(studentId);
                    await thesis.assignStudent(student);
                    searchController.closeView("");
                  },
                )
            ];
          },
          builder: (context, searchController) {
            final navigator = Navigator.of(context);

            return _ThesisItem(
              thesis: thesis,
            );

            return ListTile(
              leading: Icon(null),
              title: Text(title),
              subtitle: Text(subtitle),
              onTap: () async {
                switch (thesis.thesisId) {
                  case int id:
                    final topic = await DeTaiThacSi.getById(id);
                    final args = ThesisTopicDetailPageArguments(
                      topic: topic,
                    );
                    navigator.pushNamed(
                      ThesisTopicDetailPage.routeName,
                      arguments: args,
                    );
                  case null:
                    searchController.openView();
                }
              },
            );
          },
        );
      },
    );
  }
}

class ThesisAssignOperationPage extends StatelessWidget {
  static const String routeName = '/mobile/thesis_assign_operation';
  final List<DeTaiThacSi> topics;

  const ThesisAssignOperationPage({
    super.key,
    required this.topics,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giao đề tài'),
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return ListTile(
            title: Text(topic.tenTiengViet),
            subtitle: Text(topic.giangVien.hoTen),
            onTap: () {
              // Handle the assignment logic here
              // For example, navigate to a detail page or show a dialog
            },
          );
        },
      ),
    );
  }
}

class _SelectClassOfYearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);

    return Actions(
      actions: <Type, Action<Intent>>{
        SearchIntent: CallbackAction<SearchIntent>(
          onInvoke: (intent) => state.searchController.openView(),
        ),
      },
      child: FocusScope(
        autofocus: true,
        child: SearchAnchor(
          searchController: state.searchController,
          suggestionsBuilder: (context, searchController) async {
            final query = searchController.text;
            final classOfYears = await NienKhoa.search(query);

            final suggestions = <Widget>[];
            for (final classOfYear in classOfYears) {
              final widget = ListTile(
                title: Text(classOfYear.nienKhoa),
                onTap: () {
                  state.setSelectedClassOfYear(classOfYear);
                  searchController.closeView("");
                },
              );

              suggestions.add(widget);
            }

            return suggestions;
          },
          builder: (context, searchController) => ListTile(
            leading: Icon(Icons.search),
            title: const Text('Khóa học viên'),
            subtitle: switch (state.selectedClassOfYear) {
              null => const Text("Click để chọn"),
              NienKhoa nienKhoa => Text(nienKhoa.nienKhoa),
            },
            onTap: () => searchController.openView(),
          ),
        ),
      ),
    );
  }
}
