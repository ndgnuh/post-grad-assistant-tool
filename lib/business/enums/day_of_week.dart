/// Quy định giờ học và ngày học
library;

import 'package:drift/drift.dart';

enum DayOfWeek implements Comparable {
  monday(2, 'Thứ 2'),
  tuesday(3, 'Thứ 3'),
  wednesday(4, 'Thứ 4'),
  thursday(5, 'Thứ 5'),
  friday(6, 'Thứ 6'),
  saturday(7, 'Thứ 7'),
  sunday(8, 'Chủ nhật')
  ;

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

  @override
  int compareTo(other) {
    return value.compareTo(other.value);
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

/// Giờ lên lớp.
/// https://ctt.hust.edu.vn/DisplayWeb/DisplayBaiViet?baiviet=33321
/// Thông tin từ chuyên viên: có vẻ có tiết thứ 15????
enum PeriodOfDay {
  t1(6, 45, 7, 30),
  t2(7, 30, 8, 15),
  t3(8, 25, 9, 10),
  t4(9, 20, 10, 5),
  t5(10, 15, 11, 0),
  t6(11, 0, 11, 45),
  t7(12, 30, 13, 15),
  t8(13, 15, 14, 0),
  t9(14, 10, 14, 55),
  t10(15, 5, 15, 50),
  t11(16, 0, 16, 45),
  t12(16, 45, 17, 30),
  t13(17, 45, 18, 30),
  t14(18, 30, 19, 15),
  t15(19, 15, 20, 00)
  ;

  final int startHour;
  final int startMinute;
  final int finishHour;
  final int finishMinute;
  const PeriodOfDay(
    this.startHour,
    this.startMinute,
    this.finishHour,
    this.finishMinute,
  );

  @override
  String toString() {
    final startHourStr = startHour.toString().padLeft(2, "0");
    final startMinuteStr = startMinute.toString().padLeft(2, "0");
    final startTimeStr = "$startHourStr:$startMinuteStr";
    final finishHourStr = finishHour.toString().padLeft(2, "0");
    final finishMinuteStr = finishMinute.toString().padLeft(2, "0");
    final finishTimeStr = "$finishHourStr:$finishMinuteStr";
    return "Tiết $value ($startTimeStr - $finishTimeStr)";
  }

  int get value => int.parse(name.replaceFirst("t", ""));
}
