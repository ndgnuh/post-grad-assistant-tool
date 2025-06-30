// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phan_cong_hoi_dong_lvths.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterState {
  bool get showGraduated => throw _privateConstructorUsedError;
  bool? get showSelected => throw _privateConstructorUsedError;

  /// Create a copy of _FilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$FilterStateCopyWith<_FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FilterStateCopyWith<$Res> {
  factory _$FilterStateCopyWith(
          _FilterState value, $Res Function(_FilterState) then) =
      __$FilterStateCopyWithImpl<$Res, _FilterState>;
  @useResult
  $Res call({bool showGraduated, bool? showSelected});
}

/// @nodoc
class __$FilterStateCopyWithImpl<$Res, $Val extends _FilterState>
    implements _$FilterStateCopyWith<$Res> {
  __$FilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of _FilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showGraduated = null,
    Object? showSelected = freezed,
  }) {
    return _then(_value.copyWith(
      showGraduated: null == showGraduated
          ? _value.showGraduated
          : showGraduated // ignore: cast_nullable_to_non_nullable
              as bool,
      showSelected: freezed == showSelected
          ? _value.showSelected
          : showSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterStateImplCopyWith<$Res>
    implements _$FilterStateCopyWith<$Res> {
  factory _$$_FilterStateImplCopyWith(
          _$_FilterStateImpl value, $Res Function(_$_FilterStateImpl) then) =
      __$$_FilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showGraduated, bool? showSelected});
}

/// @nodoc
class __$$_FilterStateImplCopyWithImpl<$Res>
    extends __$FilterStateCopyWithImpl<$Res, _$_FilterStateImpl>
    implements _$$_FilterStateImplCopyWith<$Res> {
  __$$_FilterStateImplCopyWithImpl(
      _$_FilterStateImpl _value, $Res Function(_$_FilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of _FilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showGraduated = null,
    Object? showSelected = freezed,
  }) {
    return _then(_$_FilterStateImpl(
      showGraduated: null == showGraduated
          ? _value.showGraduated
          : showGraduated // ignore: cast_nullable_to_non_nullable
              as bool,
      showSelected: freezed == showSelected
          ? _value.showSelected
          : showSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FilterStateImpl implements __FilterState {
  _$_FilterStateImpl({this.showGraduated = false, this.showSelected});

  @override
  @JsonKey()
  final bool showGraduated;
  @override
  final bool? showSelected;

  @override
  String toString() {
    return '_FilterState(showGraduated: $showGraduated, showSelected: $showSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterStateImpl &&
            (identical(other.showGraduated, showGraduated) ||
                other.showGraduated == showGraduated) &&
            (identical(other.showSelected, showSelected) ||
                other.showSelected == showSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showGraduated, showSelected);

  /// Create a copy of _FilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterStateImplCopyWith<_$_FilterStateImpl> get copyWith =>
      __$$_FilterStateImplCopyWithImpl<_$_FilterStateImpl>(this, _$identity);
}

abstract class __FilterState implements _FilterState {
  factory __FilterState({final bool showGraduated, final bool? showSelected}) =
      _$_FilterStateImpl;

  @override
  bool get showGraduated;
  @override
  bool? get showSelected;

  /// Create a copy of _FilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$_FilterStateImplCopyWith<_$_FilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
