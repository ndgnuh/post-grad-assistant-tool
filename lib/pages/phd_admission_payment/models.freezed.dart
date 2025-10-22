// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CouncilViewModel {

 PhdStudent get student; TeacherData get president; TeacherData get secretary; TeacherData get member1; TeacherData get member2; TeacherData get member3;
/// Create a copy of CouncilViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouncilViewModelCopyWith<CouncilViewModel> get copyWith => _$CouncilViewModelCopyWithImpl<CouncilViewModel>(this as CouncilViewModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouncilViewModel&&const DeepCollectionEquality().equals(other.student, student)&&const DeepCollectionEquality().equals(other.president, president)&&const DeepCollectionEquality().equals(other.secretary, secretary)&&const DeepCollectionEquality().equals(other.member1, member1)&&const DeepCollectionEquality().equals(other.member2, member2)&&const DeepCollectionEquality().equals(other.member3, member3));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(student),const DeepCollectionEquality().hash(president),const DeepCollectionEquality().hash(secretary),const DeepCollectionEquality().hash(member1),const DeepCollectionEquality().hash(member2),const DeepCollectionEquality().hash(member3));

@override
String toString() {
  return 'CouncilViewModel(student: $student, president: $president, secretary: $secretary, member1: $member1, member2: $member2, member3: $member3)';
}


}

/// @nodoc
abstract mixin class $CouncilViewModelCopyWith<$Res>  {
  factory $CouncilViewModelCopyWith(CouncilViewModel value, $Res Function(CouncilViewModel) _then) = _$CouncilViewModelCopyWithImpl;
@useResult
$Res call({
 PhdStudent student, TeacherData president, TeacherData secretary, TeacherData member1, TeacherData member2, TeacherData member3
});




}
/// @nodoc
class _$CouncilViewModelCopyWithImpl<$Res>
    implements $CouncilViewModelCopyWith<$Res> {
  _$CouncilViewModelCopyWithImpl(this._self, this._then);

  final CouncilViewModel _self;
  final $Res Function(CouncilViewModel) _then;

/// Create a copy of CouncilViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? student = freezed,Object? president = freezed,Object? secretary = freezed,Object? member1 = freezed,Object? member2 = freezed,Object? member3 = freezed,}) {
  return _then(_self.copyWith(
student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as PhdStudent,president: freezed == president ? _self.president : president // ignore: cast_nullable_to_non_nullable
as TeacherData,secretary: freezed == secretary ? _self.secretary : secretary // ignore: cast_nullable_to_non_nullable
as TeacherData,member1: freezed == member1 ? _self.member1 : member1 // ignore: cast_nullable_to_non_nullable
as TeacherData,member2: freezed == member2 ? _self.member2 : member2 // ignore: cast_nullable_to_non_nullable
as TeacherData,member3: freezed == member3 ? _self.member3 : member3 // ignore: cast_nullable_to_non_nullable
as TeacherData,
  ));
}

}


/// Adds pattern-matching-related methods to [CouncilViewModel].
extension CouncilViewModelPatterns on CouncilViewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CouncilViewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CouncilViewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CouncilViewModel value)  $default,){
final _that = this;
switch (_that) {
case _CouncilViewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CouncilViewModel value)?  $default,){
final _that = this;
switch (_that) {
case _CouncilViewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PhdStudent student,  TeacherData president,  TeacherData secretary,  TeacherData member1,  TeacherData member2,  TeacherData member3)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CouncilViewModel() when $default != null:
return $default(_that.student,_that.president,_that.secretary,_that.member1,_that.member2,_that.member3);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PhdStudent student,  TeacherData president,  TeacherData secretary,  TeacherData member1,  TeacherData member2,  TeacherData member3)  $default,) {final _that = this;
switch (_that) {
case _CouncilViewModel():
return $default(_that.student,_that.president,_that.secretary,_that.member1,_that.member2,_that.member3);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PhdStudent student,  TeacherData president,  TeacherData secretary,  TeacherData member1,  TeacherData member2,  TeacherData member3)?  $default,) {final _that = this;
switch (_that) {
case _CouncilViewModel() when $default != null:
return $default(_that.student,_that.president,_that.secretary,_that.member1,_that.member2,_that.member3);case _:
  return null;

}
}

}

/// @nodoc


