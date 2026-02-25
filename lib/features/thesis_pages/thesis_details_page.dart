/// TODO: depreceate this page, use a tabbed design version
/// in the msc_thesis_details.dart file
export '../msc_thesis_defense/msc_thesis_details.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../business/db_v2_providers.dart';
// import '../../custom_tiles.dart';
//
// class ThesisDetailPage extends ConsumerWidget {
//   final int thesisId;
//   const ThesisDetailPage({
//     super.key,
//     required this.thesisId,
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final thesisAsync = ref.watch(thesisByIdProvider(thesisId));
//     switch (thesisAsync) {
//       case AsyncLoading():
//         return const Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       case AsyncError(:final error, :final stackTrace):
//         return Scaffold(
//           body: Center(child: Text("Lỗi: $error\n$stackTrace")),
//         );
//       default:
//         break;
//     }
//
//     final thesis = thesisAsync.value!;
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Chi tiết đề tài")),
//       body: ListView(
//         children: [
//           StringTile(
//             title: "Tên tiếng Việt",
//             initialValue: thesis.vietnameseTitle,
//           ),
//           StringTile(
//             title: "Tên tiếng Anh",
//             initialValue: thesis.englishTitle,
//           ),
//           // StringTile(
//           //   titleText: "Giảng viên hướng dẫn",
//           //   initialValue: teacher.hoTenChucDanh,
//           //   readOnly: true,
//           // ),
//           // ListTile(
//           //   title: Text("Học viên"),
//           //   subtitle: Text("${student?.hoTen} [${student?.maHocVien}]"),
//           // ),
//           // StringTile(
//           //   titleText: "Số QD Giao",
//           //   initialValue: thesis.soQdGiao ?? "",
//           // ),
//           // DateTile(
//           //   titleText: "Ngày giao",
//           //   initialValue: thesis.ngayGiao,
//           //   onUpdate: (date) => thesis.setAssignDate(date),
//           // ),
//           // DateTile(
//           //   titleText: "Hạn bảo vệ",
//           //   initialValue: thesis.hanBaoVe,
//           //   onUpdate: (date) => thesis.setDefenseDueDate(date),
//           // ),
//           // DateTile(
//           //   titleText: "Ngày bảo vệ",
//           //   initialValue: thesis.ngayBaoVe,
//           //   onUpdate: (date) => thesis.setDefenseDate(date),
//           // ),
//         ],
//       ),
//     );
//   }
// }
