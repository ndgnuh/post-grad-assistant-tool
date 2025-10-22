import 'package:drift/drift.dart';

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

/// Cách xưng hô với giảng viên khác
enum Pronoun {
  anh(
    pronoun: "anh",
    capitalized: "Anh",
    greeting: "Em chào anh",
    gender: Gender.male,
  ),
  chi(
    pronoun: "chị",
    capitalized: "Chị",
    greeting: "Em chào chị",
    gender: Gender.female,
  ),
  thay(
    pronoun: "thầy",
    capitalized: "Thầy",
    greeting: "Em thưa thầy",
    gender: Gender.male,
  ),
  co(
    pronoun: "cô",
    capitalized: "Cô",
    greeting: "Em thưa cô",
    gender: Gender.female,
  ),
  sir(
    // A fun fallback case
    gender: Gender.unknown,
    pronoun: "ngài",
    capitalized: "Ngài",
    greeting: "Kính chào ngài",
  );

  final String pronoun;
  final String capitalized;
  final String greeting;
  final Gender gender; // Which gender does this pronoun apply to?

  const Pronoun({
    required this.pronoun,
    required this.capitalized,
    required this.greeting,
    required this.gender,
  });

  static Pronoun fromGender({required Gender? gender, bool formal = true}) {
    return switch ((gender, formal)) {
      (Gender.male, true) => Pronoun.thay,
      (Gender.female, true) => Pronoun.co,
      (Gender.male, false) => Pronoun.anh,
      (Gender.female, false) => Pronoun.chi,
      _ => Pronoun.sir,
    };
  }
}
