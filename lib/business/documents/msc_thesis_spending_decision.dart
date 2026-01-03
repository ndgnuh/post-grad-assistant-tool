import 'package:flutter/services.dart';

import '../../gen/assets.gen.dart';
import '../../utilities/strings.dart';
import '../db_v2_providers.dart';
import 'common.dart';
import 'docx_utils.dart' as docx;

Future<DocxFile> _buildDocx({
  required MscThesisSpendingDecisionDocument model,
}) async {
  final templateByteData = await rootBundle.load(
    Assets.templates.mscThesisSpendingDecision,
  );
  final templateBytes = templateByteData.buffer.asUint8List();

  final context = {
    "management_regulation": _docToString(
      model.managementRegulation,
    ),
    "financial_management_regulation": _docToString(
      model.financialManagementRegulation,
    ),
    "internal_spending_regulation": _docToString(
      model.internalSpendingRegulation,
    ),
    "total_amount": model.totalAmount.formatMoney(),
    "total_amount_in_words": model.totalAmount.toVietnameseWords(),
  };

  final renderedBytes = docx.fillDocxTemplate(
    templateBytes,
    context,
  );

  return DocxFile(name: model.name, bytes: renderedBytes);
}

String _docToString(DocumentData doc) {
  final signedDate = doc.signedDate;
  final day = signedDate.day.toString().padLeft(2, '0');
  final month = signedDate.month.toString().padLeft(2, '0');
  final year = signedDate.year;
  return '${doc.officialCode}/${doc.officialType} ngày $day tháng $month năm $year';
}

class MscThesisSpendingDecisionDocument {
  /// Total amount of money spent on payment
  final int totalAmount;
  final DocumentData managementRegulation;
  final DocumentData financialManagementRegulation;
  final DocumentData internalSpendingRegulation;

  final String name = "Về việc thanh toán tiền chấm luận văn thạc sĩ";

  const MscThesisSpendingDecisionDocument({
    required this.totalAmount,
    required this.managementRegulation,
    required this.financialManagementRegulation,
    required this.internalSpendingRegulation,
  });

  Future<Future<DocxFile>> buildDocx() async => _buildDocx(model: this);
}
