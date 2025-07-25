import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../business/domain_objects.dart';
import '../../business_widgets.dart';
import '../../custom_widgets.dart';
import '../../business/copy_pasta.dart';

import 'select_class_of.dart';

part 'admission.freezed.dart';
part 'admission.g.dart';

class _State extends ChangeNotifier {
  List<HocVien> admissionList = [];
  late Future<List<HocVien>> futureAdmissionList;

  List<HocVien> get directAdmissionList => admissionList
      .where((ad) => ad.dienTuyenSinh == DienTuyenSinh.tichHop)
      .toList();

  List<HocVien> get interviewAdmissionList => admissionList
      .where((ad) => ad.dienTuyenSinh == DienTuyenSinh.xetTuyen)
      .toList();

  Future<void> loadAdmissionList() async {
    // Simulate loading data
    futureAdmissionList = HocVien.getAdmissionList();
    admissionList = await futureAdmissionList;
    notifyListeners();
  }

  _State() {
    loadAdmissionList();
  }
}

enum _CopyMenuAction {
  emailAll,
  emailDirectAdmission,
  emailInterviewAdmission,
  interviewInvitation,
  enrollmentConfirmation,
}

class _CopyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    copyAndNotify(String text, String message) {
      Clipboard.setData(ClipboardData(text: text));
      messenger.showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

    final state = Provider.of<_State>(context, listen: true);
    return PopupMenuButton<_CopyMenuAction>(
      icon: Icon(Icons.copy),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: _CopyMenuAction.interviewInvitation,
          child: const Text("Lời mời phỏng vấn"),
        ),
        PopupMenuItem(
          value: _CopyMenuAction.enrollmentConfirmation,
          child: const Text("Thông báo trúng tuyển"),
        ),
        PopupMenuItem(
          value: _CopyMenuAction.emailAll,
          child: const Text("Email (tất cả)"),
        ),
        PopupMenuItem(
          value: _CopyMenuAction.emailDirectAdmission,
          child: const Text("Email (tích hợp)"),
        ),
        PopupMenuItem(
          value: _CopyMenuAction.emailInterviewAdmission,
          child: const Text("Email (phỏng vấn)"),
        ),
      ],
      onSelected: (value) {
        // Handle the specific actions based on the selected value
        switch (value) {
          case _CopyMenuAction.interviewInvitation:
            copyAdmissionInterviewInvitation(context: context);
            return;
          case _CopyMenuAction.enrollmentConfirmation:
            copyAdmissionEnrollmentConfirmation(context: context);
            return;
          default:
        }

        // Filter the admission list based on the selected action
        final admissionList = switch (value) {
          _CopyMenuAction.emailAll => state.admissionList,
          _CopyMenuAction.emailDirectAdmission => state.directAdmissionList,
          _CopyMenuAction.emailInterviewAdmission =>
            state.interviewAdmissionList,
          _ => [],
        };

        // Extract emails from the filtered list
        final emails = admissionList
            .map((ad) => ad.email ?? "")
            .where((email) => email.isNotEmpty)
            .join("\n");

        // If no emails, show a message
        // Otherwise, copy to clipboard and show a notification
        if (emails.isEmpty) {
          messenger.showSnackBar(
            const SnackBar(content: Text("Không có email nào để sao chép.")),
          );
        } else {
          copyAndNotify(
            emails,
            "Đã sao chép ${admissionList.length} email(s) vào clipboard.",
          );
        }
      },
    );
  }
}

class _AdmissionListView extends StatelessWidget {
  final List<HocVien> admissionList;

  const _AdmissionListView({required this.admissionList});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context, listen: false);

    final valueNotifiers = [
      for (var admission in admissionList) ValueNotifier<HocVien>(admission),
    ];

    return ListView.builder(
      itemCount: admissionList.length,
      itemBuilder: (context, index) {
        final admission = admissionList[index];
        final subtitle = [
          "Số hồ sơ: ${admission.soHoSo}",
          "Email: ${admission.email}",
          "Điện thoại: ${admission.dienThoai}",
          "Diện tuyển sinh: ${admission.dienTuyenSinh?.label}",
        ].join("\n");
        return ValueListenableBuilder(
          valueListenable: valueNotifiers[index],
          builder: (context, value, child) {
            return ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              leading: Icon(Icons.person),
              title: Text(admission.hoTen),
              subtitle: Text(subtitle),
              onTap: () async {
                await Navigator.pushNamed(
                  context,
                  PageAdmissionDetail.routeName,
                  arguments: PageAdmissionDetailArgs(admission: admission),
                );
                // Reload the list after returning
                await state.loadAdmissionList();
              },
            );
          },
        );
      },
    );
  }
}

