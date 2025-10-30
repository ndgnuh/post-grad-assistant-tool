import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../business/business_enums.dart';

part '_import.freezed.dart';
part '_import.g.dart';

Future<List<JsonSchema>?> readProfilesFromJson() async {
  final result = await FilePicker.platform.pickFiles(
    dialogTitle: "File danh sách",
    allowMultiple: false,
  );

  if (result == null) return [];

  final sourceFile = result.paths.first!;
  final source = await File(sourceFile).readAsString();
  final parsed = <JsonSchema>[];
  final data = jsonDecode(source)["records"];
  for (final row in data) {
    final parsedRecord = JsonSchema.fromJson(row);

    final bachelorMajor = parsedRecord.bachelorMajor
        .replaceAll(" ", "")
        .toLowerCase();
    final prettifiedBachelorMajor = switch (bachelorMajor) {
      "toán-tin" => "Toán Tin",
      "toántin" => "Toán Tin",
      _ => parsedRecord.bachelorMajor,
    };

    final university = parsedRecord.bachelorUniversity
        .replaceAll("  ", " ")
        .toLowerCase();
    final prettifiedUniversity = switch (university) {
      "đại học bách khoa hà nội" => "Đại học Bách khoa Hà Nội",
      _ => parsedRecord.bachelorUniversity,
    };

    parsed.add(
      parsedRecord.copyWith(
        bachelorMajor: prettifiedBachelorMajor,
        bachelorUniversity: prettifiedUniversity,
      ),
    );
  }

  return parsed;
}

Future<void> saveDataToDatabase(List<JsonSchema> data) async {
  // TODO: use drift DB
}

class AdmissionTypeWebConverter extends JsonConverter<AdmissionType, String> {
  const AdmissionTypeWebConverter();
  @override
  AdmissionType fromJson(String json) {
    return AdmissionType.fromValue(json);
  }

  @override
  String toJson(AdmissionType object) {
    return object.value;
  }
}

class GenderWebConverter extends JsonConverter<Gender, String> {
  const GenderWebConverter();

  @override
  Gender fromJson(String str) => switch (str.trim().toLowerCase()) {
    "nam" => Gender.male,
    "nữ" => Gender.female,
    _ => throw Exception("Invalid gender string"),
  };

  @override
  String toJson(Gender g) => g.label;
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
@freezed
abstract class JsonSchema with _$JsonSchema {
  const factory JsonSchema({
    required String admissionId,
    @AdmissionTypeWebConverter() required AdmissionType admissionType,
    required String name,
    @GenderWebConverter() required Gender gender,
    required DateTime dateOfBirth,
    required String placeOfBirth,
    required String email,
    required String phoneNumber,
    required String bachelorUniversity,
    required String bachelorMajor,
    required String bachelorDegreeType,
    required DateTime bachelorGraduationDate,
    required String bachelorGraduationRank,
    required String masterMajor,
    required String specializationOrientation,
  }) = _JsonSchema;
  factory JsonSchema.fromJson(Map<String, dynamic> json) =>
      _$JsonSchemaFromJson(json);

  const JsonSchema._();
}
