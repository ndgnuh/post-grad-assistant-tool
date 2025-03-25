// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiangVienImpl _$$GiangVienImplFromJson(Map<String, dynamic> json) =>
    _$GiangVienImpl(
      id: (json['id'] as num).toInt(),
      hoTen: json['hoTen'] as String,
      maCanBo: json['maCanBo'] as String?,
      donVi: json['donVi'] as String?,
      chuyenNganh: json['chuyenNganh'] as String?,
      gioiTinh: $enumDecodeNullable(_$GioiTinhEnumMap, json['gioiTinh']),
      hocHam: json['hocHam'] as String?,
      hocVi: json['hocVi'] as String?,
      namNhanTs: (json['namNhanTs'] as num?)?.toInt(),
      sdt: json['sdt'] as String?,
      email: json['email'] as String?,
      cccd: json['cccd'] as String?,
      ngaySinh: const DateSerializer().fromJson(json['ngaySinh'] as String?),
      stk: json['stk'] as String?,
      nganHang: json['nganHang'] as String?,
      mst: json['mst'] as String?,
      note: json['note'] as String?,
      ncm: (json['ncm'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GiangVienImplToJson(_$GiangVienImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hoTen': instance.hoTen,
      'maCanBo': instance.maCanBo,
      'donVi': instance.donVi,
      'chuyenNganh': instance.chuyenNganh,
      'gioiTinh': _$GioiTinhEnumMap[instance.gioiTinh],
      'hocHam': instance.hocHam,
      'hocVi': instance.hocVi,
      'namNhanTs': instance.namNhanTs,
      'sdt': instance.sdt,
      'email': instance.email,
      'cccd': instance.cccd,
      'ngaySinh': const DateSerializer().toJson(instance.ngaySinh),
      'stk': instance.stk,
      'nganHang': instance.nganHang,
      'mst': instance.mst,
      'note': instance.note,
      'ncm': instance.ncm,
    };

const _$GioiTinhEnumMap = {
  GioiTinh.nam: 'M',
  GioiTinh.nu: 'F',
};

_$DangKyHocImpl _$$DangKyHocImplFromJson(Map<String, dynamic> json) =>
    _$DangKyHocImpl(
      maLopHoc: (json['maLopHoc'] as num).toInt(),
      maHocVien: (json['maHocVien'] as num).toInt(),
      diemQuaTrinh: (json['diemQuaTrinh'] as num?)?.toDouble(),
      diemCuoiKy: (json['diemCuoiKy'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DangKyHocImplToJson(_$DangKyHocImpl instance) =>
    <String, dynamic>{
      'maLopHoc': instance.maLopHoc,
      'maHocVien': instance.maHocVien,
      'diemQuaTrinh': instance.diemQuaTrinh,
      'diemCuoiKy': instance.diemCuoiKy,
    };

_$HocHamImpl _$$HocHamImplFromJson(Map<String, dynamic> json) => _$HocHamImpl(
      hocHam: json['hocHam'] as String,
      tenHocHam: json['tenHocHam'] as String,
    );

Map<String, dynamic> _$$HocHamImplToJson(_$HocHamImpl instance) =>
    <String, dynamic>{
      'hocHam': instance.hocHam,
      'tenHocHam': instance.tenHocHam,
    };

_$HocKyImpl _$$HocKyImplFromJson(Map<String, dynamic> json) => _$HocKyImpl(
      hocKy: json['hocKy'] as String,
      moDangKy: json['moDangKy'] as String,
      dongDangKy: json['dongDangKy'] as String,
      batDauHoc: json['batDauHoc'] as String,
      ketThucHoc: json['ketThucHoc'] as String,
      hanNhapDiem: json['hanNhapDiem'] as String,
    );

Map<String, dynamic> _$$HocKyImplToJson(_$HocKyImpl instance) =>
    <String, dynamic>{
      'hocKy': instance.hocKy,
      'moDangKy': instance.moDangKy,
      'dongDangKy': instance.dongDangKy,
      'batDauHoc': instance.batDauHoc,
      'ketThucHoc': instance.ketThucHoc,
      'hanNhapDiem': instance.hanNhapDiem,
    };

_$HocPhanImpl _$$HocPhanImplFromJson(Map<String, dynamic> json) =>
    _$HocPhanImpl(
      maHocPhan: json['maHocPhan'] as String,
      tenTiengViet: json['tenTiengViet'] as String,
      tenTiengAnh: json['tenTiengAnh'] as String,
      soTinChi: (json['soTinChi'] as num).toInt(),
      khoiKienThuc: $enumDecode(_$KhoiKienThucEnumMap, json['khoiKienThuc']),
      khoiLuong: json['khoiLuong'] as String,
    );

Map<String, dynamic> _$$HocPhanImplToJson(_$HocPhanImpl instance) =>
    <String, dynamic>{
      'maHocPhan': instance.maHocPhan,
      'tenTiengViet': instance.tenTiengViet,
      'tenTiengAnh': instance.tenTiengAnh,
      'soTinChi': instance.soTinChi,
      'khoiKienThuc': _$KhoiKienThucEnumMap[instance.khoiKienThuc]!,
      'khoiLuong': instance.khoiLuong,
    };

const _$KhoiKienThucEnumMap = {
  KhoiKienThuc.khac: 'khac',
  KhoiKienThuc.cn: 'cn',
  KhoiKienThuc.daiCuongThs: 'dc-ths',
  KhoiKienThuc.nganhRong: 'nganh-rong',
  KhoiKienThuc.nganhNangCao: 'nganh-nangcao',
  KhoiKienThuc.tuChonBatBuoc: 'tc-batbuoc',
  KhoiKienThuc.tcChonTuDo: 'tc-tudo',
};

_$HocViImpl _$$HocViImplFromJson(Map<String, dynamic> json) => _$HocViImpl(
      hocVi: json['hocVi'] as String,
      tenHocVi: json['tenHocVi'] as String,
    );

Map<String, dynamic> _$$HocViImplToJson(_$HocViImpl instance) =>
    <String, dynamic>{
      'hocVi': instance.hocVi,
      'tenHocVi': instance.tenHocVi,
    };

_$HocVienImpl _$$HocVienImplFromJson(Map<String, dynamic> json) =>
    _$HocVienImpl(
      id: (json['id'] as num).toInt(),
      soHoSo: json['soHoSo'] as String?,
      nienKhoa: json['nienKhoa'] as String?,
      maHocVien: json['maHocVien'] as String?,
      hoTen: json['hoTen'] as String,
      ngaySinh: const DateSerializer().fromJson(json['ngaySinh'] as String?),
      gioiTinh: $enumDecodeNullable(_$GioiTinhEnumMap, json['gioiTinh']),
      noiSinh: json['noiSinh'] as String?,
      email: json['email'] as String?,
      truongTotNghiepDaiHoc: json['truongTotNghiepDaiHoc'] as String?,
      nganhTotNghiepDaiHoc: json['nganhTotNghiepDaiHoc'] as String?,
      heTotNghiepDaiHoc: json['heTotNghiepDaiHoc'] as String?,
      xepLoaiTotNghiepDaiHoc: json['xepLoaiTotNghiepDaiHoc'] as String?,
      ngayTotNghiepDaiHoc: const DateSerializer()
          .fromJson(json['ngayTotNghiepDaiHoc'] as String?),
      dinhHuongChuyenSau: json['dinhHuongChuyenSau'] as String?,
      hocPhanDuocMien: json['hocPhanDuocMien'] as String?,
      nganhDaoTaoThacSi: json['nganhDaoTaoThacSi'] as String?,
      dienThoai: json['dienThoai'] as String?,
      maTrangThai: $enumDecode(_$TrangThaiHocVienEnumMap, json['maTrangThai']),
      deTaiLuanVanTiengViet: json['deTaiLuanVanTiengViet'] as String?,
      deTaiLuanVanTiengAnh: json['deTaiLuanVanTiengAnh'] as String?,
      ngayGiaoDeTai:
          const DateSerializer().fromJson(json['ngayGiaoDeTai'] as String?),
      soQuyetDinhGiao: json['soQuyetDinhGiao'] as String?,
      ngayBaoVe: const DateSerializer().fromJson(json['ngayBaoVe'] as String?),
      soQuyetDinhBaoVe: (json['soQuyetDinhBaoVe'] as num?)?.toInt(),
      ngayKyQuyetDinhBaoVe: const DateSerializer()
          .fromJson(json['ngayKyQuyetDinhBaoVe'] as String?),
      idGiangVienHuongDan: (json['idGiangVienHuongDan'] as num?)?.toInt(),
      hanBaoVe: const DateSerializer().fromJson(json['hanBaoVe'] as String?),
      lanGiaHan: (json['lanGiaHan'] as num?)?.toInt() ?? 0,
      idTieuBanXetTuyen: (json['idTieuBanXetTuyen'] as num?)?.toInt(),
      idDienTuyenSinh:
          $enumDecodeNullable(_$DienTuyenSinhEnumMap, json['idDienTuyenSinh']),
      thanhToanXetTuyen: (json['thanhToanXetTuyen'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$HocVienImplToJson(_$HocVienImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'soHoSo': instance.soHoSo,
      'nienKhoa': instance.nienKhoa,
      'maHocVien': instance.maHocVien,
      'hoTen': instance.hoTen,
      'ngaySinh': const DateSerializer().toJson(instance.ngaySinh),
      'gioiTinh': _$GioiTinhEnumMap[instance.gioiTinh],
      'noiSinh': instance.noiSinh,
      'email': instance.email,
      'truongTotNghiepDaiHoc': instance.truongTotNghiepDaiHoc,
      'nganhTotNghiepDaiHoc': instance.nganhTotNghiepDaiHoc,
      'heTotNghiepDaiHoc': instance.heTotNghiepDaiHoc,
      'xepLoaiTotNghiepDaiHoc': instance.xepLoaiTotNghiepDaiHoc,
      'ngayTotNghiepDaiHoc':
          const DateSerializer().toJson(instance.ngayTotNghiepDaiHoc),
      'dinhHuongChuyenSau': instance.dinhHuongChuyenSau,
      'hocPhanDuocMien': instance.hocPhanDuocMien,
      'nganhDaoTaoThacSi': instance.nganhDaoTaoThacSi,
      'dienThoai': instance.dienThoai,
      'maTrangThai': _$TrangThaiHocVienEnumMap[instance.maTrangThai]!,
      'deTaiLuanVanTiengViet': instance.deTaiLuanVanTiengViet,
      'deTaiLuanVanTiengAnh': instance.deTaiLuanVanTiengAnh,
      'ngayGiaoDeTai': const DateSerializer().toJson(instance.ngayGiaoDeTai),
      'soQuyetDinhGiao': instance.soQuyetDinhGiao,
      'ngayBaoVe': const DateSerializer().toJson(instance.ngayBaoVe),
      'soQuyetDinhBaoVe': instance.soQuyetDinhBaoVe,
      'ngayKyQuyetDinhBaoVe':
          const DateSerializer().toJson(instance.ngayKyQuyetDinhBaoVe),
      'idGiangVienHuongDan': instance.idGiangVienHuongDan,
      'hanBaoVe': const DateSerializer().toJson(instance.hanBaoVe),
      'lanGiaHan': instance.lanGiaHan,
      'idTieuBanXetTuyen': instance.idTieuBanXetTuyen,
      'idDienTuyenSinh': _$DienTuyenSinhEnumMap[instance.idDienTuyenSinh],
      'thanhToanXetTuyen': instance.thanhToanXetTuyen,
    };

const _$TrangThaiHocVienEnumMap = {
  TrangThaiHocVien.xetTuyen: 'xt',
  TrangThaiHocVien.dangHoc: 'hoc',
  TrangThaiHocVien.nghiHoc: 'nghi',
  TrangThaiHocVien.totNghiep: 'tn',
};

const _$DienTuyenSinhEnumMap = {
  DienTuyenSinh.tichHop: 'cn-ths',
  DienTuyenSinh.xetTuyen: 'xt',
};

_$HoiDongLVTSImpl _$$HoiDongLVTSImplFromJson(Map<String, dynamic> json) =>
    _$HoiDongLVTSImpl(
      id: (json['id'] as num).toInt(),
      idHocVien: (json['idHocVien'] as num?)?.toInt(),
      idChuTich: (json['idChuTich'] as num?)?.toInt(),
      idThuKy: (json['idThuKy'] as num?)?.toInt(),
      idPhanBien1: (json['idPhanBien1'] as num?)?.toInt(),
      idPhanBien2: (json['idPhanBien2'] as num?)?.toInt(),
      idUyVien: (json['idUyVien'] as num?)?.toInt(),
      ngayBaoVe: json['ngayBaoVe'] as String?,
      soQuyetDinh: json['soQuyetDinh'] as String?,
      lanBaoVe: (json['lanBaoVe'] as num?)?.toInt() ?? 1,
      thanhToan: (json['thanhToan'] as num?)?.toInt() ?? 0,
      nam: json['nam'] as String?,
    );

Map<String, dynamic> _$$HoiDongLVTSImplToJson(_$HoiDongLVTSImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idHocVien': instance.idHocVien,
      'idChuTich': instance.idChuTich,
      'idThuKy': instance.idThuKy,
      'idPhanBien1': instance.idPhanBien1,
      'idPhanBien2': instance.idPhanBien2,
      'idUyVien': instance.idUyVien,
      'ngayBaoVe': instance.ngayBaoVe,
      'soQuyetDinh': instance.soQuyetDinh,
      'lanBaoVe': instance.lanBaoVe,
      'thanhToan': instance.thanhToan,
      'nam': instance.nam,
    };

_$LopTinChiImpl _$$LopTinChiImplFromJson(Map<String, dynamic> json) =>
    _$LopTinChiImpl(
      id: (json['id'] as num).toInt(),
      maLopHoc: json['maLopHoc'] as String?,
      maHocPhan: json['maHocPhan'] as String?,
      idGiangVien: (json['idGiangVien'] as num?)?.toInt(),
      idLopTruong: (json['idLopTruong'] as num?)?.toInt(),
      urlTruyCap: json['urlTruyCap'] as String?,
      hocKy: json['hocKy'] as String?,
      phongHoc: json['phongHoc'] as String?,
      ngayHoc: (json['ngayHoc'] as num?)?.toInt(),
      tietBatDau: (json['tietBatDau'] as num?)?.toInt(),
      tietKetThuc: (json['tietKetThuc'] as num?)?.toInt(),
      trangThai:
          $enumDecodeNullable(_$TrangThaiLopTinChiEnumMap, json['trangThai']) ??
              TrangThaiLopTinChi.binhThuong,
    );

Map<String, dynamic> _$$LopTinChiImplToJson(_$LopTinChiImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'maLopHoc': instance.maLopHoc,
      'maHocPhan': instance.maHocPhan,
      'idGiangVien': instance.idGiangVien,
      'idLopTruong': instance.idLopTruong,
      'urlTruyCap': instance.urlTruyCap,
      'hocKy': instance.hocKy,
      'phongHoc': instance.phongHoc,
      'ngayHoc': instance.ngayHoc,
      'tietBatDau': instance.tietBatDau,
      'tietKetThuc': instance.tietKetThuc,
      'trangThai': _$TrangThaiLopTinChiEnumMap[instance.trangThai]!,
    };

const _$TrangThaiLopTinChiEnumMap = {
  TrangThaiLopTinChi.huy: 1,
  TrangThaiLopTinChi.binhThuong: 0,
};

_$NamTaiChinhImpl _$$NamTaiChinhImplFromJson(Map<String, dynamic> json) =>
    _$NamTaiChinhImpl(
      nam: json['nam'] as String,
      tienChuTichLVTS: (json['tienChuTichLVTS'] as num).toInt(),
      tienThuKyLVTS: (json['tienThuKyLVTS'] as num).toInt(),
      tienUyVienLVTS: (json['tienUyVienLVTS'] as num).toInt(),
      tienPhanBienLVTS: (json['tienPhanBienLVTS'] as num).toInt(),
      tienChuTichXT: (json['tienChuTichXT'] as num).toInt(),
      tienThuKyXT: (json['tienThuKyXT'] as num).toInt(),
      tienUyVienXT: (json['tienUyVienXT'] as num).toInt(),
      tienChuTichDCNCS: (json['tienChuTichDCNCS'] as num).toInt(),
      tienThuKyDCNCS: (json['tienThuKyDCNCS'] as num).toInt(),
    );

Map<String, dynamic> _$$NamTaiChinhImplToJson(_$NamTaiChinhImpl instance) =>
    <String, dynamic>{
      'nam': instance.nam,
      'tienChuTichLVTS': instance.tienChuTichLVTS,
      'tienThuKyLVTS': instance.tienThuKyLVTS,
      'tienUyVienLVTS': instance.tienUyVienLVTS,
      'tienPhanBienLVTS': instance.tienPhanBienLVTS,
      'tienChuTichXT': instance.tienChuTichXT,
      'tienThuKyXT': instance.tienThuKyXT,
      'tienUyVienXT': instance.tienUyVienXT,
      'tienChuTichDCNCS': instance.tienChuTichDCNCS,
      'tienThuKyDCNCS': instance.tienThuKyDCNCS,
    };

_$NhomChuyenMonImpl _$$NhomChuyenMonImplFromJson(Map<String, dynamic> json) =>
    _$NhomChuyenMonImpl(
      id: (json['id'] as num).toInt(),
      tenNhom: json['tenNhom'] as String,
    );

Map<String, dynamic> _$$NhomChuyenMonImplToJson(_$NhomChuyenMonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenNhom': instance.tenNhom,
    };

_$NienKhoaImpl _$$NienKhoaImplFromJson(Map<String, dynamic> json) =>
    _$NienKhoaImpl(
      nienKhoa: json['nienKhoa'] as String,
    );

Map<String, dynamic> _$$NienKhoaImplToJson(_$NienKhoaImpl instance) =>
    <String, dynamic>{
      'nienKhoa': instance.nienKhoa,
    };

_$TieuBanXetTuyenImpl _$$TieuBanXetTuyenImplFromJson(
        Map<String, dynamic> json) =>
    _$TieuBanXetTuyenImpl(
      id: (json['id'] as num).toInt(),
      nam: json['nam'] as String,
      idChuTich: (json['idChuTich'] as num).toInt(),
      idThuKy: (json['idThuKy'] as num).toInt(),
      idUyVien1: (json['idUyVien1'] as num).toInt(),
      idUyVien2: (json['idUyVien2'] as num).toInt(),
      idUyVien3: (json['idUyVien3'] as num).toInt(),
    );

Map<String, dynamic> _$$TieuBanXetTuyenImplToJson(
        _$TieuBanXetTuyenImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nam': instance.nam,
      'idChuTich': instance.idChuTich,
      'idThuKy': instance.idThuKy,
      'idUyVien1': instance.idUyVien1,
      'idUyVien2': instance.idUyVien2,
      'idUyVien3': instance.idUyVien3,
    };

_$DeTaiThacSiImpl _$$DeTaiThacSiImplFromJson(Map<String, dynamic> json) =>
    _$DeTaiThacSiImpl(
      id: (json['id'] as num?)?.toInt(),
      idGiangVien: (json['idGiangVien'] as num).toInt(),
      tenTiengViet: json['tenTiengViet'] as String,
      tenTiengAnh: json['tenTiengAnh'] as String,
    );

Map<String, dynamic> _$$DeTaiThacSiImplToJson(_$DeTaiThacSiImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idGiangVien': instance.idGiangVien,
      'tenTiengViet': instance.tenTiengViet,
      'tenTiengAnh': instance.tenTiengAnh,
    };
