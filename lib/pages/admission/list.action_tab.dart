part of 'list.dart';

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

class _AdmissionActionTabView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdmissionActionTabViewState();
}

class _AdmissionActionTabViewState
    extends ConsumerState<_AdmissionActionTabView> {
  final expansionState = List.generate(4, (_) => true);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: ExpansionPanelList(
        expansionCallback: expansionCallback,
        children: [
          /// Add panel
          ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: expansionState[0],
            headerBuilder: _simpleExpansionHeading("Thêm hồ sơ"),
            body: ListBody(
              children: [
                ListTile(title: _AddButton()),
                ListTile(title: _ImportButton()),
              ],
            ),
          ),

          /// Download panel
          ExpansionPanel(
            isExpanded: expansionState[1],
            canTapOnHeader: true,
            headerBuilder: _simpleExpansionHeading(
              "Tải hồ sơ",
            ),
            body: ListBody(
              children: [
                ListTile(title: CouncilSelector()),
                ListTile(title: _SaveDirectoryPicker()),
                _SavePaperworkButton(),
                _ProfileDownloadButton(),
              ],
            ),
          ),

          /// Interview
          ExpansionPanel(
            isExpanded: expansionState[2],
            canTapOnHeader: true,
            headerBuilder: _simpleExpansionHeading("Mời phỏng vấn"),
            body: ListBody(
              children: [
                ListTile(
                  leading: const Icon(Symbols.location_on),
                  title: _InterviewLocationInput(),
                  trailing: const Icon(Symbols.edit),
                ),
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
              ],
            ),
          ),

          /// Enroll
          ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: expansionState[3],
            headerBuilder: _simpleExpansionHeading(
              "Báo trúng tuyển",
            ),
            body: ListBody(
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
        border: InputBorder.none,
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

class _ProfileDownloadButton extends ConsumerWidget {
  const _ProfileDownloadButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    return ListTile(
      leading: const Icon(Symbols.download),
      title: Text("Tải hồ sơ"),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () async {
        // Fetch students
        final admissionIds = await ref.read(admissionStudentIdsProvider.future);
        final students = <StudentData>[];
        for (final id in admissionIds) {
          final student = await ref.read(studentByIdProvider(id).future);
          if (student != null) {
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
              "Đã lưu ${students.length} hồ sơ vào thư mục $saveDirectory",
            ),
          ),
        );

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
            name: student.name,
            outputDirectory: saveDirectory,
          );
        }

        messenger.showSnackBar(
          SnackBar(
            content: Text(
              "Đã tải hồ sơ học viên",
            ),
          ),
        );
      },
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

    return ListTile(
      leading: const Icon(Symbols.save),
      title: Text("Lưu mẫu biên bản"),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () async {
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
      },
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
