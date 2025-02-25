// TODO: move this file to "logic_tuyensinh";
import 'dart:io';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart' as p;
import 'dtypes.dart';
import 'pdfbuilder/heplers.dart' as ph;
import 'datamodels.dart' show DateTimeConvert;

final dio = Dio();
const baseTuyenSinhUrl = "https://sdh.hust.edu.vn/AnhTuyenSinh";

String englishCertUrl(id) {
  return "$baseTuyenSinhUrl/20174/$id.pdf";
}

String bachelorDegreeUrl(id) {
  return "$baseTuyenSinhUrl/20172/$id.pdf";
}

String degreeAppendixUrl(id) {
  return "$baseTuyenSinhUrl/20171/$id.pdf";
}

Future<bool> openEnglishCert(id) async {
  final url = Uri.parse(englishCertUrl(id));
  return await launchUrl(url);
}

Future<bool> openBachelorDegree(id) async {
  final url = Uri.parse(bachelorDegreeUrl(id));
  return await launchUrl(url);
}

Future<bool> openDegreeAppendix(id) async {
  final url = Uri.parse(degreeAppendixUrl(id));
  return await launchUrl(url);
}

Future<(bool, String?)> downloadAdmissionFiles({
  required HocVien student,
  required String outputDirectory,
}) async {
  final addmissionId = student.soHoSo;
  final name = student.hoTen;

  // Build output paths
  final urls = [
    bachelorDegreeUrl(addmissionId),
    degreeAppendixUrl(addmissionId),
    englishCertUrl(addmissionId),
  ];
  final outNames = [
    "$addmissionId-$name-bang.pdf",
    "$addmissionId-$name-bangdiem.pdf",
    "$addmissionId-$name-tienganh.pdf",
  ];
  final outPaths = [
    for (final name in outNames) p.join(outputDirectory, name),
  ];

  switch (addmissionId) {
    case null:
      return (false, "Không có mã hồ sơ");
    default:
      try {
        for (final (i, url) in urls.indexed) {
          final res = await dio.get(
            url,
            options: Options(
              responseType: ResponseType.bytes,
              followRedirects: true,
            ),
          );
          Uint8List data = res.data;
          File file = File(outPaths[i]);
          await file.writeAsBytes(data);
        }
        return (true, null);
      } on Exception {
        return (false, "Tải file thất bại");
      }
  }
}

Future<pw.Document> buildBang2DanhSachThiSinh({
  required List<HocVien> candidates,
  required String saveDirectory,
  required year,
}) async {
  final theme = await ph.defaultTheme(baseSize: 9.0);
  final doc = pw.Document(
    pageMode: PdfPageMode.fullscreen,
    theme: theme,
    title: "Bảng 2: Danh sách xét tuyển thạc sĩ nghiên cứu",
    producer: "Nguyễn Đức Hùng",
    author: "Nguyễn Đức Hùng",
  );

  final page = pw.MultiPage(
    theme: theme,
    pageFormat: PdfPageFormat(
      297 * PdfPageFormat.mm,
      210 * PdfPageFormat.mm,
      marginAll: 0.25 * PdfPageFormat.inch,
    ),
    build: (context) {
      final header = ph.EzTopHeader.fami().flushLeft();

      final title = pw.Center(
        child: ph.BoldText(
          "DANH SÁCH THÍ SINH XÉT TUYỂN THẠC SĨ THEO ĐỊNH HƯỚNG NGHIÊN CỨU NĂM $year",
        ),
      );

      final footer = pw.Row(
        children: [
          pw.Expanded(child: pw.SizedBox.shrink()),
          pw.Column(
            children: [
              pw.Text("Hà Nội, ngày ..... tháng ..... năm ........."),
              ph.BoldText("TRƯỞNG TIỂU BAN"),
            ],
          ),
        ],
      );

      List<String> headers = [
        "TT",
        "Số\nhồ sơ",
        "Họ và tên thí sinh",
        "Giới\ntính",
        "Nơi sinh",
        "Trường tốt\nnghiệp ĐH",
        "Hệ đào tạo",
        "Chuyên ngành\nđào tạo ĐH",
        "Xếp loại\nTNĐH",
        "Ngày, tháng, năm\ntốt nghiệp ĐH",
        "Chuyên ngành,\nchương trình\nđào tạo\nhệ Thạc sĩ",
        "Định hướng\nchuyên sâu\n(nếu có)",
        "Mã các HP\nđược miễn học"
      ];

      final padding = pw.EdgeInsets.all(4);
      final headerStyle = theme.defaultTextStyle.copyWith(
        fontWeight: pw.FontWeight.bold,
      );
      final tbl = pw.Table(
        border: pw.TableBorder.all(),
        children: [
          pw.TableRow(children: [
            for (final col in headers)
              pw.Container(
                height: PdfPageFormat.point * 10 * 5,
                alignment: pw.Alignment.center,
                padding: padding,
                child: pw.Center(
                  child: pw.Text(
                    col,
                    textAlign: pw.TextAlign.center,
                    maxLines: null,
                    style: headerStyle,
                    softWrap: false,
                  ),
                ),
              )
          ]),
          for (final (i, hv) in candidates.indexed)
            pw.TableRow(
              children: [
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    (i + 1).toString(),
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.soHoSo ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.hoTen,
                    textAlign: pw.TextAlign.left,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.gioiTinh ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.noiSinh ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.truongTotNghiepDaiHoc ?? "",
                    textAlign: pw.TextAlign.center,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.heTotNghiepDaiHoc ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.nganhTotNghiepDaiHoc ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.xepLoaiTotNghiepDaiHoc ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.ngayTotNghiepDaiHoc?.toDmy() ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.nganhDaoTaoThacSi ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.dinhHuongChuyenSau ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.hocPhanDuocMien ?? "",
                    softWrap: false,
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ],
            )
        ],
      );

      final spacing = pw.Divider(
        height: 5 * PdfPageFormat.mm,
        borderStyle: pw.BorderStyle.none,
      );
      return [
        header,
        spacing,
        title,
        spacing,
        tbl,
        spacing,
        footer,
      ];
    },
  );

  doc.addPage(page);

  final file = File(p.join(saveDirectory, "Bảng 2 danh sách thí sinh.pdf"));
  await file.writeAsBytes(await doc.save());
  return doc;
}

