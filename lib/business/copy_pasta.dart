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
