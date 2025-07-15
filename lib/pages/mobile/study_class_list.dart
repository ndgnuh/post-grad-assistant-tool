import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../business/domain_objects.dart';
import '../../services/database.dart';
import '../../services/sqlbuilder/sqlbuilder.dart';
import '../../custom_widgets.dart';

import '../academic_year_list.dart'
    show PageAcademicYearEdit, PageAcademicYearArgument;
import '../../business/copy_pasta.dart' as copy_pasta;

part 'study_class_list.g.dart';
part 'study_class_list.freezed.dart';

@freezed
abstract class CourseClassData with _$CourseClassData {
  const CourseClassData._();
  const factory CourseClassData({
    required int classId,
    required String classCode,
    required String subjectId,
    required String subjectName,
    required int statusFlag,
    int? teacherId,
    String? teacherName,
    String? teacherEmail,
  }) = _CourseClassData;

  bool get isCancelled => statusFlag == 1;

  factory CourseClassData.fromJson(Map<String, dynamic> json) =>
      _$CourseClassDataFromJson(json);

  static Future<List<CourseClassData>> getBySemester(HocKy semester) async {
    final query = SelectQuery()
      ..from("LopTinChi")
      ..select([
        "LopTinChi.id as classId",
        "LopTinChi.maLopHoc as classCode",
        "LopTinChi.maHocPhan as subjectId",
        "HocPhan.tenTiengViet as subjectName",
        "LopTinChi.idGiangVien as teacherId",
        "LopTinChi.trangThai as statusFlag",
        "GiangVien.hoTen as teacherName",
        "GiangVien.email as teacherEmail",
      ])
      ..join(
        "HocPhan",
        "LopTinChi.maHocPhan = HocPhan.maHocPhan",
      )
      ..join(
        "GiangVien",
        "LopTinChi.idGiangVien = GiangVien.id",
        JoinType.left,
      )
      ..where("hocKy = ?", [semester.hocKy]);

    final sql = query.build();

    return dbSessionReadOnly((db) async {
      final rows = await db.rawQuery(sql);
      return [for (final row in rows) CourseClassData.fromJson(row)];
    });
  }
}

class PageCourseClassListState extends ChangeNotifier {
  final List<CourseClassData> studyClasses = [];
  HocKy? _selectedSemester;

  HocKy? get selectedSemester => _selectedSemester;
  set selectedSemester(HocKy? semester) {
    if (semester == null) return;

    _selectedSemester = semester;
    CourseClassData.getBySemester(semester).then((classes) {
      studyClasses.clear();
      studyClasses.addAll(classes);
      print(classes);
      notifyListeners();
    }).catchError((error) {
      print('Error fetching classes: $error');
    });
  }

  PageCourseClassListState({
    HocKy? initialSemester,
  }) {
    // Initialize with the current semester
    switch (initialSemester) {
      case HocKy currentSemester:
        selectedSemester = currentSemester;
        break;
      default:
        HocKy.getClosest().then((semester) {
          selectedSemester = semester;
        }).catchError((error) {
          print('Error fetching closest semester: $error');
        });
    }
  }

  final FocusNode searchFocusNode = FocusNode();
}

class _GotoMenu extends StatelessWidget {
  const _GotoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            final state = Provider.of<PageCourseClassListState>(
              context,
              listen: false,
            );

            if (state.selectedSemester == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Chưa chọn đợt học')),
              );
              return;
            }

            final args = PageAcademicYearArgument(
              state.selectedSemester!,
              (HocKy semester) {
                state.selectedSemester = semester;
              },
            );

            Navigator.pushNamed(
              context,
              PageAcademicYearEdit.routeName,
              arguments: args,
            );
          },
          child: const Text('Thông tin đợt học'),
        ),
      ],
      builder: (context, controller, child) {
        return IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: controller.open,
        );
      },
    );
  }
}

class _CopyMenu extends StatelessWidget {
  const _CopyMenu({super.key});

