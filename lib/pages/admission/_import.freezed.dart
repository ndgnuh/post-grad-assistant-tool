// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '_import.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JsonSchema {

 String get admissionId;@AdmissionTypeWebConverter() AdmissionType get admissionType; String get name;@GenderWebConverter() Gender get gender; DateTime get dateOfBirth; String get placeOfBirth; String get email; String get phoneNumber; String get bachelorUniversity; String get bachelorMajor; String get bachelorDegreeType; DateTime get bachelorGraduationDate; String get bachelorGraduationRank; String get masterMajor; String get specializationOrientation;
/// Create a copy of JsonSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonSchemaCopyWith<JsonSchema> get copyWith => _$JsonSchemaCopyWithImpl<JsonSchema>(this as JsonSchema, _$identity);

  /// Serializes this JsonSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonSchema&&(identical(other.admissionId, admissionId) || other.admissionId == admissionId)&&(identical(other.admissionType, admissionType) || other.admissionType == admissionType)&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.placeOfBirth, placeOfBirth) || other.placeOfBirth == placeOfBirth)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.bachelorUniversity, bachelorUniversity) || other.bachelorUniversity == bachelorUniversity)&&(identical(other.bachelorMajor, bachelorMajor) || other.bachelorMajor == bachelorMajor)&&(identical(other.bachelorDegreeType, bachelorDegreeType) || other.bachelorDegreeType == bachelorDegreeType)&&(identical(other.bachelorGraduationDate, bachelorGraduationDate) || other.bachelorGraduationDate == bachelorGraduationDate)&&(identical(other.bachelorGraduationRank, bachelorGraduationRank) || other.bachelorGraduationRank == bachelorGraduationRank)&&(identical(other.masterMajor, masterMajor) || other.masterMajor == masterMajor)&&(identical(other.specializationOrientation, specializationOrientation) || other.specializationOrientation == specializationOrientation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionId,admissionType,name,gender,dateOfBirth,placeOfBirth,email,phoneNumber,bachelorUniversity,bachelorMajor,bachelorDegreeType,bachelorGraduationDate,bachelorGraduationRank,masterMajor,specializationOrientation);

@override
String toString() {
  return 'JsonSchema(admissionId: $admissionId, admissionType: $admissionType, name: $name, gender: $gender, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, email: $email, phoneNumber: $phoneNumber, bachelorUniversity: $bachelorUniversity, bachelorMajor: $bachelorMajor, bachelorDegreeType: $bachelorDegreeType, bachelorGraduationDate: $bachelorGraduationDate, bachelorGraduationRank: $bachelorGraduationRank, masterMajor: $masterMajor, specializationOrientation: $specializationOrientation)';
}


}

