import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

import '../../business/copy_pasta.dart' show Email, EmailCopyDialog;
import '../../business/db_v1_providers.dart';
import '../../business/db_v2_providers.dart' hide thesisByIdProvider;
import '../../business/domain_objects.dart';
import '../../custom_widgets.dart';
import '../thesis_pages/thesis_pages.dart';
import './council.dart' as council;
import './index.dart';
import './pods.dart';

typedef Supervisor = GiangVien;
typedef Thesis = DeTaiThacSi;
typedef ThesisDefenseRegisterPageState = _State;

class ActionDialog extends ConsumerWidget {
  final Thesis thesis;
  const ActionDialog({super.key, required this.thesis});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = _ThesisItemActions(
      context: context,
      thesis: thesis,
      ref: ref,
    );
    return MenuDialog(
      items: [
        MenuDialogItem(
          onTap: () => actions.goToDetailPage(),
          title: "Xem chi tiết",
        ),
        MenuDialogItem(
          onTap: actions.arrangeCouncil,
          title: "Xếp hội đồng",
        ),
        MenuDialogItem(
          onTap: actions.untrack,
          title: "Hoàn thành",
        ),
      ],
    );
  }

  static void show(BuildContext context, Thesis thesis) async {
    showDialog(
      context: context,
      builder: (context) => ActionDialog(thesis: thesis),
    );
  }
}

class ThesisDefenseRegisterPage extends StatelessWidget {
  static const routeName = "/thesis/defense/register";
  const ThesisDefenseRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _State(),
      builder: (context, child) {
        final screenSize = MediaQuery.of(context).size;
        final isLargeScreen = screenSize.width > 600;

        return Scaffold(
          appBar: AppBar(title: const Text('Đăng ký bảo vệ')),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(context.gutter),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: context.gutter,
                children: [
                  if (isLargeScreen)
                    IntrinsicHeight(
                      child: Row(
                        spacing: context.gutter,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Expanded(child: _AddThesisToTrackingButton()),
                          const Expanded(child: _PageActionButton()),
                        ],
                      ),
                    ),
                  if (isLargeScreen) Expanded(child: _ThesesTableView()),
                  if (!isLargeScreen) Expanded(child: _TrackedThesesListView()),
                  if (!isLargeScreen) const _AddThesisToTrackingButton(),
                  if (!isLargeScreen) const _PageActionButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AddThesisToTrackingButton extends ConsumerWidget {
  const _AddThesisToTrackingButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton.icon(
      onPressed: () => selectThesisToTrack(context, ref),
      icon: const Icon(Icons.add),
      label: const Text('Thêm đề tài để theo dõi'),
    );
  }

  // TODO: implement another search
  Future<void> selectThesisToTrack(BuildContext context, WidgetRef ref) async {}
  // Future<void> selectThesisToTrack(BuildContext context, WidgetRef ref) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => PageSelectThings<Thesis>(
  //         title: "Chọn đề tài",
  //         includeNull: false,
  //         itemBuilder: <T>(BuildContext context, Thesis? item) {
  //           if (item == null) return SizedBox.shrink();
  //
  //           final student = item.hocVien!;
  //
  //           return ListTile(
  //             title: Text(item.tenTiengViet),
  //             subtitle: Text("${student.maHocVien} ${student.hoTen}"),
  //             onTap: () async {
  //               final provider = ref.read(trackedThesisIdsProvider.notifier);
  //               provider.track(item.id!);
  //               ref.invalidate(trackedThesisIdsProvider);
  //               Navigator.pop(context);
  //             },
  //           );
  //         },
  //         searchFunction: <T>(query) =>
  //             Thesis.search(searchQuery: query, assigned: true, tracked: false),
  //       ),
  //     ),
  //   );
  // }
}

class _CouncilMemberItem extends ConsumerWidget {
  final int thesisId;
  final CouncilRole role;
  const _CouncilMemberItem({required this.thesisId, required this.role});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberState = switch (role) {
      CouncilRole.president => ref.watch(thesisPresidentProvider(thesisId)),
      CouncilRole.reviewer1 => ref.watch(thesisReviewer1Provider(thesisId)),
      CouncilRole.reviewer2 => ref.watch(thesisReviewer2Provider(thesisId)),
      CouncilRole.secretary => ref.watch(thesisSecretaryProvider(thesisId)),
      CouncilRole.member => ref.watch(thesisMemberProvider(thesisId)),
    };

    final notifier = switch (role) {
      CouncilRole.president => ref.read(
        thesisPresidentProvider(thesisId).notifier,
      ),
      CouncilRole.reviewer1 => ref.read(
        thesisReviewer1Provider(thesisId).notifier,
      ),
      CouncilRole.reviewer2 => ref.read(
        thesisReviewer2Provider(thesisId).notifier,
      ),
      CouncilRole.secretary => ref.read(
        thesisSecretaryProvider(thesisId).notifier,
      ),
      CouncilRole.member => ref.read(thesisMemberProvider(thesisId).notifier),
    };

    switch (memberState) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error):
        return Text('Lỗi tải giảng viên: $error');
      default:
    }

