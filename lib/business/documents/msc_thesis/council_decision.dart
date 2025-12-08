import 'package:flutter/services.dart';

import '../../../gen/assets.gen.dart';
import '../../../utilities/strings.dart';
import '../../main_database.dart';
import '../../view_models.dart';
import '../common.dart';
import '../docx_utils.dart';

class CouncilDecisionModel {
  final ThesisViewModel thesisViewModel;
  final String major;

  StudentData get student => thesisViewModel.student!;
  ThesisData get thesis => thesisViewModel.thesis;
  TeacherData get supervisor => thesisViewModel.supervisor;
  TeacherData get president => thesisViewModel.president!;
  TeacherData get firstReviewer => thesisViewModel.firstReviewer!;
  TeacherData get secondReviewer => thesisViewModel.secondReviewer!;
  TeacherData get secretary => thesisViewModel.secretary!;
  TeacherData get member => thesisViewModel.member!;

  String get name {
    final name = student.name.toPascalCase();
    return "${name}_QuyetDinhHoiDong";
  }

  Map<String, Object?> toJson() {
    return {
      'student': student.toJson(),
      'thesis_title': thesis.vietnameseTitle,
      'cohort': student.cohort,
      'supervisor': supervisor.toJsonExt(),
      'president': president.toJsonExt(),
      'first_reviewer': firstReviewer.toJsonExt(),
      'second_reviewer': secondReviewer.toJsonExt(),
      'secretary': secretary.toJsonExt(),
      'member': member.toJsonExt(),
      'major': major,
      // TODO: no magic value
      'quy_che_to_chuc_dao_tao': '8460/QĐ-ĐHBK ngày 20 tháng 8 năm 2024',
      'quy_che_dao_tao': '5445/QĐ-ĐHBK ngày 28 tháng 5 năm 2025',
      'quy_che_to_chuc_va_hoat_dong': '40/NQ-ĐHBK ngày 02 tháng 12 năm 2024',
    };
  }

  CouncilDecisionModel({
    required this.thesisViewModel,
    required this.major,
  });
}

Future<DocxFile> buildCouncilDecisionDocx({
  required ThesisViewModel thesis,
  String major = "Toán tin",
}) async {
  final model = CouncilDecisionModel(
    thesisViewModel: thesis,
    major: major,
  );

  final templatePath = Assets.templates.mscThesisCouncilDecision;
  final templateBytes = await rootBundle.load(templatePath);

  final context = model.toJson();

  print(context["supervisor"]);
  final bytes = fillDocxTemplate(
    templateBytes.buffer.asUint8List(),
    context,
  );
  final name = model.name;

  return DocxFile(name: name, bytes: bytes);
}
