// TODO: refactor
import 'package:fami_tools/business/copy_pasta.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers/database.dart';
import '../../business/db_v2_providers/thesis.dart';
import '../../business/documents.dart';
import '../../business/main_database.dart';
import '../../business/view_models.dart';
import '../../custom_widgets.dart';
import '../../shortcuts.dart';
import '../pages.dart';
import '../thesis_pages/payment_page.dart';
import 'providers.dart';

class ThesisEverythingPage extends StatelessWidget {
  static const String routeName = '/thesis';
  const ThesisEverythingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavigationTile(
        leading: const Icon(Symbols.checklist),
        title: "Danh sách đề tài",
        callback: (nav) => nav.toThesisListPage(),
      ),
      _NavigationTile(
        leading: const Icon(Symbols.assignment),
        title: "Giao đề tài",
        callback: (nav) => nav.toThesisAssignmentPage(),
      ),
      _NavigationTile(
        leading: const Icon(Symbols.school),
        title: "Bảo vệ luận văn",
        callback: (nav) => nav.toThesisDefenseRegisterPage(),
      ),
      ListTile(
        leading: const Icon(Symbols.currency_exchange),
        trailing: const Icon(Symbols.chevron_right),
        title: Text("Thanh toán chấm luận văn"),
        onTap: () {
          Navigator.pushNamed(
            context,
            ThesisDefensePaymentPage.routeName,
          );
        },
      ),
    ];

    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text('Luận văn thạc sĩ'),
        ),
      ),
      body: CommonShortcuts(
        child: ConstrainedBody(
          child: Padding(
            padding: EdgeInsets.all(context.gutter),
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) => items[index],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationTile extends StatelessWidget {
  final Widget? leading;
  final Widget? subtitle;
  final String title;
  final Function(AppNavigator) callback;

  const _NavigationTile({
    this.leading,
    this.subtitle,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: subtitle,
      trailing: const Icon(Symbols.chevron_right),
      onTap: () {
        final router = AppNavigator(context);
        callback(router);
      },
    );
  }
}

class ThesisDefenseRegisterPage extends StatelessWidget {
  static const routeName = "/thesis/defense/register";
  const ThesisDefenseRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ConstrainedAppBar(
          withTabBar: true,
          child: AppBar(
            title: const Text('Bảo vệ luận văn'),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "Nộp hồ sơ"),
                Tab(text: "Quản trị"),
                Tab(text: "Thông tin"),
              ],
            ),
          ),
        ),
        body: CommonShortcuts(
          child: ConstrainedBody(
            child: TabBarView(
              children: [
                _ApplyTab(),
                _ModerateTab(),
                _InfomationTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ModerateTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final saveDirectory = useState<String?>(null);

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          FramedSection(
            title: "Chuẩn bị hồ sơ",
            padding: EdgeInsets.all(context.gutter),
            child: Column(
              spacing: context.gutterSmall,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    final pdfAsync = ref.watch(scoreSheetsPdfProvider);
                    return _PdfPreviewButton(
                      title: "Phiếu điểm bảo vệ luận văn",
                      pdfAsync: pdfAsync,
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final pdfAsync = ref.watch(councilSuggestionsPdfProvider);
                    return _PdfPreviewButton(
                      title: "Đề xuất hội đồng chấm luận văn",
                      pdfAsync: pdfAsync,
                    );
                  },
                ),

                DirectoryPicker(
                  name: "ho-so-bao-ve-luan-van",
                  labelText: "Thư mục lưu",
                  onDirectorySelected: (directory) {
                    saveDirectory.value = directory;
                  },
                ),

                Consumer(
                  builder: (context, ref, child) => OutlinedButton.icon(
                    label: Text("Lưu hồ sơ bảo vệ"),
                    icon: Icon(Symbols.download),
                    onPressed: () async {
                      final directory = saveDirectory.value;
                      if (directory == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Vui lòng chọn thư mục lưu trước khi lưu hồ sơ",
                            ),
                          ),
                        );
                        return;
                      }

                      final pdfFiles = await Future.wait([
                        ref.read(scoreSheetsPdfProvider.future),
                        ref.read(councilSuggestionsPdfProvider.future),
                      ]);

                      final docxFiles = [
                        ...(await ref.read(
                          councilDecisionDocxFilesProvider.future,
                        )),
                      ];

                      for (final docx in docxFiles) {
                        await docx.save(directory: directory);
                      }
                      for (final pdf in pdfFiles) {
                        await pdf.save(directory: directory);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Đã lưu hồ sơ bảo vệ luận văn vào $directory",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Thông báo kết thúc
          FramedSection(
            title: "Hoàn thiện",
            padding: EdgeInsets.all(context.gutterSmall),
            child: Column(
              children: [
                () {
                  final msg = [
                    "Chúc mừng các bạn đã bảo vệ luận văn thành công.",
                    "Bước tiếp theo các bạn cần hoàn thiện luận văn theo đóng góp của hội đồng, nộp quyển hoàn chỉnh về Thư viện và về Khoa.",
                    "",
                    "Hướng dẫn chi tiết các bước các bạn xem trong file PDF nhé.",
                  ].join("\n");
                  return ListTile(
                    titleAlignment: .titleHeight,
                    title: Text("Thông báo hoàn tất"),
                    subtitle: Text(msg),
                    trailing: OutlinedButton(
                      child: Text("Copy"),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: msg));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Đã sao chép thông báo vào clipboard",
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.gutterSmall,
                  ),
                  child: Divider(),
                ),
                _FinishingEmailButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FinishingEmailButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailAsync = ref.watch(thesisFinishingEmailProvider);
    switch (emailAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ListTile(
          title: Text("Lỗi tạo email: $error"),
          enabled: false,
        );
      default:
    }

    final email = emailAsync.value!;
    return ListTile(
      title: Text("Gửi thông báo tính GD"),
      subtitle: Text(
        "Gửi email cho giảng viên hướng dẫn chọn kỳ kết thúc và kỳ tính GD",
      ),
      trailing: Icon(Symbols.send),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => EmailCopyDialog(
            email: email,
          ),
        );
      },
    );
  }
}

class _PdfPreviewButton extends StatelessWidget {
  final String title;
  final AsyncValue<PdfFile> pdfAsync;
  const _PdfPreviewButton({
    required this.title,
    required this.pdfAsync,
  });

  @override
  Widget build(BuildContext context) {
    switch (pdfAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ListTile(
          title: Text("Lỗi tải PDF: $error"),
          enabled: false,
        );
      default:
    }

    final nav = AppNavigator(context);
    final pdf = pdfAsync.value!;

    return ListTile(
      title: Text(title),
      trailing: Icon(Symbols.chevron_right),
      onTap: () => nav.toPdfPreviewPage(
        title: pdf.name,
        sourceName: pdf.fileName,
        pdfData: pdf.bytes,
      ),
    );
  }
}

class _ApplyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _StudentSearchAdd(),
          Expanded(child: _StudentListView()),
        ],
      ),
    );
  }
}

