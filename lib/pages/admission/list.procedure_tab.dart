part of 'list.dart';

typedef _ProcedureStepGroup = ({String name, List<_ProcedureStep> steps});
typedef _ProcedureStep = ({String name, String description});

final _procedureGroups = <_ProcedureStepGroup>[
  (
    name: "Kiểm tra hồ sơ",
    steps: [
      (
        name: "Tiếp nhận",
        description:
            "Hồ sơ được tiếp nhận từ trang SDH, đôi lúc ứng viên có thể gửi trực tiếp để kiểm tra trước",
      ),
      (
        name: "Kiểm tra ngành",
        description: """Ngành đúng:
- Toán, Toán-Tin, Toán ứng dụng, Toán kinh tế, Sư phạm Toán 
- Khoa học máy tính, Khoa học dữ liệu
- Hệ thống thông tin quản lý, Công nghệ thông tin.

Ngành gần đúng:
- Điện, Điện tử viễn thông
- Cơ tin, Cơ điện tử, Kỹ thuật điện tử
- Kinh tế công nghiệp
- Tự động hóa
- Vật lý kỹ thuật
""",
      ),
      (
        name: "Kiểm tra diện xét tuyển",
        description: """Tích hợp cử nhân - thạc sĩ:
- Tốt nghiệp Toán - Tin, Đại học Bách khoa Hà Nội
- Làm đồ án nghiên cứu cử nhân

Trường hợp còn lại là diện phỏng vấn xét tuyển.""",
      ),
      (
        name: "Phỏng vấn xét tuyển",
        description:
            "Thực hiện phỏng vấn để đánh giá kỹ năng và kiến thức của ứng viên.\n"
            "Ghi chú kết quả phỏng vấn và nhận xét từ người phỏng vấn.",
      ),
    ],
  ),
  (
    name: "Nhập học",
    steps: [
      (
        name: "Nhập học",
        description:
            "Xác nhận nhập học cho các ứng viên trúng tuyển.\n"
            "Cung cấp thông tin về các bước tiếp theo.",
      ),
      (
        name: "Thanh toán",
        description:
            "Hướng dẫn quy trình thanh toán học phí và các khoản liên quan.\n"
            "Cung cấp biên lai hoặc xác nhận thanh toán cho sinh viên.",
      ),
    ],
  ),
];

/// Information only page
/// State are only for widgets
class _AdmissionProcedureTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdmissionProcedureTabViewState();
}

class _AdmissionProcedureTabViewState
    extends State<_AdmissionProcedureTabView> {
  int currentStep = 0;

  void onStepContinue() {
    if (currentStep < 3) {
      setState(() {
        currentStep = currentStep + 1;
      });
    }
  }

  void onStepPrevious() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1;
      });
    }
  }

  void onStepTapped(int step) {
    setState(() {
      currentStep = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stepper(
      currentStep: currentStep,
      onStepTapped: onStepTapped,
      onStepContinue: onStepContinue,
      onStepCancel: onStepPrevious,
      controlsBuilder: controlsBuilder,
      steps: [
        for (final group in _procedureGroups)
          Step(
            title: Text(group.name),
            content: ListBody(
              children: [
                for (final (i, step) in group.steps.indexed) ...[
                  if (i > 0) Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(step.name),
                    subtitle: Text(step.description),
                    titleAlignment: ListTileTitleAlignment.top,
                    leading: CircleAvatar(
                      child: Text("${i + 1}", style: textTheme.labelLarge),
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  Widget controlsBuilder(BuildContext context, ControlsDetails details) {
    final isLastStep = currentStep == 3;
    return Padding(
      padding: EdgeInsets.only(top: context.gutter),
      child: Row(
        spacing: context.gutter,
        children: [
          if (currentStep > 0)
            OutlinedButton.icon(
              onPressed: details.onStepCancel,
              icon: Icon(Symbols.arrow_back),
              label: Text("Quay lại"),
            ),
          if (!isLastStep)
            FilledButton.icon(
              onPressed: details.onStepContinue,
              icon: Icon(Symbols.arrow_forward),
              label: Text("Tiếp tục"),
            ),
        ],
      ),
    );
  }
}
