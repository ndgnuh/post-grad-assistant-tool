import 'package:drift/drift.dart' hide Column;
import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/pages/course_class_pages/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../services/excel.dart' as excel_helper;
import 'widgets.dart';

List<_ParsedCourseClassInfo> _parseTable(
  Map<String, List<String>> table, {
  String falcutyFilter = "Khoa Toán - Tin",
  required String falcutyHeader,
  required String courseClassIdHeader,
  required String registrationCountHeader,
}) {
  /// Filter rows with falcuty is "Khoa Toán - Tin"
  final numRows = table.values.first.length;
  final rowIndices = <int>[];
  for (int rowIndex = 0; rowIndex < numRows; rowIndex++) {
    final falcuty = table[falcutyHeader]![rowIndex];
    if (falcuty == falcutyFilter) {
      rowIndices.add(rowIndex);
    }
  }

  /// For each row, create a CourseClassCompanion
  final courseClasses = <_ParsedCourseClassInfo>[];
  for (final r in rowIndices) {
    final courseClassId = table[courseClassIdHeader]![r];
    final courseId = courseClassId.split('-').first.trim();
    final registrationCount = int.parse(table[registrationCountHeader]![r]);
    final parsed = (
      courseId: courseId,
      classId: courseClassId,
      registrationCount: registrationCount,
    );
    courseClasses.add(parsed);
  }

  return courseClasses;
}

typedef _ParsedCourseClassInfo = ({
  String classId,
  int registrationCount,
  String courseId,
});

class CourseClassImportPage extends ConsumerStatefulWidget {
  final Map<String, List<String>> importedTable;

  const CourseClassImportPage({
    super.key,
    required this.importedTable,
  });

  @override
  ConsumerState<CourseClassImportPage> createState() =>
      _CourseClassImportPageState();

  static Future<bool?> pickFileAndNavigateTo(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    try {
      final table = await excel_helper.importTableFromExcelFile(
        cornerText: "STT",
      );
      if (table == null) {
        messenger.showSnackBar(
          SnackBar(
            content: Text("Không đọc được bảng từ file Excel"),
          ),
        );
        return false;
      } else {
        return navigator.push<bool?>(
          MaterialPageRoute(
            builder: (context) => CourseClassImportPage(
              importedTable: table,
            ),
          ),
        );
      }
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Lỗi khi đọc file Excel: $e"),
        ),
      );
      return false;
    }
  }
}

class _ColumnMapSelector extends StatelessWidget {
  final List<String> importedColumns;
  final String labelText;
  final ValueChanged<String?> onSelected;
  final String? initialSelection;

  const _ColumnMapSelector({
    required this.importedColumns,
    required this.labelText,
    required this.onSelected,
    this.initialSelection,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      expandedInsets: EdgeInsets.zero,
      initialSelection: initialSelection,
      onSelected: onSelected,
      label: Text(labelText),
      dropdownMenuEntries: [
        for (final column in importedColumns)
          DropdownMenuEntry(
            value: column,
            label: column,
          ),
      ],
    );
  }
}

class _CourseClassImportPageState extends ConsumerState<CourseClassImportPage> {
  String falcutyColumn = "";
  String courseClassIdColumn = "";
  String registrationCountColumn = "";

  List<String> get headers => widget.importedTable.keys.toList();

