import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/business/domain_objects.dart';
import 'package:intl/intl.dart';

import '../course_class_pages/course_class_pages.dart';
import './../../business/pods.dart';
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

class AcademicYearTile extends StatelessWidget {
  final HocKy hocKy;

  const AcademicYearTile({
    super.key,
    required this.hocKy,
  });

  @override
  Widget build(BuildContext context) {
    final moDangKy = _toDmy(hocKy.moDangKy);
    final dongDangKy = _toDmy(hocKy.dongDangKy);
    final batDauHoc = _toDmy(hocKy.batDauHoc);
    final ketThucHoc = _toDmy(hocKy.ketThucHoc);
    final hanNhapDiem = _toDmy(hocKy.hanNhapDiem);

    final subtiles = [
      "Đăng ký học: $moDangKy - $dongDangKy",
      "Thời gian học: $batDauHoc - $ketThucHoc",
      "Hạn nhập điểm: $hanNhapDiem",
    ];

    final navigator = Navigator.of(context);

    return ListTile(
      title: Text(hocKy.hocKy),
      subtitle: Text(subtiles.join('\n')),
      onTap: () async {
        final route = MaterialPageRoute(
          builder: (context) => PageAcademicYearEdit(hocKy: hocKy),
        );
        await navigator.push(route);
      },
    );
  }
}

class PageAcademicYearArgument {
  final HocKy hocKy;
  final ValueChanged<HocKy>? onUpdate;

  PageAcademicYearArgument(this.hocKy, this.onUpdate);
}

class PageAcademicYearEdit extends ConsumerStatefulWidget {
  static const routeName = '/academic_year/edit';
  final HocKy hocKy;

  const PageAcademicYearEdit({
    super.key,
    required this.hocKy,
  });

  factory PageAcademicYearEdit.fromArguments(
    PageAcademicYearArgument args,
  ) {
    return PageAcademicYearEdit(
      hocKy: args.hocKy,
    );
  }

  @override
  ConsumerState<PageAcademicYearEdit> createState() =>
      _PageAcademicYearEditState();
}

class _PageAcademicYearEditState extends ConsumerState<PageAcademicYearEdit> {
  late HocKy academicYear;
  late ValueNotifier<HocKy> notifier;

  @override
  initState() {
    super.initState();
    academicYear = widget.hocKy;
    notifier = ValueNotifier(academicYear);
    notifier.addListener(() {
      // Update the academic year when the notifier changes
      ref.invalidate(academicYearsProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final hocKyName = "Đợt học ${academicYear.hocKy}";

    final copyPasta = _CopyPasta(
      context: context,
      hocKy: academicYear,
    );

    final messenger = ScaffoldMessenger.of(context);
    void copyToClipboard(String text) {
      Clipboard.setData(ClipboardData(text: text));
      messenger.showSnackBar(
        SnackBar(content: Text("Copied: $text")),
      );
    }

    // Information, formatted and stored as variables
    final moDangKy = _toDmy(academicYear.moDangKy);
    final dongDangKy = _toDmy(academicYear.dongDangKy);
    final batDauHoc = _toDmy(academicYear.batDauHoc);
    final ketThucHoc = _toDmy(academicYear.ketThucHoc);
    final hanNhapDiem = _toDmy(academicYear.hanNhapDiem);
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(hocKyName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, academicYear),
          onLongPress: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
        ),
        actions: [
          // Delete button
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Xóa đợt học"),
                  content: Text(
                    "Bạn có chắc muốn xóa đợt học ${academicYear.hocKy}?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text("Hủy"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text("Xóa"),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                await academicYear.delete();
                notifier.value = academicYear;
                navigator.pop();
              }
            },
          ),

          // Copy pastas
          MenuAnchor(
            menuChildren: [
              MenuItemButton(
                onPressed: () => copyPasta.copyThongBaoDangKyHoc(),
                child: const Text("Thông báo đăng ký học"),
              ),
              MenuItemButton(
                onPressed: () => copyPasta.copyThongBaoGiangDay(),
                child: const Text("Thông báo giảng dạy"),
              ),
              MenuItemButton(
                onPressed: () => copyPasta.copyNhacNhoNopDiem(),
                child: const Text("Nhắc nộp điểm"),
              ),
            ],
            builder: (context, controller, child) => IconButton(
              icon: const Icon(Icons.copy),
              onPressed: controller.open,
            ),
          ),

          _GotoMenu(hocKy: academicYear),
        ],
      ),

