import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:provider/provider.dart' hide FutureProvider;
import 'package:path/path.dart' as path;
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../teachers/index.dart';
import '../../business/domain_objects.dart';
import '../../custom_widgets.dart' show DirectoryPicker;
import '../../services/pdf_builder/index.dart' as _;
import '../../pages/theses/index.dart' show ThesisDetailPage;
import './payment_pdf.dart';
import './pods.dart';
import './index.dart';

Future<Map<Teacher, Payout>> resolvePayouts(List<Thesis> theses) async {
  final teachers = <Teacher>{};
  final timesPresident = <Teacher, int>{};
  final timesSecretary = <Teacher, int>{};
  final timesReviewer = <Teacher, int>{};
  final timesMember = <Teacher, int>{};

  for (final thesis in theses) {
    final president = (await thesis.chuTich)!;
    timesPresident[president] = (timesPresident[president] ?? 0) + 1;
    teachers.add(president);

    final secretary = (await thesis.thuKy)!;
    timesSecretary[secretary] = (timesSecretary[secretary] ?? 0) + 1;
    teachers.add(secretary);

    final reviewer1 = (await thesis.phanBien1)!;
    timesReviewer[reviewer1] = (timesReviewer[reviewer1] ?? 0) + 1;
    teachers.add(reviewer1);

    final reviewer2 = (await thesis.phanBien2)!;
    timesReviewer[reviewer2] = (timesReviewer[reviewer2] ?? 0) + 1;
    teachers.add(reviewer2);

    final member = (await thesis.uyVien)!;
    timesMember[member] = (timesMember[member] ?? 0) + 1;
    teachers.add(member);
  }

  final payouts = <Teacher, Payout>{};
  final teachersList = teachers.toList()
    ..sort((a, b) {
      final isForeignA = a.isForeign;
      final isForeignB = b.isForeign;
      if (isForeignA != isForeignB) {
        return isForeignA ? 1 : -1; // Foreign teachers come last
      }

      // If both are foreign or both are local, sort by name
      final aFirstName = a.hoTen.split(" ").last;
      final bFirstName = b.hoTen.split(" ").last;
      return aFirstName.compareTo(bFirstName);
    });

  for (final teacher in teachersList) {
    payouts[teacher] = Payout(
      teacher: teacher,
      timesPresident: timesPresident[teacher] ?? 0,
      timesSecretary: timesSecretary[teacher] ?? 0,
      timesReviewer: timesReviewer[teacher] ?? 0,
      timesMember: timesMember[teacher] ?? 0,
    );
  }

  return payouts;
}

class Payout {
  final Teacher teacher;
  final int timesPresident;
  final int timesSecretary;
  final int timesReviewer;
  final int timesMember;

  const Payout({
    required this.teacher,
    this.timesPresident = 0,
    this.timesSecretary = 0,
    this.timesReviewer = 0,
    this.timesMember = 0,
  });
  int get moneyMember => timesMember * 300_000;
  String get moneyMemberFormatted => "$timesMember x 300.000đ = $moneyMember";

  /// Money for each role
  int get moneyPresident => timesPresident * 400_000;

  /// Formatted strings for display
  String get moneyPresidentFormatted =>
      "$timesPresident x 400.000đ = $moneyPresident";

  int get moneyReviewer => timesReviewer * 1_050_000;
  String get moneyReviewerFormatted =>
      "$timesReviewer x 400.000đ = $moneyReviewer";
  int get moneySecretary => timesSecretary * 400_000;
  String get moneySecretaryFormatted =>
      "$timesSecretary x 400.000đ = $moneyPresident";
  int get moneyTotal =>
      moneyPresident + moneySecretary + moneyReviewer + moneyMember;

  String get moneyTotalFormatted => "$moneyTotal đ";

  /// Summary line for display
  List<String> get summaryLine {
    final tax = teacher.isForeign ? 0 : (0.1 * moneyTotal).round();
    final remain = moneyTotal - tax;
    return [
      teacher.hoTen,
      // moneyTotal.formatMoney(),
      moneyTotal.toString(),
      tax.toString(),
      remain.toString(),
      teacher.stk?.toString() ?? "",
      teacher.nganHang?.toString() ?? "",
      teacher.mst?.toString() ?? "",
    ];
  }
}

class ThesisDefensePaymentPage extends StatelessWidget {
  static const routeName = '/thesis-defense/payment';
  const ThesisDefensePaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final largeScreen = totalWidth > 800;

