import 'dart:async';

import 'package:fami_tools/custom_tiles.dart';
import 'package:fami_tools/pages/course_pages/course_details_page.dart';
import 'package:fami_tools/utilities/strings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../business/copy_pasta.dart';
import '../../business/db_v2_providers.dart';
import '../../business/documents.dart';
import '../../business/documents/course_limiting_pdf.dart';
import '../../custom_widgets.dart' hide MenuDialog;
import '../../custom_widgets/pdf_viewer.dart';
import '../../custom_widgets/selection_model.dart';
import '../../shortcuts.dart';
import '../teacher_pages/details.dart';
import 'limiting_providers.dart';

// This is supposed to show a popup view
// of a table of courses like in the excel version
@immutable
class _PreviewIntent extends Intent {
  const _PreviewIntent();
}

class CourseLimitingPage extends StatelessWidget {
  static const routeName = "/lop-tc/han-che-hp";

  static const tabs = [
    Tab(text: "Danh mục"),
    Tab(text: "Quản lý"),
    Tab(text: "Mời dạy"),
  ];

  const CourseLimitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusNodeProvider(
      child: DefaultTabController(
        length: tabs.length,
        child: CommonShortcuts(
          onSearch: (context) {
            final tabController = DefaultTabController.of(context);
            tabController.animateTo(0);
            final focusNode = FocusNodeProvider.of(context);
            focusNode.requestFocus();
          },
          child: Scaffold(
            appBar: ConstrainedAppBar(
              withTabBar: true,
              child: AppBar(
                title: Text("Hạn chế học phần"),
                actions: [
                  Consumer(
                    builder: (context, ref, _) => TextButton.icon(
                      onPressed: () {
                        ref.invalidate(courseLimitingModelProvider);
                      },
                      label: Text("Refresh"),
                      icon: Icon(Symbols.refresh),
                    ),
                  ),
                ],
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: tabs,
                ),
              ),
            ),
            body: Shortcuts(
              shortcuts: {
                SingleActivator(LogicalKeyboardKey.keyP, control: true):
                    _PreviewIntent(),
              },
              child: ConstrainedBody(
                child: TabBarView(
                  children: [
                    const _CourseListTabView(),
                    _ActionTabView(),
                    _TeachingInvitationTab(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CourseListTabView extends StatelessWidget {
  const _CourseListTabView();

  @override
  Widget build(BuildContext context) {
    final searchController = SearchController();
    return Actions(
      actions: {
        _PreviewIntent: CallbackAction<_PreviewIntent>(
          onInvoke: (intent) {
            print("Preview action invoked");
            return null;
          },
        ),
      },
      child: FocusScope(
        autofocus: true,
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            spacing: context.gutter,
            children: [
              _SemesterSelector(),
              _CourseSearchBar(searchController: searchController),
              Expanded(
                child: _CourseLimitingListView(
                  searchController: searchController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseSearchBar extends StatelessWidget {
  final SearchController searchController;

  const _CourseSearchBar({required this.searchController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: FocusNodeProvider.of(context),
      controller: searchController,
      decoration: InputDecoration(
        labelText: "Tìm kiếm học phần",
        icon: Icon(Symbols.search),
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _CourseLimitingListView extends ConsumerWidget {
  final SearchController searchController;
  const _CourseLimitingListView({required this.searchController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(courseLimitingModelProvider);
    switch (modelAsync) {
      case AsyncLoading():
        return Center(child: LinearProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ErrorWidget(error);
      default:
    }

    final model = modelAsync.value!;
    final courses = model.courses;
    final limitedCourses = model.limitedCourses;
    final semester = model.semester;
    final previousCourses = model.previouseCourses;

    return ValueListenableBuilder(
      valueListenable: searchController,
      builder: (context, value, child) {
        final filteredCourses = courses.where((course) {
          final query = value.text.toLowerCase();
          final matches = [
            course.id.toLowerCase().contains(query),
            course.vietnameseName.toLowerCase().contains(query),
            course.englishName.toLowerCase().contains(query),
          ];
          return matches.any((element) => element);
        }).toList();

        return ListView.separated(
          separatorBuilder: (_, _) => Divider(),
          itemCount: filteredCourses.length,
          itemBuilder: (context, int i) {
            final course = filteredCourses[i];
            final previouslyOpenned = previousCourses.contains(course);
            final limited = limitedCourses.contains(course);

            return _CourseLimitingListTile(
              courseId: course.id,
              semesterId: semester!.id,
              previouslyOpenned: previouslyOpenned,
              limited: limited,
            );
          },
        );
      },
    );
  }
}

class _CourseLimitingListTile extends ConsumerWidget {
  final String courseId;
  final String semesterId;
  final bool previouslyOpenned;
  final bool limited;

  const _CourseLimitingListTile({
    required this.courseId,
    required this.semesterId,
    required this.previouslyOpenned,
    required this.limited,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = CourseLimitingViewModelNotifier.provider((
      semesterId: semesterId,
      courseId: courseId,
    ));

    final modelAsync = ref.watch(provider);
    switch (modelAsync) {
      case AsyncLoading():
        return Skeletonizer(
          enabled: true,
          child: ListTile(
            title: Text("MI1111"),
            subtitle: Text("Đang tải..."),
          ),
        );
      case AsyncError(:final error, :final stackTrace):
        return ErrorWidget(error);
      default:
    }

    final model = modelAsync.value!;
    final course = model.course;
    final title = [course.id, course.vietnameseName].join(" ");

    return CheckboxListTile(
      key: ValueKey((courseId, semesterId)),
      title: Text(title),
      subtitle: Text(course.category.label),
      value: limited,
      enabled: previouslyOpenned == false,
      onChanged: (value) {
        final notifier = ref.watch(limitedCourseProvider.notifier);
        notifier.setCourseLimited(
          semester: model.semester,
          course: course,
          limited: value ?? limited,
        );
      },
    );
  }
}

// class _ActionMenuLarge extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return EzRow(
//       spacing: context.responsiveGutter,
//       children: [
//         Expanded(
//           child: _SearchField(),
//         ),
//         _CourseCategorySelector(),
//         _SemesterSelector(),
//         _LinkToSemesterPage(),
//         _ExportPdfButton(),
//         _EmailButton(),
//       ],
//     );
//   }
// }

class _EmailButton extends ConsumerWidget {
  final Widget Function(BuildContext, VoidCallback) builder;
  const _EmailButton({required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void callback() async {
      final email = await ref.watch(courseLimitingEmail.future);
      showDialog(
        context: context,
        builder: (context) => EmailCopyDialog(email: email),
      );
    }

    return builder(context, callback);
  }
}

class _SemesterSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(semesterSelectionModelProvider);
    switch (modelAsync) {
      case AsyncLoading<List<SemesterData>>():
        return CircularProgressIndicator();
      case AsyncError<List<SemesterData>>():
        return Text('Error loading semesters');
      default:
    }

    final model = modelAsync.value;
    final semesters = model?.options ?? [];
    final selected = model?.selected;

    return DropdownMenu<SemesterData>(
      label: Text("Đợt học"),
      expandedInsets: EdgeInsets.zero,
      initialSelection: selected,
      dropdownMenuEntries: [
        for (final semester in semesters)
          DropdownMenuEntry(
            value: semester,
            label: semester.id,
          ),
      ],
      onSelected: (value) {
        final notifier = ref.read(semesterSelectionModelProvider.notifier);
        notifier.select(value);
      },
    );
  }
}

class _ActionTabView extends ConsumerWidget {
  final saveDirectoryNotifier = StoredStringNotifier(
    null,
    key: "course-limiting-save-dir",
  );

  final pdfConfigNotifier = ValueNotifier<PdfConfig>(
    CourseLimitingDocumentModel.defaultPdfConfig,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(courseLimitingModelProvider);
    switch (modelAsync) {
      case AsyncLoading():
        return Center(child: LinearProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ErrorWidget(error);
      default:
    }

    final messager = ScaffoldMessenger.of(context);
    final model = modelAsync.value!;

    void copyCourseNameList(List<CourseData> courses) {
      final copyStr = courses
          .map((course) => "* ${course.id} - ${course.vietnameseName}")
          .join('\n\n');

      final clipboardData = ClipboardData(text: copyStr);
      Clipboard.setData(clipboardData);

      final snackBar = SnackBar(
        content: Text("Đã sao chép ${courses.length} học phần"),
      );
      messager.showSnackBar(snackBar);
    }

    final formWorkActions = [
      ListTile(
        title: Text("Bình chọn học phần tự chọn"),
        subtitle: Text("Copy danh sách học phần tự chọn có thể mở"),
        leading: Icon(Symbols.content_copy),
        onTap: () => copyCourseNameList(model.availableForVoteCourses),
      ),

      ListTile(
        title: Text("Học phần đã mở trước đó"),
        subtitle: Text(
          "Copy danh sách học phần đã mở trước đó (không mở được)",
        ),
        leading: Icon(Symbols.content_copy),
        onTap: () => copyCourseNameList(model.notVvailableForVoteCourses),
      ),
    ];

    final paperworkActions = [
      PdfViewerTile(
        title: Text("Xem danh mục hạn chế học phần"),
        subtitle: Text("File PDF danh mục hạn chế học phần"),
        initialConfig: pdfConfigNotifier.value,
        pdfBuilder: (config) =>
            ref.watch(courseLimitingPdfProvider(config).future),
      ),

      // Thư mục lưu
      ValueListenableBuilder(
        valueListenable: saveDirectoryNotifier,
        builder: (context, value, child) {
          final subtitle = switch (value) {
            null => "Chưa chọn thư mục",
            String s => "Đã chọn: $s",
          };
          return ListTile(
            title: Text("Chọn thư mục lưu biểu mẫu"),
            subtitle: Text(subtitle),
            leading: Icon(Symbols.folder),
            onTap: () async {
              final outputPath = await FilePicker.platform.getDirectoryPath(
                dialogTitle: "Chọn thư mục lưu biểu mẫu",
              );
              if (outputPath != null) {
                saveDirectoryNotifier.value = outputPath;
              }
            },
          );
        },
      ),

      // Nút để lưu
      ListTile(
        title: Text("Lưu biểu mẫu danh mục hạn chế học phần"),
        subtitle: Text("Lưu biểu mẫu vào thư mục đã chọn"),
        leading: Icon(Symbols.save),
        onTap: () async {
          final saveDir = saveDirectoryNotifier.value;
          if (saveDir == null) {
            final snackBar = SnackBar(
              content: Text("Vui lòng chọn thư mục lưu trước"),
            );
            messager.showSnackBar(snackBar);
            return;
          }

          final limitingPdf = await ref.watch(
            courseLimitingPdfProvider(pdfConfigNotifier.value).future,
          );
          final limitingXlsx = await ref.watch(
            courseLimitingXlsxProvider.future,
          );
          limitingPdf.save(directory: saveDir);
          limitingXlsx.save(directory: saveDir);

          final snackBar = SnackBar(
            content: Text("Đã lưu biểu mẫu vào $saveDir"),
          );
          messager.showSnackBar(snackBar);
        },
      ),

      // Gửi email
      _EmailButton(
        builder: (context, callback) => ListTile(
          title: Text("Gửi email danh mục hạn chế học phần"),
          subtitle: Text("Email mẫu để gửi Ban Đào tạo"),
          leading: Icon(Symbols.email),
          onTap: callback,
        ),
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardSection(title: "Làm khảo sát", children: formWorkActions),
          CardSection(title: "Nộp danh sách", children: paperworkActions),
        ],
      ),
    );
  }
}

class _TeachingInvitationState extends InheritedWidget {
  final ValueNotifier<TeacherData?> selectedTeacherNotifier = .new(null);
  final ValueNotifier<CourseData?> selectedCourseNotifier = .new(null);

  _TeachingInvitationState({required super.child});

  static _TeachingInvitationState of(BuildContext context) {
    final state = context
        .dependOnInheritedWidgetOfExactType<_TeachingInvitationState>();
    if (state == null) {
      throw FlutterError(
        "_TeachingInvitationState.of() called with a context that does not contain "
        "a _TeachingInvitationState.",
      );
    }
    return state;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class _TeachingInvitationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: _TeachingInvitationState(
        child: Column(
          spacing: context.gutter,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SemesterSelector(),
            _InvitationCourseSelection(),
            _InvitationTeacherList(),
            FramedSection(
              title: "Thông tin",
              padding: EdgeInsets.all(context.gutterSmall),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Thông tin học phần"),
                    subtitle: Text("Tới trang học phần"),
                    onTap: () {
                      final ref = ProviderScope.containerOf(context);
                      final course = ref.read(SelectedCourseNotifier.provider);
                      if (course == null) {
                        final snackBar = SnackBar(
                          content: Text("Vui lòng chọn học phần trước"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseDetailsPage(courseId: course.id),
                        ),
                      );
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.gutterSmall,
                    ),
                    child: Divider(),
                  ),

                  ListTile(
                    title: Text("Thông tin giảng viên"),
                    subtitle: Text("Tới trang thông tin giảng viên"),
                    onTap: () {
                      final ref = ProviderScope.containerOf(context);
                      final teacher = ref.read(
                        SelectedTeacherNotifier.provider,
                      );
                      if (teacher == null) {
                        final snackBar = SnackBar(
                          content: Text("Vui lòng chọn giảng viên trước"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherDetailsPage(
                            id: teacher.id,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            _InvitationSection(),
          ],
        ),
      ),
    );
  }
}

class _InvitationCourseSelection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseModelAsync = ref.watch(limitedCourseProvider);
    switch (courseModelAsync) {
      case AsyncLoading():
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ListTile(
          title: Text("Lỗi tải học phần"),
          subtitle: Text(error.toString()),
        );
      default:
    }
    final courses = courseModelAsync.value ?? [];
    final course = ref.watch(SelectedCourseNotifier.provider);

    return DropdownMenu<CourseData>(
      label: Text("Chọn học phần"),
      initialSelection: course,
      expandedInsets: EdgeInsets.zero,
      trailingIconFocusNode: FocusNode(skipTraversal: true),
      dropdownMenuEntries: [
        for (final course in courses)
          DropdownMenuEntry(
            value: course,
            label: "${course.id} - ${course.vietnameseName}",
          ),
      ],
      onSelected: (value) {
        final notifier = ref.read(SelectedCourseNotifier.provider.notifier);
        notifier.select(value);
      },
    );
  }
}

class _InvitationTeacherList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersAsync = ref.watch(teachersProvider);
    switch (teachersAsync) {
      case AsyncLoading():
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ErrorWidget(error);
      default:
    }

    final teachers = teachersAsync.value!;
    final selectedTeacher = ref.watch(SelectedTeacherNotifier.provider);

    return RadioGroup<TeacherData>(
      groupValue: selectedTeacher,
      onChanged: (value) {
        final notifier = ref.read(SelectedTeacherNotifier.provider.notifier);
        notifier.select(value);
      },
      child: FramedSection(
        title: "Danh sách giảng viên",
        padding: EdgeInsets.all(context.gutterSmall),
        child: Column(
          children: [
            for (final (i, teacher) in teachers.indexed) ...[
              if (i > 0)
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: context.gutterSmall,
                  ),
                  child: Divider(),
                ),
              RadioListTile<TeacherData>(
                key: ValueKey(teacher.id),
                value: teacher,
                title: Text(teacher.name),
                subtitle: Text(teacher.email ?? "Không có email"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _InvitationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramedSection(
      title: "Mời dạy",
      padding: EdgeInsets.all(context.gutterSmall),
      child: Column(
        children: [
          _InvitationPronoun(),
          _InvitationMessage(),
          ListTile(
            title: Text("Copy dự trù"),
            subtitle: Text("Paste vào excel hoặc các phần mềm bảng tính khác"),
            onTap: () async {
              final messenger = ScaffoldMessenger.of(context);
              try {
                final ref = ProviderScope.containerOf(context);
                final draft = await ref.read(draftProvider.future);
                final clipboardData = ClipboardData(
                  text: draft,
                );
                Clipboard.setData(clipboardData);
                final snackBar = SnackBar(
                  content: Text("Đã sao chép dự trù vào clipboard"),
                );
                messenger.showSnackBar(snackBar);
              } catch (e) {
                final snackBar = SnackBar(
                  content: Text("Lỗi khi sao chép dự trù: $e"),
                );
                messenger.showSnackBar(snackBar);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _InvitationPronoun extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacher = ref.watch(SelectedTeacherNotifier.provider);
    if (teacher == null) {
      return ListTile(
        subtitle: Text("Vui lòng chọn giảng viên"),
        title: Text("Chưa có giảng viên"),
      );
    }

    return PopupMenuButton(
      itemBuilder: (context) => [
        for (final pronoun in Pronoun.values)
          PopupMenuItem<Pronoun>(
            value: pronoun,
            child: Text("${pronoun.capitalized} ${teacher.name}"),
          ),
      ],
      onSelected: (value) async {
        final db = await ref.watch(mainDatabaseProvider.future);
        db.updateTeacher(id: teacher.id, pronoun: value);
      },
      child: ListTile(
        title: Text("Xưng hô"),
        subtitle: Text("${teacher.pronoun.capitalized} ${teacher.name}"),
      ),
    );
  }
}

class _InvitationMessage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invitationMsgAsync = ref.watch(invitationMessageProvider);
    switch (invitationMsgAsync) {
      case AsyncLoading():
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final UnselectedException error):
        return Skeletonizer(
          child: ListTile(
            title: Text("Chưa chọn giảng viên"),
            subtitle: Text(error.toString()),
          ),
        );
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ErrorWidget(error);
      default:
    }
    final message = invitationMsgAsync.value!;

    return ListTile(
      titleAlignment: ListTileTitleAlignment.titleHeight,
      title: Text("Tin nhắn (click để copy)"),
      subtitle: Text(message),
      onTap: () {
        Clipboard.setData(ClipboardData(text: message));
        final snackBar = SnackBar(
          content: Text("Đã sao chép tin nhắn vào clipboard"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
