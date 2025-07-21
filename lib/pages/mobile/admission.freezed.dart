// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageAdmissionDetailArgs _$PageAdmissionDetailArgsFromJson(
    Map<String, dynamic> json) {
  return _PageAdmissionDetailArgs.fromJson(json);
}

/// @nodoc
mixin _$PageAdmissionDetailArgs {
  HocVien get admission => throw _privateConstructorUsedError;

  /// Serializes this PageAdmissionDetailArgs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageAdmissionDetailArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageAdmissionDetailArgsCopyWith<PageAdmissionDetailArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageAdmissionDetailArgsCopyWith<$Res> {
  factory $PageAdmissionDetailArgsCopyWith(PageAdmissionDetailArgs value,
          $Res Function(PageAdmissionDetailArgs) then) =
      _$PageAdmissionDetailArgsCopyWithImpl<$Res, PageAdmissionDetailArgs>;
  @useResult
  $Res call({HocVien admission});

  $HocVienCopyWith<$Res> get admission;
}

/// @nodoc
class _$PageAdmissionDetailArgsCopyWithImpl<$Res,
        $Val extends PageAdmissionDetailArgs>
    implements $PageAdmissionDetailArgsCopyWith<$Res> {
  _$PageAdmissionDetailArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageAdmissionDetailArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admission = null,
  }) {
    return _then(_value.copyWith(
      admission: null == admission
          ? _value.admission
          : admission // ignore: cast_nullable_to_non_nullable
              as HocVien,
    ) as $Val);
  }

  /// Create a copy of PageAdmissionDetailArgs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HocVienCopyWith<$Res> get admission {
    return $HocVienCopyWith<$Res>(_value.admission, (value) {
      return _then(_value.copyWith(admission: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PageAdmissionDetailArgsImplCopyWith<$Res>
    implements $PageAdmissionDetailArgsCopyWith<$Res> {
  factory _$$PageAdmissionDetailArgsImplCopyWith(
          _$PageAdmissionDetailArgsImpl value,
          $Res Function(_$PageAdmissionDetailArgsImpl) then) =
      __$$PageAdmissionDetailArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HocVien admission});

  @override
  $HocVienCopyWith<$Res> get admission;
}

/// @nodoc
class __$$PageAdmissionDetailArgsImplCopyWithImpl<$Res>
    extends _$PageAdmissionDetailArgsCopyWithImpl<$Res,
        _$PageAdmissionDetailArgsImpl>
    implements _$$PageAdmissionDetailArgsImplCopyWith<$Res> {
  __$$PageAdmissionDetailArgsImplCopyWithImpl(
      _$PageAdmissionDetailArgsImpl _value,
      $Res Function(_$PageAdmissionDetailArgsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageAdmissionDetailArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admission = null,
  }) {
    return _then(_$PageAdmissionDetailArgsImpl(
      admission: null == admission
          ? _value.admission
          : admission // ignore: cast_nullable_to_non_nullable
              as HocVien,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageAdmissionDetailArgsImpl extends _PageAdmissionDetailArgs {
  _$PageAdmissionDetailArgsImpl({required this.admission}) : super._();

  factory _$PageAdmissionDetailArgsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageAdmissionDetailArgsImplFromJson(json);

  @override
  final HocVien admission;

  @override
  String toString() {
    return 'PageAdmissionDetailArgs(admission: $admission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageAdmissionDetailArgsImpl &&
            (identical(other.admission, admission) ||
                other.admission == admission));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, admission);

  /// Create a copy of PageAdmissionDetailArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageAdmissionDetailArgsImplCopyWith<_$PageAdmissionDetailArgsImpl>
      get copyWith => __$$PageAdmissionDetailArgsImplCopyWithImpl<
          _$PageAdmissionDetailArgsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageAdmissionDetailArgsImplToJson(
      this,
    );
  }
}

abstract class _PageAdmissionDetailArgs extends PageAdmissionDetailArgs {
  factory _PageAdmissionDetailArgs({required final HocVien admission}) =
      _$PageAdmissionDetailArgsImpl;
  _PageAdmissionDetailArgs._() : super._();

  factory _PageAdmissionDetailArgs.fromJson(Map<String, dynamic> json) =
      _$PageAdmissionDetailArgsImpl.fromJson;

  @override
  HocVien get admission;

  /// Create a copy of PageAdmissionDetailArgs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageAdmissionDetailArgsImplCopyWith<_$PageAdmissionDetailArgsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
