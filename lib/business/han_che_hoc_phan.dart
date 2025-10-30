// import 'package:fami_tools/business/drift_orm.dart';
//
// import '../datamodels.dart' show dbSession;
// import '../services/sqlbuilder/sqlbuilder.dart';
// import '../services/pdf_widgets.dart' as pw;
// import 'dart:typed_data';
// import 'copy_pasta.dart';
//
// import 'domain_objects.dart';
// export 'domain_objects.dart' show HocPhan, KhoiKienThuc;
//
// extension _Query on HocPhan {
//   Future<String> get tenKhoiKienThuc async {
//     final query = SelectQuery()
//       ..from(KhoiKienThuc.table)
//       ..select(["tenKhoiKienThuc"])
//       ..where("khoiKienThuc = ?", [khoiKienThuc.value]);
//
//     final sql = query.build();
//     return dbSession((db) async {
//       final rows = await db.rawQuery(sql);
//       return rows[0]["tenKhoiKienThuc"].toString();
//     });
//   }
// }
//
// Future<List<HocPhan>> searchHocPhan({String? keyword = ""}) async {
//   final query = SelectQuery()
//     ..from(HocPhan.table)
//     ..selectAll()
//     ..where("khoiKienThuc not in ('khac', 'cn', 'dc-ths')");
//
//   print(keyword);
//   if (keyword != null && keyword != "") {
//     final like = "%$keyword%";
//     query.where(
//       "maHocPhan like ? OR tenTiengAnh like ? or tenTiengViet like ? ",
//       [like, like, like],
//     );
//   }
//
//   final sql = query.build();
//   print(sql);
//
//   return dbSession((db) async {
//     final rows = await db.rawQuery(sql);
//     return [for (final json in rows) HocPhan.fromJson(json)];
//   });
// }
//
