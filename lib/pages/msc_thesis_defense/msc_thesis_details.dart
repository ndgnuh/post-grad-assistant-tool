// TODO: move this to a seprate package
import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:fami_tools/custom_tiles.dart';
import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/business/view_models.dart';
import 'package:fami_tools/shortcuts.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MscThesisDetailsPage extends ConsumerWidget {
  final int thesisId;
  final int initialTabIndex;
  static const String routeName = '/msc-thesis/details';

  const MscThesisDetailsPage({
    super.key,
    required this.thesisId,
    this.initialTabIndex = 0,
  });

  static const tabs = [
    Tab(text: 'Thông tin chung'),
    Tab(text: 'Bảo vệ'),
  ];

  factory MscThesisDetailsPage.assignDefenseCouncil({
    required int thesisId,
  }) {
    return MscThesisDetailsPage(
      thesisId: thesisId,
      initialTabIndex: 1,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialTabIndex,
      child: CommonShortcuts(
        child: Scaffold(
          appBar: ConstrainedAppBar(
            withTabBar: true,
            child: AppBar(
              title: const Text('Thông tin luận văn'),
              bottom: const TabBar(
                isScrollable: true,
                tabs: tabs,
              ),
            ),
          ),
          body: ConstrainedBody(
            child: TabBarView(
              children: [
                _GeneralInformationTab(thesisId: thesisId),
                _AssignCouncilTab(thesisId: thesisId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GeneralInformationTab extends StatelessWidget {
  final int thesisId;

  const _GeneralInformationTab({required this.thesisId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        children: [
          _InformationSection(thesisId: thesisId),
          _TeachingAssignmentSection(thesisId: thesisId),
        ],
      ),
    );
  }
}

class _AssignCouncilTab extends StatelessWidget {
  final int thesisId;

  const _AssignCouncilTab({required this.thesisId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          _CouncilAssignmentInformationSection(thesisId: thesisId),
          _CouncilAssignmentSection(thesisId: thesisId),
          _DefenseInformationSection(thesisId: thesisId),
        ],
      ),
    );
  }
}

class _CouncilAssignmentInformationSection extends ConsumerWidget {
  final int thesisId;
  const _CouncilAssignmentInformationSection({required this.thesisId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(ThesisViewModel.providerById(thesisId));
    switch (modelAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError():
        return Text('Error loading thesis information');
      default:
    }

    final model = modelAsync.value!;
    final thesis = model.thesis;
    final student = model.student;

    return FramedSection(
      title: 'Thông tin phân công hội đồng',
      padding: EdgeInsets.all(context.gutterSmall),
      child: Column(
        children: [
          ListTile(
            title: Text('Luận văn'),
            subtitle: Text(thesis.vietnameseTitle),
          ),
          FramedSection.listTileDivider(),
          ListTile(
            title: Text('Học viên'),
            subtitle: Text(student?.name ?? 'Chưa giao'),
          ),
        ],
      ),
    );
  }
}

class _DefenseInformationSection extends ConsumerWidget {
  final int thesisId;
  const _DefenseInformationSection({required this.thesisId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(ThesisViewModel.providerById(thesisId));
    switch (modelAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError():
        return Text('Error loading thesis information');
      default:
    }

    final model = modelAsync.value!;
    final thesis = model.thesis;
    final defenseDecision = model.councilDecision;

    return FramedSection.withListTile(
      title: 'Thông tin bảo vệ',
      children: [
        DateTile(
          titleText: 'Ngày bảo vệ',
          initialValue: thesis.defenseDate,
          onUpdate: (value) async {
            final db = await ref.read(mainDatabaseProvider.future);
            final companion = ThesisCompanion(
              defenseDate: Value(value),
            );
            final stmt = db.thesis.update();
            stmt.where((r) => r.id.equals(thesisId));
            await stmt.write(companion);
          },
        ),
        SearchAnchor(
          builder: (context, controller) => ListTile(
            title: Text('Số QĐ bảo vệ'),
            isThreeLine: true,
            subtitle: switch (defenseDecision) {
              null => Text('Chưa có'),
              final decision => Text(
                "${decision.title}\n${decision.fullLabel}",
              ),
            },
            onTap: () => controller.openView(),
          ),
          suggestionsBuilder: (context, controller) async {
            if (controller.text.isEmpty) {
              return [];
            }

            final db = await ref.read(mainDatabaseProvider.future);
            final decisions = await db
                .searchDocuments(searchText: controller.text)
                .get();
            return decisions.map((decision) {
              return ListTile(
                title: Text(decision.title),
                subtitle: Text(decision.fullLabel),
                onTap: () {
                  final stmt = db.thesis.update();
                  stmt.where((r) => r.id.equals(thesisId));
                  final companion = ThesisCompanion(
                    councilDecisionId: Value(decision.id),
                  );
                  stmt.write(companion);
                  controller.closeView("");
                },
              );
            }).toList();
          },
        ),
      ],
    );
  }
}

class _InformationSection extends ConsumerWidget {
  final int thesisId;
  const _InformationSection({required this.thesisId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(ThesisViewModel.providerById(thesisId));
    switch (modelAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError():
        return Text('Error loading thesis information');
      default:
    }

    final model = modelAsync.value!;
    final thesis = model.thesis;
    final notifier = ref.read(thesisByIdProvider(thesisId).notifier);

    return CardSection(
      title: 'Thông tin luận văn',
      children: [
        StringTile(
          title: 'Tên đề tài (Việt)',
          initialValue: thesis.vietnameseTitle,
          onUpdate: (value) => notifier.updateInfo(vietnameseTitle: value),
        ),
        StringTile(
          title: 'Tên đề tài (Anh)',
          initialValue: thesis.englishTitle,
          onUpdate: (value) => notifier.updateInfo(englishTitle: value),
        ),
      ],
    );
  }
}

class _TeachingAssignmentSection extends ConsumerWidget {
  final int thesisId;
  const _TeachingAssignmentSection({required this.thesisId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(ThesisViewModel.providerById(thesisId));
    switch (modelAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError():
        return Text('Error loading thesis information');
      default:
    }

    final model = modelAsync.value!;
    final student = model.student;
    final supervisor = model.supervisor;
    final secondarySupervisor = model.secondarySupervisor;
    final notifier = ref.read(thesisByIdProvider(thesisId).notifier);

    Future<List<Widget>> Function(BuildContext, SearchController)
    teacherSuggestionBuilder(bool firstSupervisor) {
      return (BuildContext context, SearchController controller) async {
        final db = await ref.read(mainDatabaseProvider.future);
        final teachers = await db
            .searchTeachers(
              searchText: controller.text,
              isOutsider: firstSupervisor ? false : null,
            )
            .get();

        return teachers.map((teacher) {
          final subtitle = [
            "Cơ quan: ${teacher.university}",
            "Email: ${teacher.workEmail ?? teacher.personalEmail ?? 'No email'}",
          ].join("\n");
          return ListTile(
            title: Text(teacher.name),
            subtitle: Text(subtitle),
            onTap: () {
              if (firstSupervisor) {
                notifier.updateInfo(supervisorId: teacher.id);
              } else {
                notifier.updateInfo(secondarySupervisorId: teacher.id);
              }
              controller.closeView("");
            },
          );
        }).toList();
      };
    }

    return CardSection(
      title: 'Thông tin luận văn',
      children: [
        StringTile(
          title: 'Học viên',
          initialValue: student?.name ?? "Chưa giao",
          readOnly: true,
        ),

        SearchAnchor(
          suggestionsBuilder: teacherSuggestionBuilder(true),
          builder: (_, controller) => ListTile(
            title: Text('Giảng viên hướng dẫn'),
            subtitle: Text(supervisor.name),
            onTap: () => controller.openView(),
          ),
        ),
        SearchAnchor(
          suggestionsBuilder: teacherSuggestionBuilder(false),
          builder: (context, controller) => ListTile(
            title: Text('Giảng viên hướng dẫn 2'),
            subtitle: Text(secondarySupervisor?.name ?? "Không"),
            onTap: () => controller.openView(),
          ),
        ),
      ],
    );
  }
}

class _CouncilAssignmentSection extends StatelessWidget {
  const _CouncilAssignmentSection({required this.thesisId});

  final int thesisId;

  @override
  Widget build(BuildContext context) {
    return FramedSection.withListTile(
      title: 'Hội đồng bảo vệ',
      children: [
        _AssignmentButton(
          title: "Chủ tịch",
          thesisId: thesisId,
          getter: (model) => model.president,
          callback: (notifier, id) => notifier.assignPresident(id),
        ),
        _AssignmentButton(
          title: "Phản biện 1",
          thesisId: thesisId,
          getter: (model) => model.firstReviewer,
          callback: (notifier, id) => notifier.assignFirstReviewer(id),
        ),
        _AssignmentButton(
          title: "Phản biện 2",
          getter: (model) => model.secondReviewer,
          thesisId: thesisId,
          callback: (notifier, id) => notifier.assignSecondReviewer(id),
        ),
        _AssignmentButton(
          title: "Thư ký",
          thesisId: thesisId,
          callback: (notifier, id) => notifier.assignSecretary(id),
          getter: (model) => model.secretary,
        ),
        _AssignmentButton(
          title: "Ủy viên",
          getter: (model) => model.member,
          thesisId: thesisId,
          callback: (notifier, id) => notifier.assignMember(id),
        ),
      ],
    );
  }
}

class _AssignmentButton extends ConsumerWidget {
  final int thesisId;
  final String title;
  final TeacherData? Function(ThesisViewModel model) getter;
  final void Function(ThesisByIdNotifier notifier, int id) callback;

  const _AssignmentButton({
    required this.thesisId,
    required this.title,
    required this.callback,
    required this.getter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(thesisByIdProvider(thesisId).notifier);
    final modelAsync = ref.watch(ThesisViewModel.providerById(thesisId));
    switch (modelAsync) {
      case AsyncLoading():
        return const Center(child: LinearProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        return Center(child: Text('Error: $error'));
      default:
    }

    final model = modelAsync.value!;
    final teacher = getter(model);

    return SearchAnchor(
      suggestionsBuilder: (context, controller) async {
        final db = await ref.read(mainDatabaseProvider.future);
        final teachers = await db
            .searchTeachers(searchText: controller.text)
            .get();
        return [
          for (final teacher in teachers)
            ListTile(
              title: Text(teacher.name),
              subtitle: Text(
                "Cơ quan: ${teacher.university}\nEmail: ${teacher.workEmail ?? 'No email'}",
              ),
              onTap: () {
                callback(notifier, teacher.id);
                controller.closeView("");
              },
            ),
        ];
      },
      builder: (context, controller) => ListTile(
        title: Text(title),
        subtitle: Text(teacher?.name ?? 'Chưa gán'),
        onTap: () => controller.openView(),
      ),
    );
  }
}
