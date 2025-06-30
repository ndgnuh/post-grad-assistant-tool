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

typedef RowBangThanhToan = ({
  GiangVien giangVien,
  int chuTich,
  int thuKy,
  int phanBien,
  int uyVien,
  int thanhTien,
});

Future<List<RowBangThanhToan>> bangThanhToan(
  List<DeTaiThacSi> listDeTai,
) async {
  final rows = <RowBangThanhToan>[];
  final setGiangVien = <GiangVien>{};
  final countChuTich = <GiangVien, int>{};
  final countPhanBien = <GiangVien, int>{};
  final countUyVien = <GiangVien, int>{};
  final countThuKy = <GiangVien, int>{};

  // Helper
  getAndSet(Map<GiangVien, int> theMap, GiangVien? gv) {
    if (gv != null) {
      theMap[gv] = (theMap[gv] ?? 0) + 1;
      setGiangVien.add(gv);
    }
  }

  // Đếm
  for (DeTaiThacSi deTai in listDeTai) {
    getAndSet(countChuTich, await deTai.chuTich);
    getAndSet(countThuKy, await deTai.thuKy);
    getAndSet(countPhanBien, await deTai.phanBien1);
    getAndSet(countPhanBien, await deTai.phanBien2);
    getAndSet(countUyVien, await deTai.uyVien);
  }

  // Ghép
  for (final gv in setGiangVien) {
    final cntChuTich = countChuTich[gv] ?? 0;
    final cntThuKy = countThuKy[gv] ?? 0;
    final cntPhanBien = countPhanBien[gv] ?? 0;
    final cntUyVien = countUyVien[gv] ?? 0;
    final row = (
      giangVien: gv,
      chuTich: cntChuTich,
      thuKy: cntThuKy,
      phanBien: cntPhanBien,
      uyVien: cntUyVien,
      thanhTien: (cntChuTich + cntThuKy) * 400000 +
          cntPhanBien * 1050000 +
          cntUyVien * 300000,
    );
    rows.add(row);
  }

  return rows;
}
