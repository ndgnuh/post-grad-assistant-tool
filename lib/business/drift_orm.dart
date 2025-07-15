import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'drift_orm.g.dart';

const trueExpr = Constant(true);
const falseExpr = Constant(false);

enum HocHam {
  gs("GS", "GS.", "Giáo sư"),
  pgs("PGS", "PGS.", "Phó giáo sư");

  final String value;
  final String short;
  final String label;
  const HocHam(this.value, this.short, this.label);

  @override
  toString() => value;
}

enum HocVi {
  kySu('KS', "KS.", 'Kỹ sư'),
  thacSi('ThS', "ThS.", 'Thạc sĩ'),
  tienSi('TS', "TS.", 'Tiến sĩ'),
  tienSiKhoaHoc('TSKH', "TSKH.", 'Tiến sĩ khoa học');

  final String value;
  final String short;
  final String label;
  const HocVi(this.value, this.short, this.label);

  @override
  toString() => label;
}

enum KhoiKienThuc {
  khac('khac', 'Khác'),
  cn('cn', 'Cử nhân'),
  daiCuongThs('dc-ths', 'Đại cương'),
  nganhRong('nganh-rong', 'Kiến thức ngành (rộng)'),
  nganhNangCao('nganh-nangcao', 'Kiến thức ngành (nâng cao)'),
  tuChonBatBuoc('tc-batbuoc', 'Tự chọn bắt buộc'),
  tcChonTuDo('tc-tudo', 'Tự chọn tự do');

  final String value;
  final String label;
  const KhoiKienThuc(this.value, this.label);

  @override
  String toString() => value;

  static KhoiKienThuc fromString(String value) {
    return KhoiKienThuc.values.firstWhere(
      (element) => element.value == value,
      orElse: () => KhoiKienThuc.khac,
    );
  }
}

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

enum NganhHocThacSi {
  tt('toan-tin', 'Toán - Tin'),
  htttql('htttql', 'Hệ thống Thông tin Quản lý');

  final String value;
  final String label;
  const NganhHocThacSi(this.value, this.label);

  @override
  toString() => label;
}

enum GioiTinh {
  nam('M', 'Nam'),
  nu('F', 'Nữ'),
  khac('U', 'Khác');

  final String value;
  final String label;
  const GioiTinh(this.value, this.label);

  @override
  toString() => label;
}

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

mixin _History on Table {
  DateTimeColumn get dateCreated =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get dateUpdated =>
      dateTime().withDefault(currentDateAndTime)();
}

class HocPhan extends Table with _History {
  TextColumn get maHocPhan => text()();
  TextColumn get tenTiengViet => text()();
  TextColumn get tenTiengAnh => text()();
  IntColumn get soTinChi => integer()();
  TextColumn get khoiLuong => text()();
  TextColumn get khoiKienThuc =>
      textEnum<KhoiKienThuc>().withDefault(Constant(KhoiKienThuc.khac.value))();

  @override
  Set<Column> get primaryKey => {maHocPhan};
}