    return ChangeNotifierProvider(
      create: (_) => _State(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text('Thanh toán luận văn'),
        ),
        body: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: context.gutter,
            children: [
              if (largeScreen)
                IntrinsicHeight(
                  child: Row(
                    spacing: context.gutter,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacer(),
                      _ButtonExportAll(),
                    ],
                  ),
                ),
              Expanded(
                child: _PaymentSteps(),
              ),
              if (!largeScreen) _ButtonExportAll(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final saveDirectoryController = context.select(
      (_State state) => state.saveDirectoryController,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.gutter),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: context.gutter,
          children: [
            TextField(
              controller: context.select(
                (_State state) => state.paymentReasonController,
              ),
              decoration: InputDecoration(
                labelText: "Lý do thanh toán",
                hintText: "Hội đồng chấm luận văn thạc sĩ tháng ... năm ...",
              ),
            ),
            DirectoryPicker(
              name: "thesis-payment-paperwork-save-folder",
              controller: saveDirectoryController,
              labelText: "Thư mục lưu giấy tờ thanh toán",
            ),
            RichText(
              text: TextSpan(
                text: 'Bộ hồ sơ thanh toán:',
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(text: "\n"),
                  TextSpan(text: "- Quyết định thành lập hội đồng"),
                  TextSpan(text: "\n"),
                  TextSpan(text: "- Bảng ký nhận thanh toán"),
                  TextSpan(text: "\n"),
                  TextSpan(text: "- Phiếu đề nghị thanh toán"),
                  TextSpan(text: "\n"),
                  TextSpan(text: "- Bảng tổng hợp thu nhập CB trong trường"),
                  TextSpan(text: "\n"),
                  TextSpan(text: "- Bảng kê thanh toán (6449/6756)"),
                  TextSpan(text: "\n"),
                  TextSpan(text: "- Bảng tổng hợp thanh toán"),
                ],
              ),
            ),
            _ButtonExportAll(),
          ],
        ),
      ),
    );
  }
}

class _ButtonExportAll extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = _Actions(context, ref);

    final viewModelState = ref.watch(paymentViewModelProvider);
    switch (viewModelState) {
      case AsyncLoading _:
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Lỗi tải dữ liệu: $error'));
      case AsyncData(:final value):
        return FilledButton(
          onPressed: () => actions.exportAllPaperwork(),
          child: Text('Lưu giấy tờ thanh toán'),
        );
    }
  }
}

class _CouncilTable extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Wait for theses ids to be loaded
    final idsState = ref.watch(trackedThesisIdsProvider);

    switch (idsState) {
      case AsyncLoading _:
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Lỗi tải dữ liệu: $error'));
      default:
    }

    final ids = idsState.value!;
    final thesesState = ref.watch(thesesByIdsProvider(ids));
    switch (thesesState) {
      case AsyncLoading _:
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Center(child: Text('Lỗi tải dữ liệu: $error'));
      default:
    }

    final theses = thesesState.value!;
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraint.maxWidth,
            ),
            child: DataTable(
              columns: [
                DataColumn(label: Text('Học viên')),
                DataColumn(label: Text('Mã học viên')),
                DataColumn(label: Text('Ngày bảo vệ')),
                DataColumn(label: Text('Chủ tịch')),
                DataColumn(label: Text('Phản biện 1')),
                DataColumn(label: Text('Phản biện 2')),
                DataColumn(label: Text('Thư ký')),
                DataColumn(label: Text('Ủy viên')),
              ],
              rows: [
                for (final thesis in theses) makeRow(context, thesis, ref),
              ],
            ),
          ),
        );
      },
    );
  }

  DataRow makeRow(BuildContext context, Thesis thesis, WidgetRef ref) {
    final student = thesis.hocVien!;
    final supervisor = thesis.giangVien;
    final president = thesis.chuTich.then((value) => value?.hoTen ?? "");
    final secretary = thesis.thuKy.then((value) => value?.hoTen ?? "");
    final reviewer1 = thesis.phanBien1.then((value) => value?.hoTen ?? "");
    final reviewer2 = thesis.phanBien2.then((value) => value?.hoTen ?? "");
    final member = thesis.uyVien.then((value) => value?.hoTen ?? "");
    final dateFmt = DateFormat('dd/MM/yyyy');
    final defenseDate = switch (thesis.ngayBaoVe) {
      DateTime date => dateFmt.format(date),
      null => "!",
    };

    void goToDetails() async {
      final route = MaterialPageRoute(
        builder: (context) => ThesisDetailPage(thesis: thesis),
      );
      await Navigator.push(context, route);

      // TODO: make this provider depends on the teacherByIdProvider,
      // so that in automatically rebuilds
      ref.invalidate(paymentViewModelProvider);
    }

    void goToCouncilPage() {
      final route = MaterialPageRoute(
        builder: (context) => ThesisDefenseCouncilPage(thesisId: thesis.id!),
      );
      Navigator.push(context, route);
    }

    Widget withInkWell(child) {
      return InkWell(
        onTap: goToCouncilPage,
        child: child,
      );
    }

    return DataRow(
      key: ValueKey(thesis.id),
      cells: [
        DataCell(
          InkWell(
            onTap: goToDetails,
            child: Text(student.hoTen),
          ),
        ),
        DataCell(Text(student.maHocVien ?? "")),
        DataCell(Text(defenseDate)),
        // DataCell(Text(supervisor.hoTen)),
        DataCell(withInkWell(_FutureString(future: president))),
        DataCell(withInkWell(_FutureString(future: reviewer1))),
        DataCell(withInkWell(_FutureString(future: reviewer2))),
        DataCell(withInkWell(_FutureString(future: secretary))),
        DataCell(withInkWell(_FutureString(future: member))),
      ],
    );
  }
}

