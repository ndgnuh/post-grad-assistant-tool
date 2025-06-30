// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_objects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GiangVien _$GiangVienFromJson(Map<String, dynamic> json) {
  return _GiangVien.fromJson(json);
}

/// @nodoc
mixin _$GiangVien {
  int get id => throw _privateConstructorUsedError;
  String get hoTen => throw _privateConstructorUsedError;
  String? get maCanBo => throw _privateConstructorUsedError;
  String? get donVi => throw _privateConstructorUsedError;
  String? get chuyenNganh => throw _privateConstructorUsedError;
  GioiTinh? get gioiTinh => throw _privateConstructorUsedError;
  HocHam? get hocHam => throw _privateConstructorUsedError;
  HocVi? get hocVi => throw _privateConstructorUsedError;
  int? get namNhanTs => throw _privateConstructorUsedError;
  String? get sdt => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get cccd => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get ngaySinh => throw _privateConstructorUsedError;
  String? get stk => throw _privateConstructorUsedError;
  String? get nganHang => throw _privateConstructorUsedError;
  String? get mst => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  int? get ncm => throw _privateConstructorUsedError;

  /// Serializes this GiangVien to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiangVien
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiangVienCopyWith<GiangVien> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiangVienCopyWith<$Res> {
  factory $GiangVienCopyWith(GiangVien value, $Res Function(GiangVien) then) =
      _$GiangVienCopyWithImpl<$Res, GiangVien>;
  @useResult
  $Res call(
      {int id,
      String hoTen,
      String? maCanBo,
      String? donVi,
      String? chuyenNganh,
      GioiTinh? gioiTinh,
      HocHam? hocHam,
      HocVi? hocVi,
      int? namNhanTs,
      String? sdt,
      String? email,
      String? cccd,
      @MaybeDateSerializer() DateTime? ngaySinh,
      String? stk,
      String? nganHang,
      String? mst,
      String? note,
      int? ncm});
}

/// @nodoc
class _$GiangVienCopyWithImpl<$Res, $Val extends GiangVien>
    implements $GiangVienCopyWith<$Res> {
  _$GiangVienCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiangVien
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hoTen = null,
    Object? maCanBo = freezed,
    Object? donVi = freezed,
    Object? chuyenNganh = freezed,
    Object? gioiTinh = freezed,
    Object? hocHam = freezed,
    Object? hocVi = freezed,
    Object? namNhanTs = freezed,
    Object? sdt = freezed,
    Object? email = freezed,
    Object? cccd = freezed,
    Object? ngaySinh = freezed,
    Object? stk = freezed,
    Object? nganHang = freezed,
    Object? mst = freezed,
    Object? note = freezed,
    Object? ncm = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hoTen: null == hoTen
          ? _value.hoTen
          : hoTen // ignore: cast_nullable_to_non_nullable
              as String,
      maCanBo: freezed == maCanBo
          ? _value.maCanBo
          : maCanBo // ignore: cast_nullable_to_non_nullable
              as String?,
      donVi: freezed == donVi
          ? _value.donVi
          : donVi // ignore: cast_nullable_to_non_nullable
              as String?,
      chuyenNganh: freezed == chuyenNganh
          ? _value.chuyenNganh
          : chuyenNganh // ignore: cast_nullable_to_non_nullable
              as String?,
      gioiTinh: freezed == gioiTinh
          ? _value.gioiTinh
          : gioiTinh // ignore: cast_nullable_to_non_nullable
              as GioiTinh?,
      hocHam: freezed == hocHam
          ? _value.hocHam
          : hocHam // ignore: cast_nullable_to_non_nullable
              as HocHam?,
      hocVi: freezed == hocVi
          ? _value.hocVi
          : hocVi // ignore: cast_nullable_to_non_nullable
              as HocVi?,
      namNhanTs: freezed == namNhanTs
          ? _value.namNhanTs
          : namNhanTs // ignore: cast_nullable_to_non_nullable
              as int?,
      sdt: freezed == sdt
          ? _value.sdt
          : sdt // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      cccd: freezed == cccd
          ? _value.cccd
          : cccd // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaySinh: freezed == ngaySinh
          ? _value.ngaySinh
          : ngaySinh // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stk: freezed == stk
          ? _value.stk
          : stk // ignore: cast_nullable_to_non_nullable
              as String?,
      nganHang: freezed == nganHang
          ? _value.nganHang
          : nganHang // ignore: cast_nullable_to_non_nullable
              as String?,
      mst: freezed == mst
          ? _value.mst
          : mst // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      ncm: freezed == ncm
          ? _value.ncm
          : ncm // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiangVienImplCopyWith<$Res>
    implements $GiangVienCopyWith<$Res> {
  factory _$$GiangVienImplCopyWith(
          _$GiangVienImpl value, $Res Function(_$GiangVienImpl) then) =
      __$$GiangVienImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String hoTen,
      String? maCanBo,
      String? donVi,
      String? chuyenNganh,
      GioiTinh? gioiTinh,
      HocHam? hocHam,
      HocVi? hocVi,
      int? namNhanTs,
      String? sdt,
      String? email,
      String? cccd,
      @MaybeDateSerializer() DateTime? ngaySinh,
      String? stk,
      String? nganHang,
      String? mst,
      String? note,
      int? ncm});
}

/// @nodoc
class __$$GiangVienImplCopyWithImpl<$Res>
    extends _$GiangVienCopyWithImpl<$Res, _$GiangVienImpl>
    implements _$$GiangVienImplCopyWith<$Res> {
  __$$GiangVienImplCopyWithImpl(
      _$GiangVienImpl _value, $Res Function(_$GiangVienImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiangVien
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hoTen = null,
    Object? maCanBo = freezed,
    Object? donVi = freezed,
    Object? chuyenNganh = freezed,
    Object? gioiTinh = freezed,
    Object? hocHam = freezed,
    Object? hocVi = freezed,
    Object? namNhanTs = freezed,
    Object? sdt = freezed,
    Object? email = freezed,
    Object? cccd = freezed,
    Object? ngaySinh = freezed,
    Object? stk = freezed,
    Object? nganHang = freezed,
    Object? mst = freezed,
    Object? note = freezed,
    Object? ncm = freezed,
  }) {
    return _then(_$GiangVienImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hoTen: null == hoTen
          ? _value.hoTen
          : hoTen // ignore: cast_nullable_to_non_nullable
              as String,
      maCanBo: freezed == maCanBo
          ? _value.maCanBo
          : maCanBo // ignore: cast_nullable_to_non_nullable
              as String?,
      donVi: freezed == donVi
          ? _value.donVi
          : donVi // ignore: cast_nullable_to_non_nullable
              as String?,
      chuyenNganh: freezed == chuyenNganh
          ? _value.chuyenNganh
          : chuyenNganh // ignore: cast_nullable_to_non_nullable
              as String?,
      gioiTinh: freezed == gioiTinh
          ? _value.gioiTinh
          : gioiTinh // ignore: cast_nullable_to_non_nullable
              as GioiTinh?,
      hocHam: freezed == hocHam
          ? _value.hocHam
          : hocHam // ignore: cast_nullable_to_non_nullable
              as HocHam?,
      hocVi: freezed == hocVi
          ? _value.hocVi
          : hocVi // ignore: cast_nullable_to_non_nullable
              as HocVi?,
      namNhanTs: freezed == namNhanTs
          ? _value.namNhanTs
          : namNhanTs // ignore: cast_nullable_to_non_nullable
              as int?,
      sdt: freezed == sdt
          ? _value.sdt
          : sdt // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      cccd: freezed == cccd
          ? _value.cccd
          : cccd // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaySinh: freezed == ngaySinh
          ? _value.ngaySinh
          : ngaySinh // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stk: freezed == stk
          ? _value.stk
          : stk // ignore: cast_nullable_to_non_nullable
              as String?,
      nganHang: freezed == nganHang
          ? _value.nganHang
          : nganHang // ignore: cast_nullable_to_non_nullable
              as String?,
      mst: freezed == mst
          ? _value.mst
          : mst // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      ncm: freezed == ncm
          ? _value.ncm
          : ncm // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiangVienImpl extends _GiangVien {
  _$GiangVienImpl(
      {required this.id,
      required this.hoTen,
      this.maCanBo,
      this.donVi,
      this.chuyenNganh,
      this.gioiTinh,
      this.hocHam,
      this.hocVi,
      this.namNhanTs,
      this.sdt,
      this.email,
      this.cccd,
      @MaybeDateSerializer() this.ngaySinh,
      this.stk,
      this.nganHang,
      this.mst,
      this.note,
      this.ncm})
      : super._();

  factory _$GiangVienImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiangVienImplFromJson(json);

  @override
  final int id;
  @override
  final String hoTen;
  @override
  final String? maCanBo;
  @override
  final String? donVi;
  @override
  final String? chuyenNganh;
  @override
  final GioiTinh? gioiTinh;
  @override
  final HocHam? hocHam;
  @override
  final HocVi? hocVi;
  @override
  final int? namNhanTs;
  @override
  final String? sdt;
  @override
  final String? email;
  @override
  final String? cccd;
  @override
  @MaybeDateSerializer()
  final DateTime? ngaySinh;
  @override
  final String? stk;
  @override
  final String? nganHang;
  @override
  final String? mst;
  @override
  final String? note;
  @override
  final int? ncm;

  @override
  String toString() {
    return 'GiangVien(id: $id, hoTen: $hoTen, maCanBo: $maCanBo, donVi: $donVi, chuyenNganh: $chuyenNganh, gioiTinh: $gioiTinh, hocHam: $hocHam, hocVi: $hocVi, namNhanTs: $namNhanTs, sdt: $sdt, email: $email, cccd: $cccd, ngaySinh: $ngaySinh, stk: $stk, nganHang: $nganHang, mst: $mst, note: $note, ncm: $ncm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiangVienImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hoTen, hoTen) || other.hoTen == hoTen) &&
            (identical(other.maCanBo, maCanBo) || other.maCanBo == maCanBo) &&
            (identical(other.donVi, donVi) || other.donVi == donVi) &&
            (identical(other.chuyenNganh, chuyenNganh) ||
                other.chuyenNganh == chuyenNganh) &&
            (identical(other.gioiTinh, gioiTinh) ||
                other.gioiTinh == gioiTinh) &&
            (identical(other.hocHam, hocHam) || other.hocHam == hocHam) &&
            (identical(other.hocVi, hocVi) || other.hocVi == hocVi) &&
            (identical(other.namNhanTs, namNhanTs) ||
                other.namNhanTs == namNhanTs) &&
            (identical(other.sdt, sdt) || other.sdt == sdt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.cccd, cccd) || other.cccd == cccd) &&
            (identical(other.ngaySinh, ngaySinh) ||
                other.ngaySinh == ngaySinh) &&
            (identical(other.stk, stk) || other.stk == stk) &&
            (identical(other.nganHang, nganHang) ||
                other.nganHang == nganHang) &&
            (identical(other.mst, mst) || other.mst == mst) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.ncm, ncm) || other.ncm == ncm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hoTen,
      maCanBo,
      donVi,
      chuyenNganh,
      gioiTinh,
      hocHam,
      hocVi,
      namNhanTs,
      sdt,
      email,
      cccd,
      ngaySinh,
      stk,
      nganHang,
      mst,
      note,
      ncm);

  /// Create a copy of GiangVien
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiangVienImplCopyWith<_$GiangVienImpl> get copyWith =>
      __$$GiangVienImplCopyWithImpl<_$GiangVienImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiangVienImplToJson(
      this,
    );
  }
}

abstract class _GiangVien extends GiangVien {
  factory _GiangVien(
      {required final int id,
      required final String hoTen,
      final String? maCanBo,
      final String? donVi,
      final String? chuyenNganh,
      final GioiTinh? gioiTinh,
      final HocHam? hocHam,
      final HocVi? hocVi,
      final int? namNhanTs,
      final String? sdt,
      final String? email,
      final String? cccd,
      @MaybeDateSerializer() final DateTime? ngaySinh,
      final String? stk,
      final String? nganHang,
      final String? mst,
      final String? note,
      final int? ncm}) = _$GiangVienImpl;
  _GiangVien._() : super._();

  factory _GiangVien.fromJson(Map<String, dynamic> json) =
      _$GiangVienImpl.fromJson;

  @override
  int get id;
  @override
  String get hoTen;
  @override
  String? get maCanBo;
  @override
  String? get donVi;
  @override
  String? get chuyenNganh;
  @override
  GioiTinh? get gioiTinh;
  @override
  HocHam? get hocHam;
  @override
  HocVi? get hocVi;
  @override
  int? get namNhanTs;
  @override
  String? get sdt;
  @override
  String? get email;
  @override
  String? get cccd;
  @override
  @MaybeDateSerializer()
  DateTime? get ngaySinh;
  @override
  String? get stk;
  @override
  String? get nganHang;
  @override
  String? get mst;
  @override
  String? get note;
  @override
  int? get ncm;

