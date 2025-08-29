// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhdStudent {

 int get id; String get cohorts; String? get managementId; String? get admissionId; String get name; Gender get gender; DateTime? get dateOfBirth; String? get placeOfBirth; String get phone; String get privateEmail; String get majorName; int get majorId; String get majorSpecialize; int? get admissionPresidentId; int? get admissionSecretaryId; int? get admission1stMemberId; int? get admission2ndMemberId; int? get admission3rdMemberId; bool get admissionPaid; String get thesis; int get supervisorId; int? get secondarySupervisorId; String get schoolEmail; DateTime get createdTime; DateTime get updatedTime;
/// Create a copy of PhdStudent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhdStudentCopyWith<PhdStudent> get copyWith => _$PhdStudentCopyWithImpl<PhdStudent>(this as PhdStudent, _$identity);

  /// Serializes this PhdStudent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhdStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.cohorts, cohorts) || other.cohorts == cohorts)&&(identical(other.managementId, managementId) || other.managementId == managementId)&&(identical(other.admissionId, admissionId) || other.admissionId == admissionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.placeOfBirth, placeOfBirth) || other.placeOfBirth == placeOfBirth)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.privateEmail, privateEmail) || other.privateEmail == privateEmail)&&(identical(other.majorName, majorName) || other.majorName == majorName)&&(identical(other.majorId, majorId) || other.majorId == majorId)&&(identical(other.majorSpecialize, majorSpecialize) || other.majorSpecialize == majorSpecialize)&&(identical(other.admissionPresidentId, admissionPresidentId) || other.admissionPresidentId == admissionPresidentId)&&(identical(other.admissionSecretaryId, admissionSecretaryId) || other.admissionSecretaryId == admissionSecretaryId)&&(identical(other.admission1stMemberId, admission1stMemberId) || other.admission1stMemberId == admission1stMemberId)&&(identical(other.admission2ndMemberId, admission2ndMemberId) || other.admission2ndMemberId == admission2ndMemberId)&&(identical(other.admission3rdMemberId, admission3rdMemberId) || other.admission3rdMemberId == admission3rdMemberId)&&(identical(other.admissionPaid, admissionPaid) || other.admissionPaid == admissionPaid)&&(identical(other.thesis, thesis) || other.thesis == thesis)&&(identical(other.supervisorId, supervisorId) || other.supervisorId == supervisorId)&&(identical(other.secondarySupervisorId, secondarySupervisorId) || other.secondarySupervisorId == secondarySupervisorId)&&(identical(other.schoolEmail, schoolEmail) || other.schoolEmail == schoolEmail)&&(identical(other.createdTime, createdTime) || other.createdTime == createdTime)&&(identical(other.updatedTime, updatedTime) || other.updatedTime == updatedTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,cohorts,managementId,admissionId,name,gender,dateOfBirth,placeOfBirth,phone,privateEmail,majorName,majorId,majorSpecialize,admissionPresidentId,admissionSecretaryId,admission1stMemberId,admission2ndMemberId,admission3rdMemberId,admissionPaid,thesis,supervisorId,secondarySupervisorId,schoolEmail,createdTime,updatedTime]);

@override
String toString() {
  return 'PhdStudent(id: $id, cohorts: $cohorts, managementId: $managementId, admissionId: $admissionId, name: $name, gender: $gender, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, phone: $phone, privateEmail: $privateEmail, majorName: $majorName, majorId: $majorId, majorSpecialize: $majorSpecialize, admissionPresidentId: $admissionPresidentId, admissionSecretaryId: $admissionSecretaryId, admission1stMemberId: $admission1stMemberId, admission2ndMemberId: $admission2ndMemberId, admission3rdMemberId: $admission3rdMemberId, admissionPaid: $admissionPaid, thesis: $thesis, supervisorId: $supervisorId, secondarySupervisorId: $secondarySupervisorId, schoolEmail: $schoolEmail, createdTime: $createdTime, updatedTime: $updatedTime)';
}


}

