import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../business/domain_objects.dart';
import '../../business_widgets.dart';

const notAvailableText = "N/A";

void copyToClipboard(String? text) {
  switch (text) {
    case null:
      return;
    case "":
      return;
    default:
      Clipboard.setData(ClipboardData(text: text));
      break;
  }
}

class PageState extends ChangeNotifier {
  GiangVien teacher;

  PageState(this.teacher);

  setTeacher(GiangVien newTeacher) {
    teacher = newTeacher;
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }
}

class TeacherDetail extends StatelessWidget {
  final GiangVien initialTeacher;

  const TeacherDetail({super.key, required this.initialTeacher});

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final state = Provider.of<PageState>(context, listen: true);
    final teacher = state.teacher;

    void copyToClipboardAndNotify(String? text) {
      if (text != null && text.isNotEmpty) {
        Clipboard.setData(ClipboardData(text: text));
        messenger.hideCurrentSnackBar();
        messenger.showSnackBar(
          SnackBar(content: Text("Đã sao chép: $text")),
        );
      } else {
        messenger.hideCurrentSnackBar();
        messenger.showSnackBar(
          const SnackBar(content: Text("Không có dữ liệu để sao chép")),
        );
      }
    }

    final textTheme = Theme.of(context).textTheme;

    return ListView(
      children: [
        ListTile(
          title: Text(
            "Thông tin cơ bản",
            style: textTheme.titleSmall?.copyWith(
              color: ColorScheme.of(context).outline,
            ),
          ),
        ),

        // Họ tên, mã cán bộ, email, số điện thoại, đơn vị, chuyên ngành
        ListTile(
          title: Text("Họ tên"),
          leading: const Icon(Icons.person),
          onLongPress: () => copyToClipboardAndNotify(teacher.hoTen),
          subtitle: Text(teacher.hoTen),
        ),
        GenderSelectionListTile(
          initialGender: teacher.gioiTinh,
          leading: const Icon(null),
          onSelect: (newGender) async {
            await teacher.setGioiTinh(newGender);
          },
        ),
        ListTile(
          title: Text("Ngày sinh"),
          leading: const Icon(Icons.cake),
          subtitle: Text(teacher.ngaySinh?.toLocal().toString().split(' ')[0] ??
              notAvailableText),
        ),

        // Thông tin công tác
        ListTile(
          title: Text(
            "Thông tin công tác",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ListTile(
          title: Text("Mã cán bộ"),
          leading: const Icon(Icons.card_membership),
          onLongPress: () => copyToClipboardAndNotify(teacher.maCanBo),
          subtitle: Text(teacher.maCanBo ?? notAvailableText),
        ),
        ListTile(
          title: Text("Đơn vị"),
          leading: const Icon(Icons.school),
          onLongPress: () => copyToClipboardAndNotify(teacher.donVi),
          subtitle: Text(teacher.donVi ?? notAvailableText),
        ),
        ListTile(
          title: Text("Chuyên ngành"),
          leading: const Icon(null),
          onLongPress: () => copyToClipboardAndNotify(teacher.chuyenNganh),
          subtitle: Text(teacher.chuyenNganh ?? notAvailableText),
        ),
        ListTile(
          title: Text("Học hàm"),
          leading: const Icon(null),
          onLongPress: () =>
              copyToClipboardAndNotify(teacher.hocHam?.toString()),
          subtitle: Text(teacher.hocHam?.toString() ?? notAvailableText),
        ),
        ListTile(
          title: Text("Học vị"),
          leading: const Icon(null),
          onLongPress: () =>
              copyToClipboardAndNotify(teacher.hocVi?.toString()),
          subtitle: Text(teacher.hocVi?.toString() ?? notAvailableText),
        ),

        // Thông tin liên hệ
        ListTile(
          title: Text(
            "Thông tin liên hệ",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ListTile(
          title: Text("Email"),
          leading: const Icon(Icons.email),
          onLongPress: () => copyToClipboardAndNotify(teacher.email),
          subtitle: Text(teacher.email ?? notAvailableText),
        ),
        ListTile(
          title: Text("Số điện thoại"),
          leading: const Icon(Icons.phone),
          onLongPress: () => copyToClipboardAndNotify(teacher.sdt),
          onTap: () {
            // Show dialog to edit phone number
            showDialog(
              context: context,
              builder: (context) => TextEditDialog(
                title: "Sửa số điện thoại",
                initialText: teacher.sdt,
                icon: Icons.phone,
                onSubmit: (newPhone) async {
                  final teacherUpdated = await teacher.setSdt(newPhone);
                  state.setTeacher(teacherUpdated);
                },
              ),
            );
          },
          subtitle: Text(teacher.sdt ?? notAvailableText),
        ),

        // Thông tin thanh toán
        // Mã số thuế, tài khoản ngân hàng, tên ngân hàng, chi nhánh
        ListTile(
          title: Text(
            "Thông tin thanh toán",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ListTile(
          title: Text("Mã số thuế"),
          leading: const Icon(Icons.account_balance),
          onLongPress: () => copyToClipboardAndNotify(teacher.mst),
          subtitle: Text(teacher.mst ?? notAvailableText),
        ),
        ListTile(
          title: Text("Tài khoản ngân hàng"),
          leading: const Icon(Icons.account_balance_wallet),
          onLongPress: () => copyToClipboardAndNotify(teacher.stk),
          subtitle: Text(teacher.stk ?? notAvailableText),
        ),
        ListTile(
          title: Text("Tên ngân hàng"),
          leading: const Icon(Icons.account_balance),
          onLongPress: () => copyToClipboardAndNotify(teacher.nganHang),
          subtitle: Text(teacher.nganHang ?? notAvailableText),
        ),
      ],
    );
  }
}

class MobilePageTeacherDetail extends StatelessWidget {
  final GiangVien teacher; // this is only the initial teacher data
  static const routeName = "/mobile/teacher_detail";

  const MobilePageTeacherDetail({
    super.key,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(teacher),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Chi tiết giảng viên"),
            actions: [],
          ),
          body: TeacherDetail(initialTeacher: teacher)),
    );
  }
}
