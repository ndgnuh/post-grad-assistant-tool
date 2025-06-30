import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/domain_objects.dart';
import '../business/domain_editors.dart';

class DangKyBaoVe extends ChangeNotifier {
  List<HocVien> students = [];
  List<DeTaiThacSi> listDeTai = [];
  Map<DeTaiThacSi, HocVien> mapHocVien = {};
  Map<DeTaiThacSi, GiangVien> mapGiangVien = {};

  searchStudents(String query) async {
    listDeTai = await DeTaiThacSi.search(
      searchQuery: query,
      assigned: true,
    );

    for (final deTai in listDeTai) {
      final hocVien = await HocVien.getById(deTai.idHocVien as int);
      final giangVien = await GiangVien.getById(deTai.idGiangVien);
      mapHocVien[deTai] = hocVien;
      mapGiangVien[deTai] = giangVien;
    }

    notifyListeners();
  }
}

class ListViewDeTai extends StatelessWidget {
  const ListViewDeTai({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = Navigator.of(context);
    final state = Provider.of<DangKyBaoVe>(context, listen: true);
    return ListView.builder(
      itemCount: state.listDeTai.length,
      itemBuilder: (context, index) {
        final DeTaiThacSi deTai = state.listDeTai[index];
        final HocVien hocVien = state.mapHocVien[deTai] as HocVien;
        final GiangVien giangVien = state.mapGiangVien[deTai] as GiangVien;

        final title =
            "${hocVien.hoTen} (${hocVien.maHocVien}) - ${giangVien.hoTenChucDanh}";
        final subtitle = deTai.tenTiengViet;
        return ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: () {
            navigation.pushNamed(
              DangKyBaoVePage2.routeName,
              arguments: (
                deTai: deTai,
                hocVien: hocVien,
                giangVien: giangVien,
              ),
            );
          },
        );
      },
    );
  }
}

class CheckHoSoState extends ChangeNotifier {
  bool checkDieuKienTrangSdh = false;
  bool checkQuyenLuanVan = false;
  bool checkLyLich = false;
  bool checkNgoaiNgu = false;
  bool checkHauKiem = false;
  bool checkDungTenDeTai = false;
  bool checkDieuChinhDeTai = false;
  bool checkBaiBaoKhoaHoc = false;

  void Function()? get register => checkOk ? _register : null;
  void _register() {
    // TODO: actual register logic
  }

  setQuyenLuanVan(value) {
    checkQuyenLuanVan = value;
    notifyListeners();
  }

  setLyLich(value) {
    checkLyLich = value;
    notifyListeners();
  }

  setNgoaiNgu(value) {
    checkNgoaiNgu = value;
    notifyListeners();
  }

  setHauKiem(value) {
    checkHauKiem = value;
    notifyListeners();
  }

  setDungTenDeTai(value) {
    checkDungTenDeTai = value;
    notifyListeners();
  }

  setDieuChinhDeTai(value) {
    checkDieuChinhDeTai = value;
    notifyListeners();
  }

  setDieuKienTrangSdh(value) {
    checkDieuKienTrangSdh = value;
    notifyListeners();
  }

  bool get checkOk {
    if (!checkDieuKienTrangSdh) return false;
    if (!checkQuyenLuanVan) return false;
    if (!checkLyLich) return false;
    if (!checkNgoaiNgu) return false;
    if (!checkHauKiem) return false;
    if (!(checkDungTenDeTai ^ checkDieuChinhDeTai)) return false;
    return true;
  }
}

/// Bước 2: check hồ sơ và đăng ký vào CSDL
/// Nhận vào một [DeTaiThacSi], [HocVien] và [GiangVien]
class DangKyBaoVePage2 extends StatelessWidget {
  static const String routeName = "/dang-ky-bao-ve-2";
  final DeTaiThacSi deTai;
  final HocVien hocVien;
  final GiangVien giangVien;

  const DangKyBaoVePage2({
    super.key,
    required this.deTai,
    required this.hocVien,
    required this.giangVien,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nộp hồ sơ bảo vệ"),
      ),
      body: ChangeNotifierProvider<CheckHoSoState>(
        create: (context) => CheckHoSoState(),
        child: Consumer<CheckHoSoState>(
          builder: (context, state, _) {
            return ListView(
              // Thông tin chi tiết về đề tài, học viên và giảng viên
              // Check list các tài liệu cần nộp
              children: [
                ListTile(
                  title: Text(deTai.tenTiengViet),
                  subtitle: Text(deTai.tenTiengAnh),
                ),
                ListTile(
                  title: Text(hocVien.hoTen),
                  subtitle: Text(hocVien.maHocVien ?? ""),
                ),
                ListTile(
                  title: Text(giangVien.hoTenChucDanh),
                ),
                // Thêm các widget khác để hiển thị thông tin và nút đăng ký

                CheckboxListTile(
                  value: state.checkDieuKienTrangSdh,
                  title: Text("Điều kiện trang SDH"),
                  subtitle: Text("Kiểm tra trên trang sau đại học"),
                  onChanged: state.setDieuKienTrangSdh,
                ),
                CheckboxListTile(
                  value: state.checkQuyenLuanVan,
                  title: Text("Quyển luận văn"),
                  subtitle: Text("Có chữ ký của GVHD, in hai mặt"),
                  onChanged: state.setQuyenLuanVan,
                ),
                CheckboxListTile(
                  value: state.checkLyLich,
                  title: Text("Lý lịch học viên"),
                  subtitle: Text("Kiểm tra viết đúng tên đề tài"),
                  onChanged: state.setLyLich,
                ),
                CheckboxListTile(
                  value: state.checkNgoaiNgu,
                  title: Text("Chứng chỉ ngoại ngữ"),
                  subtitle: Text("Phải có kết quả hậu kiểm đi kèm"),
                  onChanged: state.setNgoaiNgu,
                ),
                CheckboxListTile(
                  value: state.checkHauKiem,
                  title: Text("Kết quả hậu kiểm ngoại ngữ"),
                  subtitle: Text("Đi kèm với chứng chỉ"),
                  onChanged: state.setHauKiem,
                ),
                CheckboxListTile(
                  value: state.checkDungTenDeTai,
                  title: Text("Tên đề tài trên các giấy tờ đúng"),
                  subtitle: Text("Kiểm tra trên lý lịch và quyển"),
                  onChanged: state.setDungTenDeTai,
                ),
                CheckboxListTile(
                  value: state.checkDieuChinhDeTai,
                  title: Text("Đơn xin điều chỉnh đề tài"),
                  subtitle: Text("Có đủ chữ ký của GVHD và Khoa ký đóng dấu"),
                  onChanged: state.setDieuChinhDeTai,
                ),

                ListTile(
                  title: ElevatedButton(
                    onPressed: state.register,
                    child: const Text("Đăng ký bảo vệ"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DangKyBaoVePage extends StatelessWidget {
  static const String routeName = "/dang-ky-bao-ve";

  const DangKyBaoVePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nộp hồ sơ bảo vệ"),
      ),
      body: ChangeNotifierProvider<DangKyBaoVe>(
        create: (context) => DangKyBaoVe(),
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(),
            ),
            Expanded(child: ListViewDeTai()),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DangKyBaoVe>(context, listen: true);
    return TextField(
      onSubmitted: (value) => state.searchStudents(value),
      decoration: InputDecoration(
        labelText: "Tìm kiếm học viên",
        border: OutlineInputBorder(),
      ),
    );
  }
}
