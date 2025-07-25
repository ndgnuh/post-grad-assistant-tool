import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import 'select_class_of.dart' show PageSelectClassOf, PageSelectClassOfArgs;
import '../../business/domain_objects.dart';
import '../../shortcuts.dart';

import 'package:fami_tools/services/database.dart';
import 'package:fami_tools/services/sqlbuilder/sqlbuilder.dart';

import '../ql_de_tai.dart' show PageQuanLyDeTai;
import 'thesis_list.dart'
    show
        ThesisTopicListPage,
        ThesisTopicDetailPageArguments,
        ThesisTopicDetailPage;

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

  setSelectedClassOfYear(NienKhoa? classOfYear) async {
    if (classOfYear == null) return;

    selectedClassOfYear = classOfYear;
    listGiaoDeTai.clear();

    final listGiaoDeTai_ = await GiaoDeTai.getByClassOfYear(
      classOfYear,
    );
    listGiaoDeTai.addAll(listGiaoDeTai_);
    notifyListeners();
  }

  selectClassOfYear(NavigatorState navigator) async {
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
    final messenger = ScaffoldMessenger.of(context);

    return ChangeNotifierProvider(
      create: (context) => _State(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Giao đề tài'),
          actions: [
            MenuAnchor(
              builder: (context, controller, child) => IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: controller.open,
              ),
              menuChildren: [
                MenuItemButton(
                  onPressed: null,
                  child: Text("Thêm đề tài"),
                ),
                MenuItemButton(
                  onPressed: () => navigator.pushNamed(
                    ThesisTopicListPage.routeName,
                  ),
                  child: Text("Tới trang danh sách đề tài"),
                ),
              ],
            )
          ],
        ),
        body: MyShortcuts(
          child: Column(
            children: [
              _SelectClassOfYearButton(),
              Expanded(child: _ListOfThesis()),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListOfThesis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);
    final data = state.listGiaoDeTai;
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

            return ListTile(
              leading: Icon(icon),
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
