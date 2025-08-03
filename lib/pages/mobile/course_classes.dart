import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../business/domain_objects.dart';
import '../../business/domain_editors.dart';
import '../../services/database.dart';
import '../../services/sqlbuilder/sqlbuilder.dart';
import '../../custom_widgets.dart';
import '../../custom_tiles.dart';
import '../../shortcuts.dart';

import '../academic_year_list.dart'
    show PageAcademicYearEdit, PageAcademicYearArgument;
import '../../business/copy_pasta.dart' as copy_pasta;

import '../single_selection_page.dart' show PageSelectThings;

part 'course_classes.g.dart';
part 'course_classes.freezed.dart';

Future<List<LopTinChi>> parseClassesFromClipboard({
  required HocKy semester,
}) async {
  final clipboardText = await Clipboard.getData('text/plain');
  if (clipboardText == null || clipboardText.text == null) {
    return [];
  }

  final lines = clipboardText.text!.split('\n');
  final classes = <LopTinChi>[];

  for (final line in lines) {
    final parts = line.split('\t');
    if (parts.length < 3) continue; // Skip invalid lines

    final classCode = parts[0].trim();
    final courseCode = classCode.split('-').first.trim();
    final numRegistered = int.tryParse(parts[2].trim()) ?? 0;

    classes.add(
      LopTinChi(
        id: -1, // New class, so ID is -1
        hocKy: semester.hocKy,
        maHocPhan: courseCode,
        maLopHoc: classCode,
        soLuongDangKy: numRegistered,
        trangThai: switch (numRegistered) {
          >= 5 => TrangThaiLopTinChi.binhThuong,
          _ => TrangThaiLopTinChi.huy,
        },
      ),
    );
  }

  return classes;
}

Future<void> pasteClassesFromClipboard({
  required BuildContext context,
  required ScaffoldMessengerState messenger,
  required PageCourseClassListState state,
}) async {
  messenger.showMessage("Đang dán dữ liệu từ clipboard...");
  final clipboardText = await Clipboard.getData('text/plain');

  // Handle paste action here
  final classes = await parseClassesFromClipboard(
    semester: state.selectedSemester!,
  );

  if (classes.isEmpty) {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lỗi khi dán dữ liệu'),
        content: Text(
            'Copy cột "Mã lớp học phần", "Tên lớp học phần", "Số HV đăng ký" từ file hướng "Kết quả đăng ký" mà Ban Đào tạo gửi, sau đó nhấn "Ok" để tiếp tục.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Đóng'),
          ),
        ],
      ),
    );
    return;
  }

  // Show confirmation dialog
  final classesNames = await Future.wait(
    [for (final c in classes) c.tenLopHoc],
  );

  final confirm = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Nhập lớp học phần'),
      content: SizedBox(
        width: 500,
        height: 800,
        child: ListView(
          shrinkWrap: true,
          children: [
            for (final (i, c) in classes.indexed)
              ListTile(
                title: Text(classesNames[i]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mã lớp ${c.maLopHoc}"),
                    Text("Số lượng đăng ký: ${c.soLuongDangKy}"),
                  ],
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Đồng ý'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Hủy'),
        ),
      ],
    ),
  );

  if (confirm != true) {
    messenger.showMessage("Đã hủy dán dữ liệu");
    return;
  }

  if (await LopTinChi.createMultiples(classes)) {
    messenger.showMessage("Thành công");
    state.selectedSemester = state.selectedSemester;
  } else {
    messenger.showMessage("Lỗi khi tạo lớp");
  }
  // Refresh the class list
}

