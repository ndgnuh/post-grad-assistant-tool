// Run
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'dtypes.freezed.dart';
part 'dtypes.g.dart';

class DateSerializer implements JsonConverter<DateTime?, String?> {
  const DateSerializer();

  @override
  DateTime? fromJson(String? inputString) {
    switch (inputString) {
      case String dString:
        try {
          return DateFormat('yyyy/MM/dd').parse(dString);
        } on Exception {
          return null;
        }
      default:
        return null;
    }
  }

  @override
  String? toJson(DateTime? date) {
    switch (date) {
      case DateTime d:
        return DateFormat('yyyy/MM/dd').format(d);
      default:
        return null;
    }
  }
}

@freezed
class GiangVien with _$GiangVien {
  static const table = "GiangVien";
  factory GiangVien({
    required int id,
    required String hoTen,
    String? maCanBo,
    String? donVi,
    String? chuyenNganh,
    String? gioiTinh,
    String? hocHam,
    String? hocVi,
    int? namNhanTs,
    String? sdt,
    String? email,
    String? cccd,
    String? ngaySinh,
    String? stk,
    String? nganHang,
    String? mst,
    String? note,
    int? ncm,
  }) = _GiangVien;

  factory GiangVien.fromJson(Map<String, dynamic> json) =>
      _$GiangVienFromJson(json);

  // Added constructor. Must not have any parameter
  const GiangVien._();
  String get hoTenChucDanh {
    return switch ((hocHam, hocVi)) {
      (String a, String b) => "$a. $b. $hoTen",
      (String a, null) => "$a. $hoTen",
      (null, String a) => "$a. $hoTen",
      _ => hoTen,
    };
  }
}

@freezed
class DangKyHoc with _$DangKyHoc {
  static const table = "DangKyHoc";
  factory DangKyHoc({
    required int maLopHoc,
    required int maHocVien,
    double? diemQuaTrinh,
    double? diemCuoiKy,
  }) = _DangKyHoc;

  factory DangKyHoc.fromJson(Map<String, dynamic> json) =>
      _$DangKyHocFromJson(json);
}

@freezed
class HocHam with _$HocHam {
  static const table = "HocHam";
  factory HocHam({
    required String hocHam,
    required String tenHocHam,
  }) = _HocHam;

  factory HocHam.fromJson(Map<String, dynamic> json) => _$HocHamFromJson(json);
}

@freezed
class HocKy with _$HocKy {
  static const table = "HocKy";
  const factory HocKy({
    required String hocKy,
    required String moDangKy,
    required String dongDangKy,
    required String batDauHoc,
    required String ketThucHoc,
    required String hanNhapDiem,
  }) = _HocKy;

  factory HocKy.fromJson(Map<String, dynamic> json) => _$HocKyFromJson(json);
}

@freezed
class HocPhan with _$HocPhan {
  static const table = "HocPhan";
  const factory HocPhan({
    required String maHocPhan,
    required String tenTiengViet,
    required String tenTiengAnh,
    required int soTinChi,
    required String khoiKienThuc,
    required String khoiLuong,
  }) = _HocPhan;

  factory HocPhan.fromJson(Map<String, dynamic> json) =>
      _$HocPhanFromJson(json);
}

@freezed
class HocVi with _$HocVi {
  static const table = "HocVi";
  const factory HocVi({
    required String hocVi,
    required String tenHocVi,
  }) = _HocVi;

  factory HocVi.fromJson(Map<String, dynamic> json) => _$HocViFromJson(json);
}

@freezed
class HocVien with _$HocVien {
  const factory HocVien({
    required int id,
    String? soHoSo,
    String? nienKhoa,
    String? maHocVien,
    required String hoTen,
    @DateSerializer() DateTime? ngaySinh,
    String? gioiTinh,
    String? noiSinh,
    String? email,
    String? truongTotNghiepDaiHoc,
    String? nganhTotNghiepDaiHoc,
    String? heTotNghiepDaiHoc,
    String? xepLoaiTotNghiepDaiHoc,
    @DateSerializer() DateTime? ngayTotNghiepDaiHoc,
    String? dinhHuongChuyenSau,
    String? hocPhanDuocMien,
    String? nganhDaoTaoThacSi,
    String? dienThoai,
    required String maTrangThai,
    String? deTaiLuanVanTiengViet,
    String? deTaiLuanVanTiengAnh,
    @DateSerializer() DateTime? ngayGiaoDeTai,
    String? soQuyetDinhGiao,
    @DateSerializer() DateTime? ngayBaoVe,
    int? soQuyetDinhBaoVe,
    @DateSerializer() DateTime? ngayKyQuyetDinhBaoVe,
    int? idGiangVienHuongDan,
    @DateSerializer() DateTime? hanBaoVe,
    @Default(0) int lanGiaHan,
    int? idTieuBanXetTuyen,
    String? idDienTuyenSinh,
    @Default(0) int thanhToanXetTuyen,
  }) = _HocVien;