  void copyAllTeacherEmails(BuildContext context) {
    final state = Provider.of<PageCourseClassListState>(context, listen: false);
    final emails = state.studyClasses
        .map((classInfo) => classInfo.teacherEmail)
        .toSet()
        .whereType<String>()
        .join(', ');

    if (emails.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: emails));
      final nEmails = emails.split(', ').length;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đã sao chép $nEmails email giảng viên')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không có email giảng viên để sao chép')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PageCourseClassListState>(context, listen: true);
    return MenuAnchor(
      menuChildren: [
        MenuItemButton(
          onPressed: () => copyAllTeacherEmails(context),
          child: const Text('Email giảng viên'),
        ),
        if (state.selectedSemester != null)
          MenuItemButton(
            onPressed: () => copy_pasta.copyThongBaoGiangDay(
              context: context,
              hocKy: state.selectedSemester!,
            ),
            child: const Text('Nhắc giảng dạy đầu kỳ'),
          ),
        if (state.selectedSemester != null)
          MenuItemButton(
            onPressed: () => copy_pasta.copyNhacNhoNopDiem(
              context: context,
              hocKy: state.selectedSemester!,
            ),
            child: const Text('Nhắc nộp điểm cuối kỳ'),
          ),
      ],
      builder: (context, controller, child) {
        return IconButton(
          icon: const Icon(Icons.copy),
          onPressed: controller.open,
        );
      },
    );
  }
}

class PageCourseClassList extends StatelessWidget {
  static const routeName = '/study_class/list';

  final HocKy? initialSemester;

  const PageCourseClassList({
    super.key,
    this.initialSemester,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageCourseClassListState(
        initialSemester: initialSemester,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Danh sách lớp học phần'),
          actions: [
            _CopyMenu(),
            _GotoMenu(),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
            onLongPress: () {
              // Navigate to the home page on long press
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ),
        body: Column(
          children: [
            _SemesterSearcher(),
            _ListOfClasses(),
          ],
        ),
      ),
    );
  }
}

class _ListOfClasses extends StatelessWidget {
  const _ListOfClasses({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PageCourseClassListState>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: state.studyClasses.length,
        itemBuilder: (context, index) {
          final classInfo = state.studyClasses[index];
          final title = "${classInfo.subjectName} - ${classInfo.classCode}";

          final subtitle = switch (classInfo.isCancelled) {
            true => "Lớp học phần đã bị hủy",
            false => switch (classInfo.teacherName) {
                null => "Chưa có giảng viên",
                _ => "Giảng viên: ${classInfo.teacherName}",
              }
          };

          final icon = switch (classInfo.statusFlag) {
            0 => null,
            1 => Icons.warning,
            _ => null,
          };

          return ListTile(
            title: Text(title),
            leading: Icon(icon),
            subtitle: Text(subtitle),
            onTap: () {
              print("TODO");
            },
          );
        },
      ),
    );
  }
}

class _SemesterSearcher extends StatelessWidget {
  const _SemesterSearcher({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PageCourseClassListState>(context, listen: true);
    final navigator = Navigator.of(context);

    final subtitle = switch (state.selectedSemester) {
      null => "Chưa chọn đợt học",
      HocKy semester =>
        "${semester.hocKy} (từ ${semester.batDauHocDmy} đến ${semester.ketThucHocDmy})",
    };

    return ListTile(
      title: Text("Đợt học"),
      leading: Icon(Icons.calendar_month),
      subtitle: Text(subtitle),
      onTap: () async {
        final newSemester = await Navigator.pushNamed(
          context,
          PageSelectSemester.routeName,
          arguments: state.selectedSemester,
        );

        print(newSemester);

        switch (newSemester) {
          case HocKy semester:
            state.selectedSemester = semester;
            break;
          default:
            // User cancelled the selection
            return;
        }
      },
    );
  }
}

class PageSelectSemester extends StatelessWidget {
  static const routeName = '/select/semester';
  final HocKy? initialSemester;

  const PageSelectSemester({
    super.key,
    this.initialSemester,
  });

  @override
  Widget build(BuildContext context) {
    return PageSelectThings<HocKy>(
      title: "Chọn đợt học",
      allowNull: false,
      searchFunction: (query) => HocKy.search(searchQuery: query),
      searchWhenTyping: true,
      initialSelection: initialSemester,
      hintText: "Nhập đợt học",
      itemBuilder: (context, HocKy? semester) {
        return ListTile(
          title: Text(semester!.toString()),
          leading: switch (semester == initialSemester) {
            true => const Icon(Icons.check),
            false => const Icon(null),
          },
          onTap: () => Navigator.pop<HocKy>(context, semester),
        );
      },
    );
  }
}
