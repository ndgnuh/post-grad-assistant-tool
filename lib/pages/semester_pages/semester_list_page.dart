import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/business/domain_objects.dart';
import 'package:intl/intl.dart';

import '../course_class_pages/course_class_pages.dart';
import 'semester_pages.dart';

String _toDmy(DateTime date) {
  final formatter = DateFormat('dd/MM/yyyy');
  final formattedDate = formatter.format(date);
  return formattedDate;
}

class _CopyPasta {
  HocKy hocKy;
  BuildContext context;
  _CopyPasta({required this.context, required this.hocKy});

  DateTime get hanNopDiem => hocKy.hanNhapDiem.add(const Duration(days: -7));

  String get ngayMoDangKy => _toDmy(hocKy.moDangKy);
  String get ngayDongDangKy => _toDmy(hocKy.dongDangKy);
  String get ngayBatDauHoc => _toDmy(hocKy.batDauHoc);
  String get ngayKetThucHoc => _toDmy(hocKy.ketThucHoc);
  String get hanNhapDiem => _toDmy(hocKy.hanNhapDiem);
  String get ngayNopDiem => _toDmy(hanNopDiem);
  String get tenDotHoc => hocKy.hocKy;

  void copyToClipboard({
    required String text,
    required String notification,
  }) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(notification)),
    );
  }

  void copyThongBaoDangKyHoc() {
    final text =
        """
Đợt học $tenDotHoc mở đăng ký từ $ngayMoDangKy đến $ngayDongDangKy.
Các bạn nhớ đăng ký học đúng thời gian nhé!""";
    copyToClipboard(
      text: text,
      notification: "Đã sao chép thông báo đăng ký học.",
    );
  }

  void copyThongBaoGiangDay() {
    final text =
        """
Kính gửi các Thầy, các Cô,

Em gửi danh sách lớp của các lớp cao học của đợt học $tenDotHoc kèm với bảng điểm quá trình và bảng điểm cuối kỳ. Các lớp sẽ học từ ngày $ngayBatDauHoc đến $ngayKetThucHoc.

Thầy, cô lưu ý giúp em, trong buổi đầu tiên của học phần thầy, cô cung cấp đề cương chi tiết và kế hoạch học, thi cho lớp, trong đó xác định rõ:

      - Yêu cầu của học phần,
      - Nhiệm vụ của học viên,
      - Đánh giá kết quả trong số kiểm tra giữa kỳ, thi hết học phần,
      - Tài liệu học tập, tham khảo.

Lịch thi do thầy, cô sắp xếp ngay sau khi kết thúc học phần, thời gian thi nằm trong kế hoạch của học kỳ. 

Thầy, Cô cho học viên thi, điền đủ thông tin ngày thi và nộp lại bảng điểm trước ngày $ngayNopDiem giúp em với ạ. Em xin cảm ơn. """;
    copyToClipboard(
      text: text,
      notification: "Đã sao chép thông báo học tập.",
    );
  }

  void copyNhacNhoNopDiem() {
    final text =
        """
Kính gửi các Thầy, các Cô,

Ngày $ngayKetThucHoc là ngày kết thúc của đợt học $tenDotHoc.
Thầy, Cô tổ chức cho học viên thi và gửi hai bảng điểm cho em trước ngày $ngayKetThucHoc ạ.

Khi cho học viên thi, Thầy, Cô điền luôn ngày thi trên bảng điểm giúp em ạ.

Em cảm ơn Thầy, Cô ạ.""";
    copyToClipboard(
      text: text,
      notification: "Đã sao chép nhắc nộp điểm.",
    );
  }
}

class _GotoMenu extends StatelessWidget {
  final HocKy hocKy;

  const _GotoMenu({required this.hocKy});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return MenuAnchor(
      menuChildren: [
        // Đi tới danh sách lớp
        MenuItemButton(
          onPressed: () {
            navigator.pushNamed(
              CourseClassListPage.routeName,
              arguments: hocKy,
            );
          },
          child: const Text('Danh sách lớp'),
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

class _SemesterTile extends ConsumerWidget {
  final String semesterId;

  const _SemesterTile({
    super.key,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final semesterAsync = ref.watch(semesterByIdProvider(semesterId));
    switch (semesterAsync) {
      case AsyncLoading():
        return const ListTile(
          title: Text("Loading..."),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text("Lỗi rồi"),
          subtitle: Text(error.toString()),
        );
      default:
    }

    final semester = semesterAsync.value!;

    final dateFormat = DateFormat('dd/MM/yyyy');
    final registrationOpenDate = dateFormat.format(
      semester.registrationOpenDate,
    );
    final registrationCloseDate = dateFormat.format(
      semester.registrationCloseDate,
    );
    final studyStartDate = dateFormat.format(
      semester.studyStartDate,
    );
    final studyEndDate = dateFormat.format(
      semester.studyEndDate,
    );
    final gradeSubmissionDeadline = dateFormat.format(
      semester.gradeSubmissionDeadline,
    );

    final subtiles = [
      "Đăng ký học: $registrationOpenDate - $registrationCloseDate",
      "Thời gian học: $studyStartDate - $studyEndDate",
      "Hạn nhập điểm: $gradeSubmissionDeadline",
    ];

    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    return ListTile(
      title: Text(semester.semester),
      subtitle: Text(subtiles.join('\n')),
      onTap: () async {
        messenger.showSnackBar(
          SnackBar(content: Text("Chức năng đang được phát triển.")),
        );
        final route = MaterialPageRoute(
          builder: (context) => SemesterDetailsPage(semesterId: semesterId),
        );
        await navigator.push(route);
      },
    );
  }
}

class SemesterListPage extends StatelessWidget {
  static const routeName = '/academic_year/list';
  const SemesterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text("Đợt học"),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  PageAcademicYearCreate.routeName,
                );
              },
            ),
          ],
        ),
      ),
      body: ConstrainedBody(child: _SemesterListView()),
    );
  }
}

class _SemesterListView extends ConsumerWidget {
  Widget _buildAcademicYearList(List<String> semesterIds) {
    return ListView.builder(
      itemCount: semesterIds.length,
      itemBuilder: (context, index) {
        final semesterId = semesterIds[index];
        return _SemesterTile(
          key: ValueKey(semesterId),
          semesterId: semesterId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idsAsync = ref.watch(semesterIdsProvider);
    switch (idsAsync) {
      case AsyncLoading():
        return const Center(
          child: SizedBox.square(
            dimension: 42,
            child: CircularProgressIndicator(),
          ),
        );
      case AsyncError(:final error):
        return Center(child: Text("Error: $error"));
      case AsyncData(:final value):
        return _buildAcademicYearList(value);
    }
  }
}