/// @nodoc
abstract mixin class $JsonSchemaCopyWith<$Res>  {
  factory $JsonSchemaCopyWith(JsonSchema value, $Res Function(JsonSchema) _then) = _$JsonSchemaCopyWithImpl;
@useResult
$Res call({
 String admissionId,@AdmissionTypeWebConverter() AdmissionType admissionType, String name,@GenderWebConverter() Gender gender, DateTime dateOfBirth, String placeOfBirth, String email, String phoneNumber, String bachelorUniversity, String bachelorMajor, String bachelorDegreeType, DateTime bachelorGraduationDate, String bachelorGraduationRank, String masterMajor, String specializationOrientation
});




}
/// @nodoc
class _$JsonSchemaCopyWithImpl<$Res>
    implements $JsonSchemaCopyWith<$Res> {
  _$JsonSchemaCopyWithImpl(this._self, this._then);

  final JsonSchema _self;
  final $Res Function(JsonSchema) _then;

/// Create a copy of JsonSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? admissionId = null,Object? admissionType = null,Object? name = null,Object? gender = null,Object? dateOfBirth = null,Object? placeOfBirth = null,Object? email = null,Object? phoneNumber = null,Object? bachelorUniversity = null,Object? bachelorMajor = null,Object? bachelorDegreeType = null,Object? bachelorGraduationDate = null,Object? bachelorGraduationRank = null,Object? masterMajor = null,Object? specializationOrientation = null,}) {
  return _then(_self.copyWith(
admissionId: null == admissionId ? _self.admissionId : admissionId // ignore: cast_nullable_to_non_nullable
as String,admissionType: null == admissionType ? _self.admissionType : admissionType // ignore: cast_nullable_to_non_nullable
as AdmissionType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,placeOfBirth: null == placeOfBirth ? _self.placeOfBirth : placeOfBirth // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,bachelorUniversity: null == bachelorUniversity ? _self.bachelorUniversity : bachelorUniversity // ignore: cast_nullable_to_non_nullable
as String,bachelorMajor: null == bachelorMajor ? _self.bachelorMajor : bachelorMajor // ignore: cast_nullable_to_non_nullable
as String,bachelorDegreeType: null == bachelorDegreeType ? _self.bachelorDegreeType : bachelorDegreeType // ignore: cast_nullable_to_non_nullable
as String,bachelorGraduationDate: null == bachelorGraduationDate ? _self.bachelorGraduationDate : bachelorGraduationDate // ignore: cast_nullable_to_non_nullable
as DateTime,bachelorGraduationRank: null == bachelorGraduationRank ? _self.bachelorGraduationRank : bachelorGraduationRank // ignore: cast_nullable_to_non_nullable
as String,masterMajor: null == masterMajor ? _self.masterMajor : masterMajor // ignore: cast_nullable_to_non_nullable
as String,specializationOrientation: null == specializationOrientation ? _self.specializationOrientation : specializationOrientation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JsonSchema].
extension JsonSchemaPatterns on JsonSchema {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JsonSchema value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JsonSchema() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JsonSchema value)  $default,){
final _that = this;
switch (_that) {
case _JsonSchema():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JsonSchema value)?  $default,){
final _that = this;
switch (_that) {
case _JsonSchema() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String admissionId, @AdmissionTypeWebConverter()  AdmissionType admissionType,  String name, @GenderWebConverter()  Gender gender,  DateTime dateOfBirth,  String placeOfBirth,  String email,  String phoneNumber,  String bachelorUniversity,  String bachelorMajor,  String bachelorDegreeType,  DateTime bachelorGraduationDate,  String bachelorGraduationRank,  String masterMajor,  String specializationOrientation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JsonSchema() when $default != null:
return $default(_that.admissionId,_that.admissionType,_that.name,_that.gender,_that.dateOfBirth,_that.placeOfBirth,_that.email,_that.phoneNumber,_that.bachelorUniversity,_that.bachelorMajor,_that.bachelorDegreeType,_that.bachelorGraduationDate,_that.bachelorGraduationRank,_that.masterMajor,_that.specializationOrientation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String admissionId, @AdmissionTypeWebConverter()  AdmissionType admissionType,  String name, @GenderWebConverter()  Gender gender,  DateTime dateOfBirth,  String placeOfBirth,  String email,  String phoneNumber,  String bachelorUniversity,  String bachelorMajor,  String bachelorDegreeType,  DateTime bachelorGraduationDate,  String bachelorGraduationRank,  String masterMajor,  String specializationOrientation)  $default,) {final _that = this;
switch (_that) {
case _JsonSchema():
return $default(_that.admissionId,_that.admissionType,_that.name,_that.gender,_that.dateOfBirth,_that.placeOfBirth,_that.email,_that.phoneNumber,_that.bachelorUniversity,_that.bachelorMajor,_that.bachelorDegreeType,_that.bachelorGraduationDate,_that.bachelorGraduationRank,_that.masterMajor,_that.specializationOrientation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String admissionId, @AdmissionTypeWebConverter()  AdmissionType admissionType,  String name, @GenderWebConverter()  Gender gender,  DateTime dateOfBirth,  String placeOfBirth,  String email,  String phoneNumber,  String bachelorUniversity,  String bachelorMajor,  String bachelorDegreeType,  DateTime bachelorGraduationDate,  String bachelorGraduationRank,  String masterMajor,  String specializationOrientation)?  $default,) {final _that = this;
switch (_that) {
case _JsonSchema() when $default != null:
return $default(_that.admissionId,_that.admissionType,_that.name,_that.gender,_that.dateOfBirth,_that.placeOfBirth,_that.email,_that.phoneNumber,_that.bachelorUniversity,_that.bachelorMajor,_that.bachelorDegreeType,_that.bachelorGraduationDate,_that.bachelorGraduationRank,_that.masterMajor,_that.specializationOrientation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JsonSchema extends JsonSchema {
  const _JsonSchema({required this.admissionId, @AdmissionTypeWebConverter() required this.admissionType, required this.name, @GenderWebConverter() required this.gender, required this.dateOfBirth, required this.placeOfBirth, required this.email, required this.phoneNumber, required this.bachelorUniversity, required this.bachelorMajor, required this.bachelorDegreeType, required this.bachelorGraduationDate, required this.bachelorGraduationRank, required this.masterMajor, required this.specializationOrientation}): super._();
  factory _JsonSchema.fromJson(Map<String, dynamic> json) => _$JsonSchemaFromJson(json);

@override final  String admissionId;
@override@AdmissionTypeWebConverter() final  AdmissionType admissionType;
@override final  String name;
@override@GenderWebConverter() final  Gender gender;
@override final  DateTime dateOfBirth;
@override final  String placeOfBirth;
@override final  String email;
@override final  String phoneNumber;
@override final  String bachelorUniversity;
@override final  String bachelorMajor;
@override final  String bachelorDegreeType;
@override final  DateTime bachelorGraduationDate;
@override final  String bachelorGraduationRank;
@override final  String masterMajor;
@override final  String specializationOrientation;

/// Create a copy of JsonSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonSchemaCopyWith<_JsonSchema> get copyWith => __$JsonSchemaCopyWithImpl<_JsonSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JsonSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonSchema&&(identical(other.admissionId, admissionId) || other.admissionId == admissionId)&&(identical(other.admissionType, admissionType) || other.admissionType == admissionType)&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.placeOfBirth, placeOfBirth) || other.placeOfBirth == placeOfBirth)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.bachelorUniversity, bachelorUniversity) || other.bachelorUniversity == bachelorUniversity)&&(identical(other.bachelorMajor, bachelorMajor) || other.bachelorMajor == bachelorMajor)&&(identical(other.bachelorDegreeType, bachelorDegreeType) || other.bachelorDegreeType == bachelorDegreeType)&&(identical(other.bachelorGraduationDate, bachelorGraduationDate) || other.bachelorGraduationDate == bachelorGraduationDate)&&(identical(other.bachelorGraduationRank, bachelorGraduationRank) || other.bachelorGraduationRank == bachelorGraduationRank)&&(identical(other.masterMajor, masterMajor) || other.masterMajor == masterMajor)&&(identical(other.specializationOrientation, specializationOrientation) || other.specializationOrientation == specializationOrientation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionId,admissionType,name,gender,dateOfBirth,placeOfBirth,email,phoneNumber,bachelorUniversity,bachelorMajor,bachelorDegreeType,bachelorGraduationDate,bachelorGraduationRank,masterMajor,specializationOrientation);

@override
String toString() {
  return 'JsonSchema(admissionId: $admissionId, admissionType: $admissionType, name: $name, gender: $gender, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, email: $email, phoneNumber: $phoneNumber, bachelorUniversity: $bachelorUniversity, bachelorMajor: $bachelorMajor, bachelorDegreeType: $bachelorDegreeType, bachelorGraduationDate: $bachelorGraduationDate, bachelorGraduationRank: $bachelorGraduationRank, masterMajor: $masterMajor, specializationOrientation: $specializationOrientation)';
}


}

/// @nodoc
abstract mixin class _$JsonSchemaCopyWith<$Res> implements $JsonSchemaCopyWith<$Res> {
  factory _$JsonSchemaCopyWith(_JsonSchema value, $Res Function(_JsonSchema) _then) = __$JsonSchemaCopyWithImpl;
@override @useResult
$Res call({
 String admissionId,@AdmissionTypeWebConverter() AdmissionType admissionType, String name,@GenderWebConverter() Gender gender, DateTime dateOfBirth, String placeOfBirth, String email, String phoneNumber, String bachelorUniversity, String bachelorMajor, String bachelorDegreeType, DateTime bachelorGraduationDate, String bachelorGraduationRank, String masterMajor, String specializationOrientation
});




}
/// @nodoc
class __$JsonSchemaCopyWithImpl<$Res>
    implements _$JsonSchemaCopyWith<$Res> {
  __$JsonSchemaCopyWithImpl(this._self, this._then);

  final _JsonSchema _self;
  final $Res Function(_JsonSchema) _then;

/// Create a copy of JsonSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? admissionId = null,Object? admissionType = null,Object? name = null,Object? gender = null,Object? dateOfBirth = null,Object? placeOfBirth = null,Object? email = null,Object? phoneNumber = null,Object? bachelorUniversity = null,Object? bachelorMajor = null,Object? bachelorDegreeType = null,Object? bachelorGraduationDate = null,Object? bachelorGraduationRank = null,Object? masterMajor = null,Object? specializationOrientation = null,}) {
  return _then(_JsonSchema(
admissionId: null == admissionId ? _self.admissionId : admissionId // ignore: cast_nullable_to_non_nullable
as String,admissionType: null == admissionType ? _self.admissionType : admissionType // ignore: cast_nullable_to_non_nullable
as AdmissionType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,placeOfBirth: null == placeOfBirth ? _self.placeOfBirth : placeOfBirth // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,bachelorUniversity: null == bachelorUniversity ? _self.bachelorUniversity : bachelorUniversity // ignore: cast_nullable_to_non_nullable
as String,bachelorMajor: null == bachelorMajor ? _self.bachelorMajor : bachelorMajor // ignore: cast_nullable_to_non_nullable
as String,bachelorDegreeType: null == bachelorDegreeType ? _self.bachelorDegreeType : bachelorDegreeType // ignore: cast_nullable_to_non_nullable
as String,bachelorGraduationDate: null == bachelorGraduationDate ? _self.bachelorGraduationDate : bachelorGraduationDate // ignore: cast_nullable_to_non_nullable
as DateTime,bachelorGraduationRank: null == bachelorGraduationRank ? _self.bachelorGraduationRank : bachelorGraduationRank // ignore: cast_nullable_to_non_nullable
as String,masterMajor: null == masterMajor ? _self.masterMajor : masterMajor // ignore: cast_nullable_to_non_nullable
as String,specializationOrientation: null == specializationOrientation ? _self.specializationOrientation : specializationOrientation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
