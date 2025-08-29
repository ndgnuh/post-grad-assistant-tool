// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pods.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(allAcademicYears)
const allAcademicYearsProvider = AllAcademicYearsProvider._();

final class AllAcademicYearsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Semester>>,
          List<Semester>,
          FutureOr<List<Semester>>
        >
    with $FutureModifier<List<Semester>>, $FutureProvider<List<Semester>> {
  const AllAcademicYearsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allAcademicYearsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allAcademicYearsHash();

  @$internal
  @override
  $FutureProviderElement<List<Semester>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Semester>> create(Ref ref) {
    return allAcademicYears(ref);
  }
}

String _$allAcademicYearsHash() => r'c6ea43d7e393463850e7357ccebd1247026adfd2';

@ProviderFor(allCohorts)
const allCohortsProvider = AllCohortsProvider._();

final class AllCohortsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Cohort>>,
          List<Cohort>,
          FutureOr<List<Cohort>>
        >
    with $FutureModifier<List<Cohort>>, $FutureProvider<List<Cohort>> {
  const AllCohortsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allCohortsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allCohortsHash();

  @$internal
  @override
  $FutureProviderElement<List<Cohort>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Cohort>> create(Ref ref) {
    return allCohorts(ref);
  }
}

String _$allCohortsHash() => r'608f98e2613f448ff9c3db8a10ac7d3d56838959';

@ProviderFor(searchCohorts)
const searchCohortsProvider = SearchCohortsFamily._();