  /// Create a copy of GiangVien
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiangVienImplCopyWith<_$GiangVienImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DangKyHoc _$DangKyHocFromJson(Map<String, dynamic> json) {
  return _DangKyHoc.fromJson(json);
}

/// @nodoc
mixin _$DangKyHoc {
  int get idLopTinChi => throw _privateConstructorUsedError;
  int get idHocVien => throw _privateConstructorUsedError;
  double? get diemQuaTrinh => throw _privateConstructorUsedError;
  double? get diemCuoiKy => throw _privateConstructorUsedError;

  /// Serializes this DangKyHoc to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DangKyHoc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DangKyHocCopyWith<DangKyHoc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DangKyHocCopyWith<$Res> {
  factory $DangKyHocCopyWith(DangKyHoc value, $Res Function(DangKyHoc) then) =
      _$DangKyHocCopyWithImpl<$Res, DangKyHoc>;
  @useResult
  $Res call(
      {int idLopTinChi,
      int idHocVien,
      double? diemQuaTrinh,
      double? diemCuoiKy});
}

/// @nodoc
class _$DangKyHocCopyWithImpl<$Res, $Val extends DangKyHoc>
    implements $DangKyHocCopyWith<$Res> {
  _$DangKyHocCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DangKyHoc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLopTinChi = null,
    Object? idHocVien = null,
    Object? diemQuaTrinh = freezed,
    Object? diemCuoiKy = freezed,
  }) {
    return _then(_value.copyWith(
      idLopTinChi: null == idLopTinChi
          ? _value.idLopTinChi
          : idLopTinChi // ignore: cast_nullable_to_non_nullable
              as int,
      idHocVien: null == idHocVien
          ? _value.idHocVien
          : idHocVien // ignore: cast_nullable_to_non_nullable
              as int,
      diemQuaTrinh: freezed == diemQuaTrinh
          ? _value.diemQuaTrinh
          : diemQuaTrinh // ignore: cast_nullable_to_non_nullable
              as double?,
      diemCuoiKy: freezed == diemCuoiKy
          ? _value.diemCuoiKy
          : diemCuoiKy // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DangKyHocImplCopyWith<$Res>
    implements $DangKyHocCopyWith<$Res> {
  factory _$$DangKyHocImplCopyWith(
          _$DangKyHocImpl value, $Res Function(_$DangKyHocImpl) then) =
      __$$DangKyHocImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int idLopTinChi,
      int idHocVien,
      double? diemQuaTrinh,
      double? diemCuoiKy});
}

/// @nodoc
class __$$DangKyHocImplCopyWithImpl<$Res>
    extends _$DangKyHocCopyWithImpl<$Res, _$DangKyHocImpl>
    implements _$$DangKyHocImplCopyWith<$Res> {
  __$$DangKyHocImplCopyWithImpl(
      _$DangKyHocImpl _value, $Res Function(_$DangKyHocImpl) _then)
      : super(_value, _then);

  /// Create a copy of DangKyHoc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLopTinChi = null,
    Object? idHocVien = null,
    Object? diemQuaTrinh = freezed,
    Object? diemCuoiKy = freezed,
  }) {
    return _then(_$DangKyHocImpl(
      idLopTinChi: null == idLopTinChi
          ? _value.idLopTinChi
          : idLopTinChi // ignore: cast_nullable_to_non_nullable
              as int,
      idHocVien: null == idHocVien
          ? _value.idHocVien
          : idHocVien // ignore: cast_nullable_to_non_nullable
              as int,
      diemQuaTrinh: freezed == diemQuaTrinh
          ? _value.diemQuaTrinh
          : diemQuaTrinh // ignore: cast_nullable_to_non_nullable
              as double?,
      diemCuoiKy: freezed == diemCuoiKy
          ? _value.diemCuoiKy
          : diemCuoiKy // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DangKyHocImpl extends _DangKyHoc {
  _$DangKyHocImpl(
      {required this.idLopTinChi,
      required this.idHocVien,
      this.diemQuaTrinh,
      this.diemCuoiKy})
      : super._();

  factory _$DangKyHocImpl.fromJson(Map<String, dynamic> json) =>
      _$$DangKyHocImplFromJson(json);

  @override
  final int idLopTinChi;
  @override
  final int idHocVien;
  @override
  final double? diemQuaTrinh;
  @override
  final double? diemCuoiKy;

  @override
  String toString() {
    return 'DangKyHoc(idLopTinChi: $idLopTinChi, idHocVien: $idHocVien, diemQuaTrinh: $diemQuaTrinh, diemCuoiKy: $diemCuoiKy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DangKyHocImpl &&
            (identical(other.idLopTinChi, idLopTinChi) ||
                other.idLopTinChi == idLopTinChi) &&
            (identical(other.idHocVien, idHocVien) ||
                other.idHocVien == idHocVien) &&
            (identical(other.diemQuaTrinh, diemQuaTrinh) ||
                other.diemQuaTrinh == diemQuaTrinh) &&
            (identical(other.diemCuoiKy, diemCuoiKy) ||
                other.diemCuoiKy == diemCuoiKy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, idLopTinChi, idHocVien, diemQuaTrinh, diemCuoiKy);

  /// Create a copy of DangKyHoc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DangKyHocImplCopyWith<_$DangKyHocImpl> get copyWith =>
      __$$DangKyHocImplCopyWithImpl<_$DangKyHocImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DangKyHocImplToJson(
      this,
    );
  }
}

abstract class _DangKyHoc extends DangKyHoc {
  factory _DangKyHoc(
      {required final int idLopTinChi,
      required final int idHocVien,
      final double? diemQuaTrinh,
      final double? diemCuoiKy}) = _$DangKyHocImpl;
  _DangKyHoc._() : super._();

  factory _DangKyHoc.fromJson(Map<String, dynamic> json) =
      _$DangKyHocImpl.fromJson;

  @override
  int get idLopTinChi;
  @override
  int get idHocVien;
  @override
  double? get diemQuaTrinh;
  @override
  double? get diemCuoiKy;

  /// Create a copy of DangKyHoc
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DangKyHocImplCopyWith<_$DangKyHocImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HocKy _$HocKyFromJson(Map<String, dynamic> json) {
  return _HocKy.fromJson(json);
}

/// @nodoc
mixin _$HocKy {
  String get hocKy => throw _privateConstructorUsedError;
  @DateSerializer()
  DateTime get moDangKy => throw _privateConstructorUsedError;
  @DateSerializer()
  DateTime get dongDangKy => throw _privateConstructorUsedError;
  @DateSerializer()
  DateTime get batDauHoc => throw _privateConstructorUsedError;
  @DateSerializer()
  DateTime get ketThucHoc => throw _privateConstructorUsedError;
  @DateSerializer()
  DateTime get hanNhapDiem => throw _privateConstructorUsedError;

  /// Serializes this HocKy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HocKy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HocKyCopyWith<HocKy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HocKyCopyWith<$Res> {
  factory $HocKyCopyWith(HocKy value, $Res Function(HocKy) then) =
      _$HocKyCopyWithImpl<$Res, HocKy>;
  @useResult
  $Res call(
      {String hocKy,
      @DateSerializer() DateTime moDangKy,
      @DateSerializer() DateTime dongDangKy,
      @DateSerializer() DateTime batDauHoc,
      @DateSerializer() DateTime ketThucHoc,
      @DateSerializer() DateTime hanNhapDiem});
}

/// @nodoc
class _$HocKyCopyWithImpl<$Res, $Val extends HocKy>
    implements $HocKyCopyWith<$Res> {
  _$HocKyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HocKy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hocKy = null,
    Object? moDangKy = null,
    Object? dongDangKy = null,
    Object? batDauHoc = null,
    Object? ketThucHoc = null,
    Object? hanNhapDiem = null,
  }) {
    return _then(_value.copyWith(
      hocKy: null == hocKy
          ? _value.hocKy
          : hocKy // ignore: cast_nullable_to_non_nullable
              as String,
      moDangKy: null == moDangKy
          ? _value.moDangKy
          : moDangKy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dongDangKy: null == dongDangKy
          ? _value.dongDangKy
          : dongDangKy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batDauHoc: null == batDauHoc
          ? _value.batDauHoc
          : batDauHoc // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ketThucHoc: null == ketThucHoc
          ? _value.ketThucHoc
          : ketThucHoc // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hanNhapDiem: null == hanNhapDiem
          ? _value.hanNhapDiem
          : hanNhapDiem // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HocKyImplCopyWith<$Res> implements $HocKyCopyWith<$Res> {
  factory _$$HocKyImplCopyWith(
          _$HocKyImpl value, $Res Function(_$HocKyImpl) then) =
      __$$HocKyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hocKy,
      @DateSerializer() DateTime moDangKy,
      @DateSerializer() DateTime dongDangKy,
      @DateSerializer() DateTime batDauHoc,
      @DateSerializer() DateTime ketThucHoc,
      @DateSerializer() DateTime hanNhapDiem});
}

/// @nodoc
class __$$HocKyImplCopyWithImpl<$Res>
    extends _$HocKyCopyWithImpl<$Res, _$HocKyImpl>
    implements _$$HocKyImplCopyWith<$Res> {
  __$$HocKyImplCopyWithImpl(
      _$HocKyImpl _value, $Res Function(_$HocKyImpl) _then)
      : super(_value, _then);

  /// Create a copy of HocKy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hocKy = null,
    Object? moDangKy = null,
    Object? dongDangKy = null,
    Object? batDauHoc = null,
    Object? ketThucHoc = null,
    Object? hanNhapDiem = null,
  }) {
    return _then(_$HocKyImpl(
      hocKy: null == hocKy
          ? _value.hocKy
          : hocKy // ignore: cast_nullable_to_non_nullable
              as String,
      moDangKy: null == moDangKy
          ? _value.moDangKy
          : moDangKy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dongDangKy: null == dongDangKy
          ? _value.dongDangKy
          : dongDangKy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batDauHoc: null == batDauHoc
          ? _value.batDauHoc
          : batDauHoc // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ketThucHoc: null == ketThucHoc
          ? _value.ketThucHoc
          : ketThucHoc // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hanNhapDiem: null == hanNhapDiem
          ? _value.hanNhapDiem
          : hanNhapDiem // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HocKyImpl extends _HocKy {
  const _$HocKyImpl(
      {required this.hocKy,
      @DateSerializer() required this.moDangKy,
      @DateSerializer() required this.dongDangKy,
      @DateSerializer() required this.batDauHoc,
      @DateSerializer() required this.ketThucHoc,
      @DateSerializer() required this.hanNhapDiem})
      : super._();

  factory _$HocKyImpl.fromJson(Map<String, dynamic> json) =>
      _$$HocKyImplFromJson(json);

  @override
  final String hocKy;
  @override
  @DateSerializer()
  final DateTime moDangKy;
  @override
  @DateSerializer()
  final DateTime dongDangKy;
  @override
  @DateSerializer()
  final DateTime batDauHoc;
  @override
  @DateSerializer()
  final DateTime ketThucHoc;
  @override
  @DateSerializer()
  final DateTime hanNhapDiem;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HocKyImpl &&
            (identical(other.hocKy, hocKy) || other.hocKy == hocKy) &&
            (identical(other.moDangKy, moDangKy) ||
                other.moDangKy == moDangKy) &&
            (identical(other.dongDangKy, dongDangKy) ||
                other.dongDangKy == dongDangKy) &&
            (identical(other.batDauHoc, batDauHoc) ||
                other.batDauHoc == batDauHoc) &&
            (identical(other.ketThucHoc, ketThucHoc) ||
                other.ketThucHoc == ketThucHoc) &&
            (identical(other.hanNhapDiem, hanNhapDiem) ||
                other.hanNhapDiem == hanNhapDiem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hocKy, moDangKy, dongDangKy,
      batDauHoc, ketThucHoc, hanNhapDiem);

  /// Create a copy of HocKy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HocKyImplCopyWith<_$HocKyImpl> get copyWith =>
      __$$HocKyImplCopyWithImpl<_$HocKyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HocKyImplToJson(
      this,
    );
  }
}

abstract class _HocKy extends HocKy {
  const factory _HocKy(
      {required final String hocKy,
      @DateSerializer() required final DateTime moDangKy,
      @DateSerializer() required final DateTime dongDangKy,
      @DateSerializer() required final DateTime batDauHoc,
      @DateSerializer() required final DateTime ketThucHoc,
      @DateSerializer() required final DateTime hanNhapDiem}) = _$HocKyImpl;
  const _HocKy._() : super._();

  factory _HocKy.fromJson(Map<String, dynamic> json) = _$HocKyImpl.fromJson;

  @override
  String get hocKy;
  @override
  @DateSerializer()
  DateTime get moDangKy;
  @override
  @DateSerializer()
  DateTime get dongDangKy;
  @override
  @DateSerializer()
  DateTime get batDauHoc;
  @override
  @DateSerializer()
  DateTime get ketThucHoc;
  @override
  @DateSerializer()
  DateTime get hanNhapDiem;

  /// Create a copy of HocKy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HocKyImplCopyWith<_$HocKyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HocPhan _$HocPhanFromJson(Map<String, dynamic> json) {
  return _HocPhan.fromJson(json);
}

/// @nodoc
mixin _$HocPhan {
  String get maHocPhan => throw _privateConstructorUsedError;
  String get tenTiengViet => throw _privateConstructorUsedError;
  String get tenTiengAnh => throw _privateConstructorUsedError;
  int get soTinChi => throw _privateConstructorUsedError;
  KhoiKienThuc get khoiKienThuc => throw _privateConstructorUsedError;
  String get khoiLuong => throw _privateConstructorUsedError;

  /// Serializes this HocPhan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HocPhan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HocPhanCopyWith<HocPhan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HocPhanCopyWith<$Res> {
  factory $HocPhanCopyWith(HocPhan value, $Res Function(HocPhan) then) =
      _$HocPhanCopyWithImpl<$Res, HocPhan>;
  @useResult
  $Res call(
      {String maHocPhan,
      String tenTiengViet,
      String tenTiengAnh,
      int soTinChi,
      KhoiKienThuc khoiKienThuc,
      String khoiLuong});
}

/// @nodoc
class _$HocPhanCopyWithImpl<$Res, $Val extends HocPhan>
    implements $HocPhanCopyWith<$Res> {
  _$HocPhanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HocPhan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maHocPhan = null,
    Object? tenTiengViet = null,
    Object? tenTiengAnh = null,
    Object? soTinChi = null,
    Object? khoiKienThuc = null,
    Object? khoiLuong = null,
  }) {
    return _then(_value.copyWith(
      maHocPhan: null == maHocPhan
          ? _value.maHocPhan
          : maHocPhan // ignore: cast_nullable_to_non_nullable
              as String,
      tenTiengViet: null == tenTiengViet
          ? _value.tenTiengViet
          : tenTiengViet // ignore: cast_nullable_to_non_nullable
              as String,
      tenTiengAnh: null == tenTiengAnh
          ? _value.tenTiengAnh
          : tenTiengAnh // ignore: cast_nullable_to_non_nullable
              as String,
      soTinChi: null == soTinChi
          ? _value.soTinChi
          : soTinChi // ignore: cast_nullable_to_non_nullable
              as int,
      khoiKienThuc: null == khoiKienThuc
          ? _value.khoiKienThuc
          : khoiKienThuc // ignore: cast_nullable_to_non_nullable
              as KhoiKienThuc,
      khoiLuong: null == khoiLuong
          ? _value.khoiLuong
          : khoiLuong // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HocPhanImplCopyWith<$Res> implements $HocPhanCopyWith<$Res> {
  factory _$$HocPhanImplCopyWith(
          _$HocPhanImpl value, $Res Function(_$HocPhanImpl) then) =
      __$$HocPhanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String maHocPhan,
      String tenTiengViet,
      String tenTiengAnh,
      int soTinChi,
      KhoiKienThuc khoiKienThuc,
      String khoiLuong});
}

/// @nodoc
class __$$HocPhanImplCopyWithImpl<$Res>
    extends _$HocPhanCopyWithImpl<$Res, _$HocPhanImpl>
    implements _$$HocPhanImplCopyWith<$Res> {
  __$$HocPhanImplCopyWithImpl(
      _$HocPhanImpl _value, $Res Function(_$HocPhanImpl) _then)
      : super(_value, _then);

  /// Create a copy of HocPhan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maHocPhan = null,
    Object? tenTiengViet = null,
    Object? tenTiengAnh = null,
    Object? soTinChi = null,
    Object? khoiKienThuc = null,
    Object? khoiLuong = null,
  }) {
    return _then(_$HocPhanImpl(
      maHocPhan: null == maHocPhan
          ? _value.maHocPhan
          : maHocPhan // ignore: cast_nullable_to_non_nullable
              as String,
      tenTiengViet: null == tenTiengViet
          ? _value.tenTiengViet
          : tenTiengViet // ignore: cast_nullable_to_non_nullable
              as String,
      tenTiengAnh: null == tenTiengAnh
          ? _value.tenTiengAnh
          : tenTiengAnh // ignore: cast_nullable_to_non_nullable
              as String,
      soTinChi: null == soTinChi
          ? _value.soTinChi
          : soTinChi // ignore: cast_nullable_to_non_nullable
              as int,
      khoiKienThuc: null == khoiKienThuc
          ? _value.khoiKienThuc
          : khoiKienThuc // ignore: cast_nullable_to_non_nullable
              as KhoiKienThuc,
      khoiLuong: null == khoiLuong
          ? _value.khoiLuong
          : khoiLuong // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HocPhanImpl extends _HocPhan {
  const _$HocPhanImpl(
      {required this.maHocPhan,
      required this.tenTiengViet,
      required this.tenTiengAnh,
      required this.soTinChi,
      required this.khoiKienThuc,
      required this.khoiLuong})
      : super._();

  factory _$HocPhanImpl.fromJson(Map<String, dynamic> json) =>
      _$$HocPhanImplFromJson(json);

  @override
  final String maHocPhan;
  @override
  final String tenTiengViet;
  @override
  final String tenTiengAnh;
  @override
  final int soTinChi;
  @override
  final KhoiKienThuc khoiKienThuc;
  @override
  final String khoiLuong;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HocPhanImpl &&
            (identical(other.maHocPhan, maHocPhan) ||
                other.maHocPhan == maHocPhan) &&
            (identical(other.tenTiengViet, tenTiengViet) ||
                other.tenTiengViet == tenTiengViet) &&
            (identical(other.tenTiengAnh, tenTiengAnh) ||
                other.tenTiengAnh == tenTiengAnh) &&
            (identical(other.soTinChi, soTinChi) ||
                other.soTinChi == soTinChi) &&
            (identical(other.khoiKienThuc, khoiKienThuc) ||
                other.khoiKienThuc == khoiKienThuc) &&
            (identical(other.khoiLuong, khoiLuong) ||
                other.khoiLuong == khoiLuong));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, maHocPhan, tenTiengViet,
      tenTiengAnh, soTinChi, khoiKienThuc, khoiLuong);

  /// Create a copy of HocPhan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HocPhanImplCopyWith<_$HocPhanImpl> get copyWith =>
      __$$HocPhanImplCopyWithImpl<_$HocPhanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HocPhanImplToJson(
      this,
    );
  }
}

abstract class _HocPhan extends HocPhan {
  const factory _HocPhan(
      {required final String maHocPhan,
      required final String tenTiengViet,
      required final String tenTiengAnh,
      required final int soTinChi,
      required final KhoiKienThuc khoiKienThuc,
      required final String khoiLuong}) = _$HocPhanImpl;
  const _HocPhan._() : super._();

  factory _HocPhan.fromJson(Map<String, dynamic> json) = _$HocPhanImpl.fromJson;

  @override
  String get maHocPhan;
  @override
  String get tenTiengViet;
  @override
  String get tenTiengAnh;
  @override
  int get soTinChi;
  @override
  KhoiKienThuc get khoiKienThuc;
  @override
  String get khoiLuong;

  /// Create a copy of HocPhan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HocPhanImplCopyWith<_$HocPhanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HocVien _$HocVienFromJson(Map<String, dynamic> json) {
  return _HocVien.fromJson(json);
}

