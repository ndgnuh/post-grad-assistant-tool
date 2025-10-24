// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_import.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JsonSchema _$JsonSchemaFromJson(Map<String, dynamic> json) => _JsonSchema(
  admissionId: json['admissionId'] as String,
  admissionType: const AdmissionTypeWebConverter().fromJson(
    json['admissionType'] as String,
  ),
  name: json['name'] as String,
  gender: const GenderWebConverter().fromJson(json['gender'] as String),
  dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
  placeOfBirth: json['placeOfBirth'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String,
  bachelorUniversity: json['bachelorUniversity'] as String,
  bachelorMajor: json['bachelorMajor'] as String,
  bachelorDegreeType: json['bachelorDegreeType'] as String,
  bachelorGraduationDate: DateTime.parse(
    json['bachelorGraduationDate'] as String,
  ),
  bachelorGraduationRank: json['bachelorGraduationRank'] as String,
  masterMajor: json['masterMajor'] as String,
  specializationOrientation: json['specializationOrientation'] as String,
);

Map<String, dynamic> _$JsonSchemaToJson(
  _JsonSchema instance,
) => <String, dynamic>{
  'admissionId': instance.admissionId,
  'admissionType': const AdmissionTypeWebConverter().toJson(
    instance.admissionType,
  ),
  'name': instance.name,
  'gender': const GenderWebConverter().toJson(instance.gender),
  'dateOfBirth': instance.dateOfBirth.toIso8601String(),
  'placeOfBirth': instance.placeOfBirth,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'bachelorUniversity': instance.bachelorUniversity,
  'bachelorMajor': instance.bachelorMajor,
  'bachelorDegreeType': instance.bachelorDegreeType,
  'bachelorGraduationDate': instance.bachelorGraduationDate.toIso8601String(),
  'bachelorGraduationRank': instance.bachelorGraduationRank,
  'masterMajor': instance.masterMajor,
  'specializationOrientation': instance.specializationOrientation,
};
