part of '../main_database.dart';

// import 'package:drift/drift.dart' as drift;

const databaseTables = [
  Preference,
  DocumentRole,
  Document,
  Cohort,
  AdmissionCouncil,
  Student,
  Semester,
  Course,
  Thesis,
  AcademicGroup,
  TeacherGroup,
  Teacher,
  PhdCohort,
  PhdAdmissionPaymentPolicy,
  PhdStudent,
  TeachingRegistration,
  CourseLimiting,
  CourseClass,
  TeachingAssignment,
  StudyRegistration,
  ThesisDefenseRound,
  ThesisDefenseCouncil,
];

/// Một đợt bảo vệ sẽ bao gồm nhiều hội đồng
class ThesisDefenseRound extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
}

/// Hội đồng bảo vệ của một học viên
class ThesisDefenseCouncil extends Table {
  late final defenseRoundId = integer().references(ThesisDefenseRound, #id)();

  IntColumn get id => integer().autoIncrement()();
  IntColumn get thesisId => integer().references(Thesis, #id)();
  @ReferenceName("thesis_presdent_id")
  IntColumn get presdentId => integer().references(Teacher, #id).nullable()();
  @ReferenceName("thesis_reviewer_1_id")
  IntColumn get reviewer1Id => integer().references(Teacher, #id).nullable()();
  @ReferenceName("thesis_reviewer_2_id")
  IntColumn get reviewer2Id => integer().references(Teacher, #id).nullable()();
  @ReferenceName("thesis_secretary_id")
  IntColumn get secretaryId => integer().references(Teacher, #id).nullable()();
  @ReferenceName("thesis_member_id")
  IntColumn get memberId => integer().references(Teacher, #id).nullable()();
  DateTimeColumn get defenseDate => dateTime().nullable()();
}

class Preference extends Table {
  TextColumn get key => text()();
  TextColumn get value => text().nullable()();

  @override
  Set<Column> get primaryKey => {key};
}

class DocumentRole extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get canExpire => boolean().withDefault(const Constant(false))();
  TextColumn get category => text().withDefault(const Constant(""))();
}

class Document extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get officialCode => integer()();
  TextColumn get officialType => text()();
  DateTimeColumn get signedDate => dateTime()();
  IntColumn get contentId => integer().nullable()();
  TextColumn get archiveId => text().nullable()();
  DateTimeColumn get createdTime =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedTime =>
      dateTime().withDefault(currentDateAndTime)();
}

class Cohort extends Table {
  TextColumn get id => text()();
  TextColumn get groupUrl => text().withDefault(const Constant(""))();

  @override
  Set<Column> get primaryKey => {id};
}

class AdmissionCouncil extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get year => text().named('year')();
  @ReferenceName("msc_admission_president")
  IntColumn get presidentId => integer().references(Teacher, #id)();
  @ReferenceName("msc_admission_secretary")
  IntColumn get secretaryId => integer().references(Teacher, #id)();
  @ReferenceName("msc_admission_member_1")
  IntColumn get member1Id => integer().references(Teacher, #id)();
  @ReferenceName("msc_admission_member_2")
  IntColumn get member2Id => integer().references(Teacher, #id)();
  @ReferenceName("msc_admission_member_3")
  IntColumn get member3Id => integer().references(Teacher, #id)();

  TextColumn get establishmentDecisionId => text()();
  DateTimeColumn get establishmentDecisionDate => dateTime()();
}

class Student extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get admissionId => text().nullable().named('admission_id')();
  TextColumn get cohort => text()
      .nullable()
      .named('cohort_id')
      .references(Cohort, #id, onUpdate: KeyAction.cascade)();
  TextColumn get studentId => text().nullable().named('management_id')();
  TextColumn get name => text()();
  DateTimeColumn get dateOfBirth =>
      dateTime().nullable().named('date_of_birth')();
  TextColumn get gender => text().nullable().map(const GenderConverter())();
  TextColumn get placeOfBirth => text().nullable().named('place_of_birth')();
  TextColumn get phone => text().nullable().named('phone_number')();
  TextColumn get personalEmail => text().nullable().named('personal_email')();
  TextColumn get schoolEmail => text().nullable().named('hust_email')();
  TextColumn get bachelorUniversity =>
      text().nullable().named('truongTotNghiepDaiHoc')();
  TextColumn get bachelorMajor =>
      text().nullable().named('nganhTotNghiepDaiHoc')();
  TextColumn get bachelorProgram =>
      text().nullable().named('heTotNghiepDaiHoc')();
  TextColumn get bachelorGraduationRank =>
      text().nullable().named('xepLoaiTotNghiepDaiHoc')();
  DateTimeColumn get bachelorGraduationDate =>
      dateTime().nullable().named('ngayTotNghiepDaiHoc')();
  TextColumn get intendedSpecialization =>
      text().nullable().named('dinhHuongChuyenSau')();
  TextColumn get exemptedCourses =>
      text().nullable().named('hocPhanDuocMien')();
  TextColumn get masterMajor => text().nullable().named('nganhDaoTaoThacSi')();
  TextColumn get status =>
      text().nullable().map(const StudentStatusConverter())();
  BoolColumn get hasHirstExtension =>
      boolean().withDefault(const Constant(false)).named('flag_extend_1')();
  BoolColumn get hasSecondExtension =>
      boolean().withDefault(const Constant(false)).named('flag_extend_2')();

  IntColumn get admissionCouncilId => integer()
      .nullable()
      .named('idTieuBanXetTuyen')
      .references(AdmissionCouncil, #id)();
  TextColumn get admissionType => text()
      .nullable()
      .named('idDienTuyenSinh')
      .map(const AdmissionTypeConverter())();
  BoolColumn get isAdmissionPaid =>
      boolean().withDefault(const Constant(false)).named('thanhToanXetTuyen')();
}

class Semester extends Table {
  TextColumn get id => text()();
  DateTimeColumn get registrationBeginDate => dateTime()();
  DateTimeColumn get registrationEndDate => dateTime()();
  DateTimeColumn get classBeginDate => dateTime()();
  DateTimeColumn get classEndDate => dateTime()();
  // Note: Drift doesn't support subqueries in withDefault.
  // This logic is usually handled during insertion or via a trigger.
  IntColumn get sequence => integer()();
  // IntColumn get sequence => integer().withDefault(
  //   CustomExpression('select coalesce(max(sequence), 0) + 1 from semester'),
  // )();
  DateTimeColumn get gradeSubmissionDeadline => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Course extends Table {
  TextColumn get id => text()();
  TextColumn get vietnameseName => text()();
  TextColumn get englishName => text()();
  TextColumn get category => text().map(const CourseCategoryConverter())();
  IntColumn get numCredits => integer()();
  IntColumn get numTheoryHours => integer()();
  IntColumn get numPracticeHours => integer()();
  IntColumn get numLabHours => integer()();
  IntColumn get numSelfStudyHours => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ThesisData')
class Thesis extends Table {
  IntColumn get id => integer().autoIncrement()();

  @ReferenceName("thesis_supervisor")
  IntColumn get supervisorId => integer().references(Teacher, #id)();

  @ReferenceName("thesis_cosupervisor")
  IntColumn get secondarySupervisorId =>
      integer().nullable().references(Teacher, #id)();

  @ReferenceName("thesis_president_old")
  IntColumn get presidentId => integer().nullable().references(Teacher, #id)();
  @ReferenceName("thesis_reviewer_1_old")
  IntColumn get firstReviewerId => integer()
      .nullable()
      .named('first_reviewer_id')
      .references(Teacher, #id)();
  @ReferenceName("thesis_reviewer_2_old")
  IntColumn get secondReviewerId => integer()
      .nullable()
      .named('second_reviewer_id')
      .references(Teacher, #id)();
  @ReferenceName("thesis_secretary_old")
  IntColumn get secretaryId => integer().nullable().references(Teacher, #id)();
  @ReferenceName("thesis_member_old")
  IntColumn get memberId => integer().nullable().references(Teacher, #id)();
  IntColumn get studentId => integer().nullable().references(Student, #id)();
  @ReferenceName("8e1a174a-02ff-4f1e-9960-7dba6465ec87")
  TextColumn get vietnameseTitle => text()();
  TextColumn get englishTitle => text()();
  TextColumn get note => text().withDefault(const Constant("")).named('note')();
  DateTimeColumn get defenseDeadline => dateTime().nullable()();
  DateTimeColumn get defenseDate => dateTime().nullable()();
  BoolColumn get flagTracking => boolean().withDefault(const Constant(false))();
  BoolColumn get flagPaid => boolean().withDefault(const Constant(false))();
  BoolColumn get flagIgnore => boolean().withDefault(const Constant(false))();
  TextColumn get group => text().nullable()();
  TextColumn get year => text().nullable().named('nam')();
  TextColumn get defenseStatus => text().map(thesisStatusConverter)();
  TextColumn get paymentStatus => text().map(paymentStatusConverter)();
  IntColumn get councilDecisionId => integer()
      .nullable()
      .named('defense_decision_id')
      .references(Document, #id)();
  TextColumn get assignedDecisionNumber =>
      text().nullable().named('soQdGiao')();
  TextColumn get defenseDecisionNumber =>
      text().nullable().named('soQdBaoVe')();
}

class AcademicGroup extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get note => text().nullable()();
}

class TeacherGroup extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Teacher extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get staffId => text().nullable().unique()();
  TextColumn get name => text()();
  TextColumn get university => text().nullable()();
  TextColumn get falcuty => text().nullable()();
  BoolColumn get isOutsider => boolean().withDefault(const Constant(true))();
  TextColumn get gender => text().map(const GenderConverter())();
  TextColumn get specialization => text().nullable()();
  TextColumn get academicRank =>
      text().nullable().map(const AcademicRankConverter())();
  TextColumn get academicDegree =>
      text().nullable().map(const AcademicDegreeConverter())();
  DateTimeColumn get academicDegreeReceiveDate => dateTime().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get workEmail => text().nullable()();
  TextColumn get personalEmail => text().nullable()();
  TextColumn get citizenId => text().nullable()();
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  TextColumn get bankAccount => text().nullable()();
  TextColumn get bankName => text().nullable()();
  TextColumn get pronoun => text()
      .withDefault(const Constant('thầy'))
      .map(const PronounConverter())();
  TextColumn get deprecatedTaxCode => text().nullable()();
  TextColumn get note => text().nullable()();
  IntColumn get startTeachingYear => integer().nullable()();
  IntColumn get teacherGroupId =>
      integer().nullable().references(TeacherGroup, #id)();
}

class PhdCohort extends Table {
  TextColumn get cohort => text()();
  DateTimeColumn get createdTime =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedTime =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {cohort};
}

class PhdAdmissionPaymentPolicy extends Table {
  late final id = integer().autoIncrement()();
  late final presidentPayment = integer()();
  late final secretaryPayment = integer()();
  late final memberPayment = integer()();
  late final helperPayment = integer()();
}

class PhdStudent extends Table {
  late final id = integer().autoIncrement()();
  late final cohort = text().references(PhdCohort, #cohort)();

  late final managementId = text().nullable().unique()();
  late final admissionId = text().unique()();
  late final admissionCouncilDecisionNumber = integer().nullable()();
  late final name = text()();
  late final gender = text()
      .withDefault(const Constant('M'))
      .map(const GenderConverter())();
  late final dateOfBirth = dateTime().nullable()();
  late final placeOfBirth = text().nullable()();
  late final phone = text().unique()();
  late final personalEmail = text().unique()();
  late final majorName = text().withDefault(const Constant('Toán học'))();
  late final majorId = text().withDefault(const Constant('9460101'))();
  late final majorSpecialization = text().map(phdSpecializationConverter)();

  @ReferenceName("phd_admission_president")
  late final admissionPresidentId = integer()
      .references(Teacher, #id)
      .nullable()();
  @ReferenceName("phd_admission_secretary")
  late final admissionSecretaryId = integer()
      .references(Teacher, #id)
      .nullable()();
  @ReferenceName("phd_admission_member_1")
  late final admission1stMemberId = integer()
      .references(Teacher, #id)
      .nullable()();
  @ReferenceName("phd_admission_member_2")
  late final admission2ndMemberId = integer()
      .references(Teacher, #id)
      .nullable()();
  @ReferenceName("phd_admission_member_3")
  late final admission3rdMemberId = integer()
      .references(Teacher, #id)
      .nullable()();
  @ReferenceName("phd_admission_helper")
  late final admissionHelperId = integer()
      .references(Teacher, #id)
      .nullable()();

  late final admissionPaymentStatus = text()
      .withDefault(const Constant('unpaid'))
      .map(paymentStatusConverter)();
  late final admissionPaymentPolicy = integer().nullable().references(
    PhdAdmissionPaymentPolicy,
    #id,
  )();
  late final thesis = text()();

  @ReferenceName("phd_supervisor")
  late final supervisorId = integer().references(Teacher, #id)();
  @ReferenceName("phd_cosupervisor")
  late final secondarySupervisorId = integer()
      .references(Teacher, #id)
      .nullable()();

  late final schoolEmail = text().nullable().unique()();
  late final createdTime = dateTime().withDefault(currentDateAndTime)();
  late final updatedTime = dateTime().withDefault(currentDateAndTime)();
  late final status = text().map(const StudentStatusConverter())();
}

class TeachingRegistration extends Table {
  IntColumn get teacherId => integer().references(Teacher, #id)();
  TextColumn get courseId => text().references(Course, #id)();

  @override
  Set<Column> get primaryKey => {teacherId, courseId};
}

class CourseLimiting extends Table {
  TextColumn get courseId => text().references(Course, #id)();
  TextColumn get semesterId => text().references(Semester, #id)();

  @override
  Set<Column> get primaryKey => {courseId, semesterId};
}

class CourseClass extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get classId => text().named('maLopHoc')();
  @ReferenceName('course')
  TextColumn get courseId => text().named('maHocPhan')();
  IntColumn get teacherId => integer().nullable().named('idGiangVien')();
  IntColumn get registrationCount =>
      integer().withDefault(const Constant(0)).named('soLuongDangKy')();
  TextColumn get accessUrl => text().nullable().named('urlTruyCap')();
  DateTimeColumn get customBeginDate => dateTime().nullable()();
  DateTimeColumn get customEndDate => dateTime().nullable()();
  TextColumn get semester => text().named('hocKy')();
  TextColumn get classroom => text().nullable().named('phongHoc')();
  IntColumn get dayOfWeek =>
      integer().nullable().map(const DayOfWeekConverter()).named('ngayHoc')();
  IntColumn get startPeriod => integer().nullable().named('tietBatDau')();
  IntColumn get endPeriod => integer().nullable().named('tietKetThuc')();
  IntColumn get status => integer()
      .nullable()
      .map(const CourseClassStatusConverter())
      .named('trangThai')();
}

class TeachingAssignment extends Table {
  IntColumn get classId => integer().references(CourseClass, #id)();
  IntColumn get teacherId => integer().references(Teacher, #id)();
  IntColumn get sortOrder => integer().withDefault(const Constant(1))();
  RealColumn get weight => real().withDefault(const Constant(1.0))();

  @override
  Set<Column> get primaryKey => {classId, teacherId};
}

class StudyRegistration extends Table {
  IntColumn get classId => integer().references(CourseClass, #id)();
  IntColumn get studentId => integer().references(Student, #id)();
  RealColumn get midTermGrade => real().nullable()();
  RealColumn get finalTermGrade => real().nullable()();

  @override
  Set<Column> get primaryKey => {classId, studentId};
}
