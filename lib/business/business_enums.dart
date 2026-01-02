// This is experimental code for drift ORM
import 'package:drift/drift.dart';
import 'package:fami_tools/utilities/strings.dart';

// Database
export 'enums/document_role.dart';
export 'enums/phd_student.dart';
export 'enums/day_of_week.dart';
export 'enums/payment_status.dart';
export 'enums/thesis_status.dart';

// Interpersional misc
export 'enums/gender.dart';
export 'enums/academic_titles.dart';
export 'enums/admission_type.dart';
export 'enums/student.dart';

enum MscDefenseStatus {
  normal("Bình thường"),
  registered("Đã đăng ký"),
  applied("Đã nộp hồ sơ"),
  defended("Đã bảo vệ")
  ;

  final String label;
  const MscDefenseStatus(this.label);

  String get value => name.camelToKebabCase();

  static MscDefenseStatus fromValue(String val) {
    return MscDefenseStatus.values.where((status) {
      return status.value == val.trim();
    }).first;
  }
}

enum DocumentClass {
  phdAdmissionCouncilDecision(
    group: 'phd',
    value: 'admission-council',
    label: 'QĐ lập hội đồng tuyển sinh NCS',
  ),
  phdAdmissionAcceptanceDecision(
    group: 'phd',
    value: 'admission-acceptance',
    label: 'QĐ công nhận trúng tuyển NCS',
  ),
  phdThesisAcceptanceDecision(
    group: 'phd',
    value: 'thesis-acceptance',
    label: 'QĐ cộng nhận NCS, Đề tài và Tập thể hướng dẫn',
  )
  ;

  final String group;
  final String value;
  final String label;

  const DocumentClass({
    required this.group,
    required this.value,
    required this.label,
  });
}

// DMY Date converter

enum CourseClassStatus {
  normal(0, "Bình thường"),
  canceled(1, "Hủy")
  ;

  const CourseClassStatus(this.value, this.label);
  final int value;
  final String label;
}

enum CourseCategory {
  etc('99-khac', 'Khác'),
  bacheor('10-cn', 'Học phần cử nhân'),
  masterGeneralEducation('20-dc-ths', 'Đại cương'),
  masterMajorKnowledge('31-nganh-rong', 'Kiến thức ngành (rộng)'),
  masterAdvancedSpecialized('32-nganh-nangcao', 'Kiến thức ngành (nâng cao)'),
  masterPracticalElection('41-tc-batbuoc', 'Tự chọn bắt buộc'),
  masterNonrestrictedElection('42-tc-tudo', 'Tự chọn tự do'),
  phd('40-phd', 'Học phần tiến sĩ')
  ;

  final String value;
  final String label;
  const CourseCategory(this.value, this.label);

  @override
  String toString() => label;
}

class CourseCategoryConverter extends TypeConverter<CourseCategory, String> {
  const CourseCategoryConverter();

  @override
  CourseCategory fromSql(String fromDb) {
    for (final category in CourseCategory.values) {
      if (category.value == fromDb.trim()) {
        return category;
      }
    }
    return CourseCategory.etc; // Default to 'etc' if not found
  }

  @override
  String toSql(CourseCategory category) => category.value;
}

class CourseClassStatusConverter extends TypeConverter<CourseClassStatus, int> {
  const CourseClassStatusConverter();

  @override
  CourseClassStatus fromSql(int fromDb) {
    for (final status in CourseClassStatus.values) {
      if (status.value == fromDb) {
        return status;
      }
    }
    return CourseClassStatus.normal; // Default to normal if not found
  }

  @override
  int toSql(CourseClassStatus status) => status.value;
}

// Application stuff

/// How we combine filters
enum FilterMode {
  and("AND"),
  or("OR")
  ;

  final String label;
  const FilterMode(this.label);
}

/// Các loại văn bản trong thường gặp
/// Trong hệ thống, [other] dùng cho các văn bản ít gặp.
enum DocumentArchetype {
  mscThesisExtension("Gia hạn thời gian thực hiện luận văn thạc sĩ"),
  mscThesisAssignment("Công nhận đề tài luận văn thạc sĩ"),
  organizationRegulation("Quy chế Tổ chức & Hoạt động"),
  internalSpendingRegulation("Quy chế Chi tiêu Nội bộ"),
  financialManagementRegulation("Quy chế Quản lý Tài chính"),
  educationRegulation("Quy chế Đào tạo"),
  educationManagementRegulation("Quy chế Tổ chức & Quản lý Đào tạo"),
  studentAffairsRegulation("Quy chế Công tác Sinh viên"),
  staffAffairsRegulation("Quy chế Công tác Cán bộ"),
  other("Khác")
  ;

  final String label;
  const DocumentArchetype(this.label);

  String get value => name.camelToKebabCase();
}