@freezed
abstract class CourseClassData with _$CourseClassData {
  const CourseClassData._();
  const factory CourseClassData({
    required int classId,
    required String classCode,
    required String subjectId,
    required String subjectName,
    required int statusFlag,
    required int numRegistered,
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
        "LopTinChi.soLuongDangKy as numRegistered",
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
        MenuItemButton(
          onPressed: () => copy_pasta.copyThongBaoLopHoc(
            context: context,
            semester: state.selectedSemester!,
          ),
          child: const Text('Thông báo lớp học'),
        ),
        MenuItemButton(
          onPressed: () => copy_pasta.copyTeachingAssignment(
            context: context,
            semester: state.selectedSemester!,
          ),
          child: const Text('Phân công giảng dạy'),
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
  static const routeName = '/course-class/list';

  final HocKy? initialSemester;

  const PageCourseClassList({
    super.key,
    this.initialSemester,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return ChangeNotifierProvider(
      create: (_) => PageCourseClassListState(
        initialSemester: initialSemester,
      ),
      builder: (context, child) {
        final messenger = ScaffoldMessenger.of(context);
        final state = Provider.of<PageCourseClassListState>(context);

        return CommonShortcuts(
          key: shortcutStateKey,
          onCreateNew: () async {
            await navigator.pushNamed(
              CourseClassCreatePage.routeName,
              arguments: state.selectedSemester,
            );

            state.selectedSemester = state.selectedSemester;
          },
          onSearch: () {
            final route = MaterialPageRoute(
              builder: (context) => PageSelectSemester(
                initialSemester: state.selectedSemester,
              ),
            );
            navigator.push(route).then((value) {
              if (value is HocKy) {
                state.selectedSemester = value;
              }
            });
          },
          onPaste: null,
          onImport: () {
            // Handle import action here
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Chức năng nhập chưa được triển khai')),
            );
          },
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
                _AddClassTile(),
                _ListOfClasses(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AddClassTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<PageCourseClassListState, HocKy?>(
      selector: (context, state) => state.selectedSemester,
      builder: (context, selectedSemester, _) => switch (selectedSemester) {
        HocKy selectedSemester => ListTile(
            title: Text("Thêm lớp học phần"),
            subtitle: Text("Click để thêm"),
            leading: Icon(Icons.add),
            onTap: () {
              Navigator.pushNamed(
                context,
                CourseClassCreatePage.routeName,
                arguments: selectedSemester,
              ).then((_) {
                // Refresh the class list after adding a new class
                Provider.of<PageCourseClassListState>(context, listen: false)
                    .selectedSemester = selectedSemester;
              });
            },
          ),
        null => SizedBox.shrink(),
      },
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

          final subtitle2 = "Số lượng đăng ký: ${classInfo.numRegistered}";

          final icon = switch (classInfo.statusFlag) {
            0 => null,
            1 => Icons.warning_outlined,
            _ => null,
          };

          final navigator = Navigator.of(context);

          return ListTile(
            title: Text(title),
            leading: Icon(icon),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitle),
                Text(subtitle2),
              ],
            ),
            onTap: () async {
              final route = MaterialPageRoute(
                builder: (context) => CourseClassCreatePage(
                  editingId: classInfo.classId,
                  semester: state.selectedSemester!,
                ),
                settings: RouteSettings(
                  name: CourseClassCreatePage.routeName,
                ),
              );
              navigator.push(route);
              state.selectedSemester = state.selectedSemester;
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
      includeNull: false,
      searchFunction: (query) => HocKy.search(searchQuery: query),
      searchWhileTyping: true,
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

class CourseClassCreatePage extends StatefulWidget {
  static const routeName = '/course-class/create';

  final HocKy semester;
  final int? editingId;

  const CourseClassCreatePage({
    super.key,
    this.editingId,
    required this.semester,
  });

  @override
  State<CourseClassCreatePage> createState() => _CourseClassCreatePageState();
}

class _CourseClassCreatePageState extends State<CourseClassCreatePage> {
  late ValueNotifier<HocKy?> semester;
  final ValueNotifier<HocPhan?> course = ValueNotifier(null);
  final ValueNotifier<String> classCode = ValueNotifier("");
  final ValueNotifier<String> className = ValueNotifier("");
  final ValueNotifier<GiangVien?> teacher = ValueNotifier(null);
  final ValueNotifier<int> numRegistered = ValueNotifier(0);

  final ValueNotifier<NgayTrongTuan?> dayOfWeek =
      ValueNotifier(null); // Mặc định là thứ 2
  final ValueNotifier<int?> startTime = ValueNotifier(null);
  final ValueNotifier<int?> endTime = ValueNotifier(null);
  final ValueNotifier<String> room = ValueNotifier("");
  final ValueNotifier<String> accessUrl = ValueNotifier("");
  final ValueNotifier<DateTime?> customBeginDateNotifier = ValueNotifier(null);
  final ValueNotifier<DateTime?> customEndDateNotifier = ValueNotifier(null);

  final ValueNotifier<TrangThaiLopTinChi> classStatus = ValueNotifier(
    TrangThaiLopTinChi.binhThuong,
  );

  LopTinChi? editingCourseClass;

  @override
  initState() {
    super.initState();
    semester = ValueNotifier(widget.semester);

    // Tự hủy lớp nếu số lượng đăng ký ít hơn 5
    numRegistered.addListener(() {
      if (numRegistered.value < 5) {
        classStatus.value = TrangThaiLopTinChi.huy;
      } else {
        classStatus.value = TrangThaiLopTinChi.binhThuong;
      }
    });

    // Nếu có editingId, tải thông tin lớp học phần để chỉnh sửa
    switch (widget.editingId) {
      case int editingId when editingId > 0:
        initWithEditingId(editingId);
    }
  }

  void initWithEditingId(int editingId) async {
    // Kiểm tra xem lớp học phần có tồn tại không
    final courseClass = await LopTinChi.getById(editingId);
    if (courseClass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Không tìm thấy lớp học phần với ID $editingId")),
      );
      return;
    }

    // Nếu lớp học phần tồn tại, khởi tạo các giá trị
    course.value = await HocPhan.getById(courseClass.maHocPhan);
    classCode.value = courseClass.maLopHoc ?? "";
    className.value = await courseClass.tenLopHoc;
    switch (courseClass.idGiangVien) {
      case int id when id > 0:
        teacher.value = await GiangVien.getById(id);
      default:
        teacher.value = null; // Không có giảng viên
    }
    numRegistered.value = courseClass.soLuongDangKy ?? 0;
    classStatus.value = courseClass.trangThai;

    dayOfWeek.value = courseClass.ngayHoc; // Mặc định là thứ 2
    startTime.value = courseClass.tietBatDau;
    endTime.value = courseClass.tietKetThuc;
    room.value = courseClass.phongHoc ?? "";
    accessUrl.value = courseClass.urlTruyCap ?? "";
    customBeginDateNotifier.value =
        courseClass.customBeginDate ?? semester.value?.batDauHoc;
    customEndDateNotifier.value =
        courseClass.customEndDate ?? semester.value?.ketThucHoc;

    setState(() {
      editingCourseClass = courseClass;
    });
  }

  @override
  dispose() {
    super.dispose();
    semester.dispose();
    course.dispose();
    classCode.dispose();
    teacher.dispose();
    className.dispose();
    numRegistered.dispose();
    classStatus.dispose();
    startTime.dispose();
    endTime.dispose();
    room.dispose();
    accessUrl.dispose();
    dayOfWeek.dispose();
    customBeginDateNotifier.dispose();
    customEndDateNotifier.dispose();
  }

  bool validateInputs(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    if (course.value == null) {
      messenger.showMessage("Vui lòng chọn học phần");
      return false;
    }

    if (classCode.value.isEmpty) {
      messenger.showMessage("Vui lòng nhập mã lớp học phần");
      return false;
    }
    if (className.value.isEmpty) {
      messenger.showMessage("Vui lòng nhập tên lớp học phần");
      return false;
    }

    if (numRegistered.value < 0) {
      messenger.showMessage("Số lượng đăng ký không thể âm");
      return false;
    }

    return true;
  }

  Future<void> createClass({
    required ScaffoldMessengerState messenger,
    required NavigatorState navigator,
  }) async {
    final newClass = LopTinChi(
      id: -1,
      hocKy: semester.value!.hocKy,
      maHocPhan: course.value!.maHocPhan,
      maLopHoc: classCode.value,
      idGiangVien: teacher.value?.id,
      soLuongDangKy: numRegistered.value,
      trangThai: classStatus.value,
    );

    try {
      await newClass.create();
      messenger.showMessage("Tạo lớp học phần thành công");
      navigator.pop();
    } catch (e) {
      messenger.showMessage("Lỗi khi tạo lớp học phần: $e");
    }
  }

  void copyThongBaoXepLich() async {
    switch (editingCourseClass) {
      case null:
        ScaffoldMessenger.of(context).showMessage(
          "Vui lòng tạo hoặc chỉnh sửa lớp học phần trước",
        );
        return;
    }

    final course = await editingCourseClass!.hocPhan;

    final startStudying = (await editingCourseClass!.hocKyObject).batDauHoc;
    final deadline = await showDatePicker(
      context: context,
      initialDate: startStudying,
      firstDate: DateTime.now(),
      lastDate: startStudying.add(Duration(days: 30)),
    );

    if (deadline == null) {
      ScaffoldMessenger.of(context)
          .showMessage("Bạn đã hủy chọn ngày xếp lịch");
      return;
    }

    final dateFormat = DateFormat('dd/MM/yyyy');
    final deadlineString = dateFormat.format(deadline);

    final pronoun = await copy_pasta.showPronounSelection(context: context);
    if (pronoun == null) {
      return;
    }

    final text = """Em chào ${pronoun.pronoun}. Chào các bạn học viên.

Em cần gửi đăng ký lịch học cho Ban Đào tạo. ${pronoun.capitalized} và các bạn thống nhất lịch học trong tuần trước ngày ${deadlineString} giúp em với ạ. Danh sách lớp em sẽ gửi qua email sau ạ.
""";

    copy_pasta.copyToClipboard(
      context: context,
      text: text,
      notification: "Đã copy thông báo xếp lịch",
    );
  }

  void copyMoiDay() async {
    switch (editingCourseClass) {
      case null:
        ScaffoldMessenger.of(context).showMessage(
          "Vui lòng tạo hoặc chỉnh sửa lớp học phần trước",
        );
        return;
    }

    final course = await editingCourseClass!.hocPhan;

    final pronoun = await copy_pasta.showPronounSelection(context: context);
    if (pronoun == null) {
      return;
    }

    final courseName = course.tenTiengViet;
    final teachingTime = widget.semester.thoiGianHoc;
    final nreg = numRegistered.value;

    final text =
        "${pronoun.greeting}, đợt học cao học tới có một lớp $courseName, số lượng đăng ký là $nreg học viên, thời gian giảng dạy là $teachingTime. ${pronoun.capitalized} có thể dạy lớp này không ạ?";

    copy_pasta.copyToClipboard(
      context: context,
      text: text,
      notification: "Đã copy thông báo mời dạy",
    );
  }

  Future<void> validateAndCreate(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    if (!validateInputs(context)) return Future.value();

    return createClass(messenger: messenger, navigator: navigator);
  }

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: switch (widget.editingId) {
          int _ => const Text("Chỉnh sửa lớp học"),
          _ => Text("Tạo lớp học"),
        },
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.copy),
                  title: Text("Mời dạy"),
                ),
                onTap: () => copyMoiDay(),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.copy),
                  title: Text("Copy thông báo xếp lịch"),
                ),
                onTap: () => copyThongBaoXepLich(),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Học kỳ"),
            subtitle: ValueListenableBuilder<HocKy?>(
              valueListenable: semester,
              builder: (context, value, child) {
                return Text(value?.toString() ?? "Chưa chọn học kỳ");
              },
            ),
          ),
          CourseSelectionTile(
            valueNotifier: course,
          ),
          StringTile(
            titleText: "Mã lớp học phần",
            valueNotifier: classCode,
            readOnly: widget.editingId != null,
          ),
          StringTile(
            titleText: "Tên lớp học phần",
            valueNotifier: className,
            readOnly: true,
          ),
          IntegerTile(
            titleText: "Số lượng đăng ký",
            valueNotifier: numRegistered,
            onUpdate: editingCourseClass?.updateNumRegistered,
          ),
          EnumTile<TrangThaiLopTinChi>(
            titleText: "Trạng thái lớp",
            options: TrangThaiLopTinChi.values,
            valueNotifier: classStatus,
            onUpdate: editingCourseClass?.updateStatus,
          ),

          // Semester time
          StringTile(
            titleText: "Thời gian học",
            initialValue: widget.semester.thoiGianHoc,
            readOnly: true,
          ),

          // Contact URL
          StringTile(
            titleText: "URL truy cập lớp học",
            valueNotifier: accessUrl,
            onUpdate: editingCourseClass?.updateAccessUrl,
          ),

          // Where and when to study
          StringTile(
            titleText: "Phòng học",
            valueNotifier: room,
            onUpdate: editingCourseClass?.updateRoom,
          ),

          // Macro date
          DateTile(
            titleText: "Ngày bắt đầu học",
            initialValue: widget.semester.batDauHoc,
            valueNotifier: customBeginDateNotifier,
            onUpdate: editingCourseClass?.updateCustomBeginDate,
          ),
          DateTile(
            titleText: "Ngày kết thúc học",
            initialValue: widget.semester.ketThucHoc,
            valueNotifier: customEndDateNotifier,
            onUpdate: editingCourseClass?.updateCustomEndDate,
          ),

          // Micro date
          EnumTile<NgayTrongTuan?>(
            options: NgayTrongTuan.values,
            titleText: "Ngày học",
            valueNotifier: dayOfWeek,
            onUpdate: <T>(v) => editingCourseClass?.updateDayOfWeek(v),
          ),
          EnumTile<int?>(
            options: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
            titleText: "Tiết bắt đầu",
            valueNotifier: startTime,
            onUpdate: (v) =>
                v != null ? editingCourseClass?.updateStartTime(v) : null,
          ),
          EnumTile<int?>(
            options: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
            titleText: "Tiết kết thúc",
            valueNotifier: endTime,
            onUpdate: (v) =>
                (v != null) ? editingCourseClass?.updateEndTime(v) : null,
          ),

          ListTile(
            title: Text("Giảng viên"),
            subtitle: ValueListenableBuilder<GiangVien?>(
              valueListenable: teacher,
              builder: (context, value, child) {
                final name = value?.hoTenChucDanh ?? "Chưa chọn giảng viên";
                return Text(name);
              },
            ),
            onTap: () async {
              final selectedTeacher = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _SelectTeacherForCoursePage(
                    courseId: course.value?.maHocPhan ?? "",
                  ),
                ),
              );

              if (selectedTeacher != null) {
                teacher.value = selectedTeacher;
                editingCourseClass?.updateTeacher(
                  selectedTeacher.id,
                );
              }
            },
          ),
          if (widget.editingId == null)
            OutlinedButton.icon(
              icon: const Icon(Icons.save),
              onPressed: () => validateAndCreate(context),
              label: const Text("Lưu"),
            ),
        ],
      ),
    );
  }
}

class _SelectTeacherForCoursePage extends StatefulWidget {
  final String courseId;

  const _SelectTeacherForCoursePage({
    required this.courseId,
  });

  @override
  State<_SelectTeacherForCoursePage> createState() =>
      _SelectTeacherForCoursePageState();
}

class _SelectTeacherForCoursePageState
    extends State<_SelectTeacherForCoursePage> {
  late List<GiangVien> teachers;

  @override
  initState() {
    super.initState();
    // Load the list of teachers for the course
    teachers = [];
    loadTeachers();
  }

  void loadTeachers() async {
    // Fetch the list of teachers for the course
    teachers = await GiangVien.getByCourse(widget.courseId);
    setState(() {
      teachers = teachers;
    });
  }

  @override
  Widget build(BuildContext context) {
    final courseId = widget.courseId;

    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn giảng viên cho $courseId"),
      ),
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return ListTile(
            title: Text(teacher.hoTenChucDanh),
            subtitle: Text(teacher.email ?? "Chưa có email"),
            onTap: () => Navigator.pop(context, teacher),
            trailing: IconButton(
              icon: Icon(Icons.check),
              onPressed: () => Navigator.pop(context, teacher),
            ),
          );
        },
      ),
    );
  }
}
