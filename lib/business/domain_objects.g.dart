// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DangKyHoc _$DangKyHocFromJson(Map<String, dynamic> json) => _DangKyHoc(
  idLopTinChi: (json['idLopTinChi'] as num).toInt(),
  idHocVien: (json['idHocVien'] as num).toInt(),
  diemQuaTrinh: (json['diemQuaTrinh'] as num?)?.toDouble(),
  diemCuoiKy: (json['diemCuoiKy'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DangKyHocToJson(_DangKyHoc instance) =>
    <String, dynamic>{
      'idLopTinChi': instance.idLopTinChi,
      'idHocVien': instance.idHocVien,
      'diemQuaTrinh': instance.diemQuaTrinh,
      'diemCuoiKy': instance.diemCuoiKy,
    };

_ThesisProxy _$ThesisProxyFromJson(Map<String, dynamic> json) => _ThesisProxy(
  thesis: DeTaiThacSi.fromJson(json['thesis'] as Map<String, dynamic>),
  supervisor: GiangVien.fromJson(json['supervisor'] as Map<String, dynamic>),
  student: json['student'] == null
      ? null
      : HocVien.fromJson(json['student'] as Map<String, dynamic>),
  president: json['president'] == null
      ? null
      : GiangVien.fromJson(json['president'] as Map<String, dynamic>),
  reviewer1: json['reviewer1'] == null
      ? null
      : GiangVien.fromJson(json['reviewer1'] as Map<String, dynamic>),
  reviewer2: json['reviewer2'] == null
      ? null
      : GiangVien.fromJson(json['reviewer2'] as Map<String, dynamic>),
  secretary: json['secretary'] == null
      ? null
      : GiangVien.fromJson(json['secretary'] as Map<String, dynamic>),
  member: json['member'] == null
      ? null
      : GiangVien.fromJson(json['member'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ThesisProxyToJson(_ThesisProxy instance) =>
    <String, dynamic>{
      'thesis': instance.thesis,
      'supervisor': instance.supervisor,
      'student': instance.student,
      'president': instance.president,
      'reviewer1': instance.reviewer1,
      'reviewer2': instance.reviewer2,
      'secretary': instance.secretary,
      'member': instance.member,
    };

_DeTaiThacSi _$DeTaiThacSiFromJson(Map<String, dynamic> json) => _DeTaiThacSi(
  id: (json['id'] as num?)?.toInt(),
  idGiangVien: (json['idGiangVien'] as num).toInt(),
  tenTiengViet: json['tenTiengViet'] as String,
  tenTiengAnh: json['tenTiengAnh'] as String,
  giangVien: GiangVien.fromJson(json['giangVien'] as Map<String, dynamic>),
  idHocVien: (json['idHocVien'] as num?)?.toInt(),
  hocVien: json['hocVien'] == null
      ? null
      : HocVien.fromJson(json['hocVien'] as Map<String, dynamic>),
  idChuTich: (json['idChuTich'] as num?)?.toInt(),
  idPhanBien1: (json['idPhanBien1'] as num?)?.toInt(),
  idPhanBien2: (json['idPhanBien2'] as num?)?.toInt(),
  idUyVien: (json['idUyVien'] as num?)?.toInt(),
  idThuKy: (json['idThuKy'] as num?)?.toInt(),
  ngayGiao: const MaybeDateSerializer().fromJson(json['ngayGiao'] as String?),
  soQdGiao: json['soQdGiao'] as String?,
  hanBaoVe: const MaybeDateSerializer().fromJson(json['hanBaoVe'] as String?),
  soQdBaoVe: json['soQdBaoVe'] as String?,
  ngayBaoVe: const MaybeDateSerializer().fromJson(json['ngayBaoVe'] as String?),
  flagTracking: json['flag_tracking'] == null
      ? false
      : const BoolIntSerializer().fromJson(
          (json['flag_tracking'] as num?)?.toInt(),
        ),
  thanhToan: json['flag_payment'] == null
      ? false
      : const BoolIntSerializer().fromJson(
          (json['flag_payment'] as num?)?.toInt(),
        ),
  ghiChu: json['ghiChu'] as String?,
  group: json['group'] as String?,
  nam: (json['nam'] as num?)?.toInt(),
);

Map<String, dynamic> _$DeTaiThacSiToJson(_DeTaiThacSi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idGiangVien': instance.idGiangVien,
      'tenTiengViet': instance.tenTiengViet,
      'tenTiengAnh': instance.tenTiengAnh,
      'giangVien': instance.giangVien,
      'idHocVien': instance.idHocVien,
      'hocVien': instance.hocVien,
      'idChuTich': instance.idChuTich,
      'idPhanBien1': instance.idPhanBien1,
      'idPhanBien2': instance.idPhanBien2,
      'idUyVien': instance.idUyVien,
      'idThuKy': instance.idThuKy,
      'ngayGiao': const MaybeDateSerializer().toJson(instance.ngayGiao),
      'soQdGiao': instance.soQdGiao,
      'hanBaoVe': const MaybeDateSerializer().toJson(instance.hanBaoVe),
      'soQdBaoVe': instance.soQdBaoVe,
      'ngayBaoVe': const MaybeDateSerializer().toJson(instance.ngayBaoVe),
      'flag_tracking': const BoolIntSerializer().toJson(instance.flagTracking),
      'flag_payment': const BoolIntSerializer().toJson(instance.thanhToan),
      'ghiChu': instance.ghiChu,
      'group': instance.group,
      'nam': instance.nam,
    };

_GiangVien _$GiangVienFromJson(Map<String, dynamic> json) => _GiangVien(
  id: (json['id'] as num).toInt(),
  hoTen: json['hoTen'] as String,
  isForeign: json['ngoaiTruong'] == null
      ? false
      : const BoolIntSerializer().fromJson(
          (json['ngoaiTruong'] as num?)?.toInt(),
        ),
  maCanBo: json['maCanBo'] as String?,
  donVi: json['donVi'] as String?,
  chuyenNganh: json['chuyenNganh'] as String?,
  gioiTinh: $enumDecodeNullable(_$GioiTinhEnumMap, json['gioiTinh']),
  hocHam: $enumDecodeNullable(_$HocHamEnumMap, json['hocHam']),
  hocVi: $enumDecodeNullable(_$HocViEnumMap, json['hocVi']),
  namNhanTs: (json['namNhanTs'] as num?)?.toInt(),
  sdt: json['sdt'] as String?,
  email: json['email'] as String?,
  cccd: json['cccd'] as String?,
  ngaySinh: const MaybeDateSerializer().fromJson(json['ngaySinh'] as String?),
  stk: json['stk'] as String?,
  nganHang: json['nganHang'] as String?,
  mst: json['mst'] as String?,
  note: json['note'] as String?,
  ncm: (json['ncm'] as num?)?.toInt(),
);

Map<String, dynamic> _$GiangVienToJson(_GiangVien instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hoTen': instance.hoTen,
      'ngoaiTruong': const BoolIntSerializer().toJson(instance.isForeign),
      'maCanBo': instance.maCanBo,
      'donVi': instance.donVi,
      'chuyenNganh': instance.chuyenNganh,
      'gioiTinh': _$GioiTinhEnumMap[instance.gioiTinh],
      'hocHam': _$HocHamEnumMap[instance.hocHam],
      'hocVi': _$HocViEnumMap[instance.hocVi],
      'namNhanTs': instance.namNhanTs,
      'sdt': instance.sdt,
      'email': instance.email,
      'cccd': instance.cccd,
      'ngaySinh': const MaybeDateSerializer().toJson(instance.ngaySinh),
      'stk': instance.stk,
      'nganHang': instance.nganHang,
      'mst': instance.mst,
      'note': instance.note,
      'ncm': instance.ncm,
    };

const _$GioiTinhEnumMap = {GioiTinh.nam: 'M', GioiTinh.nu: 'F'};

const _$HocHamEnumMap = {HocHam.gs: 'GS', HocHam.pgs: 'PGS'};

const _$HocViEnumMap = {
  HocVi.cuNhan: 'CN',
  HocVi.kySu: 'KS',
  HocVi.thacSi: 'ThS',
  HocVi.tienSi: 'TS',
  HocVi.tienSiKhoaHoc: 'TSKH',
};

_HocKy _$HocKyFromJson(Map<String, dynamic> json) => _HocKy(
  hocKy: json['hocKy'] as String,
  moDangKy: const DateSerializer().fromJson(json['moDangKy'] as String),
  dongDangKy: const DateSerializer().fromJson(json['dongDangKy'] as String),
  batDauHoc: const DateSerializer().fromJson(json['batDauHoc'] as String),
  ketThucHoc: const DateSerializer().fromJson(json['ketThucHoc'] as String),
  hanNhapDiem: const DateSerializer().fromJson(json['hanNhapDiem'] as String),
);

Map<String, dynamic> _$HocKyToJson(_HocKy instance) => <String, dynamic>{
  'hocKy': instance.hocKy,
  'moDangKy': const DateSerializer().toJson(instance.moDangKy),
  'dongDangKy': const DateSerializer().toJson(instance.dongDangKy),
  'batDauHoc': const DateSerializer().toJson(instance.batDauHoc),
  'ketThucHoc': const DateSerializer().toJson(instance.ketThucHoc),
  'hanNhapDiem': const DateSerializer().toJson(instance.hanNhapDiem),
};

_HocPhan _$HocPhanFromJson(Map<String, dynamic> json) => _HocPhan(
  maHocPhan: json['maHocPhan'] as String,
  tenTiengViet: json['tenTiengViet'] as String,
  tenTiengAnh: json['tenTiengAnh'] as String,
  soTinChi: (json['soTinChi'] as num).toInt(),
  khoiKienThuc: $enumDecode(_$KhoiKienThucEnumMap, json['khoiKienThuc']),
  khoiLuong: json['khoiLuong'] as String,
);

Map<String, dynamic> _$HocPhanToJson(_HocPhan instance) => <String, dynamic>{
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

_HocVien _$HocVienFromJson(Map<String, dynamic> json) => _HocVien(
  id: (json['id'] as num).toInt(),
  soHoSo: json['soHoSo'] as String?,
  nienKhoa: json['nienKhoa'] as String?,
  maHocVien: json['maHocVien'] as String?,
  hoTen: json['hoTen'] as String,
  ngaySinh: const MaybeDateSerializer().fromJson(json['ngaySinh'] as String?),
  gioiTinh: $enumDecodeNullable(_$GioiTinhEnumMap, json['gioiTinh']),
  noiSinh: json['noiSinh'] as String?,
  email: json['email'] as String?,
  emailHust: json['emailHust'] as String?,
  truongTotNghiepDaiHoc: json['truongTotNghiepDaiHoc'] as String?,
  nganhTotNghiepDaiHoc: json['nganhTotNghiepDaiHoc'] as String?,
  heTotNghiepDaiHoc: json['heTotNghiepDaiHoc'] as String?,
  xepLoaiTotNghiepDaiHoc: json['xepLoaiTotNghiepDaiHoc'] as String?,
  ngayTotNghiepDaiHoc: const MaybeDateSerializer().fromJson(
    json['ngayTotNghiepDaiHoc'] as String?,
  ),
  dinhHuongChuyenSau: json['dinhHuongChuyenSau'] as String?,
  hocPhanDuocMien: json['hocPhanDuocMien'] as String?,
  nganhDaoTaoThacSi: json['nganhDaoTaoThacSi'] as String?,
  dienThoai: json['dienThoai'] as String?,
  maTrangThai: $enumDecode(_$TrangThaiHocVienEnumMap, json['maTrangThai']),
  deTaiLuanVanTiengViet: json['deTaiLuanVanTiengViet'] as String?,
  deTaiLuanVanTiengAnh: json['deTaiLuanVanTiengAnh'] as String?,
  ngayGiaoDeTai: const MaybeDateSerializer().fromJson(
    json['ngayGiaoDeTai'] as String?,
  ),
  soQuyetDinhGiao: json['soQuyetDinhGiao'] as String?,
  ngayBaoVe: const MaybeDateSerializer().fromJson(json['ngayBaoVe'] as String?),
  soQuyetDinhBaoVe: (json['soQuyetDinhBaoVe'] as num?)?.toInt(),
  ngayKyQuyetDinhBaoVe: const MaybeDateSerializer().fromJson(
    json['ngayKyQuyetDinhBaoVe'] as String?,
  ),
  idGiangVienHuongDan: (json['idGiangVienHuongDan'] as num?)?.toInt(),
  hanBaoVe: const MaybeDateSerializer().fromJson(json['hanBaoVe'] as String?),
  lanGiaHan: (json['lanGiaHan'] as num?)?.toInt() ?? 0,
  idTieuBanXetTuyen: (json['idTieuBanXetTuyen'] as num?)?.toInt(),
  idDienTuyenSinh: $enumDecodeNullable(
    _$DienTuyenSinhEnumMap,
    json['idDienTuyenSinh'],
  ),
  thanhToanXetTuyen: (json['thanhToanXetTuyen'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$HocVienToJson(_HocVien instance) => <String, dynamic>{
  'id': instance.id,
  'soHoSo': instance.soHoSo,
  'nienKhoa': instance.nienKhoa,
  'maHocVien': instance.maHocVien,
  'hoTen': instance.hoTen,
  'ngaySinh': const MaybeDateSerializer().toJson(instance.ngaySinh),
  'gioiTinh': _$GioiTinhEnumMap[instance.gioiTinh],
  'noiSinh': instance.noiSinh,
  'email': instance.email,
  'emailHust': instance.emailHust,
  'truongTotNghiepDaiHoc': instance.truongTotNghiepDaiHoc,
  'nganhTotNghiepDaiHoc': instance.nganhTotNghiepDaiHoc,
  'heTotNghiepDaiHoc': instance.heTotNghiepDaiHoc,
  'xepLoaiTotNghiepDaiHoc': instance.xepLoaiTotNghiepDaiHoc,
  'ngayTotNghiepDaiHoc': const MaybeDateSerializer().toJson(
    instance.ngayTotNghiepDaiHoc,
  ),
  'dinhHuongChuyenSau': instance.dinhHuongChuyenSau,
  'hocPhanDuocMien': instance.hocPhanDuocMien,
  'nganhDaoTaoThacSi': instance.nganhDaoTaoThacSi,
  'dienThoai': instance.dienThoai,
  'maTrangThai': _$TrangThaiHocVienEnumMap[instance.maTrangThai]!,
  'deTaiLuanVanTiengViet': instance.deTaiLuanVanTiengViet,
  'deTaiLuanVanTiengAnh': instance.deTaiLuanVanTiengAnh,
  'ngayGiaoDeTai': const MaybeDateSerializer().toJson(instance.ngayGiaoDeTai),
  'soQuyetDinhGiao': instance.soQuyetDinhGiao,
  'ngayBaoVe': const MaybeDateSerializer().toJson(instance.ngayBaoVe),
  'soQuyetDinhBaoVe': instance.soQuyetDinhBaoVe,
  'ngayKyQuyetDinhBaoVe': const MaybeDateSerializer().toJson(
    instance.ngayKyQuyetDinhBaoVe,
  ),
  'idGiangVienHuongDan': instance.idGiangVienHuongDan,
  'hanBaoVe': const MaybeDateSerializer().toJson(instance.hanBaoVe),
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

_HoiDongLVTS _$HoiDongLVTSFromJson(Map<String, dynamic> json) => _HoiDongLVTS(
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

Map<String, dynamic> _$HoiDongLVTSToJson(_HoiDongLVTS instance) =>
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

_LopTinChi _$LopTinChiFromJson(Map<String, dynamic> json) => _LopTinChi(
  id: (json['id'] as num).toInt(),
  maLopHoc: json['maLopHoc'] as String?,
  maHocPhan: json['maHocPhan'] as String,
  soLuongDangKy: (json['soLuongDangKy'] as num?)?.toInt(),
  idGiangVien: (json['idGiangVien'] as num?)?.toInt(),
  idLopTruong: (json['idLopTruong'] as num?)?.toInt(),
  urlTruyCap: json['urlTruyCap'] as String?,
  hocKy: json['hocKy'] as String?,
  phongHoc: json['phongHoc'] as String?,
  ngayHoc: $enumDecodeNullable(_$NgayTrongTuanEnumMap, json['ngayHoc']),
  tietBatDau: (json['tietBatDau'] as num?)?.toInt(),
  tietKetThuc: (json['tietKetThuc'] as num?)?.toInt(),
  customBeginDate: json['customBeginDate'] == null
      ? null
      : DateTime.parse(json['customBeginDate'] as String),
  customEndDate: json['customEndDate'] == null
      ? null
      : DateTime.parse(json['customEndDate'] as String),
  trangThai:
      $enumDecodeNullable(_$TrangThaiLopTinChiEnumMap, json['trangThai']) ??
      TrangThaiLopTinChi.binhThuong,
);

Map<String, dynamic> _$LopTinChiToJson(_LopTinChi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'maLopHoc': instance.maLopHoc,
      'maHocPhan': instance.maHocPhan,
      'soLuongDangKy': instance.soLuongDangKy,
      'idGiangVien': instance.idGiangVien,
      'idLopTruong': instance.idLopTruong,
      'urlTruyCap': instance.urlTruyCap,
      'hocKy': instance.hocKy,
      'phongHoc': instance.phongHoc,
      'ngayHoc': _$NgayTrongTuanEnumMap[instance.ngayHoc],
      'tietBatDau': instance.tietBatDau,
      'tietKetThuc': instance.tietKetThuc,
      'customBeginDate': instance.customBeginDate?.toIso8601String(),
      'customEndDate': instance.customEndDate?.toIso8601String(),
      'trangThai': _$TrangThaiLopTinChiEnumMap[instance.trangThai]!,
    };

const _$NgayTrongTuanEnumMap = {
  NgayTrongTuan.t2: 2,
  NgayTrongTuan.t3: 3,
  NgayTrongTuan.t4: 4,
  NgayTrongTuan.t5: 5,
  NgayTrongTuan.t6: 6,
  NgayTrongTuan.t7: 7,
};

const _$TrangThaiLopTinChiEnumMap = {
  TrangThaiLopTinChi.huy: 1,
  TrangThaiLopTinChi.binhThuong: 0,
};

_NamTaiChinh _$NamTaiChinhFromJson(Map<String, dynamic> json) => _NamTaiChinh(
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

Map<String, dynamic> _$NamTaiChinhToJson(_NamTaiChinh instance) =>
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

_NhomChuyenMon _$NhomChuyenMonFromJson(Map<String, dynamic> json) =>
    _NhomChuyenMon(
      id: (json['id'] as num).toInt(),
      tenNhom: json['tenNhom'] as String,
    );

Map<String, dynamic> _$NhomChuyenMonToJson(_NhomChuyenMon instance) =>
    <String, dynamic>{'id': instance.id, 'tenNhom': instance.tenNhom};

_NienKhoa _$NienKhoaFromJson(Map<String, dynamic> json) =>
    _NienKhoa(nienKhoa: json['nienKhoa'] as String);

Map<String, dynamic> _$NienKhoaToJson(_NienKhoa instance) => <String, dynamic>{
  'nienKhoa': instance.nienKhoa,
};

_TeachingRegistration _$TeachingRegistrationFromJson(
  Map<String, dynamic> json,
) => _TeachingRegistration(
  teacherId: (json['idGiangVien'] as num).toInt(),
  courseId: json['maHocPhan'] as String,
);

Map<String, dynamic> _$TeachingRegistrationToJson(
  _TeachingRegistration instance,
) => <String, dynamic>{
  'idGiangVien': instance.teacherId,
  'maHocPhan': instance.courseId,
};

_TieuBanXetTuyen _$TieuBanXetTuyenFromJson(Map<String, dynamic> json) =>
    _TieuBanXetTuyen(
      id: (json['id'] as num).toInt(),
      nam: json['nam'] as String,
      idChuTich: (json['idChuTich'] as num).toInt(),
      idThuKy: (json['idThuKy'] as num).toInt(),
      idUyVien1: (json['idUyVien1'] as num).toInt(),
      idUyVien2: (json['idUyVien2'] as num).toInt(),
      idUyVien3: (json['idUyVien3'] as num).toInt(),
    );

Map<String, dynamic> _$TieuBanXetTuyenToJson(_TieuBanXetTuyen instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nam': instance.nam,
      'idChuTich': instance.idChuTich,
      'idThuKy': instance.idThuKy,
      'idUyVien1': instance.idUyVien1,
      'idUyVien2': instance.idUyVien2,
      'idUyVien3': instance.idUyVien3,
    };
