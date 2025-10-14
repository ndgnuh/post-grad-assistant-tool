import 'package:drift/drift.dart';

enum GraduationRank {
  excellent('Xuất sắc', 'Xuất sắc'),
  good('Giỏi', 'Giỏi'),
  fairlyGood('Khá', 'Khá'),
  average('Trung bình', 'Trung bình'),
  poor('Yếu', 'Yếu');

  final String label;
  final String value;
  const GraduationRank(this.value, this.label);

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

class GraduationRankConverter extends TypeConverter<GraduationRank, String> {
  const GraduationRankConverter();

  @override
  GraduationRank fromSql(String fromDb) => GraduationRank.fromString(fromDb);

  @override
  String toSql(GraduationRank rank) => rank.label;
}

enum StudentStatus {
  normal("bt", "Bình thường"),
  admission("xt", "Xét tuyển"),
  studying("hoc", "Đang học"),
  quit("nghi", "Thôi học"),
  graduated("tn", "Đã tốt nghiệp"),
  delayedAdmission("xt-pending", "Hoãn xét tuyển");

  final String value;
  final String label;
  const StudentStatus(this.value, this.label);

  factory StudentStatus.fromValue(String fromDb) {
    for (final status in StudentStatus.values) {
      if (status.value == fromDb.trim()) {
        return status;
      }
    }
    return StudentStatus.normal; // Default to 'normal' if not found
  }

  @override
  String toString() => label;
}

class StudentStatusConverter extends TypeConverter<StudentStatus, String> {
  const StudentStatusConverter();

  @override
  StudentStatus fromSql(String fromDb) => StudentStatus.fromValue(fromDb);

  @override
  String toSql(StudentStatus status) => status.value;
}
