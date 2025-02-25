part of 'xet_tuyen.dart';

enum _FormMode {
  create,
  update,
}

final dateFormat = DateFormat("dd/MM/yyyy");

class _FormState extends ChangeNotifier {
  HocVien? student;
  EzController<DateTime> ngaySinh = EzController.forDateTime(
    dateFormat: dateFormat,
  );
  TextEditingController soHoSo = TextEditingController();
  TextEditingController hoTen = TextEditingController();
  TextEditingController dienThoai = TextEditingController();
  TextEditingController email = TextEditingController();
  EzSelectionController<String?> gioiTinh = EzSelectionController(
    values: ["Nam", "Nữ"],
  );
  TextEditingController noiSinh = TextEditingController();
  TextEditingController truongTotNghiepDaiHoc = TextEditingController();
  TextEditingController nganhTotNghiepDaiHoc = TextEditingController();
  TextEditingController heTotNghiepDaiHoc = TextEditingController();
  EzSelectionController<String?> xepLoaiTotNghiepDaiHoc = EzSelectionController(
    values: ["Khá", "Giỏi", "Xuất sắc"],
  );
  EzController<DateTime> ngayTotNghiepDaiHoc = EzController.forDateTime(
    dateFormat: dateFormat,
  );
  TextEditingController dinhHuongChuyenSau = TextEditingController();
  TextEditingController hocPhanDuocMien = TextEditingController();
  TextEditingController nganhDaoTaoThacSi = TextEditingController();
  TextEditingController hoiDongTuyenSinh = TextEditingController();
  EzSelectionController<DienTuyenSinh> dienTuyenSinh = EzSelectionController();
  EzController<String> idTieuBanXetTuyen = EzController();
  _FormMode mode = _FormMode.create;

  _FormState() {
    Repository.allDienTuyenSinh().then((data) {
      dienTuyenSinh.values = data;
      dienTuyenSinh.value = data.isEmpty ? null : data.first;
      notifyListeners();
    });
  }

  void toUpdateMode() {
    mode = _FormMode.create;
    notifyListeners();
  }

  void toCreateMode() {
    mode = _FormMode.update;
    notifyListeners();
  }

  static of(BuildContext context, {bool listen = false}) {
    return Provider.of<_FormState>(context, listen: listen);
  }

  void edit(HocVien hv) async {
    student = hv;
    soHoSo.text = hv.soHoSo ?? "";
    hoTen.text = hv.hoTen;
    ngaySinh.value = hv.ngaySinh;
    dienThoai.text = hv.dienThoai ?? "";
    email.text = hv.email ?? "";
    gioiTinh.value = hv.gioiTinh ?? "";
    noiSinh.text = hv.noiSinh ?? "";
    truongTotNghiepDaiHoc.text = hv.truongTotNghiepDaiHoc ?? "";
    nganhTotNghiepDaiHoc.text = hv.nganhTotNghiepDaiHoc ?? "";
    heTotNghiepDaiHoc.text = hv.heTotNghiepDaiHoc ?? "";
    xepLoaiTotNghiepDaiHoc.value = hv.xepLoaiTotNghiepDaiHoc ?? "";
    ngayTotNghiepDaiHoc.value = hv.ngayTotNghiepDaiHoc;
    dinhHuongChuyenSau.text = hv.dinhHuongChuyenSau ?? "";
    hocPhanDuocMien.text = hv.hocPhanDuocMien ?? "";
    nganhDaoTaoThacSi.text = hv.nganhDaoTaoThacSi ?? "";
    dienTuyenSinh.value = await hv.dienTuyenSinh;
    mode = _FormMode.update;
    notifyListeners();
  }

  Future<void> updateHocVien(TieuBanXetTuyen tb) async {
    final data = {
      "ngaySinh": ngaySinh.value?.toYmd(),
      "soHoSo": soHoSo.text,
      "hoTen": hoTen.text,
      "dienThoai": dienThoai.text,
      "email": email.text,
      "gioiTinh": gioiTinh.value,
      "noiSinh": noiSinh.text,
      "truongTotNghiepDaiHoc": truongTotNghiepDaiHoc.text,
      "nganhTotNghiepDaiHoc": nganhTotNghiepDaiHoc.text,
      "nganhDaoTaoThacSi": nganhDaoTaoThacSi.text,
      "heTotNghiepDaiHoc": heTotNghiepDaiHoc.text,
      "xepLoaiTotNghiepDaiHoc": xepLoaiTotNghiepDaiHoc.value,
      "ngayTotNghiepDaiHoc": ngayTotNghiepDaiHoc.value?.toYmd(),
      "dinhHuongChuyenSau": dinhHuongChuyenSau.text,
      "hocPhanDuocMien": hocPhanDuocMien.text,
      "idDienTuyenSinh": dienTuyenSinh.value?.id,
      "idTieuBanXetTuyen": tb.id,
    };
    for (final key in data.keys) {
      assert(data[key] is! TextEditingValue);
      data[key] = switch (data[key]) {
        "" => null,
        _ => data[key],
      };
    }
    await student?.update(data);
  }

