// Run
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import '../datamodels.dart' show dbSession;

import '../services/sqlbuilder/sqlbuilder.dart';

part 'domain_objects.freezed.dart';
part 'domain_objects.g.dart';

@JsonEnum(valueField: "value")
enum TrangThaiLopTinChi {
  huy(1),
  binhThuong(0);

  final int value;
  const TrangThaiLopTinChi(this.value);

  @override
  toString() => switch (this) {
        TrangThaiLopTinChi.huy => "Hủy",
        TrangThaiLopTinChi.binhThuong => "Bình thường",
      };
}

@JsonEnum(valueField: "value")
enum TrangThaiHocVien {
  xetTuyen('xt', 'Xét tuyển'),
  dangHoc('hoc', 'Đang học'),
  nghiHoc('nghi', 'Thôi học'),
  totNghiep('tn', 'Đã tốt nghiệp');

  final String value;
  final String label;
  const TrangThaiHocVien(this.value, this.label);

  @override
  toString() => label;
}

mixin EnumWithLabel {
  String get label;

  @override
  toString() => label;
}

@JsonEnum(valueField: "value")
enum KhoiKienThuc with EnumWithLabel {
  khac('khac', 'Khác'),
  cn('cn', 'Cử nhân'),
  daiCuongThs('dc-ths', 'Đại cương'),
  nganhRong('nganh-rong', 'Kiến thức ngành (rộng)'),
  nganhNangCao('nganh-nangcao', 'Kiến thức ngành (nâng cao)'),
  tuChonBatBuoc('tc-batbuoc', 'Tự chọn bắt buộc'),
  tcChonTuDo('tc-tudo', 'Tự chọn tự do');

  static const String table = "KhoiKienThuc";
  final String value;
  final String label;
  const KhoiKienThuc(this.value, this.label);
}

@JsonEnum(valueField: "value")
enum GioiTinh {
  nam(value: "M", label: "Nam"),
  nu(value: "F", label: "Nữ");

  final String value;
  final String label;
  const GioiTinh({required this.value, required this.label});

  @override
  toString() => label;
}

@JsonEnum(valueField: "value")
enum DienTuyenSinh {
  tichHop(value: "cn-ths", label: "Tích hợp Cử nhân - Thạc sĩ"),
  xetTuyen(value: "xt", label: "Xét tuyển");

  final String value;
  final String label;
  static const table = "DienTuyenSinh";
  const DienTuyenSinh({required this.value, required this.label});

  @override
  toString() => label;
}

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

Future<void> _commitValue<T>({
  required String table,
  required String idField,
  required Map<String, Object?> Function() toJson,
}) async {
  final data = toJson();
  final id = data[idField];
  data.remove(idField);
  return dbSession((db) async {
    db.update(
      table,
      data,
      where: "$idField = ?",
      whereArgs: [id],
    );
  });
}

Future<void> _create<T>({
  required String table,
  required String idField,
  required Map<String, Object?> Function() toJson,
}) async {
  final data = toJson();
  data.remove(idField);
  return dbSession((db) async {
    db.insert(table, data);
  });
}

Future<void> _delete<T>({
  required String table,
  required String idField,
  required Map<String, Object?> Function() toJson,
}) async {
  final id = toJson()[idField];
  return dbSession((db) async {
    db.delete(table, where: "$idField = ?", whereArgs: [id]);
  });
}

@freezed
class GiangVien with _$GiangVien {
  static const table = "GiangVien";
  const GiangVien._();
  factory GiangVien({
    required int id,
    required String hoTen,
    String? maCanBo,
    String? donVi,
    String? chuyenNganh,
    GioiTinh? gioiTinh,
    String? hocHam,
    String? hocVi,
    int? namNhanTs,
    String? sdt,
    String? email,
    String? cccd,
    @DateSerializer() DateTime? ngaySinh,
    String? stk,
    String? nganHang,
    String? mst,
    String? note,
    int? ncm,
  }) = _GiangVien;

  factory GiangVien.fromJson(Map<String, dynamic> json) =>
      _$GiangVienFromJson(json);

  // Tìm giảng viên theo ID trong DB
  static Future<GiangVien?> getById(id) async {
    final query = SelectQuery()
      ..from(GiangVien.table)
      ..where("id = ?", [id])
      ..selectAll();
    final sql = query.build();
    return dbSession((Database db) async {
      final rows = await db.rawQuery(sql);
      if (rows.isEmpty) {
        return null;
      } else {
        return GiangVien.fromJson(rows.single);
      }
    });
  }

  // Họ tên, học hàm, học vị
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
  const HocKy._();
  const factory HocKy({
    required String hocKy,
    required String moDangKy,
    required String dongDangKy,
    required String batDauHoc,
    required String ketThucHoc,
    required String hanNhapDiem,
  }) = _HocKy;

  factory HocKy.fromJson(Map<String, dynamic> json) => _$HocKyFromJson(json);

