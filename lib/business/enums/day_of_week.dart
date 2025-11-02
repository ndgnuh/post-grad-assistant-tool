import 'package:drift/drift.dart';

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

  String toShortString() {
    switch (this) {
      case DayOfWeek.monday:
        return 'T2';
      case DayOfWeek.tuesday:
        return 'T3';
      case DayOfWeek.wednesday:
        return 'T4';
      case DayOfWeek.thursday:
        return 'T5';
      case DayOfWeek.friday:
        return 'T6';
      case DayOfWeek.saturday:
        return 'T7';
      case DayOfWeek.sunday:
        return 'CN';
    }
  }
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
