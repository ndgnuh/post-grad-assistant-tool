part of '../main_database.dart';

extension PhdStudentDao on AppDatabase {
  /// Cập nhật trạng thái hội đồng chấm đề cương (xét tuyển) của NCS.
  ///
  /// - [presidentId]: chủ tịch hội đồng
  /// - [secretaryId]: thư ký hội đồng
  /// - [member1Id]: ủy viên 1
  /// - [member2Id]: ủy viên 2
  /// - [member3Id]: ủy viên 3
  /// - [helperId]: trợ lý
  ///
  /// Những tham số để null sẽ không được cập nhật. Để xóa thành viên nào đó, đặt ID là một số âm.
  /// (ví dụ [presidentId] là [-1] sẽ xóa chủ tịch tiểu ban khỏi hội đồng).
  /// Vai trò trợ lý là vai trò cũ, chỉ dùng trong lúc thanh toán, không còn sử dụng từ 2026.
  Future<void> setAdmissionCouncil({
    required int phdStudentId,
    int? presidentId,
    int? secretaryId,
    int? member1Id,
    int? member2Id,
    int? member3Id,
    int? helperId,
  }) async {
    Value<int?> getValue(int? id) {
      if (id == null) return Value<int>.absent();
      if (id < 0) return Value<int?>(null);
      return Value(id);
    }

    final companion = PhdStudentCompanion(
      admissionPresidentId: getValue(presidentId),
      admissionSecretaryId: getValue(secretaryId),
      admission1stMemberId: getValue(member1Id),
      admission2ndMemberId: getValue(member2Id),
      admission3rdMemberId: getValue(member3Id),
      admissionHelperId: getValue(helperId),
    );
    final updateStatement = phdStudent.update();
    updateStatement.where((p) => p.id.equals(phdStudentId));
    await updateStatement.write(companion);
  }

  Future<PhdAdmissionPaymentPolicyData?> getCurrentPaymentPolicy() async {
    final maxIdExpr = phdAdmissionPaymentPolicy.id.max();
    final stmt = phdAdmissionPaymentPolicy.selectOnly();
    stmt.addColumns([maxIdExpr]);
    final result = await stmt.getSingleOrNull();
    final maxId = result?.read(maxIdExpr);
    if (maxId == null) {
      return null;
    }
    final policyStmt = phdAdmissionPaymentPolicy.select()
      ..where((p) => p.id.equals(maxId));
    return await policyStmt.getSingleOrNull();
  }

  /// Create a new PhD student record in the database.
  Future<void> addPhdStudent({
    // Admisison information
    required String admissionId,
    required String cohort,

    // Basic information
    required String name,
    required Gender gender,
    required DateTime dateOfBirth,
    required String placeOfBirth,

    // Contact information
    required String phone,
    required String personalEmail,

    // Academic information
    required String thesis,
    required int supervisorId,
    required int? secondarySupervisorId,
    required PhdSpecialization majorSpecialization,

    // Allow setting initial status (default to admission)
    // Allow settings certain informations if the phd student is already enrolled
    StudentStatus status = StudentStatus.admission,
    PaymentStatus? admissionPaymentStatus,
    String? managementId,
  }) async {
    final policy = await getCurrentPaymentPolicy();

    final companion = PhdStudentCompanion.insert(
      // Admission information
      admissionId: admissionId,
      cohort: cohort,
      status: status,

      // Basic information
      name: name,
      gender: Value(gender),
      dateOfBirth: Value(dateOfBirth),
      placeOfBirth: Value(placeOfBirth),
      phone: phone,
      personalEmail: personalEmail,

      // Academic information
      thesis: thesis,
      supervisorId: supervisorId,
      secondarySupervisorId: Value(secondarySupervisorId),
      majorSpecialization: majorSpecialization,
      managementId: Value<String?>(managementId),

      // payment policy
      admissionPaymentPolicy: Value(policy?.id),
      admissionPaymentStatus: Value(
        admissionPaymentStatus ?? PaymentStatus.unpaid,
      ),
    );

    final stmt = phdStudent.insert();
    await stmt.insert(companion);
  }

  /// Search for PhD students based on various criteria.
  SimpleSelectStatement<PhdStudent, PhdStudentData> searchPhdStudents({
    int? id,
    String? searchText,
    PhdCohortData? cohort,
    PaymentStatus? admissionPaymentStatus,
    List<OrderingTerm Function(PhdStudent)>? orderBy,
  }) {
    final stmt = select(phdStudent);

    if (id != null) {
      stmt.where((p) => p.id.equals(id));
    }

    switch (searchText?.trim()) {
      case String searchText when searchText.trim().isNotEmpty:
        stmt.where(
          (p) =>
              p.name.contains(searchText) |
              p.admissionId.contains(searchText) |
              p.personalEmail.contains(searchText) |
              p.phone.contains(searchText) |
              p.cohort.contains(searchText),
        );
      default:
    }

    switch (orderBy) {
      case null:
        break;
      default:
        stmt.orderBy(orderBy);
    }

    if (cohort != null) {
      stmt.where((p) => p.cohort.equals(cohort.cohort));
    }

    switch (admissionPaymentStatus) {
      case PaymentStatus status:
        stmt.where((p) => p.admissionPaymentStatus.equals(status.value));
      default:
    }

    return stmt;
  }
}
