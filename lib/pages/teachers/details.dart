import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;

import '../../business/domain_objects.dart';
import '../../business_widgets.dart';
import '../../business/pods.dart';
import '../../custom_widgets.dart';
import '../../custom_tiles.dart';
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

class Page extends ConsumerWidget {
  static const routeName = "/mobile/teacher_detail";
  final int id;

  const Page({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherAsync = ref.watch(teacherByIdProvider(id));

    switch (teacherAsync) {
      case AsyncLoading():
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case AsyncError(:final error, :final stackTrace):
        return Scaffold(
          appBar: AppBar(title: const Text("Chi tiết giảng viên")),
          body: Center(child: Text("Lỗi: $error\n$stackTrace")),
        );
      default:
    }

    final teacher = teacherAsync.value!;
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
          appBar: AppBar(title: const Text("Chi tiết giảng viên"), actions: []),
          body: Padding(
            padding: EdgeInsets.all(context.gutter),
            child: TeacherDetail(initialTeacher: teacher),
          ),
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
        messenger.showSnackBar(SnackBar(content: Text("Đã sao chép: $text")));
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
        HeadingListTile(title: "Thông tin cơ bản"),
        StringTile(
          titleText: "Họ tên",
          leading: const Icon(Icons.person),
          initialValue: teacher.hoTen,
          onUpdate: (value) => teacher.updateName(value!),
        ),
        SingleSelectionTile<Gender>(
          titleText: "Giới tính",
          leading: const Icon(Icons.male),
          options: Gender.values,
          initialValue: teacher.gioiTinh,
          onUpdate: teacher.updateGender,
        ),
        DateTile(
          titleText: "Ngày sinh",
          leading: const Icon(Icons.cake),
          initialValue: teacher.ngaySinh,
          onUpdate: (value) => teacher.updateDateOfBirth(value),
        ),

        // Thông tin công tác
        HeadingListTile(title: "Thông tin công tác"),
        StringTile(
          titleText: "Mã cán bộ",
          leading: const Icon(Icons.card_membership),
          initialValue: teacher.maCanBo ?? "N/A",
          onUpdate: (value) => teacher.updateStaffId(value),
        ),
        StringTile(
          titleText: "Đơn vị",
          leading: const Icon(Icons.school),
          initialValue: teacher.donVi ?? notAvailableText,
          onUpdate: (value) => teacher.updateUniversity(value!),
        ),
        StringTile(
          titleText: "Chuyên ngành",
          leading: const Icon(null),
          initialValue: teacher.chuyenNganh ?? notAvailableText,
        ),
        SingleSelectionTile<HocHam>(
          options: HocHam.values,
          titleText: "Học hàm",
          leading: const Icon(null),
          initialValue: teacher.hocHam,
          onUpdate: (rank) => teacher.updateAcademicRank(rank: rank),
        ),
        SingleSelectionTile<HocVi>(
          titleText: "Học vị",
          leading: const Icon(null),
          options: HocVi.values,
          initialValue: teacher.hocVi,
          onUpdate: (deg) => teacher.updateAcademicDegree(degree: deg),
        ),

        // Thông tin liên hệ
        HeadingListTile(title: "Thông tin liên hệ"),
        StringTile(
          titleText: "Email",
          leading: const Icon(Icons.email),
          initialValue: teacher.email ?? notAvailableText,
          onUpdate: (value) => teacher.updateEmail(value),
        ),
        StringTile(
          titleText: "Số điện thoại",
          leading: const Icon(Icons.phone),
          initialValue: teacher.sdt ?? notAvailableText,
          onUpdate: (value) => teacher.updatePhone(value),
        ),

        // Thông tin thanh toán
        // Mã số thuế, tài khoản ngân hàng, tên ngân hàng, chi nhánh
        HeadingListTile(title: "Thông tin thanh toán"),
        StringTile(
          titleText: "Tài khoản ngân hàng",
          leading: const Icon(Icons.account_balance_wallet),
          initialValue: teacher.stk ?? notAvailableText,
          onUpdate: (value) => teacher.updateBankAccount(value),
        ),
        StringTile(
          titleText: "Tên ngân hàng",
          leading: const Icon(Icons.location_city),
          initialValue: teacher.nganHang ?? notAvailableText,
          onUpdate: (value) => teacher.updateBankName(value),
        ),
        StringTile(
          titleText: "Mã số thuế",
          leading: const Icon(Icons.account_balance),
          initialValue: teacher.mst ?? notAvailableText,
          onUpdate: (value) => teacher.updateTaxCode(value),
        ),

        HeadingListTile(title: "Học phần giảng dạy"),

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
                        SnackBar(content: Text("Lỗi: ${e.toString()}")),
                      );
                    }

                    state.refresh();
                    controller.clear();
                    controller.closeView("");
                    controller.openView();
                  },
                ),
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
          builder: (context, futureTeachingCourses, child) =>
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
