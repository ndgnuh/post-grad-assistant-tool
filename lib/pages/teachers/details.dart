import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;

import '../../business/domain_objects.dart';
import '../../business/pods.dart';
import '../../custom_widgets.dart';
import '../../custom_tiles.dart';
import '../../shortcuts.dart';
import '../../business/db_v2_providers.dart' show teachingCoursesProvider;

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
  final int id;

  const Page({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Actions(
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
          child: TeacherDetail(teacherId: id),
        ),
      ),
    );
  }
}

class TeacherDetail extends ConsumerWidget {
  final int teacherId;

  const TeacherDetail({super.key, required this.teacherId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherAsync = ref.watch(teacherByIdProvider(teacherId));
    switch (teacherAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        return Center(child: Text("Lỗi: $error\n$stackTrace"));
      default:
    }

    final coursesAsync = ref.watch(teachingCoursesProvider(teacherId));
    switch (coursesAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        return Center(child: Text("Lỗi: $error\n$stackTrace"));
      default:
    }

    final teacher = teacherAsync.value!;
    final courses = coursesAsync.value!;
    final teacherNotifier = ref.read(teacherByIdProvider(teacher.id).notifier);

    return ListView(
      children: [
        HeadingListTile(title: "Thông tin cơ bản"),
        StringTile(
          titleText: "Họ tên",
          leading: const Icon(Icons.person),
          initialValue: teacher.hoTen,
          onUpdate: (value) => teacherNotifier.updateName(value!),
        ),
        SingleSelectionTile<Gender>(
          titleText: "Giới tính",
          leading: const Icon(Icons.male),
          options: Gender.values,
          initialValue: teacher.gioiTinh,
          onUpdate: teacherNotifier.updateGender,
        ),
        DateTile(
          titleText: "Ngày sinh",
          leading: const Icon(Icons.cake),
          initialValue: teacher.ngaySinh,
          onUpdate: (value) => teacherNotifier.updateDateOfBirth(value),
        ),

        // Thông tin công tác
        HeadingListTile(title: "Thông tin công tác"),
        StringTile(
          titleText: "Mã cán bộ",
          leading: const Icon(Icons.card_membership),
          initialValue: teacher.maCanBo ?? "N/A",
          onUpdate: (value) => teacherNotifier.updateStaffId(value),
        ),
        StringTile(
          titleText: "Đơn vị",
          leading: const Icon(Icons.school),
          initialValue: teacher.donVi ?? notAvailableText,
          onUpdate: (value) => teacherNotifier.updateUniversity(value!),
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
          onUpdate: (rank) => teacherNotifier.updateAcademicRank(rank: rank),
        ),
        SingleSelectionTile<HocVi>(
          titleText: "Học vị",
          leading: const Icon(null),
          options: HocVi.values,
          initialValue: teacher.hocVi,
          onUpdate: (deg) => teacherNotifier.updateAcademicDegree(degree: deg),
        ),

        // Thông tin liên hệ
        HeadingListTile(title: "Thông tin liên hệ"),
        StringTile(
          titleText: "Email",
          leading: const Icon(Icons.email),
          initialValue: teacher.email ?? notAvailableText,
          onUpdate: (value) => teacherNotifier.updateEmail(value),
        ),
        StringTile(
          titleText: "Số điện thoại",
          leading: const Icon(Icons.phone),
          initialValue: teacher.sdt ?? notAvailableText,
          onUpdate: (value) => teacherNotifier.updatePhone(value),
        ),

        // Thông tin thanh toán
        // Mã số thuế, tài khoản ngân hàng, tên ngân hàng, chi nhánh
        HeadingListTile(title: "Thông tin thanh toán"),
        StringTile(
          titleText: "Tài khoản ngân hàng",
          leading: const Icon(Icons.account_balance_wallet),
          initialValue: teacher.stk ?? notAvailableText,
          onUpdate: (value) => teacherNotifier.updateBankAccount(value),
        ),
        StringTile(
          titleText: "Tên ngân hàng",
          leading: const Icon(Icons.location_city),
          initialValue: teacher.nganHang ?? notAvailableText,
          onUpdate: (value) => teacherNotifier.updateBankName(value),
        ),
        StringTile(
          titleText: "Mã số thuế",
          leading: const Icon(Icons.account_balance),
          initialValue: teacher.mst ?? notAvailableText,
          onUpdate: (value) => teacherNotifier.updateTaxCode(value),
        ),
        StringTile(
          titleText: "CCCD",
          leading: const Icon(Icons.person),
          initialValue: teacher.cccd ?? notAvailableText,
          onUpdate: (value) => teacherNotifier.updateCitizenId(value),
        ),

        HeadingListTile(title: "Học phần giảng dạy"),

        SearchAnchor(
          key: searchAnchorKey,
          viewLeading: const Icon(Icons.search),
          suggestionsBuilder: (context, controller) async {
            final courses = await HocPhan.search(controller.text);
            final notifier = ref.read(
              teachingCoursesProvider(teacher.id).notifier,
            );

            return [
              for (final (i, course) in courses.indexed)
                ListTile(
                  autofocus: (i == 0),
                  title: Text(course.tenTiengViet),
                  subtitle: Text("Mã HP: ${course.maHocPhan}"),
                  onTap: () {
                    try {
                      notifier.addCourse(course.maHocPhan);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Lỗi: ${e.toString()}")),
                      );
                    }

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

        if (courses.isEmpty)
          const Center(child: Text("Giảng viên không phụ trách học phần nào"))
        else ...[
          for (final course in courses)
            ListTile(
              title: Text(course.vietnameseTitle),
              subtitle: Text("Mã HP: ${course.id}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  final notifier = ref.read(
                    teachingCoursesProvider(teacher.id).notifier,
                  );
                  try {
                    notifier.removeCourse(course.id);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Lỗi: ${e.toString()}")),
                    );
                  }
                },
              ),
            ),
        ],
      ],
    );
  }
}

// class _ListOfTeachingCourses extends StatelessWidget {
//   final Future<List<HocPhan>> futureTeachingCourses;
//
//   const _ListOfTeachingCourses({required this.futureTeachingCourses});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<HocPhan>>(
//       future: futureTeachingCourses,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Lỗi: ${snapshot.error}"));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text("Không có khóa học nào"));
//         } else {
//           final courses = snapshot.data!;
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: courses.length,
//             itemBuilder: (context, index) {
//               final course = courses[index];
//               return ListTile(
//                 title: Text(course.tenTiengViet),
//                 subtitle: Text("Mã HP: ${course.maHocPhan}"),
//                 autofocus: true,
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
