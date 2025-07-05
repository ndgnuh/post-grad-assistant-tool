// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ql_de_tai.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MasterThesisTopicImpl _$$MasterThesisTopicImplFromJson(
        Map<String, dynamic> json) =>
    _$MasterThesisTopicImpl(
      advisor: json['advisor'] as String,
      nameVi: json['nameVi'] as String,
      nameEn: json['nameEn'] as String,
      note: json['note'] as String,
      studentName: json['studentName'] as String?,
      studentCode: json['studentCode'] as String?,
    );

Map<String, dynamic> _$$MasterThesisTopicImplToJson(
        _$MasterThesisTopicImpl instance) =>
    <String, dynamic>{
      'advisor': instance.advisor,
      'nameVi': instance.nameVi,
      'nameEn': instance.nameEn,
      'note': instance.note,
      'studentName': instance.studentName,
      'studentCode': instance.studentCode,
    };
