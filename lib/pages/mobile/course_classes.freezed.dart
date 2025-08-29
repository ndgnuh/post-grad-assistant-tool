// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseClassData {

 int get classId; String get classCode; String get subjectId; String get subjectName; int get statusFlag; int get numRegistered; int? get teacherId; String? get teacherName; String? get teacherEmail;
/// Create a copy of CourseClassData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseClassDataCopyWith<CourseClassData> get copyWith => _$CourseClassDataCopyWithImpl<CourseClassData>(this as CourseClassData, _$identity);

  /// Serializes this CourseClassData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseClassData&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.classCode, classCode) || other.classCode == classCode)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.statusFlag, statusFlag) || other.statusFlag == statusFlag)&&(identical(other.numRegistered, numRegistered) || other.numRegistered == numRegistered)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.teacherEmail, teacherEmail) || other.teacherEmail == teacherEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId,classCode,subjectId,subjectName,statusFlag,numRegistered,teacherId,teacherName,teacherEmail);

@override
String toString() {
  return 'CourseClassData(classId: $classId, classCode: $classCode, subjectId: $subjectId, subjectName: $subjectName, statusFlag: $statusFlag, numRegistered: $numRegistered, teacherId: $teacherId, teacherName: $teacherName, teacherEmail: $teacherEmail)';
}


}

/// @nodoc
abstract mixin class $CourseClassDataCopyWith<$Res>  {
  factory $CourseClassDataCopyWith(CourseClassData value, $Res Function(CourseClassData) _then) = _$CourseClassDataCopyWithImpl;
@useResult
$Res call({
 int classId, String classCode, String subjectId, String subjectName, int statusFlag, int numRegistered, int? teacherId, String? teacherName, String? teacherEmail
});




}
/// @nodoc
class _$CourseClassDataCopyWithImpl<$Res>
    implements $CourseClassDataCopyWith<$Res> {
  _$CourseClassDataCopyWithImpl(this._self, this._then);

  final CourseClassData _self;
  final $Res Function(CourseClassData) _then;

/// Create a copy of CourseClassData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classId = null,Object? classCode = null,Object? subjectId = null,Object? subjectName = null,Object? statusFlag = null,Object? numRegistered = null,Object? teacherId = freezed,Object? teacherName = freezed,Object? teacherEmail = freezed,}) {
  return _then(_self.copyWith(
classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as int,classCode: null == classCode ? _self.classCode : classCode // ignore: cast_nullable_to_non_nullable
as String,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,subjectName: null == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String,statusFlag: null == statusFlag ? _self.statusFlag : statusFlag // ignore: cast_nullable_to_non_nullable
as int,numRegistered: null == numRegistered ? _self.numRegistered : numRegistered // ignore: cast_nullable_to_non_nullable
as int,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as int?,teacherName: freezed == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String?,teacherEmail: freezed == teacherEmail ? _self.teacherEmail : teacherEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseClassData].
extension CourseClassDataPatterns on CourseClassData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseClassData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseClassData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseClassData value)  $default,){
final _that = this;
switch (_that) {
case _CourseClassData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseClassData value)?  $default,){
final _that = this;
switch (_that) {
case _CourseClassData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int classId,  String classCode,  String subjectId,  String subjectName,  int statusFlag,  int numRegistered,  int? teacherId,  String? teacherName,  String? teacherEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseClassData() when $default != null:
return $default(_that.classId,_that.classCode,_that.subjectId,_that.subjectName,_that.statusFlag,_that.numRegistered,_that.teacherId,_that.teacherName,_that.teacherEmail);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int classId,  String classCode,  String subjectId,  String subjectName,  int statusFlag,  int numRegistered,  int? teacherId,  String? teacherName,  String? teacherEmail)  $default,) {final _that = this;
switch (_that) {
case _CourseClassData():
return $default(_that.classId,_that.classCode,_that.subjectId,_that.subjectName,_that.statusFlag,_that.numRegistered,_that.teacherId,_that.teacherName,_that.teacherEmail);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int classId,  String classCode,  String subjectId,  String subjectName,  int statusFlag,  int numRegistered,  int? teacherId,  String? teacherName,  String? teacherEmail)?  $default,) {final _that = this;
switch (_that) {
case _CourseClassData() when $default != null:
return $default(_that.classId,_that.classCode,_that.subjectId,_that.subjectName,_that.statusFlag,_that.numRegistered,_that.teacherId,_that.teacherName,_that.teacherEmail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseClassData extends CourseClassData {
  const _CourseClassData({required this.classId, required this.classCode, required this.subjectId, required this.subjectName, required this.statusFlag, required this.numRegistered, this.teacherId, this.teacherName, this.teacherEmail}): super._();
  factory _CourseClassData.fromJson(Map<String, dynamic> json) => _$CourseClassDataFromJson(json);

@override final  int classId;
@override final  String classCode;
@override final  String subjectId;
@override final  String subjectName;
@override final  int statusFlag;
@override final  int numRegistered;
@override final  int? teacherId;
@override final  String? teacherName;
@override final  String? teacherEmail;

/// Create a copy of CourseClassData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseClassDataCopyWith<_CourseClassData> get copyWith => __$CourseClassDataCopyWithImpl<_CourseClassData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseClassDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseClassData&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.classCode, classCode) || other.classCode == classCode)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.statusFlag, statusFlag) || other.statusFlag == statusFlag)&&(identical(other.numRegistered, numRegistered) || other.numRegistered == numRegistered)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.teacherEmail, teacherEmail) || other.teacherEmail == teacherEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId,classCode,subjectId,subjectName,statusFlag,numRegistered,teacherId,teacherName,teacherEmail);

@override
String toString() {
  return 'CourseClassData(classId: $classId, classCode: $classCode, subjectId: $subjectId, subjectName: $subjectName, statusFlag: $statusFlag, numRegistered: $numRegistered, teacherId: $teacherId, teacherName: $teacherName, teacherEmail: $teacherEmail)';
}


}

/// @nodoc
abstract mixin class _$CourseClassDataCopyWith<$Res> implements $CourseClassDataCopyWith<$Res> {
  factory _$CourseClassDataCopyWith(_CourseClassData value, $Res Function(_CourseClassData) _then) = __$CourseClassDataCopyWithImpl;
@override @useResult
$Res call({
 int classId, String classCode, String subjectId, String subjectName, int statusFlag, int numRegistered, int? teacherId, String? teacherName, String? teacherEmail
});




}
/// @nodoc
class __$CourseClassDataCopyWithImpl<$Res>
    implements _$CourseClassDataCopyWith<$Res> {
  __$CourseClassDataCopyWithImpl(this._self, this._then);

  final _CourseClassData _self;
  final $Res Function(_CourseClassData) _then;

/// Create a copy of CourseClassData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classId = null,Object? classCode = null,Object? subjectId = null,Object? subjectName = null,Object? statusFlag = null,Object? numRegistered = null,Object? teacherId = freezed,Object? teacherName = freezed,Object? teacherEmail = freezed,}) {
  return _then(_CourseClassData(
classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as int,classCode: null == classCode ? _self.classCode : classCode // ignore: cast_nullable_to_non_nullable
as String,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,subjectName: null == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String,statusFlag: null == statusFlag ? _self.statusFlag : statusFlag // ignore: cast_nullable_to_non_nullable
as int,numRegistered: null == numRegistered ? _self.numRegistered : numRegistered // ignore: cast_nullable_to_non_nullable
as int,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as int?,teacherName: freezed == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String?,teacherEmail: freezed == teacherEmail ? _self.teacherEmail : teacherEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
