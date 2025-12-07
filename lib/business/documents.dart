export 'documents/payment_request_pdf.dart';
export 'documents/payment_listing_pdf.dart';
export 'documents/payment_atm_pdf.dart';
export 'documents/admission_payment_table_pdf.dart';
export 'documents/admission_payment_listing_pdf.dart';

import 'dart:io';

import 'package:path/path.dart' as p;

import 'documents/payment_request_pdf.dart' as payment_pdfs;
import 'documents/payment_listing_pdf.dart' as payment_pdfs;
import 'documents/payment_atm_pdf.dart' as payment_pdfs;
import 'documents/phd_admission/01_council_suggestion.dart' as phd_admission;
import 'documents/phd_admission/02_score_sheet.dart' as phd_admission;
import 'documents/phd_admission/03_payment_table.dart' as phd_admission;
import 'documents/teaching_assignment_pdf.dart' as msc_course_class;

import 'documents/msc_thesis/assignment.dart' as msc_thesis;
import 'documents/msc_thesis/score_sheet.dart' as msc_thesis;
import 'documents/msc_thesis/council_suggestion.dart' as msc_thesis;

import 'excel_files/msc_teaching_assignment.dart' as msc_xlsx;
import 'excel_files/payment_atm_table.dart' as payment_xlsx;

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
    paymentListing: payment_pdfs.paymentListingPdf,
  );

  PdfFile({
    required this.name,
    required this.bytes,
  });
}

class ExcelFile {
  final String name;
  final Uint8List bytes;

  String get fileName => name.endsWith(".xlsx") ? name : "$name.xlsx";

  static const msc = (
    teachingAssignment: msc_xlsx.buildTeachingAssignmentXlsx,
  );

  static const mscThesis = (
    assignment: msc_thesis.buildThesisAssignmentExcel,
  );

  static const payment = (
    atmTable: payment_xlsx.paymentTableExcel,
  );

  Future<void> save({required String directory}) {
    final file = File(p.join(directory, fileName));
    return file.writeAsBytes(bytes);
  }

  ExcelFile({
    required this.name,
    required this.bytes,
  });
}
