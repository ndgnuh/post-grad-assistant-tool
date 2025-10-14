import 'package:drift/drift.dart';

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
