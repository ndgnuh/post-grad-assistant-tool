// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_classes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseClassData _$CourseClassDataFromJson(Map<String, dynamic> json) =>
    _CourseClassData(
      classId: (json['classId'] as num).toInt(),
      classCode: json['classCode'] as String,
      subjectId: json['subjectId'] as String,
      subjectName: json['subjectName'] as String,
      statusFlag: (json['statusFlag'] as num).toInt(),
      numRegistered: (json['numRegistered'] as num).toInt(),
      teacherId: (json['teacherId'] as num?)?.toInt(),
      teacherName: json['teacherName'] as String?,
      teacherEmail: json['teacherEmail'] as String?,
    );

Map<String, dynamic> _$CourseClassDataToJson(_CourseClassData instance) =>
    <String, dynamic>{
      'classId': instance.classId,
      'classCode': instance.classCode,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'statusFlag': instance.statusFlag,
      'numRegistered': instance.numRegistered,
      'teacherId': instance.teacherId,
      'teacherName': instance.teacherName,
      'teacherEmail': instance.teacherEmail,
    };
