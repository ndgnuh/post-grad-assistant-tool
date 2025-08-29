// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phan_cong_hoi_dong_lvths.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterState {

 bool get showGraduated; bool? get showSelected;
/// Create a copy of _FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterStateCopyWith<_FilterState> get copyWith => __$FilterStateCopyWithImpl<_FilterState>(this as _FilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterState&&(identical(other.showGraduated, showGraduated) || other.showGraduated == showGraduated)&&(identical(other.showSelected, showSelected) || other.showSelected == showSelected));
}


@override
int get hashCode => Object.hash(runtimeType,showGraduated,showSelected);

@override
String toString() {
  return '_FilterState(showGraduated: $showGraduated, showSelected: $showSelected)';
}


}

/// @nodoc
abstract mixin class _$FilterStateCopyWith<$Res>  {
  factory _$FilterStateCopyWith(_FilterState value, $Res Function(_FilterState) _then) = __$FilterStateCopyWithImpl;
@useResult
$Res call({
 bool showGraduated, bool? showSelected
});




}
/// @nodoc
class __$FilterStateCopyWithImpl<$Res>
    implements _$FilterStateCopyWith<$Res> {
  __$FilterStateCopyWithImpl(this._self, this._then);

  final _FilterState _self;
  final $Res Function(_FilterState) _then;

/// Create a copy of _FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showGraduated = null,Object? showSelected = freezed,}) {
  return _then(_self.copyWith(
showGraduated: null == showGraduated ? _self.showGraduated : showGraduated // ignore: cast_nullable_to_non_nullable
as bool,showSelected: freezed == showSelected ? _self.showSelected : showSelected // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [_FilterState].
extension _FilterStatePatterns on _FilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( __FilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case __FilterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( __FilterState value)  $default,){
final _that = this;
switch (_that) {
case __FilterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( __FilterState value)?  $default,){
final _that = this;
switch (_that) {
case __FilterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showGraduated,  bool? showSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case __FilterState() when $default != null:
return $default(_that.showGraduated,_that.showSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showGraduated,  bool? showSelected)  $default,) {final _that = this;
switch (_that) {
case __FilterState():
return $default(_that.showGraduated,_that.showSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showGraduated,  bool? showSelected)?  $default,) {final _that = this;
switch (_that) {
case __FilterState() when $default != null:
return $default(_that.showGraduated,_that.showSelected);case _:
  return null;

}
}

}

/// @nodoc


class __FilterState implements _FilterState {
   __FilterState({this.showGraduated = false, this.showSelected});
  

@override@JsonKey() final  bool showGraduated;
@override final  bool? showSelected;

/// Create a copy of _FilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$_FilterStateCopyWith<__FilterState> get copyWith => __$_FilterStateCopyWithImpl<__FilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is __FilterState&&(identical(other.showGraduated, showGraduated) || other.showGraduated == showGraduated)&&(identical(other.showSelected, showSelected) || other.showSelected == showSelected));
}


@override
int get hashCode => Object.hash(runtimeType,showGraduated,showSelected);

@override
String toString() {
  return '_FilterState(showGraduated: $showGraduated, showSelected: $showSelected)';
}


}

/// @nodoc
abstract mixin class _$_FilterStateCopyWith<$Res> implements _$FilterStateCopyWith<$Res> {
  factory _$_FilterStateCopyWith(__FilterState value, $Res Function(__FilterState) _then) = __$_FilterStateCopyWithImpl;
@override @useResult
$Res call({
 bool showGraduated, bool? showSelected
});




}
/// @nodoc
class __$_FilterStateCopyWithImpl<$Res>
    implements _$_FilterStateCopyWith<$Res> {
  __$_FilterStateCopyWithImpl(this._self, this._then);

  final __FilterState _self;
  final $Res Function(__FilterState) _then;

/// Create a copy of _FilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showGraduated = null,Object? showSelected = freezed,}) {
  return _then(__FilterState(
showGraduated: null == showGraduated ? _self.showGraduated : showGraduated // ignore: cast_nullable_to_non_nullable
as bool,showSelected: freezed == showSelected ? _self.showSelected : showSelected // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