class _FutureString extends StatefulWidget {
  final Future<String> future;

  const _FutureString({required this.future});

  @override
  State<_FutureString> createState() => _FutureStringState();
}

class _FutureStringState extends State<_FutureString> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: widget.future,
      builder: (context, snapshot) {
        return Text(snapshot.data.toString());
      },
    );
  }
}

class _PaymentSteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stepNotifier = context.select(
      (_State state) => state.stepNotifier,
    );
    return ValueListenableBuilder(
      valueListenable: stepNotifier,
      builder: (context, step, child) {
        return Stepper(
          onStepContinue: () => stepNotifier.value = step + 1,
          onStepCancel: () => stepNotifier.value = step - 1,
          onStepTapped: (newStep) => stepNotifier.value = newStep,
          currentStep: step,
          controlsBuilder: (context, details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: context.gutter,
              children: [
                if (step < 2)
                  FilledButton(
                    onPressed: details.onStepContinue,
                    child: Text('Tiếp tục'),
                  ),
                if (step > 0)
                  OutlinedButton(
                    onPressed: details.onStepCancel,
                    child: Text('Quay lại'),
                  ),
              ],
            );
          },
          steps: [
            Step(
              title: Text("Danh sách hội đồng"),
              content: _CouncilTable(),
            ),
            Step(
              title: Text("Thanh toán"),
              content: _PaymentTable(),
            ),
            Step(
              title: Text("Thao tác"),
              content: _ActionView(),
              state: StepState.complete,
            ),
          ],
        );
      },
    );
  }
}

