export 'payment_request_pdf.dart';
export 'payment_listing_pdf.dart';
export 'payment_atm_pdf.dart';
export 'admission_payment_table_pdf.dart';
export 'admission_payment_listing_pdf.dart';

import 'dart:io';

import 'package:path/path.dart' as p;

import 'payment_request_pdf.dart' as payment_pdfs;
import 'payment_listing_pdf.dart' as payment_pdfs;
import 'payment_atm_pdf.dart' as payment_pdfs;
import 'phd_admission/01_council_suggestion.dart' as phd_admission;
import 'phd_admission/02_score_sheet.dart' as phd_admission;
import 'phd_admission/03_payment_table.dart' as phd_admission;
import 'teaching_assignment_pdf.dart' as msc_course_class;

import 'msc_thesis/assignment.dart' as msc_thesis;
import 'msc_thesis/score_sheet.dart' as msc_thesis;
import 'msc_thesis/council_suggestion.dart' as msc_thesis;

import 'dart:typed_data';

/// Structure that holds a PDF file's name and bytes
/// Useful when PDFs are generated with name patterns
class PdfFile {
  final String name;
  final Uint8List bytes;

  String get fileName => name.endsWith('.pdf') ? name : '$name.pdf';

  Future<void> save({required String directory}) {
    final file = File(p.join(directory, fileName));
    return file.writeAsBytes(bytes);
  }

  static const phdAdmission = (
    councilSuggestion: phd_admission.councilSuggestionPdf,
    scoreSheet: phd_admission.scoreSheetPdf,
    paymentTable: phd_admission.paymentTablePdf,
  );

  static const mscCourseClass = (
    teachingAssignment: msc_course_class.buildTeachingAssignmentPdf,
  );

  static const mscThesis = (
    scoreSheet: msc_thesis.thesisScoreSheetsPdf,
    councilSuggestion: msc_thesis.councilSuggestionPdf,
    multipleScoreSheets: msc_thesis.thesisScoreSheetsMultiplePdf,
    multipleCouncilSuggestion: msc_thesis.multipleCouncilSuggestionPdfs,
    assignment: msc_thesis.buildThesisAssignmentPdf,
  );

  static const payment = (
    paymentRequest: payment_pdfs.paymentRequestPdf,
    paymentAtm: payment_pdfs.paymentAtmPdf,
  );

  PdfFile({
    required this.name,
    required this.bytes,
  });
}
