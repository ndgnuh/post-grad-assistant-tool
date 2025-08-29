import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show rootBundle, Clipboard, ClipboardData;
import 'package:intl/intl.dart';
import 'package:yaml/yaml.dart';

import './../custom_widgets.dart';
import './domain_objects.dart';
import './../shortcuts.dart';

@immutable
class Email {
  final String subject;
  final String body;
  final Set<String> recipients;
  final Set<String> ccRecipients;
  final Set<String> bccRecipients;

  const Email({
    this.subject = "",
    this.body = "",
    this.recipients = const {},
    this.ccRecipients = const {},
    this.bccRecipients = const {},
  });

  void copySubject() => Clipboard.setData(ClipboardData(text: subject));

  void copyBody() => Clipboard.setData(ClipboardData(text: body));

  void copyRecipients() =>
      Clipboard.setData(ClipboardData(text: recipients.join(' ')));

  void copyCcRecipients() =>
      Clipboard.setData(ClipboardData(text: ccRecipients.join(' ')));

  void copyBccRecipients() =>
      Clipboard.setData(ClipboardData(text: bccRecipients.join(' ')));
}

class EmailCopyDialog extends StatelessWidget {
  final Email email;

  EmailCopyDialog.fromTemplate({
    super.key,
    String subject = "",
    String body = "",
    Set<String> recipients = const {},
    Set<String> ccRecipients = const {},
    Set<String> bccRecipients = const {},
  }) : email = Email(
         subject: subject,
         body: body,
         recipients: recipients,
         ccRecipients: ccRecipients,
         bccRecipients: bccRecipients,
       );