class PageAdmissionList extends StatelessWidget {
  static const routeName = "/admission/list";

  const PageAdmissionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _State(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Danh sách xét tuyển"),
          actions: [
            _CopyMenu(),
          ],
        ),
        body: Selector<_State, Future<List<HocVien>>>(
          selector: (_, state) => state.futureAdmissionList,
          builder: (context, future, _) => FutureBuilder<List<HocVien>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Lỗi: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("Không có xét tuyển nào."));
              } else {
                return _AdmissionListView(admissionList: snapshot.data!);
              }
            },
          ),
        ),
      ),
    );
  }
}

@freezed
abstract class PageAdmissionDetailArgs with _$PageAdmissionDetailArgs {
  const PageAdmissionDetailArgs._();
  factory PageAdmissionDetailArgs({
    required HocVien admission,
  }) = _PageAdmissionDetailArgs;

  factory PageAdmissionDetailArgs.fromJson(Map<String, dynamic> json) =>
      _$PageAdmissionDetailArgsFromJson(json);
}

class PageAdmissionDetail extends StatefulWidget {
  static const routeName = "/admission/detail";
  final HocVien admission;

  factory PageAdmissionDetail.fromArgs(PageAdmissionDetailArgs args) {
    return PageAdmissionDetail(admission: args.admission);
  }

  const PageAdmissionDetail({
    super.key,
    required this.admission,
  });

  @override
  State<PageAdmissionDetail> createState() => _PageAdmissionDetailState();
}

