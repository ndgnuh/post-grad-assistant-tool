import 'package:fami_tools/business/view_models.dart';
import 'package:fami_tools/utilities/strings.dart';
import 'package:intl/intl.dart';

import '../../documents.dart';
import '../../main_database.dart';
import '../common_widgets.dart';
import '../pdf_utils.dart';

class MscThesisCouncilSuggestionDocument {
  final ThesisViewModel model;

  static final PdfConfig defaultPdfConfig = PdfConfig(
    pageFormat: PdfPageFormat.a4.landscape,
    horizontalMargin: 0.79 * inch,
    verticalMargin: 0.75 * inch,
    baseFontSize: 11 * pt,
  );

  Future<PdfFile> buildPdf({required PdfConfig config}) async {
    return await _buildPdf(model: this, config: config);
  }

  static Future<PdfFile> buildCombinedPdf({
    required List<ThesisViewModel> models,
    required PdfConfig config,
  }) async {
    final files = [
      for (final model in models)
        await _buildPdf(
          model: MscThesisCouncilSuggestionDocument(model: model),
          config: config,
        ),
    ];

    final mergedBytes = await combinePdfPages(
      pdfBytes: [for (final file in files) file.bytes],
    );
    final hash = mergedBytes.hashCode;
    final title = "DeXuatHoiDong_x$hash";
    return PdfFile(name: title, bytes: mergedBytes);
  }

  String get name {
    assert(model.student != null, "Student data must not be null");
    final name = model.student!.name.toPascalCase();
    final pdfName = "DeXuatHoiDong";
    return "${name}_$pdfName";
  }

  MscThesisCouncilSuggestionDocument({
    required this.model,
  });
}

Future<PdfFile> _buildPdf({
  required MscThesisCouncilSuggestionDocument model,
  required PdfConfig config,
}) async {
  final bytes = await buildSinglePageDocument(
    baseFontSize: config.baseFontSize,
    pageFormat: PdfPageFormat.a4.landscape,
    margin: EdgeInsets.symmetric(
      horizontal: config.horizontalMargin,
      vertical: config.verticalMargin,
    ),
    build: (context) =>
        _CouncilSuggestion.fromViewModel(viewModel: model.model),
  );

  final pdf = PdfFile(name: model.name, bytes: bytes);
  return pdf;
}

class _CouncilSuggestion extends StatelessWidget {
  static const List<String> roles = [
    "Chủ tịch",
    "Phản biện 1",
    "Phản biện 2",
    "Thư ký",
    "Ủy viên",
  ];
  static const List<String> tableHeaders = [
    "TT",
    "Họ và tên",
    "Học vị/chức danh\nkhoa học",
    "Ngành/Chuyên ngành",
    "Đơn vị công tác\nĐiện thoại",
    "Tháng/Năm nhận\nhọc vị tiến sĩ",
    "Trách nhiệm\ntrong Hội đồng",
  ];

  final StudentData student;
  final ThesisData thesis;
  // These can be unassignned initially
  final TeacherData? president;
  final TeacherData? secretary;
  final TeacherData? firstReviewer;

  final TeacherData? secondReviewer;

  final TeacherData? member;

  _CouncilSuggestion({
    required this.student,
    required this.thesis,
    required this.president,
    required this.secretary,
    required this.firstReviewer,
    required this.secondReviewer,
    required this.member,
  });

  factory _CouncilSuggestion.fromViewModel({
    required ThesisViewModel viewModel,
  }) {
    return _CouncilSuggestion(
      student: viewModel.student!,
      thesis: viewModel.thesis,
      president: viewModel.president,
      secretary: viewModel.secretary,
      firstReviewer: viewModel.firstReviewer,
      secondReviewer: viewModel.secondReviewer,
      member: viewModel.member,
    );
  }