  const EmailCopyDialog({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final copyDelim = '\n';
    return SimpleDialog(
      title: Row(
        children: [
          Expanded(child: Text("Click để copy")),
          CloseButton(),
        ],
      ),
      children: [
        ListTile(
          title: Text("Người nhận"),
          subtitle: Text(email.recipients.join('\n')),
          trailing: Icon(Icons.copy),
          onTap: () => copyToClipboard(
            context: context,
            text: email.recipients.join(copyDelim),
            notification: "Đã sao chép người nhận email.",
          ),
        ),
        if (email.ccRecipients.isNotEmpty)
          ListTile(
            title: Text("CC"),
            subtitle: Text(email.ccRecipients.join('\n')),
            trailing: Icon(Icons.copy),
            onTap: () => copyToClipboard(
              context: context,
              text: email.ccRecipients.join(copyDelim),
              notification: "Đã sao chép người nhận CC email.",
            ),
          ),
        if (email.bccRecipients.isNotEmpty)
          ListTile(
            title: Text("BCC"),
            subtitle: Text(email.bccRecipients.join('\n')),
            trailing: Icon(Icons.copy),
            onTap: () => copyToClipboard(
              context: context,
              text: email.bccRecipients.join(copyDelim),
              notification: "Đã sao chép người nhận BCC email.",
            ),
          ),
        ListTile(
          title: Text("Tiêu đề"),
          subtitle: Text(email.subject),
          trailing: Icon(Icons.copy),
          onTap: () => copyToClipboard(
            context: context,
            text: email.subject,
            notification: "Đã sao chép tiêu đề email.",
          ),
        ),
        ListTile(
          title: Text("Nội dung"),
          trailing: Icon(Icons.copy),
          subtitle: Text(email.body),
          onTap: () => copyToClipboard(
            text: email.body,
            context: context,
            notification: "Đã sao chép nội dung email.",
          ),
        ),
      ],
    );
  }
}

void copyAdmissionEnrollmentConfirmation() {
  final text = """
[Thông báo] Về chương trình thạc sĩ Toán Tin

Chào các bạn ứng viên,

Mình là Hùng, trợ lý đào tạo sau đại học của khoa Toán - Tin. Chúc mừng các bạn trúng tuyển chương trình Thạc sĩ Toán - Tin. Ban Đào tạo sẽ gửi email nhập học cho các bạn.

Sau khi thực hiện các thủ tục nhập học xong, các bạn phản hồi lại cho mình qua email những thông tin sau để phục vụ cho công tác quản lý:

- Họ tên đầy đủ,
- Mã học viên,
- Mã lớp quản lý/tên khóa,
- Email học viên (email với đuôi sis.hust.edu.vn).

Ngoài ra, các bạn tham gia nhóm Zalo học viên ở dưới để tiện cho việc nhận thông báo và phổ biến công việc. Các bạn nếu gặp vấn đề gì trong quá trình nhập học cũng có thể liên hệ với mình thông qua email này.

Link nhóm Zalo: TBA""";
  copyToClipboard(text: text, notification: "Đã sao chép thông báo nhập học.");
}

void copyAdmissionInterviewInvitation() {
  final text = """
[Thông báo] Về phỏng vấn xét tuyển chương trình Thạc sĩ Toán Tin

Chào các bạn ứng viên,

Mình là Hùng, trợ lý đào tạo sau đại học của Khoa Toán - Tin, Đại học Bách khoa Hà Nội.

Chúc mừng hồ sơ của bạn đã đạt điều kiện của chương trình Thạc sĩ Toán Tin. Bước tiếp theo để nhập học là phỏng vấn xét tuyển.
Mời bạn đến phỏng vấn xét tuyển vào:

- Thời gian: <TBA>
- Địa điểm: <TBA>, Đại học Bách khoa Hà Nội

Các bạn xác nhận tham gia phỏng vấn bằng cách trả lời email này với tiêu đề "Xác nhận tham gia phỏng vấn - [Họ và tên]" giúp mình nhé.
Cảm ơn các bạn.""";

  copyToClipboard(text: text, notification: "Đã sao chép lời mời phỏng vấn.");
}

void copyNhacNhoNopDiem({required BuildContext context, required HocKy hocKy}) {
  final tenDotHoc = hocKy.hocKy;
  final ngayKetThucHoc = toDmy(hocKy.ketThucHoc);

  final text =
      """
[Thông báo] Nộp điểm cao học đợt học $tenDotHoc

Kính gửi các Thầy, các Cô,

Ngày $ngayKetThucHoc là ngày kết thúc của đợt học $tenDotHoc.
Thầy, Cô tổ chức cho học viên thi và gửi hai bảng điểm cho em trước ngày $ngayKetThucHoc ạ.

Khi cho học viên thi, Thầy, Cô điền luôn ngày thi trên bảng điểm giúp em ạ.

Em cảm ơn Thầy, Cô ạ.""";

  copyToClipboard(text: text, notification: "Đã sao chép nhắc nộp điểm.");
}

/// Quotes a string for pasting in Excel, escaping double quotes
String quoteExcelString(String value) {
  value = value.replaceAll('"', '\\"');
  return "\"$value\"";
}

/// Sanitizes a string to paste into Excel
String sanitizeExcelString(String? value) {
  if (value == null || value.isEmpty) return "";

  if (value.contains('\n')) {
    var parts = value.split('\n');
    parts = [for (final part in parts) quoteExcelString(part)];

    return "=CONCAT(${parts.join(', CHAR(10), ')})";
  }

  return "=${quoteExcelString(value)}";
}

/// Converts a list of lists of strings to a tab-separated string for pasting into Excel
String toExcelPastable(List<List<String>> data) {
  final rows = data
      .map((row) {
        return row.map((cell) => sanitizeExcelString(cell)).join('\t');
      })
      .join('\n');
  return rows;
}

Future<void> copyTeachingAssignment({
  required BuildContext context,
  required HocKy semester,
}) async {
  final courseClasses = await LopTinChi.getBySemester(semester);

  final List<List<String>> classInfoArrs = [];
  final dateFormat = DateFormat('dd/MM/yyyy');
  final fromDay = dateFormat.format(semester.batDauHoc);
  final toDay = dateFormat.format(semester.ketThucHoc);

  for (final (i, courseClass) in courseClasses.indexed) {
    final teacher = await courseClass.giangVien;
    final course = await courseClass.hocPhan;

    final fromDay = dateFormat.format(
      courseClass.customBeginDate ?? semester.batDauHoc,
    );

    final toDay = dateFormat.format(
      courseClass.customEndDate ?? semester.ketThucHoc,
    );

    final fromDayToDay = sanitizeExcelString('$fromDay\n$toDay');

    final tietHoc = switch ((courseClass.tietBatDau, courseClass.tietKetThuc)) {
      (int a, int b) => "=\"$a - $b\"",
      _ => "",
    };

    final note = switch (courseClass.trangThai) {
      TrangThaiLopTinChi.binhThuong => "",
      TrangThaiLopTinChi.huy => "Hủy",
    };

    final dayOfWeek = courseClass.ngayHoc?.toString() ?? "";

    final List<String> row = [
      (i + 1).toString(),
      courseClass.maLopHoc.toString(),
      course.soTinChi.toString(),
      await courseClass.tenLopHoc,
      dayOfWeek.replaceFirst("Thứ ", ""),
      tietHoc.toString(),
      fromDayToDay,
      courseClass.phongHoc?.toString() ?? "",
      teacher?.hoTenChucDanh ?? "",
      teacher?.donVi ?? "",
      sanitizeExcelString(teacher?.sdt),
      note,
    ];
    classInfoArrs.add(row);
  }

  final text = [for (final row in classInfoArrs) row.join('\t')].join('\n');
  copyToClipboard(
    text: text,
    notification: "Đã sao chép thông tin phân công giảng dạy.",
  );
}

void copyThongBaoDangKyHoc({
  required BuildContext context,
  required HocKy hocKy,
}) {
  final ngayMoDangKy = toDmy(hocKy.moDangKy);
  final ngayDongDangKy = toDmy(hocKy.dongDangKy);
  final tenDotHoc = hocKy.hocKy;
  final text =
      """
Đợt học $tenDotHoc mở đăng ký từ $ngayMoDangKy đến $ngayDongDangKy.
Các bạn nhớ đăng ký học đúng thời gian nhé!""";
  copyToClipboard(
    text: text,
    notification: "Đã sao chép thông báo đăng ký học.",
  );
}

void copyThongBaoGiangDay({
  required BuildContext context,
  required HocKy hocKy,
}) {
  final tenDotHoc = hocKy.hocKy;
  final ngayBatDauHoc = toDmy(hocKy.batDauHoc);
  final ngayKetThucHoc = toDmy(hocKy.ketThucHoc);
  final ngayNopDiem = toDmy(hocKy.hanNopDiem);

  final text =
      """
[Thông báo] Về việc giảng dạy cao học đợt học $tenDotHoc

Kính gửi các Thầy, các Cô,

Em gửi danh sách lớp của các lớp cao học của đợt học $tenDotHoc kèm với bảng điểm quá trình và bảng điểm kết thúc học phần. Các lớp sẽ học từ ngày $ngayBatDauHoc đến ngày $ngayKetThucHoc.

Thầy, Cô lưu ý, trong buổi đầu tiên của học phần Thầy, Cô cung cấp đề cương chi tiết và kế hoạch học, thi cho lớp, trong đó xác định rõ:

      - Yêu cầu của học phần,
      - Nhiệm vụ của học viên,
      - Đánh giá kết quả trong số kiểm tra giữa kỳ, thi hết học phần,
      - Tài liệu học tập, tham khảo.

Lịch thi do Thầy, Cô sắp xếp ngay sau khi kết thúc học phần, thời gian thi nằm trong thời gian học của đợt học.

Thầy, Cô cho học viên thi, điền đủ thông tin ngày thi và nộp lại bảng điểm trước ngày $ngayNopDiem giúp em với ạ. Em xin cảm ơn.""";

  copyToClipboard(text: text, notification: "Đã sao chép thông báo học tập.");
}

Future<void> copyThongBaoLopHoc({
  required BuildContext context,
  required HocKy semester,
}) async {
  final courseClasses = await LopTinChi.getBySemester(semester);

  if (courseClasses.isEmpty) {
    ScaffoldMessenger.of(
      context,
    ).showMessage("Không có lớp học nào trong học kỳ này.");
    return;
  }

  final classInfoArrs = [];
  final cancelledClasses = [];
  for (final courseClass in courseClasses) {
    final className = await courseClass.tenLopHoc;
    switch (courseClass.trangThai) {
      case TrangThaiLopTinChi.binhThuong:
        final classUrl = courseClass.urlTruyCap;
        final text = "- $className: $classUrl";
        classInfoArrs.add(text);
      case TrangThaiLopTinChi.huy:
        cancelledClasses.add("- $className");
    }
  }

  final texts = [
    "Mình gửi link truy cập các lớp học của đợt học ${semester.hocKy}:",
    classInfoArrs.join('\n'),
    if (cancelledClasses.isNotEmpty)
      "\nCác lớp dưới đây bị hủy, các bạn liên hệ với Ban Đào tạo (thầy Huy Hùng) để đăng ký vào các lớp khác nhé:",
    if (cancelledClasses.isNotEmpty) cancelledClasses.join('\n'),
  ];

  final text = texts.join('\n');

  copyToClipboard(
    text: text,
    notification: "Đã sao chép thông báo về lớp học.",
  );
}

void copyToClipboard({
  required String text,
  required String notification,
  BuildContext? context,
}) {
  context = context ?? navigationKey.currentContext;
  Clipboard.setData(ClipboardData(text: text));
  final messenger = ScaffoldMessenger.of(context!);
  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(SnackBar(content: Text(notification)));
}

Future<List<CopyPasta>> loadCopyPasta() async {
  String yaml = await rootBundle.loadString("assets/copy-pasta.yaml");
  final data = loadYaml(yaml);
  return [
    for (final json in data)
      CopyPasta(name: json["name"], content: json["content"]),
  ];
}

Future<TeacherPronoun?> showPronounSelection({
  required BuildContext context,
}) async {
  return await showDialog<TeacherPronoun>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Chọn xưng hô"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: TeacherPronoun.values.map((pronoun) {
              return RadioListTile<TeacherPronoun?>(
                value: pronoun,
                groupValue: null,
                title: Text(pronoun.capitalized),
                onChanged: (value) {
                  Navigator.of(context).pop(value);
                },
              );
            }).toList(),
          ),
        ),
      );
    },
  );
}