final class SearchCohortsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Cohort>>,
          List<Cohort>,
          FutureOr<List<Cohort>>
        >
    with $FutureModifier<List<Cohort>>, $FutureProvider<List<Cohort>> {
  const SearchCohortsProvider._({
    required SearchCohortsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchCohortsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchCohortsHash();

  @override
  String toString() {
    return r'searchCohortsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Cohort>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Cohort>> create(Ref ref) {
    final argument = this.argument as String;
    return searchCohorts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchCohortsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchCohortsHash() => r'45a46b06b22e015d3328c251d5fa5ce9235f5163';

final class SearchCohortsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Cohort>>, String> {
  const SearchCohortsFamily._()
    : super(
        retry: null,
        name: r'searchCohortsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchCohortsProvider call(String searchQuery) =>
      SearchCohortsProvider._(argument: searchQuery, from: this);

  @override
  String toString() => r'searchCohortsProvider';
}

@ProviderFor(getCurrentAcademicYear)
const getCurrentAcademicYearProvider = GetCurrentAcademicYearProvider._();

final class GetCurrentAcademicYearProvider
    extends $FunctionalProvider<AsyncValue<HocKy>, HocKy, FutureOr<HocKy>>
    with $FutureModifier<HocKy>, $FutureProvider<HocKy> {
  const GetCurrentAcademicYearProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentAcademicYearProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentAcademicYearHash();

  @$internal
  @override
  $FutureProviderElement<HocKy> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HocKy> create(Ref ref) {
    return getCurrentAcademicYear(ref);
  }
}

String _$getCurrentAcademicYearHash() =>
    r'277a90496e02e3d2f8d62e0e6088fc6e0a6ba6d4';

@ProviderFor(getStudentsByCohort)
const getStudentsByCohortProvider = GetStudentsByCohortFamily._();

final class GetStudentsByCohortProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Student>>,
          List<Student>,
          FutureOr<List<Student>>
        >
    with $FutureModifier<List<Student>>, $FutureProvider<List<Student>> {
  const GetStudentsByCohortProvider._({
    required GetStudentsByCohortFamily super.from,
    required Cohort super.argument,
  }) : super(
         retry: null,
         name: r'getStudentsByCohortProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getStudentsByCohortHash();

  @override
  String toString() {
    return r'getStudentsByCohortProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Student>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Student>> create(Ref ref) {
    final argument = this.argument as Cohort;
    return getStudentsByCohort(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetStudentsByCohortProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getStudentsByCohortHash() =>
    r'7b8d5c6dd18ab47df8903654bb0fb7d6139d95f6';

final class GetStudentsByCohortFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Student>>, Cohort> {
  const GetStudentsByCohortFamily._()
    : super(
        retry: null,
        name: r'getStudentsByCohortProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  GetStudentsByCohortProvider call(Cohort cohort) =>
      GetStudentsByCohortProvider._(argument: cohort, from: this);

  @override
  String toString() => r'getStudentsByCohortProvider';
}

@ProviderFor(getThesisByStudentOfCohorts)
const getThesisByStudentOfCohortsProvider =
    GetThesisByStudentOfCohortsFamily._();

final class GetThesisByStudentOfCohortsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<Student, Thesis?>>,
          Map<Student, Thesis?>,
          FutureOr<Map<Student, Thesis?>>
        >
    with
        $FutureModifier<Map<Student, Thesis?>>,
        $FutureProvider<Map<Student, Thesis?>> {
  const GetThesisByStudentOfCohortsProvider._({
    required GetThesisByStudentOfCohortsFamily super.from,
    required Cohort super.argument,
  }) : super(
         retry: null,
         name: r'getThesisByStudentOfCohortsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getThesisByStudentOfCohortsHash();

  @override
  String toString() {
    return r'getThesisByStudentOfCohortsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<Student, Thesis?>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<Student, Thesis?>> create(Ref ref) {
    final argument = this.argument as Cohort;
    return getThesisByStudentOfCohorts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetThesisByStudentOfCohortsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getThesisByStudentOfCohortsHash() =>
    r'093af98e63828d5796e0f0596e46a5b50ce5d967';

final class GetThesisByStudentOfCohortsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Map<Student, Thesis?>>, Cohort> {
  const GetThesisByStudentOfCohortsFamily._()
    : super(
        retry: null,
        name: r'getThesisByStudentOfCohortsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetThesisByStudentOfCohortsProvider call(Cohort cohort) =>
      GetThesisByStudentOfCohortsProvider._(argument: cohort, from: this);

  @override
  String toString() => r'getThesisByStudentOfCohortsProvider';
}

@ProviderFor(teacherById)
const teacherByIdProvider = TeacherByIdFamily._();

final class TeacherByIdProvider
    extends $FunctionalProvider<AsyncValue<Teacher>, Teacher, FutureOr<Teacher>>
    with $FutureModifier<Teacher>, $FutureProvider<Teacher> {
  const TeacherByIdProvider._({
    required TeacherByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'teacherByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$teacherByIdHash();

  @override
  String toString() {
    return r'teacherByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Teacher> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Teacher> create(Ref ref) {
    final argument = this.argument as int;
    return teacherById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TeacherByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$teacherByIdHash() => r'a90e91b909df9270b7310bf0cccf414823b0a6f6';

final class TeacherByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Teacher>, int> {
  const TeacherByIdFamily._()
    : super(
        retry: null,
        name: r'teacherByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TeacherByIdProvider call(int id) =>
      TeacherByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'teacherByIdProvider';
}

@ProviderFor(studentById)
const studentByIdProvider = StudentByIdFamily._();

final class StudentByIdProvider
    extends $FunctionalProvider<AsyncValue<Student>, Student, FutureOr<Student>>
    with $FutureModifier<Student>, $FutureProvider<Student> {
  const StudentByIdProvider._({
    required StudentByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'studentByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentByIdHash();

  @override
  String toString() {
    return r'studentByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Student> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Student> create(Ref ref) {
    final argument = this.argument as int;
    return studentById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentByIdHash() => r'67020f47963d49753eb99d4a5973ea4a6dbdbc86';

final class StudentByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Student>, int> {
  const StudentByIdFamily._()
    : super(
        retry: null,
        name: r'studentByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StudentByIdProvider call(int id) =>
      StudentByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'studentByIdProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