  List<List<String>> get tableData {
    final rows = <List<String>>[];

    final dateFormat = DateFormat('MM/yyyy');

    int index = 1;

    void addRow(TeacherData? teacher, String position) {
      if (teacher != null) {
        rows.add([
          index.toString(),
          teacher.name,
          switch ((teacher.academicRank, teacher.academicDegree)) {
            (final title?, final degree?) => "${title.short} ${degree.short}",
            (final title?, null) => title.short,
            (null, final degree?) => degree.short,
            _ => "",
          },
          teacher.specialization ?? "",
          "${teacher.university}\n${teacher.phoneNumber}",
          switch (teacher.academicDegreeReceiveDate) {
            null => "",
            final date => dateFormat.format(date),
          },
          roles[index - 1],
        ]);
        index += 1;
      } else {
        rows.add([
          index.toString(),
          "",
          "",
          "",
          "",
          "",
          roles[index - 1],
        ]);
        index += 1;
      }
    }

    addRow(president, "Chủ tịch");
    addRow(firstReviewer, "Phản biện 1");
    addRow(secondReviewer, "Phản biện 2");
    addRow(secretary, "Thư ký");
    addRow(member, "Ủy viên");

    return rows;
  }

  @override
  Widget build(Context context) {
    final bold = TextStyle(fontWeight: FontWeight.bold);
    final year = DateTime.now().year;
    final italic = TextStyle(fontStyle: FontStyle.italic);
    final indent = " " * 0;

    return FullPage(
      ignoreMargins: false,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Footer(
            leading: FormalTitle(
              firstTitle: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
              secondTitle: "KHOA TOÁN - TIN",
            ),
          ),

          SizedBox(height: 8 * pt),
          Center(
            child: Text(
              "ĐỀ NGHỊ DANH SÁCH HỘI ĐỒNG CHẤM LUẬN VĂN THẠC SĨ",
              style: bold,
            ),
          ),
          SizedBox(height: 8 * pt),

          Row(
            children: [
              Expanded(
                child: Dotfill(
                  leading: InfoField(
                    texts: [
                      "${indent}Của học viên cao học: ",
                      student.name,
                      " ",
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Dotfill(
                  leading: InfoField(
                    texts: [" Mã HV: ", student.studentId ?? "202xxxxxM", " "],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 3 * pt),
          Dotfill(
            leading: InfoField(
              // ignore: unnecessary_brace_in_string_interps
              texts: ["${indent}Đề tài: ", thesis.vietnameseTitle, " "],
            ),
          ),
          SizedBox(height: 3 * pt),
          Dotfill(
            leading: InfoField(texts: ["${indent}Ngành: ", "Toán - Tin "]),
          ),
          SizedBox(height: 3 * pt),

          /// TODO: my falcuty magic to configurable
          Text(
            "${indent}Căn cứ vào hồ sơ bảo vệ luận văn thạc sĩ của học viên, Khoa Toán - Tin đồng ý cho học viên bảo vệ luận văn của mình trước Hội đồng chấm luận văn thạc sĩ và đề nghị Danh sách Hội đồng gồm các thành viên sau đây:",
          ),
          SizedBox(height: 3 * pt),

          TableHelper.fromTextArray(
            headerAlignment: Alignment.center,
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.centerLeft,
              2: Alignment.centerLeft,
              3: Alignment.centerLeft,
              4: Alignment.centerLeft,
              5: Alignment.centerLeft,
              6: Alignment.centerLeft,
            },
            columnWidths: {
              0: IntrinsicColumnWidth(),
              1: IntrinsicColumnWidth(), // Họ và tên
              2: IntrinsicColumnWidth(), // Chức vụ
              3: FlexColumnWidth(), // Ngành/Chuyên ngành
              4: IntrinsicColumnWidth(), // Đơn vị công tác/Điện thoại
              5: FlexColumnWidth(),
              6: IntrinsicColumnWidth(),
            },
            cellAlignment: Alignment.centerLeft,
            headerStyle: bold,
            headers: tableHeaders,
            data: tableData,
          ),

          // Sign area
          SizedBox(height: 6 * pt),
          Row(
            children: [
              Spacer(),
              Column(
                children: [
                  Text("Hà Nội, ngày .... tháng .... năm $year", style: italic),
                  SizedBox(height: 2 * pt),
                  Text("KHOA TOÁN - TIN", style: bold),
                ],
              ),
            ],
          ),

          Spacer(),
          FancyHdr(
            left: "ĐT.QT12.BM04",
            center: "Lần ban hành: 02",
            right: "Ngày ban hành: 28/04/2023",
            rule: 0.5 * pt,
          ),
        ],
      ),
    );
  }
}
