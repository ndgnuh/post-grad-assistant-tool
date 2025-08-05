import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../business/domain_objects.dart';
import '../../business_widgets.dart';
import '../../custom_widgets.dart';
import '../../shortcuts.dart';

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

class Page extends StatelessWidget {
  static const routeName = "/mobile/teacher_detail";
  final GiangVien teacher; // this is only the initial teacher data

  const Page({
    super.key,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => State(teacher),
      child: Actions(
        actions: {
          GoBackIntent: CallbackAction<GoBackIntent>(
            onInvoke: (intent) {
              Navigator.pop(context);
              return null;
            },
          ),
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Chi tiết giảng viên"),
            actions: [],
          ),
          body: TeacherDetail(initialTeacher: teacher),
        ),
      ),
    );
  }
}

class TeacherDetail extends StatelessWidget {
  final GiangVien initialTeacher;

  const TeacherDetail({super.key, required this.initialTeacher});

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final state = Provider.of<State>(context, listen: true);
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
      controller: state.scrollController,
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
          subtitle: Text(teacher.sdt ?? notAvailableText),
        ),

        // Thông tin thanh toán
        // Mã số thuế, tài khoản ngân hàng, tên ngân hàng, chi nhánh
        HeadingListTile(
          title: "Thông tin thanh toán",
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

        HeadingListTile(
          title: "Học phần giảng dạy",
        ),
        SearchAnchor(
          key: searchAnchorKey,
          searchController: state.searchController,
          viewLeading: const Icon(Icons.search),
          suggestionsBuilder: (context, controller) async {
            final courses = await HocPhan.search(controller.text);

            return [
              for (final (i, course) in courses.indexed)
                ListTile(
                  autofocus: (i == 0),
                  title: Text(course.tenTiengViet),
                  subtitle: Text("Mã HP: ${course.maHocPhan}"),
                  onTap: () {
                    try {
                      teacher.addTeachingCourse(course.maHocPhan);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Lỗi: ${e.toString()}"),
                        ),
                      );
                    }

                    state.refresh();
                    controller.clear();
                    controller.closeView("");
                    controller.openView();
                  },
                )
            ];
          },
          builder: (context, controller) => ListTile(
            title: Text("Thêm"),
            leading: const Icon(Icons.add),
            onTap: () => controller.openView(),
          ),
        ),
        Selector(
          selector: (context, State state) => state.futureTeachingCourses,
          builder: (
            context,
            futureTeachingCourses,
            child,
          ) =>
              _ListOfTeachingCourses(
            futureTeachingCourses: state.futureTeachingCourses,
          ),
        ),
      ],
    );
  }
}

class State extends ChangeNotifier {
  final GiangVien teacher;
  late Future<List<HocPhan>> futureTeachingCourses;
  final scrollController = ScrollController();
  final searchController = SearchController();

  State(this.teacher) {
    futureTeachingCourses = teacher.teachingCourses;
    notifyListeners();
  }

  void refresh() {
    final offset = scrollController.offset;
    futureTeachingCourses = teacher.teachingCourses;
    notifyListeners();
    scrollController.jumpTo(offset);
  }
}

class _ListOfTeachingCourses extends StatelessWidget {
  final Future<List<HocPhan>> futureTeachingCourses;

  const _ListOfTeachingCourses({required this.futureTeachingCourses});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HocPhan>>(
      future: futureTeachingCourses,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Lỗi: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Không có khóa học nào"));
        } else {
          final courses = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return ListTile(
                title: Text(course.tenTiengViet),
                subtitle: Text("Mã HP: ${course.maHocPhan}"),
                autofocus: true,
              );
            },
          );
        }
      },
    );
  }
}
