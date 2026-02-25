import 'dart:convert';
import 'dart:io';

import '../../business/db_v2_providers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod/riverpod.dart';

final importListProvider = NotifierProvider(
  ImportListProvider.new,
);

class ImportListProvider extends Notifier<List<StudentCompanion>> {
  @override
  List<StudentCompanion> build() {
    return [];
  }

  void set(List<StudentCompanion> data) {
    state = data;
  }
}

String prettifyBachelorMajor(String rawMajor) {
  final major = rawMajor.replaceAll(" ", "").toLowerCase();
  return switch (major) {
    "toán-tin" => "Toán Tin",
    "toántin" => "Toán Tin",
    _ => rawMajor.replaceAll("  ", " ").trim(),
  };
}

String prettifyUniversity(String rawUniversity) {
  final university = rawUniversity.replaceAll(" ", "").toLowerCase();
  return switch (university) {
    "đạihọcbáchkhoahànội" => "Đại học Bách khoa Hà Nội",
    "đhbkhn" => "Đại học Bách khoa Hà Nội",
    "dhbkhn" => "Đại học Bách khoa Hà Nội",
    _ => rawUniversity.replaceAll("  ", " ").trim(),
  };
}

// Thông tin cần thiết:
// số hồ sơ, diện xét tuyển, tên, giới tính, ngày sinh, nơi sinh,
// email, số điện thoại
// trường đại học, ngành đại học, năm tốt nghiệp, hệ tốt nghiệp, ngày tốt nghiện, hạng tốt nghiệp,
// ngành thạc sĩ, định hướng chuyên sâu
// Kéo từ web:
// {
//   "idNhanDang": "c59f151149a945c197d298914ce1989f",
//   "lockKhoaXet": "0",
//   "bang1": "Tốt nghiệp Đại học (Bằng chính dự thi)",
//   "bang2": "Bằng khác (Bằng 2, Cao đẳng...)",
//   "chuyenNganhTN_Bang1": "Toán ứng dụng",
//   "chuyenNganhTN_Bang2": "",
//   "coQuanCongTac": "",
//   "dangKyChuongTrinhDaotao": "Toán tin",
//   "dienThoaiDiDong": "xxxx",
//   "dinhHuong": "KH",
//   "doiTuongUuTien": "",
//   "email": "xxxx@gmail.com",
//   "gioiTinh": "Nữ",
//   "heDaotao_Bang1": "Chính quy",
//   "heDaotao_Bang2": "",
//   "hinhThucTuyenSinh": "Tích hợp-Cử nhân thạc sĩ",
//   "hoVaTen": "Nguyễn Thị Thu Huyền",
//   "huongChuyenSau": "Không có",
//   "nganhTN_Bang1": "Toán Tin",
//   "nganhTN_Bang2": "",
//   "ngaySinh": "15/03/2002",
//   "ngayThangNamTNDH1": "27/04/2025",
//   "ngayXetHoSo": "Ngày xét hồ sơ: 6/16/2025 12:00:00 AM- Cán bộ xét duyệt: hung.nguyenduc@hust.edu.vn",
//   "ngayXetTrungTuyen": "",
//   "ngoaiNgu": "B1 VSTEP",
//   "noiSinh": "Hải Phòng",
//   "soHoSoTuyenSinh": "3019",
//   "tenDeTaiThucHien": "",
//   "thoigianDaoTao_Bang2": "",
//   "thoigianDaoTaoTNDH1": "4",
//   "thoigianTotNghiep_Bang2": "",
//   "thongTinLienHe": "",
//   "trinhDo_Bang2": "",
//   "truongTN_Bang1": "Đại học Bách Khoa Hà Nội",
//   "truongTN_Bang2": "",
//   "xepLoaiTotNghiep_Bang1": "Giỏi",
//   "xepLoaiTotNghiep_Bang2": ""
// }
Future<List<StudentCompanion>?> readProfilesFromJson() async {
  final result = await FilePicker.platform.pickFiles(
    dialogTitle: "File danh sách",
    allowMultiple: false,
  );

  if (result == null) return [];

  final sourceFile = result.paths.first!;
  final source = await File(sourceFile).readAsString();
  final parsed = <StudentCompanion>[];
  final data = jsonDecode(source)["records"];

  for (final rawJson in data) {
    final name = rawJson["name"] as String;
    final dateOfBirth = DateTime.parse(rawJson["dateOfBirth"] as String);
    final admissionId = rawJson["admissionId"] as String;
    final admissionType = AdmissionType.fromWebValue(rawJson["admissionType"]);
    final gender = Gender.parseWebValue(rawJson["gender"]);
    final bachelorMajor = (rawJson["bachelorMajor"] as String);
    final bachelorUniversity = rawJson["bachelorUniversity"] as String;
    final bachelorDegreeType = rawJson["bachelorDegreeType"] as String;
    final bachelorGraduationDate = DateTime.parse(
      rawJson["bachelorGraduationDate"] as String,
    );
    final bachelorGraduationRank = rawJson["bachelorGraduationRank"] as String;
    final placeOfBirth = rawJson["placeOfBirth"] as String;
    final email = rawJson["email"] as String;
    final phoneNumber = rawJson["phoneNumber"] as String;
    final masterMajor = rawJson["masterMajor"] as String;
    final specializationOrientation =
        rawJson["specializationOrientation"] as String;
    // required DateTime dateOfBirth,
    // required String placeOfBirth,
    // required String email,
    // required String phoneNumber,
    // required String bachelorUniversity,
    // required String bachelorMajor,
    // required String bachelorDegreeType,
    // required DateTime bachelorGraduationDate,
    // required String bachelorGraduationRank,
    // required String masterMajor,
    // required String specializationOrientation,

    final companion = StudentCompanion.insert(
      admissionId: Value(admissionId),
      admissionType: Value(admissionType),
      name: name,
      gender: Value(gender),
      dateOfBirth: Value(dateOfBirth),
      placeOfBirth: Value(placeOfBirth),
      personalEmail: Value(email),
      phone: Value(phoneNumber),
      bachelorUniversity: Value(bachelorUniversity),
      bachelorMajor: Value(bachelorMajor),
      bachelorProgram: Value(bachelorDegreeType),
      bachelorGraduationDate: Value(bachelorGraduationDate),
      bachelorGraduationRank: Value(bachelorGraduationRank),
      masterMajor: Value(masterMajor),
      intendedSpecialization: Value(specializationOrientation),
      status: Value(StudentStatus.admission),
    );

    parsed.add(companion);
  }

  return parsed;
}