class LopTinChi extends Table with _History {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get maLopHoc => text().unique()();
  TextColumn get maHocPhan => text().references(HocPhan, #maHocPhan)();
  IntColumn get idGiangVien =>
      integer().nullable().references(GiangVien, #id)();
  IntColumn get idLopTruong => integer().nullable().references(HocVien, #id)();
  TextColumn get urlTruyCap => text().unique()();
  TextColumn get hocKy => text().references(HocKy, #hocKy)();
  TextColumn get phongHoc => text().nullable()();
  IntColumn get ngayHoc => integer().nullable()();
  IntColumn get tietBatDau => integer().nullable()();
  IntColumn get tietKetThuc => integer().nullable()();
  BoolColumn get flagHuy => boolean().withDefault(falseExpr)();
}

class HocKy extends Table with _History {
  TextColumn get hocKy => text()();
  DateTimeColumn get moDangKy => dateTime()();
  DateTimeColumn get dongDangKy => dateTime()();
  DateTimeColumn get batDauHoc => dateTime()();
  DateTimeColumn get ketThucHoc => dateTime()();
  DateTimeColumn get hanNhapDiem => dateTime()();

  @override
  Set<Column> get primaryKey => {hocKy};
}

class NienKhoa extends Table with _History {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tenNienKhoa => text().withLength(min: 1, max: 100)();
  DateTimeColumn get batDau => dateTime().nullable()();
  DateTimeColumn get ketThuc => dateTime().nullable()();
}

class TieuBanXetTuyen extends Table with _History {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idChuTich => integer().references(GiangVien, #id)();
  IntColumn get idThuKy => integer().references(GiangVien, #id)();
  IntColumn get idUyVien1 => integer().references(GiangVien, #id)();
  IntColumn get idUyVien2 => integer().references(GiangVien, #id)();
  IntColumn get idUyVien3 => integer().references(GiangVien, #id)();
  IntColumn get tienChuTich => integer().nullable()();
  IntColumn get tienThuKy => integer().nullable()();
  IntColumn get tienUyVien => integer().nullable()();
}

class NhomChuyenMon extends Table with _History {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tenNhom => text().withLength(min: 1, max: 100)();
}

class GiangVien extends Table with _History {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get hoTen => text()();
  TextColumn get maCanBo => text().nullable()();
  TextColumn get daiHoc => text().nullable()();
  TextColumn get donVi => text().nullable()();
  BoolColumn get ngoaiTruong => boolean().withDefault(trueExpr)();
  TextColumn get chuyenNganh => text().nullable()();
  TextColumn get gioiTinh =>
      textEnum<GioiTinh>().withDefault(Constant(GioiTinh.khac.value))();
  late final Column<String> hocHam =
      text().nullable().check(hocHam.isIn(["gs", "pgs"]))();
  late final Column<String> hocVi =
      text().nullable().check(hocVi.isIn(["cn", "ths", "ts", "tskh"]))();
  IntColumn get namNhanTs => integer().nullable()();
  TextColumn get sdt => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get cccd => text().nullable()();
  DateTimeColumn get ngaySinh => dateTime().nullable()();
  TextColumn get stk => text().nullable()();
  TextColumn get nganHang => text().nullable()();
  TextColumn get mst => text().nullable()();
  TextColumn get note => text().withDefault(const Constant(''))();
  IntColumn get idNhomChuyenMon =>
      integer().references(NhomChuyenMon, #id).nullable()();
}

class HocVien extends Table with _History {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idHoSoXetTuyen => text().nullable()();
  TextColumn get nienKhoa => text().references(NienKhoa, #tenNienKhoa)();
  TextColumn get maHocVien => text().unique()();
  TextColumn get hoTen => text()();
  DateTimeColumn get ngaySinh => dateTime().nullable()();
  TextColumn get gioiTinh => text().nullable()();
  TextColumn get noiSinh => text().nullable()();
  TextColumn get sdt => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get emailHust => text().nullable()();
  TextColumn get truongTotNghiepDaiHoc => text().nullable()();
  TextColumn get nganhTotNghiepDaiHoc => text().nullable()();
  TextColumn get heTotNghiepDaiHoc => text().nullable()();
  TextColumn get xepLoaiTotNghiepDaiHoc => text().nullable()();
  DateTimeColumn get ngayTotNghiepDaiHoc => dateTime().nullable()();
  TextColumn get dinhHuongChuyenSau => text().nullable()();
  TextColumn get hocPhanDuocMien => text().nullable()();
  TextColumn get nganhDaoTaoThacSi => text().nullable()();

  BoolColumn get flagGiaHanLan1 => boolean().withDefault(falseExpr)();
  BoolColumn get flagGiaHanLan2 => boolean().withDefault(falseExpr)();
  BoolColumn get flagThanhToanXetTuyen => boolean().withDefault(falseExpr)();
  TextColumn get trangThai => textEnum<TrangThaiHocVien>().nullable()();
  IntColumn get idTieuBanXetTuyen =>
      integer().references(TieuBanXetTuyen, #id).nullable()();
  TextColumn get idDienTuyenSinh => text().nullable()();
}

class DeTaiThacSi extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idGiangVien => integer().references(GiangVien, #id)();
  TextColumn get tenTiengViet => text().withLength(min: 1, max: 200)();
  TextColumn get tenTiengAnh => text().withLength(min: 1, max: 200)();
  TextColumn get ghiChu =>
      text().withLength(min: 0, max: 500).withDefault(const Constant(''))();
  IntColumn get idHocVien => integer().references(HocVien, #id).nullable()();
  DateTimeColumn get ngayGiao => dateTime().nullable()();
  TextColumn get soQdGiao => text().nullable()();
  DateTimeColumn get hanBaoVe => dateTime().nullable()();
  TextColumn get soQdBaoVe => text().nullable()();
  DateTimeColumn get ngayBaoVe => dateTime().nullable()();
  IntColumn get idChuTich => integer().references(GiangVien, #id).nullable()();
  IntColumn get idPhanBien1 =>
      integer().references(GiangVien, #id).nullable()();
  IntColumn get idPhanBien2 =>
      integer().references(GiangVien, #id).nullable()();
  IntColumn get idUyVien => integer().references(GiangVien, #id).nullable()();
  IntColumn get idThuKy => integer().references(GiangVien, #id).nullable()();
  IntColumn get namBaoVe =>
      integer().nullable().generatedAs(ngayBaoVe.year, stored: true)();

  BoolColumn get flagGiaoDeTai => boolean().withDefault(falseExpr)();
  BoolColumn get flagThanhToan => boolean().withDefault(falseExpr)();
  BoolColumn get flagDangKyBaoVe => boolean().withDefault(falseExpr)();
  BoolColumn get flagNopHoSo => boolean().withDefault(falseExpr)();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  HocVien,
  DeTaiThacSi,
  GiangVien,
  HocKy,
  NienKhoa,
  TieuBanXetTuyen,
  NhomChuyenMon,
  KhoiKienThuc,
  HocPhan,
  LopTinChi,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'fami-caohoc-drift',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
