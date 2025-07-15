// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thesis_assign_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiaoDeTaiImpl _$$GiaoDeTaiImplFromJson(Map<String, dynamic> json) =>
    _$GiaoDeTaiImpl(
      studentId: (json['studentId'] as num).toInt(),
      studentName: json['studentName'] as String,
      studentCode: json['studentCode'] as String,
      thesisId: (json['thesisId'] as num?)?.toInt(),
      teacherId: (json['teacherId'] as num?)?.toInt(),
      teacherName: json['teacherName'] as String?,
      thesisEnglishName: json['thesisEnglishName'] as String?,
      thesisVietnameseName: json['thesisVietnameseName'] as String?,
    );

Map<String, dynamic> _$$GiaoDeTaiImplToJson(_$GiaoDeTaiImpl instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'studentCode': instance.studentCode,
      'thesisId': instance.thesisId,
      'teacherId': instance.teacherId,
      'teacherName': instance.teacherName,
      'thesisEnglishName': instance.thesisEnglishName,
      'thesisVietnameseName': instance.thesisVietnameseName,
    };
