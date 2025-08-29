// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ql_de_tai.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MasterThesisTopic {

 String get advisor; String get nameVi; String get nameEn; String get note; String? get studentName; String? get studentCode;
/// Create a copy of MasterThesisTopic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MasterThesisTopicCopyWith<MasterThesisTopic> get copyWith => _$MasterThesisTopicCopyWithImpl<MasterThesisTopic>(this as MasterThesisTopic, _$identity);

  /// Serializes this MasterThesisTopic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MasterThesisTopic&&(identical(other.advisor, advisor) || other.advisor == advisor)&&(identical(other.nameVi, nameVi) || other.nameVi == nameVi)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.note, note) || other.note == note)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.studentCode, studentCode) || other.studentCode == studentCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,advisor,nameVi,nameEn,note,studentName,studentCode);

@override
String toString() {
  return 'MasterThesisTopic(advisor: $advisor, nameVi: $nameVi, nameEn: $nameEn, note: $note, studentName: $studentName, studentCode: $studentCode)';
}


}

/// @nodoc
abstract mixin class $MasterThesisTopicCopyWith<$Res>  {
  factory $MasterThesisTopicCopyWith(MasterThesisTopic value, $Res Function(MasterThesisTopic) _then) = _$MasterThesisTopicCopyWithImpl;
@useResult
$Res call({
 String advisor, String nameVi, String nameEn, String note, String? studentName, String? studentCode
});




}
/// @nodoc
class _$MasterThesisTopicCopyWithImpl<$Res>
    implements $MasterThesisTopicCopyWith<$Res> {
  _$MasterThesisTopicCopyWithImpl(this._self, this._then);

  final MasterThesisTopic _self;
  final $Res Function(MasterThesisTopic) _then;

/// Create a copy of MasterThesisTopic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? advisor = null,Object? nameVi = null,Object? nameEn = null,Object? note = null,Object? studentName = freezed,Object? studentCode = freezed,}) {
  return _then(_self.copyWith(
advisor: null == advisor ? _self.advisor : advisor // ignore: cast_nullable_to_non_nullable
as String,nameVi: null == nameVi ? _self.nameVi : nameVi // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,studentName: freezed == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String?,studentCode: freezed == studentCode ? _self.studentCode : studentCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MasterThesisTopic].
extension MasterThesisTopicPatterns on MasterThesisTopic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MasterThesisTopic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MasterThesisTopic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MasterThesisTopic value)  $default,){
final _that = this;
switch (_that) {
case _MasterThesisTopic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MasterThesisTopic value)?  $default,){
final _that = this;
switch (_that) {
case _MasterThesisTopic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String advisor,  String nameVi,  String nameEn,  String note,  String? studentName,  String? studentCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MasterThesisTopic() when $default != null:
return $default(_that.advisor,_that.nameVi,_that.nameEn,_that.note,_that.studentName,_that.studentCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String advisor,  String nameVi,  String nameEn,  String note,  String? studentName,  String? studentCode)  $default,) {final _that = this;
switch (_that) {
case _MasterThesisTopic():
return $default(_that.advisor,_that.nameVi,_that.nameEn,_that.note,_that.studentName,_that.studentCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String advisor,  String nameVi,  String nameEn,  String note,  String? studentName,  String? studentCode)?  $default,) {final _that = this;
switch (_that) {
case _MasterThesisTopic() when $default != null:
return $default(_that.advisor,_that.nameVi,_that.nameEn,_that.note,_that.studentName,_that.studentCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MasterThesisTopic extends MasterThesisTopic {
  const _MasterThesisTopic({required this.advisor, required this.nameVi, required this.nameEn, required this.note, this.studentName, this.studentCode}): super._();
  factory _MasterThesisTopic.fromJson(Map<String, dynamic> json) => _$MasterThesisTopicFromJson(json);

@override final  String advisor;
@override final  String nameVi;
@override final  String nameEn;
@override final  String note;
@override final  String? studentName;
@override final  String? studentCode;

/// Create a copy of MasterThesisTopic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MasterThesisTopicCopyWith<_MasterThesisTopic> get copyWith => __$MasterThesisTopicCopyWithImpl<_MasterThesisTopic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MasterThesisTopicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MasterThesisTopic&&(identical(other.advisor, advisor) || other.advisor == advisor)&&(identical(other.nameVi, nameVi) || other.nameVi == nameVi)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.note, note) || other.note == note)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.studentCode, studentCode) || other.studentCode == studentCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,advisor,nameVi,nameEn,note,studentName,studentCode);

@override
String toString() {
  return 'MasterThesisTopic(advisor: $advisor, nameVi: $nameVi, nameEn: $nameEn, note: $note, studentName: $studentName, studentCode: $studentCode)';
}


}

/// @nodoc
abstract mixin class _$MasterThesisTopicCopyWith<$Res> implements $MasterThesisTopicCopyWith<$Res> {
  factory _$MasterThesisTopicCopyWith(_MasterThesisTopic value, $Res Function(_MasterThesisTopic) _then) = __$MasterThesisTopicCopyWithImpl;
@override @useResult
$Res call({
 String advisor, String nameVi, String nameEn, String note, String? studentName, String? studentCode
});




}
/// @nodoc
class __$MasterThesisTopicCopyWithImpl<$Res>
    implements _$MasterThesisTopicCopyWith<$Res> {
  __$MasterThesisTopicCopyWithImpl(this._self, this._then);

  final _MasterThesisTopic _self;
  final $Res Function(_MasterThesisTopic) _then;

/// Create a copy of MasterThesisTopic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? advisor = null,Object? nameVi = null,Object? nameEn = null,Object? note = null,Object? studentName = freezed,Object? studentCode = freezed,}) {
  return _then(_MasterThesisTopic(
advisor: null == advisor ? _self.advisor : advisor // ignore: cast_nullable_to_non_nullable
as String,nameVi: null == nameVi ? _self.nameVi : nameVi // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,studentName: freezed == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String?,studentCode: freezed == studentCode ? _self.studentCode : studentCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
