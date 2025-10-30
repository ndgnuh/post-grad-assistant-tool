enum ThesisStatus {
  unofficial('unofficial', 'Chưa chính thức'),
  assigned('assigned', 'Đã giao đề tài'),
  defenseIntended('defense-intended', 'Dự kiến bảo vệ'),
  defenseApplied('defense-applied', 'Nộp hồ sơ bảo vệ'),
  defenseApproved('defense-approved', 'Đã duyệt hồ sơ bảo vệ'),
  defensePassed('defense-passed', 'Đã bảo vệ thành công');
  // Incase of failed defense, move to `assigned` status
  // if that even happens, lmao

  final String value;
  final String label;

  const ThesisStatus(this.value, this.label);

  String toValue() => value;
  static ThesisStatus fromValue(String value) {
    return ThesisStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => throw ArgumentError('Invalid thesis status value: $value'),
    );
  }
}
