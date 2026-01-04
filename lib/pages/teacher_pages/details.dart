import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_tiles.dart';
import '../../custom_widgets.dart';
import '../../shortcuts.dart';

import '../../custom_tiles_v2.dart' as tiles_v2;

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

class TeacherDetailsPage extends StatelessWidget {
  static const routeName = "/mobile/teacher_detail";
  final int id;

  const TeacherDetailsPage({super.key, required this.id});

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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: ConstrainedAppBar(
            withTabBar: true,
            child: AppBar(
              title: const Text("Chi tiết giảng viên"),
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Thông tin cá nhân"),
                  Tab(text: "Giảng dạy"),
                ],
                isScrollable: true,
              ),
            ),
          ),
          body: CommonShortcuts(
            child: ConstrainedBody(
              child: TabBarView(
                children: [
                  _TeacherDetailTab(teacherId: id),
                  _TeachingCoursesTab(teacherId: id),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TeachingCoursesTab extends ConsumerWidget {
  final int teacherId;

  const _TeachingCoursesTab({required this.teacherId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseIdsByTeacherProvider(teacherId));
    switch (coursesAsync) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        return Center(child: Text("Lỗi: $error\n$stackTrace"));
      default:
    }
    final courses = coursesAsync.value!;

    // notifier to updates
    final notifier = ref.read(
      courseIdsByTeacherProvider(teacherId).notifier,
    );

    // Draw list of courses
    final courseWidgets = <Widget>[];
    for (final (i, courseId) in courses.indexed) {
      courseWidgets.add(
        _CourseTile(
          key: ValueKey((teacherId, courseId)),
          teacherId: teacherId,
          courseId: courseId,
        ),
      );
      if (i < courses.length - 1) {
        courseWidgets.add(const Divider());
      }
    }

    final courseListWidget = switch (courseWidgets.isEmpty) {
      false => ListView(
        children: courseWidgets,
      ),
      true => Center(
        child: Text("Giảng viên chưa đăng ký giảng dạy học phần nào"),
      ),
    };

    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: context.gutter,
        children: [
          SearchAnchor(
            suggestionsBuilder: (context, controller) async {
              final db = await ref.read(mainDatabaseProvider.future);
              final searchTerm = controller.text;
              if (searchTerm.isEmpty) {
                return [];
              }
              final ids = await db.searchCourses(searchText: searchTerm);

              final suggestions = <Widget>[];
              for (final id in ids) {
                final course = await ref.read(courseByIdProvider(id).future);
                final suggestion = ListTile(
                  title: Text(course.vietnameseName),
                  subtitle: Text("Mã HP: ${course.id}"),
                  onTap: () {
                    notifier.addCourse(course.id);
                    controller.closeView("");
                  },
                );
                suggestions.add(suggestion);
              }
              return suggestions;
            },
            builder: (context, controller) => TextField(
              controller: controller,
              onChanged: (value) {
                controller.text = value;
                controller.openView();
              },
              decoration: const InputDecoration(
                labelText: 'Thêm học phần giảng dạy',
                suffixIcon: Icon(Icons.add),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(child: courseListWidget),
        ],
      ),
    );
  }
}

class _CourseTile extends ConsumerWidget {
  const _CourseTile({
    super.key,
    required this.teacherId,
    required this.courseId,
  });

  final int teacherId;
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseAsync = ref.watch(courseByIdProvider(courseId));
    switch (courseAsync) {
      case AsyncLoading():
        return const ListTile(
          title: Text("Loading..."),
        );
      case AsyncError(:final error):
        return ListTile(
          leading: const Icon(Icons.error),
          title: Text("Lỗi: $error"),
        );
      default:
    }

    final course = courseAsync.value!;
    final notifier = ref.read(
      courseIdsByTeacherProvider(teacherId).notifier,
    );
    void delete() {
      notifier.removeCourse(courseId);
    }

    return ListTile(
      key: ValueKey((teacherId, courseId)),
      title: Text(course.vietnameseName),
      subtitle: Text("Mã HP: ${course.id}"),
      trailing: IconButton(
        icon: const Icon(
          Symbols.delete,
          color: Colors.red,
        ),
        onPressed: delete,
      ),
      onTap: delete,
    );
  }
}

class _TeacherDetailTab extends ConsumerWidget {
  final int teacherId;

  const _TeacherDetailTab({required this.teacherId});

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

    final teacher = teacherAsync.value!;
    final teacherNotifier = ref.read(teacherByIdProvider(teacher.id).notifier);

    final id = teacherId;
    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: ListView(
        children: [
          HeadingListTile(title: "Thông tin cơ bản"),
          tiles_v2.StringTile(
            emptyIsNull: false,
            title: Text("Họ tên"),
            leading: const Icon(Icons.person),
            value: teacher.name,
            validator: (String? v) {
              if (v == null || v.trim().isEmpty) {
                return "Tên không được để trống";
              }
              return null;
            },
            onChanged: withDatabase(
              context: context,
              callback: (db, v) => db.updateTeacher(id: id, name: v),
            ),
          ),

          SingleSelectionTile<Gender>(
            title: "Giới tính",
            leading: const Icon(Icons.male),
            options: Gender.values,
            initialValue: teacher.gender,
            onUpdate: withDatabase(
              context: context,
              callback: (db, v) => db.updateTeacher(id: id, gender: v),
            ),
          ),

          DateTile(
            titleText: "Ngày sinh",
            leading: const Icon(Icons.cake),
            initialValue: teacher.dateOfBirth,
            onUpdate: (value) => teacherNotifier.updateInfo(dateOfBirth: value),
          ),

          EnumTile<Pronoun>(
            title: Text("Xưng hô"),
            leading: const Icon(Icons.record_voice_over),
            options: Pronoun.values,
            initialValue: teacher.pronoun,
            onUpdate: withDatabase(
              context: context,
              callback: (db, v) => db.updateTeacher(id: id, pronoun: v),
            ),
          ),

          // Thông tin công tác
          HeadingListTile(title: "Thông tin công tác"),
          if (!teacher.isOutsider)
            StringTile(
              title: "Mã cán bộ",
              leading: const Icon(Icons.card_membership),
              initialValue: teacher.staffId ?? "N/A",
              onUpdate: (value) => teacherNotifier.updateInfo(staffId: value),
            ),
          StringTile(
            title: "Đại học công tác",
            leading: const Icon(Icons.school),
            initialValue: teacher.university ?? notAvailableText,
            onUpdate: (value) => teacherNotifier.updateInfo(university: value),
          ),
          StringTile(
            leading: const Icon(null),
            title: "Khoa/viện",
            initialValue: teacher.falcuty ?? notAvailableText,
            onUpdate: (value) => teacherNotifier.updateInfo(falcuty: value),
          ),
          StringTile(
            title: "Chuyên ngành",
            leading: const Icon(null),
            initialValue: teacher.specialization ?? notAvailableText,
            onUpdate: (value) => teacherNotifier.updateInfo(
              specialization: value,
            ),
          ),
          IntegerTile(
            title: "Năm bắt đầu công tác",
            leading: const Icon(null),
            initialValue: teacher.startTeachingYear ?? 0,
            onUpdate: (value) => teacherNotifier.updateInfo(
              startTeachingYear: value,
            ),
          ),

          SingleSelectionTile<AcademicRank>(
            options: AcademicRank.values,
            title: "Học hàm",
            leading: const Icon(null),
            initialValue: teacher.academicRank,
            onUpdate: (rank) => teacherNotifier.updateInfo(academicRank: rank),
          ),
          SingleSelectionTile<AcademicDegree>(
            title: "Học vị",
            leading: const Icon(null),
            options: AcademicDegree.values,
            initialValue: teacher.academicDegree,
            onUpdate: (degree) =>
                teacherNotifier.updateInfo(academicDegree: degree),
          ),

          // Thông tin liên hệ
          HeadingListTile(title: "Thông tin liên hệ"),
          StringTile(
            title: "Email",
            leading: const Icon(Icons.email),
            initialValue: teacher.emails.join(", "),
            onUpdate: (value) => teacherNotifier.updateInfo(
              email: value,
            ),
          ),
          StringTile(
            title: "Số điện thoại",
            leading: const Icon(Icons.phone),
            initialValue: teacher.phoneNumber ?? notAvailableText,
            onUpdate: (value) => teacherNotifier.updateInfo(phoneNumber: value),
          ),

          // Thông tin thanh toán
          // Mã số thuế, tài khoản ngân hàng, tên ngân hàng, chi nhánh
          HeadingListTile(title: "Thông tin thanh toán"),
          StringTile(
            title: "Tài khoản ngân hàng",
            leading: const Icon(Icons.account_balance_wallet),
            initialValue: teacher.bankAccount ?? notAvailableText,
            onUpdate: (value) => teacherNotifier.updateInfo(bankAccount: value),
          ),
          StringTile(
            title: "Tên ngân hàng",
            leading: const Icon(Icons.location_city),
            initialValue: teacher.bankName ?? notAvailableText,
            onUpdate: (value) => teacherNotifier.updateInfo(bankName: value),
          ),
          StringTile(
            title: "Mã số thuế (cũ)",
            leading: const Icon(Icons.account_balance),
            initialValue: teacher.deprecatedTaxCode ?? notAvailableText,
            onUpdate: (value) => teacherNotifier.updateInfo(
              deprecatedTaxCode: value,
            ),
          ),
          StringTile(
            title: "CCCD",
            leading: const Icon(Icons.person),
            initialValue: teacher.citizenId ?? notAvailableText,
            onUpdate: (value) => teacherNotifier.updateInfo(citizenId: value),
          ),
        ],
      ),
    );
  }
}

ValueChanged<T> withDatabase<T>({
  required BuildContext context,
  required Function(AppDatabase, T) callback,
}) {
  final ref = ProviderScope.containerOf(context);
  wrappedCallback(T value) async {
    final db = await ref.read(mainDatabaseProvider.future);
    callback(db, value);
  }

  return wrappedCallback;
}