/// @nodoc
mixin _$HocVien {
  int get id => throw _privateConstructorUsedError;
  String? get soHoSo => throw _privateConstructorUsedError;
  String? get nienKhoa => throw _privateConstructorUsedError;
  String? get maHocVien => throw _privateConstructorUsedError;
  String get hoTen => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get ngaySinh => throw _privateConstructorUsedError;
  GioiTinh? get gioiTinh => throw _privateConstructorUsedError;
  String? get noiSinh => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get truongTotNghiepDaiHoc => throw _privateConstructorUsedError;
  String? get nganhTotNghiepDaiHoc => throw _privateConstructorUsedError;
  String? get heTotNghiepDaiHoc => throw _privateConstructorUsedError;
  String? get xepLoaiTotNghiepDaiHoc => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get ngayTotNghiepDaiHoc => throw _privateConstructorUsedError;
  String? get dinhHuongChuyenSau => throw _privateConstructorUsedError;
  String? get hocPhanDuocMien => throw _privateConstructorUsedError;
  String? get nganhDaoTaoThacSi => throw _privateConstructorUsedError;
  String? get dienThoai => throw _privateConstructorUsedError;
  TrangThaiHocVien get maTrangThai => throw _privateConstructorUsedError;
  String? get deTaiLuanVanTiengViet => throw _privateConstructorUsedError;
  String? get deTaiLuanVanTiengAnh => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get ngayGiaoDeTai => throw _privateConstructorUsedError;
  String? get soQuyetDinhGiao => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get ngayBaoVe => throw _privateConstructorUsedError;
  int? get soQuyetDinhBaoVe => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get ngayKyQuyetDinhBaoVe => throw _privateConstructorUsedError;
  int? get idGiangVienHuongDan => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get hanBaoVe => throw _privateConstructorUsedError;
  int get lanGiaHan => throw _privateConstructorUsedError;
  int? get idTieuBanXetTuyen => throw _privateConstructorUsedError;
  DienTuyenSinh? get idDienTuyenSinh => throw _privateConstructorUsedError;
  int get thanhToanXetTuyen => throw _privateConstructorUsedError;

  /// Serializes this HocVien to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HocVien
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HocVienCopyWith<HocVien> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HocVienCopyWith<$Res> {
  factory $HocVienCopyWith(HocVien value, $Res Function(HocVien) then) =
      _$HocVienCopyWithImpl<$Res, HocVien>;
  @useResult
  $Res call(
      {int id,
      String? soHoSo,
      String? nienKhoa,
      String? maHocVien,
      String hoTen,
      @MaybeDateSerializer() DateTime? ngaySinh,
      GioiTinh? gioiTinh,
      String? noiSinh,
      String? email,
      String? truongTotNghiepDaiHoc,
      String? nganhTotNghiepDaiHoc,
      String? heTotNghiepDaiHoc,
      String? xepLoaiTotNghiepDaiHoc,
      @MaybeDateSerializer() DateTime? ngayTotNghiepDaiHoc,
      String? dinhHuongChuyenSau,
      String? hocPhanDuocMien,
      String? nganhDaoTaoThacSi,
      String? dienThoai,
      TrangThaiHocVien maTrangThai,
      String? deTaiLuanVanTiengViet,
      String? deTaiLuanVanTiengAnh,
      @MaybeDateSerializer() DateTime? ngayGiaoDeTai,
      String? soQuyetDinhGiao,
      @MaybeDateSerializer() DateTime? ngayBaoVe,
      int? soQuyetDinhBaoVe,
      @MaybeDateSerializer() DateTime? ngayKyQuyetDinhBaoVe,
      int? idGiangVienHuongDan,
      @MaybeDateSerializer() DateTime? hanBaoVe,
      int lanGiaHan,
      int? idTieuBanXetTuyen,
      DienTuyenSinh? idDienTuyenSinh,
      int thanhToanXetTuyen});
}

/// @nodoc
class _$HocVienCopyWithImpl<$Res, $Val extends HocVien>
    implements $HocVienCopyWith<$Res> {
  _$HocVienCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HocVien
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? soHoSo = freezed,
    Object? nienKhoa = freezed,
    Object? maHocVien = freezed,
    Object? hoTen = null,
    Object? ngaySinh = freezed,
    Object? gioiTinh = freezed,
    Object? noiSinh = freezed,
    Object? email = freezed,
    Object? truongTotNghiepDaiHoc = freezed,
    Object? nganhTotNghiepDaiHoc = freezed,
    Object? heTotNghiepDaiHoc = freezed,
    Object? xepLoaiTotNghiepDaiHoc = freezed,
    Object? ngayTotNghiepDaiHoc = freezed,
    Object? dinhHuongChuyenSau = freezed,
    Object? hocPhanDuocMien = freezed,
    Object? nganhDaoTaoThacSi = freezed,
    Object? dienThoai = freezed,
    Object? maTrangThai = null,
    Object? deTaiLuanVanTiengViet = freezed,
    Object? deTaiLuanVanTiengAnh = freezed,
    Object? ngayGiaoDeTai = freezed,
    Object? soQuyetDinhGiao = freezed,
    Object? ngayBaoVe = freezed,
    Object? soQuyetDinhBaoVe = freezed,
    Object? ngayKyQuyetDinhBaoVe = freezed,
    Object? idGiangVienHuongDan = freezed,
    Object? hanBaoVe = freezed,
    Object? lanGiaHan = null,
    Object? idTieuBanXetTuyen = freezed,
    Object? idDienTuyenSinh = freezed,
    Object? thanhToanXetTuyen = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      soHoSo: freezed == soHoSo
          ? _value.soHoSo
          : soHoSo // ignore: cast_nullable_to_non_nullable
              as String?,
      nienKhoa: freezed == nienKhoa
          ? _value.nienKhoa
          : nienKhoa // ignore: cast_nullable_to_non_nullable
              as String?,
      maHocVien: freezed == maHocVien
          ? _value.maHocVien
          : maHocVien // ignore: cast_nullable_to_non_nullable
              as String?,
      hoTen: null == hoTen
          ? _value.hoTen
          : hoTen // ignore: cast_nullable_to_non_nullable
              as String,
      ngaySinh: freezed == ngaySinh
          ? _value.ngaySinh
          : ngaySinh // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gioiTinh: freezed == gioiTinh
          ? _value.gioiTinh
          : gioiTinh // ignore: cast_nullable_to_non_nullable
              as GioiTinh?,
      noiSinh: freezed == noiSinh
          ? _value.noiSinh
          : noiSinh // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      truongTotNghiepDaiHoc: freezed == truongTotNghiepDaiHoc
          ? _value.truongTotNghiepDaiHoc
          : truongTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      nganhTotNghiepDaiHoc: freezed == nganhTotNghiepDaiHoc
          ? _value.nganhTotNghiepDaiHoc
          : nganhTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      heTotNghiepDaiHoc: freezed == heTotNghiepDaiHoc
          ? _value.heTotNghiepDaiHoc
          : heTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      xepLoaiTotNghiepDaiHoc: freezed == xepLoaiTotNghiepDaiHoc
          ? _value.xepLoaiTotNghiepDaiHoc
          : xepLoaiTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayTotNghiepDaiHoc: freezed == ngayTotNghiepDaiHoc
          ? _value.ngayTotNghiepDaiHoc
          : ngayTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dinhHuongChuyenSau: freezed == dinhHuongChuyenSau
          ? _value.dinhHuongChuyenSau
          : dinhHuongChuyenSau // ignore: cast_nullable_to_non_nullable
              as String?,
      hocPhanDuocMien: freezed == hocPhanDuocMien
          ? _value.hocPhanDuocMien
          : hocPhanDuocMien // ignore: cast_nullable_to_non_nullable
              as String?,
      nganhDaoTaoThacSi: freezed == nganhDaoTaoThacSi
          ? _value.nganhDaoTaoThacSi
          : nganhDaoTaoThacSi // ignore: cast_nullable_to_non_nullable
              as String?,
      dienThoai: freezed == dienThoai
          ? _value.dienThoai
          : dienThoai // ignore: cast_nullable_to_non_nullable
              as String?,
      maTrangThai: null == maTrangThai
          ? _value.maTrangThai
          : maTrangThai // ignore: cast_nullable_to_non_nullable
              as TrangThaiHocVien,
      deTaiLuanVanTiengViet: freezed == deTaiLuanVanTiengViet
          ? _value.deTaiLuanVanTiengViet
          : deTaiLuanVanTiengViet // ignore: cast_nullable_to_non_nullable
              as String?,
      deTaiLuanVanTiengAnh: freezed == deTaiLuanVanTiengAnh
          ? _value.deTaiLuanVanTiengAnh
          : deTaiLuanVanTiengAnh // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayGiaoDeTai: freezed == ngayGiaoDeTai
          ? _value.ngayGiaoDeTai
          : ngayGiaoDeTai // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soQuyetDinhGiao: freezed == soQuyetDinhGiao
          ? _value.soQuyetDinhGiao
          : soQuyetDinhGiao // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayBaoVe: freezed == ngayBaoVe
          ? _value.ngayBaoVe
          : ngayBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soQuyetDinhBaoVe: freezed == soQuyetDinhBaoVe
          ? _value.soQuyetDinhBaoVe
          : soQuyetDinhBaoVe // ignore: cast_nullable_to_non_nullable
              as int?,
      ngayKyQuyetDinhBaoVe: freezed == ngayKyQuyetDinhBaoVe
          ? _value.ngayKyQuyetDinhBaoVe
          : ngayKyQuyetDinhBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idGiangVienHuongDan: freezed == idGiangVienHuongDan
          ? _value.idGiangVienHuongDan
          : idGiangVienHuongDan // ignore: cast_nullable_to_non_nullable
              as int?,
      hanBaoVe: freezed == hanBaoVe
          ? _value.hanBaoVe
          : hanBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lanGiaHan: null == lanGiaHan
          ? _value.lanGiaHan
          : lanGiaHan // ignore: cast_nullable_to_non_nullable
              as int,
      idTieuBanXetTuyen: freezed == idTieuBanXetTuyen
          ? _value.idTieuBanXetTuyen
          : idTieuBanXetTuyen // ignore: cast_nullable_to_non_nullable
              as int?,
      idDienTuyenSinh: freezed == idDienTuyenSinh
          ? _value.idDienTuyenSinh
          : idDienTuyenSinh // ignore: cast_nullable_to_non_nullable
              as DienTuyenSinh?,
      thanhToanXetTuyen: null == thanhToanXetTuyen
          ? _value.thanhToanXetTuyen
          : thanhToanXetTuyen // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HocVienImplCopyWith<$Res> implements $HocVienCopyWith<$Res> {
  factory _$$HocVienImplCopyWith(
          _$HocVienImpl value, $Res Function(_$HocVienImpl) then) =
      __$$HocVienImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? soHoSo,
      String? nienKhoa,
      String? maHocVien,
      String hoTen,
      @MaybeDateSerializer() DateTime? ngaySinh,
      GioiTinh? gioiTinh,
      String? noiSinh,
      String? email,
      String? truongTotNghiepDaiHoc,
      String? nganhTotNghiepDaiHoc,
      String? heTotNghiepDaiHoc,
      String? xepLoaiTotNghiepDaiHoc,
      @MaybeDateSerializer() DateTime? ngayTotNghiepDaiHoc,
      String? dinhHuongChuyenSau,
      String? hocPhanDuocMien,
      String? nganhDaoTaoThacSi,
      String? dienThoai,
      TrangThaiHocVien maTrangThai,
      String? deTaiLuanVanTiengViet,
      String? deTaiLuanVanTiengAnh,
      @MaybeDateSerializer() DateTime? ngayGiaoDeTai,
      String? soQuyetDinhGiao,
      @MaybeDateSerializer() DateTime? ngayBaoVe,
      int? soQuyetDinhBaoVe,
      @MaybeDateSerializer() DateTime? ngayKyQuyetDinhBaoVe,
      int? idGiangVienHuongDan,
      @MaybeDateSerializer() DateTime? hanBaoVe,
      int lanGiaHan,
      int? idTieuBanXetTuyen,
      DienTuyenSinh? idDienTuyenSinh,
      int thanhToanXetTuyen});
}

