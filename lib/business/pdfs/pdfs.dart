export 'payment_request_pdf.dart';
export 'payment_listing_pdf.dart';
export 'payment_atm_pdf.dart';
export 'admission_payment_table_pdf.dart';
export 'admission_payment_listing_pdf.dart';

import 'phd_admission/01_council_suggestion.dart' as phd_admission;
import 'phd_admission/02_score_sheet.dart' as phd_admission;
import 'phd_admission/03_payment_table.dart' as phd_admission;

import 'dart:typed_data';

/// Structure that holds a PDF file's name and bytes
/// Useful when PDFs are generated with name patterns
class PdfFile {
  final String fileName;
  final Uint8List bytes;

  static const phdAdmission = (
    councilSuggestion: phd_admission.councilSuggestionPdf,
    scoreSheet: phd_admission.scoreSheetPdf,
    paymentTable: phd_admission.paymentTablePdf,
  );

  PdfFile({
    required this.fileName,
    required this.bytes,
  });
}