    final teacher = memberState.value;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (teacher != null)
          IconButton(
            icon: Icon(Icons.clear, color: Theme.of(context).colorScheme.error),
            onPressed: () => notifier.unassign(),
          ),
        SearchAnchor(
          suggestionsBuilder: (context, controller) async {
            final db = await ref.read(appDatabaseProvider.future);
            final teachers = await db
                .searchTeacher(searchText: controller.text)
                .get();

            return [
              for (final teacher in teachers)
                ListTile(
                  title: Text(teacher.name),
                  subtitle: Text(teacher.department ?? ''),
                  onTap: () async {
                    controller.closeView("");
                    await notifier.assign(teacher.id);
                  },
                ),
            ];
          },
          builder: (context, controller) => InkWell(
            onTap: () => controller.openView(),
            child: Text(
              teacher?.name ?? 'Chọn',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PageAction {
  final BuildContext context;
  const _PageAction(this.context);

  Email get teachingLoadCalculationEmail {
    final state = context.read<_State>();
    final theses = state.trackedTheses;

    // recipients
    final emails = <String>{};
    for (final thesis in theses) {
      final supervisor = thesis.giangVien;
      if (supervisor.email != null && supervisor.email!.isNotEmpty) {
        emails.add(supervisor.email!);
      }
    }

    // student list
    final studentList = theses
        .map((thesis) {
          final student = thesis.hocVien!;
          return "- ${student.hoTen} ${student.maHocVien}";
        })
        .join('\n');

    return Email(
      recipients: emails,
      subject: "Tính toán khối lượng giảng dạy cho luận văn cao học",
      body:
          """Kính gửi các Thầy, các Cô hướng dẫn luận văn cao học,

Em gửi danh sách học viên cao học được Thầy, Cô hướng dẫn và bảo vệ thành công luận văn thạc sĩ trong đợt bảo vệ vừa qua:
$studentList

Thầy, Cô vui lòng chọn "kỳ kết thúc" và "kỳ tính GD" trên QLĐT vào kỳ <FILL ME> cho đề tài mà mình hướng dẫn. Em cảm ơn Thầy, Cô ạ.""",
    );
  }

  Future<void> copyTeacherCalculationEmails() async {
    await showDialog(
      context: context,
      builder: (context) => EmailCopyDialog(
        email: teachingLoadCalculationEmail,
      ),
    );
  }

  Future<void> goToThesisDefensePaymentPage() async {
    final route = MaterialPageRoute(
      builder: (context) => ThesisDefensePaymentPage(),
    );

    final navigator = Navigator.of(context);
    await navigator.push(route);
  }

  /// Show a dialog to dispatch actions
  Future<void> showActionDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return MenuDialog(
          items: [
            MenuDialogItem(
              icon: Icons.email,
              title: "Sao chép email giảng viên",
              onTap: () async {
                final state = context.read<_State>();
                await state.copySupervisorEmails();
              },
            ),
            MenuDialogItem(
              icon: Icons.attach_money,
              title: "Làm bảng thanh toán",
              subtitle: "Thanh toán tiền ngồi hội đồng",
              onTap: () => goToThesisDefensePaymentPage(),
            ),
            MenuDialogItem(
              icon: Icons.email_outlined,
              title: "Gửi email tính GD",
              subtitle: "Sau khi hoàn thành",
              onTap: () => copyTeacherCalculationEmails(),
            ),
          ],
        );
      },
    );
  }
}

class _PageActionButton extends StatelessWidget {
  const _PageActionButton();

  @override
  Widget build(BuildContext context) {
    final action = _PageAction(context);
    return FilledButton(
      child: const Text("Hành động"),
      onPressed: () => action.showActionDialog(),
    );
  }
}

class _State extends ChangeNotifier {
  final searchController = SearchController();

  List<Thesis> trackedTheses = [];

  _State() {
    refresh();
  }

  Future<void> copySupervisorEmails() async {
    // final emails = trackedTheses
    //     .map((thesis) => thesis.giangVien.email)
    //     .whereType<String>()
    //     .join('\n');

    // TODO: replace Get
    // if (emails.isNotEmpty) {
    //   Clipboard.setData(ClipboardData(text: emails));
    //   Get.snackbar(
    //     "Đã sao chép",
    //     "Địa chỉ email của giảng viên đã được sao chép.",
    //   );
    // } else {
    //   Get.snackbar("Không có email", "Không có địa chỉ email nào để sao chép.");
    // }
  }

  Future<void> refresh() async {
    final futureTheses = Thesis.search(assigned: true, tracked: true);
    trackedTheses = await futureTheses;
    notifyListeners();
  }
}

class _ThesesTableView extends ConsumerWidget {
  const _ThesesTableView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelState = ref.watch(trackedThesesViewModelsProvider);

    switch (modelState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text("Lỗi khi tải đề tài $error"));
      default:
    }

