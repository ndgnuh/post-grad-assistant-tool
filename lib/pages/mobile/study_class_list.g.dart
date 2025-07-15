// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_class_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseClassDataImpl _$$CourseClassDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseClassDataImpl(
      classId: (json['classId'] as num).toInt(),
      classCode: json['classCode'] as String,
      subjectId: json['subjectId'] as String,
      subjectName: json['subjectName'] as String,
      statusFlag: (json['statusFlag'] as num).toInt(),
      teacherId: (json['teacherId'] as num?)?.toInt(),
      teacherName: json['teacherName'] as String?,
      teacherEmail: json['teacherEmail'] as String?,
    );

Map<String, dynamic> _$$CourseClassDataImplToJson(
        _$CourseClassDataImpl instance) =>
    <String, dynamic>{
      'classId': instance.classId,
      'classCode': instance.classCode,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'statusFlag': instance.statusFlag,
      'teacherId': instance.teacherId,
      'teacherName': instance.teacherName,
      'teacherEmail': instance.teacherEmail,
    };