  factory HocVien.fromJson(Map<String, dynamic> json) =>
      _$HocVienFromJson(json);
}

@freezed
class HoiDongLVTS with _$HoiDongLVTS {
  static const table = "HoiDongLVTS";
  const factory HoiDongLVTS({
    required int id,
    int? idHocVien,
    int? idChuTich,
    int? idThuKy,
    int? idPhanBien1,
    int? idPhanBien2,
    int? idUyVien,
    String? ngayBaoVe,
    String? soQuyetDinh,
    @Default(1) int lanBaoVe,
    @Default(0) int thanhToan,
    String? nam,
  }) = _HoiDongLVTS;

  factory HoiDongLVTS.fromJson(Map<String, dynamic> json) =>
      _$HoiDongLVTSFromJson(json);
}

@freezed
class KhoiKienThuc with _$KhoiKienThuc {
  static const table = "KhoiKienThuc";
  const factory KhoiKienThuc({
    required String khoiKienThuc,
    required String tenKhoiKienThuc,
  }) = _KhoiKienThuc;

  factory KhoiKienThuc.fromJson(Map<String, dynamic> json) =>
      _$KhoiKienThucFromJson(json);
}

@freezed
class LopTinChi with _$LopTinChi {
  static const table = "LopTinChi";
  const factory LopTinChi({
    required int id,
    String? maLopHoc,
    String? maHocPhan,
    int? idGiangVien,
    int? idLopTruong,
    String? urlTruyCap,
    String? hocKy,
    String? phongHoc,
    int? ngayHoc,
    int? tietBatDau,
    int? tietKetThuc,
    @Default(0) int trangThai,
  }) = _LopTinChi;

  factory LopTinChi.fromJson(Map<String, dynamic> json) =>
      _$LopTinChiFromJson(json);
}

@freezed
class NamTaiChinh with _$NamTaiChinh {
  static const table = "NamTaiChinh";
  const factory NamTaiChinh({
    required String nam,
    required int tienChuTichLVTS,
    required int tienThuKyLVTS,
    required int tienUyVienLVTS,
    required int tienPhanBienLVTS,
    required int tienChuTichXT,
    required int tienThuKyXT,
    required int tienUyVienXT,
    required int tienChuTichDCNCS,
    required int tienThuKyDCNCS,
  }) = _NamTaiChinh;

  factory NamTaiChinh.fromJson(Map<String, dynamic> json) =>
      _$NamTaiChinhFromJson(json);
}

@freezed
class NhomChuyenMon with _$NhomChuyenMon {
  static const table = "NhomChuyenMon";
  const factory NhomChuyenMon({
    required int id,
    required String tenNhom,
  }) = _NhomChuyenMon;

  factory NhomChuyenMon.fromJson(Map<String, dynamic> json) =>
      _$NhomChuyenMonFromJson(json);
}

@freezed
class NienKhoa with _$NienKhoa {
  static const table = "NienKhoa";
  const factory NienKhoa({
    required String nienKhoa,
  }) = _NienKhoa;

  factory NienKhoa.fromJson(Map<String, dynamic> json) =>
      _$NienKhoaFromJson(json);
}

@freezed
class TieuBanXetTuyen with _$TieuBanXetTuyen {
  static const table = "TieuBanXetTuyen";
  const factory TieuBanXetTuyen({
    required int id,
    required String nam,
    required int idChuTich,
    required int idThuKy,
    required int idUyVien1,
    required int idUyVien2,
    required int idUyVien3,
  }) = _TieuBanXetTuyen;

  factory TieuBanXetTuyen.fromJson(Map<String, dynamic> json) =>
      _$TieuBanXetTuyenFromJson(json);
}

@freezed
class TrangThaiHocVien with _$TrangThaiHocVien {
  static const table = "TrangThaiHocVien";
  const factory TrangThaiHocVien({
    required String maTrangThai,
    required String tenTrangThai,
  }) = _TrangThaiHocVien;

  factory TrangThaiHocVien.fromJson(Map<String, dynamic> json) =>
      _$TrangThaiHocVienFromJson(json);
}

@freezed
class DienTuyenSinh with _$DienTuyenSinh {
  static const table = "DienTuyenSinh";
  const factory DienTuyenSinh({
    required String id,
    required String ten,
  }) = _DienTuyenSinh;

  const DienTuyenSinh._();

  @override
  String toString() => ten;

  factory DienTuyenSinh.fromJson(Map<String, dynamic> json) =>
      _$DienTuyenSinhFromJson(json);
}
