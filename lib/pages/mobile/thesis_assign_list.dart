import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;

import '../../business/copy_pasta.dart' as copy_pasta;
import '../../business/domain_objects.dart';
import '../../business/pods.dart';
import '../../custom_widgets.dart';
import '../../shortcuts.dart';
import '../single_selection_page.dart';
import '../theses/list.dart';
import '../theses/create.dart';
import '../theses/details.dart';

class MobilePageThesisAssignList extends StatelessWidget {
  static const String routeName = '/mobile/thesis_assign_list';
  const MobilePageThesisAssignList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final largeScreen = screenWidth > 800;
    final smallScreen = !largeScreen;

    return ChangeNotifierProvider(
      create: (context) => _State(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Giao đề tài'),
          actions: [_GotoMenu()],
        ),
        body: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            spacing: context.gutter,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (largeScreen)
                IntrinsicHeight(
                  child: Row(
                    spacing: context.gutter,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: _SelectCohortButton()),
                      Expanded(flex: 2, child: _ThesisSearchBar()),
                      _SelectButton(),
                      _ActionButton(),
                    ],
                  ),
                ),
              if (smallScreen) _SelectCohortButton(),
              if (smallScreen) _ThesisSearchBar(),
              Expanded(child: _ThesisListView()),
              if (smallScreen) _SelectButton(),
              if (smallScreen) _ActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectButton extends StatelessWidget {
  void showSelectionMenu(BuildContext context) {
    final state = Provider.of<_State>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => MenuDialog(
        items: [
          MenuDialogItem(
            title: "Chọn tất cả",
            subtitle: "Chọn tất cả học viên trong danh sách",
            icon: Icons.check_box,
            onTap: () => state.selectAll(),
          ),
          MenuDialogItem(
            title: "Bỏ chọn tất cả",
            subtitle: "Bỏ chọn tất cả học viên trong danh sách",
            icon: Icons.check_box_outline_blank,
            onTap: () => state.selectNone(),
          ),
          MenuDialogItem(
            title: "Đảo ngược lựa chọn",
            subtitle: "Đảo ngược lựa chọn của các học viên",
            icon: Icons.swap_horiz,
            onTap: () => state.selectInverse(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(Icons.select_all),
      label: Text("Chọn"),
      onPressed: () => showSelectionMenu(context),
    );
  }
}

@immutable
class _ItemActions {
  final BuildContext context;
  final Student student;
  final Thesis? thesis;
  const _ItemActions({
    required this.context,
    required this.student,
    this.thesis,
  });

  bool get assigned => thesis != null;
  _State get state => Provider.of<_State>(context, listen: false);
  NavigatorState get navigator => Navigator.of(context);
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(context);

  // Go to detail page if thesis is assigned
  FutureOr<void> Function()? get goToDetail => assigned ? _goToDetails : null;
  void _goToDetails() async {
    final route = MaterialPageRoute(
      builder: (_) => ThesisDetailPage(thesis: thesis!),
    );
    await Navigator.push(context, route);
  }

  void copySlug() async {
    final studentId = student.maHocVien;
    final studentName = student.hoTen.slugify(
      replaceSpaces: "",
    );
    final slug = "${studentId}_${studentName}_GiaoDt";
    copy_pasta.copyToClipboard(
      text: slug,
      notification: "Đã sao chép '$slug'",
    );
  }
}

@immutable
class _PageActions {
  final BuildContext context;

  const _PageActions(this.context);

  _State get state => Provider.of<_State>(context, listen: false);
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(context);
  NavigatorState get navigator => Navigator.of(context);

  void showAssignmentEmailForTeacher() async {
    final recipients = <String>[];
    final state = Provider.of<_State>(context, listen: false);
    final students = state.selectedStudents;
    for (final student in students) {
      final thesis = state.mapThesis[student];
      if (thesis == null) continue;
      final teacherEmail = thesis.giangVien.email;
      if (teacherEmail != null && teacherEmail.isNotEmpty) {
        recipients.add(teacherEmail);
      } else {
        messenger.showSnackBar(
          SnackBar(
            content: Text(
              "Giảng viên ${thesis.giangVien.hoTenChucDanh} không có email",
            ),
          ),
        );
      }
    }

    final studentByTeacher = <String, List<String>>{};
    for (final student in students) {
      final thesis = state.mapThesis[student];
      if (thesis == null) continue;
      final teacherName = thesis.giangVien.hoTenChucDanh;
      studentByTeacher.putIfAbsent(teacherName, () => []);
      studentByTeacher[teacherName]!.add(
        "${student.hoTen} (${student.maHocVien})",
      );
    }

    final studentsByTeacher = studentByTeacher.entries
        .map((entry) => "- ${entry.key}: ${entry.value.join(', ')}")
        .join('\n');

    final email = copy_pasta.Email(
      recipients: recipients.toSet(),
      subject:
          "Quyết định giao đề tài học viên cao học khóa ${state.selectedClassOfYear?.nienKhoa ?? 'N/A'}",
      body: """Kính gửi các Thầy, các Cô,

Em gửi quyết định Giao đề tài của học viên cao học mà Thầy, Cô hướng dẫn. Quyết định được đính kèm trong email ạ.
Việc phân công hướng dẫn cũng đã được cập nhật trên QLĐT ạ.

Dưới đây là danh sách học viên cùng với mã học viên để Thầy, Cô tiện tìm file quyết định ạ:
$studentsByTeacher""",
    );

    await showDialog(
      context: context,
      builder: (context) => copy_pasta.EmailCopyDialog(email: email),
    );
  }

  void showAssignmentEmailForStudent() async {
    final recipients = <String>[];
    final state = Provider.of<_State>(context, listen: false);
    final students = state.selectedStudents;
    for (final student in students) {
      final thesis = state.mapThesis[student];
      if (thesis == null) continue;
      final studentEmail = student.emailHust;
      if (studentEmail != null && studentEmail.isNotEmpty) {
        recipients.add(studentEmail);
      } else {
        messenger.showSnackBar(
          SnackBar(
            content: Text(
              "Học viên ${student.hoTen} không có email",
            ),
          ),
        );
      }
    }

    final email = copy_pasta.Email(
      recipients: recipients.toSet(),
      subject:
          "Giao đề tài luận văn thạc sĩ khóa ${state.selectedClassOfYear?.nienKhoa ?? 'N/A'}",
      body: """Gửi các bạn học viên,

Mình gửi quyết định giao đề tài của các bạn. File quyết định được đính kèm theo email.

Các bạn đề ý tên đề tài đã đăng ký và hạn bảo vệ trên quyết định giao đề tài nhé.
      """,
    );

    await showDialog(
      context: context,
      builder: (context) => copy_pasta.EmailCopyDialog(email: email),
    );
  }

  void copyThesisAssignment() async {
    final state = Provider.of<_State>(context, listen: false);
    final students = state.listStudents;
    final maybeTheses = [
      for (final student in students) state.mapThesis[student],
    ];
    final theses = [
      for (final thesis in maybeTheses)
        if (thesis != null) thesis,
    ];

    copy_pasta.copyThesisAssignment(theses: theses);
  }

  void goToThesisList() {
    // Navigator.pushNamed(context, ThesisListPage.routeName);
    navigator.push(
      MaterialPageRoute(
        builder: (context) => ThesisListPage(),
      ),
    );
  }

  void goToThesisCreate() {
    navigator.push(
      MaterialPageRoute(
        builder: (context) => ThesisCreatePage(),
      ),
    );
  }
}

class _ActionDialog extends StatelessWidget {
  final _PageActions actions;

  const _ActionDialog({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return MenuDialog(
      items: [
        MenuDialogItem(
          title: "Copy email giao đề tài",
          subtitle: "Để gửi email cho giảng viên hướng dẫn",
          icon: Icons.copy,
          onTap: actions.showAssignmentEmailForTeacher,
        ),
        MenuDialogItem(
          title: "Copy email giao đề tài",
          subtitle: "Để gửi email cho học viên",
          icon: Icons.copy,
          onTap: actions.showAssignmentEmailForStudent,
        ),
        MenuDialogItem(
          title: "Copy bảng giao đề tài",
          subtitle: "Có thể paste vào excel",
          icon: Icons.copy,
          onTap: actions.copyThesisAssignment,
        ),
        MenuDialogItem(
          title: "Tạo đề tài",
          subtitle: "Tạo đề tài không có trong danh sách",
          icon: Icons.add,
          onTap: actions.goToThesisCreate,
        ),
        MenuDialogItem(
          title: "Danh sách đề tài",
          subtitle: "Chuyển tới trang danh sách đề tài",
          icon: Icons.forward,
          onTap: actions.goToThesisList,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton();

  @override
  Widget build(BuildContext context) {
    final actions = _PageActions(context);

    return FilledButton.icon(
      label: Text("Hành động"),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => _ActionDialog(actions: actions),
      ),
    );
  }
}

class _ThesisItem extends StatelessWidget {
  final Student student;
  final Thesis? thesis;
  final ValueNotifier<bool> selectionNotifier;

  const _ThesisItem({
    required this.student,
    required this.selectionNotifier,
    this.thesis,
  });

  bool get selected => selectionNotifier.value;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context, listen: false);
    final teacher = state.mapSupervisor[student];

    final assigned = thesis != null;
    final subtitle = assigned
        ? "Đề tài: ${thesis?.tenTiengViet} - Giảng viên: ${teacher!.hoTenChucDanh}"
        : "Chưa có đề tài";
    final isSelectionMode = context.select(
      (_State state) => state.isSelectionMode,
    );

    return ValueListenableBuilder(
      valueListenable: selectionNotifier,
      builder: (context, selected, child) {
        final leading = switch (isSelectionMode) {
          true => Checkbox(
            onChanged: (value) => selectionNotifier.value = value ?? false,
            value: selected,
          ),
          false => null,
        };
        return ListTile(
          leading: leading,

          title: Text(student.hoTen),
          subtitle: Text(subtitle),
          onLongPress: () => _toggleSelection(),
          onTap: () async {
            if (assigned && !isSelectionMode) {
              await _showActions(context: context, thesis: thesis);
            } else if (isSelectionMode) {
              selectionNotifier.value = !selected;
            } else {
              final page = PageSelectThings<Thesis>(
                title: "Chọn đề tài",
                includeNull: true,
                searchFunction: (query) => Thesis.search(
                  searchQuery: query,
                  assigned: false,
                ),
                itemBuilder: (context, Thesis? thesis) => switch (thesis) {
                  Thesis thesis => ListTile(
                    title: Text(thesis.tenTiengViet),
                    subtitle: Text(thesis.giangVien.hoTenChucDanh),
                    onTap: () => Navigator.pop(context, thesis),
                  ),
                  null => ListTile(
                    title: Text("Hủy"),
                    subtitle: Text("Không chọn đề tài"),
                    onTap: () => Navigator.pop(context, null),
                  ),
                },
              );

              final selectedThesis = await Navigator.push<Thesis?>(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
              switch (selectedThesis) {
                case Thesis thesis:
                  await thesis.assignStudent(student);
                  state.mapThesis[student] = selectedThesis;
                  state.mapSupervisor[student] = selectedThesis.giangVien;
                  state.search();
              }
            }
          },
        );
      },
    );
  }

  Future<void> _showActions({
    required BuildContext context,
    required Thesis? thesis,
  }) async {
    final actions = _ItemActions(
      context: context,
      student: student,
      thesis: thesis,
    );

    await showDialog(
      context: context,
      builder: (context) => MenuDialog(
        items: [
          MenuDialogItem(
            title: "Chi tiết",
            subtitle: "Xem chi tiết đề tài",
            icon: Icons.info,
            onTap: actions.goToDetail,
          ),
          MenuDialogItem(
            title: (selected) ? "Bỏ chọn" : "Chọn",
            icon: (selected) ? Icons.square : Icons.check,
            onTap: () => _toggleSelection(),
          ),
          MenuDialogItem(
            title: "Copy slug",
            subtitle: "Sao chép tên file QD giao đề tài",
            icon: Icons.copy,
            onTap: actions.copySlug,
          ),
        ],
      ),
    );
  }

  Future<void> _toggleSelection() async {
    selectionNotifier.value = !selectionNotifier.value;
  }
}

class _GotoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: controller.open,
          tooltip: "Menu",
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () async {
            final state = Provider.of<_State>(context, listen: false);
            final students = state.listStudents;
            final maybeTheses = [
              for (final student in students) state.mapThesis[student],
            ];
            final theses = [
              for (final thesis in maybeTheses)
                if (thesis != null) thesis,
            ];

            copy_pasta.copyThesisAssignment(theses: theses);
          },
          child: ListTile(
            title: const Text("Copy bảng giao đề tài"),
            subtitle: Text("Có thể paste vào excel"),
            leading: const Icon(Icons.copy),
          ),
        ),
        MenuItemButton(
          onPressed: () {},
          child: ListTile(
            title: const Text("Copy email đề tài"),
            subtitle: Text("Gửi quyết định giao đề tài cho giảng viên"),
            leading: const Icon(Icons.copy),
          ),
        ),
        MenuItemButton(
          // onPressed: () => navigator.pushNamed(ThesisTopicAddPage.routeName),
          child: ListTile(
            leading: const Icon(Icons.add),
            title: Text("Thêm đề tài"),
          ),
        ),
        MenuItemButton(
          // onPressed: () => navigator.pushNamed(ThesisTopicListPage.routeName),
          child: ListTile(
            leading: const Icon(Icons.forward),
            title: Text("Tới trang danh sách đề tài"),
          ),
        ),
      ],
    );
  }
}

class _SelectCohortButton extends ConsumerWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = Provider.of<_State>(context, listen: false);

    return SearchAnchor(
      builder: (context, searchController) => TextField(
        decoration: InputDecoration(
          labelText: "Chọn niên khóa",
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        readOnly: true,
        controller: controller,
        onTap: () => searchController.openView(),
      ),
      suggestionsBuilder: (context, searchController) async {
        final cohorts = await ref.watch(
          searchCohortsProvider(searchController.text).future,
        );
        final suggestions = <Widget>[];
        for (final classOfYear in cohorts) {
          final widget = ListTile(
            title: Text(classOfYear.nienKhoa),
            onTap: () {
              controller.text = classOfYear.nienKhoa;
              state.selectedClassOfYear = classOfYear;
              searchController.closeView("");
            },
          );
          suggestions.add(widget);
        }
        return suggestions;
      },
    );
  }
}