      // Body
      body: ListView(
        // List tiles with information
        // Tap to edit
        // Long tap to copy
        children: [
          ListTile(
            title: Text("Mở đăng ký học"),
            subtitle: Text(moDangKy),
            trailing: const Icon(Icons.edit),
            onLongPress: () => copyToClipboard(moDangKy),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: academicYear.moDangKy,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn ngày mở đăng ký học",
              );

              final updated = await academicYear.update(
                moDangKy: newDate,
              );

              notifier.value = updated;
              setState(() {
                academicYear = updated;
              });
            },
          ),
          ListTile(
            title: Text("Đóng đăng ký học"),
            subtitle: Text(dongDangKy),
            trailing: const Icon(Icons.edit),
            onLongPress: () => copyToClipboard(dongDangKy),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: academicYear.dongDangKy,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn ngày đóng đăng ký học",
              );

              final updated = await academicYear.update(
                dongDangKy: newDate,
              );

              notifier.value = updated;
              setState(() {
                academicYear = updated;
              });
            },
          ),
          ListTile(
            title: Text("Bắt đầu học"),
            subtitle: Text(batDauHoc),
            trailing: const Icon(Icons.edit),
            onLongPress: () => copyToClipboard(batDauHoc),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: academicYear.batDauHoc,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn ngày bắt đầu học",
              );

              final updated = await academicYear.update(
                batDauHoc: newDate,
              );

              notifier.value = updated;
              setState(() {
                academicYear = updated;
              });
            },
          ),
          ListTile(
            title: Text("Kết thúc học"),
            subtitle: Text(ketThucHoc),
            trailing: const Icon(Icons.edit),
            onLongPress: () => copyToClipboard(ketThucHoc),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: academicYear.ketThucHoc,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn ngày kết thúc học",
              );

              final updated = await academicYear.update(
                ketThucHoc: newDate,
              );

              notifier.value = updated;
              setState(() {
                academicYear = updated;
              });
            },
          ),
          ListTile(
            title: Text("Hạn nhập điểm"),
            subtitle: Text(hanNhapDiem),
            trailing: const Icon(Icons.edit),
            onLongPress: () => copyToClipboard(hanNhapDiem),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: academicYear.hanNhapDiem,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn hạn nhập điểm",
              );

              final updated = await academicYear.update(
                hanNhapDiem: newDate,
              );

              notifier.value = updated;
              setState(() {
                academicYear = updated;
              });
            },
          ),
        ],
      ),
    );
  }
}

class PageAcademicYearList extends StatefulWidget {
  static const routeName = '/academic_year/list';
  const PageAcademicYearList({super.key});

  @override
  State<PageAcademicYearList> createState() => _PageAcademicYearListState();
}

class _PageAcademicYearListState extends State<PageAcademicYearList> {
  late Future<List<HocKy>> _academicYearsFuture;
  late List<HocKy> _academicYears = [];

  @override
  initState() {
    super.initState();
    _academicYearsFuture = HocKy.all();

    _academicYearsFuture.then((years) {
      setState(() {
        _academicYears = years;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text("Đợt học"),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => setState(() {
                _academicYearsFuture = HocKy.all();
              }),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  PageAcademicYearCreate.routeName,
                );
                setState(() {
                  _academicYearsFuture = HocKy.all();
                });
              },
            ),
          ],
        ),
      ),
      body: ConstrainedBody(child: _AcademicYearList()),
    );
  }
}

class _AcademicYearList extends ConsumerWidget {
  Widget _buildAcademicYearList(List<HocKy> academicYears) {
    return ListView.builder(
      itemCount: academicYears.length,
      itemBuilder: (context, index) {
        final academicYear = academicYears[index];
        return AcademicYearTile(hocKy: academicYear);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(academicYearsProvider);
    return switch (future) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error) => Text("Error: $error"),
      AsyncData(:final value) => _buildAcademicYearList(value),
    };
  }
}
