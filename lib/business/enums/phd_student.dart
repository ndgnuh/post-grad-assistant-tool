import 'package:drift/drift.dart';
import 'package:fami_tools/utilities/strings.dart';

const phdSpecializationConverter = _Converter();

enum PhdSpecialization {
  mathematicsAndInformatics("Toán tin"),
  appliedMathematics("Toán ứng dụng"),
  calculus("Toán giải tích"),
  differentialIntegralEquations("Phương trình vi phân và tích phân"),
  probabilityAndStatistics("Lí thuyết xác suất và thống kê toán học");

  final String label;
  const PhdSpecialization(this.label);

  static PhdSpecialization fromValue(String value) {
    return PhdSpecialization.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception("Invalid PhdSpecialization value: $value"),
    );
  }

  String get value => name.camelToKebabCase();
}

class _Converter extends TypeConverter<PhdSpecialization, String> {
  const _Converter();

  @override
  PhdSpecialization fromSql(String fromDb) {
    return PhdSpecialization.fromValue(fromDb);
  }

  @override
  String toSql(PhdSpecialization value) {
    return value.value;
  }
}
