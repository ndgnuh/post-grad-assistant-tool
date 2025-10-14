import 'dart:io';

import 'package:fami_tools/business/drift_orm.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:pdf/pdf.dart';

import '../../business/domain_objects.dart' hide AdmissionType;
import '../../services/pdf_widgets.dart' as pw;

extension _DateDmy on DateTime {
  String toDmy() {
    final df = DateFormat("dd/MM/yyyy");
    return df.format(this);
  }
}

Future<void> saveAdmissionForms({
  required String saveDirectory,
  required List<StudentData> candidates,
  required AdmissionCouncilData council,
}) async {
  final year = council.year;

  List<StudentData> candidatesXt = [
    for (final c in candidates)
      if (c.admissionType == AdmissionType.interview) c,
  ];

  List<StudentData> candidatesCnThs = [
    for (final c in candidates)
      if (c.admissionType == AdmissionType.integrated) c,
  ];

  await _buildBang2DanhSachThiSinh(
    candidates: candidatesXt,
    saveDirectory: saveDirectory,
    year: year,
  );
  await _buildBang3NhanXet(
    candidates: candidatesXt,
    saveDirectory: saveDirectory,
    gv: await GiangVien.getById(council.presidentId),
    role: "Chủ tịch tiểu ban",
    year: year,
  );
  await _buildBang3NhanXet(
    candidates: candidatesXt,
    saveDirectory: saveDirectory,
    gv: await GiangVien.getById(council.secretaryId),
    role: "Thư ký tiểu ban",
    year: year,
  );
  await _buildBang3NhanXet(
    candidates: candidatesXt,
    saveDirectory: saveDirectory,
    gv: await GiangVien.getById(council.member1Id),
    role: "Ủy viên",
    year: year,
  );
  await _buildBang3NhanXet(
    candidates: candidatesXt,
    saveDirectory: saveDirectory,
    gv: await GiangVien.getById(council.member2Id),
    role: "Ủy viên",
    year: year,
  );
  await _buildBang3NhanXet(
    candidates: candidatesXt,
    saveDirectory: saveDirectory,
    gv: await GiangVien.getById(council.member3Id),
    role: "Ủy viên",
    year: year,
  );
  await _buildBang4TongHopKq(
    candidates: candidatesXt,
    saveDirectory: saveDirectory,
    year: year,
  );
  await _buildBang4TongHopCnths(
    candidates: candidatesCnThs,
    saveDirectory: saveDirectory,
    year: year,
  );
}

