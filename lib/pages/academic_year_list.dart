import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/business/domain_objects.dart';
import 'package:intl/intl.dart';

import './mobile/course_classes.dart' show PageCourseClassList;
import './../../business/pods.dart';

String toDmy(DateTime date) {
  final formatter = DateFormat('dd/MM/yyyy');
  final formattedDate = formatter.format(date);
  return formattedDate;
}

class CopyPasta {
  HocKy hocKy;
  BuildContext context;
  CopyPasta({required this.context, required this.hocKy});

  DateTime get hanNopDiem => hocKy.hanNhapDiem.add(const Duration(days: -7));

  String get ngayMoDangKy => toDmy(hocKy.moDangKy);
  String get ngayDongDangKy => toDmy(hocKy.dongDangKy);
  String get ngayBatDauHoc => toDmy(hocKy.batDauHoc);
  String get ngayKetThucHoc => toDmy(hocKy.ketThucHoc);
  String get hanNhapDiem => toDmy(hocKy.hanNhapDiem);
  String get ngayNopDiem => toDmy(hanNopDiem);
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

  const _GotoMenu({super.key, required this.hocKy});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return MenuAnchor(
      menuChildren: [
        // Đi tới danh sách lớp
        MenuItemButton(
          onPressed: () {
            navigator.pushNamed(
              PageCourseClassList.routeName,
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
    final moDangKy = toDmy(hocKy.moDangKy);
    final dongDangKy = toDmy(hocKy.dongDangKy);
    final batDauHoc = toDmy(hocKy.batDauHoc);
    final ketThucHoc = toDmy(hocKy.ketThucHoc);
    final hanNhapDiem = toDmy(hocKy.hanNhapDiem);

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

class PageAcademicYearCreate extends StatefulWidget {
  static const routeName = '/academic_year/create';

  const PageAcademicYearCreate({super.key});

  @override
  State<PageAcademicYearCreate> createState() => _PageAcademicYearCreateState();
}

class _PageAcademicYearCreateState extends State<PageAcademicYearCreate> {
  final TextEditingController _nameController = TextEditingController();
  final ValueNotifier<DateTime> _moDangKy = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> _dongDangKy = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> _batDauHoc = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> _ketThucHoc = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> _hanNhapDiem = ValueNotifier(DateTime.now());

  @override
  initState() {
    super.initState();

    // Set up listeners to automatically update dates based on the previous ones
    _moDangKy.addListener(() {
      _dongDangKy.value = _moDangKy.value.add(const Duration(days: 14));
    });

    _dongDangKy.addListener(() {
      _batDauHoc.value = _dongDangKy.value.add(const Duration(days: 14));
    });

    _batDauHoc.addListener(() {
      _ketThucHoc.value = _batDauHoc.value.add(const Duration(days: 53));
    });

    _ketThucHoc.addListener(() {
      _hanNhapDiem.value = _ketThucHoc.value.add(const Duration(days: 15));
    });

    // Set initial values
    _moDangKy.value = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Tạo đợt học mới")),
      body: ListView(
        children: [
          ListTile(
            title: EzTextInput(
              label: "Tên đợt học",
              controller: _nameController,
            ),
          ),

          // Ngày bắt đầu mở đăng ký
          ListTile(
            title: const Text("Mở đăng ký học"),
            subtitle: Text(dateFormat.format(_moDangKy.value)),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: _moDangKy.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn ngày mở đăng ký học",
              );
              if (newDate != null) {
                _moDangKy.value = newDate;
                setState(() {});
              }
            },
          ),

          // Ngày đóng đăng ký
          ListTile(
            title: const Text("Đóng đăng ký học"),
            subtitle: Text(dateFormat.format(_dongDangKy.value)),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: _dongDangKy.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn ngày đóng đăng ký học",
              );
              if (newDate != null) {
                _dongDangKy.value = newDate;
                setState(() {});
              }
            },
          ),

          // Ngày bắt đầu học
          ListTile(
            title: const Text("Bắt đầu học"),
            subtitle: Text(dateFormat.format(_batDauHoc.value)),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: _batDauHoc.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn ngày bắt đầu học",
              );
              if (newDate != null) {
                _batDauHoc.value = newDate;
                setState(() {});
              }
            },
          ),

          // Ngày kết thúc học
          ListTile(
            title: const Text("Kết thúc học"),
            subtitle: Text(dateFormat.format(_ketThucHoc.value)),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: _ketThucHoc.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn ngày kết thúc học",
              );
              if (newDate != null) {
                _ketThucHoc.value = newDate;
                setState(() {});
              }
            },
          ),

          // Ngày hạn nhập điểm
          ListTile(
            title: const Text("Hạn nhập điểm"),
            subtitle: Text(dateFormat.format(_hanNhapDiem.value)),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: _hanNhapDiem.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: "Chọn hạn nhập điểm",
              );
              if (newDate != null) {
                _hanNhapDiem.value = newDate;
                setState(() {});
              }
            },
          ),

          // Button to create the academic year
          ListTile(
            title: ElevatedButton(
              onPressed: () async {
                if (_nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Vui lòng nhập tên đợt học")),
                  );
                  return;
                }

                final created = await HocKy.create(
                  hocKy: _nameController.text,
                  moDangKy: _moDangKy.value,
                  dongDangKy: _dongDangKy.value,
                  batDauHoc: _batDauHoc.value,
                  ketThucHoc: _ketThucHoc.value,
                  hanNhapDiem: _hanNhapDiem.value,
                );

                navigator.pop(created);
              },
              child: const Text("Tạo đợt học"),
            ),
          ),
        ],
      ),
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
      ref.invalidate(allAcademicYearsProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final hocKyName = "Đợt học ${academicYear.hocKy}";

    final copyPasta = CopyPasta(
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
    final moDangKy = toDmy(academicYear.moDangKy);
    final dongDangKy = toDmy(academicYear.dongDangKy);
    final batDauHoc = toDmy(academicYear.batDauHoc);
    final ketThucHoc = toDmy(academicYear.ketThucHoc);
    final hanNhapDiem = toDmy(academicYear.hanNhapDiem);
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
      appBar: AppBar(
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
      body: _AcademicYearList(),
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
    final future = ref.watch(allAcademicYearsProvider);
    return switch (future) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error) => Text("Error: $error"),
      AsyncData(:final value) => _buildAcademicYearList(value),
    };
  }
}