  void reset() {
    soHoSo.text = "";
    hoTen.text = "";
    dienThoai.text = "";
    email.text = "";
    gioiTinh.value = null;
    noiSinh.text = "";
    truongTotNghiepDaiHoc.text = "";
    nganhTotNghiepDaiHoc.text = "";
    heTotNghiepDaiHoc.text = "";
    xepLoaiTotNghiepDaiHoc.value = null;
    ngaySinh.value = null;
    ngayTotNghiepDaiHoc.value = null;
    dinhHuongChuyenSau.text = "";
    hocPhanDuocMien.text = "";
    nganhDaoTaoThacSi.text = "";
    mode = _FormMode.create;
  }

  void refresh() {
    notifyListeners();
  }

  Future<(int, String?)> themHocVien() async {
    // Validate
    if (hoTen.text.isEmpty) return (0, "Chưa điền họ tên");
    if (soHoSo.text.isEmpty) return (0, "Chưa điền số hồ sơ");
    if (gioiTinh.value == null) return (0, "Chưa chọn giới tính");
    if (hoTen.text.isEmpty) return (0, "Chưa điền họ tên");
    if (hoTen.text.isEmpty) return (0, "Chưa điền họ tên");
    if (hoTen.text.isEmpty) return (0, "Chưa điền họ tên");
    final db = await openDatabase(databasePath);

    // Try adding data
    try {
      final data = {
        "soHoSo": soHoSo.text,
        "hoTen": hoTen.text,
        "dienThoai": dienThoai.text,
        "email": email.text,
        "gioiTinh": gioiTinh.value,
        "noiSinh": noiSinh.text,
        "truongTotNghiepDaiHoc": truongTotNghiepDaiHoc.text,
        "nganhTotNghiepDaiHoc": nganhTotNghiepDaiHoc.text,
        "heTotNghiepDaiHoc": heTotNghiepDaiHoc.text,
        "xepLoaiTotNghiepDaiHoc": xepLoaiTotNghiepDaiHoc.value,
        "ngaySinh": ngaySinh.value?.toYmd(),
        "ngayTotNghiepDaiHoc": ngayTotNghiepDaiHoc.value?.toYmd(),
        "dinhHuongChuyenSau": dinhHuongChuyenSau.text,
        "hocPhanDuocMien": hocPhanDuocMien.text,
        "nganhDaoTaoThacSi": nganhDaoTaoThacSi.text,
        "idDienTuyenSinh": dienTuyenSinh.value?.id,
        "maTrangThai": "xt",
      };
      for (final key in data.keys) {
        data[key] = switch (data[key]) {
          "" => null,
          _ => data[key],
        };
      }

      final query = InsertQuery()
        ..into("HocVien")
        ..insertAll([data]);
      final sql = query.build();
      print(sql);

      final numAffected = await db.insert(tables.hocVien, data);
      await db.close();
      return (numAffected, null);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return (0, "Xảy ra lỗi ở DB");
    } finally {
      mode = _FormMode.create;
      notifyListeners();
    }
  }
}

class _State extends ChangeNotifier {
  static _State of(BuildContext context, {bool listen = false}) {
    return Provider.of<_State>(context, listen: listen);
  }

  List<TieuBanXetTuyen> allTieuBanXetTuyen = [];
  List<HocVien> listCandidate = [];
  EzController<String> saveDirectory = EzController();
  EzSelectionController<TieuBanXetTuyen?> tieuBanXetTuyen =
      EzSelectionController(
    labelFormatter: (TieuBanXetTuyen? tb) {
      switch (tb) {
        case TieuBanXetTuyen t:
          return "Tiểu ban năm ${t.nam}";
        default:
          return "";
      }
    },
  );
  Future<List<HocVien>> futureListCandidate = Repository.searchHocVien(
    xetTuyen: true,
  );

  _State() {
    futureListCandidate.then((data) {
      listCandidate = data;
      notifyListeners();
    });
    Repository.allTieuBanXetTuyen().then((data) {
      tieuBanXetTuyen.values = data;
      if (data.isNotEmpty) {
        tieuBanXetTuyen.value = data.last;
      } else {
        tieuBanXetTuyen.value = null;
      }
      notifyListeners();
    });
  }

  setSaveDirectory(String dir) {
    saveDirectory.value = dir;
    notifyListeners();
  }

  List<HocVien> get candidatesXetTuyen {
    return [
      for (final c in listCandidate)
        if (c.idDienTuyenSinh != "xt") c
    ];
  }

  Future<void> refresh() async {
    futureListCandidate = Repository.searchHocVien(xetTuyen: true);
    listCandidate = await futureListCandidate;
    notifyListeners();
  }

  void pickSaveDirectory() async {
    notifyListeners();
  }
}