/// @nodoc
class __$$HocVienImplCopyWithImpl<$Res>
    extends _$HocVienCopyWithImpl<$Res, _$HocVienImpl>
    implements _$$HocVienImplCopyWith<$Res> {
  __$$HocVienImplCopyWithImpl(
      _$HocVienImpl _value, $Res Function(_$HocVienImpl) _then)
      : super(_value, _then);

  /// Create a copy of HocVien
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? soHoSo = freezed,
    Object? nienKhoa = freezed,
    Object? maHocVien = freezed,
    Object? hoTen = null,
    Object? ngaySinh = freezed,
    Object? gioiTinh = freezed,
    Object? noiSinh = freezed,
    Object? email = freezed,
    Object? truongTotNghiepDaiHoc = freezed,
    Object? nganhTotNghiepDaiHoc = freezed,
    Object? heTotNghiepDaiHoc = freezed,
    Object? xepLoaiTotNghiepDaiHoc = freezed,
    Object? ngayTotNghiepDaiHoc = freezed,
    Object? dinhHuongChuyenSau = freezed,
    Object? hocPhanDuocMien = freezed,
    Object? nganhDaoTaoThacSi = freezed,
    Object? dienThoai = freezed,
    Object? maTrangThai = null,
    Object? deTaiLuanVanTiengViet = freezed,
    Object? deTaiLuanVanTiengAnh = freezed,
    Object? ngayGiaoDeTai = freezed,
    Object? soQuyetDinhGiao = freezed,
    Object? ngayBaoVe = freezed,
    Object? soQuyetDinhBaoVe = freezed,
    Object? ngayKyQuyetDinhBaoVe = freezed,
    Object? idGiangVienHuongDan = freezed,
    Object? hanBaoVe = freezed,
    Object? lanGiaHan = null,
    Object? idTieuBanXetTuyen = freezed,
    Object? idDienTuyenSinh = freezed,
    Object? thanhToanXetTuyen = null,
  }) {
    return _then(_$HocVienImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      soHoSo: freezed == soHoSo
          ? _value.soHoSo
          : soHoSo // ignore: cast_nullable_to_non_nullable
              as String?,
      nienKhoa: freezed == nienKhoa
          ? _value.nienKhoa
          : nienKhoa // ignore: cast_nullable_to_non_nullable
              as String?,
      maHocVien: freezed == maHocVien
          ? _value.maHocVien
          : maHocVien // ignore: cast_nullable_to_non_nullable
              as String?,
      hoTen: null == hoTen
          ? _value.hoTen
          : hoTen // ignore: cast_nullable_to_non_nullable
              as String,
      ngaySinh: freezed == ngaySinh
          ? _value.ngaySinh
          : ngaySinh // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gioiTinh: freezed == gioiTinh
          ? _value.gioiTinh
          : gioiTinh // ignore: cast_nullable_to_non_nullable
              as GioiTinh?,
      noiSinh: freezed == noiSinh
          ? _value.noiSinh
          : noiSinh // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      truongTotNghiepDaiHoc: freezed == truongTotNghiepDaiHoc
          ? _value.truongTotNghiepDaiHoc
          : truongTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      nganhTotNghiepDaiHoc: freezed == nganhTotNghiepDaiHoc
          ? _value.nganhTotNghiepDaiHoc
          : nganhTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      heTotNghiepDaiHoc: freezed == heTotNghiepDaiHoc
          ? _value.heTotNghiepDaiHoc
          : heTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      xepLoaiTotNghiepDaiHoc: freezed == xepLoaiTotNghiepDaiHoc
          ? _value.xepLoaiTotNghiepDaiHoc
          : xepLoaiTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayTotNghiepDaiHoc: freezed == ngayTotNghiepDaiHoc
          ? _value.ngayTotNghiepDaiHoc
          : ngayTotNghiepDaiHoc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dinhHuongChuyenSau: freezed == dinhHuongChuyenSau
          ? _value.dinhHuongChuyenSau
          : dinhHuongChuyenSau // ignore: cast_nullable_to_non_nullable
              as String?,
      hocPhanDuocMien: freezed == hocPhanDuocMien
          ? _value.hocPhanDuocMien
          : hocPhanDuocMien // ignore: cast_nullable_to_non_nullable
              as String?,
      nganhDaoTaoThacSi: freezed == nganhDaoTaoThacSi
          ? _value.nganhDaoTaoThacSi
          : nganhDaoTaoThacSi // ignore: cast_nullable_to_non_nullable
              as String?,
      dienThoai: freezed == dienThoai
          ? _value.dienThoai
          : dienThoai // ignore: cast_nullable_to_non_nullable
              as String?,
      maTrangThai: null == maTrangThai
          ? _value.maTrangThai
          : maTrangThai // ignore: cast_nullable_to_non_nullable
              as TrangThaiHocVien,
      deTaiLuanVanTiengViet: freezed == deTaiLuanVanTiengViet
          ? _value.deTaiLuanVanTiengViet
          : deTaiLuanVanTiengViet // ignore: cast_nullable_to_non_nullable
              as String?,
      deTaiLuanVanTiengAnh: freezed == deTaiLuanVanTiengAnh
          ? _value.deTaiLuanVanTiengAnh
          : deTaiLuanVanTiengAnh // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayGiaoDeTai: freezed == ngayGiaoDeTai
          ? _value.ngayGiaoDeTai
          : ngayGiaoDeTai // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soQuyetDinhGiao: freezed == soQuyetDinhGiao
          ? _value.soQuyetDinhGiao
          : soQuyetDinhGiao // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayBaoVe: freezed == ngayBaoVe
          ? _value.ngayBaoVe
          : ngayBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soQuyetDinhBaoVe: freezed == soQuyetDinhBaoVe
          ? _value.soQuyetDinhBaoVe
          : soQuyetDinhBaoVe // ignore: cast_nullable_to_non_nullable
              as int?,
      ngayKyQuyetDinhBaoVe: freezed == ngayKyQuyetDinhBaoVe
          ? _value.ngayKyQuyetDinhBaoVe
          : ngayKyQuyetDinhBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idGiangVienHuongDan: freezed == idGiangVienHuongDan
          ? _value.idGiangVienHuongDan
          : idGiangVienHuongDan // ignore: cast_nullable_to_non_nullable
              as int?,
      hanBaoVe: freezed == hanBaoVe
          ? _value.hanBaoVe
          : hanBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lanGiaHan: null == lanGiaHan
          ? _value.lanGiaHan
          : lanGiaHan // ignore: cast_nullable_to_non_nullable
              as int,
      idTieuBanXetTuyen: freezed == idTieuBanXetTuyen
          ? _value.idTieuBanXetTuyen
          : idTieuBanXetTuyen // ignore: cast_nullable_to_non_nullable
              as int?,
      idDienTuyenSinh: freezed == idDienTuyenSinh
          ? _value.idDienTuyenSinh
          : idDienTuyenSinh // ignore: cast_nullable_to_non_nullable
              as DienTuyenSinh?,
      thanhToanXetTuyen: null == thanhToanXetTuyen
          ? _value.thanhToanXetTuyen
          : thanhToanXetTuyen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HocVienImpl extends _HocVien {
  const _$HocVienImpl(
      {required this.id,
      this.soHoSo,
      this.nienKhoa,
      this.maHocVien,
      required this.hoTen,
      @MaybeDateSerializer() this.ngaySinh,
      this.gioiTinh,
      this.noiSinh,
      this.email,
      this.truongTotNghiepDaiHoc,
      this.nganhTotNghiepDaiHoc,
      this.heTotNghiepDaiHoc,
      this.xepLoaiTotNghiepDaiHoc,
      @MaybeDateSerializer() this.ngayTotNghiepDaiHoc,
      this.dinhHuongChuyenSau,
      this.hocPhanDuocMien,
      this.nganhDaoTaoThacSi,
      this.dienThoai,
      required this.maTrangThai,
      this.deTaiLuanVanTiengViet,
      this.deTaiLuanVanTiengAnh,
      @MaybeDateSerializer() this.ngayGiaoDeTai,
      this.soQuyetDinhGiao,
      @MaybeDateSerializer() this.ngayBaoVe,
      this.soQuyetDinhBaoVe,
      @MaybeDateSerializer() this.ngayKyQuyetDinhBaoVe,
      this.idGiangVienHuongDan,
      @MaybeDateSerializer() this.hanBaoVe,
      this.lanGiaHan = 0,
      this.idTieuBanXetTuyen,
      this.idDienTuyenSinh,
      this.thanhToanXetTuyen = 0})
      : super._();

  factory _$HocVienImpl.fromJson(Map<String, dynamic> json) =>
      _$$HocVienImplFromJson(json);

  @override
  final int id;
  @override
  final String? soHoSo;
  @override
  final String? nienKhoa;
  @override
  final String? maHocVien;
  @override
  final String hoTen;
  @override
  @MaybeDateSerializer()
  final DateTime? ngaySinh;
  @override
  final GioiTinh? gioiTinh;
  @override
  final String? noiSinh;
  @override
  final String? email;
  @override
  final String? truongTotNghiepDaiHoc;
  @override
  final String? nganhTotNghiepDaiHoc;
  @override
  final String? heTotNghiepDaiHoc;
  @override
  final String? xepLoaiTotNghiepDaiHoc;
  @override
  @MaybeDateSerializer()
  final DateTime? ngayTotNghiepDaiHoc;
  @override
  final String? dinhHuongChuyenSau;
  @override
  final String? hocPhanDuocMien;
  @override
  final String? nganhDaoTaoThacSi;
  @override
  final String? dienThoai;
  @override
  final TrangThaiHocVien maTrangThai;
  @override
  final String? deTaiLuanVanTiengViet;
  @override
  final String? deTaiLuanVanTiengAnh;
  @override
  @MaybeDateSerializer()
  final DateTime? ngayGiaoDeTai;
  @override
  final String? soQuyetDinhGiao;
  @override
  @MaybeDateSerializer()
  final DateTime? ngayBaoVe;
  @override
  final int? soQuyetDinhBaoVe;
  @override
  @MaybeDateSerializer()
  final DateTime? ngayKyQuyetDinhBaoVe;
  @override
  final int? idGiangVienHuongDan;
  @override
  @MaybeDateSerializer()
  final DateTime? hanBaoVe;
  @override
  @JsonKey()
  final int lanGiaHan;
  @override
  final int? idTieuBanXetTuyen;
  @override
  final DienTuyenSinh? idDienTuyenSinh;
  @override
  @JsonKey()
  final int thanhToanXetTuyen;

  @override
  String toString() {
    return 'HocVien(id: $id, soHoSo: $soHoSo, nienKhoa: $nienKhoa, maHocVien: $maHocVien, hoTen: $hoTen, ngaySinh: $ngaySinh, gioiTinh: $gioiTinh, noiSinh: $noiSinh, email: $email, truongTotNghiepDaiHoc: $truongTotNghiepDaiHoc, nganhTotNghiepDaiHoc: $nganhTotNghiepDaiHoc, heTotNghiepDaiHoc: $heTotNghiepDaiHoc, xepLoaiTotNghiepDaiHoc: $xepLoaiTotNghiepDaiHoc, ngayTotNghiepDaiHoc: $ngayTotNghiepDaiHoc, dinhHuongChuyenSau: $dinhHuongChuyenSau, hocPhanDuocMien: $hocPhanDuocMien, nganhDaoTaoThacSi: $nganhDaoTaoThacSi, dienThoai: $dienThoai, maTrangThai: $maTrangThai, deTaiLuanVanTiengViet: $deTaiLuanVanTiengViet, deTaiLuanVanTiengAnh: $deTaiLuanVanTiengAnh, ngayGiaoDeTai: $ngayGiaoDeTai, soQuyetDinhGiao: $soQuyetDinhGiao, ngayBaoVe: $ngayBaoVe, soQuyetDinhBaoVe: $soQuyetDinhBaoVe, ngayKyQuyetDinhBaoVe: $ngayKyQuyetDinhBaoVe, idGiangVienHuongDan: $idGiangVienHuongDan, hanBaoVe: $hanBaoVe, lanGiaHan: $lanGiaHan, idTieuBanXetTuyen: $idTieuBanXetTuyen, idDienTuyenSinh: $idDienTuyenSinh, thanhToanXetTuyen: $thanhToanXetTuyen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HocVienImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.soHoSo, soHoSo) || other.soHoSo == soHoSo) &&
            (identical(other.nienKhoa, nienKhoa) ||
                other.nienKhoa == nienKhoa) &&
            (identical(other.maHocVien, maHocVien) ||
                other.maHocVien == maHocVien) &&
            (identical(other.hoTen, hoTen) || other.hoTen == hoTen) &&
            (identical(other.ngaySinh, ngaySinh) ||
                other.ngaySinh == ngaySinh) &&
            (identical(other.gioiTinh, gioiTinh) ||
                other.gioiTinh == gioiTinh) &&
            (identical(other.noiSinh, noiSinh) || other.noiSinh == noiSinh) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.truongTotNghiepDaiHoc, truongTotNghiepDaiHoc) ||
                other.truongTotNghiepDaiHoc == truongTotNghiepDaiHoc) &&
            (identical(other.nganhTotNghiepDaiHoc, nganhTotNghiepDaiHoc) ||
                other.nganhTotNghiepDaiHoc == nganhTotNghiepDaiHoc) &&
            (identical(other.heTotNghiepDaiHoc, heTotNghiepDaiHoc) ||
                other.heTotNghiepDaiHoc == heTotNghiepDaiHoc) &&
            (identical(other.xepLoaiTotNghiepDaiHoc, xepLoaiTotNghiepDaiHoc) ||
                other.xepLoaiTotNghiepDaiHoc == xepLoaiTotNghiepDaiHoc) &&
            (identical(other.ngayTotNghiepDaiHoc, ngayTotNghiepDaiHoc) ||
                other.ngayTotNghiepDaiHoc == ngayTotNghiepDaiHoc) &&
            (identical(other.dinhHuongChuyenSau, dinhHuongChuyenSau) ||
                other.dinhHuongChuyenSau == dinhHuongChuyenSau) &&
            (identical(other.hocPhanDuocMien, hocPhanDuocMien) ||
                other.hocPhanDuocMien == hocPhanDuocMien) &&
            (identical(other.nganhDaoTaoThacSi, nganhDaoTaoThacSi) ||
                other.nganhDaoTaoThacSi == nganhDaoTaoThacSi) &&
            (identical(other.dienThoai, dienThoai) ||
                other.dienThoai == dienThoai) &&
            (identical(other.maTrangThai, maTrangThai) ||
                other.maTrangThai == maTrangThai) &&
            (identical(other.deTaiLuanVanTiengViet, deTaiLuanVanTiengViet) ||
                other.deTaiLuanVanTiengViet == deTaiLuanVanTiengViet) &&
            (identical(other.deTaiLuanVanTiengAnh, deTaiLuanVanTiengAnh) ||
                other.deTaiLuanVanTiengAnh == deTaiLuanVanTiengAnh) &&
            (identical(other.ngayGiaoDeTai, ngayGiaoDeTai) ||
                other.ngayGiaoDeTai == ngayGiaoDeTai) &&
            (identical(other.soQuyetDinhGiao, soQuyetDinhGiao) ||
                other.soQuyetDinhGiao == soQuyetDinhGiao) &&
            (identical(other.ngayBaoVe, ngayBaoVe) ||
                other.ngayBaoVe == ngayBaoVe) &&
            (identical(other.soQuyetDinhBaoVe, soQuyetDinhBaoVe) ||
                other.soQuyetDinhBaoVe == soQuyetDinhBaoVe) &&
            (identical(other.ngayKyQuyetDinhBaoVe, ngayKyQuyetDinhBaoVe) ||
                other.ngayKyQuyetDinhBaoVe == ngayKyQuyetDinhBaoVe) &&
            (identical(other.idGiangVienHuongDan, idGiangVienHuongDan) ||
                other.idGiangVienHuongDan == idGiangVienHuongDan) &&
            (identical(other.hanBaoVe, hanBaoVe) ||
                other.hanBaoVe == hanBaoVe) &&
            (identical(other.lanGiaHan, lanGiaHan) ||
                other.lanGiaHan == lanGiaHan) &&
            (identical(other.idTieuBanXetTuyen, idTieuBanXetTuyen) ||
                other.idTieuBanXetTuyen == idTieuBanXetTuyen) &&
            (identical(other.idDienTuyenSinh, idDienTuyenSinh) ||
                other.idDienTuyenSinh == idDienTuyenSinh) &&
            (identical(other.thanhToanXetTuyen, thanhToanXetTuyen) ||
                other.thanhToanXetTuyen == thanhToanXetTuyen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        soHoSo,
        nienKhoa,
        maHocVien,
        hoTen,
        ngaySinh,
        gioiTinh,
        noiSinh,
        email,
        truongTotNghiepDaiHoc,
        nganhTotNghiepDaiHoc,
        heTotNghiepDaiHoc,
        xepLoaiTotNghiepDaiHoc,
        ngayTotNghiepDaiHoc,
        dinhHuongChuyenSau,
        hocPhanDuocMien,
        nganhDaoTaoThacSi,
        dienThoai,
        maTrangThai,
        deTaiLuanVanTiengViet,
        deTaiLuanVanTiengAnh,
        ngayGiaoDeTai,
        soQuyetDinhGiao,
        ngayBaoVe,
        soQuyetDinhBaoVe,
        ngayKyQuyetDinhBaoVe,
        idGiangVienHuongDan,
        hanBaoVe,
        lanGiaHan,
        idTieuBanXetTuyen,
        idDienTuyenSinh,
        thanhToanXetTuyen
      ]);

  /// Create a copy of HocVien
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HocVienImplCopyWith<_$HocVienImpl> get copyWith =>
      __$$HocVienImplCopyWithImpl<_$HocVienImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HocVienImplToJson(
      this,
    );
  }
}

abstract class _HocVien extends HocVien {
  const factory _HocVien(
      {required final int id,
      final String? soHoSo,
      final String? nienKhoa,
      final String? maHocVien,
      required final String hoTen,
      @MaybeDateSerializer() final DateTime? ngaySinh,
      final GioiTinh? gioiTinh,
      final String? noiSinh,
      final String? email,
      final String? truongTotNghiepDaiHoc,
      final String? nganhTotNghiepDaiHoc,
      final String? heTotNghiepDaiHoc,
      final String? xepLoaiTotNghiepDaiHoc,
      @MaybeDateSerializer() final DateTime? ngayTotNghiepDaiHoc,
      final String? dinhHuongChuyenSau,
      final String? hocPhanDuocMien,
      final String? nganhDaoTaoThacSi,
      final String? dienThoai,
      required final TrangThaiHocVien maTrangThai,
      final String? deTaiLuanVanTiengViet,
      final String? deTaiLuanVanTiengAnh,
      @MaybeDateSerializer() final DateTime? ngayGiaoDeTai,
      final String? soQuyetDinhGiao,
      @MaybeDateSerializer() final DateTime? ngayBaoVe,
      final int? soQuyetDinhBaoVe,
      @MaybeDateSerializer() final DateTime? ngayKyQuyetDinhBaoVe,
      final int? idGiangVienHuongDan,
      @MaybeDateSerializer() final DateTime? hanBaoVe,
      final int lanGiaHan,
      final int? idTieuBanXetTuyen,
      final DienTuyenSinh? idDienTuyenSinh,
      final int thanhToanXetTuyen}) = _$HocVienImpl;
  const _HocVien._() : super._();

  factory _HocVien.fromJson(Map<String, dynamic> json) = _$HocVienImpl.fromJson;

  @override
  int get id;
  @override
  String? get soHoSo;
  @override
  String? get nienKhoa;
  @override
  String? get maHocVien;
  @override
  String get hoTen;
  @override
  @MaybeDateSerializer()
  DateTime? get ngaySinh;
  @override
  GioiTinh? get gioiTinh;
  @override
  String? get noiSinh;
  @override
  String? get email;
  @override
  String? get truongTotNghiepDaiHoc;
  @override
  String? get nganhTotNghiepDaiHoc;
  @override
  String? get heTotNghiepDaiHoc;
  @override
  String? get xepLoaiTotNghiepDaiHoc;
  @override
  @MaybeDateSerializer()
  DateTime? get ngayTotNghiepDaiHoc;
  @override
  String? get dinhHuongChuyenSau;
  @override
  String? get hocPhanDuocMien;
  @override
  String? get nganhDaoTaoThacSi;
  @override
  String? get dienThoai;
  @override
  TrangThaiHocVien get maTrangThai;
  @override
  String? get deTaiLuanVanTiengViet;
  @override
  String? get deTaiLuanVanTiengAnh;
  @override
  @MaybeDateSerializer()
  DateTime? get ngayGiaoDeTai;
  @override
  String? get soQuyetDinhGiao;
  @override
  @MaybeDateSerializer()
  DateTime? get ngayBaoVe;
  @override
  int? get soQuyetDinhBaoVe;
  @override
  @MaybeDateSerializer()
  DateTime? get ngayKyQuyetDinhBaoVe;
  @override
  int? get idGiangVienHuongDan;
  @override
  @MaybeDateSerializer()
  DateTime? get hanBaoVe;
  @override
  int get lanGiaHan;
  @override
  int? get idTieuBanXetTuyen;
  @override
  DienTuyenSinh? get idDienTuyenSinh;
  @override
  int get thanhToanXetTuyen;