Future<pw.Document> _buildBang2DanhSachThiSinh({
  required List<StudentData> candidates,
  required String saveDirectory,
  required year,
}) async {
  final theme = await pw.defaultTheme(baseSize: 9.0);
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
      final header = pw.EzTopHeader.fami().flushLeft();

      final title = pw.Center(
        child: pw.BoldText(
          "DANH SÁCH THÍ SINH XÉT TUYỂN THẠC SĨ THEO ĐỊNH HƯỚNG NGHIÊN CỨU NĂM $year",
        ),
      );

      final footer = pw.Row(
        children: [
          pw.Expanded(child: pw.SizedBox.shrink()),
          pw.Column(
            children: [
              pw.Text("Hà Nội, ngày ..... tháng ..... năm $year"),
              pw.BoldText("TRƯỞNG TIỂU BAN"),
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
        "Chuyên ngành,\nchương trình\nđào tạo Thạc sĩ",
        "Định hướng\nchuyên sâu\n(nếu có)",
        "Mã các HP\nđược miễn học",
      ];

      final padding = pw.EdgeInsets.all(4);
      final headerStyle = theme.defaultTextStyle.copyWith(
        fontWeight: pw.FontWeight.bold,
      );
      final tbl = pw.Table(
        border: pw.TableBorder.all(),
        children: [
          pw.TableRow(
            children: [
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
                ),
            ],
          ),
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
                    hv.admissionId ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.name,
                    textAlign: pw.TextAlign.left,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.gender.toString(),
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.placeOfBirth ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.bachelorUniversity ?? "",
                    textAlign: pw.TextAlign.center,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.bachelorProgram ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.bachelorMajor ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.bachelorGraduationRank.toString(),
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.bachelorGraduationDate?.toDmy() ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.masterMajor ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.intendedSpecialization ?? "",
                    textAlign: pw.TextAlign.center,
                    softWrap: false,
                  ),
                ),
                pw.Container(
                  padding: padding,
                  child: pw.Text(
                    hv.exemptedCourses ?? "",
                    softWrap: false,
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ],
            ),
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

Future<pw.Document> _buildBang3NhanXet({
  required List<StudentData> candidates,
  required String saveDirectory,
  required GiangVien gv,
  required String role,
  required String year,
}) async {
  final theme = await pw.defaultTheme(baseSize: 9.0);
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
      final header = pw.EzTopHeader.fami().flushLeft();

      final title = pw.Center(
        child: pw.BoldText(
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
              pw.ItalicText("Hà Nội, ngày ..... tháng ..... năm $year"),
              pw.BoldText("NGƯỜI ĐÁNH GIÁ"),
              pw.Divider(
                height: 1.5 * PdfPageFormat.cm,
                borderStyle: pw.BorderStyle.none,
              ),
              pw.BoldText(gv.hoTenChucDanh),
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

      final tbl = pw.EzTable<StudentData>(
        headers: headers,
        data: candidates,
        rowBuilder: (i, hv) {
          return [
            i + 1,
            hv.admissionId,
            hv.name,
            hv.dateOfBirth?.toDmy(),
            hv.gender.toString(),
            hv.masterMajor,
            hv.intendedSpecialization,
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
  await file.writeAsBytes(await doc.save());
  return doc;
}

Future<pw.Document> _buildBang4TongHopCnths({
  required List<StudentData> candidates,
  required String saveDirectory,
  required String year,
}) async {
  final theme = await pw.defaultTheme(baseSize: 9.0);
  final doc = pw.Document(
    pageMode: PdfPageMode.fullscreen,
    theme: theme,
    title: "Bảng 4a: Tổng hợp danh sách xét tuyển theo diện Cử nhân - Thạc sĩ",
    producer: "Nguyễn Đức Hùng",
    author: "Nguyễn Đức Hùng",
  );
  final page = pw.Page(
    theme: theme,
    pageFormat: PdfPageFormat(
      297 * PdfPageFormat.mm,
      210 * PdfPageFormat.mm,
      marginAll: 0.75 * PdfPageFormat.inch,
    ),
    build: (context) {
      final header = pw.EzTopHeader.fami().flushLeft();

      final title = pw.Center(
        child: pw.BoldText(
          "TỔNG HỢP DANH SÁCH XÉT TUYỂN CAO HỌC ĐỊNH HƯỚNG NGHIÊN CỨU THEO DIỆN CỬ NHÂN - THẠC SĨ NĂM $year",
          fontSize: 11,
        ),
      );

      final footer = pw.Row(
        children: [
          pw.Expanded(child: pw.SizedBox.shrink()),
          pw.Column(
            children: [
              pw.ItalicText("Hà Nội, ngày ..... tháng ..... năm $year"),
              pw.BoldText("TRƯỞNG TIỂU BAN"),
              pw.Divider(
                height: 1.5 * PdfPageFormat.cm,
                borderStyle: pw.BorderStyle.none,
              ),
            ],
          ),
        ],
      );

      final tbl = pw.EzTable<StudentData>(
        data: candidates,
        rowBuilder: (i, StudentData hv) => [
          (i + 1).toString(),
          hv.admissionId,
          hv.name,
          hv.dateOfBirth?.toDmy(),
          hv.gender.toString(),
          hv.masterMajor,
          hv.intendedSpecialization,
          hv.exemptedCourses ?? "",
        ],
        headers: [
          "TT",
          "Số hồ sơ",
          "Họ tên thí sinh",
          "Ngày sinh",
          "Giới tính",
          "Chuyên ngành,\nchương trình đào tạo",
          "Định hướng chuyên sâu\n(nếu có)",
          "Danh sách học phần được miễn",
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
      "Bảng 4 tổng hợp cn-ths.pdf",
    ),
  );
  await file.writeAsBytes(await doc.save());
  return doc;
}

Future<pw.Document> _buildBang4TongHopKq({
  required List<StudentData> candidates,
  required String saveDirectory,
  required String year,
}) async {
  final theme = await pw.defaultTheme(baseSize: 9.0);
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
      final header = pw.EzTopHeader.fami().flushLeft();

      final title = pw.Center(
        child: pw.BoldText(
          "TỔNG HỢP KẾT QUẢ XÉT TUYỂN CAO HỌC THEO ĐỊNH HƯỚNG NGHIÊN CỨU NĂM $year",
          fontSize: 11,
        ),
      );

      final footer = pw.Row(
        children: [
          pw.Expanded(child: pw.SizedBox.shrink()),
          pw.Column(
            children: [
              pw.ItalicText("Hà Nội, ngày ..... tháng ..... năm $year"),
              pw.BoldText("TRƯỞNG TIỂU BAN"),
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
        "Ủy viên 3",
      ];
      final tbl = pw.EzTable<StudentData>(
        data: candidates,
        rowBuilder: (i, StudentData hv) => [
          (i + 1).toString(),
          hv.admissionId,
          hv.name,
          hv.dateOfBirth?.toDmy(),
          hv.gender.toString(),
          hv.masterMajor,
          hv.intendedSpecialization,
          pw.EzTable<String>(
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
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.EzTable<String>(
                headers: ["Điểm đánh giá của các thành viên tiểu ban"],
                data: <String>[],
                rowBuilder: (i, _) => <String>[],
              ),
              pw.EzTable<String>(
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