Future<pw.Document> buildBang3NhanXet({
  required List<HocVien> candidates,
  required String saveDirectory,
  required GiangVien gv,
  required String role,
  required String year,
}) async {
  final theme = await ph.defaultTheme(baseSize: 9.0);
  final doc = pw.Document(
    pageMode: PdfPageMode.fullscreen,
    theme: theme,
    title: "Bảng 3: Đánh giá của thành viên tiểu ban - ${gv.hoTenChucDanh}",
    producer: "Nguyễn Đức Hùng",
    author: "Nguyễn Đức Hùng",
  );

  final page = pw.Page(
    theme: theme,
    pageFormat: PdfPageFormat(
      297 * PdfPageFormat.mm,
      210 * PdfPageFormat.mm,
      marginAll: 0.25 * PdfPageFormat.inch,
    ),
    build: (context) {
      final header = ph.EzTopHeader.fami().flushLeft();

      final title = pw.Center(
        child: ph.BoldText(
          "BẢNG ĐÁNH GIÁ CỦA THÀNH VIÊN TIỂU BAN XÉT TUYỂN CAO HỌC THEO ĐỊNH HƯỚNG NGHIÊN CỨU NĂM $year",
          fontSize: 11,
        ),
      );

      final teacherInfo = pw.Row(
        children: [
          pw.Text(
            "Họ và tên, chức danh, nhiệm vụ trong tiểu ban: ",
          ),
          pw.Text(gv.hoTenChucDanh),
          pw.Text(" - "),
          pw.Text(role),
        ],
      );

      final footer = pw.Row(
        children: [
          pw.Expanded(child: pw.SizedBox.shrink()),
          pw.Column(
            children: [
              ph.ItalicText("Hà Nội, ngày ..... tháng ..... năm ........."),
              ph.BoldText("NGƯỜI ĐÁNH GIÁ"),
              pw.Divider(
                  height: 1.5 * PdfPageFormat.cm,
                  borderStyle: pw.BorderStyle.none),
              ph.BoldText(gv.hoTen),
            ],
          ),
        ],
      );

      List<String> headers = [
        "TT",
        "Số hồ sơ",
        "Họ và tên thí sinh",
        "Ngày sinh",
        "Giới tính",
        "Chuyên ngành, chương trình\nđào tạo hệ Thạc sĩ",
        "Định hướng chuyên sâu\n(nếu có)",
        "Điểm\nTC 1",
        "Điểm\nTC 2",
        "Điểm\nTC 3",
        "Điểm\nTC 4",
        "Điểm\nTC 5",
        "Tổng điểm",
      ];

      final tbl = ph.EzTable<HocVien>(
        headers: headers,
        data: candidates,
        rowBuilder: (i, hv) {
          return [
            i + 1,
            hv.soHoSo,
            hv.hoTen,
            hv.ngaySinh?.toDmy(),
            hv.gioiTinh,
            hv.nganhDaoTaoThacSi,
            hv.dinhHuongChuyenSau,
          ];
        },
      );

      final spacing = pw.Divider(
        height: 5 * PdfPageFormat.mm,
        borderStyle: pw.BorderStyle.none,
      );
      return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          header,
          spacing,
          title,
          spacing,
          teacherInfo,
          pw.Divider(
            height: 2.5 * PdfPageFormat.mm,
            borderStyle: pw.BorderStyle.none,
          ),
          tbl,
          spacing,
          footer,
        ],
      );
    },
  );

  doc.addPage(page);

  final file = File(
    p.join(
      saveDirectory,
      "Bảng 3 ${gv.hoTen}.pdf",
    ),
  );
  print(file);
  await file.writeAsBytes(await doc.save());
  return doc;
}