class _State extends ChangeNotifier {
  final searchController = SearchController();
  final ValueNotifier<NienKhoa?> classOfYearNotifier = ValueNotifier(null);
  List<ValueNotifier<bool>> selectionNotifiers = [];
  List<Student> listStudents = [];
  Map<Student, Thesis?> mapThesis = {};
  Map<Student, Teacher?> mapSupervisor = {};

  final duration = const Duration(milliseconds: 300);
  Timer debounceTimer = Timer(Duration(milliseconds: 10), () {});

  String get searchQuery => searchController.text;

  bool _isSelectionMode = false;
  bool get isSelectionMode => _isSelectionMode;
  set isSelectionMode(bool value) {
    if (value == _isSelectionMode) return; // No change
    _isSelectionMode = value;
    notifyListeners();
  }

  ClassOfYear? get selectedClassOfYear => classOfYearNotifier.value;
  set selectedClassOfYear(ClassOfYear? value) {
    classOfYearNotifier.value = value;
    search();
  }

  void selectInverse() {
    for (final notifier in selectionNotifiers) {
      notifier.value = !notifier.value;
    }
    isSelectionMode = selectionNotifiers.any(
      (notifier) => notifier.value,
    );
  }

  void selectAll() {
    for (final notifier in selectionNotifiers) {
      notifier.value = true;
    }
    isSelectionMode = true;
  }

