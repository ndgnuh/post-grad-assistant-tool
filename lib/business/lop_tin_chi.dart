export 'domain_objects.dart';
import 'domain_objects.dart';

import '../datamodels.dart' show openDatabase, dbSession;
import '../services/sqlbuilder/sqlbuilder.dart';

Future<List<HocKy>> listHocKy() async {
  return dbSession((db) async {
    final rows = await db.query(HocKy.table);
    return [for (final json in rows) HocKy.fromJson(json)];
  });
}

Future<List<HocPhan>> listHocPhan() async {
  return dbSession((db) async {
    final rows = await db.query(HocPhan.table);
    return [for (final json in rows) HocPhan.fromJson(json)];
  });
}

Future<List<GiangVien>> listGiangVien() async {
  return dbSession((db) async {
    final rows = await db.query(GiangVien.table);
    return [for (final json in rows) GiangVien.fromJson(json)];
  });
}

/// Trả về danh sách lớp tín chỉ [List<LopTinChi>], lọc theo trạng thái [trangThai],
/// kỳ học [hocKy] và học phần [idHocPhan].
Future<List<LopTinChi>> getLopTinChi({
  HocKy? hocKy,
  HocPhan? hocPhan,
  TrangThaiLopTinChi? trangThai,
}) async {
  final query = SelectQuery()
    ..from(LopTinChi.table)
    ..selectAll();

  if (hocKy != null) query.where("hocKy = ?", [hocKy.hocKy]);
  if (hocPhan != null) query.where("maHocPhan = ?", [hocPhan.maHocPhan]);
  if (trangThai != null) query.where("trangThai = ?", [trangThai.value]);

  final sql = query.build();
  print(sql);
  return dbSession((db) async {
    var rows = await db.rawQuery(sql);
    return [for (final json in rows) LopTinChi.fromJson(json)];
  });
}