class _StudentListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentIdsAsync = ref.watch(registeredStudentIdsProvider);
    switch (studentIdsAsync) {
      case AsyncLoading<List<int>>():
        return LinearProgressIndicator();
      case AsyncError<List<int>>():
        return Center(
          child: Text("Lỗi tải danh sách học viên: ${studentIdsAsync.error}"),
        );
      default:
    }

    final studentIds = studentIdsAsync.value!;

    return FramedSection(
      title: "Học viên đã nộp hồ sơ",
      padding: EdgeInsets.all(context.gutterSmall),
      child: ListView.separated(
        itemCount: studentIds.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final studentId = studentIds[index];
          return _StudentThesisListTile(studentId: studentId);
        },
      ),
    );
  }
}

class _StudentThesisListTile extends ConsumerWidget {
  final int studentId;

  const _StudentThesisListTile({
    required this.studentId,
  });

  void onTapAction(BuildContext context, WidgetRef ref, ThesisData thesis) {
    /// Đi tới trang chi tiết
    final navigator = AppNavigator(context);
    navigator.toThesisDetailsPage(thesisId: thesis.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelAsync = ref.watch(
      ThesisViewModel.providerByStudentId(studentId),
    );
    switch (viewModelAsync) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) print(stackTrace);
        return ListTile(
          title: Text(
            "Lỗi tải dữ liệu học viên $studentId: $error",
          ),
        );
      default:
    }

    final model = viewModelAsync.value!;
    final student = model.student!; // The student cannot be null here
    final thesis = model.thesis;
    final supervisor = model.supervisor;