Future<void> copyThesisAssignment({required List<Thesis> theses}) async {
  // Sort by name
  theses.sort((a, b) {
    final aName = a.giangVien.hoTen.split(" ").first;
    final bName = b.giangVien.hoTen.split(" ").first;
    return aName.compareTo(bName);
  });

  // Copy information rows
  final List<List<String>> rows = [];
  for (final (i, thesis) in theses.indexed) {
    final orderNumbrer = (i + 1).toString();
    final student = thesis.hocVien;
    final supervisor = thesis.giangVien;
    final specializedGroup = await supervisor.specializedGroup;

    rows.add([
      orderNumbrer,
      supervisor.hoTenChucDanh,
      supervisor.donVi ?? "",
      "",
      "",
      thesis.tenTiengViet,
      thesis.tenTiengAnh,
      student?.hoTen ?? "?",
      student?.maHocVien ?? "?",
      "",
      "NCM ${specializedGroup?.tenNhom}",
    ]);
  }

  copyToClipboard(
    text: toExcelPastable(rows),
    notification: "Đã sao chép thông tin phân công luận văn.",
  );
}

void copyAdmissionWrongCategory({required String candidateName}) async {
  // TODO: replace this with a proper settings
  final admissionSite =
      "https://ts.hust.edu.vn/tin-tuc/thong-bao-tuyen-sinh-trinh-do-thac-s-nam-2025";

  final text =
      """
[Thông báo] Hồ sơ Tuyển sinh Thạc sĩ bị nhầm diện tuyển sinh

Thân gửi $candidateName,

Mình là Hùng, trợ lý đào tạo sau đại học của Khoa Toán - Tin, Đại học Bách khoa Hà Nội.

Rất tiếc thông báo rằng hồ sơ của bạn đã được nộp vào sai diện tuyển sinh. Để nằm trong diện tích hợp Cử nhân - Thạc sĩ, hồ sơ của bạn cần phải đạt các điều kiện sau:
- Tốt nghiệp đại học ngành Toán - Tin hoặc Hệ thống Thông tin Quản lý, Đại học Bách khoa Hà Nội,
- Thực hiện đồ án nghiên cứu cử nhân.

Bạn vui lòng chỉnh lại diện hồ sơ của mình trên hệ thống và thực hiện các thủ tục cần thiết theo trang $admissionSite nhé.""";

  copyToClipboard(
    text: text,
    notification: "Đã sao chép thông báo nhầm diện tuyển sinh.",
  );
}

