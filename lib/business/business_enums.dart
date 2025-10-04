// This is experimental code for drift ORM
import 'package:drift/drift.dart';

enum GraduationRank {
  excellent('Xuất sắc'),
  good('Giỏi'),
  fairlyGood('Khá'),
  average('Trung bình'),
  poor('Yếu');

  final String label;
  const GraduationRank(this.label);

  @override
  String toString() => label;

  static GraduationRank fromString(String fromDb) {
    for (final rank in GraduationRank.values) {
      if (rank.label == fromDb.trim()) {
        return rank;
      }
    }
    throw Exception('Invalid GraduationRank value: $fromDb');
  }
}

enum CourseClassStatus {
  normal(0, "Bình thường"),
  canceled(1, "Hủy");

  const CourseClassStatus(this.value, this.label);
  final int value;
  final String label;
}

enum DayOfWeek {
  monday(2, 'Thứ 2'),
  tuesday(3, 'Thứ 3'),
  wednesday(4, 'Thứ 4'),
  thursday(5, 'Thứ 5'),
  friday(6, 'Thứ 6'),
  saturday(7, 'Thứ 7'),
  sunday(8, 'Chủ nhật');

  final int value;
  final String label;
  const DayOfWeek(this.value, this.label);

  @override
  String toString() => label;
}

class DayOfWeekConverter extends TypeConverter<DayOfWeek, int> {
  const DayOfWeekConverter();

  @override
  DayOfWeek fromSql(int fromDb) {
    for (final day in DayOfWeek.values) {
      if (day.value == fromDb) {
        return day;
      }
    }
    throw Exception('Invalid DayOfWeek value: $fromDb');
  }

  @override
  int toSql(DayOfWeek day) => day.value;
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

enum Gender {
  male("M", "Nam"),
  female("F", "Nữ"),
  unknown("-", "Không xác định");

  final String value;
  final String label;
  const Gender(this.value, this.label);

  @override
  String toString() => label;
}

enum AcademicDegree {
  bachelor(value: "bachelor", label: "Cử nhân"),
  master(value: "master", label: "Thạc sĩ"),
  doctor(value: "doctor", label: "Tiến sĩ");

  final String value;
  final String label;
  const AcademicDegree({required this.value, required this.label});

  @override
  String toString() => label;
}

enum AcademicRank {
  associateProfessor(value: "PGS", label: "Phó giáo sư"),
  professor(value: "GS", label: "Giáo sư");

  final String value;
  final String label;
  const AcademicRank({required this.value, required this.label});

  @override
  String toString() => label;
}

class AcademicRankConverter extends TypeConverter<AcademicRank?, String?> {
  const AcademicRankConverter();

  @override
  AcademicRank? fromSql(String? fromDb) {
    if (fromDb == null) return null;
    for (final rank in AcademicRank.values) {
      if (rank.value == fromDb.trim()) return rank;
    }
    return null;
  }

  @override
  String toSql(AcademicRank? rank) => rank?.value ?? "";
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

class AcademicDegreeConverter extends TypeConverter<AcademicDegree?, String?> {
  const AcademicDegreeConverter();

  @override
  AcademicDegree? fromSql(String? fromDb) {
    if (fromDb == null) return null;
    for (final degree in AcademicDegree.values) {
      if (degree.value == fromDb.trim()) {
        return degree;
      }
    }
    return null;
  }

  @override
  String toSql(AcademicDegree? degree) => degree?.value ?? "";
}

class GenderConverter extends TypeConverter<Gender, String> {
  const GenderConverter();
  @override
  Gender fromSql(String fromDb) => switch (fromDb.trim().toLowerCase()) {
    "m" => Gender.male,
    "f" => Gender.female,
    _ => Gender.unknown,
  };

  @override
  String toSql(Gender gender) => gender.value;
}