class _CouncilViewModel implements CouncilViewModel {
  const _CouncilViewModel({required this.student, required this.president, required this.secretary, required this.member1, required this.member2, required this.member3});
  

@override final  PhdStudent student;
@override final  TeacherData president;
@override final  TeacherData secretary;
@override final  TeacherData member1;
@override final  TeacherData member2;
@override final  TeacherData member3;

/// Create a copy of CouncilViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CouncilViewModelCopyWith<_CouncilViewModel> get copyWith => __$CouncilViewModelCopyWithImpl<_CouncilViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CouncilViewModel&&const DeepCollectionEquality().equals(other.student, student)&&const DeepCollectionEquality().equals(other.president, president)&&const DeepCollectionEquality().equals(other.secretary, secretary)&&const DeepCollectionEquality().equals(other.member1, member1)&&const DeepCollectionEquality().equals(other.member2, member2)&&const DeepCollectionEquality().equals(other.member3, member3));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(student),const DeepCollectionEquality().hash(president),const DeepCollectionEquality().hash(secretary),const DeepCollectionEquality().hash(member1),const DeepCollectionEquality().hash(member2),const DeepCollectionEquality().hash(member3));

@override
String toString() {
  return 'CouncilViewModel(student: $student, president: $president, secretary: $secretary, member1: $member1, member2: $member2, member3: $member3)';
}


}

/// @nodoc
abstract mixin class _$CouncilViewModelCopyWith<$Res> implements $CouncilViewModelCopyWith<$Res> {
  factory _$CouncilViewModelCopyWith(_CouncilViewModel value, $Res Function(_CouncilViewModel) _then) = __$CouncilViewModelCopyWithImpl;
@override @useResult
$Res call({
 PhdStudent student, TeacherData president, TeacherData secretary, TeacherData member1, TeacherData member2, TeacherData member3
});




}
/// @nodoc
class __$CouncilViewModelCopyWithImpl<$Res>
    implements _$CouncilViewModelCopyWith<$Res> {
  __$CouncilViewModelCopyWithImpl(this._self, this._then);

  final _CouncilViewModel _self;
  final $Res Function(_CouncilViewModel) _then;

/// Create a copy of CouncilViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? student = freezed,Object? president = freezed,Object? secretary = freezed,Object? member1 = freezed,Object? member2 = freezed,Object? member3 = freezed,}) {
  return _then(_CouncilViewModel(
student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as PhdStudent,president: freezed == president ? _self.president : president // ignore: cast_nullable_to_non_nullable
as TeacherData,secretary: freezed == secretary ? _self.secretary : secretary // ignore: cast_nullable_to_non_nullable
as TeacherData,member1: freezed == member1 ? _self.member1 : member1 // ignore: cast_nullable_to_non_nullable
as TeacherData,member2: freezed == member2 ? _self.member2 : member2 // ignore: cast_nullable_to_non_nullable
as TeacherData,member3: freezed == member3 ? _self.member3 : member3 // ignore: cast_nullable_to_non_nullable
as TeacherData,
  ));
}


}

/// @nodoc
mixin _$CouncilPaymentViewModel {

 String get reason; List<CouncilViewModel> get councils; Map<CouncilRole, double> get payPerRole;
/// Create a copy of CouncilPaymentViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouncilPaymentViewModelCopyWith<CouncilPaymentViewModel> get copyWith => _$CouncilPaymentViewModelCopyWithImpl<CouncilPaymentViewModel>(this as CouncilPaymentViewModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouncilPaymentViewModel&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.councils, councils)&&const DeepCollectionEquality().equals(other.payPerRole, payPerRole));
}


@override
int get hashCode => Object.hash(runtimeType,reason,const DeepCollectionEquality().hash(councils),const DeepCollectionEquality().hash(payPerRole));

@override
String toString() {
  return 'CouncilPaymentViewModel(reason: $reason, councils: $councils, payPerRole: $payPerRole)';
}


}