/// @nodoc
abstract mixin class $PhdStudentCopyWith<$Res>  {
  factory $PhdStudentCopyWith(PhdStudent value, $Res Function(PhdStudent) _then) = _$PhdStudentCopyWithImpl;
@useResult
$Res call({
 int id, String cohorts, String? managementId, String? admissionId, String name, Gender gender, DateTime? dateOfBirth, String? placeOfBirth, String phone, String privateEmail, String majorName, int majorId, String majorSpecialize, int? admissionPresidentId, int? admissionSecretaryId, int? admission1stMemberId, int? admission2ndMemberId, int? admission3rdMemberId, bool admissionPaid, String thesis, int supervisorId, int? secondarySupervisorId, String schoolEmail, DateTime createdTime, DateTime updatedTime
});




}
/// @nodoc
class _$PhdStudentCopyWithImpl<$Res>
    implements $PhdStudentCopyWith<$Res> {
  _$PhdStudentCopyWithImpl(this._self, this._then);

  final PhdStudent _self;
  final $Res Function(PhdStudent) _then;

/// Create a copy of PhdStudent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cohorts = null,Object? managementId = freezed,Object? admissionId = freezed,Object? name = null,Object? gender = null,Object? dateOfBirth = freezed,Object? placeOfBirth = freezed,Object? phone = null,Object? privateEmail = null,Object? majorName = null,Object? majorId = null,Object? majorSpecialize = null,Object? admissionPresidentId = freezed,Object? admissionSecretaryId = freezed,Object? admission1stMemberId = freezed,Object? admission2ndMemberId = freezed,Object? admission3rdMemberId = freezed,Object? admissionPaid = null,Object? thesis = null,Object? supervisorId = null,Object? secondarySupervisorId = freezed,Object? schoolEmail = null,Object? createdTime = null,Object? updatedTime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cohorts: null == cohorts ? _self.cohorts : cohorts // ignore: cast_nullable_to_non_nullable
as String,managementId: freezed == managementId ? _self.managementId : managementId // ignore: cast_nullable_to_non_nullable
as String?,admissionId: freezed == admissionId ? _self.admissionId : admissionId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,placeOfBirth: freezed == placeOfBirth ? _self.placeOfBirth : placeOfBirth // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,privateEmail: null == privateEmail ? _self.privateEmail : privateEmail // ignore: cast_nullable_to_non_nullable
as String,majorName: null == majorName ? _self.majorName : majorName // ignore: cast_nullable_to_non_nullable
as String,majorId: null == majorId ? _self.majorId : majorId // ignore: cast_nullable_to_non_nullable
as int,majorSpecialize: null == majorSpecialize ? _self.majorSpecialize : majorSpecialize // ignore: cast_nullable_to_non_nullable
as String,admissionPresidentId: freezed == admissionPresidentId ? _self.admissionPresidentId : admissionPresidentId // ignore: cast_nullable_to_non_nullable
as int?,admissionSecretaryId: freezed == admissionSecretaryId ? _self.admissionSecretaryId : admissionSecretaryId // ignore: cast_nullable_to_non_nullable
as int?,admission1stMemberId: freezed == admission1stMemberId ? _self.admission1stMemberId : admission1stMemberId // ignore: cast_nullable_to_non_nullable
as int?,admission2ndMemberId: freezed == admission2ndMemberId ? _self.admission2ndMemberId : admission2ndMemberId // ignore: cast_nullable_to_non_nullable
as int?,admission3rdMemberId: freezed == admission3rdMemberId ? _self.admission3rdMemberId : admission3rdMemberId // ignore: cast_nullable_to_non_nullable
as int?,admissionPaid: null == admissionPaid ? _self.admissionPaid : admissionPaid // ignore: cast_nullable_to_non_nullable
as bool,thesis: null == thesis ? _self.thesis : thesis // ignore: cast_nullable_to_non_nullable
as String,supervisorId: null == supervisorId ? _self.supervisorId : supervisorId // ignore: cast_nullable_to_non_nullable
as int,secondarySupervisorId: freezed == secondarySupervisorId ? _self.secondarySupervisorId : secondarySupervisorId // ignore: cast_nullable_to_non_nullable
as int?,schoolEmail: null == schoolEmail ? _self.schoolEmail : schoolEmail // ignore: cast_nullable_to_non_nullable
as String,createdTime: null == createdTime ? _self.createdTime : createdTime // ignore: cast_nullable_to_non_nullable
as DateTime,updatedTime: null == updatedTime ? _self.updatedTime : updatedTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PhdStudent].
extension PhdStudentPatterns on PhdStudent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhdStudent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhdStudent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhdStudent value)  $default,){
final _that = this;
switch (_that) {
case _PhdStudent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhdStudent value)?  $default,){
final _that = this;
switch (_that) {
case _PhdStudent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String cohorts,  String? managementId,  String? admissionId,  String name,  Gender gender,  DateTime? dateOfBirth,  String? placeOfBirth,  String phone,  String privateEmail,  String majorName,  int majorId,  String majorSpecialize,  int? admissionPresidentId,  int? admissionSecretaryId,  int? admission1stMemberId,  int? admission2ndMemberId,  int? admission3rdMemberId,  bool admissionPaid,  String thesis,  int supervisorId,  int? secondarySupervisorId,  String schoolEmail,  DateTime createdTime,  DateTime updatedTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhdStudent() when $default != null:
return $default(_that.id,_that.cohorts,_that.managementId,_that.admissionId,_that.name,_that.gender,_that.dateOfBirth,_that.placeOfBirth,_that.phone,_that.privateEmail,_that.majorName,_that.majorId,_that.majorSpecialize,_that.admissionPresidentId,_that.admissionSecretaryId,_that.admission1stMemberId,_that.admission2ndMemberId,_that.admission3rdMemberId,_that.admissionPaid,_that.thesis,_that.supervisorId,_that.secondarySupervisorId,_that.schoolEmail,_that.createdTime,_that.updatedTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String cohorts,  String? managementId,  String? admissionId,  String name,  Gender gender,  DateTime? dateOfBirth,  String? placeOfBirth,  String phone,  String privateEmail,  String majorName,  int majorId,  String majorSpecialize,  int? admissionPresidentId,  int? admissionSecretaryId,  int? admission1stMemberId,  int? admission2ndMemberId,  int? admission3rdMemberId,  bool admissionPaid,  String thesis,  int supervisorId,  int? secondarySupervisorId,  String schoolEmail,  DateTime createdTime,  DateTime updatedTime)  $default,) {final _that = this;
switch (_that) {
case _PhdStudent():
return $default(_that.id,_that.cohorts,_that.managementId,_that.admissionId,_that.name,_that.gender,_that.dateOfBirth,_that.placeOfBirth,_that.phone,_that.privateEmail,_that.majorName,_that.majorId,_that.majorSpecialize,_that.admissionPresidentId,_that.admissionSecretaryId,_that.admission1stMemberId,_that.admission2ndMemberId,_that.admission3rdMemberId,_that.admissionPaid,_that.thesis,_that.supervisorId,_that.secondarySupervisorId,_that.schoolEmail,_that.createdTime,_that.updatedTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String cohorts,  String? managementId,  String? admissionId,  String name,  Gender gender,  DateTime? dateOfBirth,  String? placeOfBirth,  String phone,  String privateEmail,  String majorName,  int majorId,  String majorSpecialize,  int? admissionPresidentId,  int? admissionSecretaryId,  int? admission1stMemberId,  int? admission2ndMemberId,  int? admission3rdMemberId,  bool admissionPaid,  String thesis,  int supervisorId,  int? secondarySupervisorId,  String schoolEmail,  DateTime createdTime,  DateTime updatedTime)?  $default,) {final _that = this;
switch (_that) {
case _PhdStudent() when $default != null:
return $default(_that.id,_that.cohorts,_that.managementId,_that.admissionId,_that.name,_that.gender,_that.dateOfBirth,_that.placeOfBirth,_that.phone,_that.privateEmail,_that.majorName,_that.majorId,_that.majorSpecialize,_that.admissionPresidentId,_that.admissionSecretaryId,_that.admission1stMemberId,_that.admission2ndMemberId,_that.admission3rdMemberId,_that.admissionPaid,_that.thesis,_that.supervisorId,_that.secondarySupervisorId,_that.schoolEmail,_that.createdTime,_that.updatedTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhdStudent implements PhdStudent {
  const _PhdStudent({required this.id, required this.cohorts, this.managementId, this.admissionId, required this.name, required this.gender, this.dateOfBirth, this.placeOfBirth, required this.phone, required this.privateEmail, required this.majorName, required this.majorId, required this.majorSpecialize, this.admissionPresidentId, this.admissionSecretaryId, this.admission1stMemberId, this.admission2ndMemberId, this.admission3rdMemberId, this.admissionPaid = false, required this.thesis, required this.supervisorId, this.secondarySupervisorId, required this.schoolEmail, required this.createdTime, required this.updatedTime});
  factory _PhdStudent.fromJson(Map<String, dynamic> json) => _$PhdStudentFromJson(json);

@override final  int id;
@override final  String cohorts;
@override final  String? managementId;
@override final  String? admissionId;
@override final  String name;
@override final  Gender gender;
@override final  DateTime? dateOfBirth;
@override final  String? placeOfBirth;
@override final  String phone;
@override final  String privateEmail;
@override final  String majorName;
@override final  int majorId;
@override final  String majorSpecialize;
@override final  int? admissionPresidentId;
@override final  int? admissionSecretaryId;
@override final  int? admission1stMemberId;
@override final  int? admission2ndMemberId;
@override final  int? admission3rdMemberId;
@override@JsonKey() final  bool admissionPaid;
@override final  String thesis;
@override final  int supervisorId;
@override final  int? secondarySupervisorId;
@override final  String schoolEmail;
@override final  DateTime createdTime;
@override final  DateTime updatedTime;

/// Create a copy of PhdStudent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhdStudentCopyWith<_PhdStudent> get copyWith => __$PhdStudentCopyWithImpl<_PhdStudent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhdStudentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhdStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.cohorts, cohorts) || other.cohorts == cohorts)&&(identical(other.managementId, managementId) || other.managementId == managementId)&&(identical(other.admissionId, admissionId) || other.admissionId == admissionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.placeOfBirth, placeOfBirth) || other.placeOfBirth == placeOfBirth)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.privateEmail, privateEmail) || other.privateEmail == privateEmail)&&(identical(other.majorName, majorName) || other.majorName == majorName)&&(identical(other.majorId, majorId) || other.majorId == majorId)&&(identical(other.majorSpecialize, majorSpecialize) || other.majorSpecialize == majorSpecialize)&&(identical(other.admissionPresidentId, admissionPresidentId) || other.admissionPresidentId == admissionPresidentId)&&(identical(other.admissionSecretaryId, admissionSecretaryId) || other.admissionSecretaryId == admissionSecretaryId)&&(identical(other.admission1stMemberId, admission1stMemberId) || other.admission1stMemberId == admission1stMemberId)&&(identical(other.admission2ndMemberId, admission2ndMemberId) || other.admission2ndMemberId == admission2ndMemberId)&&(identical(other.admission3rdMemberId, admission3rdMemberId) || other.admission3rdMemberId == admission3rdMemberId)&&(identical(other.admissionPaid, admissionPaid) || other.admissionPaid == admissionPaid)&&(identical(other.thesis, thesis) || other.thesis == thesis)&&(identical(other.supervisorId, supervisorId) || other.supervisorId == supervisorId)&&(identical(other.secondarySupervisorId, secondarySupervisorId) || other.secondarySupervisorId == secondarySupervisorId)&&(identical(other.schoolEmail, schoolEmail) || other.schoolEmail == schoolEmail)&&(identical(other.createdTime, createdTime) || other.createdTime == createdTime)&&(identical(other.updatedTime, updatedTime) || other.updatedTime == updatedTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,cohorts,managementId,admissionId,name,gender,dateOfBirth,placeOfBirth,phone,privateEmail,majorName,majorId,majorSpecialize,admissionPresidentId,admissionSecretaryId,admission1stMemberId,admission2ndMemberId,admission3rdMemberId,admissionPaid,thesis,supervisorId,secondarySupervisorId,schoolEmail,createdTime,updatedTime]);

@override
String toString() {
  return 'PhdStudent(id: $id, cohorts: $cohorts, managementId: $managementId, admissionId: $admissionId, name: $name, gender: $gender, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, phone: $phone, privateEmail: $privateEmail, majorName: $majorName, majorId: $majorId, majorSpecialize: $majorSpecialize, admissionPresidentId: $admissionPresidentId, admissionSecretaryId: $admissionSecretaryId, admission1stMemberId: $admission1stMemberId, admission2ndMemberId: $admission2ndMemberId, admission3rdMemberId: $admission3rdMemberId, admissionPaid: $admissionPaid, thesis: $thesis, supervisorId: $supervisorId, secondarySupervisorId: $secondarySupervisorId, schoolEmail: $schoolEmail, createdTime: $createdTime, updatedTime: $updatedTime)';
}


}

/// @nodoc
abstract mixin class _$PhdStudentCopyWith<$Res> implements $PhdStudentCopyWith<$Res> {
  factory _$PhdStudentCopyWith(_PhdStudent value, $Res Function(_PhdStudent) _then) = __$PhdStudentCopyWithImpl;
@override @useResult
$Res call({
 int id, String cohorts, String? managementId, String? admissionId, String name, Gender gender, DateTime? dateOfBirth, String? placeOfBirth, String phone, String privateEmail, String majorName, int majorId, String majorSpecialize, int? admissionPresidentId, int? admissionSecretaryId, int? admission1stMemberId, int? admission2ndMemberId, int? admission3rdMemberId, bool admissionPaid, String thesis, int supervisorId, int? secondarySupervisorId, String schoolEmail, DateTime createdTime, DateTime updatedTime
});




}
/// @nodoc
class __$PhdStudentCopyWithImpl<$Res>
    implements _$PhdStudentCopyWith<$Res> {
  __$PhdStudentCopyWithImpl(this._self, this._then);

  final _PhdStudent _self;
  final $Res Function(_PhdStudent) _then;

/// Create a copy of PhdStudent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cohorts = null,Object? managementId = freezed,Object? admissionId = freezed,Object? name = null,Object? gender = null,Object? dateOfBirth = freezed,Object? placeOfBirth = freezed,Object? phone = null,Object? privateEmail = null,Object? majorName = null,Object? majorId = null,Object? majorSpecialize = null,Object? admissionPresidentId = freezed,Object? admissionSecretaryId = freezed,Object? admission1stMemberId = freezed,Object? admission2ndMemberId = freezed,Object? admission3rdMemberId = freezed,Object? admissionPaid = null,Object? thesis = null,Object? supervisorId = null,Object? secondarySupervisorId = freezed,Object? schoolEmail = null,Object? createdTime = null,Object? updatedTime = null,}) {
  return _then(_PhdStudent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cohorts: null == cohorts ? _self.cohorts : cohorts // ignore: cast_nullable_to_non_nullable
as String,managementId: freezed == managementId ? _self.managementId : managementId // ignore: cast_nullable_to_non_nullable
as String?,admissionId: freezed == admissionId ? _self.admissionId : admissionId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,placeOfBirth: freezed == placeOfBirth ? _self.placeOfBirth : placeOfBirth // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,privateEmail: null == privateEmail ? _self.privateEmail : privateEmail // ignore: cast_nullable_to_non_nullable
as String,majorName: null == majorName ? _self.majorName : majorName // ignore: cast_nullable_to_non_nullable
as String,majorId: null == majorId ? _self.majorId : majorId // ignore: cast_nullable_to_non_nullable
as int,majorSpecialize: null == majorSpecialize ? _self.majorSpecialize : majorSpecialize // ignore: cast_nullable_to_non_nullable
as String,admissionPresidentId: freezed == admissionPresidentId ? _self.admissionPresidentId : admissionPresidentId // ignore: cast_nullable_to_non_nullable
as int?,admissionSecretaryId: freezed == admissionSecretaryId ? _self.admissionSecretaryId : admissionSecretaryId // ignore: cast_nullable_to_non_nullable
as int?,admission1stMemberId: freezed == admission1stMemberId ? _self.admission1stMemberId : admission1stMemberId // ignore: cast_nullable_to_non_nullable
as int?,admission2ndMemberId: freezed == admission2ndMemberId ? _self.admission2ndMemberId : admission2ndMemberId // ignore: cast_nullable_to_non_nullable
as int?,admission3rdMemberId: freezed == admission3rdMemberId ? _self.admission3rdMemberId : admission3rdMemberId // ignore: cast_nullable_to_non_nullable
as int?,admissionPaid: null == admissionPaid ? _self.admissionPaid : admissionPaid // ignore: cast_nullable_to_non_nullable
as bool,thesis: null == thesis ? _self.thesis : thesis // ignore: cast_nullable_to_non_nullable
as String,supervisorId: null == supervisorId ? _self.supervisorId : supervisorId // ignore: cast_nullable_to_non_nullable
as int,secondarySupervisorId: freezed == secondarySupervisorId ? _self.secondarySupervisorId : secondarySupervisorId // ignore: cast_nullable_to_non_nullable
as int?,schoolEmail: null == schoolEmail ? _self.schoolEmail : schoolEmail // ignore: cast_nullable_to_non_nullable
as String,createdTime: null == createdTime ? _self.createdTime : createdTime // ignore: cast_nullable_to_non_nullable
as DateTime,updatedTime: null == updatedTime ? _self.updatedTime : updatedTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
