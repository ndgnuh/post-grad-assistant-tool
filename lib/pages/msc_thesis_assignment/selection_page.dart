import 'package:fami_tools/business/view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';

final matchedThesesProvider = FutureProvider.family(
  (ref, String query) async {
    // Null means the user has to input a search query
    if (query.isEmpty) {
      return null;
    }

    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.searchTheses(searchText: query);
    stmt.where((t) => t.studentId.isNull());

    final ids = await stmt.map((r) => r.id).get();
    final thesesVms = <ThesisViewModel>[];
    for (final id in ids) {
      final vm = await ref.watch(
        ThesisViewModel.providerById(id).future,
      );
      thesesVms.add(vm);
    }
    return thesesVms;
  },
);

final searchQueryProvider = NotifierProvider.autoDispose(TextNotifier.new);
final vietnameseNameProvider = NotifierProvider.autoDispose(TextNotifier.new);
final englishNameProvider = NotifierProvider.autoDispose(TextNotifier.new);

class MscThesisSelectionPage extends StatelessWidget {
  static const String routeName = '/msc-thesis/selection-by-student';

  final int studentId;
  const MscThesisSelectionPage({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: StudentName(studentId: studentId),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Đề tài có sẵn'),
                Tab(text: 'Tạo mới'),
              ],
              isScrollable: true,
            ),
          ),
        ),
        body: ConstrainedBody(
          child: TabBarView(
            children: [
              _SearchTabView(studentId: studentId),
              _CreateTabView(studentId: studentId),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentName extends ConsumerWidget {
  final int studentId;
  const StudentName({super.key, required this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentAsync = ref.watch(studentByIdProvider(studentId));
    return studentAsync.when(
      data: (student) => Text("${student.name} - ${student.studentId}"),
      loading: () => LinearProgressIndicator(),
      error: (error, stack) => Text('Lỗi: $error'),
    );
  }
}

class _SearchResults extends ConsumerWidget {
  final int studentId;
  final String searchQuery;
  const _SearchResults({required this.studentId, required this.searchQuery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thesesAsync = ref.watch(matchedThesesProvider(searchQuery));
    switch (thesesAsync) {
      case AsyncLoading():
        return Center(child: LinearProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Lỗi: $error'));
      default:
    }

    final theses = thesesAsync.value;
    if (theses == null) {
      return Center(
        child: Text('Vui lòng nhập từ khóa để tìm kiếm.'),
      );
    }

    if (theses.isEmpty) {
      return Center(
        child: Text('Không tìm thấy luận văn nào phù hợp.'),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: theses.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final thesisVm = theses[index];
        final thesis = thesisVm.thesis;
        final id = thesis.id;
        final notifier = ref.read(thesisMutationProvider(id).notifier);

        return ListTile(
          title: Text(thesisVm.thesis.vietnameseTitle),
          subtitle: Text(
            'Hướng dẫn: ${thesisVm.supervisor.name}',
          ),
          onTap: () {
            notifier.assignToStudent(studentId);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}

class _SearchTabView extends HookWidget {
  final int studentId;
  const _SearchTabView({required this.studentId});

  @override
  Widget build(BuildContext context) {
    final searchQuery = useState('');

    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        verticalDirection: context.verticalDirection,
        spacing: context.gutter,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Tìm kiểm',
            ),
            onSubmitted: (value) => searchQuery.value = value,
            onChanged: (value) => searchQuery.value = value,
          ),
          Expanded(
            child: _SearchResults(
              studentId: studentId,
              searchQuery: searchQuery.value,
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateTabView extends HookConsumerWidget {
  final int studentId;
  const _CreateTabView({required this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vietnameseTitle = useTextEditingController();
    final englishTitle = useTextEditingController();
    final supervisor = ValueNotifier<TeacherData?>(null);
    final formKey = GlobalKey<FormState>();

    final searchController = SearchController();
    supervisor.addListener(() {
      searchController.text = supervisor.value?.name ?? "";
    });

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Form(
        key: formKey,
        child: Column(
          spacing: context.gutter,
          children: [
            SearchAnchor(
              searchController: searchController,
              viewHintText: "Tìm kiếm",
              builder: (context, controller) {
                return TextFormField(
                  controller: controller,
                  onTap: () => controller.openView(),
                  onTapOutside: (_) => controller.closeView(null),
                  validator: (_) {
                    if (supervisor.value == null) {
                      return "Chọn giảng viên hướng dẫn";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Giảng viên hướng dẫn",
                    suffixIcon: (supervisor.value != null)
                        ? IconButton(
                            icon: Icon(Symbols.delete),
                            onPressed: () => supervisor.value = null,
                          )
                        : null,
                  ),
                );
              },
              suggestionsBuilder: (context, controller) async {
                final db = await ref.read(mainDatabaseProvider.future);
                final stmt = db.searchTeachers(
                  searchText: controller.text,
                  isOutsider: false,
                );
                final teachers = await stmt.get();
                return [
                  for (final teacher in teachers)
                    ListTile(
                      title: Text(teacher.name),
                      subtitle: Text(teacher.email ?? 'Không có email'),
                      onTap: () {
                        supervisor.value = teacher;
                        Navigator.pop(context);
                      },
                    ),
                ];
              },
            ),
            TextFormField(
              controller: vietnameseTitle,
              decoration: InputDecoration(
                labelText: 'Tiêu đề luận văn (Tiếng Việt)',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập tiêu đề luận văn bằng tiếng Việt';
                }
                return null;
              },
            ),
            TextFormField(
              controller: englishTitle,
              decoration: InputDecoration(
                labelText: 'Tiêu đề luận văn (Tiếng Anh)',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập tiêu đề luận văn bằng tiếng Anh';
                }
                return null;
              },
            ),
            FilledButton(
              onPressed: () async {
                final ok = formKey.currentState!.validate();
                if (!ok) {
                  return;
                }

                final db = await ref.read(mainDatabaseProvider.future);
                final student = await ref.read(
                  studentByIdProvider(studentId).future,
                );

                db.createThesis(
                  vietnameseTitle: vietnameseTitle.text.trim(),
                  englishTitle: englishTitle.text.trim(),
                  supervisor: supervisor.value!,
                  student: student,
                );

                ref.invalidate(thesisIdByStudentProvider(studentId));
                Navigator.pop(context);
              },
              child: Text('Tạo mới và giao đề tài'),
            ),
          ],
        ),
      ),
    );
  }
}