/// @nodoc
abstract mixin class $CouncilPaymentViewModelCopyWith<$Res>  {
  factory $CouncilPaymentViewModelCopyWith(CouncilPaymentViewModel value, $Res Function(CouncilPaymentViewModel) _then) = _$CouncilPaymentViewModelCopyWithImpl;
@useResult
$Res call({
 String reason, List<CouncilViewModel> councils, Map<CouncilRole, double> payPerRole
});




}
/// @nodoc
class _$CouncilPaymentViewModelCopyWithImpl<$Res>
    implements $CouncilPaymentViewModelCopyWith<$Res> {
  _$CouncilPaymentViewModelCopyWithImpl(this._self, this._then);

  final CouncilPaymentViewModel _self;
  final $Res Function(CouncilPaymentViewModel) _then;

/// Create a copy of CouncilPaymentViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? councils = null,Object? payPerRole = null,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,councils: null == councils ? _self.councils : councils // ignore: cast_nullable_to_non_nullable
as List<CouncilViewModel>,payPerRole: null == payPerRole ? _self.payPerRole : payPerRole // ignore: cast_nullable_to_non_nullable
as Map<CouncilRole, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [CouncilPaymentViewModel].
extension CouncilPaymentViewModelPatterns on CouncilPaymentViewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CouncilPaymentViewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CouncilPaymentViewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CouncilPaymentViewModel value)  $default,){
final _that = this;
switch (_that) {
case _CouncilPaymentViewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CouncilPaymentViewModel value)?  $default,){
final _that = this;
switch (_that) {
case _CouncilPaymentViewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason,  List<CouncilViewModel> councils,  Map<CouncilRole, double> payPerRole)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CouncilPaymentViewModel() when $default != null:
return $default(_that.reason,_that.councils,_that.payPerRole);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason,  List<CouncilViewModel> councils,  Map<CouncilRole, double> payPerRole)  $default,) {final _that = this;
switch (_that) {
case _CouncilPaymentViewModel():
return $default(_that.reason,_that.councils,_that.payPerRole);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason,  List<CouncilViewModel> councils,  Map<CouncilRole, double> payPerRole)?  $default,) {final _that = this;
switch (_that) {
case _CouncilPaymentViewModel() when $default != null:
return $default(_that.reason,_that.councils,_that.payPerRole);case _:
  return null;

}
}

}

/// @nodoc


class _CouncilPaymentViewModel extends CouncilPaymentViewModel {
  const _CouncilPaymentViewModel({required this.reason, required final  List<CouncilViewModel> councils, required final  Map<CouncilRole, double> payPerRole}): _councils = councils,_payPerRole = payPerRole,super._();
  

@override final  String reason;
 final  List<CouncilViewModel> _councils;
@override List<CouncilViewModel> get councils {
  if (_councils is EqualUnmodifiableListView) return _councils;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_councils);
}

 final  Map<CouncilRole, double> _payPerRole;
@override Map<CouncilRole, double> get payPerRole {
  if (_payPerRole is EqualUnmodifiableMapView) return _payPerRole;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payPerRole);
}


/// Create a copy of CouncilPaymentViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CouncilPaymentViewModelCopyWith<_CouncilPaymentViewModel> get copyWith => __$CouncilPaymentViewModelCopyWithImpl<_CouncilPaymentViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CouncilPaymentViewModel&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._councils, _councils)&&const DeepCollectionEquality().equals(other._payPerRole, _payPerRole));
}


@override
int get hashCode => Object.hash(runtimeType,reason,const DeepCollectionEquality().hash(_councils),const DeepCollectionEquality().hash(_payPerRole));

@override
String toString() {
  return 'CouncilPaymentViewModel(reason: $reason, councils: $councils, payPerRole: $payPerRole)';
}


}

/// @nodoc
abstract mixin class _$CouncilPaymentViewModelCopyWith<$Res> implements $CouncilPaymentViewModelCopyWith<$Res> {
  factory _$CouncilPaymentViewModelCopyWith(_CouncilPaymentViewModel value, $Res Function(_CouncilPaymentViewModel) _then) = __$CouncilPaymentViewModelCopyWithImpl;
@override @useResult
$Res call({
 String reason, List<CouncilViewModel> councils, Map<CouncilRole, double> payPerRole
});




}
/// @nodoc
class __$CouncilPaymentViewModelCopyWithImpl<$Res>
    implements _$CouncilPaymentViewModelCopyWith<$Res> {
  __$CouncilPaymentViewModelCopyWithImpl(this._self, this._then);

  final _CouncilPaymentViewModel _self;
  final $Res Function(_CouncilPaymentViewModel) _then;

/// Create a copy of CouncilPaymentViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? councils = null,Object? payPerRole = null,}) {
  return _then(_CouncilPaymentViewModel(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,councils: null == councils ? _self._councils : councils // ignore: cast_nullable_to_non_nullable
as List<CouncilViewModel>,payPerRole: null == payPerRole ? _self._payPerRole : payPerRole // ignore: cast_nullable_to_non_nullable
as Map<CouncilRole, double>,
  ));
}


}

// dart format on