  /// Create a copy of HocVien
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HocVienImplCopyWith<_$HocVienImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HoiDongLVTS _$HoiDongLVTSFromJson(Map<String, dynamic> json) {
  return _HoiDongLVTS.fromJson(json);
}

/// @nodoc
mixin _$HoiDongLVTS {
  int get id => throw _privateConstructorUsedError;
  int? get idHocVien => throw _privateConstructorUsedError;
  int? get idChuTich => throw _privateConstructorUsedError;
  int? get idThuKy => throw _privateConstructorUsedError;
  int? get idPhanBien1 => throw _privateConstructorUsedError;
  int? get idPhanBien2 => throw _privateConstructorUsedError;
  int? get idUyVien => throw _privateConstructorUsedError;
  String? get ngayBaoVe => throw _privateConstructorUsedError;
  String? get soQuyetDinh => throw _privateConstructorUsedError;
  int get lanBaoVe => throw _privateConstructorUsedError;
  int get thanhToan => throw _privateConstructorUsedError;
  String? get nam => throw _privateConstructorUsedError;

  /// Serializes this HoiDongLVTS to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HoiDongLVTS
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HoiDongLVTSCopyWith<HoiDongLVTS> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoiDongLVTSCopyWith<$Res> {
  factory $HoiDongLVTSCopyWith(
          HoiDongLVTS value, $Res Function(HoiDongLVTS) then) =
      _$HoiDongLVTSCopyWithImpl<$Res, HoiDongLVTS>;
  @useResult
  $Res call(
      {int id,
      int? idHocVien,
      int? idChuTich,
      int? idThuKy,
      int? idPhanBien1,
      int? idPhanBien2,
      int? idUyVien,
      String? ngayBaoVe,
      String? soQuyetDinh,
      int lanBaoVe,
      int thanhToan,
      String? nam});
}

/// @nodoc
class _$HoiDongLVTSCopyWithImpl<$Res, $Val extends HoiDongLVTS>
    implements $HoiDongLVTSCopyWith<$Res> {
  _$HoiDongLVTSCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HoiDongLVTS
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idHocVien = freezed,
    Object? idChuTich = freezed,
    Object? idThuKy = freezed,
    Object? idPhanBien1 = freezed,
    Object? idPhanBien2 = freezed,
    Object? idUyVien = freezed,
    Object? ngayBaoVe = freezed,
    Object? soQuyetDinh = freezed,
    Object? lanBaoVe = null,
    Object? thanhToan = null,
    Object? nam = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idHocVien: freezed == idHocVien
          ? _value.idHocVien
          : idHocVien // ignore: cast_nullable_to_non_nullable
              as int?,
      idChuTich: freezed == idChuTich
          ? _value.idChuTich
          : idChuTich // ignore: cast_nullable_to_non_nullable
              as int?,
      idThuKy: freezed == idThuKy
          ? _value.idThuKy
          : idThuKy // ignore: cast_nullable_to_non_nullable
              as int?,
      idPhanBien1: freezed == idPhanBien1
          ? _value.idPhanBien1
          : idPhanBien1 // ignore: cast_nullable_to_non_nullable
              as int?,
      idPhanBien2: freezed == idPhanBien2
          ? _value.idPhanBien2
          : idPhanBien2 // ignore: cast_nullable_to_non_nullable
              as int?,
      idUyVien: freezed == idUyVien
          ? _value.idUyVien
          : idUyVien // ignore: cast_nullable_to_non_nullable
              as int?,
      ngayBaoVe: freezed == ngayBaoVe
          ? _value.ngayBaoVe
          : ngayBaoVe // ignore: cast_nullable_to_non_nullable
              as String?,
      soQuyetDinh: freezed == soQuyetDinh
          ? _value.soQuyetDinh
          : soQuyetDinh // ignore: cast_nullable_to_non_nullable
              as String?,
      lanBaoVe: null == lanBaoVe
          ? _value.lanBaoVe
          : lanBaoVe // ignore: cast_nullable_to_non_nullable
              as int,
      thanhToan: null == thanhToan
          ? _value.thanhToan
          : thanhToan // ignore: cast_nullable_to_non_nullable
              as int,
      nam: freezed == nam
          ? _value.nam
          : nam // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HoiDongLVTSImplCopyWith<$Res>
    implements $HoiDongLVTSCopyWith<$Res> {
  factory _$$HoiDongLVTSImplCopyWith(
          _$HoiDongLVTSImpl value, $Res Function(_$HoiDongLVTSImpl) then) =
      __$$HoiDongLVTSImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? idHocVien,
      int? idChuTich,
      int? idThuKy,
      int? idPhanBien1,
      int? idPhanBien2,
      int? idUyVien,
      String? ngayBaoVe,
      String? soQuyetDinh,
      int lanBaoVe,
      int thanhToan,
      String? nam});
}

/// @nodoc
class __$$HoiDongLVTSImplCopyWithImpl<$Res>
    extends _$HoiDongLVTSCopyWithImpl<$Res, _$HoiDongLVTSImpl>
    implements _$$HoiDongLVTSImplCopyWith<$Res> {
  __$$HoiDongLVTSImplCopyWithImpl(
      _$HoiDongLVTSImpl _value, $Res Function(_$HoiDongLVTSImpl) _then)
      : super(_value, _then);

  /// Create a copy of HoiDongLVTS
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idHocVien = freezed,
    Object? idChuTich = freezed,
    Object? idThuKy = freezed,
    Object? idPhanBien1 = freezed,
    Object? idPhanBien2 = freezed,
    Object? idUyVien = freezed,
    Object? ngayBaoVe = freezed,
    Object? soQuyetDinh = freezed,
    Object? lanBaoVe = null,
    Object? thanhToan = null,
    Object? nam = freezed,
  }) {
    return _then(_$HoiDongLVTSImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idHocVien: freezed == idHocVien
          ? _value.idHocVien
          : idHocVien // ignore: cast_nullable_to_non_nullable
              as int?,
      idChuTich: freezed == idChuTich
          ? _value.idChuTich
          : idChuTich // ignore: cast_nullable_to_non_nullable
              as int?,
      idThuKy: freezed == idThuKy
          ? _value.idThuKy
          : idThuKy // ignore: cast_nullable_to_non_nullable
              as int?,
      idPhanBien1: freezed == idPhanBien1
          ? _value.idPhanBien1
          : idPhanBien1 // ignore: cast_nullable_to_non_nullable
              as int?,
      idPhanBien2: freezed == idPhanBien2
          ? _value.idPhanBien2
          : idPhanBien2 // ignore: cast_nullable_to_non_nullable
              as int?,
      idUyVien: freezed == idUyVien
          ? _value.idUyVien
          : idUyVien // ignore: cast_nullable_to_non_nullable
              as int?,
      ngayBaoVe: freezed == ngayBaoVe
          ? _value.ngayBaoVe
          : ngayBaoVe // ignore: cast_nullable_to_non_nullable
              as String?,
      soQuyetDinh: freezed == soQuyetDinh
          ? _value.soQuyetDinh
          : soQuyetDinh // ignore: cast_nullable_to_non_nullable
              as String?,
      lanBaoVe: null == lanBaoVe
          ? _value.lanBaoVe
          : lanBaoVe // ignore: cast_nullable_to_non_nullable
              as int,
      thanhToan: null == thanhToan
          ? _value.thanhToan
          : thanhToan // ignore: cast_nullable_to_non_nullable
              as int,
      nam: freezed == nam
          ? _value.nam
          : nam // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HoiDongLVTSImpl implements _HoiDongLVTS {
  const _$HoiDongLVTSImpl(
      {required this.id,
      this.idHocVien,
      this.idChuTich,
      this.idThuKy,
      this.idPhanBien1,
      this.idPhanBien2,
      this.idUyVien,
      this.ngayBaoVe,
      this.soQuyetDinh,
      this.lanBaoVe = 1,
      this.thanhToan = 0,
      this.nam});

  factory _$HoiDongLVTSImpl.fromJson(Map<String, dynamic> json) =>
      _$$HoiDongLVTSImplFromJson(json);

  @override
  final int id;
  @override
  final int? idHocVien;
  @override
  final int? idChuTich;
  @override
  final int? idThuKy;
  @override
  final int? idPhanBien1;
  @override
  final int? idPhanBien2;
  @override
  final int? idUyVien;
  @override
  final String? ngayBaoVe;
  @override
  final String? soQuyetDinh;
  @override
  @JsonKey()
  final int lanBaoVe;
  @override
  @JsonKey()
  final int thanhToan;
  @override
  final String? nam;

  @override
  String toString() {
    return 'HoiDongLVTS(id: $id, idHocVien: $idHocVien, idChuTich: $idChuTich, idThuKy: $idThuKy, idPhanBien1: $idPhanBien1, idPhanBien2: $idPhanBien2, idUyVien: $idUyVien, ngayBaoVe: $ngayBaoVe, soQuyetDinh: $soQuyetDinh, lanBaoVe: $lanBaoVe, thanhToan: $thanhToan, nam: $nam)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoiDongLVTSImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idHocVien, idHocVien) ||
                other.idHocVien == idHocVien) &&
            (identical(other.idChuTich, idChuTich) ||
                other.idChuTich == idChuTich) &&
            (identical(other.idThuKy, idThuKy) || other.idThuKy == idThuKy) &&
            (identical(other.idPhanBien1, idPhanBien1) ||
                other.idPhanBien1 == idPhanBien1) &&
            (identical(other.idPhanBien2, idPhanBien2) ||
                other.idPhanBien2 == idPhanBien2) &&
            (identical(other.idUyVien, idUyVien) ||
                other.idUyVien == idUyVien) &&
            (identical(other.ngayBaoVe, ngayBaoVe) ||
                other.ngayBaoVe == ngayBaoVe) &&
            (identical(other.soQuyetDinh, soQuyetDinh) ||
                other.soQuyetDinh == soQuyetDinh) &&
            (identical(other.lanBaoVe, lanBaoVe) ||
                other.lanBaoVe == lanBaoVe) &&
            (identical(other.thanhToan, thanhToan) ||
                other.thanhToan == thanhToan) &&
            (identical(other.nam, nam) || other.nam == nam));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idHocVien,
      idChuTich,
      idThuKy,
      idPhanBien1,
      idPhanBien2,
      idUyVien,
      ngayBaoVe,
      soQuyetDinh,
      lanBaoVe,
      thanhToan,
      nam);

  /// Create a copy of HoiDongLVTS
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HoiDongLVTSImplCopyWith<_$HoiDongLVTSImpl> get copyWith =>
      __$$HoiDongLVTSImplCopyWithImpl<_$HoiDongLVTSImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HoiDongLVTSImplToJson(
      this,
    );
  }
}

abstract class _HoiDongLVTS implements HoiDongLVTS {
  const factory _HoiDongLVTS(
      {required final int id,
      final int? idHocVien,
      final int? idChuTich,
      final int? idThuKy,
      final int? idPhanBien1,
      final int? idPhanBien2,
      final int? idUyVien,
      final String? ngayBaoVe,
      final String? soQuyetDinh,
      final int lanBaoVe,
      final int thanhToan,
      final String? nam}) = _$HoiDongLVTSImpl;

  factory _HoiDongLVTS.fromJson(Map<String, dynamic> json) =
      _$HoiDongLVTSImpl.fromJson;

  @override
  int get id;
  @override
  int? get idHocVien;
  @override
  int? get idChuTich;
  @override
  int? get idThuKy;
  @override
  int? get idPhanBien1;
  @override
  int? get idPhanBien2;
  @override
  int? get idUyVien;
  @override
  String? get ngayBaoVe;
  @override
  String? get soQuyetDinh;
  @override
  int get lanBaoVe;
  @override
  int get thanhToan;
  @override
  String? get nam;

  /// Create a copy of HoiDongLVTS
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HoiDongLVTSImplCopyWith<_$HoiDongLVTSImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LopTinChi _$LopTinChiFromJson(Map<String, dynamic> json) {
  return _LopTinChi.fromJson(json);
}

/// @nodoc
mixin _$LopTinChi {
  int get id => throw _privateConstructorUsedError;
  String? get maLopHoc => throw _privateConstructorUsedError;
  String get maHocPhan => throw _privateConstructorUsedError;
  int? get idGiangVien => throw _privateConstructorUsedError;
  int? get idLopTruong => throw _privateConstructorUsedError;
  String? get urlTruyCap => throw _privateConstructorUsedError;
  String? get hocKy => throw _privateConstructorUsedError;
  String? get phongHoc => throw _privateConstructorUsedError;
  NgayTrongTuan? get ngayHoc => throw _privateConstructorUsedError;
  int? get tietBatDau => throw _privateConstructorUsedError;
  int? get tietKetThuc => throw _privateConstructorUsedError;
  TrangThaiLopTinChi get trangThai => throw _privateConstructorUsedError;

  /// Serializes this LopTinChi to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LopTinChi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LopTinChiCopyWith<LopTinChi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LopTinChiCopyWith<$Res> {
  factory $LopTinChiCopyWith(LopTinChi value, $Res Function(LopTinChi) then) =
      _$LopTinChiCopyWithImpl<$Res, LopTinChi>;
  @useResult
  $Res call(
      {int id,
      String? maLopHoc,
      String maHocPhan,
      int? idGiangVien,
      int? idLopTruong,
      String? urlTruyCap,
      String? hocKy,
      String? phongHoc,
      NgayTrongTuan? ngayHoc,
      int? tietBatDau,
      int? tietKetThuc,
      TrangThaiLopTinChi trangThai});
}

/// @nodoc
class _$LopTinChiCopyWithImpl<$Res, $Val extends LopTinChi>
    implements $LopTinChiCopyWith<$Res> {
  _$LopTinChiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LopTinChi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? maLopHoc = freezed,
    Object? maHocPhan = null,
    Object? idGiangVien = freezed,
    Object? idLopTruong = freezed,
    Object? urlTruyCap = freezed,
    Object? hocKy = freezed,
    Object? phongHoc = freezed,
    Object? ngayHoc = freezed,
    Object? tietBatDau = freezed,
    Object? tietKetThuc = freezed,
    Object? trangThai = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maLopHoc: freezed == maLopHoc
          ? _value.maLopHoc
          : maLopHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      maHocPhan: null == maHocPhan
          ? _value.maHocPhan
          : maHocPhan // ignore: cast_nullable_to_non_nullable
              as String,
      idGiangVien: freezed == idGiangVien
          ? _value.idGiangVien
          : idGiangVien // ignore: cast_nullable_to_non_nullable
              as int?,
      idLopTruong: freezed == idLopTruong
          ? _value.idLopTruong
          : idLopTruong // ignore: cast_nullable_to_non_nullable
              as int?,
      urlTruyCap: freezed == urlTruyCap
          ? _value.urlTruyCap
          : urlTruyCap // ignore: cast_nullable_to_non_nullable
              as String?,
      hocKy: freezed == hocKy
          ? _value.hocKy
          : hocKy // ignore: cast_nullable_to_non_nullable
              as String?,
      phongHoc: freezed == phongHoc
          ? _value.phongHoc
          : phongHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayHoc: freezed == ngayHoc
          ? _value.ngayHoc
          : ngayHoc // ignore: cast_nullable_to_non_nullable
              as NgayTrongTuan?,
      tietBatDau: freezed == tietBatDau
          ? _value.tietBatDau
          : tietBatDau // ignore: cast_nullable_to_non_nullable
              as int?,
      tietKetThuc: freezed == tietKetThuc
          ? _value.tietKetThuc
          : tietKetThuc // ignore: cast_nullable_to_non_nullable
              as int?,
      trangThai: null == trangThai
          ? _value.trangThai
          : trangThai // ignore: cast_nullable_to_non_nullable
              as TrangThaiLopTinChi,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LopTinChiImplCopyWith<$Res>
    implements $LopTinChiCopyWith<$Res> {
  factory _$$LopTinChiImplCopyWith(
          _$LopTinChiImpl value, $Res Function(_$LopTinChiImpl) then) =
      __$$LopTinChiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? maLopHoc,
      String maHocPhan,
      int? idGiangVien,
      int? idLopTruong,
      String? urlTruyCap,
      String? hocKy,
      String? phongHoc,
      NgayTrongTuan? ngayHoc,
      int? tietBatDau,
      int? tietKetThuc,
      TrangThaiLopTinChi trangThai});
}

