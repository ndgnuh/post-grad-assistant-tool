part of '../main_database.dart';

extension AdmissionDao on AppDatabase {
  /// Lấy ra danh sách tuyển sinh
  SimpleSelectStatement<$AdmissionRoundTable, AdmissionRoundData>
  getAdmissionRounds({int? id, int? year}) {
    final stmt = select(admissionRound);

    // Filter by year
    switch (year) {
      case int year:
        stmt.where((r) => r.year.equals(year));
    }

    // Filter by id
    switch (id) {
      case int id:
        stmt.where((r) => r.id.equals(id));
    }

    return stmt;
  }

  /// Lấy ra các năm mà có hồ sơ tuyển sinh
  Selectable<int> getAdmissionYears() {
    final stmt = selectOnly(admissionRound, distinct: true);
    stmt.addColumns([admissionRound.year]);
    stmt.where(admissionRound.year.isNotNull());
    return stmt.map((r) => r.read(admissionRound.year)!);
  }

  /// Lấy ra danh sách hồ sơ tuyển sinh
  SimpleSelectStatement<$AdmissionProfileTable, AdmissionProfileData>
  getAdmissionProfiles({int? id, int? roundId}) {
    final stmt = select(admissionProfile);
    // Filter by id
    switch (id) {
      case int id:
        stmt.where((r) => r.id.equals(id));
    }

    // Filter by year
    switch (roundId) {
      case int value:
        stmt.where((r) => r.admissionRoundId.equals(value));
    }

    return stmt;
  }
}
