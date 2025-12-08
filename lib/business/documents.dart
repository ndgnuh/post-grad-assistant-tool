import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;

import 'documents/common.dart';
import 'documents/msc_teaching_assignment.dart' as msc_xlsx;
import 'documents/msc_thesis/assignment.dart' as msc_thesis;
import 'documents/msc_thesis/council_suggestion.dart' as msc_thesis;
import 'documents/msc_thesis/score_sheet.dart' as msc_thesis;
import 'documents/msc_thesis/council_decision.dart' as msc_thesis;
import 'documents/payment/atm_pdf.dart' as payment_pdfs;
import 'documents/payment/atm_xlsx.dart' as payment_xlsx;
import 'documents/payment/listing_pdf.dart' as payment_pdfs;
import 'documents/payment/request_pdf.dart' as payment_pdfs;
import 'documents/phd_admission/01_council_suggestion.dart' as phd_admission;
import 'documents/phd_admission/02_score_sheet.dart' as phd_admission;
import 'documents/phd_admission/03_payment_table.dart' as phd_admission;
import 'documents/teaching_assignment_pdf.dart' as msc_course_class;

export 'documents/admission_payment_listing_pdf.dart';
export 'documents/admission_payment_table_pdf.dart';
export 'documents/common.dart';
export 'documents/payment/atm_pdf.dart';
export 'documents/payment/listing_pdf.dart';
export 'documents/payment/request_pdf.dart';

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
    paymentListing: payment_pdfs.paymentListingPdf,
  );

  PdfFile({
    required this.name,
    required this.bytes,
  });
}

extension XlsxFactory on XlsxFile {
  static const msc = (
    teachingAssignment: msc_xlsx.buildTeachingAssignmentXlsx,
  );

  static const mscThesis = (
    assignment: msc_thesis.buildThesisAssignmentExcel,
  );

  static const payment = (
    atmTable: payment_xlsx.paymentTableExcel,
  );
}

extension DocxFactory on DocxFile {
  static const mscThesis = (
    councilDecision: msc_thesis.buildCouncilDecisionDocx,
  );
}