/// @nodoc
class __$$LopTinChiImplCopyWithImpl<$Res>
    extends _$LopTinChiCopyWithImpl<$Res, _$LopTinChiImpl>
    implements _$$LopTinChiImplCopyWith<$Res> {
  __$$LopTinChiImplCopyWithImpl(
      _$LopTinChiImpl _value, $Res Function(_$LopTinChiImpl) _then)
      : super(_value, _then);

  /// Create a copy of LopTinChi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? maLopHoc = freezed,
    Object? maHocPhan = null,
    Object? idGiangVien = freezed,
    Object? idLopTruong = freezed,
    Object? urlTruyCap = freezed,
    Object? hocKy = freezed,
    Object? phongHoc = freezed,
    Object? ngayHoc = freezed,
    Object? tietBatDau = freezed,
    Object? tietKetThuc = freezed,
    Object? trangThai = null,
  }) {
    return _then(_$LopTinChiImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maLopHoc: freezed == maLopHoc
          ? _value.maLopHoc
          : maLopHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      maHocPhan: null == maHocPhan
          ? _value.maHocPhan
          : maHocPhan // ignore: cast_nullable_to_non_nullable
              as String,
      idGiangVien: freezed == idGiangVien
          ? _value.idGiangVien
          : idGiangVien // ignore: cast_nullable_to_non_nullable
              as int?,
      idLopTruong: freezed == idLopTruong
          ? _value.idLopTruong
          : idLopTruong // ignore: cast_nullable_to_non_nullable
              as int?,
      urlTruyCap: freezed == urlTruyCap
          ? _value.urlTruyCap
          : urlTruyCap // ignore: cast_nullable_to_non_nullable
              as String?,
      hocKy: freezed == hocKy
          ? _value.hocKy
          : hocKy // ignore: cast_nullable_to_non_nullable
              as String?,
      phongHoc: freezed == phongHoc
          ? _value.phongHoc
          : phongHoc // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayHoc: freezed == ngayHoc
          ? _value.ngayHoc
          : ngayHoc // ignore: cast_nullable_to_non_nullable
              as NgayTrongTuan?,
      tietBatDau: freezed == tietBatDau
          ? _value.tietBatDau
          : tietBatDau // ignore: cast_nullable_to_non_nullable
              as int?,
      tietKetThuc: freezed == tietKetThuc
          ? _value.tietKetThuc
          : tietKetThuc // ignore: cast_nullable_to_non_nullable
              as int?,
      trangThai: null == trangThai
          ? _value.trangThai
          : trangThai // ignore: cast_nullable_to_non_nullable
              as TrangThaiLopTinChi,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LopTinChiImpl extends _LopTinChi {
  const _$LopTinChiImpl(
      {required this.id,
      this.maLopHoc,
      required this.maHocPhan,
      this.idGiangVien,
      this.idLopTruong,
      this.urlTruyCap,
      this.hocKy,
      this.phongHoc,
      this.ngayHoc,
      this.tietBatDau,
      this.tietKetThuc,
      this.trangThai = TrangThaiLopTinChi.binhThuong})
      : super._();

  factory _$LopTinChiImpl.fromJson(Map<String, dynamic> json) =>
      _$$LopTinChiImplFromJson(json);

  @override
  final int id;
  @override
  final String? maLopHoc;
  @override
  final String maHocPhan;
  @override
  final int? idGiangVien;
  @override
  final int? idLopTruong;
  @override
  final String? urlTruyCap;
  @override
  final String? hocKy;
  @override
  final String? phongHoc;
  @override
  final NgayTrongTuan? ngayHoc;
  @override
  final int? tietBatDau;
  @override
  final int? tietKetThuc;
  @override
  @JsonKey()
  final TrangThaiLopTinChi trangThai;

  @override
  String toString() {
    return 'LopTinChi(id: $id, maLopHoc: $maLopHoc, maHocPhan: $maHocPhan, idGiangVien: $idGiangVien, idLopTruong: $idLopTruong, urlTruyCap: $urlTruyCap, hocKy: $hocKy, phongHoc: $phongHoc, ngayHoc: $ngayHoc, tietBatDau: $tietBatDau, tietKetThuc: $tietKetThuc, trangThai: $trangThai)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LopTinChiImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.maLopHoc, maLopHoc) ||
                other.maLopHoc == maLopHoc) &&
            (identical(other.maHocPhan, maHocPhan) ||
                other.maHocPhan == maHocPhan) &&
            (identical(other.idGiangVien, idGiangVien) ||
                other.idGiangVien == idGiangVien) &&
            (identical(other.idLopTruong, idLopTruong) ||
                other.idLopTruong == idLopTruong) &&
            (identical(other.urlTruyCap, urlTruyCap) ||
                other.urlTruyCap == urlTruyCap) &&
            (identical(other.hocKy, hocKy) || other.hocKy == hocKy) &&
            (identical(other.phongHoc, phongHoc) ||
                other.phongHoc == phongHoc) &&
            (identical(other.ngayHoc, ngayHoc) || other.ngayHoc == ngayHoc) &&
            (identical(other.tietBatDau, tietBatDau) ||
                other.tietBatDau == tietBatDau) &&
            (identical(other.tietKetThuc, tietKetThuc) ||
                other.tietKetThuc == tietKetThuc) &&
            (identical(other.trangThai, trangThai) ||
                other.trangThai == trangThai));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      maLopHoc,
      maHocPhan,
      idGiangVien,
      idLopTruong,
      urlTruyCap,
      hocKy,
      phongHoc,
      ngayHoc,
      tietBatDau,
      tietKetThuc,
      trangThai);

  /// Create a copy of LopTinChi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LopTinChiImplCopyWith<_$LopTinChiImpl> get copyWith =>
      __$$LopTinChiImplCopyWithImpl<_$LopTinChiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LopTinChiImplToJson(
      this,
    );
  }
}

abstract class _LopTinChi extends LopTinChi {
  const factory _LopTinChi(
      {required final int id,
      final String? maLopHoc,
      required final String maHocPhan,
      final int? idGiangVien,
      final int? idLopTruong,
      final String? urlTruyCap,
      final String? hocKy,
      final String? phongHoc,
      final NgayTrongTuan? ngayHoc,
      final int? tietBatDau,
      final int? tietKetThuc,
      final TrangThaiLopTinChi trangThai}) = _$LopTinChiImpl;
  const _LopTinChi._() : super._();

  factory _LopTinChi.fromJson(Map<String, dynamic> json) =
      _$LopTinChiImpl.fromJson;

  @override
  int get id;
  @override
  String? get maLopHoc;
  @override
  String get maHocPhan;
  @override
  int? get idGiangVien;
  @override
  int? get idLopTruong;
  @override
  String? get urlTruyCap;
  @override
  String? get hocKy;
  @override
  String? get phongHoc;
  @override
  NgayTrongTuan? get ngayHoc;
  @override
  int? get tietBatDau;
  @override
  int? get tietKetThuc;
  @override
  TrangThaiLopTinChi get trangThai;

  /// Create a copy of LopTinChi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LopTinChiImplCopyWith<_$LopTinChiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NamTaiChinh _$NamTaiChinhFromJson(Map<String, dynamic> json) {
  return _NamTaiChinh.fromJson(json);
}

/// @nodoc
mixin _$NamTaiChinh {
  String get nam => throw _privateConstructorUsedError;
  int get tienChuTichLVTS => throw _privateConstructorUsedError;
  int get tienThuKyLVTS => throw _privateConstructorUsedError;
  int get tienUyVienLVTS => throw _privateConstructorUsedError;
  int get tienPhanBienLVTS => throw _privateConstructorUsedError;
  int get tienChuTichXT => throw _privateConstructorUsedError;
  int get tienThuKyXT => throw _privateConstructorUsedError;
  int get tienUyVienXT => throw _privateConstructorUsedError;
  int get tienChuTichDCNCS => throw _privateConstructorUsedError;
  int get tienThuKyDCNCS => throw _privateConstructorUsedError;

  /// Serializes this NamTaiChinh to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NamTaiChinh
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NamTaiChinhCopyWith<NamTaiChinh> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamTaiChinhCopyWith<$Res> {
  factory $NamTaiChinhCopyWith(
          NamTaiChinh value, $Res Function(NamTaiChinh) then) =
      _$NamTaiChinhCopyWithImpl<$Res, NamTaiChinh>;
  @useResult
  $Res call(
      {String nam,
      int tienChuTichLVTS,
      int tienThuKyLVTS,
      int tienUyVienLVTS,
      int tienPhanBienLVTS,
      int tienChuTichXT,
      int tienThuKyXT,
      int tienUyVienXT,
      int tienChuTichDCNCS,
      int tienThuKyDCNCS});
}

/// @nodoc
class _$NamTaiChinhCopyWithImpl<$Res, $Val extends NamTaiChinh>
    implements $NamTaiChinhCopyWith<$Res> {
  _$NamTaiChinhCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NamTaiChinh
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nam = null,
    Object? tienChuTichLVTS = null,
    Object? tienThuKyLVTS = null,
    Object? tienUyVienLVTS = null,
    Object? tienPhanBienLVTS = null,
    Object? tienChuTichXT = null,
    Object? tienThuKyXT = null,
    Object? tienUyVienXT = null,
    Object? tienChuTichDCNCS = null,
    Object? tienThuKyDCNCS = null,
  }) {
    return _then(_value.copyWith(
      nam: null == nam
          ? _value.nam
          : nam // ignore: cast_nullable_to_non_nullable
              as String,
      tienChuTichLVTS: null == tienChuTichLVTS
          ? _value.tienChuTichLVTS
          : tienChuTichLVTS // ignore: cast_nullable_to_non_nullable
              as int,
      tienThuKyLVTS: null == tienThuKyLVTS
          ? _value.tienThuKyLVTS
          : tienThuKyLVTS // ignore: cast_nullable_to_non_nullable
              as int,
      tienUyVienLVTS: null == tienUyVienLVTS
          ? _value.tienUyVienLVTS
          : tienUyVienLVTS // ignore: cast_nullable_to_non_nullable
              as int,
      tienPhanBienLVTS: null == tienPhanBienLVTS
          ? _value.tienPhanBienLVTS
          : tienPhanBienLVTS // ignore: cast_nullable_to_non_nullable
              as int,
      tienChuTichXT: null == tienChuTichXT
          ? _value.tienChuTichXT
          : tienChuTichXT // ignore: cast_nullable_to_non_nullable
              as int,
      tienThuKyXT: null == tienThuKyXT
          ? _value.tienThuKyXT
          : tienThuKyXT // ignore: cast_nullable_to_non_nullable
              as int,
      tienUyVienXT: null == tienUyVienXT
          ? _value.tienUyVienXT
          : tienUyVienXT // ignore: cast_nullable_to_non_nullable
              as int,
      tienChuTichDCNCS: null == tienChuTichDCNCS
          ? _value.tienChuTichDCNCS
          : tienChuTichDCNCS // ignore: cast_nullable_to_non_nullable
              as int,
      tienThuKyDCNCS: null == tienThuKyDCNCS
          ? _value.tienThuKyDCNCS
          : tienThuKyDCNCS // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NamTaiChinhImplCopyWith<$Res>
    implements $NamTaiChinhCopyWith<$Res> {
  factory _$$NamTaiChinhImplCopyWith(
          _$NamTaiChinhImpl value, $Res Function(_$NamTaiChinhImpl) then) =
      __$$NamTaiChinhImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nam,
      int tienChuTichLVTS,
      int tienThuKyLVTS,
      int tienUyVienLVTS,
      int tienPhanBienLVTS,
      int tienChuTichXT,
      int tienThuKyXT,
      int tienUyVienXT,
      int tienChuTichDCNCS,
      int tienThuKyDCNCS});
}

/// @nodoc
class __$$NamTaiChinhImplCopyWithImpl<$Res>
    extends _$NamTaiChinhCopyWithImpl<$Res, _$NamTaiChinhImpl>
    implements _$$NamTaiChinhImplCopyWith<$Res> {
  __$$NamTaiChinhImplCopyWithImpl(
      _$NamTaiChinhImpl _value, $Res Function(_$NamTaiChinhImpl) _then)
      : super(_value, _then);

  /// Create a copy of NamTaiChinh
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nam = null,
    Object? tienChuTichLVTS = null,
    Object? tienThuKyLVTS = null,
    Object? tienUyVienLVTS = null,
    Object? tienPhanBienLVTS = null,
    Object? tienChuTichXT = null,
    Object? tienThuKyXT = null,
    Object? tienUyVienXT = null,
    Object? tienChuTichDCNCS = null,
    Object? tienThuKyDCNCS = null,
  }) {
    return _then(_$NamTaiChinhImpl(
      nam: null == nam
          ? _value.nam
          : nam // ignore: cast_nullable_to_non_nullable
              as String,
      tienChuTichLVTS: null == tienChuTichLVTS
          ? _value.tienChuTichLVTS
          : tienChuTichLVTS // ignore: cast_nullable_to_non_nullable
              as int,
      tienThuKyLVTS: null == tienThuKyLVTS
          ? _value.tienThuKyLVTS
          : tienThuKyLVTS // ignore: cast_nullable_to_non_nullable
              as int,
      tienUyVienLVTS: null == tienUyVienLVTS
          ? _value.tienUyVienLVTS
          : tienUyVienLVTS // ignore: cast_nullable_to_non_nullable
              as int,
      tienPhanBienLVTS: null == tienPhanBienLVTS
          ? _value.tienPhanBienLVTS
          : tienPhanBienLVTS // ignore: cast_nullable_to_non_nullable
              as int,
      tienChuTichXT: null == tienChuTichXT
          ? _value.tienChuTichXT
          : tienChuTichXT // ignore: cast_nullable_to_non_nullable
              as int,
      tienThuKyXT: null == tienThuKyXT
          ? _value.tienThuKyXT
          : tienThuKyXT // ignore: cast_nullable_to_non_nullable
              as int,
      tienUyVienXT: null == tienUyVienXT
          ? _value.tienUyVienXT
          : tienUyVienXT // ignore: cast_nullable_to_non_nullable
              as int,
      tienChuTichDCNCS: null == tienChuTichDCNCS
          ? _value.tienChuTichDCNCS
          : tienChuTichDCNCS // ignore: cast_nullable_to_non_nullable
              as int,
      tienThuKyDCNCS: null == tienThuKyDCNCS
          ? _value.tienThuKyDCNCS
          : tienThuKyDCNCS // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NamTaiChinhImpl implements _NamTaiChinh {
  const _$NamTaiChinhImpl(
      {required this.nam,
      required this.tienChuTichLVTS,
      required this.tienThuKyLVTS,
      required this.tienUyVienLVTS,
      required this.tienPhanBienLVTS,
      required this.tienChuTichXT,
      required this.tienThuKyXT,
      required this.tienUyVienXT,
      required this.tienChuTichDCNCS,
      required this.tienThuKyDCNCS});

  factory _$NamTaiChinhImpl.fromJson(Map<String, dynamic> json) =>
      _$$NamTaiChinhImplFromJson(json);

  @override
  final String nam;
  @override
  final int tienChuTichLVTS;
  @override
  final int tienThuKyLVTS;
  @override
  final int tienUyVienLVTS;
  @override
  final int tienPhanBienLVTS;
  @override
  final int tienChuTichXT;
  @override
  final int tienThuKyXT;
  @override
  final int tienUyVienXT;
  @override
  final int tienChuTichDCNCS;
  @override
  final int tienThuKyDCNCS;

  @override
  String toString() {
    return 'NamTaiChinh(nam: $nam, tienChuTichLVTS: $tienChuTichLVTS, tienThuKyLVTS: $tienThuKyLVTS, tienUyVienLVTS: $tienUyVienLVTS, tienPhanBienLVTS: $tienPhanBienLVTS, tienChuTichXT: $tienChuTichXT, tienThuKyXT: $tienThuKyXT, tienUyVienXT: $tienUyVienXT, tienChuTichDCNCS: $tienChuTichDCNCS, tienThuKyDCNCS: $tienThuKyDCNCS)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NamTaiChinhImpl &&
            (identical(other.nam, nam) || other.nam == nam) &&
            (identical(other.tienChuTichLVTS, tienChuTichLVTS) ||
                other.tienChuTichLVTS == tienChuTichLVTS) &&
            (identical(other.tienThuKyLVTS, tienThuKyLVTS) ||
                other.tienThuKyLVTS == tienThuKyLVTS) &&
            (identical(other.tienUyVienLVTS, tienUyVienLVTS) ||
                other.tienUyVienLVTS == tienUyVienLVTS) &&
            (identical(other.tienPhanBienLVTS, tienPhanBienLVTS) ||
                other.tienPhanBienLVTS == tienPhanBienLVTS) &&
            (identical(other.tienChuTichXT, tienChuTichXT) ||
                other.tienChuTichXT == tienChuTichXT) &&
            (identical(other.tienThuKyXT, tienThuKyXT) ||
                other.tienThuKyXT == tienThuKyXT) &&
            (identical(other.tienUyVienXT, tienUyVienXT) ||
                other.tienUyVienXT == tienUyVienXT) &&
            (identical(other.tienChuTichDCNCS, tienChuTichDCNCS) ||
                other.tienChuTichDCNCS == tienChuTichDCNCS) &&
            (identical(other.tienThuKyDCNCS, tienThuKyDCNCS) ||
                other.tienThuKyDCNCS == tienThuKyDCNCS));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nam,
      tienChuTichLVTS,
      tienThuKyLVTS,
      tienUyVienLVTS,
      tienPhanBienLVTS,
      tienChuTichXT,
      tienThuKyXT,
      tienUyVienXT,
      tienChuTichDCNCS,
      tienThuKyDCNCS);

  /// Create a copy of NamTaiChinh
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NamTaiChinhImplCopyWith<_$NamTaiChinhImpl> get copyWith =>
      __$$NamTaiChinhImplCopyWithImpl<_$NamTaiChinhImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NamTaiChinhImplToJson(
      this,
    );
  }
}

