import '../../business/copy_pasta.dart'
    show Email, EmailCopyDialog;
import '../../business/db_v2_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../custom_widgets.dart';
import '_download.dart';
import '_forms.dart';
import 'admission_pages.dart';
import 'providers.dart';
import 'widgets.dart';

class _AddButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(Symbols.add),
      title: Text("Thêm thủ công"),
      trailing: Icon(Symbols.chevron_right),
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdmissionEditPage(),
          ),
        );
      },
    );
  }
}

class AdmissionActionTabView extends ConsumerStatefulWidget {
  const AdmissionActionTabView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdmissionActionTabViewState();
}

class _AdmissionActionTabViewState
    extends ConsumerState<AdmissionActionTabView> {
  final expansionState = List.generate(4, (_) => true);

  @override
  Widget build(BuildContext context) {
    final sectionPadding = EdgeInsets.symmetric(
      vertical: context.gutter,
      horizontal: context.gutterSmall,
    );
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          /// Add panel
          FramedSection(
            title: "Thêm hồ sơ",
            padding: sectionPadding,
            child: ListBody(
              children: [
                ListTile(title: _AddButton()),
                ListTile(title: _ImportButton()),
              ],
            ),
          ),

          /// Download panel
          FramedSection(
            title: "Tải hồ sơ",
            padding: EdgeInsets.all(context.gutter),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: context.gutter,
              children: [
                CouncilSelector(),
                _SaveDirectoryPicker(),
                Row(
                  spacing: context.gutter,
                  children: [
                    Expanded(child: _SavePaperworkButton()),
                    Expanded(child: _ProfileDownloadButton()),
                  ],
                ),
              ],
            ),
          ),

          /// Interview
          FramedSection(
            title: "Phỏng vấn",
            padding: sectionPadding,
            child: ListBody(
              children: [
                _InterviewLocationInput(),
                _InterviewTimeInput(),
                InterviewEmailSender(
                  builder: (context, callback) => ListTile(
                    leading: const Icon(Symbols.email),
                    subtitle: const Text(
                      "Gửi email mời phỏng vấn đến học viên",
                    ),
                    title: Text("Email mời phỏng vấn"),
                    trailing: const Icon(Symbols.send),
                    onTap: callback,
                  ),
                ),
                EmailBuilder(
                  emailProvider: ruleBriefingEmailProvider,
                  builder: (context, email) => ListTile(
                    leading: const Icon(Symbols.email),
                    subtitle: const Text(
                      "Gửi email mời phổ biến quy chế cho học viên tích hợp",
                    ),
                    title: Text("Email mời nghe phổ biến quy chế"),
                    trailing: const Icon(Symbols.send),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => EmailCopyDialog(email: email),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          /// Enroll
          FramedSection(
            title: "Nhập học",
            padding: sectionPadding,
            child: ListBody(
              children: [
                ListTile(
                  leading: Icon(Symbols.group),
                  title: CohortSelector(),
                ),
                AcceptanceEmailSender(
                  builder: (context, sendEmail) => ListTile(
                    leading: Icon(Symbols.email),
                    title: Text("Email trúng tuyển"),
                    subtitle: Text(
                      "Thông báo sau khi có quyết định trúng tuyển",
                    ),
                    trailing: Icon(Symbols.send),
                    onTap: sendEmail,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void expansionCallback(int panelIndex, bool isExpanded) {
    setState(() {
      expansionState[panelIndex] = isExpanded;
    });
  }
}

class _ImportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return ListTile(
      leading: const Icon(Symbols.upload),
      title: Text("Nhập từ JSON"),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () async {
        await navigator.push(
          MaterialPageRoute(
            builder: (context) => AdmissionImportPage(),
          ),
        );
      },
    );
  }
}

class _InterviewLocationInput extends ConsumerWidget {
  void onChanged(WidgetRef ref, String value) {
    final notifier = ref.read(interviewLocationProvider.notifier);
    notifier.set(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(interviewLocationProvider);
    switch (locationState) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError():
        return const Text("Lỗi tải dữ liệu.");
      default:
    }

    final location = locationState.value!;
    return TextFormField(
      initialValue: location,
      decoration: InputDecoration(
        hintText: "Phòng D3-106b",
        labelText: "Địa điểm phỏng vấn",
        suffixIcon: Icon(Symbols.location_on),
      ),
      onChanged: debouncedValueChanged(
        callback: (text) => onChanged(ref, text),
        duration: Duration(milliseconds: 300),
      ),
      onFieldSubmitted: (value) async {
        final notifier = ref.read(interviewLocationProvider.notifier);
        await notifier.set(value);
      },
    );
  }
}

class _ProfileDownloadButton extends StatelessWidget {
  const _ProfileDownloadButton();

  void onPressed(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final ref = ProviderScope.containerOf(context);
    // Fetch students
    final admissionIds = await ref.read(admissionStudentIdsProvider.future);
    final students = <StudentData>[];
    for (final id in admissionIds) {
      final student = await ref.read(studentByIdProvider(id).future);
      if (student.admissionType == AdmissionType.interview) {
        students.add(student);
      }
    }

    final saveDirectory = ref.read(downloadDirectoryProvider);

    if (saveDirectory == null || saveDirectory.isEmpty) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text("Vui lòng chọn thư mục lưu hồ sơ."),
        ),
      );
      return;
    }

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          "Đang tải hồ sơ xét tuyển",
        ),
      ),
    );

    for (final student in students) {
      await downloadAdmissionFiles(
        admissionId: student.admissionId!,
        studentName: student.name,
        saveDirectory: saveDirectory,
      );
      messenger.clearSnackBars();
      messenger.showMessage("Đã tải hồ sơ ${student.name}");
    }

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          "Đã tải ${students.length} hồ sơ học viên",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressed(context),
      child: Text("Tải hồ sơ"),
    );
  }
}

class _SaveDirectoryPicker extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DirectoryPicker(
      name: "thu-muc-luu-ho-so-xet-tuyen-ths",
      labelText: "Thư mục lưu hồ sơ",
      onDirectorySelected: (directory) {
        final notifier = ref.read(downloadDirectoryProvider.notifier);
        notifier.set(directory);
      },
    );
  }
}