  @override
  String toString() => hocKy;
}

@freezed
class HocPhan with _$HocPhan {
  static const table = "HocPhan";
  const HocPhan._();
  const factory HocPhan({
    required String maHocPhan,
    required String tenTiengViet,
    required String tenTiengAnh,
    required int soTinChi,
    required KhoiKienThuc khoiKienThuc,
    required String khoiLuong,
  }) = _HocPhan;

  factory HocPhan.fromJson(Map<String, dynamic> json) =>
      _$HocPhanFromJson(json);

  @override
  toString() => "$maHocPhan $tenTiengViet ($soTinChi TC)";
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
  static const table = "HocVien";
  const HocVien._();
  const factory HocVien({
    required int id,
    String? soHoSo,
    String? nienKhoa,
    String? maHocVien,
    required String hoTen,
    @DateSerializer() DateTime? ngaySinh,
    GioiTinh? gioiTinh,
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
    required TrangThaiHocVien maTrangThai,
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
    DienTuyenSinh? idDienTuyenSinh,
    @Default(0) int thanhToanXetTuyen,
  }) = _HocVien;

  // We left these field in the constructor
  // so that it maps nicely to the database.
  DienTuyenSinh? get dienTuyenSinh => idDienTuyenSinh;
  TrangThaiHocVien? get trangThai => maTrangThai;

  Future<void> create() =>
      _create(table: HocVien.table, idField: "id", toJson: toJson);
  Future<void> update() =>
      _commitValue(table: HocVien.table, idField: "id", toJson: toJson);
  Future<void> delete() =>
      _delete(table: HocVien.table, idField: "id", toJson: toJson);

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
class LopTinChi with _$LopTinChi {
  static const table = "LopTinChi";
  const LopTinChi._();
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
    @Default(TrangThaiLopTinChi.binhThuong) TrangThaiLopTinChi trangThai,
  }) = _LopTinChi;

  factory LopTinChi.fromJson(Map<String, dynamic> json) =>
      _$LopTinChiFromJson(json);

  Future<void> commitValue() => _commitValue(
        table: LopTinChi.table,
        idField: "id",
        toJson: toJson,
      );

  Future<HocKy> get hocKyObject async {
    return dbSession((db) async {
      final rows = await db.query(
        HocKy.table,
        where: "hocKy = ?",
        whereArgs: [hocKy],
      );
      return HocKy.fromJson(rows[0]);
    });
  }

  Future<HocPhan> get hocPhan async {
    return dbSession((db) async {
      final rows = await db.query(
        "HocPhan",
        where: "maHocPhan = ?",
        whereArgs: [maHocPhan],
      );
      return HocPhan.fromJson(rows[0]);
    });
  }

  Future<GiangVien?> get giangVien async {
    if (idGiangVien == null) {
      return null;
    }
    return dbSession((db) async {
      final rows = await db.query(
        GiangVien.table,
        where: "id = ?",
        whereArgs: [idGiangVien],
      );
      return GiangVien.fromJson(rows[0]);
    });
  }
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
  const TieuBanXetTuyen._();
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

  static Future<List<TieuBanXetTuyen>> all() async {
    return dbSession((db) async {
      final rows = await db.query(table, orderBy: "nam DESC");
      return [for (final json in rows) TieuBanXetTuyen.fromJson(json)];
    });
  }

  static Future<TieuBanXetTuyen?> getById(id) async {
    return dbSession((db) async {
      final rows = await db.query(table, where: "id = ?", whereArgs: [id]);
      if (rows.isEmpty) {
        return null;
      } else {
        final json = rows.single;
        return TieuBanXetTuyen.fromJson(json);
      }
    });
  }

  @override
  String toString() => "Tiểu ban xét tuyển năm $nam";

  Future<GiangVien> get chuTich async {
    return await GiangVien.getById(idChuTich) as GiangVien;
  }

  Future<GiangVien> get thuKy async {
    return await GiangVien.getById(idThuKy) as GiangVien;
  }

  Future<GiangVien> get uyVien1 async {
    return await GiangVien.getById(idUyVien1) as GiangVien;
  }

  Future<GiangVien> get uyVien2 async {
    return await GiangVien.getById(idUyVien2) as GiangVien;
  }

  Future<GiangVien> get uyVien3 async {
    return await GiangVien.getById(idUyVien3) as GiangVien;
  }
}

@freezed
class DeTaiThacSi with _$DeTaiThacSi {
  const DeTaiThacSi._();

  static const table = "DeTaiThacSi";
  const factory DeTaiThacSi({
    int? id,
    required int idGiangVien,
    required String tenTiengViet,
    required String tenTiengAnh,
  }) = _DeTaiThacSi;

  factory DeTaiThacSi.fromJson(Map<String, dynamic> json) =>
      _$DeTaiThacSiFromJson(json);
}