abstract class _NamTaiChinh implements NamTaiChinh {
  const factory _NamTaiChinh(
      {required final String nam,
      required final int tienChuTichLVTS,
      required final int tienThuKyLVTS,
      required final int tienUyVienLVTS,
      required final int tienPhanBienLVTS,
      required final int tienChuTichXT,
      required final int tienThuKyXT,
      required final int tienUyVienXT,
      required final int tienChuTichDCNCS,
      required final int tienThuKyDCNCS}) = _$NamTaiChinhImpl;

  factory _NamTaiChinh.fromJson(Map<String, dynamic> json) =
      _$NamTaiChinhImpl.fromJson;

  @override
  String get nam;
  @override
  int get tienChuTichLVTS;
  @override
  int get tienThuKyLVTS;
  @override
  int get tienUyVienLVTS;
  @override
  int get tienPhanBienLVTS;
  @override
  int get tienChuTichXT;
  @override
  int get tienThuKyXT;
  @override
  int get tienUyVienXT;
  @override
  int get tienChuTichDCNCS;
  @override
  int get tienThuKyDCNCS;

  /// Create a copy of NamTaiChinh
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NamTaiChinhImplCopyWith<_$NamTaiChinhImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NhomChuyenMon _$NhomChuyenMonFromJson(Map<String, dynamic> json) {
  return _NhomChuyenMon.fromJson(json);
}

/// @nodoc
mixin _$NhomChuyenMon {
  int get id => throw _privateConstructorUsedError;
  String get tenNhom => throw _privateConstructorUsedError;

  /// Serializes this NhomChuyenMon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NhomChuyenMon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NhomChuyenMonCopyWith<NhomChuyenMon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NhomChuyenMonCopyWith<$Res> {
  factory $NhomChuyenMonCopyWith(
          NhomChuyenMon value, $Res Function(NhomChuyenMon) then) =
      _$NhomChuyenMonCopyWithImpl<$Res, NhomChuyenMon>;
  @useResult
  $Res call({int id, String tenNhom});
}

/// @nodoc
class _$NhomChuyenMonCopyWithImpl<$Res, $Val extends NhomChuyenMon>
    implements $NhomChuyenMonCopyWith<$Res> {
  _$NhomChuyenMonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NhomChuyenMon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenNhom = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tenNhom: null == tenNhom
          ? _value.tenNhom
          : tenNhom // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NhomChuyenMonImplCopyWith<$Res>
    implements $NhomChuyenMonCopyWith<$Res> {
  factory _$$NhomChuyenMonImplCopyWith(
          _$NhomChuyenMonImpl value, $Res Function(_$NhomChuyenMonImpl) then) =
      __$$NhomChuyenMonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String tenNhom});
}

/// @nodoc
class __$$NhomChuyenMonImplCopyWithImpl<$Res>
    extends _$NhomChuyenMonCopyWithImpl<$Res, _$NhomChuyenMonImpl>
    implements _$$NhomChuyenMonImplCopyWith<$Res> {
  __$$NhomChuyenMonImplCopyWithImpl(
      _$NhomChuyenMonImpl _value, $Res Function(_$NhomChuyenMonImpl) _then)
      : super(_value, _then);

  /// Create a copy of NhomChuyenMon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenNhom = null,
  }) {
    return _then(_$NhomChuyenMonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tenNhom: null == tenNhom
          ? _value.tenNhom
          : tenNhom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NhomChuyenMonImpl implements _NhomChuyenMon {
  const _$NhomChuyenMonImpl({required this.id, required this.tenNhom});

  factory _$NhomChuyenMonImpl.fromJson(Map<String, dynamic> json) =>
      _$$NhomChuyenMonImplFromJson(json);

  @override
  final int id;
  @override
  final String tenNhom;

  @override
  String toString() {
    return 'NhomChuyenMon(id: $id, tenNhom: $tenNhom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NhomChuyenMonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenNhom, tenNhom) || other.tenNhom == tenNhom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, tenNhom);

  /// Create a copy of NhomChuyenMon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NhomChuyenMonImplCopyWith<_$NhomChuyenMonImpl> get copyWith =>
      __$$NhomChuyenMonImplCopyWithImpl<_$NhomChuyenMonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NhomChuyenMonImplToJson(
      this,
    );
  }
}

abstract class _NhomChuyenMon implements NhomChuyenMon {
  const factory _NhomChuyenMon(
      {required final int id,
      required final String tenNhom}) = _$NhomChuyenMonImpl;

  factory _NhomChuyenMon.fromJson(Map<String, dynamic> json) =
      _$NhomChuyenMonImpl.fromJson;

  @override
  int get id;
  @override
  String get tenNhom;

  /// Create a copy of NhomChuyenMon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NhomChuyenMonImplCopyWith<_$NhomChuyenMonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NienKhoa _$NienKhoaFromJson(Map<String, dynamic> json) {
  return _NienKhoa.fromJson(json);
}

/// @nodoc
mixin _$NienKhoa {
  String get nienKhoa => throw _privateConstructorUsedError;

  /// Serializes this NienKhoa to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NienKhoa
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NienKhoaCopyWith<NienKhoa> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NienKhoaCopyWith<$Res> {
  factory $NienKhoaCopyWith(NienKhoa value, $Res Function(NienKhoa) then) =
      _$NienKhoaCopyWithImpl<$Res, NienKhoa>;
  @useResult
  $Res call({String nienKhoa});
}

/// @nodoc
class _$NienKhoaCopyWithImpl<$Res, $Val extends NienKhoa>
    implements $NienKhoaCopyWith<$Res> {
  _$NienKhoaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NienKhoa
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nienKhoa = null,
  }) {
    return _then(_value.copyWith(
      nienKhoa: null == nienKhoa
          ? _value.nienKhoa
          : nienKhoa // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NienKhoaImplCopyWith<$Res>
    implements $NienKhoaCopyWith<$Res> {
  factory _$$NienKhoaImplCopyWith(
          _$NienKhoaImpl value, $Res Function(_$NienKhoaImpl) then) =
      __$$NienKhoaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nienKhoa});
}

/// @nodoc
class __$$NienKhoaImplCopyWithImpl<$Res>
    extends _$NienKhoaCopyWithImpl<$Res, _$NienKhoaImpl>
    implements _$$NienKhoaImplCopyWith<$Res> {
  __$$NienKhoaImplCopyWithImpl(
      _$NienKhoaImpl _value, $Res Function(_$NienKhoaImpl) _then)
      : super(_value, _then);

  /// Create a copy of NienKhoa
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nienKhoa = null,
  }) {
    return _then(_$NienKhoaImpl(
      nienKhoa: null == nienKhoa
          ? _value.nienKhoa
          : nienKhoa // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NienKhoaImpl implements _NienKhoa {
  const _$NienKhoaImpl({required this.nienKhoa});

  factory _$NienKhoaImpl.fromJson(Map<String, dynamic> json) =>
      _$$NienKhoaImplFromJson(json);

  @override
  final String nienKhoa;

  @override
  String toString() {
    return 'NienKhoa(nienKhoa: $nienKhoa)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NienKhoaImpl &&
            (identical(other.nienKhoa, nienKhoa) ||
                other.nienKhoa == nienKhoa));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nienKhoa);

  /// Create a copy of NienKhoa
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NienKhoaImplCopyWith<_$NienKhoaImpl> get copyWith =>
      __$$NienKhoaImplCopyWithImpl<_$NienKhoaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NienKhoaImplToJson(
      this,
    );
  }
}

abstract class _NienKhoa implements NienKhoa {
  const factory _NienKhoa({required final String nienKhoa}) = _$NienKhoaImpl;

  factory _NienKhoa.fromJson(Map<String, dynamic> json) =
      _$NienKhoaImpl.fromJson;

  @override
  String get nienKhoa;

  /// Create a copy of NienKhoa
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NienKhoaImplCopyWith<_$NienKhoaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TieuBanXetTuyen _$TieuBanXetTuyenFromJson(Map<String, dynamic> json) {
  return _TieuBanXetTuyen.fromJson(json);
}

/// @nodoc
mixin _$TieuBanXetTuyen {
  int get id => throw _privateConstructorUsedError;
  String get nam => throw _privateConstructorUsedError;
  int get idChuTich => throw _privateConstructorUsedError;
  int get idThuKy => throw _privateConstructorUsedError;
  int get idUyVien1 => throw _privateConstructorUsedError;
  int get idUyVien2 => throw _privateConstructorUsedError;
  int get idUyVien3 => throw _privateConstructorUsedError;

  /// Serializes this TieuBanXetTuyen to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TieuBanXetTuyen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TieuBanXetTuyenCopyWith<TieuBanXetTuyen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TieuBanXetTuyenCopyWith<$Res> {
  factory $TieuBanXetTuyenCopyWith(
          TieuBanXetTuyen value, $Res Function(TieuBanXetTuyen) then) =
      _$TieuBanXetTuyenCopyWithImpl<$Res, TieuBanXetTuyen>;
  @useResult
  $Res call(
      {int id,
      String nam,
      int idChuTich,
      int idThuKy,
      int idUyVien1,
      int idUyVien2,
      int idUyVien3});
}

/// @nodoc
class _$TieuBanXetTuyenCopyWithImpl<$Res, $Val extends TieuBanXetTuyen>
    implements $TieuBanXetTuyenCopyWith<$Res> {
  _$TieuBanXetTuyenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TieuBanXetTuyen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nam = null,
    Object? idChuTich = null,
    Object? idThuKy = null,
    Object? idUyVien1 = null,
    Object? idUyVien2 = null,
    Object? idUyVien3 = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nam: null == nam
          ? _value.nam
          : nam // ignore: cast_nullable_to_non_nullable
              as String,
      idChuTich: null == idChuTich
          ? _value.idChuTich
          : idChuTich // ignore: cast_nullable_to_non_nullable
              as int,
      idThuKy: null == idThuKy
          ? _value.idThuKy
          : idThuKy // ignore: cast_nullable_to_non_nullable
              as int,
      idUyVien1: null == idUyVien1
          ? _value.idUyVien1
          : idUyVien1 // ignore: cast_nullable_to_non_nullable
              as int,
      idUyVien2: null == idUyVien2
          ? _value.idUyVien2
          : idUyVien2 // ignore: cast_nullable_to_non_nullable
              as int,
      idUyVien3: null == idUyVien3
          ? _value.idUyVien3
          : idUyVien3 // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TieuBanXetTuyenImplCopyWith<$Res>
    implements $TieuBanXetTuyenCopyWith<$Res> {
  factory _$$TieuBanXetTuyenImplCopyWith(_$TieuBanXetTuyenImpl value,
          $Res Function(_$TieuBanXetTuyenImpl) then) =
      __$$TieuBanXetTuyenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nam,
      int idChuTich,
      int idThuKy,
      int idUyVien1,
      int idUyVien2,
      int idUyVien3});
}

/// @nodoc
class __$$TieuBanXetTuyenImplCopyWithImpl<$Res>
    extends _$TieuBanXetTuyenCopyWithImpl<$Res, _$TieuBanXetTuyenImpl>
    implements _$$TieuBanXetTuyenImplCopyWith<$Res> {
  __$$TieuBanXetTuyenImplCopyWithImpl(
      _$TieuBanXetTuyenImpl _value, $Res Function(_$TieuBanXetTuyenImpl) _then)
      : super(_value, _then);

  /// Create a copy of TieuBanXetTuyen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nam = null,
    Object? idChuTich = null,
    Object? idThuKy = null,
    Object? idUyVien1 = null,
    Object? idUyVien2 = null,
    Object? idUyVien3 = null,
  }) {
    return _then(_$TieuBanXetTuyenImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nam: null == nam
          ? _value.nam
          : nam // ignore: cast_nullable_to_non_nullable
              as String,
      idChuTich: null == idChuTich
          ? _value.idChuTich
          : idChuTich // ignore: cast_nullable_to_non_nullable
              as int,
      idThuKy: null == idThuKy
          ? _value.idThuKy
          : idThuKy // ignore: cast_nullable_to_non_nullable
              as int,
      idUyVien1: null == idUyVien1
          ? _value.idUyVien1
          : idUyVien1 // ignore: cast_nullable_to_non_nullable
              as int,
      idUyVien2: null == idUyVien2
          ? _value.idUyVien2
          : idUyVien2 // ignore: cast_nullable_to_non_nullable
              as int,
      idUyVien3: null == idUyVien3
          ? _value.idUyVien3
          : idUyVien3 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TieuBanXetTuyenImpl extends _TieuBanXetTuyen {
  const _$TieuBanXetTuyenImpl(
      {required this.id,
      required this.nam,
      required this.idChuTich,
      required this.idThuKy,
      required this.idUyVien1,
      required this.idUyVien2,
      required this.idUyVien3})
      : super._();

  factory _$TieuBanXetTuyenImpl.fromJson(Map<String, dynamic> json) =>
      _$$TieuBanXetTuyenImplFromJson(json);

  @override
  final int id;
  @override
  final String nam;
  @override
  final int idChuTich;
  @override
  final int idThuKy;
  @override
  final int idUyVien1;
  @override
  final int idUyVien2;
  @override
  final int idUyVien3;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TieuBanXetTuyenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nam, nam) || other.nam == nam) &&
            (identical(other.idChuTich, idChuTich) ||
                other.idChuTich == idChuTich) &&
            (identical(other.idThuKy, idThuKy) || other.idThuKy == idThuKy) &&
            (identical(other.idUyVien1, idUyVien1) ||
                other.idUyVien1 == idUyVien1) &&
            (identical(other.idUyVien2, idUyVien2) ||
                other.idUyVien2 == idUyVien2) &&
            (identical(other.idUyVien3, idUyVien3) ||
                other.idUyVien3 == idUyVien3));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nam, idChuTich, idThuKy,
      idUyVien1, idUyVien2, idUyVien3);

  /// Create a copy of TieuBanXetTuyen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TieuBanXetTuyenImplCopyWith<_$TieuBanXetTuyenImpl> get copyWith =>
      __$$TieuBanXetTuyenImplCopyWithImpl<_$TieuBanXetTuyenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TieuBanXetTuyenImplToJson(
      this,
    );
  }
}

abstract class _TieuBanXetTuyen extends TieuBanXetTuyen {
  const factory _TieuBanXetTuyen(
      {required final int id,
      required final String nam,
      required final int idChuTich,
      required final int idThuKy,
      required final int idUyVien1,
      required final int idUyVien2,
      required final int idUyVien3}) = _$TieuBanXetTuyenImpl;
  const _TieuBanXetTuyen._() : super._();

  factory _TieuBanXetTuyen.fromJson(Map<String, dynamic> json) =
      _$TieuBanXetTuyenImpl.fromJson;

  @override
  int get id;
  @override
  String get nam;
  @override
  int get idChuTich;
  @override
  int get idThuKy;
  @override
  int get idUyVien1;
  @override
  int get idUyVien2;
  @override
  int get idUyVien3;

  /// Create a copy of TieuBanXetTuyen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TieuBanXetTuyenImplCopyWith<_$TieuBanXetTuyenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeTaiThacSi _$DeTaiThacSiFromJson(Map<String, dynamic> json) {
  return _DeTaiThacSi.fromJson(json);
}

