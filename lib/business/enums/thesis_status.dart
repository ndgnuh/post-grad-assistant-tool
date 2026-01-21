import 'package:drift/drift.dart';
import '../../utilities/strings.dart';

const thesisStatusConverter = ThesisStatusConverter();

enum ThesisStatus {
  unofficial('Chưa chính thức'),
  assigned('Đã giao đề tài'),
  defenseIntended('Dự kiến bảo vệ'),
  defenseApplied('Nộp hồ sơ bảo vệ'),
  defenseApproved('Đã duyệt hồ sơ bảo vệ'),
  defensePassed('Đã bảo vệ thành công'),
  defenseFailed('Trượt');
  // Incase of failed defense, move to `assigned` status
  // if that even happens, lmao

  final String label;

  const ThesisStatus(this.label);

  String get value => name.camelToKebabCase();
  static ThesisStatus fromValue(String value) {
    return ThesisStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => throw ArgumentError('Invalid thesis status value: $value'),
    );
  }
}

class ThesisStatusConverter extends TypeConverter<ThesisStatus, String> {
  const ThesisStatusConverter();

  @override
  ThesisStatus fromSql(String fromDb) => ThesisStatus.fromValue(fromDb);

  @override
  String toSql(ThesisStatus value) => value.value;
}