    return Padding(
      padding: EdgeInsets.all(context.gutterSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${student.cohort} - ${student.name} - ${student.studentId}",
                  style: TextTheme.of(context).titleMedium,
                ),
                SizedBox(height: context.gutterTiny),
                Text(
                  "${thesis.vietnameseTitle}\n"
                  "GVHD: ${supervisor.name}\n"
                  "Trạng thái: ${thesis.defenseStatus.label}",
                ),
              ],
            ),
          ),
          VerticalDivider(),
          IntrinsicWidth(
            child: Column(
              spacing: context.gutterSmall,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () => onTapAction(context, ref, thesis),
                  child: Text("Chi tiết"),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    side: BorderSide(color: Colors.redAccent),
                  ),
                  onPressed: () async {
                    final db = await ref.read(mainDatabaseProvider.future);
                    final stmt = db.thesis.update();
                    stmt.where((s) => s.studentId.equals(student.id));
                    stmt.write(
                      ThesisCompanion(
                        defenseStatus: Value(ThesisStatus.assigned),
                      ),
                    );
                  },
                  child: Text("Bỏ theo dõi"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StudentSearchAdd extends ConsumerWidget {
  Future<List<Widget>> buildSuggestions(
    BuildContext context,
    SearchController controller,
    WidgetRef ref,
  ) async {
    final searchText = controller.text;
    if (searchText.isEmpty) {
      return [
        const ListTile(
          title: Text("Nhập tên học viên để tìm kiếm"),
        ),
      ];
    }

    final db = await ref.read(mainDatabaseProvider.future);
    final students = db
        .searchStudents(
          searchText: controller.text,
          status: StudentStatus.studying,
        )
        .get();

    final results = <(ThesisData, StudentData, TeacherData)>[];
    for (final student in await students) {
      final thesis = await db
          .thesisByStudentId(studentId: student.id)
          .getSingleOrNull();
      if (thesis == null) continue;

      final teacher = await db
          .teacherById(teacherId: thesis.supervisorId)
          .getSingle();
      results.add((thesis, student, teacher));
    }

    return [
      for (final (thesis, student, teacher) in results)
        ListTile(
          title: Text("${student.name} - ${student.studentId}"),
          subtitle: Text("${thesis.vietnameseTitle}\nGVHD: ${teacher.name}"),
          onTap: () {
            final notifier = ref.read(
              thesisByIdProvider(thesis.id).notifier,
            );

            ref.invalidate(registeredStudentIdsProvider);
            notifier.registerForDefense();
            controller.closeView("");
          },
        ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchAnchor(
      suggestionsBuilder: (context, controller) {
        return buildSuggestions(context, controller, ref);
      },
      builder: (context, controller) => OutlinedButton(
        onPressed: () => controller.openView(),
        child: Text("Thêm học viên"),
      ),
    );
  }
}

class _InfomationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          FramedSection(
            title: "Hồ sơ học viên nộp",
            padding: EdgeInsets.all(context.gutterSmall),
            child: Column(
              children: [
                ListTile(
                  leading: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Text("1"),
                    ),
                  ),
                  title: Text("Lý lịch khoa học"),
                  subtitle: Text("Theo mẫu chính thức"),
                ),
                ListTile(
                  title: Text("Quyển luận văn & tóm tắt"),
                  subtitle: Text("Kiểm tra quy cách rồi trả học viên"),
                ),
                ListTile(
                  title: Text("Giấy nhận xét của giảng viên hướng dẫn"),
                  subtitle: Text("In từ hệ thống quản lý đào tạo"),
                ),
                ListTile(
                  title: Text("Chứng chỉ tiếng Anh"),
                  subtitle: Text("Bản sao có công chứng"),
                ),
                ListTile(
                  title: Text("Giấy chỉnh sửa tên đề tài (nếu có)"),
                  subtitle: Text("Đổi tên trên hệ thống"),
                ),
              ],
            ),
          ),

          // Tiếng Anh
          FramedSection(
            title: "Kiểm tra tiếng Anh",
            padding: EdgeInsets.all(context.gutterSmall),
            child: Column(
              children: [
                ListTile(
                  title: Text("Gửi danh sách học viên + khóa cho BĐT"),
                  subtitle: Text("Để kiểm tra hậu kiểm tiếng Anh"),
                ),
                ListTile(
                  title: Text("Trả hồ sơ nếu chưa hậu kiểm"),
                ),
              ],
            ),
          ),

          // Gửi BĐT
          FramedSection(
            title: "Bước gửi hồ sơ lên Ban Đào tạo",
            padding: EdgeInsets.all(context.gutterSmall),
            child: Column(
              children: [
                ListTile(
                  title: Text("Giấy đề xuất hội đồng"),
                  subtitle: Text("Theo mẫu chính thức"),
                ),
                ListTile(
                  title: Text("Nhập hội đồng lên hệ thống quản lý"),
                ),
                ListTile(
                  title: Text("Gửi hồ sơ lên BĐT"),
                ),
                ListTile(
                  title: Text("Nhận bảng điểm có chữ ký nháy"),
                ),
                ListTile(
                  title: Text("Tải quyết định thành lập hội đồng"),
                  subtitle: Text("Từ hệ thống tác nghiệp"),
                ),
                ListTile(
                  title: Text("Đăng quyết định lên BK Office trình ký"),
                  subtitle: Text(
                    "Trưởng Khoa ký, Ban Đào tạo & Tài chính kế hoạch xem để biết",
                  ),
                ),
                ListTile(
                  title: Text("Sau khi quyết định ký"),
                  subtitle: Text(
                    "Gửi QĐ cho học viên, GHVD, nhập lên hệ thống quản lý",
                  ),
                ),
              ],
            ),
          ),

          // Bảo vệ
          FramedSection(
            title: "Hồ sơ gửi thư ký",
            padding: EdgeInsets.all(context.gutterSmall),
            child: Column(
              children: [
                ListTile(
                  title: Text("Bảng thanh toán chấm luận văn"),
                  subtitle: Text("In từ hệ thống, nhập số QĐ trước khi tải"),
                ),
                ListTile(
                  title: Text("Quyết định thành lập hội đồng"),
                  subtitle: Text("In từ văn thư"),
                ),
                ListTile(
                  title: Text("Phiếu chấm điểm luận văn"),
                  subtitle: Text("Có dấu treo của Khoa"),
                ),
                ListTile(
                  title: Text("Biên bản họp hội đồng"),
                  subtitle: Text("Theo mẫu SĐH"),
                ),
                ListTile(
                  title: Text("Biên bản kiểm phiếu"),
                  subtitle: Text("Theo mẫu SĐH"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