/// @nodoc
mixin _$DeTaiThacSi {
  int? get id => throw _privateConstructorUsedError;
  int get idGiangVien => throw _privateConstructorUsedError;
  String get tenTiengViet => throw _privateConstructorUsedError;
  String get tenTiengAnh => throw _privateConstructorUsedError;
  int? get idHocVien => throw _privateConstructorUsedError;
  int? get idChuTich => throw _privateConstructorUsedError;
  int? get idPhanBien1 => throw _privateConstructorUsedError;
  int? get idPhanBien2 => throw _privateConstructorUsedError;
  int? get idUyVien => throw _privateConstructorUsedError;
  int? get idThuKy => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get ngayGiao => throw _privateConstructorUsedError;
  String? get soQdGiao => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get hanBaoVe => throw _privateConstructorUsedError;
  String? get soQdBaoVe => throw _privateConstructorUsedError;
  @MaybeDateSerializer()
  DateTime? get ngayBaoVe => throw _privateConstructorUsedError;
  @BoolIntSerializer()
  bool get thanhToan => throw _privateConstructorUsedError;
  String? get ghiChu => throw _privateConstructorUsedError;
  String? get group => throw _privateConstructorUsedError;
  int? get nam => throw _privateConstructorUsedError;

  /// Serializes this DeTaiThacSi to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeTaiThacSi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeTaiThacSiCopyWith<DeTaiThacSi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeTaiThacSiCopyWith<$Res> {
  factory $DeTaiThacSiCopyWith(
          DeTaiThacSi value, $Res Function(DeTaiThacSi) then) =
      _$DeTaiThacSiCopyWithImpl<$Res, DeTaiThacSi>;
  @useResult
  $Res call(
      {int? id,
      int idGiangVien,
      String tenTiengViet,
      String tenTiengAnh,
      int? idHocVien,
      int? idChuTich,
      int? idPhanBien1,
      int? idPhanBien2,
      int? idUyVien,
      int? idThuKy,
      @MaybeDateSerializer() DateTime? ngayGiao,
      String? soQdGiao,
      @MaybeDateSerializer() DateTime? hanBaoVe,
      String? soQdBaoVe,
      @MaybeDateSerializer() DateTime? ngayBaoVe,
      @BoolIntSerializer() bool thanhToan,
      String? ghiChu,
      String? group,
      int? nam});
}

/// @nodoc
class _$DeTaiThacSiCopyWithImpl<$Res, $Val extends DeTaiThacSi>
    implements $DeTaiThacSiCopyWith<$Res> {
  _$DeTaiThacSiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeTaiThacSi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idGiangVien = null,
    Object? tenTiengViet = null,
    Object? tenTiengAnh = null,
    Object? idHocVien = freezed,
    Object? idChuTich = freezed,
    Object? idPhanBien1 = freezed,
    Object? idPhanBien2 = freezed,
    Object? idUyVien = freezed,
    Object? idThuKy = freezed,
    Object? ngayGiao = freezed,
    Object? soQdGiao = freezed,
    Object? hanBaoVe = freezed,
    Object? soQdBaoVe = freezed,
    Object? ngayBaoVe = freezed,
    Object? thanhToan = null,
    Object? ghiChu = freezed,
    Object? group = freezed,
    Object? nam = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      idGiangVien: null == idGiangVien
          ? _value.idGiangVien
          : idGiangVien // ignore: cast_nullable_to_non_nullable
              as int,
      tenTiengViet: null == tenTiengViet
          ? _value.tenTiengViet
          : tenTiengViet // ignore: cast_nullable_to_non_nullable
              as String,
      tenTiengAnh: null == tenTiengAnh
          ? _value.tenTiengAnh
          : tenTiengAnh // ignore: cast_nullable_to_non_nullable
              as String,
      idHocVien: freezed == idHocVien
          ? _value.idHocVien
          : idHocVien // ignore: cast_nullable_to_non_nullable
              as int?,
      idChuTich: freezed == idChuTich
          ? _value.idChuTich
          : idChuTich // ignore: cast_nullable_to_non_nullable
              as int?,
      idPhanBien1: freezed == idPhanBien1
          ? _value.idPhanBien1
          : idPhanBien1 // ignore: cast_nullable_to_non_nullable
              as int?,
      idPhanBien2: freezed == idPhanBien2
          ? _value.idPhanBien2
          : idPhanBien2 // ignore: cast_nullable_to_non_nullable
              as int?,
      idUyVien: freezed == idUyVien
          ? _value.idUyVien
          : idUyVien // ignore: cast_nullable_to_non_nullable
              as int?,
      idThuKy: freezed == idThuKy
          ? _value.idThuKy
          : idThuKy // ignore: cast_nullable_to_non_nullable
              as int?,
      ngayGiao: freezed == ngayGiao
          ? _value.ngayGiao
          : ngayGiao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soQdGiao: freezed == soQdGiao
          ? _value.soQdGiao
          : soQdGiao // ignore: cast_nullable_to_non_nullable
              as String?,
      hanBaoVe: freezed == hanBaoVe
          ? _value.hanBaoVe
          : hanBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soQdBaoVe: freezed == soQdBaoVe
          ? _value.soQdBaoVe
          : soQdBaoVe // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayBaoVe: freezed == ngayBaoVe
          ? _value.ngayBaoVe
          : ngayBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      thanhToan: null == thanhToan
          ? _value.thanhToan
          : thanhToan // ignore: cast_nullable_to_non_nullable
              as bool,
      ghiChu: freezed == ghiChu
          ? _value.ghiChu
          : ghiChu // ignore: cast_nullable_to_non_nullable
              as String?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      nam: freezed == nam
          ? _value.nam
          : nam // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeTaiThacSiImplCopyWith<$Res>
    implements $DeTaiThacSiCopyWith<$Res> {
  factory _$$DeTaiThacSiImplCopyWith(
          _$DeTaiThacSiImpl value, $Res Function(_$DeTaiThacSiImpl) then) =
      __$$DeTaiThacSiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int idGiangVien,
      String tenTiengViet,
      String tenTiengAnh,
      int? idHocVien,
      int? idChuTich,
      int? idPhanBien1,
      int? idPhanBien2,
      int? idUyVien,
      int? idThuKy,
      @MaybeDateSerializer() DateTime? ngayGiao,
      String? soQdGiao,
      @MaybeDateSerializer() DateTime? hanBaoVe,
      String? soQdBaoVe,
      @MaybeDateSerializer() DateTime? ngayBaoVe,
      @BoolIntSerializer() bool thanhToan,
      String? ghiChu,
      String? group,
      int? nam});
}

/// @nodoc
class __$$DeTaiThacSiImplCopyWithImpl<$Res>
    extends _$DeTaiThacSiCopyWithImpl<$Res, _$DeTaiThacSiImpl>
    implements _$$DeTaiThacSiImplCopyWith<$Res> {
  __$$DeTaiThacSiImplCopyWithImpl(
      _$DeTaiThacSiImpl _value, $Res Function(_$DeTaiThacSiImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeTaiThacSi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idGiangVien = null,
    Object? tenTiengViet = null,
    Object? tenTiengAnh = null,
    Object? idHocVien = freezed,
    Object? idChuTich = freezed,
    Object? idPhanBien1 = freezed,
    Object? idPhanBien2 = freezed,
    Object? idUyVien = freezed,
    Object? idThuKy = freezed,
    Object? ngayGiao = freezed,
    Object? soQdGiao = freezed,
    Object? hanBaoVe = freezed,
    Object? soQdBaoVe = freezed,
    Object? ngayBaoVe = freezed,
    Object? thanhToan = null,
    Object? ghiChu = freezed,
    Object? group = freezed,
    Object? nam = freezed,
  }) {
    return _then(_$DeTaiThacSiImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      idGiangVien: null == idGiangVien
          ? _value.idGiangVien
          : idGiangVien // ignore: cast_nullable_to_non_nullable
              as int,
      tenTiengViet: null == tenTiengViet
          ? _value.tenTiengViet
          : tenTiengViet // ignore: cast_nullable_to_non_nullable
              as String,
      tenTiengAnh: null == tenTiengAnh
          ? _value.tenTiengAnh
          : tenTiengAnh // ignore: cast_nullable_to_non_nullable
              as String,
      idHocVien: freezed == idHocVien
          ? _value.idHocVien
          : idHocVien // ignore: cast_nullable_to_non_nullable
              as int?,
      idChuTich: freezed == idChuTich
          ? _value.idChuTich
          : idChuTich // ignore: cast_nullable_to_non_nullable
              as int?,
      idPhanBien1: freezed == idPhanBien1
          ? _value.idPhanBien1
          : idPhanBien1 // ignore: cast_nullable_to_non_nullable
              as int?,
      idPhanBien2: freezed == idPhanBien2
          ? _value.idPhanBien2
          : idPhanBien2 // ignore: cast_nullable_to_non_nullable
              as int?,
      idUyVien: freezed == idUyVien
          ? _value.idUyVien
          : idUyVien // ignore: cast_nullable_to_non_nullable
              as int?,
      idThuKy: freezed == idThuKy
          ? _value.idThuKy
          : idThuKy // ignore: cast_nullable_to_non_nullable
              as int?,
      ngayGiao: freezed == ngayGiao
          ? _value.ngayGiao
          : ngayGiao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soQdGiao: freezed == soQdGiao
          ? _value.soQdGiao
          : soQdGiao // ignore: cast_nullable_to_non_nullable
              as String?,
      hanBaoVe: freezed == hanBaoVe
          ? _value.hanBaoVe
          : hanBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soQdBaoVe: freezed == soQdBaoVe
          ? _value.soQdBaoVe
          : soQdBaoVe // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayBaoVe: freezed == ngayBaoVe
          ? _value.ngayBaoVe
          : ngayBaoVe // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      thanhToan: null == thanhToan
          ? _value.thanhToan
          : thanhToan // ignore: cast_nullable_to_non_nullable
              as bool,
      ghiChu: freezed == ghiChu
          ? _value.ghiChu
          : ghiChu // ignore: cast_nullable_to_non_nullable
              as String?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      nam: freezed == nam
          ? _value.nam
          : nam // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeTaiThacSiImpl extends _DeTaiThacSi {
  const _$DeTaiThacSiImpl(
      {this.id,
      required this.idGiangVien,
      required this.tenTiengViet,
      required this.tenTiengAnh,
      this.idHocVien,
      this.idChuTich,
      this.idPhanBien1,
      this.idPhanBien2,
      this.idUyVien,
      this.idThuKy,
      @MaybeDateSerializer() this.ngayGiao,
      this.soQdGiao,
      @MaybeDateSerializer() this.hanBaoVe,
      this.soQdBaoVe,
      @MaybeDateSerializer() this.ngayBaoVe,
      @BoolIntSerializer() this.thanhToan = false,
      this.ghiChu,
      this.group,
      this.nam})
      : super._();

  factory _$DeTaiThacSiImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeTaiThacSiImplFromJson(json);

  @override
  final int? id;
  @override
  final int idGiangVien;
  @override
  final String tenTiengViet;
  @override
  final String tenTiengAnh;
  @override
  final int? idHocVien;
  @override
  final int? idChuTich;
  @override
  final int? idPhanBien1;
  @override
  final int? idPhanBien2;
  @override
  final int? idUyVien;
  @override
  final int? idThuKy;
  @override
  @MaybeDateSerializer()
  final DateTime? ngayGiao;
  @override
  final String? soQdGiao;
  @override
  @MaybeDateSerializer()
  final DateTime? hanBaoVe;
  @override
  final String? soQdBaoVe;
  @override
  @MaybeDateSerializer()
  final DateTime? ngayBaoVe;
  @override
  @JsonKey()
  @BoolIntSerializer()
  final bool thanhToan;
  @override
  final String? ghiChu;
  @override
  final String? group;
  @override
  final int? nam;

  @override
  String toString() {
    return 'DeTaiThacSi(id: $id, idGiangVien: $idGiangVien, tenTiengViet: $tenTiengViet, tenTiengAnh: $tenTiengAnh, idHocVien: $idHocVien, idChuTich: $idChuTich, idPhanBien1: $idPhanBien1, idPhanBien2: $idPhanBien2, idUyVien: $idUyVien, idThuKy: $idThuKy, ngayGiao: $ngayGiao, soQdGiao: $soQdGiao, hanBaoVe: $hanBaoVe, soQdBaoVe: $soQdBaoVe, ngayBaoVe: $ngayBaoVe, thanhToan: $thanhToan, ghiChu: $ghiChu, group: $group, nam: $nam)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeTaiThacSiImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idGiangVien, idGiangVien) ||
                other.idGiangVien == idGiangVien) &&
            (identical(other.tenTiengViet, tenTiengViet) ||
                other.tenTiengViet == tenTiengViet) &&
            (identical(other.tenTiengAnh, tenTiengAnh) ||
                other.tenTiengAnh == tenTiengAnh) &&
            (identical(other.idHocVien, idHocVien) ||
                other.idHocVien == idHocVien) &&
            (identical(other.idChuTich, idChuTich) ||
                other.idChuTich == idChuTich) &&
            (identical(other.idPhanBien1, idPhanBien1) ||
                other.idPhanBien1 == idPhanBien1) &&
            (identical(other.idPhanBien2, idPhanBien2) ||
                other.idPhanBien2 == idPhanBien2) &&
            (identical(other.idUyVien, idUyVien) ||
                other.idUyVien == idUyVien) &&
            (identical(other.idThuKy, idThuKy) || other.idThuKy == idThuKy) &&
            (identical(other.ngayGiao, ngayGiao) ||
                other.ngayGiao == ngayGiao) &&
            (identical(other.soQdGiao, soQdGiao) ||
                other.soQdGiao == soQdGiao) &&
            (identical(other.hanBaoVe, hanBaoVe) ||
                other.hanBaoVe == hanBaoVe) &&
            (identical(other.soQdBaoVe, soQdBaoVe) ||
                other.soQdBaoVe == soQdBaoVe) &&
            (identical(other.ngayBaoVe, ngayBaoVe) ||
                other.ngayBaoVe == ngayBaoVe) &&
            (identical(other.thanhToan, thanhToan) ||
                other.thanhToan == thanhToan) &&
            (identical(other.ghiChu, ghiChu) || other.ghiChu == ghiChu) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.nam, nam) || other.nam == nam));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        idGiangVien,
        tenTiengViet,
        tenTiengAnh,
        idHocVien,
        idChuTich,
        idPhanBien1,
        idPhanBien2,
        idUyVien,
        idThuKy,
        ngayGiao,
        soQdGiao,
        hanBaoVe,
        soQdBaoVe,
        ngayBaoVe,
        thanhToan,
        ghiChu,
        group,
        nam
      ]);

  /// Create a copy of DeTaiThacSi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeTaiThacSiImplCopyWith<_$DeTaiThacSiImpl> get copyWith =>
      __$$DeTaiThacSiImplCopyWithImpl<_$DeTaiThacSiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeTaiThacSiImplToJson(
      this,
    );
  }
}

abstract class _DeTaiThacSi extends DeTaiThacSi {
  const factory _DeTaiThacSi(
      {final int? id,
      required final int idGiangVien,
      required final String tenTiengViet,
      required final String tenTiengAnh,
      final int? idHocVien,
      final int? idChuTich,
      final int? idPhanBien1,
      final int? idPhanBien2,
      final int? idUyVien,
      final int? idThuKy,
      @MaybeDateSerializer() final DateTime? ngayGiao,
      final String? soQdGiao,
      @MaybeDateSerializer() final DateTime? hanBaoVe,
      final String? soQdBaoVe,
      @MaybeDateSerializer() final DateTime? ngayBaoVe,
      @BoolIntSerializer() final bool thanhToan,
      final String? ghiChu,
      final String? group,
      final int? nam}) = _$DeTaiThacSiImpl;
  const _DeTaiThacSi._() : super._();

  factory _DeTaiThacSi.fromJson(Map<String, dynamic> json) =
      _$DeTaiThacSiImpl.fromJson;

  @override
  int? get id;
  @override
  int get idGiangVien;
  @override
  String get tenTiengViet;
  @override
  String get tenTiengAnh;
  @override
  int? get idHocVien;
  @override
  int? get idChuTich;
  @override
  int? get idPhanBien1;
  @override
  int? get idPhanBien2;
  @override
  int? get idUyVien;
  @override
  int? get idThuKy;
  @override
  @MaybeDateSerializer()
  DateTime? get ngayGiao;
  @override
  String? get soQdGiao;
  @override
  @MaybeDateSerializer()
  DateTime? get hanBaoVe;
  @override
  String? get soQdBaoVe;
  @override
  @MaybeDateSerializer()
  DateTime? get ngayBaoVe;
  @override
  @BoolIntSerializer()
  bool get thanhToan;
  @override
  String? get ghiChu;
  @override
  String? get group;
  @override
  int? get nam;

  /// Create a copy of DeTaiThacSi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeTaiThacSiImplCopyWith<_$DeTaiThacSiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
