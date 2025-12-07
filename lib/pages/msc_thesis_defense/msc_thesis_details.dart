import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/business/view_models.dart';
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
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text('Thông tin luận văn'),
        ),
      ),
      body: ConstrainedBody(
        child: _AssignCouncilTab(thesisId: thesisId),
      ),
    );
  }
}

class _GeneralInformationTab extends StatelessWidget {
  final int thesisId;

  const _GeneralInformationTab({required this.thesisId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('General Information for Thesis ID: $thesisId'),
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
        children: [
          _InformationSection(thesisId: thesisId),
          _AssignmentSection(thesisId: thesisId),
        ],
      ),
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
    final student = model.student;
    final thesis = model.thesis;
    final supervisor = model.supervisor;

    return CardSection(
      title: 'Thông tin luận văn',
      children: [
        ListTile(
          title: Text('Học viên'),
          subtitle: Text(student?.name ?? "Chưa giao"),
        ),
        ListTile(
          title: Text('Giảng viên hướng dẫn'),
          subtitle: Text(supervisor.name),
        ),
        ListTile(
          title: Text('Luận văn'),
          subtitle: Text(thesis.vietnameseTitle),
        ),
      ],
    );
  }
}

class _AssignmentSection extends StatelessWidget {
  const _AssignmentSection({required this.thesisId});

  final int thesisId;

  @override
  Widget build(BuildContext context) {
    return CardSection(
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
