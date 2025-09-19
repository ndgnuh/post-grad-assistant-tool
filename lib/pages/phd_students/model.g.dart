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

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
