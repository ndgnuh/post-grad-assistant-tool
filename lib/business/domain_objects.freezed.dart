// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_objects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DangKyHoc {

 int get idLopTinChi; int get idHocVien; double? get diemQuaTrinh; double? get diemCuoiKy;
/// Create a copy of DangKyHoc
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DangKyHocCopyWith<DangKyHoc> get copyWith => _$DangKyHocCopyWithImpl<DangKyHoc>(this as DangKyHoc, _$identity);

  /// Serializes this DangKyHoc to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DangKyHoc&&(identical(other.idLopTinChi, idLopTinChi) || other.idLopTinChi == idLopTinChi)&&(identical(other.idHocVien, idHocVien) || other.idHocVien == idHocVien)&&(identical(other.diemQuaTrinh, diemQuaTrinh) || other.diemQuaTrinh == diemQuaTrinh)&&(identical(other.diemCuoiKy, diemCuoiKy) || other.diemCuoiKy == diemCuoiKy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idLopTinChi,idHocVien,diemQuaTrinh,diemCuoiKy);

@override
String toString() {
  return 'DangKyHoc(idLopTinChi: $idLopTinChi, idHocVien: $idHocVien, diemQuaTrinh: $diemQuaTrinh, diemCuoiKy: $diemCuoiKy)';
}


}