    final thesisViewModels = modelState.value!;
    return ExpandedScrollView(
      child: DataTable(
        columnSpacing: context.gutter,
        columns: const [
          DataColumn(label: Expanded(child: Text('GVHD'))),
          DataColumn(label: Expanded(child: Text('Học viên'))),
          DataColumn(label: Expanded(child: Text('SHHV'))),
          DataColumn(label: Expanded(child: Text('Chủ tịch'))),
          DataColumn(label: Expanded(child: Text('Phản biện 1'))),
          DataColumn(label: Expanded(child: Text('Phản biện 2'))),
          DataColumn(label: Expanded(child: Text('Thư ký'))),
          DataColumn(label: Expanded(child: Text('Ủy viên'))),
          DataColumn(label: Expanded(child: Text(''))),
        ],
        rows: thesisViewModels.map((model) {
          final student = model.student!;
          final supervisor = model.supervisor;
          final president = model.president;
          final reviewer1 = model.reviewer1;
          final reviewer2 = model.reviewer2;
          final secretary = model.secretary;
          final member = model.member;

          // Future<void> assignMember(int teacherId) async {
          //   final notifier = await ref.read(
          //     thesisViewModelByIdProvider(model.thesis.id!).future,
          //   );
          //   await notifier.assignMember(model.thesis.id!);
          // }

          return DataRow(
            cells: [
              DataCell(Text(supervisor.hoTenChucDanh)),
              DataCell(Text(student.hoTen)),
              DataCell(Text(student.maHocVien ?? "")),
              DataCell(
                _CouncilMemberItem(
                  thesisId: model.thesis.id!,
                  role: CouncilRole.president,
                ),
              ),
              DataCell(
                _CouncilMemberItem(
                  thesisId: model.thesis.id!,
                  role: CouncilRole.reviewer1,
                ),
              ),
              DataCell(
                _CouncilMemberItem(
                  thesisId: model.thesis.id!,
                  role: CouncilRole.reviewer2,
                ),
              ),
              DataCell(
                _CouncilMemberItem(
                  thesisId: model.thesis.id!,
                  role: CouncilRole.secretary,
                ),
              ),
              DataCell(
                _CouncilMemberItem(
                  thesisId: model.thesis.id!,
                  role: CouncilRole.member,
                ),
              ),
              DataCell(
                TextButton.icon(
                  icon: Icon(Icons.clear),
                  label: Text('Xóa'),
                  onPressed: () {
                    ref
                        .read(trackedThesisIdsProvider.notifier)
                        .untrack(model.thesis.id!);
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _ThesisCard extends ConsumerWidget {
  static const width = 600.0;
  static const height = 300.0;
  final int thesisId;

  const _ThesisCard({required this.thesisId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thesisState = ref.watch(thesisByIdProvider(thesisId));
    return thesisState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          Center(child: Text("Lỗi khi tải đề tài: $error")),
      data: (thesis) => Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(context.gutterSmall),
          onTap: () => ActionDialog.show(context, thesis),
          child: Padding(
            padding: EdgeInsets.all(context.gutter),
            child: ListTile(
              title: Text(
                "${thesis.hocVien!.maHocVien} ${thesis.hocVien!.hoTen}",
              ),
              subtitle: Text(thesis.tenTiengViet),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThesisItemActions {
  final BuildContext context;
  final WidgetRef ref;
  final Thesis thesis;
  const _ThesisItemActions({
    required this.context,
    required this.thesis,
    required this.ref,
  });

  NavigatorState get navigator => Navigator.of(context);
  _State get state => context.read<_State>();

  void arrangeCouncil() async {
    await navigator.push(
      MaterialPageRoute(
        builder: (context) =>
            council.ThesisDefenseCouncilPage(thesisId: thesis.id!),
      ),
    );
    await state.refresh();
  }

  void goToDetailPage() async {
    final route = MaterialPageRoute(
      builder: (context) => ThesisDetailPage(thesis: thesis),
    );
    await navigator.push(route);
    await state.refresh();
  }

  void untrack() async {
    final provider = ref.read(trackedThesisIdsProvider.notifier);
    provider.untrack(thesis.id!);
  }
}

class _TrackedThesesListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thesisIdsState = ref.watch(trackedThesisIdsProvider);

    switch (thesisIdsState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text("Lỗi khi tải đề tài $error"));
      case AsyncData(:final List<int> value):
        return _build(context, value);
    }
  }

  Widget _build(BuildContext context, List<int> thesisIds) {
    // final totalWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: _ThesisCard.width,
      //   mainAxisExtent: _ThesisCard.height,
      //   childAspectRatio: _ThesisCard.width / _ThesisCard.height,
      //   mainAxisSpacing: context.gutterSmall,
      //   crossAxisSpacing: context.gutterSmall,
      // ),
      // padding: EdgeInsets.all(context.gutter),
      itemCount: thesisIds.length,
      itemBuilder: (context, index) {
        final thesisId = thesisIds[index];
        return _ThesisCard(thesisId: thesisId);
      },
    );
  }
}