class _PageAdmissionDetailState extends State<PageAdmissionDetail> {
  ValueNotifier<String> studentIdNotifier = ValueNotifier<String>("");
  ValueNotifier<String> studentEmailNotifier = ValueNotifier<String>("");
  ValueNotifier<NienKhoa?> classOfYearNotifier = ValueNotifier<NienKhoa?>(null);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Widget mkHeadline(String text) {
      return ListTile(
        title: Text(
          text,
          style: textTheme.headlineSmall?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Divider(
          color: colorScheme.primary,
        ),
      );
    }

    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết xét tuyển"),
      ),
      body: ListView(
        children: [
          mkHeadline("Thông tin cơ bản"),
          ListTile(
            title: const Text("Số hồ sơ"),
            subtitle: Text(widget.admission.soHoSo ?? "N/A"),
          ),
          ListTile(
            title: const Text("Họ tên"),
            subtitle: Text(widget.admission.hoTen),
          ),
          ListTile(
            title: const Text("Quê quán"),
            subtitle: Text(widget.admission.noiSinh ?? "N/A"),
          ),
          ListTile(
            title: const Text("Ngày sinh"),
            subtitle:
                Text(widget.admission.ngaySinh?.toIso8601String() ?? "N/A"),
          ),
          ListTile(
            title: const Text("Giới tính"),
            subtitle: Text(widget.admission.gioiTinh?.label ?? "N/A"),
          ),

          // Thông tin liên hệ
          mkHeadline("Thông tin liên hệ"),
          ListTile(
            title: const Text("Email"),
            subtitle: Text(widget.admission.email ?? "N/A"),
          ),
          ListTile(
            title: const Text("Điện thoại"),
            subtitle: Text(widget.admission.dienThoai ?? "N/A"),
          ),

          // Thông tin học vấn
          mkHeadline("Thông tin học vấn"),
          ListTile(
            title: const Text("Trường đại học"),
            subtitle: Text(widget.admission.truongTotNghiepDaiHoc ?? "N/A"),
          ),
          ListTile(
            title: const Text("Ngành học đại học"),
            subtitle: Text(widget.admission.nganhTotNghiepDaiHoc ?? "N/A"),
          ),
          ListTile(
            title: const Text("Hệ tốt nghiệp đại học"),
            subtitle: Text(widget.admission.heTotNghiepDaiHoc ?? " N/A"),
          ),
          ListTile(
            title: const Text("Ngày tốt nghiệp đại học"),
            subtitle: Text(
              widget.admission.ngayTotNghiepDaiHoc?.toIso8601String() ?? "N/A",
            ),
          ),

          // Thông tin tuyển sinh
          mkHeadline("Thông tin tuyển sinh"),
          ListTile(
            title: const Text("Ngành tuyển sinh thạc sĩ"),
            subtitle: Text(widget.admission.nganhDaoTaoThacSi ?? "N/A"),
          ),
          ListTile(
            title: const Text("Diện tuyển sinh"),
            subtitle: Text(
              widget.admission.dienTuyenSinh?.label ?? "Không xác định",
            ),
          ),
          ListTile(
            title: const Text("Học phần được miễn"),
            subtitle: Text(widget.admission.hocPhanDuocMien ?? "N/A"),
          ),
          ListTile(
            title: const Text("Trạng thái hồ sơ"),
            subtitle: Text(widget.admission.trangThai?.label ?? "N/A"),
          ),

          // Nhập học
          mkHeadline("Thông tin nhập học"),
          ValueListenableBuilder(
            valueListenable: studentEmailNotifier,
            builder: (context, value, _) => ListTile(
              title: Text("Email học viên"),
              subtitle: Text(value),
              onTap: () async {
                final newValue = await showDialog<String>(
                  context: context,
                  builder: (context) => TextEditingDialog(
                    title: "email học viên",
                    initialText: value,
                    keyboardType: TextInputType.emailAddress,
                  ),
                );

                switch (newValue) {
                  case String newValue:
                    // Update the admission's email
                    studentEmailNotifier.value = newValue;
                }
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: studentIdNotifier,
            builder: (context, value, _) => ListTile(
              title: Text("Mã học viên"),
              subtitle: Text(value),
              onTap: () async {
                final newValue = await showDialog<String>(
                  context: context,
                  builder: (context) => TextEditingDialog(
                    title: "Nhập mã học viên",
                    initialText: value,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[M0-9]+$'),
                      ),
                    ],
                  ),
                );

                switch (newValue) {
                  case String newValue:
                    studentIdNotifier.value = newValue;
                }
              },
            ),
          ),
          SearchAnchor(
            suggestionsBuilder: (context, controller) async {
              final query = controller.text;
              final classOfYearList = await NienKhoa.search(query);

              return [
                for (final classOfYear in classOfYearList)
                  ListTile(
                    title: Text(classOfYear.nienKhoa),
                    onTap: () {
                      classOfYearNotifier.value = classOfYear;
                      controller.closeView(null);
                    },
                  )
              ];
            },
            builder: (context, controller) => ValueListenableBuilder(
              valueListenable: classOfYearNotifier,
              builder: (context, value, _) => ListTile(
                title: Text("Niên khóa"),
                subtitle: switch (value) {
                  NienKhoa nienKhoa => Text(nienKhoa.nienKhoa),
                  _ => Text("N/A"),
                },
              ),
            ),
          ),

          // Nút nhập học
          ListTile(
            title: FilledButton(
              onPressed: () async {
                // Validate the admission status
                final studentEmail = studentEmailNotifier.value;
                final studentId = studentIdNotifier.value;
                final classOfYear = classOfYearNotifier.value;

                // validate email
                if (studentEmail.isEmpty) {
                  messenger.showSnackBar(
                    const SnackBar(
                      content: Text("Vui lòng nhập email học viên."),
                    ),
                  );
                  return;
                }

                // Validate student ID
                if (studentId.isEmpty) {
                  messenger.showSnackBar(
                    const SnackBar(
                      content: Text("Vui lòng nhập mã học viên."),
                    ),
                  );
                  return;
                }

                // Validate class of year
                if (classOfYear == null) {
                  messenger.showSnackBar(
                    const SnackBar(
                      content: Text("Vui lòng chọn niên khóa."),
                    ),
                  );
                  return;
                }

                // Confirm first
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Xác nhận nhập học"),
                    content: Text(
                      """Bạn có chắc chắn muốn nhập học cho học viên này?
hồ sơ sẽ được gỡ khỏi danh sách xét tuyển""",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text("Hủy"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text("Xác nhận"),
                      ),
                    ],
                  ),
                );

                // If confirmed, proceed with enrollment
                if (confirm == null || confirm == false) return;

                // Update in the database
                final student = widget.admission.copyWith(
                  maHocVien: studentId,
                  emailHust: studentEmail,
                  nienKhoa: classOfYear.nienKhoa,
                  maTrangThai: TrangThaiHocVien.dangHoc,
                );
                student.update();

                // Go back to the list page
                navigator.pop();
              },
              child: const Text("Nhập học"),
            ),
          ),
        ],
      ),
    );
  }
}

class PageAdmissionCreate extends StatelessWidget {
  static const routeName = "/admission/create";

  const PageAdmissionCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tạo xét tuyển"),
      ),
      body: Center(
        child: Text("Form tạo xét tuyển sẽ được hiển thị ở đây."),
      ),
    );
  }
}
