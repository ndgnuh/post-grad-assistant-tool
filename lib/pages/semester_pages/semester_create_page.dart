import 'package:flutter/material.dart';

import 'package:fami_tools/custom_widgets.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:fami_tools/business/db_v2_providers.dart';

class SemesterCreatePage extends StatefulWidget {
  static const routeName = '/academic_year/create';

  const SemesterCreatePage({super.key});

  @override
  State<SemesterCreatePage> createState() => _SemesterCreatePageState();
}

class _SemesterCreatePageState extends State<SemesterCreatePage> {
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
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text("Tạo đợt học mới"),
        ),
      ),
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
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
                title: _CreateNewButton(
                  nameController: _nameController,
                  moDangKy: _moDangKy,
                  dongDangKy: _dongDangKy,
                  batDauHoc: _batDauHoc,
                  ketThucHoc: _ketThucHoc,
                  hanNhapDiem: _hanNhapDiem,
                  navigator: navigator,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateNewButton extends ConsumerWidget {
  const _CreateNewButton({
    required TextEditingController nameController,
    required ValueNotifier<DateTime> moDangKy,
    required ValueNotifier<DateTime> dongDangKy,
    required ValueNotifier<DateTime> batDauHoc,
    required ValueNotifier<DateTime> ketThucHoc,
    required ValueNotifier<DateTime> hanNhapDiem,
    required this.navigator,
  }) : _nameController = nameController,
       _moDangKy = moDangKy,
       _dongDangKy = dongDangKy,
       _batDauHoc = batDauHoc,
       _ketThucHoc = ketThucHoc,
       _hanNhapDiem = hanNhapDiem;

  final TextEditingController _nameController;
  final ValueNotifier<DateTime> _moDangKy;
  final ValueNotifier<DateTime> _dongDangKy;
  final ValueNotifier<DateTime> _batDauHoc;
  final ValueNotifier<DateTime> _ketThucHoc;
  final ValueNotifier<DateTime> _hanNhapDiem;
  final NavigatorState navigator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        if (_nameController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Vui lòng nhập tên đợt học")),
          );
          return;
        }

        final notifier = ref.read(semesterIdsProvider.notifier);
        notifier.addSemester(
          id: _nameController.text,
          registrationBeginDate: _moDangKy.value,
          registrationEndDate: _dongDangKy.value,
          classBeginDate: _batDauHoc.value,
          classEndDate: _ketThucHoc.value,
          gradeSubmissionDeadline: _hanNhapDiem.value,
        );
        navigator.pop();
      },
      child: const Text("Tạo đợt học"),
    );
  }
}