  void selectNone() {
    for (final notifier in selectionNotifiers) {
      notifier.value = false;
    }
    isSelectionMode = false;
  }

  List<Student> get selectedStudents {
    final selected = <Student>[];
    final anySelected = selectionNotifiers.any((notifier) => notifier.value);
    if (anySelected == false) {
      return listStudents; // Return all students if none selected
    }

    for (int i = 0; i < selectionNotifiers.length; i++) {
      if (selectionNotifiers[i].value) {
        selected.add(listStudents[i]);
      }
    }

    return selected;
  }

  void debounceSearch() {
    // Cancel the previous timer
    debounceTimer.cancel();

    // Start a new timer
    debounceTimer = Timer(duration, () {
      search();
    });
  }

  @override
  void dispose() {
    for (final notifier in selectionNotifiers) {
      notifier.dispose();
    }
    searchController.dispose();
    super.dispose();
  }

  void refresh() {
    // Notify listeners to rebuild the UI
    notifyListeners();
  }

  void search() async {
    // Cancel any debounce timer
    debounceTimer.cancel();

    // Get all students in the selected class of year
    final students = await Student.search(
      searchQuery: searchQuery,
      classOfYear: selectedClassOfYear,
    );

    // Dispose all previous selected notifiers and create new ones
    for (final notifier in selectionNotifiers) {
      notifier.dispose();
    }
    selectionNotifiers = List.generate(
      students.length,
      (index) => ValueNotifier<bool>(false),
    );

    // Reset selection mode, auto switch to selection mode if any student is selected
    for (final notifier in selectionNotifiers) {
      notifier.addListener(() {
        isSelectionMode = selectionNotifiers.any(
          (notifier) => notifier.value,
        );
      });
    }
    isSelectionMode = false;

    // Add data and notify listeners
    final listStudents = <Student>[];
    final mapThesis = <Student, Thesis?>{};
    final mapSupervisor = <Student, Teacher?>{};
    for (final student in students) {
      listStudents.add(student);
      final thesis = await Thesis.getByStudentId(student.id);
      mapThesis[student] = thesis;
      mapSupervisor[student] = thesis?.giangVien;
    }

    // Update the state
    this.listStudents = listStudents;
    this.mapThesis = mapThesis;
    this.mapSupervisor = mapSupervisor;

    notifyListeners();
  }
}