class _SavePaperworkButton extends ConsumerWidget {
  const _SavePaperworkButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);

    final studentState = ref.watch(admissionListViewModelProvider);
    switch (studentState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return const Center(child: Text("Lỗi tải dữ liệu."));
      default:
    }

    final students = studentState.value!.admissionList;

    void callback() async {
      final saveDirectory = ref.read(downloadDirectoryProvider);
      final councilModel = await ref.read(
        admissionCouncilSelectionProvider.future,
      );
      final council = councilModel.selected;

      if (saveDirectory == null || saveDirectory.isEmpty) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text("Vui lòng chọn thư mục lưu hồ sơ."),
          ),
        );
        return;
      }

      if (council == null) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text("Vui lòng chọn tiểu ban xét tuyển."),
          ),
        );
        return;
      }

      saveAdmissionForms(
        ref: ref,
        saveDirectory: saveDirectory,
        candidates: students,
        council: council,
      );

      messenger.showSnackBar(
        SnackBar(
          content: Text(
            "Đã lưu biên bản xét tuyển",
          ),
        ),
      );
    }

    return OutlinedButton(
      onPressed: callback,
      child: Text("Lưu biên bản"),
    );
  }
}

class _InterviewTimeInput extends ConsumerWidget {
  static Future<DateTime?> pickDateTime(
    BuildContext context,
    DateTime? initial,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return null;

    if (context.mounted == false) return null;

    final time = await showTimePicker(
      context: context,
      initialTime: initial != null
          ? TimeOfDay(hour: initial.hour, minute: initial.minute)
          : TimeOfDay.now(),
    );

    if (time == null) return null;

    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interviewTimeAsync = ref.watch(interviewDateTimeProvider);
    switch (interviewTimeAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError():
        return const Text("Lỗi tải dữ liệu.");
      default:
    }

    final interviewTime = interviewTimeAsync.value;
    final interviewTimeText = switch (interviewTime) {
      null => "Chưa đặt",
      final time => DateFormat("HH:mm - dd/MM/yyyy").format(time),
    };

    return ListTile(
      leading: const Icon(Symbols.schedule),
      title: Text("Thời gian phỏng vấn"),
      trailing: Icon(Symbols.edit),
      onTap: () async {
        final newTime = await pickDateTime(context, interviewTime);
        if (newTime != null) {
          final notifier = ref.read(interviewDateTimeProvider.notifier);
          notifier.set(newTime);
        }
      },
      subtitle: Text(interviewTimeText),
    );
  }
}

class EmailBuilder extends ConsumerWidget {
  final Widget Function(BuildContext context, Email email) builder;
  final FutureProvider<Email> emailProvider;

  const EmailBuilder({
    super.key,
    required this.builder,
    required this.emailProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailAsync = ref.watch(emailProvider);
    switch (emailAsync) {
      case AsyncLoading():
        return const LinearProgressIndicator();
      case AsyncError(:final error, :final stackTrace):
        print(stackTrace);
        return Text("Lỗi tải dữ liệu. $error");
      default:
    }

    final email = emailAsync.value!;
    return builder(context, email);
  }
}
