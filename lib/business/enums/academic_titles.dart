import 'package:drift/drift.dart';

enum AcademicDegree {
  bachelor(value: "CN", label: "Cử nhân", short: "CN."),
  engineer(value: "KS", label: "Kỹ sư", short: "KS."),
  master(value: "ThS", label: "Thạc sĩ", short: "ThS."),
  doctorOfScience(value: "TSKH", label: "Tiến sĩ Khoa học", short: "TSKH."),
  doctor(value: "TS", label: "Tiến sĩ", short: "TS.");

  final String value;
  final String label;
  final String short;
  const AcademicDegree({
    required this.value,
    required this.label,
    required this.short,
  });

  @override
  String toString() => label;
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

enum AcademicRank {
  associateProfessor(value: "PGS", label: "Phó giáo sư", short: "PGS."),
  professor(value: "GS", label: "Giáo sư", short: "GS.");

  final String value;
  final String label;
  final String short;
  const AcademicRank({
    required this.value,
    required this.label,
    required this.short,
  });

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
