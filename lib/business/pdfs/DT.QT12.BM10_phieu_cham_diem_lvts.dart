import 'package:pdf/pdf.dart';
import '../../services/pdf_builder/pdf_widgets.dart';

class PhieuDiem extends GridView {
  PhieuDiem({String? name, int? year})
      : super(
          children: [
            for (int i = 0; i < 6; i++)
              _PhieuDiem(
                name: name ?? "",
                year: year,
              )
          ],
          crossAxisCount: 2,
          direction: Axis.vertical,
        );
}

class _PhieuDiem extends StatelessWidget {
  int? year;
  final String name;
  _PhieuDiem({this.year, this.name = ""});

  @override
  Widget build(Context context) {
    year ??= DateTime.now().year;
    final mainLayout = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Footer(title: EzBold("PHIẾU CHẤM ĐIỂM")),
        Footer(
          title: Text("Bảo vệ luận văn thạc sĩ"),
        ),
        EzSkip.medSkip,
        EzDotfillTile(
          leading: Row(
            children: [
              Text("Họ và tên học viên: "),
              EzBold(name),
            ],
          ),
        ),
        EzSkip.medSkip,
        EzDotfillTile(leading: Text("Kết quả bảo vệ: ")),
        EzSkip.medSkip,
        Row(children: [
          Text("Đề nghị tiếp tục làm NCS:"),
          Spacer(flex: 2),
          EzCheckbox(),
          Text(" Có"),
          Spacer(),
          EzCheckbox(),
          Text(" Không"),
        ]),
        EzSkip.bigSkip,
        Footer(
          trailing: Column(
            children: [
              Text("Hà Nội, ngày .... tháng .... năm $year"),
              EzSkip(height: 1 * PdfPageFormat.point),
              Text("ỦY VIÊN HỘI ĐỒNG"),
              EzItalic("(ký & ghi rõ họ tên)"),
            ],
          ),
        ),
        Spacer(),
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5 * PdfPageFormat.mm,
        vertical: 10 * PdfPageFormat.mm,
      ),
      height: 15 * PdfPageFormat.cm,
      width: 10 * PdfPageFormat.cm,
      foregroundDecoration: BoxDecoration(
        border: Border.all(),
      ),
      child: mainLayout,
    );
  }
}