enum AdmissionCondition {
  relatedMajor(
    description: "Tốt nghiệp đại học ngành đúng, ngành gần",
    unmetDescription:
        "Ngành tốt nghiệp đại học không phải ngành đúng hoặc ngành gần",
  ),
  goodDegreeAndAbove(
    description: "Tốt nghiệp đại học loại Khá trở lên",
    unmetDescription: "Bằng đại học không đoạt loại Khá trở lên",
  ),
  qualifiedEnglish(
    description: "Có chứng chỉ tiếng Anh tương đương B1 trở lên",
    unmetDescription: "Không có chứng chỉ tiếng Anh tương đương B1 trở lên",
  );

  final String description;
  final String unmetDescription;
  const AdmissionCondition({
    required this.description,
    required this.unmetDescription,
  });
}

void copyAdmissionRejection({
  required String candidateName,
  required List<AdmissionCondition> unmetConditions,
}) async {
  final reasons = [
    for (final condition in unmetConditions) "- ${condition.unmetDescription}",
  ].join(',\n');

  final text =
      """
[Thông báo] Không đủ điều kiện nhập học

Thân gửi $candidateName,

Mình là Hùng, trợ lý đào tạo sau đại học của Khoa Toán - Tin, Đại học Bách khoa Hà Nội.
Rất tiếc thông báo rằng hồ sơ của bạn không đủ điều kiện để nhập học chương trình Thạc sĩ Toán - Tin.

Lý do hồ sơ của bạn không đủ điều kiện của bạn là:
$reasons.

Mình vẫn để mở hồ sơ trên hệ thống, bạn vẫn có thể cập nhật hồ sơ của bản thân để đủ điều kiện nhập học trong các đợt tuyển sinh sau nhé.""";
  copyToClipboard(
    text: text,
    notification: "Đã sao chép email thông báo không đủ điều kiện nhập học.",
  );
}

String toDmy(DateTime date) {
  final formatter = DateFormat('dd/MM/yyyy');
  final formattedDate = formatter.format(date);
  return formattedDate;
}

class CopyPasta {
  final String name;
  final String content;
  CopyPasta({required this.name, required this.content});

  Future<void> copyToClipboard() async {
    final data = ClipboardData(text: content);
    await Clipboard.setData(data);
  }
}

enum TeacherPronoun {
  anh(pronoun: "anh", capitalized: "Anh", greeting: "Em chào anh"),
  chi(pronoun: "chị", capitalized: "Chị", greeting: "Em chào chị"),
  thay(pronoun: "thầy", capitalized: "Thầy", greeting: "Em thưa thầy"),
  co(pronoun: "cô", capitalized: "Cô", greeting: "Em thưa cô");

  final String pronoun;
  final String capitalized;
  final String greeting;
  const TeacherPronoun({
    required this.pronoun,
    required this.capitalized,
    required this.greeting,
  });
}
