import 'domain_objects.dart';
import '../services/database.dart';

/// Liệt kê danh sách học viên có thể bảo vệ
Future<List<HocVien>> listHocVien({String searchQuery = ""}) async {
  final query = SelectQuery()
    ..from(HocVien.table)
    ..selectAll()
    ..where("maTrangThai = ?", [TrangThaiHocVien.dangHoc.value]);

  if (searchQuery != "") {
    final like = "%$searchQuery%";
    final likes = [like, like];
    query.where("maHocVien like ? OR hoTen like ?", likes);
  }
  final sql = query.build();
  return dbSession((db) async {
    final rows = await db.rawQuery(sql);
    return [for (final json in rows) HocVien.fromJson(json)];
  });
}