/// @nodoc
abstract mixin class $DangKyHocCopyWith<$Res>  {
  factory $DangKyHocCopyWith(DangKyHoc value, $Res Function(DangKyHoc) _then) = _$DangKyHocCopyWithImpl;
@useResult
$Res call({
 int idLopTinChi, int idHocVien, double? diemQuaTrinh, double? diemCuoiKy
});




}
/// @nodoc
class _$DangKyHocCopyWithImpl<$Res>
    implements $DangKyHocCopyWith<$Res> {
  _$DangKyHocCopyWithImpl(this._self, this._then);

  final DangKyHoc _self;
  final $Res Function(DangKyHoc) _then;

/// Create a copy of DangKyHoc
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idLopTinChi = null,Object? idHocVien = null,Object? diemQuaTrinh = freezed,Object? diemCuoiKy = freezed,}) {
  return _then(_self.copyWith(
idLopTinChi: null == idLopTinChi ? _self.idLopTinChi : idLopTinChi // ignore: cast_nullable_to_non_nullable
as int,idHocVien: null == idHocVien ? _self.idHocVien : idHocVien // ignore: cast_nullable_to_non_nullable
as int,diemQuaTrinh: freezed == diemQuaTrinh ? _self.diemQuaTrinh : diemQuaTrinh // ignore: cast_nullable_to_non_nullable
as double?,diemCuoiKy: freezed == diemCuoiKy ? _self.diemCuoiKy : diemCuoiKy // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DangKyHoc].
extension DangKyHocPatterns on DangKyHoc {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DangKyHoc value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DangKyHoc() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DangKyHoc value)  $default,){
final _that = this;
switch (_that) {
case _DangKyHoc():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DangKyHoc value)?  $default,){
final _that = this;
switch (_that) {
case _DangKyHoc() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int idLopTinChi,  int idHocVien,  double? diemQuaTrinh,  double? diemCuoiKy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DangKyHoc() when $default != null:
return $default(_that.idLopTinChi,_that.idHocVien,_that.diemQuaTrinh,_that.diemCuoiKy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int idLopTinChi,  int idHocVien,  double? diemQuaTrinh,  double? diemCuoiKy)  $default,) {final _that = this;
switch (_that) {
case _DangKyHoc():
return $default(_that.idLopTinChi,_that.idHocVien,_that.diemQuaTrinh,_that.diemCuoiKy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int idLopTinChi,  int idHocVien,  double? diemQuaTrinh,  double? diemCuoiKy)?  $default,) {final _that = this;
switch (_that) {
case _DangKyHoc() when $default != null:
return $default(_that.idLopTinChi,_that.idHocVien,_that.diemQuaTrinh,_that.diemCuoiKy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DangKyHoc extends DangKyHoc {
   _DangKyHoc({required this.idLopTinChi, required this.idHocVien, this.diemQuaTrinh, this.diemCuoiKy}): super._();
  factory _DangKyHoc.fromJson(Map<String, dynamic> json) => _$DangKyHocFromJson(json);

@override final  int idLopTinChi;
@override final  int idHocVien;
@override final  double? diemQuaTrinh;
@override final  double? diemCuoiKy;

/// Create a copy of DangKyHoc
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DangKyHocCopyWith<_DangKyHoc> get copyWith => __$DangKyHocCopyWithImpl<_DangKyHoc>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DangKyHocToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DangKyHoc&&(identical(other.idLopTinChi, idLopTinChi) || other.idLopTinChi == idLopTinChi)&&(identical(other.idHocVien, idHocVien) || other.idHocVien == idHocVien)&&(identical(other.diemQuaTrinh, diemQuaTrinh) || other.diemQuaTrinh == diemQuaTrinh)&&(identical(other.diemCuoiKy, diemCuoiKy) || other.diemCuoiKy == diemCuoiKy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idLopTinChi,idHocVien,diemQuaTrinh,diemCuoiKy);

@override
String toString() {
  return 'DangKyHoc(idLopTinChi: $idLopTinChi, idHocVien: $idHocVien, diemQuaTrinh: $diemQuaTrinh, diemCuoiKy: $diemCuoiKy)';
}


}

/// @nodoc
abstract mixin class _$DangKyHocCopyWith<$Res> implements $DangKyHocCopyWith<$Res> {
  factory _$DangKyHocCopyWith(_DangKyHoc value, $Res Function(_DangKyHoc) _then) = __$DangKyHocCopyWithImpl;
@override @useResult
$Res call({
 int idLopTinChi, int idHocVien, double? diemQuaTrinh, double? diemCuoiKy
});




}
/// @nodoc
class __$DangKyHocCopyWithImpl<$Res>
    implements _$DangKyHocCopyWith<$Res> {
  __$DangKyHocCopyWithImpl(this._self, this._then);

  final _DangKyHoc _self;
  final $Res Function(_DangKyHoc) _then;

/// Create a copy of DangKyHoc
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idLopTinChi = null,Object? idHocVien = null,Object? diemQuaTrinh = freezed,Object? diemCuoiKy = freezed,}) {
  return _then(_DangKyHoc(
idLopTinChi: null == idLopTinChi ? _self.idLopTinChi : idLopTinChi // ignore: cast_nullable_to_non_nullable
as int,idHocVien: null == idHocVien ? _self.idHocVien : idHocVien // ignore: cast_nullable_to_non_nullable
as int,diemQuaTrinh: freezed == diemQuaTrinh ? _self.diemQuaTrinh : diemQuaTrinh // ignore: cast_nullable_to_non_nullable
as double?,diemCuoiKy: freezed == diemCuoiKy ? _self.diemCuoiKy : diemCuoiKy // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$ThesisProxy {

 Thesis get thesis; Teacher get supervisor; Student? get student; Teacher? get president; Teacher? get reviewer1; Teacher? get reviewer2; Teacher? get secretary; Teacher? get member;
/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThesisProxyCopyWith<ThesisProxy> get copyWith => _$ThesisProxyCopyWithImpl<ThesisProxy>(this as ThesisProxy, _$identity);

  /// Serializes this ThesisProxy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThesisProxy&&(identical(other.thesis, thesis) || other.thesis == thesis)&&(identical(other.supervisor, supervisor) || other.supervisor == supervisor)&&(identical(other.student, student) || other.student == student)&&(identical(other.president, president) || other.president == president)&&(identical(other.reviewer1, reviewer1) || other.reviewer1 == reviewer1)&&(identical(other.reviewer2, reviewer2) || other.reviewer2 == reviewer2)&&(identical(other.secretary, secretary) || other.secretary == secretary)&&(identical(other.member, member) || other.member == member));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thesis,supervisor,student,president,reviewer1,reviewer2,secretary,member);

@override
String toString() {
  return 'ThesisProxy(thesis: $thesis, supervisor: $supervisor, student: $student, president: $president, reviewer1: $reviewer1, reviewer2: $reviewer2, secretary: $secretary, member: $member)';
}


}

/// @nodoc
abstract mixin class $ThesisProxyCopyWith<$Res>  {
  factory $ThesisProxyCopyWith(ThesisProxy value, $Res Function(ThesisProxy) _then) = _$ThesisProxyCopyWithImpl;
@useResult
$Res call({
 Thesis thesis, Teacher supervisor, Student? student, Teacher? president, Teacher? reviewer1, Teacher? reviewer2, Teacher? secretary, Teacher? member
});


$DeTaiThacSiCopyWith<$Res> get thesis;$GiangVienCopyWith<$Res> get supervisor;$HocVienCopyWith<$Res>? get student;$GiangVienCopyWith<$Res>? get president;$GiangVienCopyWith<$Res>? get reviewer1;$GiangVienCopyWith<$Res>? get reviewer2;$GiangVienCopyWith<$Res>? get secretary;$GiangVienCopyWith<$Res>? get member;

}
/// @nodoc
class _$ThesisProxyCopyWithImpl<$Res>
    implements $ThesisProxyCopyWith<$Res> {
  _$ThesisProxyCopyWithImpl(this._self, this._then);

  final ThesisProxy _self;
  final $Res Function(ThesisProxy) _then;

/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thesis = null,Object? supervisor = null,Object? student = freezed,Object? president = freezed,Object? reviewer1 = freezed,Object? reviewer2 = freezed,Object? secretary = freezed,Object? member = freezed,}) {
  return _then(_self.copyWith(
thesis: null == thesis ? _self.thesis : thesis // ignore: cast_nullable_to_non_nullable
as Thesis,supervisor: null == supervisor ? _self.supervisor : supervisor // ignore: cast_nullable_to_non_nullable
as Teacher,student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as Student?,president: freezed == president ? _self.president : president // ignore: cast_nullable_to_non_nullable
as Teacher?,reviewer1: freezed == reviewer1 ? _self.reviewer1 : reviewer1 // ignore: cast_nullable_to_non_nullable
as Teacher?,reviewer2: freezed == reviewer2 ? _self.reviewer2 : reviewer2 // ignore: cast_nullable_to_non_nullable
as Teacher?,secretary: freezed == secretary ? _self.secretary : secretary // ignore: cast_nullable_to_non_nullable
as Teacher?,member: freezed == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Teacher?,
  ));
}
/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeTaiThacSiCopyWith<$Res> get thesis {
  
  return $DeTaiThacSiCopyWith<$Res>(_self.thesis, (value) {
    return _then(_self.copyWith(thesis: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res> get supervisor {
  
  return $GiangVienCopyWith<$Res>(_self.supervisor, (value) {
    return _then(_self.copyWith(supervisor: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HocVienCopyWith<$Res>? get student {
    if (_self.student == null) {
    return null;
  }

  return $HocVienCopyWith<$Res>(_self.student!, (value) {
    return _then(_self.copyWith(student: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get president {
    if (_self.president == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.president!, (value) {
    return _then(_self.copyWith(president: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get reviewer1 {
    if (_self.reviewer1 == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.reviewer1!, (value) {
    return _then(_self.copyWith(reviewer1: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get reviewer2 {
    if (_self.reviewer2 == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.reviewer2!, (value) {
    return _then(_self.copyWith(reviewer2: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get secretary {
    if (_self.secretary == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.secretary!, (value) {
    return _then(_self.copyWith(secretary: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get member {
    if (_self.member == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.member!, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// Adds pattern-matching-related methods to [ThesisProxy].
extension ThesisProxyPatterns on ThesisProxy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThesisProxy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThesisProxy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThesisProxy value)  $default,){
final _that = this;
switch (_that) {
case _ThesisProxy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThesisProxy value)?  $default,){
final _that = this;
switch (_that) {
case _ThesisProxy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Thesis thesis,  Teacher supervisor,  Student? student,  Teacher? president,  Teacher? reviewer1,  Teacher? reviewer2,  Teacher? secretary,  Teacher? member)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThesisProxy() when $default != null:
return $default(_that.thesis,_that.supervisor,_that.student,_that.president,_that.reviewer1,_that.reviewer2,_that.secretary,_that.member);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Thesis thesis,  Teacher supervisor,  Student? student,  Teacher? president,  Teacher? reviewer1,  Teacher? reviewer2,  Teacher? secretary,  Teacher? member)  $default,) {final _that = this;
switch (_that) {
case _ThesisProxy():
return $default(_that.thesis,_that.supervisor,_that.student,_that.president,_that.reviewer1,_that.reviewer2,_that.secretary,_that.member);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Thesis thesis,  Teacher supervisor,  Student? student,  Teacher? president,  Teacher? reviewer1,  Teacher? reviewer2,  Teacher? secretary,  Teacher? member)?  $default,) {final _that = this;
switch (_that) {
case _ThesisProxy() when $default != null:
return $default(_that.thesis,_that.supervisor,_that.student,_that.president,_that.reviewer1,_that.reviewer2,_that.secretary,_that.member);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThesisProxy implements ThesisProxy {
  const _ThesisProxy({required this.thesis, required this.supervisor, this.student, this.president, this.reviewer1, this.reviewer2, this.secretary, this.member});
  factory _ThesisProxy.fromJson(Map<String, dynamic> json) => _$ThesisProxyFromJson(json);

@override final  Thesis thesis;
@override final  Teacher supervisor;
@override final  Student? student;
@override final  Teacher? president;
@override final  Teacher? reviewer1;
@override final  Teacher? reviewer2;
@override final  Teacher? secretary;
@override final  Teacher? member;

/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThesisProxyCopyWith<_ThesisProxy> get copyWith => __$ThesisProxyCopyWithImpl<_ThesisProxy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThesisProxyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThesisProxy&&(identical(other.thesis, thesis) || other.thesis == thesis)&&(identical(other.supervisor, supervisor) || other.supervisor == supervisor)&&(identical(other.student, student) || other.student == student)&&(identical(other.president, president) || other.president == president)&&(identical(other.reviewer1, reviewer1) || other.reviewer1 == reviewer1)&&(identical(other.reviewer2, reviewer2) || other.reviewer2 == reviewer2)&&(identical(other.secretary, secretary) || other.secretary == secretary)&&(identical(other.member, member) || other.member == member));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thesis,supervisor,student,president,reviewer1,reviewer2,secretary,member);

@override
String toString() {
  return 'ThesisProxy(thesis: $thesis, supervisor: $supervisor, student: $student, president: $president, reviewer1: $reviewer1, reviewer2: $reviewer2, secretary: $secretary, member: $member)';
}


}

/// @nodoc
abstract mixin class _$ThesisProxyCopyWith<$Res> implements $ThesisProxyCopyWith<$Res> {
  factory _$ThesisProxyCopyWith(_ThesisProxy value, $Res Function(_ThesisProxy) _then) = __$ThesisProxyCopyWithImpl;
@override @useResult
$Res call({
 Thesis thesis, Teacher supervisor, Student? student, Teacher? president, Teacher? reviewer1, Teacher? reviewer2, Teacher? secretary, Teacher? member
});


@override $DeTaiThacSiCopyWith<$Res> get thesis;@override $GiangVienCopyWith<$Res> get supervisor;@override $HocVienCopyWith<$Res>? get student;@override $GiangVienCopyWith<$Res>? get president;@override $GiangVienCopyWith<$Res>? get reviewer1;@override $GiangVienCopyWith<$Res>? get reviewer2;@override $GiangVienCopyWith<$Res>? get secretary;@override $GiangVienCopyWith<$Res>? get member;

}
/// @nodoc
class __$ThesisProxyCopyWithImpl<$Res>
    implements _$ThesisProxyCopyWith<$Res> {
  __$ThesisProxyCopyWithImpl(this._self, this._then);

  final _ThesisProxy _self;
  final $Res Function(_ThesisProxy) _then;

/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thesis = null,Object? supervisor = null,Object? student = freezed,Object? president = freezed,Object? reviewer1 = freezed,Object? reviewer2 = freezed,Object? secretary = freezed,Object? member = freezed,}) {
  return _then(_ThesisProxy(
thesis: null == thesis ? _self.thesis : thesis // ignore: cast_nullable_to_non_nullable
as Thesis,supervisor: null == supervisor ? _self.supervisor : supervisor // ignore: cast_nullable_to_non_nullable
as Teacher,student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as Student?,president: freezed == president ? _self.president : president // ignore: cast_nullable_to_non_nullable
as Teacher?,reviewer1: freezed == reviewer1 ? _self.reviewer1 : reviewer1 // ignore: cast_nullable_to_non_nullable
as Teacher?,reviewer2: freezed == reviewer2 ? _self.reviewer2 : reviewer2 // ignore: cast_nullable_to_non_nullable
as Teacher?,secretary: freezed == secretary ? _self.secretary : secretary // ignore: cast_nullable_to_non_nullable
as Teacher?,member: freezed == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Teacher?,
  ));
}

/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeTaiThacSiCopyWith<$Res> get thesis {
  
  return $DeTaiThacSiCopyWith<$Res>(_self.thesis, (value) {
    return _then(_self.copyWith(thesis: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res> get supervisor {
  
  return $GiangVienCopyWith<$Res>(_self.supervisor, (value) {
    return _then(_self.copyWith(supervisor: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HocVienCopyWith<$Res>? get student {
    if (_self.student == null) {
    return null;
  }

  return $HocVienCopyWith<$Res>(_self.student!, (value) {
    return _then(_self.copyWith(student: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get president {
    if (_self.president == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.president!, (value) {
    return _then(_self.copyWith(president: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get reviewer1 {
    if (_self.reviewer1 == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.reviewer1!, (value) {
    return _then(_self.copyWith(reviewer1: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get reviewer2 {
    if (_self.reviewer2 == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.reviewer2!, (value) {
    return _then(_self.copyWith(reviewer2: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get secretary {
    if (_self.secretary == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.secretary!, (value) {
    return _then(_self.copyWith(secretary: value));
  });
}/// Create a copy of ThesisProxy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res>? get member {
    if (_self.member == null) {
    return null;
  }

  return $GiangVienCopyWith<$Res>(_self.member!, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// @nodoc
mixin _$DeTaiThacSi {

 int? get id; int get idGiangVien; String get tenTiengViet; String get tenTiengAnh; GiangVien get giangVien;// TODO: remove this shit and use a proxy
 int? get idHocVien; HocVien? get hocVien; int? get idChuTich; int? get idPhanBien1; int? get idPhanBien2; int? get idUyVien; int? get idThuKy;@MaybeDateSerializer() DateTime? get ngayGiao; String? get soQdGiao;@MaybeDateSerializer() DateTime? get hanBaoVe; String? get soQdBaoVe;@MaybeDateSerializer() DateTime? get ngayBaoVe;@JsonKey(name: "flag_tracking")@BoolIntSerializer() bool get flagTracking;@JsonKey(name: "flag_payment")@BoolIntSerializer() bool get thanhToan; String? get ghiChu; String? get group; int? get nam;
/// Create a copy of DeTaiThacSi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeTaiThacSiCopyWith<DeTaiThacSi> get copyWith => _$DeTaiThacSiCopyWithImpl<DeTaiThacSi>(this as DeTaiThacSi, _$identity);

  /// Serializes this DeTaiThacSi to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeTaiThacSi&&(identical(other.id, id) || other.id == id)&&(identical(other.idGiangVien, idGiangVien) || other.idGiangVien == idGiangVien)&&(identical(other.tenTiengViet, tenTiengViet) || other.tenTiengViet == tenTiengViet)&&(identical(other.tenTiengAnh, tenTiengAnh) || other.tenTiengAnh == tenTiengAnh)&&(identical(other.giangVien, giangVien) || other.giangVien == giangVien)&&(identical(other.idHocVien, idHocVien) || other.idHocVien == idHocVien)&&(identical(other.hocVien, hocVien) || other.hocVien == hocVien)&&(identical(other.idChuTich, idChuTich) || other.idChuTich == idChuTich)&&(identical(other.idPhanBien1, idPhanBien1) || other.idPhanBien1 == idPhanBien1)&&(identical(other.idPhanBien2, idPhanBien2) || other.idPhanBien2 == idPhanBien2)&&(identical(other.idUyVien, idUyVien) || other.idUyVien == idUyVien)&&(identical(other.idThuKy, idThuKy) || other.idThuKy == idThuKy)&&(identical(other.ngayGiao, ngayGiao) || other.ngayGiao == ngayGiao)&&(identical(other.soQdGiao, soQdGiao) || other.soQdGiao == soQdGiao)&&(identical(other.hanBaoVe, hanBaoVe) || other.hanBaoVe == hanBaoVe)&&(identical(other.soQdBaoVe, soQdBaoVe) || other.soQdBaoVe == soQdBaoVe)&&(identical(other.ngayBaoVe, ngayBaoVe) || other.ngayBaoVe == ngayBaoVe)&&(identical(other.flagTracking, flagTracking) || other.flagTracking == flagTracking)&&(identical(other.thanhToan, thanhToan) || other.thanhToan == thanhToan)&&(identical(other.ghiChu, ghiChu) || other.ghiChu == ghiChu)&&(identical(other.group, group) || other.group == group)&&(identical(other.nam, nam) || other.nam == nam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,idGiangVien,tenTiengViet,tenTiengAnh,giangVien,idHocVien,hocVien,idChuTich,idPhanBien1,idPhanBien2,idUyVien,idThuKy,ngayGiao,soQdGiao,hanBaoVe,soQdBaoVe,ngayBaoVe,flagTracking,thanhToan,ghiChu,group,nam]);

@override
String toString() {
  return 'DeTaiThacSi(id: $id, idGiangVien: $idGiangVien, tenTiengViet: $tenTiengViet, tenTiengAnh: $tenTiengAnh, giangVien: $giangVien, idHocVien: $idHocVien, hocVien: $hocVien, idChuTich: $idChuTich, idPhanBien1: $idPhanBien1, idPhanBien2: $idPhanBien2, idUyVien: $idUyVien, idThuKy: $idThuKy, ngayGiao: $ngayGiao, soQdGiao: $soQdGiao, hanBaoVe: $hanBaoVe, soQdBaoVe: $soQdBaoVe, ngayBaoVe: $ngayBaoVe, flagTracking: $flagTracking, thanhToan: $thanhToan, ghiChu: $ghiChu, group: $group, nam: $nam)';
}


}

/// @nodoc
abstract mixin class $DeTaiThacSiCopyWith<$Res>  {
  factory $DeTaiThacSiCopyWith(DeTaiThacSi value, $Res Function(DeTaiThacSi) _then) = _$DeTaiThacSiCopyWithImpl;
@useResult
$Res call({
 int? id, int idGiangVien, String tenTiengViet, String tenTiengAnh, GiangVien giangVien, int? idHocVien, HocVien? hocVien, int? idChuTich, int? idPhanBien1, int? idPhanBien2, int? idUyVien, int? idThuKy,@MaybeDateSerializer() DateTime? ngayGiao, String? soQdGiao,@MaybeDateSerializer() DateTime? hanBaoVe, String? soQdBaoVe,@MaybeDateSerializer() DateTime? ngayBaoVe,@JsonKey(name: "flag_tracking")@BoolIntSerializer() bool flagTracking,@JsonKey(name: "flag_payment")@BoolIntSerializer() bool thanhToan, String? ghiChu, String? group, int? nam
});


$GiangVienCopyWith<$Res> get giangVien;$HocVienCopyWith<$Res>? get hocVien;

}
/// @nodoc
class _$DeTaiThacSiCopyWithImpl<$Res>
    implements $DeTaiThacSiCopyWith<$Res> {
  _$DeTaiThacSiCopyWithImpl(this._self, this._then);

  final DeTaiThacSi _self;
  final $Res Function(DeTaiThacSi) _then;

/// Create a copy of DeTaiThacSi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idGiangVien = null,Object? tenTiengViet = null,Object? tenTiengAnh = null,Object? giangVien = null,Object? idHocVien = freezed,Object? hocVien = freezed,Object? idChuTich = freezed,Object? idPhanBien1 = freezed,Object? idPhanBien2 = freezed,Object? idUyVien = freezed,Object? idThuKy = freezed,Object? ngayGiao = freezed,Object? soQdGiao = freezed,Object? hanBaoVe = freezed,Object? soQdBaoVe = freezed,Object? ngayBaoVe = freezed,Object? flagTracking = null,Object? thanhToan = null,Object? ghiChu = freezed,Object? group = freezed,Object? nam = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idGiangVien: null == idGiangVien ? _self.idGiangVien : idGiangVien // ignore: cast_nullable_to_non_nullable
as int,tenTiengViet: null == tenTiengViet ? _self.tenTiengViet : tenTiengViet // ignore: cast_nullable_to_non_nullable
as String,tenTiengAnh: null == tenTiengAnh ? _self.tenTiengAnh : tenTiengAnh // ignore: cast_nullable_to_non_nullable
as String,giangVien: null == giangVien ? _self.giangVien : giangVien // ignore: cast_nullable_to_non_nullable
as GiangVien,idHocVien: freezed == idHocVien ? _self.idHocVien : idHocVien // ignore: cast_nullable_to_non_nullable
as int?,hocVien: freezed == hocVien ? _self.hocVien : hocVien // ignore: cast_nullable_to_non_nullable
as HocVien?,idChuTich: freezed == idChuTich ? _self.idChuTich : idChuTich // ignore: cast_nullable_to_non_nullable
as int?,idPhanBien1: freezed == idPhanBien1 ? _self.idPhanBien1 : idPhanBien1 // ignore: cast_nullable_to_non_nullable
as int?,idPhanBien2: freezed == idPhanBien2 ? _self.idPhanBien2 : idPhanBien2 // ignore: cast_nullable_to_non_nullable
as int?,idUyVien: freezed == idUyVien ? _self.idUyVien : idUyVien // ignore: cast_nullable_to_non_nullable
as int?,idThuKy: freezed == idThuKy ? _self.idThuKy : idThuKy // ignore: cast_nullable_to_non_nullable
as int?,ngayGiao: freezed == ngayGiao ? _self.ngayGiao : ngayGiao // ignore: cast_nullable_to_non_nullable
as DateTime?,soQdGiao: freezed == soQdGiao ? _self.soQdGiao : soQdGiao // ignore: cast_nullable_to_non_nullable
as String?,hanBaoVe: freezed == hanBaoVe ? _self.hanBaoVe : hanBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,soQdBaoVe: freezed == soQdBaoVe ? _self.soQdBaoVe : soQdBaoVe // ignore: cast_nullable_to_non_nullable
as String?,ngayBaoVe: freezed == ngayBaoVe ? _self.ngayBaoVe : ngayBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,flagTracking: null == flagTracking ? _self.flagTracking : flagTracking // ignore: cast_nullable_to_non_nullable
as bool,thanhToan: null == thanhToan ? _self.thanhToan : thanhToan // ignore: cast_nullable_to_non_nullable
as bool,ghiChu: freezed == ghiChu ? _self.ghiChu : ghiChu // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,nam: freezed == nam ? _self.nam : nam // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of DeTaiThacSi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res> get giangVien {
  
  return $GiangVienCopyWith<$Res>(_self.giangVien, (value) {
    return _then(_self.copyWith(giangVien: value));
  });
}/// Create a copy of DeTaiThacSi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HocVienCopyWith<$Res>? get hocVien {
    if (_self.hocVien == null) {
    return null;
  }

  return $HocVienCopyWith<$Res>(_self.hocVien!, (value) {
    return _then(_self.copyWith(hocVien: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeTaiThacSi].
extension DeTaiThacSiPatterns on DeTaiThacSi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeTaiThacSi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeTaiThacSi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeTaiThacSi value)  $default,){
final _that = this;
switch (_that) {
case _DeTaiThacSi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeTaiThacSi value)?  $default,){
final _that = this;
switch (_that) {
case _DeTaiThacSi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int idGiangVien,  String tenTiengViet,  String tenTiengAnh,  GiangVien giangVien,  int? idHocVien,  HocVien? hocVien,  int? idChuTich,  int? idPhanBien1,  int? idPhanBien2,  int? idUyVien,  int? idThuKy, @MaybeDateSerializer()  DateTime? ngayGiao,  String? soQdGiao, @MaybeDateSerializer()  DateTime? hanBaoVe,  String? soQdBaoVe, @MaybeDateSerializer()  DateTime? ngayBaoVe, @JsonKey(name: "flag_tracking")@BoolIntSerializer()  bool flagTracking, @JsonKey(name: "flag_payment")@BoolIntSerializer()  bool thanhToan,  String? ghiChu,  String? group,  int? nam)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeTaiThacSi() when $default != null:
return $default(_that.id,_that.idGiangVien,_that.tenTiengViet,_that.tenTiengAnh,_that.giangVien,_that.idHocVien,_that.hocVien,_that.idChuTich,_that.idPhanBien1,_that.idPhanBien2,_that.idUyVien,_that.idThuKy,_that.ngayGiao,_that.soQdGiao,_that.hanBaoVe,_that.soQdBaoVe,_that.ngayBaoVe,_that.flagTracking,_that.thanhToan,_that.ghiChu,_that.group,_that.nam);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int idGiangVien,  String tenTiengViet,  String tenTiengAnh,  GiangVien giangVien,  int? idHocVien,  HocVien? hocVien,  int? idChuTich,  int? idPhanBien1,  int? idPhanBien2,  int? idUyVien,  int? idThuKy, @MaybeDateSerializer()  DateTime? ngayGiao,  String? soQdGiao, @MaybeDateSerializer()  DateTime? hanBaoVe,  String? soQdBaoVe, @MaybeDateSerializer()  DateTime? ngayBaoVe, @JsonKey(name: "flag_tracking")@BoolIntSerializer()  bool flagTracking, @JsonKey(name: "flag_payment")@BoolIntSerializer()  bool thanhToan,  String? ghiChu,  String? group,  int? nam)  $default,) {final _that = this;
switch (_that) {
case _DeTaiThacSi():
return $default(_that.id,_that.idGiangVien,_that.tenTiengViet,_that.tenTiengAnh,_that.giangVien,_that.idHocVien,_that.hocVien,_that.idChuTich,_that.idPhanBien1,_that.idPhanBien2,_that.idUyVien,_that.idThuKy,_that.ngayGiao,_that.soQdGiao,_that.hanBaoVe,_that.soQdBaoVe,_that.ngayBaoVe,_that.flagTracking,_that.thanhToan,_that.ghiChu,_that.group,_that.nam);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int idGiangVien,  String tenTiengViet,  String tenTiengAnh,  GiangVien giangVien,  int? idHocVien,  HocVien? hocVien,  int? idChuTich,  int? idPhanBien1,  int? idPhanBien2,  int? idUyVien,  int? idThuKy, @MaybeDateSerializer()  DateTime? ngayGiao,  String? soQdGiao, @MaybeDateSerializer()  DateTime? hanBaoVe,  String? soQdBaoVe, @MaybeDateSerializer()  DateTime? ngayBaoVe, @JsonKey(name: "flag_tracking")@BoolIntSerializer()  bool flagTracking, @JsonKey(name: "flag_payment")@BoolIntSerializer()  bool thanhToan,  String? ghiChu,  String? group,  int? nam)?  $default,) {final _that = this;
switch (_that) {
case _DeTaiThacSi() when $default != null:
return $default(_that.id,_that.idGiangVien,_that.tenTiengViet,_that.tenTiengAnh,_that.giangVien,_that.idHocVien,_that.hocVien,_that.idChuTich,_that.idPhanBien1,_that.idPhanBien2,_that.idUyVien,_that.idThuKy,_that.ngayGiao,_that.soQdGiao,_that.hanBaoVe,_that.soQdBaoVe,_that.ngayBaoVe,_that.flagTracking,_that.thanhToan,_that.ghiChu,_that.group,_that.nam);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeTaiThacSi extends DeTaiThacSi {
  const _DeTaiThacSi({this.id, required this.idGiangVien, required this.tenTiengViet, required this.tenTiengAnh, required this.giangVien, this.idHocVien, this.hocVien, this.idChuTich, this.idPhanBien1, this.idPhanBien2, this.idUyVien, this.idThuKy, @MaybeDateSerializer() this.ngayGiao, this.soQdGiao, @MaybeDateSerializer() this.hanBaoVe, this.soQdBaoVe, @MaybeDateSerializer() this.ngayBaoVe, @JsonKey(name: "flag_tracking")@BoolIntSerializer() this.flagTracking = false, @JsonKey(name: "flag_payment")@BoolIntSerializer() this.thanhToan = false, this.ghiChu, this.group, this.nam}): super._();
  factory _DeTaiThacSi.fromJson(Map<String, dynamic> json) => _$DeTaiThacSiFromJson(json);

@override final  int? id;
@override final  int idGiangVien;
@override final  String tenTiengViet;
@override final  String tenTiengAnh;
@override final  GiangVien giangVien;
// TODO: remove this shit and use a proxy
@override final  int? idHocVien;
@override final  HocVien? hocVien;
@override final  int? idChuTich;
@override final  int? idPhanBien1;
@override final  int? idPhanBien2;
@override final  int? idUyVien;
@override final  int? idThuKy;
@override@MaybeDateSerializer() final  DateTime? ngayGiao;
@override final  String? soQdGiao;
@override@MaybeDateSerializer() final  DateTime? hanBaoVe;
@override final  String? soQdBaoVe;
@override@MaybeDateSerializer() final  DateTime? ngayBaoVe;
@override@JsonKey(name: "flag_tracking")@BoolIntSerializer() final  bool flagTracking;
@override@JsonKey(name: "flag_payment")@BoolIntSerializer() final  bool thanhToan;
@override final  String? ghiChu;
@override final  String? group;
@override final  int? nam;

/// Create a copy of DeTaiThacSi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeTaiThacSiCopyWith<_DeTaiThacSi> get copyWith => __$DeTaiThacSiCopyWithImpl<_DeTaiThacSi>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeTaiThacSiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeTaiThacSi&&(identical(other.id, id) || other.id == id)&&(identical(other.idGiangVien, idGiangVien) || other.idGiangVien == idGiangVien)&&(identical(other.tenTiengViet, tenTiengViet) || other.tenTiengViet == tenTiengViet)&&(identical(other.tenTiengAnh, tenTiengAnh) || other.tenTiengAnh == tenTiengAnh)&&(identical(other.giangVien, giangVien) || other.giangVien == giangVien)&&(identical(other.idHocVien, idHocVien) || other.idHocVien == idHocVien)&&(identical(other.hocVien, hocVien) || other.hocVien == hocVien)&&(identical(other.idChuTich, idChuTich) || other.idChuTich == idChuTich)&&(identical(other.idPhanBien1, idPhanBien1) || other.idPhanBien1 == idPhanBien1)&&(identical(other.idPhanBien2, idPhanBien2) || other.idPhanBien2 == idPhanBien2)&&(identical(other.idUyVien, idUyVien) || other.idUyVien == idUyVien)&&(identical(other.idThuKy, idThuKy) || other.idThuKy == idThuKy)&&(identical(other.ngayGiao, ngayGiao) || other.ngayGiao == ngayGiao)&&(identical(other.soQdGiao, soQdGiao) || other.soQdGiao == soQdGiao)&&(identical(other.hanBaoVe, hanBaoVe) || other.hanBaoVe == hanBaoVe)&&(identical(other.soQdBaoVe, soQdBaoVe) || other.soQdBaoVe == soQdBaoVe)&&(identical(other.ngayBaoVe, ngayBaoVe) || other.ngayBaoVe == ngayBaoVe)&&(identical(other.flagTracking, flagTracking) || other.flagTracking == flagTracking)&&(identical(other.thanhToan, thanhToan) || other.thanhToan == thanhToan)&&(identical(other.ghiChu, ghiChu) || other.ghiChu == ghiChu)&&(identical(other.group, group) || other.group == group)&&(identical(other.nam, nam) || other.nam == nam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,idGiangVien,tenTiengViet,tenTiengAnh,giangVien,idHocVien,hocVien,idChuTich,idPhanBien1,idPhanBien2,idUyVien,idThuKy,ngayGiao,soQdGiao,hanBaoVe,soQdBaoVe,ngayBaoVe,flagTracking,thanhToan,ghiChu,group,nam]);

@override
String toString() {
  return 'DeTaiThacSi(id: $id, idGiangVien: $idGiangVien, tenTiengViet: $tenTiengViet, tenTiengAnh: $tenTiengAnh, giangVien: $giangVien, idHocVien: $idHocVien, hocVien: $hocVien, idChuTich: $idChuTich, idPhanBien1: $idPhanBien1, idPhanBien2: $idPhanBien2, idUyVien: $idUyVien, idThuKy: $idThuKy, ngayGiao: $ngayGiao, soQdGiao: $soQdGiao, hanBaoVe: $hanBaoVe, soQdBaoVe: $soQdBaoVe, ngayBaoVe: $ngayBaoVe, flagTracking: $flagTracking, thanhToan: $thanhToan, ghiChu: $ghiChu, group: $group, nam: $nam)';
}


}

/// @nodoc
abstract mixin class _$DeTaiThacSiCopyWith<$Res> implements $DeTaiThacSiCopyWith<$Res> {
  factory _$DeTaiThacSiCopyWith(_DeTaiThacSi value, $Res Function(_DeTaiThacSi) _then) = __$DeTaiThacSiCopyWithImpl;
@override @useResult
$Res call({
 int? id, int idGiangVien, String tenTiengViet, String tenTiengAnh, GiangVien giangVien, int? idHocVien, HocVien? hocVien, int? idChuTich, int? idPhanBien1, int? idPhanBien2, int? idUyVien, int? idThuKy,@MaybeDateSerializer() DateTime? ngayGiao, String? soQdGiao,@MaybeDateSerializer() DateTime? hanBaoVe, String? soQdBaoVe,@MaybeDateSerializer() DateTime? ngayBaoVe,@JsonKey(name: "flag_tracking")@BoolIntSerializer() bool flagTracking,@JsonKey(name: "flag_payment")@BoolIntSerializer() bool thanhToan, String? ghiChu, String? group, int? nam
});


@override $GiangVienCopyWith<$Res> get giangVien;@override $HocVienCopyWith<$Res>? get hocVien;

}
/// @nodoc
class __$DeTaiThacSiCopyWithImpl<$Res>
    implements _$DeTaiThacSiCopyWith<$Res> {
  __$DeTaiThacSiCopyWithImpl(this._self, this._then);

  final _DeTaiThacSi _self;
  final $Res Function(_DeTaiThacSi) _then;

/// Create a copy of DeTaiThacSi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idGiangVien = null,Object? tenTiengViet = null,Object? tenTiengAnh = null,Object? giangVien = null,Object? idHocVien = freezed,Object? hocVien = freezed,Object? idChuTich = freezed,Object? idPhanBien1 = freezed,Object? idPhanBien2 = freezed,Object? idUyVien = freezed,Object? idThuKy = freezed,Object? ngayGiao = freezed,Object? soQdGiao = freezed,Object? hanBaoVe = freezed,Object? soQdBaoVe = freezed,Object? ngayBaoVe = freezed,Object? flagTracking = null,Object? thanhToan = null,Object? ghiChu = freezed,Object? group = freezed,Object? nam = freezed,}) {
  return _then(_DeTaiThacSi(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idGiangVien: null == idGiangVien ? _self.idGiangVien : idGiangVien // ignore: cast_nullable_to_non_nullable
as int,tenTiengViet: null == tenTiengViet ? _self.tenTiengViet : tenTiengViet // ignore: cast_nullable_to_non_nullable
as String,tenTiengAnh: null == tenTiengAnh ? _self.tenTiengAnh : tenTiengAnh // ignore: cast_nullable_to_non_nullable
as String,giangVien: null == giangVien ? _self.giangVien : giangVien // ignore: cast_nullable_to_non_nullable
as GiangVien,idHocVien: freezed == idHocVien ? _self.idHocVien : idHocVien // ignore: cast_nullable_to_non_nullable
as int?,hocVien: freezed == hocVien ? _self.hocVien : hocVien // ignore: cast_nullable_to_non_nullable
as HocVien?,idChuTich: freezed == idChuTich ? _self.idChuTich : idChuTich // ignore: cast_nullable_to_non_nullable
as int?,idPhanBien1: freezed == idPhanBien1 ? _self.idPhanBien1 : idPhanBien1 // ignore: cast_nullable_to_non_nullable
as int?,idPhanBien2: freezed == idPhanBien2 ? _self.idPhanBien2 : idPhanBien2 // ignore: cast_nullable_to_non_nullable
as int?,idUyVien: freezed == idUyVien ? _self.idUyVien : idUyVien // ignore: cast_nullable_to_non_nullable
as int?,idThuKy: freezed == idThuKy ? _self.idThuKy : idThuKy // ignore: cast_nullable_to_non_nullable
as int?,ngayGiao: freezed == ngayGiao ? _self.ngayGiao : ngayGiao // ignore: cast_nullable_to_non_nullable
as DateTime?,soQdGiao: freezed == soQdGiao ? _self.soQdGiao : soQdGiao // ignore: cast_nullable_to_non_nullable
as String?,hanBaoVe: freezed == hanBaoVe ? _self.hanBaoVe : hanBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,soQdBaoVe: freezed == soQdBaoVe ? _self.soQdBaoVe : soQdBaoVe // ignore: cast_nullable_to_non_nullable
as String?,ngayBaoVe: freezed == ngayBaoVe ? _self.ngayBaoVe : ngayBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,flagTracking: null == flagTracking ? _self.flagTracking : flagTracking // ignore: cast_nullable_to_non_nullable
as bool,thanhToan: null == thanhToan ? _self.thanhToan : thanhToan // ignore: cast_nullable_to_non_nullable
as bool,ghiChu: freezed == ghiChu ? _self.ghiChu : ghiChu // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,nam: freezed == nam ? _self.nam : nam // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of DeTaiThacSi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiangVienCopyWith<$Res> get giangVien {
  
  return $GiangVienCopyWith<$Res>(_self.giangVien, (value) {
    return _then(_self.copyWith(giangVien: value));
  });
}/// Create a copy of DeTaiThacSi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HocVienCopyWith<$Res>? get hocVien {
    if (_self.hocVien == null) {
    return null;
  }

  return $HocVienCopyWith<$Res>(_self.hocVien!, (value) {
    return _then(_self.copyWith(hocVien: value));
  });
}
}


/// @nodoc
mixin _$GiangVien {

 int get id; String get hoTen;@JsonKey(name: "ngoaiTruong")@BoolIntSerializer() bool get isForeign; String? get maCanBo; String? get donVi; String? get chuyenNganh; GioiTinh? get gioiTinh; HocHam? get hocHam; HocVi? get hocVi; int? get namNhanTs; String? get sdt; String? get email; String? get cccd;@MaybeDateSerializer() DateTime? get ngaySinh; String? get stk; String? get nganHang; String? get mst; String? get note; int? get ncm;
/// Create a copy of GiangVien
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiangVienCopyWith<GiangVien> get copyWith => _$GiangVienCopyWithImpl<GiangVien>(this as GiangVien, _$identity);

  /// Serializes this GiangVien to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiangVien&&(identical(other.id, id) || other.id == id)&&(identical(other.hoTen, hoTen) || other.hoTen == hoTen)&&(identical(other.isForeign, isForeign) || other.isForeign == isForeign)&&(identical(other.maCanBo, maCanBo) || other.maCanBo == maCanBo)&&(identical(other.donVi, donVi) || other.donVi == donVi)&&(identical(other.chuyenNganh, chuyenNganh) || other.chuyenNganh == chuyenNganh)&&(identical(other.gioiTinh, gioiTinh) || other.gioiTinh == gioiTinh)&&(identical(other.hocHam, hocHam) || other.hocHam == hocHam)&&(identical(other.hocVi, hocVi) || other.hocVi == hocVi)&&(identical(other.namNhanTs, namNhanTs) || other.namNhanTs == namNhanTs)&&(identical(other.sdt, sdt) || other.sdt == sdt)&&(identical(other.email, email) || other.email == email)&&(identical(other.cccd, cccd) || other.cccd == cccd)&&(identical(other.ngaySinh, ngaySinh) || other.ngaySinh == ngaySinh)&&(identical(other.stk, stk) || other.stk == stk)&&(identical(other.nganHang, nganHang) || other.nganHang == nganHang)&&(identical(other.mst, mst) || other.mst == mst)&&(identical(other.note, note) || other.note == note)&&(identical(other.ncm, ncm) || other.ncm == ncm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,hoTen,isForeign,maCanBo,donVi,chuyenNganh,gioiTinh,hocHam,hocVi,namNhanTs,sdt,email,cccd,ngaySinh,stk,nganHang,mst,note,ncm]);

@override
String toString() {
  return 'GiangVien(id: $id, hoTen: $hoTen, isForeign: $isForeign, maCanBo: $maCanBo, donVi: $donVi, chuyenNganh: $chuyenNganh, gioiTinh: $gioiTinh, hocHam: $hocHam, hocVi: $hocVi, namNhanTs: $namNhanTs, sdt: $sdt, email: $email, cccd: $cccd, ngaySinh: $ngaySinh, stk: $stk, nganHang: $nganHang, mst: $mst, note: $note, ncm: $ncm)';
}


}

/// @nodoc
abstract mixin class $GiangVienCopyWith<$Res>  {
  factory $GiangVienCopyWith(GiangVien value, $Res Function(GiangVien) _then) = _$GiangVienCopyWithImpl;
@useResult
$Res call({
 int id, String hoTen,@JsonKey(name: "ngoaiTruong")@BoolIntSerializer() bool isForeign, String? maCanBo, String? donVi, String? chuyenNganh, GioiTinh? gioiTinh, HocHam? hocHam, HocVi? hocVi, int? namNhanTs, String? sdt, String? email, String? cccd,@MaybeDateSerializer() DateTime? ngaySinh, String? stk, String? nganHang, String? mst, String? note, int? ncm
});




}
/// @nodoc
class _$GiangVienCopyWithImpl<$Res>
    implements $GiangVienCopyWith<$Res> {
  _$GiangVienCopyWithImpl(this._self, this._then);

  final GiangVien _self;
  final $Res Function(GiangVien) _then;

/// Create a copy of GiangVien
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hoTen = null,Object? isForeign = null,Object? maCanBo = freezed,Object? donVi = freezed,Object? chuyenNganh = freezed,Object? gioiTinh = freezed,Object? hocHam = freezed,Object? hocVi = freezed,Object? namNhanTs = freezed,Object? sdt = freezed,Object? email = freezed,Object? cccd = freezed,Object? ngaySinh = freezed,Object? stk = freezed,Object? nganHang = freezed,Object? mst = freezed,Object? note = freezed,Object? ncm = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,hoTen: null == hoTen ? _self.hoTen : hoTen // ignore: cast_nullable_to_non_nullable
as String,isForeign: null == isForeign ? _self.isForeign : isForeign // ignore: cast_nullable_to_non_nullable
as bool,maCanBo: freezed == maCanBo ? _self.maCanBo : maCanBo // ignore: cast_nullable_to_non_nullable
as String?,donVi: freezed == donVi ? _self.donVi : donVi // ignore: cast_nullable_to_non_nullable
as String?,chuyenNganh: freezed == chuyenNganh ? _self.chuyenNganh : chuyenNganh // ignore: cast_nullable_to_non_nullable
as String?,gioiTinh: freezed == gioiTinh ? _self.gioiTinh : gioiTinh // ignore: cast_nullable_to_non_nullable
as GioiTinh?,hocHam: freezed == hocHam ? _self.hocHam : hocHam // ignore: cast_nullable_to_non_nullable
as HocHam?,hocVi: freezed == hocVi ? _self.hocVi : hocVi // ignore: cast_nullable_to_non_nullable
as HocVi?,namNhanTs: freezed == namNhanTs ? _self.namNhanTs : namNhanTs // ignore: cast_nullable_to_non_nullable
as int?,sdt: freezed == sdt ? _self.sdt : sdt // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,cccd: freezed == cccd ? _self.cccd : cccd // ignore: cast_nullable_to_non_nullable
as String?,ngaySinh: freezed == ngaySinh ? _self.ngaySinh : ngaySinh // ignore: cast_nullable_to_non_nullable
as DateTime?,stk: freezed == stk ? _self.stk : stk // ignore: cast_nullable_to_non_nullable
as String?,nganHang: freezed == nganHang ? _self.nganHang : nganHang // ignore: cast_nullable_to_non_nullable
as String?,mst: freezed == mst ? _self.mst : mst // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,ncm: freezed == ncm ? _self.ncm : ncm // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiangVien].
extension GiangVienPatterns on GiangVien {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiangVien value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiangVien() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiangVien value)  $default,){
final _that = this;
switch (_that) {
case _GiangVien():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiangVien value)?  $default,){
final _that = this;
switch (_that) {
case _GiangVien() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String hoTen, @JsonKey(name: "ngoaiTruong")@BoolIntSerializer()  bool isForeign,  String? maCanBo,  String? donVi,  String? chuyenNganh,  GioiTinh? gioiTinh,  HocHam? hocHam,  HocVi? hocVi,  int? namNhanTs,  String? sdt,  String? email,  String? cccd, @MaybeDateSerializer()  DateTime? ngaySinh,  String? stk,  String? nganHang,  String? mst,  String? note,  int? ncm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiangVien() when $default != null:
return $default(_that.id,_that.hoTen,_that.isForeign,_that.maCanBo,_that.donVi,_that.chuyenNganh,_that.gioiTinh,_that.hocHam,_that.hocVi,_that.namNhanTs,_that.sdt,_that.email,_that.cccd,_that.ngaySinh,_that.stk,_that.nganHang,_that.mst,_that.note,_that.ncm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String hoTen, @JsonKey(name: "ngoaiTruong")@BoolIntSerializer()  bool isForeign,  String? maCanBo,  String? donVi,  String? chuyenNganh,  GioiTinh? gioiTinh,  HocHam? hocHam,  HocVi? hocVi,  int? namNhanTs,  String? sdt,  String? email,  String? cccd, @MaybeDateSerializer()  DateTime? ngaySinh,  String? stk,  String? nganHang,  String? mst,  String? note,  int? ncm)  $default,) {final _that = this;
switch (_that) {
case _GiangVien():
return $default(_that.id,_that.hoTen,_that.isForeign,_that.maCanBo,_that.donVi,_that.chuyenNganh,_that.gioiTinh,_that.hocHam,_that.hocVi,_that.namNhanTs,_that.sdt,_that.email,_that.cccd,_that.ngaySinh,_that.stk,_that.nganHang,_that.mst,_that.note,_that.ncm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String hoTen, @JsonKey(name: "ngoaiTruong")@BoolIntSerializer()  bool isForeign,  String? maCanBo,  String? donVi,  String? chuyenNganh,  GioiTinh? gioiTinh,  HocHam? hocHam,  HocVi? hocVi,  int? namNhanTs,  String? sdt,  String? email,  String? cccd, @MaybeDateSerializer()  DateTime? ngaySinh,  String? stk,  String? nganHang,  String? mst,  String? note,  int? ncm)?  $default,) {final _that = this;
switch (_that) {
case _GiangVien() when $default != null:
return $default(_that.id,_that.hoTen,_that.isForeign,_that.maCanBo,_that.donVi,_that.chuyenNganh,_that.gioiTinh,_that.hocHam,_that.hocVi,_that.namNhanTs,_that.sdt,_that.email,_that.cccd,_that.ngaySinh,_that.stk,_that.nganHang,_that.mst,_that.note,_that.ncm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiangVien extends GiangVien {
   _GiangVien({required this.id, required this.hoTen, @JsonKey(name: "ngoaiTruong")@BoolIntSerializer() this.isForeign = false, this.maCanBo, this.donVi, this.chuyenNganh, this.gioiTinh, this.hocHam, this.hocVi, this.namNhanTs, this.sdt, this.email, this.cccd, @MaybeDateSerializer() this.ngaySinh, this.stk, this.nganHang, this.mst, this.note, this.ncm}): super._();
  factory _GiangVien.fromJson(Map<String, dynamic> json) => _$GiangVienFromJson(json);

@override final  int id;
@override final  String hoTen;
@override@JsonKey(name: "ngoaiTruong")@BoolIntSerializer() final  bool isForeign;
@override final  String? maCanBo;
@override final  String? donVi;
@override final  String? chuyenNganh;
@override final  GioiTinh? gioiTinh;
@override final  HocHam? hocHam;
@override final  HocVi? hocVi;
@override final  int? namNhanTs;
@override final  String? sdt;
@override final  String? email;
@override final  String? cccd;
@override@MaybeDateSerializer() final  DateTime? ngaySinh;
@override final  String? stk;
@override final  String? nganHang;
@override final  String? mst;
@override final  String? note;
@override final  int? ncm;

/// Create a copy of GiangVien
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiangVienCopyWith<_GiangVien> get copyWith => __$GiangVienCopyWithImpl<_GiangVien>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiangVienToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiangVien&&(identical(other.id, id) || other.id == id)&&(identical(other.hoTen, hoTen) || other.hoTen == hoTen)&&(identical(other.isForeign, isForeign) || other.isForeign == isForeign)&&(identical(other.maCanBo, maCanBo) || other.maCanBo == maCanBo)&&(identical(other.donVi, donVi) || other.donVi == donVi)&&(identical(other.chuyenNganh, chuyenNganh) || other.chuyenNganh == chuyenNganh)&&(identical(other.gioiTinh, gioiTinh) || other.gioiTinh == gioiTinh)&&(identical(other.hocHam, hocHam) || other.hocHam == hocHam)&&(identical(other.hocVi, hocVi) || other.hocVi == hocVi)&&(identical(other.namNhanTs, namNhanTs) || other.namNhanTs == namNhanTs)&&(identical(other.sdt, sdt) || other.sdt == sdt)&&(identical(other.email, email) || other.email == email)&&(identical(other.cccd, cccd) || other.cccd == cccd)&&(identical(other.ngaySinh, ngaySinh) || other.ngaySinh == ngaySinh)&&(identical(other.stk, stk) || other.stk == stk)&&(identical(other.nganHang, nganHang) || other.nganHang == nganHang)&&(identical(other.mst, mst) || other.mst == mst)&&(identical(other.note, note) || other.note == note)&&(identical(other.ncm, ncm) || other.ncm == ncm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,hoTen,isForeign,maCanBo,donVi,chuyenNganh,gioiTinh,hocHam,hocVi,namNhanTs,sdt,email,cccd,ngaySinh,stk,nganHang,mst,note,ncm]);

@override
String toString() {
  return 'GiangVien(id: $id, hoTen: $hoTen, isForeign: $isForeign, maCanBo: $maCanBo, donVi: $donVi, chuyenNganh: $chuyenNganh, gioiTinh: $gioiTinh, hocHam: $hocHam, hocVi: $hocVi, namNhanTs: $namNhanTs, sdt: $sdt, email: $email, cccd: $cccd, ngaySinh: $ngaySinh, stk: $stk, nganHang: $nganHang, mst: $mst, note: $note, ncm: $ncm)';
}


}

/// @nodoc
abstract mixin class _$GiangVienCopyWith<$Res> implements $GiangVienCopyWith<$Res> {
  factory _$GiangVienCopyWith(_GiangVien value, $Res Function(_GiangVien) _then) = __$GiangVienCopyWithImpl;
@override @useResult
$Res call({
 int id, String hoTen,@JsonKey(name: "ngoaiTruong")@BoolIntSerializer() bool isForeign, String? maCanBo, String? donVi, String? chuyenNganh, GioiTinh? gioiTinh, HocHam? hocHam, HocVi? hocVi, int? namNhanTs, String? sdt, String? email, String? cccd,@MaybeDateSerializer() DateTime? ngaySinh, String? stk, String? nganHang, String? mst, String? note, int? ncm
});




}
/// @nodoc
class __$GiangVienCopyWithImpl<$Res>
    implements _$GiangVienCopyWith<$Res> {
  __$GiangVienCopyWithImpl(this._self, this._then);

  final _GiangVien _self;
  final $Res Function(_GiangVien) _then;

/// Create a copy of GiangVien
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? hoTen = null,Object? isForeign = null,Object? maCanBo = freezed,Object? donVi = freezed,Object? chuyenNganh = freezed,Object? gioiTinh = freezed,Object? hocHam = freezed,Object? hocVi = freezed,Object? namNhanTs = freezed,Object? sdt = freezed,Object? email = freezed,Object? cccd = freezed,Object? ngaySinh = freezed,Object? stk = freezed,Object? nganHang = freezed,Object? mst = freezed,Object? note = freezed,Object? ncm = freezed,}) {
  return _then(_GiangVien(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,hoTen: null == hoTen ? _self.hoTen : hoTen // ignore: cast_nullable_to_non_nullable
as String,isForeign: null == isForeign ? _self.isForeign : isForeign // ignore: cast_nullable_to_non_nullable
as bool,maCanBo: freezed == maCanBo ? _self.maCanBo : maCanBo // ignore: cast_nullable_to_non_nullable
as String?,donVi: freezed == donVi ? _self.donVi : donVi // ignore: cast_nullable_to_non_nullable
as String?,chuyenNganh: freezed == chuyenNganh ? _self.chuyenNganh : chuyenNganh // ignore: cast_nullable_to_non_nullable
as String?,gioiTinh: freezed == gioiTinh ? _self.gioiTinh : gioiTinh // ignore: cast_nullable_to_non_nullable
as GioiTinh?,hocHam: freezed == hocHam ? _self.hocHam : hocHam // ignore: cast_nullable_to_non_nullable
as HocHam?,hocVi: freezed == hocVi ? _self.hocVi : hocVi // ignore: cast_nullable_to_non_nullable
as HocVi?,namNhanTs: freezed == namNhanTs ? _self.namNhanTs : namNhanTs // ignore: cast_nullable_to_non_nullable
as int?,sdt: freezed == sdt ? _self.sdt : sdt // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,cccd: freezed == cccd ? _self.cccd : cccd // ignore: cast_nullable_to_non_nullable
as String?,ngaySinh: freezed == ngaySinh ? _self.ngaySinh : ngaySinh // ignore: cast_nullable_to_non_nullable
as DateTime?,stk: freezed == stk ? _self.stk : stk // ignore: cast_nullable_to_non_nullable
as String?,nganHang: freezed == nganHang ? _self.nganHang : nganHang // ignore: cast_nullable_to_non_nullable
as String?,mst: freezed == mst ? _self.mst : mst // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,ncm: freezed == ncm ? _self.ncm : ncm // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$HocKy {

 String get hocKy;@DateSerializer() DateTime get moDangKy;@DateSerializer() DateTime get dongDangKy;@DateSerializer() DateTime get batDauHoc;@DateSerializer() DateTime get ketThucHoc;@DateSerializer() DateTime get hanNhapDiem;
/// Create a copy of HocKy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HocKyCopyWith<HocKy> get copyWith => _$HocKyCopyWithImpl<HocKy>(this as HocKy, _$identity);

  /// Serializes this HocKy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HocKy&&(identical(other.hocKy, hocKy) || other.hocKy == hocKy)&&(identical(other.moDangKy, moDangKy) || other.moDangKy == moDangKy)&&(identical(other.dongDangKy, dongDangKy) || other.dongDangKy == dongDangKy)&&(identical(other.batDauHoc, batDauHoc) || other.batDauHoc == batDauHoc)&&(identical(other.ketThucHoc, ketThucHoc) || other.ketThucHoc == ketThucHoc)&&(identical(other.hanNhapDiem, hanNhapDiem) || other.hanNhapDiem == hanNhapDiem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hocKy,moDangKy,dongDangKy,batDauHoc,ketThucHoc,hanNhapDiem);



}

/// @nodoc
abstract mixin class $HocKyCopyWith<$Res>  {
  factory $HocKyCopyWith(HocKy value, $Res Function(HocKy) _then) = _$HocKyCopyWithImpl;
@useResult
$Res call({
 String hocKy,@DateSerializer() DateTime moDangKy,@DateSerializer() DateTime dongDangKy,@DateSerializer() DateTime batDauHoc,@DateSerializer() DateTime ketThucHoc,@DateSerializer() DateTime hanNhapDiem
});




}
/// @nodoc
class _$HocKyCopyWithImpl<$Res>
    implements $HocKyCopyWith<$Res> {
  _$HocKyCopyWithImpl(this._self, this._then);

  final HocKy _self;
  final $Res Function(HocKy) _then;

/// Create a copy of HocKy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hocKy = null,Object? moDangKy = null,Object? dongDangKy = null,Object? batDauHoc = null,Object? ketThucHoc = null,Object? hanNhapDiem = null,}) {
  return _then(_self.copyWith(
hocKy: null == hocKy ? _self.hocKy : hocKy // ignore: cast_nullable_to_non_nullable
as String,moDangKy: null == moDangKy ? _self.moDangKy : moDangKy // ignore: cast_nullable_to_non_nullable
as DateTime,dongDangKy: null == dongDangKy ? _self.dongDangKy : dongDangKy // ignore: cast_nullable_to_non_nullable
as DateTime,batDauHoc: null == batDauHoc ? _self.batDauHoc : batDauHoc // ignore: cast_nullable_to_non_nullable
as DateTime,ketThucHoc: null == ketThucHoc ? _self.ketThucHoc : ketThucHoc // ignore: cast_nullable_to_non_nullable
as DateTime,hanNhapDiem: null == hanNhapDiem ? _self.hanNhapDiem : hanNhapDiem // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HocKy].
extension HocKyPatterns on HocKy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HocKy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HocKy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HocKy value)  $default,){
final _that = this;
switch (_that) {
case _HocKy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HocKy value)?  $default,){
final _that = this;
switch (_that) {
case _HocKy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hocKy, @DateSerializer()  DateTime moDangKy, @DateSerializer()  DateTime dongDangKy, @DateSerializer()  DateTime batDauHoc, @DateSerializer()  DateTime ketThucHoc, @DateSerializer()  DateTime hanNhapDiem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HocKy() when $default != null:
return $default(_that.hocKy,_that.moDangKy,_that.dongDangKy,_that.batDauHoc,_that.ketThucHoc,_that.hanNhapDiem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hocKy, @DateSerializer()  DateTime moDangKy, @DateSerializer()  DateTime dongDangKy, @DateSerializer()  DateTime batDauHoc, @DateSerializer()  DateTime ketThucHoc, @DateSerializer()  DateTime hanNhapDiem)  $default,) {final _that = this;
switch (_that) {
case _HocKy():
return $default(_that.hocKy,_that.moDangKy,_that.dongDangKy,_that.batDauHoc,_that.ketThucHoc,_that.hanNhapDiem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hocKy, @DateSerializer()  DateTime moDangKy, @DateSerializer()  DateTime dongDangKy, @DateSerializer()  DateTime batDauHoc, @DateSerializer()  DateTime ketThucHoc, @DateSerializer()  DateTime hanNhapDiem)?  $default,) {final _that = this;
switch (_that) {
case _HocKy() when $default != null:
return $default(_that.hocKy,_that.moDangKy,_that.dongDangKy,_that.batDauHoc,_that.ketThucHoc,_that.hanNhapDiem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HocKy extends HocKy {
  const _HocKy({required this.hocKy, @DateSerializer() required this.moDangKy, @DateSerializer() required this.dongDangKy, @DateSerializer() required this.batDauHoc, @DateSerializer() required this.ketThucHoc, @DateSerializer() required this.hanNhapDiem}): super._();
  factory _HocKy.fromJson(Map<String, dynamic> json) => _$HocKyFromJson(json);

@override final  String hocKy;
@override@DateSerializer() final  DateTime moDangKy;
@override@DateSerializer() final  DateTime dongDangKy;
@override@DateSerializer() final  DateTime batDauHoc;
@override@DateSerializer() final  DateTime ketThucHoc;
@override@DateSerializer() final  DateTime hanNhapDiem;

/// Create a copy of HocKy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HocKyCopyWith<_HocKy> get copyWith => __$HocKyCopyWithImpl<_HocKy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HocKyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HocKy&&(identical(other.hocKy, hocKy) || other.hocKy == hocKy)&&(identical(other.moDangKy, moDangKy) || other.moDangKy == moDangKy)&&(identical(other.dongDangKy, dongDangKy) || other.dongDangKy == dongDangKy)&&(identical(other.batDauHoc, batDauHoc) || other.batDauHoc == batDauHoc)&&(identical(other.ketThucHoc, ketThucHoc) || other.ketThucHoc == ketThucHoc)&&(identical(other.hanNhapDiem, hanNhapDiem) || other.hanNhapDiem == hanNhapDiem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hocKy,moDangKy,dongDangKy,batDauHoc,ketThucHoc,hanNhapDiem);



}

/// @nodoc
abstract mixin class _$HocKyCopyWith<$Res> implements $HocKyCopyWith<$Res> {
  factory _$HocKyCopyWith(_HocKy value, $Res Function(_HocKy) _then) = __$HocKyCopyWithImpl;
@override @useResult
$Res call({
 String hocKy,@DateSerializer() DateTime moDangKy,@DateSerializer() DateTime dongDangKy,@DateSerializer() DateTime batDauHoc,@DateSerializer() DateTime ketThucHoc,@DateSerializer() DateTime hanNhapDiem
});




}
/// @nodoc
class __$HocKyCopyWithImpl<$Res>
    implements _$HocKyCopyWith<$Res> {
  __$HocKyCopyWithImpl(this._self, this._then);

  final _HocKy _self;
  final $Res Function(_HocKy) _then;

/// Create a copy of HocKy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hocKy = null,Object? moDangKy = null,Object? dongDangKy = null,Object? batDauHoc = null,Object? ketThucHoc = null,Object? hanNhapDiem = null,}) {
  return _then(_HocKy(
hocKy: null == hocKy ? _self.hocKy : hocKy // ignore: cast_nullable_to_non_nullable
as String,moDangKy: null == moDangKy ? _self.moDangKy : moDangKy // ignore: cast_nullable_to_non_nullable
as DateTime,dongDangKy: null == dongDangKy ? _self.dongDangKy : dongDangKy // ignore: cast_nullable_to_non_nullable
as DateTime,batDauHoc: null == batDauHoc ? _self.batDauHoc : batDauHoc // ignore: cast_nullable_to_non_nullable
as DateTime,ketThucHoc: null == ketThucHoc ? _self.ketThucHoc : ketThucHoc // ignore: cast_nullable_to_non_nullable
as DateTime,hanNhapDiem: null == hanNhapDiem ? _self.hanNhapDiem : hanNhapDiem // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$HocPhan {

 String get maHocPhan; String get tenTiengViet; String get tenTiengAnh; int get soTinChi; KhoiKienThuc get khoiKienThuc; String get khoiLuong;
/// Create a copy of HocPhan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HocPhanCopyWith<HocPhan> get copyWith => _$HocPhanCopyWithImpl<HocPhan>(this as HocPhan, _$identity);

  /// Serializes this HocPhan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HocPhan&&(identical(other.maHocPhan, maHocPhan) || other.maHocPhan == maHocPhan)&&(identical(other.tenTiengViet, tenTiengViet) || other.tenTiengViet == tenTiengViet)&&(identical(other.tenTiengAnh, tenTiengAnh) || other.tenTiengAnh == tenTiengAnh)&&(identical(other.soTinChi, soTinChi) || other.soTinChi == soTinChi)&&(identical(other.khoiKienThuc, khoiKienThuc) || other.khoiKienThuc == khoiKienThuc)&&(identical(other.khoiLuong, khoiLuong) || other.khoiLuong == khoiLuong));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maHocPhan,tenTiengViet,tenTiengAnh,soTinChi,khoiKienThuc,khoiLuong);



}

/// @nodoc
abstract mixin class $HocPhanCopyWith<$Res>  {
  factory $HocPhanCopyWith(HocPhan value, $Res Function(HocPhan) _then) = _$HocPhanCopyWithImpl;
@useResult
$Res call({
 String maHocPhan, String tenTiengViet, String tenTiengAnh, int soTinChi, KhoiKienThuc khoiKienThuc, String khoiLuong
});




}
/// @nodoc
class _$HocPhanCopyWithImpl<$Res>
    implements $HocPhanCopyWith<$Res> {
  _$HocPhanCopyWithImpl(this._self, this._then);

  final HocPhan _self;
  final $Res Function(HocPhan) _then;

/// Create a copy of HocPhan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maHocPhan = null,Object? tenTiengViet = null,Object? tenTiengAnh = null,Object? soTinChi = null,Object? khoiKienThuc = null,Object? khoiLuong = null,}) {
  return _then(_self.copyWith(
maHocPhan: null == maHocPhan ? _self.maHocPhan : maHocPhan // ignore: cast_nullable_to_non_nullable
as String,tenTiengViet: null == tenTiengViet ? _self.tenTiengViet : tenTiengViet // ignore: cast_nullable_to_non_nullable
as String,tenTiengAnh: null == tenTiengAnh ? _self.tenTiengAnh : tenTiengAnh // ignore: cast_nullable_to_non_nullable
as String,soTinChi: null == soTinChi ? _self.soTinChi : soTinChi // ignore: cast_nullable_to_non_nullable
as int,khoiKienThuc: null == khoiKienThuc ? _self.khoiKienThuc : khoiKienThuc // ignore: cast_nullable_to_non_nullable
as KhoiKienThuc,khoiLuong: null == khoiLuong ? _self.khoiLuong : khoiLuong // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HocPhan].
extension HocPhanPatterns on HocPhan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HocPhan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HocPhan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HocPhan value)  $default,){
final _that = this;
switch (_that) {
case _HocPhan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HocPhan value)?  $default,){
final _that = this;
switch (_that) {
case _HocPhan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String maHocPhan,  String tenTiengViet,  String tenTiengAnh,  int soTinChi,  KhoiKienThuc khoiKienThuc,  String khoiLuong)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HocPhan() when $default != null:
return $default(_that.maHocPhan,_that.tenTiengViet,_that.tenTiengAnh,_that.soTinChi,_that.khoiKienThuc,_that.khoiLuong);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String maHocPhan,  String tenTiengViet,  String tenTiengAnh,  int soTinChi,  KhoiKienThuc khoiKienThuc,  String khoiLuong)  $default,) {final _that = this;
switch (_that) {
case _HocPhan():
return $default(_that.maHocPhan,_that.tenTiengViet,_that.tenTiengAnh,_that.soTinChi,_that.khoiKienThuc,_that.khoiLuong);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String maHocPhan,  String tenTiengViet,  String tenTiengAnh,  int soTinChi,  KhoiKienThuc khoiKienThuc,  String khoiLuong)?  $default,) {final _that = this;
switch (_that) {
case _HocPhan() when $default != null:
return $default(_that.maHocPhan,_that.tenTiengViet,_that.tenTiengAnh,_that.soTinChi,_that.khoiKienThuc,_that.khoiLuong);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HocPhan extends HocPhan {
  const _HocPhan({required this.maHocPhan, required this.tenTiengViet, required this.tenTiengAnh, required this.soTinChi, required this.khoiKienThuc, required this.khoiLuong}): super._();
  factory _HocPhan.fromJson(Map<String, dynamic> json) => _$HocPhanFromJson(json);

@override final  String maHocPhan;
@override final  String tenTiengViet;
@override final  String tenTiengAnh;
@override final  int soTinChi;
@override final  KhoiKienThuc khoiKienThuc;
@override final  String khoiLuong;

/// Create a copy of HocPhan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HocPhanCopyWith<_HocPhan> get copyWith => __$HocPhanCopyWithImpl<_HocPhan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HocPhanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HocPhan&&(identical(other.maHocPhan, maHocPhan) || other.maHocPhan == maHocPhan)&&(identical(other.tenTiengViet, tenTiengViet) || other.tenTiengViet == tenTiengViet)&&(identical(other.tenTiengAnh, tenTiengAnh) || other.tenTiengAnh == tenTiengAnh)&&(identical(other.soTinChi, soTinChi) || other.soTinChi == soTinChi)&&(identical(other.khoiKienThuc, khoiKienThuc) || other.khoiKienThuc == khoiKienThuc)&&(identical(other.khoiLuong, khoiLuong) || other.khoiLuong == khoiLuong));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maHocPhan,tenTiengViet,tenTiengAnh,soTinChi,khoiKienThuc,khoiLuong);



}

/// @nodoc
abstract mixin class _$HocPhanCopyWith<$Res> implements $HocPhanCopyWith<$Res> {
  factory _$HocPhanCopyWith(_HocPhan value, $Res Function(_HocPhan) _then) = __$HocPhanCopyWithImpl;
@override @useResult
$Res call({
 String maHocPhan, String tenTiengViet, String tenTiengAnh, int soTinChi, KhoiKienThuc khoiKienThuc, String khoiLuong
});




}
/// @nodoc
class __$HocPhanCopyWithImpl<$Res>
    implements _$HocPhanCopyWith<$Res> {
  __$HocPhanCopyWithImpl(this._self, this._then);

  final _HocPhan _self;
  final $Res Function(_HocPhan) _then;

/// Create a copy of HocPhan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maHocPhan = null,Object? tenTiengViet = null,Object? tenTiengAnh = null,Object? soTinChi = null,Object? khoiKienThuc = null,Object? khoiLuong = null,}) {
  return _then(_HocPhan(
maHocPhan: null == maHocPhan ? _self.maHocPhan : maHocPhan // ignore: cast_nullable_to_non_nullable
as String,tenTiengViet: null == tenTiengViet ? _self.tenTiengViet : tenTiengViet // ignore: cast_nullable_to_non_nullable
as String,tenTiengAnh: null == tenTiengAnh ? _self.tenTiengAnh : tenTiengAnh // ignore: cast_nullable_to_non_nullable
as String,soTinChi: null == soTinChi ? _self.soTinChi : soTinChi // ignore: cast_nullable_to_non_nullable
as int,khoiKienThuc: null == khoiKienThuc ? _self.khoiKienThuc : khoiKienThuc // ignore: cast_nullable_to_non_nullable
as KhoiKienThuc,khoiLuong: null == khoiLuong ? _self.khoiLuong : khoiLuong // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HocVien {

 int get id; String? get soHoSo; String? get nienKhoa; String? get maHocVien; String get hoTen;@MaybeDateSerializer() DateTime? get ngaySinh; GioiTinh? get gioiTinh; String? get noiSinh; String? get email; String? get emailHust; String? get truongTotNghiepDaiHoc; String? get nganhTotNghiepDaiHoc; String? get heTotNghiepDaiHoc; String? get xepLoaiTotNghiepDaiHoc;@MaybeDateSerializer() DateTime? get ngayTotNghiepDaiHoc; String? get dinhHuongChuyenSau; String? get hocPhanDuocMien; String? get nganhDaoTaoThacSi; String? get dienThoai; TrangThaiHocVien get maTrangThai; String? get deTaiLuanVanTiengViet; String? get deTaiLuanVanTiengAnh;@MaybeDateSerializer() DateTime? get ngayGiaoDeTai; String? get soQuyetDinhGiao;@MaybeDateSerializer() DateTime? get ngayBaoVe; int? get soQuyetDinhBaoVe;@MaybeDateSerializer() DateTime? get ngayKyQuyetDinhBaoVe; int? get idGiangVienHuongDan;@MaybeDateSerializer() DateTime? get hanBaoVe; int get lanGiaHan; int? get idTieuBanXetTuyen; DienTuyenSinh? get idDienTuyenSinh; int get thanhToanXetTuyen;
/// Create a copy of HocVien
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HocVienCopyWith<HocVien> get copyWith => _$HocVienCopyWithImpl<HocVien>(this as HocVien, _$identity);

  /// Serializes this HocVien to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HocVien&&(identical(other.id, id) || other.id == id)&&(identical(other.soHoSo, soHoSo) || other.soHoSo == soHoSo)&&(identical(other.nienKhoa, nienKhoa) || other.nienKhoa == nienKhoa)&&(identical(other.maHocVien, maHocVien) || other.maHocVien == maHocVien)&&(identical(other.hoTen, hoTen) || other.hoTen == hoTen)&&(identical(other.ngaySinh, ngaySinh) || other.ngaySinh == ngaySinh)&&(identical(other.gioiTinh, gioiTinh) || other.gioiTinh == gioiTinh)&&(identical(other.noiSinh, noiSinh) || other.noiSinh == noiSinh)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailHust, emailHust) || other.emailHust == emailHust)&&(identical(other.truongTotNghiepDaiHoc, truongTotNghiepDaiHoc) || other.truongTotNghiepDaiHoc == truongTotNghiepDaiHoc)&&(identical(other.nganhTotNghiepDaiHoc, nganhTotNghiepDaiHoc) || other.nganhTotNghiepDaiHoc == nganhTotNghiepDaiHoc)&&(identical(other.heTotNghiepDaiHoc, heTotNghiepDaiHoc) || other.heTotNghiepDaiHoc == heTotNghiepDaiHoc)&&(identical(other.xepLoaiTotNghiepDaiHoc, xepLoaiTotNghiepDaiHoc) || other.xepLoaiTotNghiepDaiHoc == xepLoaiTotNghiepDaiHoc)&&(identical(other.ngayTotNghiepDaiHoc, ngayTotNghiepDaiHoc) || other.ngayTotNghiepDaiHoc == ngayTotNghiepDaiHoc)&&(identical(other.dinhHuongChuyenSau, dinhHuongChuyenSau) || other.dinhHuongChuyenSau == dinhHuongChuyenSau)&&(identical(other.hocPhanDuocMien, hocPhanDuocMien) || other.hocPhanDuocMien == hocPhanDuocMien)&&(identical(other.nganhDaoTaoThacSi, nganhDaoTaoThacSi) || other.nganhDaoTaoThacSi == nganhDaoTaoThacSi)&&(identical(other.dienThoai, dienThoai) || other.dienThoai == dienThoai)&&(identical(other.maTrangThai, maTrangThai) || other.maTrangThai == maTrangThai)&&(identical(other.deTaiLuanVanTiengViet, deTaiLuanVanTiengViet) || other.deTaiLuanVanTiengViet == deTaiLuanVanTiengViet)&&(identical(other.deTaiLuanVanTiengAnh, deTaiLuanVanTiengAnh) || other.deTaiLuanVanTiengAnh == deTaiLuanVanTiengAnh)&&(identical(other.ngayGiaoDeTai, ngayGiaoDeTai) || other.ngayGiaoDeTai == ngayGiaoDeTai)&&(identical(other.soQuyetDinhGiao, soQuyetDinhGiao) || other.soQuyetDinhGiao == soQuyetDinhGiao)&&(identical(other.ngayBaoVe, ngayBaoVe) || other.ngayBaoVe == ngayBaoVe)&&(identical(other.soQuyetDinhBaoVe, soQuyetDinhBaoVe) || other.soQuyetDinhBaoVe == soQuyetDinhBaoVe)&&(identical(other.ngayKyQuyetDinhBaoVe, ngayKyQuyetDinhBaoVe) || other.ngayKyQuyetDinhBaoVe == ngayKyQuyetDinhBaoVe)&&(identical(other.idGiangVienHuongDan, idGiangVienHuongDan) || other.idGiangVienHuongDan == idGiangVienHuongDan)&&(identical(other.hanBaoVe, hanBaoVe) || other.hanBaoVe == hanBaoVe)&&(identical(other.lanGiaHan, lanGiaHan) || other.lanGiaHan == lanGiaHan)&&(identical(other.idTieuBanXetTuyen, idTieuBanXetTuyen) || other.idTieuBanXetTuyen == idTieuBanXetTuyen)&&(identical(other.idDienTuyenSinh, idDienTuyenSinh) || other.idDienTuyenSinh == idDienTuyenSinh)&&(identical(other.thanhToanXetTuyen, thanhToanXetTuyen) || other.thanhToanXetTuyen == thanhToanXetTuyen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,soHoSo,nienKhoa,maHocVien,hoTen,ngaySinh,gioiTinh,noiSinh,email,emailHust,truongTotNghiepDaiHoc,nganhTotNghiepDaiHoc,heTotNghiepDaiHoc,xepLoaiTotNghiepDaiHoc,ngayTotNghiepDaiHoc,dinhHuongChuyenSau,hocPhanDuocMien,nganhDaoTaoThacSi,dienThoai,maTrangThai,deTaiLuanVanTiengViet,deTaiLuanVanTiengAnh,ngayGiaoDeTai,soQuyetDinhGiao,ngayBaoVe,soQuyetDinhBaoVe,ngayKyQuyetDinhBaoVe,idGiangVienHuongDan,hanBaoVe,lanGiaHan,idTieuBanXetTuyen,idDienTuyenSinh,thanhToanXetTuyen]);

@override
String toString() {
  return 'HocVien(id: $id, soHoSo: $soHoSo, nienKhoa: $nienKhoa, maHocVien: $maHocVien, hoTen: $hoTen, ngaySinh: $ngaySinh, gioiTinh: $gioiTinh, noiSinh: $noiSinh, email: $email, emailHust: $emailHust, truongTotNghiepDaiHoc: $truongTotNghiepDaiHoc, nganhTotNghiepDaiHoc: $nganhTotNghiepDaiHoc, heTotNghiepDaiHoc: $heTotNghiepDaiHoc, xepLoaiTotNghiepDaiHoc: $xepLoaiTotNghiepDaiHoc, ngayTotNghiepDaiHoc: $ngayTotNghiepDaiHoc, dinhHuongChuyenSau: $dinhHuongChuyenSau, hocPhanDuocMien: $hocPhanDuocMien, nganhDaoTaoThacSi: $nganhDaoTaoThacSi, dienThoai: $dienThoai, maTrangThai: $maTrangThai, deTaiLuanVanTiengViet: $deTaiLuanVanTiengViet, deTaiLuanVanTiengAnh: $deTaiLuanVanTiengAnh, ngayGiaoDeTai: $ngayGiaoDeTai, soQuyetDinhGiao: $soQuyetDinhGiao, ngayBaoVe: $ngayBaoVe, soQuyetDinhBaoVe: $soQuyetDinhBaoVe, ngayKyQuyetDinhBaoVe: $ngayKyQuyetDinhBaoVe, idGiangVienHuongDan: $idGiangVienHuongDan, hanBaoVe: $hanBaoVe, lanGiaHan: $lanGiaHan, idTieuBanXetTuyen: $idTieuBanXetTuyen, idDienTuyenSinh: $idDienTuyenSinh, thanhToanXetTuyen: $thanhToanXetTuyen)';
}


}

/// @nodoc
abstract mixin class $HocVienCopyWith<$Res>  {
  factory $HocVienCopyWith(HocVien value, $Res Function(HocVien) _then) = _$HocVienCopyWithImpl;
@useResult
$Res call({
 int id, String? soHoSo, String? nienKhoa, String? maHocVien, String hoTen,@MaybeDateSerializer() DateTime? ngaySinh, GioiTinh? gioiTinh, String? noiSinh, String? email, String? emailHust, String? truongTotNghiepDaiHoc, String? nganhTotNghiepDaiHoc, String? heTotNghiepDaiHoc, String? xepLoaiTotNghiepDaiHoc,@MaybeDateSerializer() DateTime? ngayTotNghiepDaiHoc, String? dinhHuongChuyenSau, String? hocPhanDuocMien, String? nganhDaoTaoThacSi, String? dienThoai, TrangThaiHocVien maTrangThai, String? deTaiLuanVanTiengViet, String? deTaiLuanVanTiengAnh,@MaybeDateSerializer() DateTime? ngayGiaoDeTai, String? soQuyetDinhGiao,@MaybeDateSerializer() DateTime? ngayBaoVe, int? soQuyetDinhBaoVe,@MaybeDateSerializer() DateTime? ngayKyQuyetDinhBaoVe, int? idGiangVienHuongDan,@MaybeDateSerializer() DateTime? hanBaoVe, int lanGiaHan, int? idTieuBanXetTuyen, DienTuyenSinh? idDienTuyenSinh, int thanhToanXetTuyen
});




}
/// @nodoc
class _$HocVienCopyWithImpl<$Res>
    implements $HocVienCopyWith<$Res> {
  _$HocVienCopyWithImpl(this._self, this._then);

  final HocVien _self;
  final $Res Function(HocVien) _then;

/// Create a copy of HocVien
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? soHoSo = freezed,Object? nienKhoa = freezed,Object? maHocVien = freezed,Object? hoTen = null,Object? ngaySinh = freezed,Object? gioiTinh = freezed,Object? noiSinh = freezed,Object? email = freezed,Object? emailHust = freezed,Object? truongTotNghiepDaiHoc = freezed,Object? nganhTotNghiepDaiHoc = freezed,Object? heTotNghiepDaiHoc = freezed,Object? xepLoaiTotNghiepDaiHoc = freezed,Object? ngayTotNghiepDaiHoc = freezed,Object? dinhHuongChuyenSau = freezed,Object? hocPhanDuocMien = freezed,Object? nganhDaoTaoThacSi = freezed,Object? dienThoai = freezed,Object? maTrangThai = null,Object? deTaiLuanVanTiengViet = freezed,Object? deTaiLuanVanTiengAnh = freezed,Object? ngayGiaoDeTai = freezed,Object? soQuyetDinhGiao = freezed,Object? ngayBaoVe = freezed,Object? soQuyetDinhBaoVe = freezed,Object? ngayKyQuyetDinhBaoVe = freezed,Object? idGiangVienHuongDan = freezed,Object? hanBaoVe = freezed,Object? lanGiaHan = null,Object? idTieuBanXetTuyen = freezed,Object? idDienTuyenSinh = freezed,Object? thanhToanXetTuyen = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,soHoSo: freezed == soHoSo ? _self.soHoSo : soHoSo // ignore: cast_nullable_to_non_nullable
as String?,nienKhoa: freezed == nienKhoa ? _self.nienKhoa : nienKhoa // ignore: cast_nullable_to_non_nullable
as String?,maHocVien: freezed == maHocVien ? _self.maHocVien : maHocVien // ignore: cast_nullable_to_non_nullable
as String?,hoTen: null == hoTen ? _self.hoTen : hoTen // ignore: cast_nullable_to_non_nullable
as String,ngaySinh: freezed == ngaySinh ? _self.ngaySinh : ngaySinh // ignore: cast_nullable_to_non_nullable
as DateTime?,gioiTinh: freezed == gioiTinh ? _self.gioiTinh : gioiTinh // ignore: cast_nullable_to_non_nullable
as GioiTinh?,noiSinh: freezed == noiSinh ? _self.noiSinh : noiSinh // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailHust: freezed == emailHust ? _self.emailHust : emailHust // ignore: cast_nullable_to_non_nullable
as String?,truongTotNghiepDaiHoc: freezed == truongTotNghiepDaiHoc ? _self.truongTotNghiepDaiHoc : truongTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as String?,nganhTotNghiepDaiHoc: freezed == nganhTotNghiepDaiHoc ? _self.nganhTotNghiepDaiHoc : nganhTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as String?,heTotNghiepDaiHoc: freezed == heTotNghiepDaiHoc ? _self.heTotNghiepDaiHoc : heTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as String?,xepLoaiTotNghiepDaiHoc: freezed == xepLoaiTotNghiepDaiHoc ? _self.xepLoaiTotNghiepDaiHoc : xepLoaiTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as String?,ngayTotNghiepDaiHoc: freezed == ngayTotNghiepDaiHoc ? _self.ngayTotNghiepDaiHoc : ngayTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as DateTime?,dinhHuongChuyenSau: freezed == dinhHuongChuyenSau ? _self.dinhHuongChuyenSau : dinhHuongChuyenSau // ignore: cast_nullable_to_non_nullable
as String?,hocPhanDuocMien: freezed == hocPhanDuocMien ? _self.hocPhanDuocMien : hocPhanDuocMien // ignore: cast_nullable_to_non_nullable
as String?,nganhDaoTaoThacSi: freezed == nganhDaoTaoThacSi ? _self.nganhDaoTaoThacSi : nganhDaoTaoThacSi // ignore: cast_nullable_to_non_nullable
as String?,dienThoai: freezed == dienThoai ? _self.dienThoai : dienThoai // ignore: cast_nullable_to_non_nullable
as String?,maTrangThai: null == maTrangThai ? _self.maTrangThai : maTrangThai // ignore: cast_nullable_to_non_nullable
as TrangThaiHocVien,deTaiLuanVanTiengViet: freezed == deTaiLuanVanTiengViet ? _self.deTaiLuanVanTiengViet : deTaiLuanVanTiengViet // ignore: cast_nullable_to_non_nullable
as String?,deTaiLuanVanTiengAnh: freezed == deTaiLuanVanTiengAnh ? _self.deTaiLuanVanTiengAnh : deTaiLuanVanTiengAnh // ignore: cast_nullable_to_non_nullable
as String?,ngayGiaoDeTai: freezed == ngayGiaoDeTai ? _self.ngayGiaoDeTai : ngayGiaoDeTai // ignore: cast_nullable_to_non_nullable
as DateTime?,soQuyetDinhGiao: freezed == soQuyetDinhGiao ? _self.soQuyetDinhGiao : soQuyetDinhGiao // ignore: cast_nullable_to_non_nullable
as String?,ngayBaoVe: freezed == ngayBaoVe ? _self.ngayBaoVe : ngayBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,soQuyetDinhBaoVe: freezed == soQuyetDinhBaoVe ? _self.soQuyetDinhBaoVe : soQuyetDinhBaoVe // ignore: cast_nullable_to_non_nullable
as int?,ngayKyQuyetDinhBaoVe: freezed == ngayKyQuyetDinhBaoVe ? _self.ngayKyQuyetDinhBaoVe : ngayKyQuyetDinhBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,idGiangVienHuongDan: freezed == idGiangVienHuongDan ? _self.idGiangVienHuongDan : idGiangVienHuongDan // ignore: cast_nullable_to_non_nullable
as int?,hanBaoVe: freezed == hanBaoVe ? _self.hanBaoVe : hanBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,lanGiaHan: null == lanGiaHan ? _self.lanGiaHan : lanGiaHan // ignore: cast_nullable_to_non_nullable
as int,idTieuBanXetTuyen: freezed == idTieuBanXetTuyen ? _self.idTieuBanXetTuyen : idTieuBanXetTuyen // ignore: cast_nullable_to_non_nullable
as int?,idDienTuyenSinh: freezed == idDienTuyenSinh ? _self.idDienTuyenSinh : idDienTuyenSinh // ignore: cast_nullable_to_non_nullable
as DienTuyenSinh?,thanhToanXetTuyen: null == thanhToanXetTuyen ? _self.thanhToanXetTuyen : thanhToanXetTuyen // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HocVien].
extension HocVienPatterns on HocVien {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HocVien value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HocVien() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HocVien value)  $default,){
final _that = this;
switch (_that) {
case _HocVien():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HocVien value)?  $default,){
final _that = this;
switch (_that) {
case _HocVien() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? soHoSo,  String? nienKhoa,  String? maHocVien,  String hoTen, @MaybeDateSerializer()  DateTime? ngaySinh,  GioiTinh? gioiTinh,  String? noiSinh,  String? email,  String? emailHust,  String? truongTotNghiepDaiHoc,  String? nganhTotNghiepDaiHoc,  String? heTotNghiepDaiHoc,  String? xepLoaiTotNghiepDaiHoc, @MaybeDateSerializer()  DateTime? ngayTotNghiepDaiHoc,  String? dinhHuongChuyenSau,  String? hocPhanDuocMien,  String? nganhDaoTaoThacSi,  String? dienThoai,  TrangThaiHocVien maTrangThai,  String? deTaiLuanVanTiengViet,  String? deTaiLuanVanTiengAnh, @MaybeDateSerializer()  DateTime? ngayGiaoDeTai,  String? soQuyetDinhGiao, @MaybeDateSerializer()  DateTime? ngayBaoVe,  int? soQuyetDinhBaoVe, @MaybeDateSerializer()  DateTime? ngayKyQuyetDinhBaoVe,  int? idGiangVienHuongDan, @MaybeDateSerializer()  DateTime? hanBaoVe,  int lanGiaHan,  int? idTieuBanXetTuyen,  DienTuyenSinh? idDienTuyenSinh,  int thanhToanXetTuyen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HocVien() when $default != null:
return $default(_that.id,_that.soHoSo,_that.nienKhoa,_that.maHocVien,_that.hoTen,_that.ngaySinh,_that.gioiTinh,_that.noiSinh,_that.email,_that.emailHust,_that.truongTotNghiepDaiHoc,_that.nganhTotNghiepDaiHoc,_that.heTotNghiepDaiHoc,_that.xepLoaiTotNghiepDaiHoc,_that.ngayTotNghiepDaiHoc,_that.dinhHuongChuyenSau,_that.hocPhanDuocMien,_that.nganhDaoTaoThacSi,_that.dienThoai,_that.maTrangThai,_that.deTaiLuanVanTiengViet,_that.deTaiLuanVanTiengAnh,_that.ngayGiaoDeTai,_that.soQuyetDinhGiao,_that.ngayBaoVe,_that.soQuyetDinhBaoVe,_that.ngayKyQuyetDinhBaoVe,_that.idGiangVienHuongDan,_that.hanBaoVe,_that.lanGiaHan,_that.idTieuBanXetTuyen,_that.idDienTuyenSinh,_that.thanhToanXetTuyen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? soHoSo,  String? nienKhoa,  String? maHocVien,  String hoTen, @MaybeDateSerializer()  DateTime? ngaySinh,  GioiTinh? gioiTinh,  String? noiSinh,  String? email,  String? emailHust,  String? truongTotNghiepDaiHoc,  String? nganhTotNghiepDaiHoc,  String? heTotNghiepDaiHoc,  String? xepLoaiTotNghiepDaiHoc, @MaybeDateSerializer()  DateTime? ngayTotNghiepDaiHoc,  String? dinhHuongChuyenSau,  String? hocPhanDuocMien,  String? nganhDaoTaoThacSi,  String? dienThoai,  TrangThaiHocVien maTrangThai,  String? deTaiLuanVanTiengViet,  String? deTaiLuanVanTiengAnh, @MaybeDateSerializer()  DateTime? ngayGiaoDeTai,  String? soQuyetDinhGiao, @MaybeDateSerializer()  DateTime? ngayBaoVe,  int? soQuyetDinhBaoVe, @MaybeDateSerializer()  DateTime? ngayKyQuyetDinhBaoVe,  int? idGiangVienHuongDan, @MaybeDateSerializer()  DateTime? hanBaoVe,  int lanGiaHan,  int? idTieuBanXetTuyen,  DienTuyenSinh? idDienTuyenSinh,  int thanhToanXetTuyen)  $default,) {final _that = this;
switch (_that) {
case _HocVien():
return $default(_that.id,_that.soHoSo,_that.nienKhoa,_that.maHocVien,_that.hoTen,_that.ngaySinh,_that.gioiTinh,_that.noiSinh,_that.email,_that.emailHust,_that.truongTotNghiepDaiHoc,_that.nganhTotNghiepDaiHoc,_that.heTotNghiepDaiHoc,_that.xepLoaiTotNghiepDaiHoc,_that.ngayTotNghiepDaiHoc,_that.dinhHuongChuyenSau,_that.hocPhanDuocMien,_that.nganhDaoTaoThacSi,_that.dienThoai,_that.maTrangThai,_that.deTaiLuanVanTiengViet,_that.deTaiLuanVanTiengAnh,_that.ngayGiaoDeTai,_that.soQuyetDinhGiao,_that.ngayBaoVe,_that.soQuyetDinhBaoVe,_that.ngayKyQuyetDinhBaoVe,_that.idGiangVienHuongDan,_that.hanBaoVe,_that.lanGiaHan,_that.idTieuBanXetTuyen,_that.idDienTuyenSinh,_that.thanhToanXetTuyen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? soHoSo,  String? nienKhoa,  String? maHocVien,  String hoTen, @MaybeDateSerializer()  DateTime? ngaySinh,  GioiTinh? gioiTinh,  String? noiSinh,  String? email,  String? emailHust,  String? truongTotNghiepDaiHoc,  String? nganhTotNghiepDaiHoc,  String? heTotNghiepDaiHoc,  String? xepLoaiTotNghiepDaiHoc, @MaybeDateSerializer()  DateTime? ngayTotNghiepDaiHoc,  String? dinhHuongChuyenSau,  String? hocPhanDuocMien,  String? nganhDaoTaoThacSi,  String? dienThoai,  TrangThaiHocVien maTrangThai,  String? deTaiLuanVanTiengViet,  String? deTaiLuanVanTiengAnh, @MaybeDateSerializer()  DateTime? ngayGiaoDeTai,  String? soQuyetDinhGiao, @MaybeDateSerializer()  DateTime? ngayBaoVe,  int? soQuyetDinhBaoVe, @MaybeDateSerializer()  DateTime? ngayKyQuyetDinhBaoVe,  int? idGiangVienHuongDan, @MaybeDateSerializer()  DateTime? hanBaoVe,  int lanGiaHan,  int? idTieuBanXetTuyen,  DienTuyenSinh? idDienTuyenSinh,  int thanhToanXetTuyen)?  $default,) {final _that = this;
switch (_that) {
case _HocVien() when $default != null:
return $default(_that.id,_that.soHoSo,_that.nienKhoa,_that.maHocVien,_that.hoTen,_that.ngaySinh,_that.gioiTinh,_that.noiSinh,_that.email,_that.emailHust,_that.truongTotNghiepDaiHoc,_that.nganhTotNghiepDaiHoc,_that.heTotNghiepDaiHoc,_that.xepLoaiTotNghiepDaiHoc,_that.ngayTotNghiepDaiHoc,_that.dinhHuongChuyenSau,_that.hocPhanDuocMien,_that.nganhDaoTaoThacSi,_that.dienThoai,_that.maTrangThai,_that.deTaiLuanVanTiengViet,_that.deTaiLuanVanTiengAnh,_that.ngayGiaoDeTai,_that.soQuyetDinhGiao,_that.ngayBaoVe,_that.soQuyetDinhBaoVe,_that.ngayKyQuyetDinhBaoVe,_that.idGiangVienHuongDan,_that.hanBaoVe,_that.lanGiaHan,_that.idTieuBanXetTuyen,_that.idDienTuyenSinh,_that.thanhToanXetTuyen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HocVien extends HocVien {
  const _HocVien({required this.id, this.soHoSo, this.nienKhoa, this.maHocVien, required this.hoTen, @MaybeDateSerializer() this.ngaySinh, this.gioiTinh, this.noiSinh, this.email, this.emailHust, this.truongTotNghiepDaiHoc, this.nganhTotNghiepDaiHoc, this.heTotNghiepDaiHoc, this.xepLoaiTotNghiepDaiHoc, @MaybeDateSerializer() this.ngayTotNghiepDaiHoc, this.dinhHuongChuyenSau, this.hocPhanDuocMien, this.nganhDaoTaoThacSi, this.dienThoai, required this.maTrangThai, this.deTaiLuanVanTiengViet, this.deTaiLuanVanTiengAnh, @MaybeDateSerializer() this.ngayGiaoDeTai, this.soQuyetDinhGiao, @MaybeDateSerializer() this.ngayBaoVe, this.soQuyetDinhBaoVe, @MaybeDateSerializer() this.ngayKyQuyetDinhBaoVe, this.idGiangVienHuongDan, @MaybeDateSerializer() this.hanBaoVe, this.lanGiaHan = 0, this.idTieuBanXetTuyen, this.idDienTuyenSinh, this.thanhToanXetTuyen = 0}): super._();
  factory _HocVien.fromJson(Map<String, dynamic> json) => _$HocVienFromJson(json);

@override final  int id;
@override final  String? soHoSo;
@override final  String? nienKhoa;
@override final  String? maHocVien;
@override final  String hoTen;
@override@MaybeDateSerializer() final  DateTime? ngaySinh;
@override final  GioiTinh? gioiTinh;
@override final  String? noiSinh;
@override final  String? email;
@override final  String? emailHust;
@override final  String? truongTotNghiepDaiHoc;
@override final  String? nganhTotNghiepDaiHoc;
@override final  String? heTotNghiepDaiHoc;
@override final  String? xepLoaiTotNghiepDaiHoc;
@override@MaybeDateSerializer() final  DateTime? ngayTotNghiepDaiHoc;
@override final  String? dinhHuongChuyenSau;
@override final  String? hocPhanDuocMien;
@override final  String? nganhDaoTaoThacSi;
@override final  String? dienThoai;
@override final  TrangThaiHocVien maTrangThai;
@override final  String? deTaiLuanVanTiengViet;
@override final  String? deTaiLuanVanTiengAnh;
@override@MaybeDateSerializer() final  DateTime? ngayGiaoDeTai;
@override final  String? soQuyetDinhGiao;
@override@MaybeDateSerializer() final  DateTime? ngayBaoVe;
@override final  int? soQuyetDinhBaoVe;
@override@MaybeDateSerializer() final  DateTime? ngayKyQuyetDinhBaoVe;
@override final  int? idGiangVienHuongDan;
@override@MaybeDateSerializer() final  DateTime? hanBaoVe;
@override@JsonKey() final  int lanGiaHan;
@override final  int? idTieuBanXetTuyen;
@override final  DienTuyenSinh? idDienTuyenSinh;
@override@JsonKey() final  int thanhToanXetTuyen;

/// Create a copy of HocVien
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HocVienCopyWith<_HocVien> get copyWith => __$HocVienCopyWithImpl<_HocVien>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HocVienToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HocVien&&(identical(other.id, id) || other.id == id)&&(identical(other.soHoSo, soHoSo) || other.soHoSo == soHoSo)&&(identical(other.nienKhoa, nienKhoa) || other.nienKhoa == nienKhoa)&&(identical(other.maHocVien, maHocVien) || other.maHocVien == maHocVien)&&(identical(other.hoTen, hoTen) || other.hoTen == hoTen)&&(identical(other.ngaySinh, ngaySinh) || other.ngaySinh == ngaySinh)&&(identical(other.gioiTinh, gioiTinh) || other.gioiTinh == gioiTinh)&&(identical(other.noiSinh, noiSinh) || other.noiSinh == noiSinh)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailHust, emailHust) || other.emailHust == emailHust)&&(identical(other.truongTotNghiepDaiHoc, truongTotNghiepDaiHoc) || other.truongTotNghiepDaiHoc == truongTotNghiepDaiHoc)&&(identical(other.nganhTotNghiepDaiHoc, nganhTotNghiepDaiHoc) || other.nganhTotNghiepDaiHoc == nganhTotNghiepDaiHoc)&&(identical(other.heTotNghiepDaiHoc, heTotNghiepDaiHoc) || other.heTotNghiepDaiHoc == heTotNghiepDaiHoc)&&(identical(other.xepLoaiTotNghiepDaiHoc, xepLoaiTotNghiepDaiHoc) || other.xepLoaiTotNghiepDaiHoc == xepLoaiTotNghiepDaiHoc)&&(identical(other.ngayTotNghiepDaiHoc, ngayTotNghiepDaiHoc) || other.ngayTotNghiepDaiHoc == ngayTotNghiepDaiHoc)&&(identical(other.dinhHuongChuyenSau, dinhHuongChuyenSau) || other.dinhHuongChuyenSau == dinhHuongChuyenSau)&&(identical(other.hocPhanDuocMien, hocPhanDuocMien) || other.hocPhanDuocMien == hocPhanDuocMien)&&(identical(other.nganhDaoTaoThacSi, nganhDaoTaoThacSi) || other.nganhDaoTaoThacSi == nganhDaoTaoThacSi)&&(identical(other.dienThoai, dienThoai) || other.dienThoai == dienThoai)&&(identical(other.maTrangThai, maTrangThai) || other.maTrangThai == maTrangThai)&&(identical(other.deTaiLuanVanTiengViet, deTaiLuanVanTiengViet) || other.deTaiLuanVanTiengViet == deTaiLuanVanTiengViet)&&(identical(other.deTaiLuanVanTiengAnh, deTaiLuanVanTiengAnh) || other.deTaiLuanVanTiengAnh == deTaiLuanVanTiengAnh)&&(identical(other.ngayGiaoDeTai, ngayGiaoDeTai) || other.ngayGiaoDeTai == ngayGiaoDeTai)&&(identical(other.soQuyetDinhGiao, soQuyetDinhGiao) || other.soQuyetDinhGiao == soQuyetDinhGiao)&&(identical(other.ngayBaoVe, ngayBaoVe) || other.ngayBaoVe == ngayBaoVe)&&(identical(other.soQuyetDinhBaoVe, soQuyetDinhBaoVe) || other.soQuyetDinhBaoVe == soQuyetDinhBaoVe)&&(identical(other.ngayKyQuyetDinhBaoVe, ngayKyQuyetDinhBaoVe) || other.ngayKyQuyetDinhBaoVe == ngayKyQuyetDinhBaoVe)&&(identical(other.idGiangVienHuongDan, idGiangVienHuongDan) || other.idGiangVienHuongDan == idGiangVienHuongDan)&&(identical(other.hanBaoVe, hanBaoVe) || other.hanBaoVe == hanBaoVe)&&(identical(other.lanGiaHan, lanGiaHan) || other.lanGiaHan == lanGiaHan)&&(identical(other.idTieuBanXetTuyen, idTieuBanXetTuyen) || other.idTieuBanXetTuyen == idTieuBanXetTuyen)&&(identical(other.idDienTuyenSinh, idDienTuyenSinh) || other.idDienTuyenSinh == idDienTuyenSinh)&&(identical(other.thanhToanXetTuyen, thanhToanXetTuyen) || other.thanhToanXetTuyen == thanhToanXetTuyen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,soHoSo,nienKhoa,maHocVien,hoTen,ngaySinh,gioiTinh,noiSinh,email,emailHust,truongTotNghiepDaiHoc,nganhTotNghiepDaiHoc,heTotNghiepDaiHoc,xepLoaiTotNghiepDaiHoc,ngayTotNghiepDaiHoc,dinhHuongChuyenSau,hocPhanDuocMien,nganhDaoTaoThacSi,dienThoai,maTrangThai,deTaiLuanVanTiengViet,deTaiLuanVanTiengAnh,ngayGiaoDeTai,soQuyetDinhGiao,ngayBaoVe,soQuyetDinhBaoVe,ngayKyQuyetDinhBaoVe,idGiangVienHuongDan,hanBaoVe,lanGiaHan,idTieuBanXetTuyen,idDienTuyenSinh,thanhToanXetTuyen]);

@override
String toString() {
  return 'HocVien(id: $id, soHoSo: $soHoSo, nienKhoa: $nienKhoa, maHocVien: $maHocVien, hoTen: $hoTen, ngaySinh: $ngaySinh, gioiTinh: $gioiTinh, noiSinh: $noiSinh, email: $email, emailHust: $emailHust, truongTotNghiepDaiHoc: $truongTotNghiepDaiHoc, nganhTotNghiepDaiHoc: $nganhTotNghiepDaiHoc, heTotNghiepDaiHoc: $heTotNghiepDaiHoc, xepLoaiTotNghiepDaiHoc: $xepLoaiTotNghiepDaiHoc, ngayTotNghiepDaiHoc: $ngayTotNghiepDaiHoc, dinhHuongChuyenSau: $dinhHuongChuyenSau, hocPhanDuocMien: $hocPhanDuocMien, nganhDaoTaoThacSi: $nganhDaoTaoThacSi, dienThoai: $dienThoai, maTrangThai: $maTrangThai, deTaiLuanVanTiengViet: $deTaiLuanVanTiengViet, deTaiLuanVanTiengAnh: $deTaiLuanVanTiengAnh, ngayGiaoDeTai: $ngayGiaoDeTai, soQuyetDinhGiao: $soQuyetDinhGiao, ngayBaoVe: $ngayBaoVe, soQuyetDinhBaoVe: $soQuyetDinhBaoVe, ngayKyQuyetDinhBaoVe: $ngayKyQuyetDinhBaoVe, idGiangVienHuongDan: $idGiangVienHuongDan, hanBaoVe: $hanBaoVe, lanGiaHan: $lanGiaHan, idTieuBanXetTuyen: $idTieuBanXetTuyen, idDienTuyenSinh: $idDienTuyenSinh, thanhToanXetTuyen: $thanhToanXetTuyen)';
}


}

/// @nodoc
abstract mixin class _$HocVienCopyWith<$Res> implements $HocVienCopyWith<$Res> {
  factory _$HocVienCopyWith(_HocVien value, $Res Function(_HocVien) _then) = __$HocVienCopyWithImpl;
@override @useResult
$Res call({
 int id, String? soHoSo, String? nienKhoa, String? maHocVien, String hoTen,@MaybeDateSerializer() DateTime? ngaySinh, GioiTinh? gioiTinh, String? noiSinh, String? email, String? emailHust, String? truongTotNghiepDaiHoc, String? nganhTotNghiepDaiHoc, String? heTotNghiepDaiHoc, String? xepLoaiTotNghiepDaiHoc,@MaybeDateSerializer() DateTime? ngayTotNghiepDaiHoc, String? dinhHuongChuyenSau, String? hocPhanDuocMien, String? nganhDaoTaoThacSi, String? dienThoai, TrangThaiHocVien maTrangThai, String? deTaiLuanVanTiengViet, String? deTaiLuanVanTiengAnh,@MaybeDateSerializer() DateTime? ngayGiaoDeTai, String? soQuyetDinhGiao,@MaybeDateSerializer() DateTime? ngayBaoVe, int? soQuyetDinhBaoVe,@MaybeDateSerializer() DateTime? ngayKyQuyetDinhBaoVe, int? idGiangVienHuongDan,@MaybeDateSerializer() DateTime? hanBaoVe, int lanGiaHan, int? idTieuBanXetTuyen, DienTuyenSinh? idDienTuyenSinh, int thanhToanXetTuyen
});




}
/// @nodoc
class __$HocVienCopyWithImpl<$Res>
    implements _$HocVienCopyWith<$Res> {
  __$HocVienCopyWithImpl(this._self, this._then);

  final _HocVien _self;
  final $Res Function(_HocVien) _then;

/// Create a copy of HocVien
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? soHoSo = freezed,Object? nienKhoa = freezed,Object? maHocVien = freezed,Object? hoTen = null,Object? ngaySinh = freezed,Object? gioiTinh = freezed,Object? noiSinh = freezed,Object? email = freezed,Object? emailHust = freezed,Object? truongTotNghiepDaiHoc = freezed,Object? nganhTotNghiepDaiHoc = freezed,Object? heTotNghiepDaiHoc = freezed,Object? xepLoaiTotNghiepDaiHoc = freezed,Object? ngayTotNghiepDaiHoc = freezed,Object? dinhHuongChuyenSau = freezed,Object? hocPhanDuocMien = freezed,Object? nganhDaoTaoThacSi = freezed,Object? dienThoai = freezed,Object? maTrangThai = null,Object? deTaiLuanVanTiengViet = freezed,Object? deTaiLuanVanTiengAnh = freezed,Object? ngayGiaoDeTai = freezed,Object? soQuyetDinhGiao = freezed,Object? ngayBaoVe = freezed,Object? soQuyetDinhBaoVe = freezed,Object? ngayKyQuyetDinhBaoVe = freezed,Object? idGiangVienHuongDan = freezed,Object? hanBaoVe = freezed,Object? lanGiaHan = null,Object? idTieuBanXetTuyen = freezed,Object? idDienTuyenSinh = freezed,Object? thanhToanXetTuyen = null,}) {
  return _then(_HocVien(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,soHoSo: freezed == soHoSo ? _self.soHoSo : soHoSo // ignore: cast_nullable_to_non_nullable
as String?,nienKhoa: freezed == nienKhoa ? _self.nienKhoa : nienKhoa // ignore: cast_nullable_to_non_nullable
as String?,maHocVien: freezed == maHocVien ? _self.maHocVien : maHocVien // ignore: cast_nullable_to_non_nullable
as String?,hoTen: null == hoTen ? _self.hoTen : hoTen // ignore: cast_nullable_to_non_nullable
as String,ngaySinh: freezed == ngaySinh ? _self.ngaySinh : ngaySinh // ignore: cast_nullable_to_non_nullable
as DateTime?,gioiTinh: freezed == gioiTinh ? _self.gioiTinh : gioiTinh // ignore: cast_nullable_to_non_nullable
as GioiTinh?,noiSinh: freezed == noiSinh ? _self.noiSinh : noiSinh // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailHust: freezed == emailHust ? _self.emailHust : emailHust // ignore: cast_nullable_to_non_nullable
as String?,truongTotNghiepDaiHoc: freezed == truongTotNghiepDaiHoc ? _self.truongTotNghiepDaiHoc : truongTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as String?,nganhTotNghiepDaiHoc: freezed == nganhTotNghiepDaiHoc ? _self.nganhTotNghiepDaiHoc : nganhTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as String?,heTotNghiepDaiHoc: freezed == heTotNghiepDaiHoc ? _self.heTotNghiepDaiHoc : heTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as String?,xepLoaiTotNghiepDaiHoc: freezed == xepLoaiTotNghiepDaiHoc ? _self.xepLoaiTotNghiepDaiHoc : xepLoaiTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as String?,ngayTotNghiepDaiHoc: freezed == ngayTotNghiepDaiHoc ? _self.ngayTotNghiepDaiHoc : ngayTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
as DateTime?,dinhHuongChuyenSau: freezed == dinhHuongChuyenSau ? _self.dinhHuongChuyenSau : dinhHuongChuyenSau // ignore: cast_nullable_to_non_nullable
as String?,hocPhanDuocMien: freezed == hocPhanDuocMien ? _self.hocPhanDuocMien : hocPhanDuocMien // ignore: cast_nullable_to_non_nullable
as String?,nganhDaoTaoThacSi: freezed == nganhDaoTaoThacSi ? _self.nganhDaoTaoThacSi : nganhDaoTaoThacSi // ignore: cast_nullable_to_non_nullable
as String?,dienThoai: freezed == dienThoai ? _self.dienThoai : dienThoai // ignore: cast_nullable_to_non_nullable
as String?,maTrangThai: null == maTrangThai ? _self.maTrangThai : maTrangThai // ignore: cast_nullable_to_non_nullable
as TrangThaiHocVien,deTaiLuanVanTiengViet: freezed == deTaiLuanVanTiengViet ? _self.deTaiLuanVanTiengViet : deTaiLuanVanTiengViet // ignore: cast_nullable_to_non_nullable
as String?,deTaiLuanVanTiengAnh: freezed == deTaiLuanVanTiengAnh ? _self.deTaiLuanVanTiengAnh : deTaiLuanVanTiengAnh // ignore: cast_nullable_to_non_nullable
as String?,ngayGiaoDeTai: freezed == ngayGiaoDeTai ? _self.ngayGiaoDeTai : ngayGiaoDeTai // ignore: cast_nullable_to_non_nullable
as DateTime?,soQuyetDinhGiao: freezed == soQuyetDinhGiao ? _self.soQuyetDinhGiao : soQuyetDinhGiao // ignore: cast_nullable_to_non_nullable
as String?,ngayBaoVe: freezed == ngayBaoVe ? _self.ngayBaoVe : ngayBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,soQuyetDinhBaoVe: freezed == soQuyetDinhBaoVe ? _self.soQuyetDinhBaoVe : soQuyetDinhBaoVe // ignore: cast_nullable_to_non_nullable
as int?,ngayKyQuyetDinhBaoVe: freezed == ngayKyQuyetDinhBaoVe ? _self.ngayKyQuyetDinhBaoVe : ngayKyQuyetDinhBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,idGiangVienHuongDan: freezed == idGiangVienHuongDan ? _self.idGiangVienHuongDan : idGiangVienHuongDan // ignore: cast_nullable_to_non_nullable
as int?,hanBaoVe: freezed == hanBaoVe ? _self.hanBaoVe : hanBaoVe // ignore: cast_nullable_to_non_nullable
as DateTime?,lanGiaHan: null == lanGiaHan ? _self.lanGiaHan : lanGiaHan // ignore: cast_nullable_to_non_nullable
as int,idTieuBanXetTuyen: freezed == idTieuBanXetTuyen ? _self.idTieuBanXetTuyen : idTieuBanXetTuyen // ignore: cast_nullable_to_non_nullable
as int?,idDienTuyenSinh: freezed == idDienTuyenSinh ? _self.idDienTuyenSinh : idDienTuyenSinh // ignore: cast_nullable_to_non_nullable
as DienTuyenSinh?,thanhToanXetTuyen: null == thanhToanXetTuyen ? _self.thanhToanXetTuyen : thanhToanXetTuyen // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HoiDongLVTS {

 int get id; int? get idHocVien; int? get idChuTich; int? get idThuKy; int? get idPhanBien1; int? get idPhanBien2; int? get idUyVien; String? get ngayBaoVe; String? get soQuyetDinh; int get lanBaoVe; int get thanhToan; String? get nam;
/// Create a copy of HoiDongLVTS
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoiDongLVTSCopyWith<HoiDongLVTS> get copyWith => _$HoiDongLVTSCopyWithImpl<HoiDongLVTS>(this as HoiDongLVTS, _$identity);

  /// Serializes this HoiDongLVTS to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoiDongLVTS&&(identical(other.id, id) || other.id == id)&&(identical(other.idHocVien, idHocVien) || other.idHocVien == idHocVien)&&(identical(other.idChuTich, idChuTich) || other.idChuTich == idChuTich)&&(identical(other.idThuKy, idThuKy) || other.idThuKy == idThuKy)&&(identical(other.idPhanBien1, idPhanBien1) || other.idPhanBien1 == idPhanBien1)&&(identical(other.idPhanBien2, idPhanBien2) || other.idPhanBien2 == idPhanBien2)&&(identical(other.idUyVien, idUyVien) || other.idUyVien == idUyVien)&&(identical(other.ngayBaoVe, ngayBaoVe) || other.ngayBaoVe == ngayBaoVe)&&(identical(other.soQuyetDinh, soQuyetDinh) || other.soQuyetDinh == soQuyetDinh)&&(identical(other.lanBaoVe, lanBaoVe) || other.lanBaoVe == lanBaoVe)&&(identical(other.thanhToan, thanhToan) || other.thanhToan == thanhToan)&&(identical(other.nam, nam) || other.nam == nam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idHocVien,idChuTich,idThuKy,idPhanBien1,idPhanBien2,idUyVien,ngayBaoVe,soQuyetDinh,lanBaoVe,thanhToan,nam);

@override
String toString() {
  return 'HoiDongLVTS(id: $id, idHocVien: $idHocVien, idChuTich: $idChuTich, idThuKy: $idThuKy, idPhanBien1: $idPhanBien1, idPhanBien2: $idPhanBien2, idUyVien: $idUyVien, ngayBaoVe: $ngayBaoVe, soQuyetDinh: $soQuyetDinh, lanBaoVe: $lanBaoVe, thanhToan: $thanhToan, nam: $nam)';
}


}

/// @nodoc
abstract mixin class $HoiDongLVTSCopyWith<$Res>  {
  factory $HoiDongLVTSCopyWith(HoiDongLVTS value, $Res Function(HoiDongLVTS) _then) = _$HoiDongLVTSCopyWithImpl;
@useResult
$Res call({
 int id, int? idHocVien, int? idChuTich, int? idThuKy, int? idPhanBien1, int? idPhanBien2, int? idUyVien, String? ngayBaoVe, String? soQuyetDinh, int lanBaoVe, int thanhToan, String? nam
});




}
/// @nodoc
class _$HoiDongLVTSCopyWithImpl<$Res>
    implements $HoiDongLVTSCopyWith<$Res> {
  _$HoiDongLVTSCopyWithImpl(this._self, this._then);

  final HoiDongLVTS _self;
  final $Res Function(HoiDongLVTS) _then;

/// Create a copy of HoiDongLVTS
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? idHocVien = freezed,Object? idChuTich = freezed,Object? idThuKy = freezed,Object? idPhanBien1 = freezed,Object? idPhanBien2 = freezed,Object? idUyVien = freezed,Object? ngayBaoVe = freezed,Object? soQuyetDinh = freezed,Object? lanBaoVe = null,Object? thanhToan = null,Object? nam = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,idHocVien: freezed == idHocVien ? _self.idHocVien : idHocVien // ignore: cast_nullable_to_non_nullable
as int?,idChuTich: freezed == idChuTich ? _self.idChuTich : idChuTich // ignore: cast_nullable_to_non_nullable
as int?,idThuKy: freezed == idThuKy ? _self.idThuKy : idThuKy // ignore: cast_nullable_to_non_nullable
as int?,idPhanBien1: freezed == idPhanBien1 ? _self.idPhanBien1 : idPhanBien1 // ignore: cast_nullable_to_non_nullable
as int?,idPhanBien2: freezed == idPhanBien2 ? _self.idPhanBien2 : idPhanBien2 // ignore: cast_nullable_to_non_nullable
as int?,idUyVien: freezed == idUyVien ? _self.idUyVien : idUyVien // ignore: cast_nullable_to_non_nullable
as int?,ngayBaoVe: freezed == ngayBaoVe ? _self.ngayBaoVe : ngayBaoVe // ignore: cast_nullable_to_non_nullable
as String?,soQuyetDinh: freezed == soQuyetDinh ? _self.soQuyetDinh : soQuyetDinh // ignore: cast_nullable_to_non_nullable
as String?,lanBaoVe: null == lanBaoVe ? _self.lanBaoVe : lanBaoVe // ignore: cast_nullable_to_non_nullable
as int,thanhToan: null == thanhToan ? _self.thanhToan : thanhToan // ignore: cast_nullable_to_non_nullable
as int,nam: freezed == nam ? _self.nam : nam // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HoiDongLVTS].
extension HoiDongLVTSPatterns on HoiDongLVTS {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HoiDongLVTS value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HoiDongLVTS() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HoiDongLVTS value)  $default,){
final _that = this;
switch (_that) {
case _HoiDongLVTS():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HoiDongLVTS value)?  $default,){
final _that = this;
switch (_that) {
case _HoiDongLVTS() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? idHocVien,  int? idChuTich,  int? idThuKy,  int? idPhanBien1,  int? idPhanBien2,  int? idUyVien,  String? ngayBaoVe,  String? soQuyetDinh,  int lanBaoVe,  int thanhToan,  String? nam)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HoiDongLVTS() when $default != null:
return $default(_that.id,_that.idHocVien,_that.idChuTich,_that.idThuKy,_that.idPhanBien1,_that.idPhanBien2,_that.idUyVien,_that.ngayBaoVe,_that.soQuyetDinh,_that.lanBaoVe,_that.thanhToan,_that.nam);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? idHocVien,  int? idChuTich,  int? idThuKy,  int? idPhanBien1,  int? idPhanBien2,  int? idUyVien,  String? ngayBaoVe,  String? soQuyetDinh,  int lanBaoVe,  int thanhToan,  String? nam)  $default,) {final _that = this;
switch (_that) {
case _HoiDongLVTS():
return $default(_that.id,_that.idHocVien,_that.idChuTich,_that.idThuKy,_that.idPhanBien1,_that.idPhanBien2,_that.idUyVien,_that.ngayBaoVe,_that.soQuyetDinh,_that.lanBaoVe,_that.thanhToan,_that.nam);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? idHocVien,  int? idChuTich,  int? idThuKy,  int? idPhanBien1,  int? idPhanBien2,  int? idUyVien,  String? ngayBaoVe,  String? soQuyetDinh,  int lanBaoVe,  int thanhToan,  String? nam)?  $default,) {final _that = this;
switch (_that) {
case _HoiDongLVTS() when $default != null:
return $default(_that.id,_that.idHocVien,_that.idChuTich,_that.idThuKy,_that.idPhanBien1,_that.idPhanBien2,_that.idUyVien,_that.ngayBaoVe,_that.soQuyetDinh,_that.lanBaoVe,_that.thanhToan,_that.nam);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HoiDongLVTS implements HoiDongLVTS {
  const _HoiDongLVTS({required this.id, this.idHocVien, this.idChuTich, this.idThuKy, this.idPhanBien1, this.idPhanBien2, this.idUyVien, this.ngayBaoVe, this.soQuyetDinh, this.lanBaoVe = 1, this.thanhToan = 0, this.nam});
  factory _HoiDongLVTS.fromJson(Map<String, dynamic> json) => _$HoiDongLVTSFromJson(json);

@override final  int id;
@override final  int? idHocVien;
@override final  int? idChuTich;
@override final  int? idThuKy;
@override final  int? idPhanBien1;
@override final  int? idPhanBien2;
@override final  int? idUyVien;
@override final  String? ngayBaoVe;
@override final  String? soQuyetDinh;
@override@JsonKey() final  int lanBaoVe;
@override@JsonKey() final  int thanhToan;
@override final  String? nam;

/// Create a copy of HoiDongLVTS
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HoiDongLVTSCopyWith<_HoiDongLVTS> get copyWith => __$HoiDongLVTSCopyWithImpl<_HoiDongLVTS>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HoiDongLVTSToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HoiDongLVTS&&(identical(other.id, id) || other.id == id)&&(identical(other.idHocVien, idHocVien) || other.idHocVien == idHocVien)&&(identical(other.idChuTich, idChuTich) || other.idChuTich == idChuTich)&&(identical(other.idThuKy, idThuKy) || other.idThuKy == idThuKy)&&(identical(other.idPhanBien1, idPhanBien1) || other.idPhanBien1 == idPhanBien1)&&(identical(other.idPhanBien2, idPhanBien2) || other.idPhanBien2 == idPhanBien2)&&(identical(other.idUyVien, idUyVien) || other.idUyVien == idUyVien)&&(identical(other.ngayBaoVe, ngayBaoVe) || other.ngayBaoVe == ngayBaoVe)&&(identical(other.soQuyetDinh, soQuyetDinh) || other.soQuyetDinh == soQuyetDinh)&&(identical(other.lanBaoVe, lanBaoVe) || other.lanBaoVe == lanBaoVe)&&(identical(other.thanhToan, thanhToan) || other.thanhToan == thanhToan)&&(identical(other.nam, nam) || other.nam == nam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idHocVien,idChuTich,idThuKy,idPhanBien1,idPhanBien2,idUyVien,ngayBaoVe,soQuyetDinh,lanBaoVe,thanhToan,nam);

@override
String toString() {
  return 'HoiDongLVTS(id: $id, idHocVien: $idHocVien, idChuTich: $idChuTich, idThuKy: $idThuKy, idPhanBien1: $idPhanBien1, idPhanBien2: $idPhanBien2, idUyVien: $idUyVien, ngayBaoVe: $ngayBaoVe, soQuyetDinh: $soQuyetDinh, lanBaoVe: $lanBaoVe, thanhToan: $thanhToan, nam: $nam)';
}


}

/// @nodoc
abstract mixin class _$HoiDongLVTSCopyWith<$Res> implements $HoiDongLVTSCopyWith<$Res> {
  factory _$HoiDongLVTSCopyWith(_HoiDongLVTS value, $Res Function(_HoiDongLVTS) _then) = __$HoiDongLVTSCopyWithImpl;
@override @useResult
$Res call({
 int id, int? idHocVien, int? idChuTich, int? idThuKy, int? idPhanBien1, int? idPhanBien2, int? idUyVien, String? ngayBaoVe, String? soQuyetDinh, int lanBaoVe, int thanhToan, String? nam
});




}
/// @nodoc
class __$HoiDongLVTSCopyWithImpl<$Res>
    implements _$HoiDongLVTSCopyWith<$Res> {
  __$HoiDongLVTSCopyWithImpl(this._self, this._then);

  final _HoiDongLVTS _self;
  final $Res Function(_HoiDongLVTS) _then;

/// Create a copy of HoiDongLVTS
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? idHocVien = freezed,Object? idChuTich = freezed,Object? idThuKy = freezed,Object? idPhanBien1 = freezed,Object? idPhanBien2 = freezed,Object? idUyVien = freezed,Object? ngayBaoVe = freezed,Object? soQuyetDinh = freezed,Object? lanBaoVe = null,Object? thanhToan = null,Object? nam = freezed,}) {
  return _then(_HoiDongLVTS(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,idHocVien: freezed == idHocVien ? _self.idHocVien : idHocVien // ignore: cast_nullable_to_non_nullable
as int?,idChuTich: freezed == idChuTich ? _self.idChuTich : idChuTich // ignore: cast_nullable_to_non_nullable
as int?,idThuKy: freezed == idThuKy ? _self.idThuKy : idThuKy // ignore: cast_nullable_to_non_nullable
as int?,idPhanBien1: freezed == idPhanBien1 ? _self.idPhanBien1 : idPhanBien1 // ignore: cast_nullable_to_non_nullable
as int?,idPhanBien2: freezed == idPhanBien2 ? _self.idPhanBien2 : idPhanBien2 // ignore: cast_nullable_to_non_nullable
as int?,idUyVien: freezed == idUyVien ? _self.idUyVien : idUyVien // ignore: cast_nullable_to_non_nullable
as int?,ngayBaoVe: freezed == ngayBaoVe ? _self.ngayBaoVe : ngayBaoVe // ignore: cast_nullable_to_non_nullable
as String?,soQuyetDinh: freezed == soQuyetDinh ? _self.soQuyetDinh : soQuyetDinh // ignore: cast_nullable_to_non_nullable
as String?,lanBaoVe: null == lanBaoVe ? _self.lanBaoVe : lanBaoVe // ignore: cast_nullable_to_non_nullable
as int,thanhToan: null == thanhToan ? _self.thanhToan : thanhToan // ignore: cast_nullable_to_non_nullable
as int,nam: freezed == nam ? _self.nam : nam // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LopTinChi {

 int get id; String? get maLopHoc; String get maHocPhan; int? get soLuongDangKy;@Deprecated("Chuyển sang dùng bảng phân công dạy") int? get idGiangVien; int? get idLopTruong; String? get urlTruyCap; String? get hocKy; String? get phongHoc; NgayTrongTuan? get ngayHoc; int? get tietBatDau; int? get tietKetThuc; DateTime? get customBeginDate; DateTime? get customEndDate; TrangThaiLopTinChi get trangThai;
/// Create a copy of LopTinChi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LopTinChiCopyWith<LopTinChi> get copyWith => _$LopTinChiCopyWithImpl<LopTinChi>(this as LopTinChi, _$identity);

  /// Serializes this LopTinChi to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LopTinChi&&(identical(other.id, id) || other.id == id)&&(identical(other.maLopHoc, maLopHoc) || other.maLopHoc == maLopHoc)&&(identical(other.maHocPhan, maHocPhan) || other.maHocPhan == maHocPhan)&&(identical(other.soLuongDangKy, soLuongDangKy) || other.soLuongDangKy == soLuongDangKy)&&(identical(other.idGiangVien, idGiangVien) || other.idGiangVien == idGiangVien)&&(identical(other.idLopTruong, idLopTruong) || other.idLopTruong == idLopTruong)&&(identical(other.urlTruyCap, urlTruyCap) || other.urlTruyCap == urlTruyCap)&&(identical(other.hocKy, hocKy) || other.hocKy == hocKy)&&(identical(other.phongHoc, phongHoc) || other.phongHoc == phongHoc)&&(identical(other.ngayHoc, ngayHoc) || other.ngayHoc == ngayHoc)&&(identical(other.tietBatDau, tietBatDau) || other.tietBatDau == tietBatDau)&&(identical(other.tietKetThuc, tietKetThuc) || other.tietKetThuc == tietKetThuc)&&(identical(other.customBeginDate, customBeginDate) || other.customBeginDate == customBeginDate)&&(identical(other.customEndDate, customEndDate) || other.customEndDate == customEndDate)&&(identical(other.trangThai, trangThai) || other.trangThai == trangThai));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,maLopHoc,maHocPhan,soLuongDangKy,idGiangVien,idLopTruong,urlTruyCap,hocKy,phongHoc,ngayHoc,tietBatDau,tietKetThuc,customBeginDate,customEndDate,trangThai);

@override
String toString() {
  return 'LopTinChi(id: $id, maLopHoc: $maLopHoc, maHocPhan: $maHocPhan, soLuongDangKy: $soLuongDangKy, idGiangVien: $idGiangVien, idLopTruong: $idLopTruong, urlTruyCap: $urlTruyCap, hocKy: $hocKy, phongHoc: $phongHoc, ngayHoc: $ngayHoc, tietBatDau: $tietBatDau, tietKetThuc: $tietKetThuc, customBeginDate: $customBeginDate, customEndDate: $customEndDate, trangThai: $trangThai)';
}


}

/// @nodoc
abstract mixin class $LopTinChiCopyWith<$Res>  {
  factory $LopTinChiCopyWith(LopTinChi value, $Res Function(LopTinChi) _then) = _$LopTinChiCopyWithImpl;
@useResult
$Res call({
 int id, String? maLopHoc, String maHocPhan, int? soLuongDangKy,@Deprecated("Chuyển sang dùng bảng phân công dạy") int? idGiangVien, int? idLopTruong, String? urlTruyCap, String? hocKy, String? phongHoc, NgayTrongTuan? ngayHoc, int? tietBatDau, int? tietKetThuc, DateTime? customBeginDate, DateTime? customEndDate, TrangThaiLopTinChi trangThai
});




}
/// @nodoc
class _$LopTinChiCopyWithImpl<$Res>
    implements $LopTinChiCopyWith<$Res> {
  _$LopTinChiCopyWithImpl(this._self, this._then);

  final LopTinChi _self;
  final $Res Function(LopTinChi) _then;

/// Create a copy of LopTinChi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? maLopHoc = freezed,Object? maHocPhan = null,Object? soLuongDangKy = freezed,Object? idGiangVien = freezed,Object? idLopTruong = freezed,Object? urlTruyCap = freezed,Object? hocKy = freezed,Object? phongHoc = freezed,Object? ngayHoc = freezed,Object? tietBatDau = freezed,Object? tietKetThuc = freezed,Object? customBeginDate = freezed,Object? customEndDate = freezed,Object? trangThai = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,maLopHoc: freezed == maLopHoc ? _self.maLopHoc : maLopHoc // ignore: cast_nullable_to_non_nullable
as String?,maHocPhan: null == maHocPhan ? _self.maHocPhan : maHocPhan // ignore: cast_nullable_to_non_nullable
as String,soLuongDangKy: freezed == soLuongDangKy ? _self.soLuongDangKy : soLuongDangKy // ignore: cast_nullable_to_non_nullable
as int?,idGiangVien: freezed == idGiangVien ? _self.idGiangVien : idGiangVien // ignore: cast_nullable_to_non_nullable
as int?,idLopTruong: freezed == idLopTruong ? _self.idLopTruong : idLopTruong // ignore: cast_nullable_to_non_nullable
as int?,urlTruyCap: freezed == urlTruyCap ? _self.urlTruyCap : urlTruyCap // ignore: cast_nullable_to_non_nullable
as String?,hocKy: freezed == hocKy ? _self.hocKy : hocKy // ignore: cast_nullable_to_non_nullable
as String?,phongHoc: freezed == phongHoc ? _self.phongHoc : phongHoc // ignore: cast_nullable_to_non_nullable
as String?,ngayHoc: freezed == ngayHoc ? _self.ngayHoc : ngayHoc // ignore: cast_nullable_to_non_nullable
as NgayTrongTuan?,tietBatDau: freezed == tietBatDau ? _self.tietBatDau : tietBatDau // ignore: cast_nullable_to_non_nullable
as int?,tietKetThuc: freezed == tietKetThuc ? _self.tietKetThuc : tietKetThuc // ignore: cast_nullable_to_non_nullable
as int?,customBeginDate: freezed == customBeginDate ? _self.customBeginDate : customBeginDate // ignore: cast_nullable_to_non_nullable
as DateTime?,customEndDate: freezed == customEndDate ? _self.customEndDate : customEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,trangThai: null == trangThai ? _self.trangThai : trangThai // ignore: cast_nullable_to_non_nullable
as TrangThaiLopTinChi,
  ));
}

}


/// Adds pattern-matching-related methods to [LopTinChi].
extension LopTinChiPatterns on LopTinChi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LopTinChi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LopTinChi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LopTinChi value)  $default,){
final _that = this;
switch (_that) {
case _LopTinChi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LopTinChi value)?  $default,){
final _that = this;
switch (_that) {
case _LopTinChi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? maLopHoc,  String maHocPhan,  int? soLuongDangKy, @Deprecated("Chuyển sang dùng bảng phân công dạy")  int? idGiangVien,  int? idLopTruong,  String? urlTruyCap,  String? hocKy,  String? phongHoc,  NgayTrongTuan? ngayHoc,  int? tietBatDau,  int? tietKetThuc,  DateTime? customBeginDate,  DateTime? customEndDate,  TrangThaiLopTinChi trangThai)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LopTinChi() when $default != null:
return $default(_that.id,_that.maLopHoc,_that.maHocPhan,_that.soLuongDangKy,_that.idGiangVien,_that.idLopTruong,_that.urlTruyCap,_that.hocKy,_that.phongHoc,_that.ngayHoc,_that.tietBatDau,_that.tietKetThuc,_that.customBeginDate,_that.customEndDate,_that.trangThai);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? maLopHoc,  String maHocPhan,  int? soLuongDangKy, @Deprecated("Chuyển sang dùng bảng phân công dạy")  int? idGiangVien,  int? idLopTruong,  String? urlTruyCap,  String? hocKy,  String? phongHoc,  NgayTrongTuan? ngayHoc,  int? tietBatDau,  int? tietKetThuc,  DateTime? customBeginDate,  DateTime? customEndDate,  TrangThaiLopTinChi trangThai)  $default,) {final _that = this;
switch (_that) {
case _LopTinChi():
return $default(_that.id,_that.maLopHoc,_that.maHocPhan,_that.soLuongDangKy,_that.idGiangVien,_that.idLopTruong,_that.urlTruyCap,_that.hocKy,_that.phongHoc,_that.ngayHoc,_that.tietBatDau,_that.tietKetThuc,_that.customBeginDate,_that.customEndDate,_that.trangThai);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? maLopHoc,  String maHocPhan,  int? soLuongDangKy, @Deprecated("Chuyển sang dùng bảng phân công dạy")  int? idGiangVien,  int? idLopTruong,  String? urlTruyCap,  String? hocKy,  String? phongHoc,  NgayTrongTuan? ngayHoc,  int? tietBatDau,  int? tietKetThuc,  DateTime? customBeginDate,  DateTime? customEndDate,  TrangThaiLopTinChi trangThai)?  $default,) {final _that = this;
switch (_that) {
case _LopTinChi() when $default != null:
return $default(_that.id,_that.maLopHoc,_that.maHocPhan,_that.soLuongDangKy,_that.idGiangVien,_that.idLopTruong,_that.urlTruyCap,_that.hocKy,_that.phongHoc,_that.ngayHoc,_that.tietBatDau,_that.tietKetThuc,_that.customBeginDate,_that.customEndDate,_that.trangThai);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LopTinChi extends LopTinChi {
  const _LopTinChi({required this.id, this.maLopHoc, required this.maHocPhan, this.soLuongDangKy, @Deprecated("Chuyển sang dùng bảng phân công dạy") this.idGiangVien, this.idLopTruong, this.urlTruyCap, this.hocKy, this.phongHoc, this.ngayHoc, this.tietBatDau, this.tietKetThuc, this.customBeginDate, this.customEndDate, this.trangThai = TrangThaiLopTinChi.binhThuong}): super._();
  factory _LopTinChi.fromJson(Map<String, dynamic> json) => _$LopTinChiFromJson(json);

@override final  int id;
@override final  String? maLopHoc;
@override final  String maHocPhan;
@override final  int? soLuongDangKy;
@override@Deprecated("Chuyển sang dùng bảng phân công dạy") final  int? idGiangVien;
@override final  int? idLopTruong;
@override final  String? urlTruyCap;
@override final  String? hocKy;
@override final  String? phongHoc;
@override final  NgayTrongTuan? ngayHoc;
@override final  int? tietBatDau;
@override final  int? tietKetThuc;
@override final  DateTime? customBeginDate;
@override final  DateTime? customEndDate;
@override@JsonKey() final  TrangThaiLopTinChi trangThai;

/// Create a copy of LopTinChi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LopTinChiCopyWith<_LopTinChi> get copyWith => __$LopTinChiCopyWithImpl<_LopTinChi>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LopTinChiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LopTinChi&&(identical(other.id, id) || other.id == id)&&(identical(other.maLopHoc, maLopHoc) || other.maLopHoc == maLopHoc)&&(identical(other.maHocPhan, maHocPhan) || other.maHocPhan == maHocPhan)&&(identical(other.soLuongDangKy, soLuongDangKy) || other.soLuongDangKy == soLuongDangKy)&&(identical(other.idGiangVien, idGiangVien) || other.idGiangVien == idGiangVien)&&(identical(other.idLopTruong, idLopTruong) || other.idLopTruong == idLopTruong)&&(identical(other.urlTruyCap, urlTruyCap) || other.urlTruyCap == urlTruyCap)&&(identical(other.hocKy, hocKy) || other.hocKy == hocKy)&&(identical(other.phongHoc, phongHoc) || other.phongHoc == phongHoc)&&(identical(other.ngayHoc, ngayHoc) || other.ngayHoc == ngayHoc)&&(identical(other.tietBatDau, tietBatDau) || other.tietBatDau == tietBatDau)&&(identical(other.tietKetThuc, tietKetThuc) || other.tietKetThuc == tietKetThuc)&&(identical(other.customBeginDate, customBeginDate) || other.customBeginDate == customBeginDate)&&(identical(other.customEndDate, customEndDate) || other.customEndDate == customEndDate)&&(identical(other.trangThai, trangThai) || other.trangThai == trangThai));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,maLopHoc,maHocPhan,soLuongDangKy,idGiangVien,idLopTruong,urlTruyCap,hocKy,phongHoc,ngayHoc,tietBatDau,tietKetThuc,customBeginDate,customEndDate,trangThai);

@override
String toString() {
  return 'LopTinChi(id: $id, maLopHoc: $maLopHoc, maHocPhan: $maHocPhan, soLuongDangKy: $soLuongDangKy, idGiangVien: $idGiangVien, idLopTruong: $idLopTruong, urlTruyCap: $urlTruyCap, hocKy: $hocKy, phongHoc: $phongHoc, ngayHoc: $ngayHoc, tietBatDau: $tietBatDau, tietKetThuc: $tietKetThuc, customBeginDate: $customBeginDate, customEndDate: $customEndDate, trangThai: $trangThai)';
}


}

/// @nodoc
abstract mixin class _$LopTinChiCopyWith<$Res> implements $LopTinChiCopyWith<$Res> {
  factory _$LopTinChiCopyWith(_LopTinChi value, $Res Function(_LopTinChi) _then) = __$LopTinChiCopyWithImpl;
@override @useResult
$Res call({
 int id, String? maLopHoc, String maHocPhan, int? soLuongDangKy,@Deprecated("Chuyển sang dùng bảng phân công dạy") int? idGiangVien, int? idLopTruong, String? urlTruyCap, String? hocKy, String? phongHoc, NgayTrongTuan? ngayHoc, int? tietBatDau, int? tietKetThuc, DateTime? customBeginDate, DateTime? customEndDate, TrangThaiLopTinChi trangThai
});




}
/// @nodoc
class __$LopTinChiCopyWithImpl<$Res>
    implements _$LopTinChiCopyWith<$Res> {
  __$LopTinChiCopyWithImpl(this._self, this._then);

  final _LopTinChi _self;
  final $Res Function(_LopTinChi) _then;

/// Create a copy of LopTinChi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? maLopHoc = freezed,Object? maHocPhan = null,Object? soLuongDangKy = freezed,Object? idGiangVien = freezed,Object? idLopTruong = freezed,Object? urlTruyCap = freezed,Object? hocKy = freezed,Object? phongHoc = freezed,Object? ngayHoc = freezed,Object? tietBatDau = freezed,Object? tietKetThuc = freezed,Object? customBeginDate = freezed,Object? customEndDate = freezed,Object? trangThai = null,}) {
  return _then(_LopTinChi(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,maLopHoc: freezed == maLopHoc ? _self.maLopHoc : maLopHoc // ignore: cast_nullable_to_non_nullable
as String?,maHocPhan: null == maHocPhan ? _self.maHocPhan : maHocPhan // ignore: cast_nullable_to_non_nullable
as String,soLuongDangKy: freezed == soLuongDangKy ? _self.soLuongDangKy : soLuongDangKy // ignore: cast_nullable_to_non_nullable
as int?,idGiangVien: freezed == idGiangVien ? _self.idGiangVien : idGiangVien // ignore: cast_nullable_to_non_nullable
as int?,idLopTruong: freezed == idLopTruong ? _self.idLopTruong : idLopTruong // ignore: cast_nullable_to_non_nullable
as int?,urlTruyCap: freezed == urlTruyCap ? _self.urlTruyCap : urlTruyCap // ignore: cast_nullable_to_non_nullable
as String?,hocKy: freezed == hocKy ? _self.hocKy : hocKy // ignore: cast_nullable_to_non_nullable
as String?,phongHoc: freezed == phongHoc ? _self.phongHoc : phongHoc // ignore: cast_nullable_to_non_nullable
as String?,ngayHoc: freezed == ngayHoc ? _self.ngayHoc : ngayHoc // ignore: cast_nullable_to_non_nullable
as NgayTrongTuan?,tietBatDau: freezed == tietBatDau ? _self.tietBatDau : tietBatDau // ignore: cast_nullable_to_non_nullable
as int?,tietKetThuc: freezed == tietKetThuc ? _self.tietKetThuc : tietKetThuc // ignore: cast_nullable_to_non_nullable
as int?,customBeginDate: freezed == customBeginDate ? _self.customBeginDate : customBeginDate // ignore: cast_nullable_to_non_nullable
as DateTime?,customEndDate: freezed == customEndDate ? _self.customEndDate : customEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,trangThai: null == trangThai ? _self.trangThai : trangThai // ignore: cast_nullable_to_non_nullable
as TrangThaiLopTinChi,
  ));
}


}


/// @nodoc
mixin _$NamTaiChinh {

 String get nam; int get tienChuTichLVTS; int get tienThuKyLVTS; int get tienUyVienLVTS; int get tienPhanBienLVTS; int get tienChuTichXT; int get tienThuKyXT; int get tienUyVienXT; int get tienChuTichDCNCS; int get tienThuKyDCNCS;
/// Create a copy of NamTaiChinh
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NamTaiChinhCopyWith<NamTaiChinh> get copyWith => _$NamTaiChinhCopyWithImpl<NamTaiChinh>(this as NamTaiChinh, _$identity);

  /// Serializes this NamTaiChinh to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NamTaiChinh&&(identical(other.nam, nam) || other.nam == nam)&&(identical(other.tienChuTichLVTS, tienChuTichLVTS) || other.tienChuTichLVTS == tienChuTichLVTS)&&(identical(other.tienThuKyLVTS, tienThuKyLVTS) || other.tienThuKyLVTS == tienThuKyLVTS)&&(identical(other.tienUyVienLVTS, tienUyVienLVTS) || other.tienUyVienLVTS == tienUyVienLVTS)&&(identical(other.tienPhanBienLVTS, tienPhanBienLVTS) || other.tienPhanBienLVTS == tienPhanBienLVTS)&&(identical(other.tienChuTichXT, tienChuTichXT) || other.tienChuTichXT == tienChuTichXT)&&(identical(other.tienThuKyXT, tienThuKyXT) || other.tienThuKyXT == tienThuKyXT)&&(identical(other.tienUyVienXT, tienUyVienXT) || other.tienUyVienXT == tienUyVienXT)&&(identical(other.tienChuTichDCNCS, tienChuTichDCNCS) || other.tienChuTichDCNCS == tienChuTichDCNCS)&&(identical(other.tienThuKyDCNCS, tienThuKyDCNCS) || other.tienThuKyDCNCS == tienThuKyDCNCS));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nam,tienChuTichLVTS,tienThuKyLVTS,tienUyVienLVTS,tienPhanBienLVTS,tienChuTichXT,tienThuKyXT,tienUyVienXT,tienChuTichDCNCS,tienThuKyDCNCS);

@override
String toString() {
  return 'NamTaiChinh(nam: $nam, tienChuTichLVTS: $tienChuTichLVTS, tienThuKyLVTS: $tienThuKyLVTS, tienUyVienLVTS: $tienUyVienLVTS, tienPhanBienLVTS: $tienPhanBienLVTS, tienChuTichXT: $tienChuTichXT, tienThuKyXT: $tienThuKyXT, tienUyVienXT: $tienUyVienXT, tienChuTichDCNCS: $tienChuTichDCNCS, tienThuKyDCNCS: $tienThuKyDCNCS)';
}


}

/// @nodoc
abstract mixin class $NamTaiChinhCopyWith<$Res>  {
  factory $NamTaiChinhCopyWith(NamTaiChinh value, $Res Function(NamTaiChinh) _then) = _$NamTaiChinhCopyWithImpl;
@useResult
$Res call({
 String nam, int tienChuTichLVTS, int tienThuKyLVTS, int tienUyVienLVTS, int tienPhanBienLVTS, int tienChuTichXT, int tienThuKyXT, int tienUyVienXT, int tienChuTichDCNCS, int tienThuKyDCNCS
});




}
/// @nodoc
class _$NamTaiChinhCopyWithImpl<$Res>
    implements $NamTaiChinhCopyWith<$Res> {
  _$NamTaiChinhCopyWithImpl(this._self, this._then);

  final NamTaiChinh _self;
  final $Res Function(NamTaiChinh) _then;

/// Create a copy of NamTaiChinh
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nam = null,Object? tienChuTichLVTS = null,Object? tienThuKyLVTS = null,Object? tienUyVienLVTS = null,Object? tienPhanBienLVTS = null,Object? tienChuTichXT = null,Object? tienThuKyXT = null,Object? tienUyVienXT = null,Object? tienChuTichDCNCS = null,Object? tienThuKyDCNCS = null,}) {
  return _then(_self.copyWith(
nam: null == nam ? _self.nam : nam // ignore: cast_nullable_to_non_nullable
as String,tienChuTichLVTS: null == tienChuTichLVTS ? _self.tienChuTichLVTS : tienChuTichLVTS // ignore: cast_nullable_to_non_nullable
as int,tienThuKyLVTS: null == tienThuKyLVTS ? _self.tienThuKyLVTS : tienThuKyLVTS // ignore: cast_nullable_to_non_nullable
as int,tienUyVienLVTS: null == tienUyVienLVTS ? _self.tienUyVienLVTS : tienUyVienLVTS // ignore: cast_nullable_to_non_nullable
as int,tienPhanBienLVTS: null == tienPhanBienLVTS ? _self.tienPhanBienLVTS : tienPhanBienLVTS // ignore: cast_nullable_to_non_nullable
as int,tienChuTichXT: null == tienChuTichXT ? _self.tienChuTichXT : tienChuTichXT // ignore: cast_nullable_to_non_nullable
as int,tienThuKyXT: null == tienThuKyXT ? _self.tienThuKyXT : tienThuKyXT // ignore: cast_nullable_to_non_nullable
as int,tienUyVienXT: null == tienUyVienXT ? _self.tienUyVienXT : tienUyVienXT // ignore: cast_nullable_to_non_nullable
as int,tienChuTichDCNCS: null == tienChuTichDCNCS ? _self.tienChuTichDCNCS : tienChuTichDCNCS // ignore: cast_nullable_to_non_nullable
as int,tienThuKyDCNCS: null == tienThuKyDCNCS ? _self.tienThuKyDCNCS : tienThuKyDCNCS // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NamTaiChinh].
extension NamTaiChinhPatterns on NamTaiChinh {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NamTaiChinh value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NamTaiChinh() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NamTaiChinh value)  $default,){
final _that = this;
switch (_that) {
case _NamTaiChinh():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NamTaiChinh value)?  $default,){
final _that = this;
switch (_that) {
case _NamTaiChinh() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nam,  int tienChuTichLVTS,  int tienThuKyLVTS,  int tienUyVienLVTS,  int tienPhanBienLVTS,  int tienChuTichXT,  int tienThuKyXT,  int tienUyVienXT,  int tienChuTichDCNCS,  int tienThuKyDCNCS)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NamTaiChinh() when $default != null:
return $default(_that.nam,_that.tienChuTichLVTS,_that.tienThuKyLVTS,_that.tienUyVienLVTS,_that.tienPhanBienLVTS,_that.tienChuTichXT,_that.tienThuKyXT,_that.tienUyVienXT,_that.tienChuTichDCNCS,_that.tienThuKyDCNCS);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nam,  int tienChuTichLVTS,  int tienThuKyLVTS,  int tienUyVienLVTS,  int tienPhanBienLVTS,  int tienChuTichXT,  int tienThuKyXT,  int tienUyVienXT,  int tienChuTichDCNCS,  int tienThuKyDCNCS)  $default,) {final _that = this;
switch (_that) {
case _NamTaiChinh():
return $default(_that.nam,_that.tienChuTichLVTS,_that.tienThuKyLVTS,_that.tienUyVienLVTS,_that.tienPhanBienLVTS,_that.tienChuTichXT,_that.tienThuKyXT,_that.tienUyVienXT,_that.tienChuTichDCNCS,_that.tienThuKyDCNCS);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nam,  int tienChuTichLVTS,  int tienThuKyLVTS,  int tienUyVienLVTS,  int tienPhanBienLVTS,  int tienChuTichXT,  int tienThuKyXT,  int tienUyVienXT,  int tienChuTichDCNCS,  int tienThuKyDCNCS)?  $default,) {final _that = this;
switch (_that) {
case _NamTaiChinh() when $default != null:
return $default(_that.nam,_that.tienChuTichLVTS,_that.tienThuKyLVTS,_that.tienUyVienLVTS,_that.tienPhanBienLVTS,_that.tienChuTichXT,_that.tienThuKyXT,_that.tienUyVienXT,_that.tienChuTichDCNCS,_that.tienThuKyDCNCS);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NamTaiChinh implements NamTaiChinh {
  const _NamTaiChinh({required this.nam, required this.tienChuTichLVTS, required this.tienThuKyLVTS, required this.tienUyVienLVTS, required this.tienPhanBienLVTS, required this.tienChuTichXT, required this.tienThuKyXT, required this.tienUyVienXT, required this.tienChuTichDCNCS, required this.tienThuKyDCNCS});
  factory _NamTaiChinh.fromJson(Map<String, dynamic> json) => _$NamTaiChinhFromJson(json);

@override final  String nam;
@override final  int tienChuTichLVTS;
@override final  int tienThuKyLVTS;
@override final  int tienUyVienLVTS;
@override final  int tienPhanBienLVTS;
@override final  int tienChuTichXT;
@override final  int tienThuKyXT;
@override final  int tienUyVienXT;
@override final  int tienChuTichDCNCS;
@override final  int tienThuKyDCNCS;

/// Create a copy of NamTaiChinh
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NamTaiChinhCopyWith<_NamTaiChinh> get copyWith => __$NamTaiChinhCopyWithImpl<_NamTaiChinh>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NamTaiChinhToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NamTaiChinh&&(identical(other.nam, nam) || other.nam == nam)&&(identical(other.tienChuTichLVTS, tienChuTichLVTS) || other.tienChuTichLVTS == tienChuTichLVTS)&&(identical(other.tienThuKyLVTS, tienThuKyLVTS) || other.tienThuKyLVTS == tienThuKyLVTS)&&(identical(other.tienUyVienLVTS, tienUyVienLVTS) || other.tienUyVienLVTS == tienUyVienLVTS)&&(identical(other.tienPhanBienLVTS, tienPhanBienLVTS) || other.tienPhanBienLVTS == tienPhanBienLVTS)&&(identical(other.tienChuTichXT, tienChuTichXT) || other.tienChuTichXT == tienChuTichXT)&&(identical(other.tienThuKyXT, tienThuKyXT) || other.tienThuKyXT == tienThuKyXT)&&(identical(other.tienUyVienXT, tienUyVienXT) || other.tienUyVienXT == tienUyVienXT)&&(identical(other.tienChuTichDCNCS, tienChuTichDCNCS) || other.tienChuTichDCNCS == tienChuTichDCNCS)&&(identical(other.tienThuKyDCNCS, tienThuKyDCNCS) || other.tienThuKyDCNCS == tienThuKyDCNCS));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nam,tienChuTichLVTS,tienThuKyLVTS,tienUyVienLVTS,tienPhanBienLVTS,tienChuTichXT,tienThuKyXT,tienUyVienXT,tienChuTichDCNCS,tienThuKyDCNCS);

@override
String toString() {
  return 'NamTaiChinh(nam: $nam, tienChuTichLVTS: $tienChuTichLVTS, tienThuKyLVTS: $tienThuKyLVTS, tienUyVienLVTS: $tienUyVienLVTS, tienPhanBienLVTS: $tienPhanBienLVTS, tienChuTichXT: $tienChuTichXT, tienThuKyXT: $tienThuKyXT, tienUyVienXT: $tienUyVienXT, tienChuTichDCNCS: $tienChuTichDCNCS, tienThuKyDCNCS: $tienThuKyDCNCS)';
}


}

/// @nodoc
abstract mixin class _$NamTaiChinhCopyWith<$Res> implements $NamTaiChinhCopyWith<$Res> {
  factory _$NamTaiChinhCopyWith(_NamTaiChinh value, $Res Function(_NamTaiChinh) _then) = __$NamTaiChinhCopyWithImpl;
@override @useResult
$Res call({
 String nam, int tienChuTichLVTS, int tienThuKyLVTS, int tienUyVienLVTS, int tienPhanBienLVTS, int tienChuTichXT, int tienThuKyXT, int tienUyVienXT, int tienChuTichDCNCS, int tienThuKyDCNCS
});




}
/// @nodoc
class __$NamTaiChinhCopyWithImpl<$Res>
    implements _$NamTaiChinhCopyWith<$Res> {
  __$NamTaiChinhCopyWithImpl(this._self, this._then);

  final _NamTaiChinh _self;
  final $Res Function(_NamTaiChinh) _then;

/// Create a copy of NamTaiChinh
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nam = null,Object? tienChuTichLVTS = null,Object? tienThuKyLVTS = null,Object? tienUyVienLVTS = null,Object? tienPhanBienLVTS = null,Object? tienChuTichXT = null,Object? tienThuKyXT = null,Object? tienUyVienXT = null,Object? tienChuTichDCNCS = null,Object? tienThuKyDCNCS = null,}) {
  return _then(_NamTaiChinh(
nam: null == nam ? _self.nam : nam // ignore: cast_nullable_to_non_nullable
as String,tienChuTichLVTS: null == tienChuTichLVTS ? _self.tienChuTichLVTS : tienChuTichLVTS // ignore: cast_nullable_to_non_nullable
as int,tienThuKyLVTS: null == tienThuKyLVTS ? _self.tienThuKyLVTS : tienThuKyLVTS // ignore: cast_nullable_to_non_nullable
as int,tienUyVienLVTS: null == tienUyVienLVTS ? _self.tienUyVienLVTS : tienUyVienLVTS // ignore: cast_nullable_to_non_nullable
as int,tienPhanBienLVTS: null == tienPhanBienLVTS ? _self.tienPhanBienLVTS : tienPhanBienLVTS // ignore: cast_nullable_to_non_nullable
as int,tienChuTichXT: null == tienChuTichXT ? _self.tienChuTichXT : tienChuTichXT // ignore: cast_nullable_to_non_nullable
as int,tienThuKyXT: null == tienThuKyXT ? _self.tienThuKyXT : tienThuKyXT // ignore: cast_nullable_to_non_nullable
as int,tienUyVienXT: null == tienUyVienXT ? _self.tienUyVienXT : tienUyVienXT // ignore: cast_nullable_to_non_nullable
as int,tienChuTichDCNCS: null == tienChuTichDCNCS ? _self.tienChuTichDCNCS : tienChuTichDCNCS // ignore: cast_nullable_to_non_nullable
as int,tienThuKyDCNCS: null == tienThuKyDCNCS ? _self.tienThuKyDCNCS : tienThuKyDCNCS // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$NhomChuyenMon {

 int get id; String get tenNhom;
/// Create a copy of NhomChuyenMon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NhomChuyenMonCopyWith<NhomChuyenMon> get copyWith => _$NhomChuyenMonCopyWithImpl<NhomChuyenMon>(this as NhomChuyenMon, _$identity);

  /// Serializes this NhomChuyenMon to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NhomChuyenMon&&(identical(other.id, id) || other.id == id)&&(identical(other.tenNhom, tenNhom) || other.tenNhom == tenNhom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenNhom);

@override
String toString() {
  return 'NhomChuyenMon(id: $id, tenNhom: $tenNhom)';
}


}

/// @nodoc
abstract mixin class $NhomChuyenMonCopyWith<$Res>  {
  factory $NhomChuyenMonCopyWith(NhomChuyenMon value, $Res Function(NhomChuyenMon) _then) = _$NhomChuyenMonCopyWithImpl;
@useResult
$Res call({
 int id, String tenNhom
});




}
/// @nodoc
class _$NhomChuyenMonCopyWithImpl<$Res>
    implements $NhomChuyenMonCopyWith<$Res> {
  _$NhomChuyenMonCopyWithImpl(this._self, this._then);

  final NhomChuyenMon _self;
  final $Res Function(NhomChuyenMon) _then;

/// Create a copy of NhomChuyenMon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenNhom = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenNhom: null == tenNhom ? _self.tenNhom : tenNhom // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NhomChuyenMon].
extension NhomChuyenMonPatterns on NhomChuyenMon {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NhomChuyenMon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NhomChuyenMon() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NhomChuyenMon value)  $default,){
final _that = this;
switch (_that) {
case _NhomChuyenMon():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NhomChuyenMon value)?  $default,){
final _that = this;
switch (_that) {
case _NhomChuyenMon() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String tenNhom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NhomChuyenMon() when $default != null:
return $default(_that.id,_that.tenNhom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String tenNhom)  $default,) {final _that = this;
switch (_that) {
case _NhomChuyenMon():
return $default(_that.id,_that.tenNhom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String tenNhom)?  $default,) {final _that = this;
switch (_that) {
case _NhomChuyenMon() when $default != null:
return $default(_that.id,_that.tenNhom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NhomChuyenMon implements NhomChuyenMon {
  const _NhomChuyenMon({required this.id, required this.tenNhom});
  factory _NhomChuyenMon.fromJson(Map<String, dynamic> json) => _$NhomChuyenMonFromJson(json);

@override final  int id;
@override final  String tenNhom;

/// Create a copy of NhomChuyenMon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NhomChuyenMonCopyWith<_NhomChuyenMon> get copyWith => __$NhomChuyenMonCopyWithImpl<_NhomChuyenMon>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NhomChuyenMonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NhomChuyenMon&&(identical(other.id, id) || other.id == id)&&(identical(other.tenNhom, tenNhom) || other.tenNhom == tenNhom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenNhom);

@override
String toString() {
  return 'NhomChuyenMon(id: $id, tenNhom: $tenNhom)';
}


}

/// @nodoc
abstract mixin class _$NhomChuyenMonCopyWith<$Res> implements $NhomChuyenMonCopyWith<$Res> {
  factory _$NhomChuyenMonCopyWith(_NhomChuyenMon value, $Res Function(_NhomChuyenMon) _then) = __$NhomChuyenMonCopyWithImpl;
@override @useResult
$Res call({
 int id, String tenNhom
});




}
/// @nodoc
class __$NhomChuyenMonCopyWithImpl<$Res>
    implements _$NhomChuyenMonCopyWith<$Res> {
  __$NhomChuyenMonCopyWithImpl(this._self, this._then);

  final _NhomChuyenMon _self;
  final $Res Function(_NhomChuyenMon) _then;

/// Create a copy of NhomChuyenMon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenNhom = null,}) {
  return _then(_NhomChuyenMon(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenNhom: null == tenNhom ? _self.tenNhom : tenNhom // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NienKhoa {

 String get nienKhoa;
/// Create a copy of NienKhoa
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NienKhoaCopyWith<NienKhoa> get copyWith => _$NienKhoaCopyWithImpl<NienKhoa>(this as NienKhoa, _$identity);

  /// Serializes this NienKhoa to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NienKhoa&&(identical(other.nienKhoa, nienKhoa) || other.nienKhoa == nienKhoa));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nienKhoa);

@override
String toString() {
  return 'NienKhoa(nienKhoa: $nienKhoa)';
}


}

/// @nodoc
abstract mixin class $NienKhoaCopyWith<$Res>  {
  factory $NienKhoaCopyWith(NienKhoa value, $Res Function(NienKhoa) _then) = _$NienKhoaCopyWithImpl;
@useResult
$Res call({
 String nienKhoa
});




}
/// @nodoc
class _$NienKhoaCopyWithImpl<$Res>
    implements $NienKhoaCopyWith<$Res> {
  _$NienKhoaCopyWithImpl(this._self, this._then);

  final NienKhoa _self;
  final $Res Function(NienKhoa) _then;

/// Create a copy of NienKhoa
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nienKhoa = null,}) {
  return _then(_self.copyWith(
nienKhoa: null == nienKhoa ? _self.nienKhoa : nienKhoa // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NienKhoa].
extension NienKhoaPatterns on NienKhoa {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NienKhoa value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NienKhoa() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NienKhoa value)  $default,){
final _that = this;
switch (_that) {
case _NienKhoa():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NienKhoa value)?  $default,){
final _that = this;
switch (_that) {
case _NienKhoa() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nienKhoa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NienKhoa() when $default != null:
return $default(_that.nienKhoa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nienKhoa)  $default,) {final _that = this;
switch (_that) {
case _NienKhoa():
return $default(_that.nienKhoa);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nienKhoa)?  $default,) {final _that = this;
switch (_that) {
case _NienKhoa() when $default != null:
return $default(_that.nienKhoa);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NienKhoa extends NienKhoa {
  const _NienKhoa({required this.nienKhoa}): super._();
  factory _NienKhoa.fromJson(Map<String, dynamic> json) => _$NienKhoaFromJson(json);

@override final  String nienKhoa;

/// Create a copy of NienKhoa
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NienKhoaCopyWith<_NienKhoa> get copyWith => __$NienKhoaCopyWithImpl<_NienKhoa>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NienKhoaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NienKhoa&&(identical(other.nienKhoa, nienKhoa) || other.nienKhoa == nienKhoa));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nienKhoa);

@override
String toString() {
  return 'NienKhoa(nienKhoa: $nienKhoa)';
}


}

/// @nodoc
abstract mixin class _$NienKhoaCopyWith<$Res> implements $NienKhoaCopyWith<$Res> {
  factory _$NienKhoaCopyWith(_NienKhoa value, $Res Function(_NienKhoa) _then) = __$NienKhoaCopyWithImpl;
@override @useResult
$Res call({
 String nienKhoa
});




}
/// @nodoc
class __$NienKhoaCopyWithImpl<$Res>
    implements _$NienKhoaCopyWith<$Res> {
  __$NienKhoaCopyWithImpl(this._self, this._then);

  final _NienKhoa _self;
  final $Res Function(_NienKhoa) _then;

/// Create a copy of NienKhoa
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nienKhoa = null,}) {
  return _then(_NienKhoa(
nienKhoa: null == nienKhoa ? _self.nienKhoa : nienKhoa // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeachingRegistration {

@JsonKey(name: "idGiangVien") int get teacherId;@JsonKey(name: "maHocPhan") String get courseId;
/// Create a copy of TeachingRegistration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeachingRegistrationCopyWith<TeachingRegistration> get copyWith => _$TeachingRegistrationCopyWithImpl<TeachingRegistration>(this as TeachingRegistration, _$identity);

  /// Serializes this TeachingRegistration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeachingRegistration&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.courseId, courseId) || other.courseId == courseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teacherId,courseId);

@override
String toString() {
  return 'TeachingRegistration(teacherId: $teacherId, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class $TeachingRegistrationCopyWith<$Res>  {
  factory $TeachingRegistrationCopyWith(TeachingRegistration value, $Res Function(TeachingRegistration) _then) = _$TeachingRegistrationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "idGiangVien") int teacherId,@JsonKey(name: "maHocPhan") String courseId
});




}
/// @nodoc
class _$TeachingRegistrationCopyWithImpl<$Res>
    implements $TeachingRegistrationCopyWith<$Res> {
  _$TeachingRegistrationCopyWithImpl(this._self, this._then);

  final TeachingRegistration _self;
  final $Res Function(TeachingRegistration) _then;

/// Create a copy of TeachingRegistration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teacherId = null,Object? courseId = null,}) {
  return _then(_self.copyWith(
teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeachingRegistration].
extension TeachingRegistrationPatterns on TeachingRegistration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeachingRegistration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeachingRegistration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeachingRegistration value)  $default,){
final _that = this;
switch (_that) {
case _TeachingRegistration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeachingRegistration value)?  $default,){
final _that = this;
switch (_that) {
case _TeachingRegistration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "idGiangVien")  int teacherId, @JsonKey(name: "maHocPhan")  String courseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeachingRegistration() when $default != null:
return $default(_that.teacherId,_that.courseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "idGiangVien")  int teacherId, @JsonKey(name: "maHocPhan")  String courseId)  $default,) {final _that = this;
switch (_that) {
case _TeachingRegistration():
return $default(_that.teacherId,_that.courseId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "idGiangVien")  int teacherId, @JsonKey(name: "maHocPhan")  String courseId)?  $default,) {final _that = this;
switch (_that) {
case _TeachingRegistration() when $default != null:
return $default(_that.teacherId,_that.courseId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeachingRegistration implements TeachingRegistration {
  const _TeachingRegistration({@JsonKey(name: "idGiangVien") required this.teacherId, @JsonKey(name: "maHocPhan") required this.courseId});
  factory _TeachingRegistration.fromJson(Map<String, dynamic> json) => _$TeachingRegistrationFromJson(json);

@override@JsonKey(name: "idGiangVien") final  int teacherId;
@override@JsonKey(name: "maHocPhan") final  String courseId;

/// Create a copy of TeachingRegistration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeachingRegistrationCopyWith<_TeachingRegistration> get copyWith => __$TeachingRegistrationCopyWithImpl<_TeachingRegistration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeachingRegistrationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeachingRegistration&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.courseId, courseId) || other.courseId == courseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teacherId,courseId);

@override
String toString() {
  return 'TeachingRegistration(teacherId: $teacherId, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$TeachingRegistrationCopyWith<$Res> implements $TeachingRegistrationCopyWith<$Res> {
  factory _$TeachingRegistrationCopyWith(_TeachingRegistration value, $Res Function(_TeachingRegistration) _then) = __$TeachingRegistrationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "idGiangVien") int teacherId,@JsonKey(name: "maHocPhan") String courseId
});




}
/// @nodoc
class __$TeachingRegistrationCopyWithImpl<$Res>
    implements _$TeachingRegistrationCopyWith<$Res> {
  __$TeachingRegistrationCopyWithImpl(this._self, this._then);

  final _TeachingRegistration _self;
  final $Res Function(_TeachingRegistration) _then;

/// Create a copy of TeachingRegistration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teacherId = null,Object? courseId = null,}) {
  return _then(_TeachingRegistration(
teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TieuBanXetTuyen {

 int get id; String get nam; int get idChuTich; int get idThuKy; int get idUyVien1; int get idUyVien2; int get idUyVien3;
/// Create a copy of TieuBanXetTuyen
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TieuBanXetTuyenCopyWith<TieuBanXetTuyen> get copyWith => _$TieuBanXetTuyenCopyWithImpl<TieuBanXetTuyen>(this as TieuBanXetTuyen, _$identity);

  /// Serializes this TieuBanXetTuyen to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TieuBanXetTuyen&&(identical(other.id, id) || other.id == id)&&(identical(other.nam, nam) || other.nam == nam)&&(identical(other.idChuTich, idChuTich) || other.idChuTich == idChuTich)&&(identical(other.idThuKy, idThuKy) || other.idThuKy == idThuKy)&&(identical(other.idUyVien1, idUyVien1) || other.idUyVien1 == idUyVien1)&&(identical(other.idUyVien2, idUyVien2) || other.idUyVien2 == idUyVien2)&&(identical(other.idUyVien3, idUyVien3) || other.idUyVien3 == idUyVien3));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nam,idChuTich,idThuKy,idUyVien1,idUyVien2,idUyVien3);



}

/// @nodoc
abstract mixin class $TieuBanXetTuyenCopyWith<$Res>  {
  factory $TieuBanXetTuyenCopyWith(TieuBanXetTuyen value, $Res Function(TieuBanXetTuyen) _then) = _$TieuBanXetTuyenCopyWithImpl;
@useResult
$Res call({
 int id, String nam, int idChuTich, int idThuKy, int idUyVien1, int idUyVien2, int idUyVien3
});




}
/// @nodoc
class _$TieuBanXetTuyenCopyWithImpl<$Res>
    implements $TieuBanXetTuyenCopyWith<$Res> {
  _$TieuBanXetTuyenCopyWithImpl(this._self, this._then);

  final TieuBanXetTuyen _self;
  final $Res Function(TieuBanXetTuyen) _then;

/// Create a copy of TieuBanXetTuyen
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nam = null,Object? idChuTich = null,Object? idThuKy = null,Object? idUyVien1 = null,Object? idUyVien2 = null,Object? idUyVien3 = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nam: null == nam ? _self.nam : nam // ignore: cast_nullable_to_non_nullable
as String,idChuTich: null == idChuTich ? _self.idChuTich : idChuTich // ignore: cast_nullable_to_non_nullable
as int,idThuKy: null == idThuKy ? _self.idThuKy : idThuKy // ignore: cast_nullable_to_non_nullable
as int,idUyVien1: null == idUyVien1 ? _self.idUyVien1 : idUyVien1 // ignore: cast_nullable_to_non_nullable
as int,idUyVien2: null == idUyVien2 ? _self.idUyVien2 : idUyVien2 // ignore: cast_nullable_to_non_nullable
as int,idUyVien3: null == idUyVien3 ? _self.idUyVien3 : idUyVien3 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TieuBanXetTuyen].
extension TieuBanXetTuyenPatterns on TieuBanXetTuyen {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TieuBanXetTuyen value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TieuBanXetTuyen() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TieuBanXetTuyen value)  $default,){
final _that = this;
switch (_that) {
case _TieuBanXetTuyen():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TieuBanXetTuyen value)?  $default,){
final _that = this;
switch (_that) {
case _TieuBanXetTuyen() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nam,  int idChuTich,  int idThuKy,  int idUyVien1,  int idUyVien2,  int idUyVien3)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TieuBanXetTuyen() when $default != null:
return $default(_that.id,_that.nam,_that.idChuTich,_that.idThuKy,_that.idUyVien1,_that.idUyVien2,_that.idUyVien3);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nam,  int idChuTich,  int idThuKy,  int idUyVien1,  int idUyVien2,  int idUyVien3)  $default,) {final _that = this;
switch (_that) {
case _TieuBanXetTuyen():
return $default(_that.id,_that.nam,_that.idChuTich,_that.idThuKy,_that.idUyVien1,_that.idUyVien2,_that.idUyVien3);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nam,  int idChuTich,  int idThuKy,  int idUyVien1,  int idUyVien2,  int idUyVien3)?  $default,) {final _that = this;
switch (_that) {
case _TieuBanXetTuyen() when $default != null:
return $default(_that.id,_that.nam,_that.idChuTich,_that.idThuKy,_that.idUyVien1,_that.idUyVien2,_that.idUyVien3);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TieuBanXetTuyen extends TieuBanXetTuyen {
  const _TieuBanXetTuyen({required this.id, required this.nam, required this.idChuTich, required this.idThuKy, required this.idUyVien1, required this.idUyVien2, required this.idUyVien3}): super._();
  factory _TieuBanXetTuyen.fromJson(Map<String, dynamic> json) => _$TieuBanXetTuyenFromJson(json);

@override final  int id;
@override final  String nam;
@override final  int idChuTich;
@override final  int idThuKy;
@override final  int idUyVien1;
@override final  int idUyVien2;
@override final  int idUyVien3;

/// Create a copy of TieuBanXetTuyen
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TieuBanXetTuyenCopyWith<_TieuBanXetTuyen> get copyWith => __$TieuBanXetTuyenCopyWithImpl<_TieuBanXetTuyen>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TieuBanXetTuyenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TieuBanXetTuyen&&(identical(other.id, id) || other.id == id)&&(identical(other.nam, nam) || other.nam == nam)&&(identical(other.idChuTich, idChuTich) || other.idChuTich == idChuTich)&&(identical(other.idThuKy, idThuKy) || other.idThuKy == idThuKy)&&(identical(other.idUyVien1, idUyVien1) || other.idUyVien1 == idUyVien1)&&(identical(other.idUyVien2, idUyVien2) || other.idUyVien2 == idUyVien2)&&(identical(other.idUyVien3, idUyVien3) || other.idUyVien3 == idUyVien3));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nam,idChuTich,idThuKy,idUyVien1,idUyVien2,idUyVien3);



}

/// @nodoc
abstract mixin class _$TieuBanXetTuyenCopyWith<$Res> implements $TieuBanXetTuyenCopyWith<$Res> {
  factory _$TieuBanXetTuyenCopyWith(_TieuBanXetTuyen value, $Res Function(_TieuBanXetTuyen) _then) = __$TieuBanXetTuyenCopyWithImpl;
@override @useResult
$Res call({
 int id, String nam, int idChuTich, int idThuKy, int idUyVien1, int idUyVien2, int idUyVien3
});




}
/// @nodoc
class __$TieuBanXetTuyenCopyWithImpl<$Res>
    implements _$TieuBanXetTuyenCopyWith<$Res> {
  __$TieuBanXetTuyenCopyWithImpl(this._self, this._then);

  final _TieuBanXetTuyen _self;
  final $Res Function(_TieuBanXetTuyen) _then;

/// Create a copy of TieuBanXetTuyen
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nam = null,Object? idChuTich = null,Object? idThuKy = null,Object? idUyVien1 = null,Object? idUyVien2 = null,Object? idUyVien3 = null,}) {
  return _then(_TieuBanXetTuyen(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nam: null == nam ? _self.nam : nam // ignore: cast_nullable_to_non_nullable
as String,idChuTich: null == idChuTich ? _self.idChuTich : idChuTich // ignore: cast_nullable_to_non_nullable
as int,idThuKy: null == idThuKy ? _self.idThuKy : idThuKy // ignore: cast_nullable_to_non_nullable
as int,idUyVien1: null == idUyVien1 ? _self.idUyVien1 : idUyVien1 // ignore: cast_nullable_to_non_nullable
as int,idUyVien2: null == idUyVien2 ? _self.idUyVien2 : idUyVien2 // ignore: cast_nullable_to_non_nullable
as int,idUyVien3: null == idUyVien3 ? _self.idUyVien3 : idUyVien3 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