class _ThesisListView extends ConsumerWidget {
  Widget _buildResult(BuildContext context, Map<Student, Thesis?> thesisMap) {
    final state = Provider.of<_State>(context, listen: false);
    final entries = thesisMap.entries.toList();
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, int idx) {
        final student = entries[idx].key;
        final thesis = entries[idx].value;
        final selectionNotifier = state.selectionNotifiers[idx];
        return _ThesisItem(
          student: student,
          thesis: thesis,
          selectionNotifier: selectionNotifier,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cohort = context.select(
      (_State state) => state.selectedClassOfYear,
    );

    if (cohort == null) {
      return Center(
        child: Text("Chọn niên khóa để xem danh sách học viên"),
      );
    }

    final thesisMapState = ref.watch(
      getThesisByStudentOfCohortsProvider(cohort),
    );

    return switch (thesisMapState) {
      AsyncLoading() => Center(child: CircularProgressIndicator()),
      AsyncError error => Center(
        child: Text(
          "Lỗi khi tải danh sách đề tài: $error",
          style: TextStyle(color: Colors.red),
        ),
      ),
      AsyncData(:final value) => _buildResult(context, value),
    };
  }
}

class _ThesisSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context, listen: false);
    return TextField(
      key: searchFieldKey,
      controller: state.searchController,
      decoration: InputDecoration(labelText: 'Tìm kiếm'),
      onEditingComplete: () => state.search(),
      onSubmitted: (value) => state.search(),
      onChanged: (value) => state.debounceSearch(),
    );
  }
}
