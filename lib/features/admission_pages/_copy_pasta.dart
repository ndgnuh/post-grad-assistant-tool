import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../business/copy_pasta.dart';

void copyAdmissionEnrollmentConfirmation(BuildContext context) {
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

Email enrollmentConfirmationEmail({
  required Set<String> recipients,
  String cohortGroupLink = "TBA",
}) {
  final subject = "Nhập học chương trình thạc sĩ Toán Tin";
  final text = """
Chào các bạn ứng viên,

Mình là Hùng, trợ lý đào tạo sau đại học của khoa Toán - Tin. Chúc mừng các bạn trúng tuyển chương trình Thạc sĩ Toán - Tin. Ban Đào tạo sẽ gửi email nhập học cho các bạn.

Sau khi thực hiện các thủ tục nhập học xong, các bạn phản hồi lại cho mình qua email những thông tin sau để phục vụ cho công tác quản lý:

- Họ tên đầy đủ,
- Mã học viên,
- Mã lớp quản lý/tên khóa,
- Email học viên (email với đuôi sis.hust.edu.vn).

Ngoài ra, các bạn tham gia nhóm Zalo học viên ở dưới để tiện cho việc nhận thông báo và phổ biến công việc. Các bạn nếu gặp vấn đề gì trong quá trình nhập học cũng có thể liên hệ với mình thông qua email này.

Link nhóm Zalo: $cohortGroupLink""";
  return Email(subject: subject, recipients: recipients, body: text);
}

Email interviewInvitationEmail({
  required Set<String> recipients,
  DateTime? time,
  String? location,
}) {
  final timeFormat = DateFormat('HH:mm');
  final dateFormat = DateFormat('dd/MM/yyyy');
  final timeStr = switch (time) {
    null => "<TBA>",
    DateTime d => "${timeFormat.format(d)} ngày ${dateFormat.format(d)}",
  };

  location ??= "<TBA>";
  final text =
      """
Chào các bạn ứng viên,

Mình là Hùng, trợ lý đào tạo sau đại học của Khoa Toán - Tin, Đại học Bách khoa Hà Nội.

Chúc mừng hồ sơ của bạn đã đạt điều kiện của chương trình Thạc sĩ Toán Tin. Bước tiếp theo để nhập học là phỏng vấn xét tuyển.
Mời bạn đến phỏng vấn xét tuyển vào:

- Thời gian: $timeStr
- Địa điểm: $location, Đại học Bách khoa Hà Nội

Các bạn xác nhận tham gia phỏng vấn bằng cách trả lời email này với tiêu đề "Xác nhận tham gia phỏng vấn - [Họ và tên]" giúp mình nhé.
Cảm ơn các bạn.""";

  final email = Email(
    subject: "Phỏng vấn xét tuyển chương trình Thạc sĩ Toán Tin",
    recipients: recipients,
    body: text,
  );
  return email;
}