  List<_ParsedCourseClassInfo> get parsedClasses {
    try {
      return _parseTable(
        widget.importedTable,
        falcutyHeader: falcutyColumn,
        falcutyFilter: "Khoa Toán - Tin",
        courseClassIdHeader: courseClassIdColumn,
        registrationCountHeader: registrationCountColumn,
      );
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text("Nhập lớp học"),
        ),
      ),
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsetsGeometry.all(context.gutter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Column mapping selectors
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("Chọn cột"),
                    subtitle: Text(
                      "Chọn các cột trong bảng Excel để ánh xạ với dữ liệu lớp",
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(context.gutterSmall),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: context.gutterSmall,
                        children: [
                          // You can add more UI to display the imported data as needed
                          _ColumnMapSelector(
                            importedColumns: headers,
                            labelText: "Cột khoa/trường",
                            onSelected: setFalcutyColumn,
                            initialSelection: falcutyColumn,
                          ),

                          _ColumnMapSelector(
                            importedColumns: headers,
                            labelText: "Cột mã lớp",
                            initialSelection: courseClassIdColumn,
                            onSelected: setCourseClassIdColumn,
                          ),

                          _ColumnMapSelector(
                            importedColumns: headers,
                            labelText: "Cột số lượng đăng ký",
                            initialSelection: registrationCountColumn,
                            onSelected: setRegistrationCountColumn,
                          ),

                          // Final import button
                          Divider(),
                          IntrinsicHeight(
                            child: Row(
                              spacing: context.gutter,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(child: SemesterPicker()),
                                _SaveButton(classesToImport: parsedClasses),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Spacing between sections
              SizedBox(height: context.gutter),

              // Result list view
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "Lớp học phần đã nhập (${parsedClasses.length})",
                      ),
                      subtitle: Text(
                        "Xem trước danh sách các lớp trước khi lưu",
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: ListView.separated(
                          itemCount: parsedClasses.length,
                          itemBuilder: (context, index) {
                            final info = parsedClasses[index];
                            return _ImportedClassTile(
                              key: ValueKey(info),
                              info: info,
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    for (final header in headers) {
      if (header.toLowerCase().contains("khoa")) {
        setFalcutyColumn(header);
      }
      if (header.toLowerCase().contains("mã lớp")) {
        setCourseClassIdColumn(header);
      }

      if (header.toLowerCase().contains("đăng ký")) {
        setRegistrationCountColumn(header);
      }
    }
  }

  void setCourseClassIdColumn(String? column) {
    if (column == null) return;
    setState(() {
      courseClassIdColumn = column;
    });
  }

  void setFalcutyColumn(String? column) {
    if (column == null) return;
    setState(() {
      falcutyColumn = column;
    });
  }

  void setRegistrationCountColumn(String? column) {
    if (column == null) return;
    setState(() {
      registrationCountColumn = column;
    });
  }
}

class _ImportedClassTile extends ConsumerWidget {
  final _ParsedCourseClassInfo info;

  const _ImportedClassTile({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseAsync = ref.watch(courseByIdProvider(info.courseId));
    final couresName = switch (courseAsync) {
      AsyncLoading() => "đang tải...",
      AsyncError(:final error) => "lỗi: $error",
      AsyncData(:final value) => value.vietnameseName,
    };

    final subtitles = [
      "Mã học phần: ${info.courseId}",
      "Tên học phần: $couresName",
      "Số HV đăng ký: ${info.registrationCount}",
    ].join("\n");
    return ListTile(
      title: Text(info.classId),
      subtitle: Text(subtitles),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  final List<_ParsedCourseClassInfo> classesToImport;
  const _SaveButton({
    required this.classesToImport,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final empty = classesToImport.isEmpty;
    return FilledButton(
      onPressed: empty ? null : () => importClasses(context, ref),
      child: Text("Lưu"),
    );
  }

  void importClasses(BuildContext context, WidgetRef ref) async {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final semesterSelection = await ref.read(
      semesterSelectionModelProvider.future,
    );
    final semester = semesterSelection.selected;
    if (semester == null) {
      messenger.showMessage("Vui lòng chọn học kỳ trước khi lưu");
      return;
    }

    final companions = <LopTinChiCompanion>[];
    for (final info in classesToImport) {
      final companion = LopTinChiCompanion.insert(
        classId: info.classId,
        courseId: info.courseId,
        registrationCount: Value(info.registrationCount),
        semester: semester.semester,
      );
      companions.add(companion);
    }

    // Import classes
    final notifer = ref.read(
      courseClassIdsBySemesterProvider(semester.semester).notifier,
    );
    notifer.importClasses(companions);
    navigator.pop(true);
  }
}
