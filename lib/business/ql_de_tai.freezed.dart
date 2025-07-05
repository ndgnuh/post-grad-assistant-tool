// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ql_de_tai.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MasterThesisTopic _$MasterThesisTopicFromJson(Map<String, dynamic> json) {
  return _MasterThesisTopic.fromJson(json);
}

/// @nodoc
mixin _$MasterThesisTopic {
  String get advisor => throw _privateConstructorUsedError;
  String get nameVi => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String? get studentName => throw _privateConstructorUsedError;
  String? get studentCode => throw _privateConstructorUsedError;

  /// Serializes this MasterThesisTopic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MasterThesisTopic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasterThesisTopicCopyWith<MasterThesisTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterThesisTopicCopyWith<$Res> {
  factory $MasterThesisTopicCopyWith(
          MasterThesisTopic value, $Res Function(MasterThesisTopic) then) =
      _$MasterThesisTopicCopyWithImpl<$Res, MasterThesisTopic>;
  @useResult
  $Res call(
      {String advisor,
      String nameVi,
      String nameEn,
      String note,
      String? studentName,
      String? studentCode});
}

/// @nodoc
class _$MasterThesisTopicCopyWithImpl<$Res, $Val extends MasterThesisTopic>
    implements $MasterThesisTopicCopyWith<$Res> {
  _$MasterThesisTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasterThesisTopic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advisor = null,
    Object? nameVi = null,
    Object? nameEn = null,
    Object? note = null,
    Object? studentName = freezed,
    Object? studentCode = freezed,
  }) {
    return _then(_value.copyWith(
      advisor: null == advisor
          ? _value.advisor
          : advisor // ignore: cast_nullable_to_non_nullable
              as String,
      nameVi: null == nameVi
          ? _value.nameVi
          : nameVi // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCode: freezed == studentCode
          ? _value.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterThesisTopicImplCopyWith<$Res>
    implements $MasterThesisTopicCopyWith<$Res> {
  factory _$$MasterThesisTopicImplCopyWith(_$MasterThesisTopicImpl value,
          $Res Function(_$MasterThesisTopicImpl) then) =
      __$$MasterThesisTopicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String advisor,
      String nameVi,
      String nameEn,
      String note,
      String? studentName,
      String? studentCode});
}

/// @nodoc
class __$$MasterThesisTopicImplCopyWithImpl<$Res>
    extends _$MasterThesisTopicCopyWithImpl<$Res, _$MasterThesisTopicImpl>
    implements _$$MasterThesisTopicImplCopyWith<$Res> {
  __$$MasterThesisTopicImplCopyWithImpl(_$MasterThesisTopicImpl _value,
      $Res Function(_$MasterThesisTopicImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasterThesisTopic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advisor = null,
    Object? nameVi = null,
    Object? nameEn = null,
    Object? note = null,
    Object? studentName = freezed,
    Object? studentCode = freezed,
  }) {
    return _then(_$MasterThesisTopicImpl(
      advisor: null == advisor
          ? _value.advisor
          : advisor // ignore: cast_nullable_to_non_nullable
              as String,
      nameVi: null == nameVi
          ? _value.nameVi
          : nameVi // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCode: freezed == studentCode
          ? _value.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MasterThesisTopicImpl extends _MasterThesisTopic {
  const _$MasterThesisTopicImpl(
      {required this.advisor,
      required this.nameVi,
      required this.nameEn,
      required this.note,
      this.studentName,
      this.studentCode})
      : super._();

  factory _$MasterThesisTopicImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasterThesisTopicImplFromJson(json);

  @override
  final String advisor;
  @override
  final String nameVi;
  @override
  final String nameEn;
  @override
  final String note;
  @override
  final String? studentName;
  @override
  final String? studentCode;

  @override
  String toString() {
    return 'MasterThesisTopic(advisor: $advisor, nameVi: $nameVi, nameEn: $nameEn, note: $note, studentName: $studentName, studentCode: $studentCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterThesisTopicImpl &&
            (identical(other.advisor, advisor) || other.advisor == advisor) &&
            (identical(other.nameVi, nameVi) || other.nameVi == nameVi) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.studentCode, studentCode) ||
                other.studentCode == studentCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, advisor, nameVi, nameEn, note, studentName, studentCode);

  /// Create a copy of MasterThesisTopic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterThesisTopicImplCopyWith<_$MasterThesisTopicImpl> get copyWith =>
      __$$MasterThesisTopicImplCopyWithImpl<_$MasterThesisTopicImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MasterThesisTopicImplToJson(
      this,
    );
  }
}

abstract class _MasterThesisTopic extends MasterThesisTopic {
  const factory _MasterThesisTopic(
      {required final String advisor,
      required final String nameVi,
      required final String nameEn,
      required final String note,
      final String? studentName,
      final String? studentCode}) = _$MasterThesisTopicImpl;
  const _MasterThesisTopic._() : super._();

  factory _MasterThesisTopic.fromJson(Map<String, dynamic> json) =
      _$MasterThesisTopicImpl.fromJson;

  @override
  String get advisor;
  @override
  String get nameVi;
  @override
  String get nameEn;
  @override
  String get note;
  @override
  String? get studentName;
  @override
  String? get studentCode;

  /// Create a copy of MasterThesisTopic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasterThesisTopicImplCopyWith<_$MasterThesisTopicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