class _PaymentTable extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelState = ref.watch(paymentViewModelProvider);

    switch (viewModelState) {
      case AsyncLoading():
        return CircularProgressIndicator();
      case AsyncError(:final error):
        return Center(child: Text("Error $error"));
      default:
    }

    final viewModel = viewModelState.value!;
    final payPerTeachers = viewModel.payoutPerTeacher;
    final totalVnd = viewModel.totalBeforeTax.formatMoney();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.gutter),
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraint.maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: context.gutter,
                children: [
                  DataTable(
                    showBottomBorder: true,
                    columns: [
                      DataColumn(label: Expanded(child: Text('Giảng viên'))),
                      DataColumn(label: Expanded(child: Text('Chức danh'))),
                      DataColumn(label: Expanded(child: Text('Mã CB'))),
                      DataColumn(label: Expanded(child: Text('STK'))),
                      DataColumn(label: Expanded(child: Text('Ngân hàng'))),
                      DataColumn(label: Expanded(child: Text('MST'))),
                      DataColumn(label: Expanded(child: Text('Ngoài trường'))),
                      DataColumn(label: Expanded(child: Text('# Chủ tịch'))),
                      DataColumn(label: Expanded(child: Text('# Thư ký'))),
                      DataColumn(label: Expanded(child: Text('# Phản biện'))),
                      DataColumn(label: Expanded(child: Text('# Ủy viên'))),
                      DataColumn(label: Expanded(child: Text('# Tổng tiền'))),
                    ],
                    rows: payPerTeachers.entries.map((entry) {
                      final teacher = entry.key;
                      final payout = entry.value;
                      return DataRow(
                        key: ValueKey(teacher.id),
                        cells: [
                          DataCell(
                            _TeacherLink(teacher: teacher),
                          ),
                          DataCell(Text(teacher.chucDanh)),
                          DataCell(Text(teacher.maCanBo ?? "")),
                          DataCell(Text(teacher.stk ?? "")),
                          DataCell(Text(teacher.nganHang ?? "")),
                          DataCell(Text(teacher.cccd ?? "")),
                          DataCell(
                            Icon(teacher.isForeign ? Icons.check : Icons.close),
                          ),
                          DataCell(Text(payout.moneyPresidentFormatted)),
                          DataCell(Text(payout.moneySecretaryFormatted)),
                          DataCell(Text(payout.moneyReviewerFormatted)),
                          DataCell(Text(payout.moneyMemberFormatted)),
                          DataCell(Text('${payout.moneyTotal} đ')),
                        ],
                      );
                    }).toList(),
                  ),
                  Text(
                    "Tổng cộng: $totalVndđ",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TeacherLink extends ConsumerWidget {
  const _TeacherLink({required this.teacher});

  final Teacher teacher;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ColorScheme.of(context);
    final focusedNotifier = ValueNotifier<bool>(false);
    return InkWell(
      onHover: (hovering) {
        focusedNotifier.value = hovering;
      },
      onTap: () async {
        final route = MaterialPageRoute(
          builder: (context) => TeacherDetailsPage(id: teacher.id),
        );
        await Navigator.push(context, route);
        ref.invalidate(paymentViewModelProvider);
      },
      child: ValueListenableBuilder(
        valueListenable: focusedNotifier,
        builder: (context, value, child) {
          final style = value == true
              ? TextStyle(color: colorScheme.primary)
              : null;
          return Text(teacher.hoTen, style: style);
        },
      ),
    );
  }
}

class _State extends ChangeNotifier {
  final ValueNotifier<int> stepNotifier = ValueNotifier(0);
  final paymentReasonController = TextEditingController(
    text: "Hội đồng chấm luận văn thạc sĩ",
  );
  final saveDirectoryController = TextEditingController();
  ThesisPaymentPdfModel? paymentViewModel;
  Map<Teacher, Payout> payouts = {};

  int get totalMoney {
    return payouts.values.fold(0, (sum, payout) => sum + payout.moneyTotal);
  }

  String get totalVnd => totalMoney.formatMoney();

  Future<void> refresh() async {
    notifyListeners();
  }
}

@immutable
class _Actions {
  final BuildContext context;
  final WidgetRef ref;
  const _Actions(this.context, this.ref);

  Future<void> exportAllPaperwork() async {
    final state = context.read<_State>();
    final messenger = ScaffoldMessenger.of(context);
    final saveDir = state.saveDirectoryController.text;

    final summaryName = "TongHop_ThanhToan.pdf";
    final requestName = "YeuCau_ThanhToan.pdf";
    final listingName = "BangKe_ThanhToan.pdf";
    final incomeListingName = "BangKe_ThuNhap.pdf";
    final doubleCheckName = "KiemTra_ThanhToan.pdf";

    final summaryPdf = await ref.watch(paymentSummaryPdfProvider.future);
    File(path.join(saveDir, summaryName)).writeAsBytes(summaryPdf);
    final requestPdf = await ref.watch(paymentRequestPdfProvider.future);
    File(path.join(saveDir, requestName)).writeAsBytes(requestPdf);
    final listingPdf = await ref.watch(paymentListingPdfProvider.future);
    File(path.join(saveDir, listingName)).writeAsBytes(listingPdf);
    final incomeListingPdf = await ref.watch(incomeListingPdfProvider.future);
    File(path.join(saveDir, incomeListingName)).writeAsBytes(incomeListingPdf);
    final doubleCheckPdf = await ref.watch(doubleCheckPdfProvider.future);
    File(path.join(saveDir, doubleCheckName)).writeAsBytes(doubleCheckPdf);

    messenger.showSnackBar(
      SnackBar(content: Text("Đang xuất giấy tờ...")),
    );
  }
}
