import 'package:drift/drift.dart';

enum AdmissionType {
  interview("xt", "Phỏng vấn xét tuyển", 2),
  integrated("cn-ths", "Tích hợp Cử nhân - Thạc sĩ", 1);

  final String value;
  final String label;
  final int sortPriority;
  const AdmissionType(this.value, this.label, [this.sortPriority = 0]);

  factory AdmissionType.fromValue(String value) {
    for (final type in AdmissionType.values) {
      if (type.value == value) {
        return type;
      }
    }
    throw Exception('Invalid AdmissionType value: $value');
  }

  @override
  String toString() => label;
}

class AdmissionTypeConverter extends TypeConverter<AdmissionType, String> {
  const AdmissionTypeConverter();

  @override
  AdmissionType fromSql(String fromDb) => AdmissionType.fromValue(fromDb);

  @override
  String toSql(AdmissionType admissionType) => admissionType.value;
}
