// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhdStudent _$PhdStudentFromJson(Map<String, dynamic> json) => _PhdStudent(
  id: (json['id'] as num).toInt(),
  cohorts: json['cohorts'] as String,
  managementId: json['managementId'] as String?,
  admissionId: json['admissionId'] as String?,
  name: json['name'] as String,
  gender: $enumDecode(_$GioiTinhEnumMap, json['gender']),
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  placeOfBirth: json['placeOfBirth'] as String?,
  phone: json['phone'] as String,
  privateEmail: json['privateEmail'] as String,
  majorName: json['majorName'] as String,
  majorId: (json['majorId'] as num).toInt(),
  majorSpecialize: json['majorSpecialize'] as String,
  admissionPresidentId: (json['admissionPresidentId'] as num?)?.toInt(),
  admissionSecretaryId: (json['admissionSecretaryId'] as num?)?.toInt(),
  admission1stMemberId: (json['admission1stMemberId'] as num?)?.toInt(),
  admission2ndMemberId: (json['admission2ndMemberId'] as num?)?.toInt(),
  admission3rdMemberId: (json['admission3rdMemberId'] as num?)?.toInt(),
  admissionPaid: json['admissionPaid'] as bool? ?? false,
  thesis: json['thesis'] as String,
  supervisorId: (json['supervisorId'] as num).toInt(),
  secondarySupervisorId: (json['secondarySupervisorId'] as num?)?.toInt(),
  schoolEmail: json['schoolEmail'] as String,
  createdTime: DateTime.parse(json['createdTime'] as String),
  updatedTime: DateTime.parse(json['updatedTime'] as String),
);

Map<String, dynamic> _$PhdStudentToJson(_PhdStudent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cohorts': instance.cohorts,
      'managementId': instance.managementId,
      'admissionId': instance.admissionId,
      'name': instance.name,
      'gender': _$GioiTinhEnumMap[instance.gender]!,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'placeOfBirth': instance.placeOfBirth,
      'phone': instance.phone,
      'privateEmail': instance.privateEmail,
      'majorName': instance.majorName,
      'majorId': instance.majorId,
      'majorSpecialize': instance.majorSpecialize,
      'admissionPresidentId': instance.admissionPresidentId,
      'admissionSecretaryId': instance.admissionSecretaryId,
      'admission1stMemberId': instance.admission1stMemberId,
      'admission2ndMemberId': instance.admission2ndMemberId,
      'admission3rdMemberId': instance.admission3rdMemberId,
      'admissionPaid': instance.admissionPaid,
      'thesis': instance.thesis,
      'supervisorId': instance.supervisorId,
      'secondarySupervisorId': instance.secondarySupervisorId,
      'schoolEmail': instance.schoolEmail,
      'createdTime': instance.createdTime.toIso8601String(),
      'updatedTime': instance.updatedTime.toIso8601String(),
    };

const _$GioiTinhEnumMap = {GioiTinh.nam: 'M', GioiTinh.nu: 'F'};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(allPhdCohorts)
const allPhdCohortsProvider = AllPhdCohortsProvider._();

final class AllPhdCohortsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  const AllPhdCohortsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allPhdCohortsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allPhdCohortsHash();

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    return allPhdCohorts(ref);
  }
}

String _$allPhdCohortsHash() => r'fd796cec5ef7ac3ffcf488e614f2c819e34658f6';

@ProviderFor(phdStudentsByCohorts)
const phdStudentsByCohortsProvider = PhdStudentsByCohortsFamily._();

final class PhdStudentsByCohortsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PhdStudent>>,
          List<PhdStudent>,
          FutureOr<List<PhdStudent>>
        >
    with $FutureModifier<List<PhdStudent>>, $FutureProvider<List<PhdStudent>> {
  const PhdStudentsByCohortsProvider._({
    required PhdStudentsByCohortsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'phdStudentsByCohortsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$phdStudentsByCohortsHash();

  @override
  String toString() {
    return r'phdStudentsByCohortsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<PhdStudent>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PhdStudent>> create(Ref ref) {
    final argument = this.argument as String;
    return phdStudentsByCohorts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PhdStudentsByCohortsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$phdStudentsByCohortsHash() =>
    r'e8be6770dfe637edb7a2d3ff311c6902b13984e4';

final class PhdStudentsByCohortsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<PhdStudent>>, String> {
  const PhdStudentsByCohortsFamily._()
    : super(
        retry: null,
        name: r'phdStudentsByCohortsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PhdStudentsByCohortsProvider call(String cohorts) =>
      PhdStudentsByCohortsProvider._(argument: cohorts, from: this);

  @override
  String toString() => r'phdStudentsByCohortsProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
