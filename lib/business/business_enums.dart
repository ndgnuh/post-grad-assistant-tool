// This is experimental code for drift ORM
import 'package:drift/drift.dart';

export 'enums/document_role.dart';

// Course classes
export 'enums/day_of_week.dart';

// Interpersional misc
export 'enums/gender.dart';
export 'enums/academic_titles.dart';
export 'enums/admission_type.dart';
export 'enums/student.dart';

/// Roles in a council
/// TODO: refactor later if needed
enum CouncilRole {
  president,
  reviewer1,
  reviewer2,
  secretary,
  member,
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
  );

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
class YmdDateConverter extends TypeConverter<DateTime?, String?> {
  const YmdDateConverter();

  @override
  DateTime? fromSql(String? fromDb) {
    if (fromDb == null || fromDb.isEmpty) return null;

    final pattern = RegExp(r'^(\d{4})[-\/](\d{2})[-\/](\d{2})$');
    final matched = pattern.firstMatch(fromDb);
    switch (matched) {
      case null:
        throw Exception('Invalid date format: $fromDb');
      case final m:
        final year = int.parse(m.group(1)!);
        final month = int.parse(m.group(2)!);
        final day = int.parse(m.group(3)!);
        return DateTime(year, month, day);
    }
  }

  @override
  String? toSql(DateTime? value) {
    if (value == null) return null;
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    final year = value.year.toString().padLeft(4, '0');
    return '$year-$month-$day';
  }
}

enum CourseClassStatus {
  normal(0, "Bình thường"),
  canceled(1, "Hủy");

  const CourseClassStatus(this.value, this.label);
  final int value;
  final String label;
}

enum CourseCategory {
  etc('khac', 'Khác'),
  bacheor('cn', 'Học phần cử nhân'),
  masterGeneralEducation('dc-ths', 'Đại cương'),
  masterMajorKnowledge('nganh-rong', 'Kiến thức ngành (rộng)'),
  masterAdvancedSpecialized('nganh-nangcao', 'Kiến thức ngành (nâng cao)'),
  masterPracticalElection('tc-batbuoc', 'Tự chọn bắt buộc'),
  masterNonrestrictedElection('tc-tudo', 'Tự chọn tự do'),
  phd('phd', 'Học phần tiến sĩ');

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

class SureYmdDateConverter extends TypeConverter<DateTime, String> {
  const SureYmdDateConverter();

  @override
  DateTime fromSql(String fromDb) {
    final pattern = RegExp(r'^(\d{4})[-\/](\d{2})[-\/](\d{2})$');
    final matched = pattern.firstMatch(fromDb);
    switch (matched) {
      case null:
        throw Exception('Invalid date format: $fromDb');
      case final m:
        final year = int.parse(m.group(1)!);
        final month = int.parse(m.group(2)!);
        final day = int.parse(m.group(3)!);
        return DateTime(year, month, day);
    }
  }

  @override
  String toSql(DateTime value) {
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    final year = value.year.toString().padLeft(4, '0');
    return '$year-$month-$day';
  }
}

// Application stuff

/// How we combine filters
enum FilterMode {
  and("AND"),
  or("OR");

  final String label;
  const FilterMode(this.label);
}