Future<pw.Document> buildBang4TongHopKq({
  required List<HocVien> candidates,
  required String saveDirectory,
  required String year,
}) async {
  final theme = await ph.defaultTheme(baseSize: 9.0);
  final doc = pw.Document(
    pageMode: PdfPageMode.fullscreen,
    theme: theme,
    title: "Bảng 4: Tổng hợp kết quả tuyển sinh",
    producer: "Nguyễn Đức Hùng",
    author: "Nguyễn Đức Hùng",
  );
  final page = pw.Page(
    theme: theme,
    pageFormat: PdfPageFormat(
      297 * PdfPageFormat.mm,
      210 * PdfPageFormat.mm,
      marginAll: 0.25 * PdfPageFormat.inch,
    ),
    build: (context) {
      final header = ph.EzTopHeader.fami().flushLeft();

      final title = pw.Center(
        child: ph.BoldText(
          "TỔNG HỢP KẾT QUẢ XÉT TUYỂN CAO HỌC THEO ĐỊNH HƯỚNG NGHIÊN CỨU NĂM $year",
          fontSize: 11,
        ),
      );

      final footer = pw.Row(
        children: [
          pw.Expanded(child: pw.SizedBox.shrink()),
          pw.Column(
            children: [
              ph.ItalicText("Hà Nội, ngày ..... tháng ..... năm $year"),
              ph.BoldText("TRƯỞNG TIỂU BAN"),
              pw.Divider(
                height: 1.5 * PdfPageFormat.cm,
                borderStyle: pw.BorderStyle.none,
              ),
            ],
          ),
        ],
      );

      final subheaders = [
        "Trưởng TB",
        "Thư ký",
        "Ủy viên 1",
        "Ủy viên 2",
        "Ủy viên 3"
      ];
      final tbl = ph.EzTable<HocVien>(
        data: candidates,
        rowBuilder: (i, HocVien hv) => [
          (i + 1).toString(),
          hv.soHoSo,
          hv.hoTen,
          hv.ngaySinh?.toDmy(),
          hv.gioiTinh,
          hv.nganhDaoTaoThacSi,
          hv.dinhHuongChuyenSau,
          ph.EzTable<String>(
            headerForeground: PdfColorGrey(1, 0),
            headers: subheaders,
            data: <String>[],
            rowBuilder: (i, _) => <String>[],
          ),
        ],
        headers: [
          "TT",
          "Số hồ sơ",
          "Họ tên thí sinh",
          "Ngày sinh",
          "Giới tính",
          "Chuyên ngành,\nchương trình đào tạo",
          "Định hướng chuyên sâu\n(nếu có)",
          pw.Column(
            children: [
              ph.EzTable<String>(
                headers: ["Điểm đánh giá của các thành viên tiểu ban				"],
                data: <String>[],
                rowBuilder: (i, _) => <String>[],
              ),
              ph.EzTable<String>(
                headers: subheaders,
                data: <String>[],
                rowBuilder: (i, _) => <String>[],
              ),
            ],
          ),
          "Điểm trung bình",
        ],
      );

      final spacing = pw.Divider(
        height: 5 * PdfPageFormat.mm,
        borderStyle: pw.BorderStyle.none,
      );
      return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          header,
          spacing,
          title,
          spacing,
          pw.Divider(
            height: 2.5 * PdfPageFormat.mm,
            borderStyle: pw.BorderStyle.none,
          ),
          tbl,
          spacing,
          footer,
        ],
      );
    },
  );

  doc.addPage(page);

  final file = File(
    p.join(
      saveDirectory,
      "Bảng 4 tổng hợp kết quả đánh giá.pdf",
    ),
  );
  await file.writeAsBytes(await doc.save());
  return doc;
}
