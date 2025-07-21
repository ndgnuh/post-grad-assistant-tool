import 'package:yaml/yaml.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show rootBundle, Clipboard, ClipboardData;
import 'package:intl/intl.dart';

import './domain_objects.dart';

String toDmy(DateTime date) {
  final formatter = DateFormat('dd/MM/yyyy');
  final formattedDate = formatter.format(date);
  return formattedDate;
}

void copyToClipboard({
  required BuildContext context,
  required String text,
  required String notification,
}) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(notification)),
  );
}

void copyThongBaoDangKyHoc({
  required BuildContext context,
  required HocKy hocKy,
}) {
  final ngayMoDangKy = toDmy(hocKy.moDangKy);
  final ngayDongDangKy = toDmy(hocKy.dongDangKy);
  final tenDotHoc = hocKy.hocKy;
  final text = """
Đợt học $tenDotHoc mở đăng ký từ $ngayMoDangKy đến $ngayDongDangKy.
Các bạn nhớ đăng ký học đúng thời gian nhé!""";
  copyToClipboard(
    context: context,
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

  final text = """
Kính gửi các Thầy, các Cô,

Em gửi danh sách lớp của các lớp cao học của đợt học $tenDotHoc kèm với bảng điểm quá trình và bảng điểm cuối kỳ. Các lớp sẽ học từ ngày $ngayBatDauHoc đến $ngayKetThucHoc.

Thầy, Cô lưu ý, trong buổi đầu tiên của học phần Thầy, Cô cung cấp đề cương chi tiết và kế hoạch học, thi cho lớp, trong đó xác định rõ:

      - Yêu cầu của học phần,
      - Nhiệm vụ của học viên,
      - Đánh giá kết quả trong số kiểm tra giữa kỳ, thi hết học phần,
      - Tài liệu học tập, tham khảo.

Lịch thi do Thầy, Cô sắp xếp ngay sau khi kết thúc học phần, thời gian thi nằm trong kế hoạch của học kỳ. 

Thầy, Cô cho học viên thi, điền đủ thông tin ngày thi và nộp lại bảng điểm trước ngày $ngayNopDiem giúp em với ạ. Em xin cảm ơn. """;

  copyToClipboard(
    context: context,
    text: text,
    notification: "Đã sao chép thông báo học tập.",
  );
}

void copyAdmissionInterviewInvitation({
  required BuildContext context,
}) {
  final text = """
Chào các bạn ứng viên,

Mình là Hùng, trợ lý đào tạo sau đại học của Khoa Toán - Tin, Đại học Bách khoa Hà Nội.

Chúc mừng hồ sơ của bạn đã đạt điều kiện của chương trình Thạc sĩ Toán Tin. Bước tiếp theo để nhập học là phỏng vấn xét tuyển.
Mời bạn đến phỏng vấn xét tuyển vào:

- Thời gian: <TBA>
- Địa điểm: <TBA>, Đại học Bách khoa Hà Nội

Các bạn xác nhận tham gia phỏng vấn bằng cách trả lời email này với tiêu đề "Xác nhận tham gia phỏng vấn - [Họ và tên]" giúp mình nhé.
Cảm ơn các bạn.

Trân trọng,
Nguyễn Đức Hùng""";
  copyToClipboard(
    context: context,
    text: text,
    notification: "Đã sao chép lời mời phỏng vấn.",
  );
}

void copyAdmissionEnrollmentConfirmation({
  required BuildContext context,
}) {
  final text = """
[Thông báo về chương trình thạc sĩ Toán Tin]

Chào các bạn ứng viên,

Mình là Hùng, trợ lý đào tạo sau đại học của khoa Toán - Tin. Chúc mừng các bạn trúng tuyển chương trình Thạc sĩ Toán - Tin. Ban Đào tạo sẽ gửi email nhập học cho các bạn.

Sau khi thực hiện các thủ tục nhập học xong, các bạn phản hồi lại cho mình qua email những thông tin sau để phục vụ cho công tác quản lý:

- Họ tên đầy đủ,
- Mã học viên,
- Mã lớp quản lý/tên khóa,
- Email học viên (email với đuôi sis.hust.edu.vn).

Ngoài ra, các bạn tham gia nhóm Zalo học viên ở dưới để tiện cho việc nhận thông báo và phổ biến công việc. Các bạn nếu gặp vấn đề gì trong quá trình nhập học cũng có thể liên hệ với mình thông qua email này.

Link nhóm Zalo: TBA

Trân trọng,
Nguyễn Đức Hùng
""";
  copyToClipboard(
    context: context,
    text: text,
    notification: "Đã sao chép thông báo nhập học.",
  );
}

void copyNhacNhoNopDiem({
  required BuildContext context,
  required HocKy hocKy,
}) {
  final tenDotHoc = hocKy.hocKy;
  final ngayKetThucHoc = toDmy(hocKy.ketThucHoc);

  final text = """
Kính gửi các Thầy, các Cô,

Ngày $ngayKetThucHoc là ngày kết thúc của đợt học $tenDotHoc.
Thầy, Cô tổ chức cho học viên thi và gửi hai bảng điểm cho em trước ngày $ngayKetThucHoc ạ.

Khi cho học viên thi, Thầy, Cô điền luôn ngày thi trên bảng điểm giúp em ạ.

Em cảm ơn Thầy, Cô ạ.""";

  copyToClipboard(
    context: context,
    text: text,
    notification: "Đã sao chép nhắc nộp điểm.",
  );
}

class CopyPasta {
  final String name;
  final String content;
  CopyPasta({
    required this.name,
    required this.content,
  });

  Future<void> copyToClipboard() async {
    final data = ClipboardData(text: content);
    await Clipboard.setData(data);
  }
}

Future<List<CopyPasta>> loadCopyPasta() async {
  String yaml = await rootBundle.loadString("assets/copy-pasta.yaml");
  final data = loadYaml(yaml);
  return [
    for (final json in data)
      CopyPasta(
        name: json["name"],
        content: json["content"],
      )
  ];
}
