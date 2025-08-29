// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ql_de_tai.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MasterThesisTopic _$MasterThesisTopicFromJson(Map<String, dynamic> json) =>
    _MasterThesisTopic(
      advisor: json['advisor'] as String,
      nameVi: json['nameVi'] as String,
      nameEn: json['nameEn'] as String,
      note: json['note'] as String,
      studentName: json['studentName'] as String?,
      studentCode: json['studentCode'] as String?,
    );

Map<String, dynamic> _$MasterThesisTopicToJson(_MasterThesisTopic instance) =>
    <String, dynamic>{
      'advisor': instance.advisor,
      'nameVi': instance.nameVi,
      'nameEn': instance.nameEn,
      'note': instance.note,
      'studentName': instance.studentName,
      'studentCode': instance.studentCode,
    };
