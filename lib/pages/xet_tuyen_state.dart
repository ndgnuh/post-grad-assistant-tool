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
  EzController<String> ngaySinhCtrl = EzController();
  EzController<String> soHoSo = EzController();
  EzController<String> hoTen = EzController();
  EzController<String> dienThoai = EzController();
  EzController<String> email = EzController();
  EzController<String> gioiTinh = EzController<String>();
  EzController<String> noiSinh = EzController();
  EzController<String> truongTotNghiepDaiHoc = EzController();
  EzController<String> nganhTotNghiepDaiHoc = EzController();
  EzController<String> heTotNghiepDaiHoc = EzController();
  EzController xepLoaiTotNghiepDaiHoc = EzController<String>();
  EzController<DateTime> ngayTotNghiepDaiHoc = EzController.forDateTime(
    dateFormat: dateFormat,
  );
  EzController<String> dinhHuongChuyenSau = EzController();
  EzController<String> hocPhanDuocMien = EzController();
  EzController<String> nganhDaoTaoThacSi = EzController();
  EzController<String> hoiDongTuyenSinh = EzController();
  EzController<String> idTieuBanXetTuyen = EzController();
  _FormMode mode = _FormMode.create;

  void toUpdateMode() {
    mode = _FormMode.create;
    notifyListeners();
  }

  void toCreateMode() {
    mode = _FormMode.update;
    notifyListeners();
  }

  String? get ngaySinhText {
    return switch (ngaySinh) {
      DateTime d => DateFormat("dd/MM/yyyy").format(d),
      _ => null,
    };
  }

  String? get ngaySinhDb {
    return switch (ngaySinh) {
      DateTime d => DateFormat("yyyy/MM/dd").format(d),
      _ => null,
    };
  }

  static of(BuildContext context, {bool listen = false}) {
    return Provider.of<_FormState>(context, listen: listen);
  }

  void edit(HocVien hv) async {
    student = hv;
    soHoSo.value = hv.soHoSo ?? "";
    hoTen.value = hv.hoTen;
    ngaySinh.value = hv.ngaySinh;
    dienThoai.value = hv.dienThoai ?? "";
    email.value = hv.email ?? "";
    gioiTinh.value = hv.gioiTinh ?? "";
    noiSinh.value = hv.noiSinh ?? "";
    truongTotNghiepDaiHoc.value = hv.truongTotNghiepDaiHoc ?? "";
    nganhTotNghiepDaiHoc.value = hv.nganhTotNghiepDaiHoc ?? "";
    heTotNghiepDaiHoc.value = hv.heTotNghiepDaiHoc ?? "";
    xepLoaiTotNghiepDaiHoc.value = hv.xepLoaiTotNghiepDaiHoc ?? "";
    ngayTotNghiepDaiHoc.value = hv.ngayTotNghiepDaiHoc;
    dinhHuongChuyenSau.value = hv.dinhHuongChuyenSau ?? "";
    hocPhanDuocMien.value = hv.hocPhanDuocMien ?? "";
    nganhDaoTaoThacSi.value = hv.nganhDaoTaoThacSi ?? "";
    mode = _FormMode.update;
    notifyListeners();
  }

  Future<void> updateHocVien(TieuBanXetTuyen tb) async {
    final data = {
      "ngaySinh": ngaySinh.value?.toYmd(),
      "soHoSo": soHoSo.value,
      "hoTen": hoTen.value,
      "dienThoai": dienThoai.value,
      "email": email.value,
      "gioiTinh": gioiTinh.value,
      "noiSinh": noiSinh.value,
      "truongTotNghiepDaiHoc": truongTotNghiepDaiHoc.value,
      "nganhTotNghiepDaiHoc": nganhTotNghiepDaiHoc.value,
      "nganhDaoTaoThacSi": nganhDaoTaoThacSi.value,
      "heTotNghiepDaiHoc": heTotNghiepDaiHoc.value,
      "xepLoaiTotNghiepDaiHoc": xepLoaiTotNghiepDaiHoc.value,
      "ngayTotNghiepDaiHoc": ngayTotNghiepDaiHoc.value?.toYmd(),
      "dinhHuongChuyenSau": dinhHuongChuyenSau.value,
      "hocPhanDuocMien": hocPhanDuocMien.value,
      "idTieuBanXetTuyen": tb.id,
    };
    data.removeWhere((key, value) => value == null);
    await student?.update(data);
  }

  void reset() {
    ngaySinhCtrl.value = null;
    soHoSo.value = null;
    hoTen.value = null;
    dienThoai.value = null;
    email.value = null;
    gioiTinh.value = null;
    noiSinh.value = null;
    truongTotNghiepDaiHoc.value = null;
    nganhTotNghiepDaiHoc.value = null;
    heTotNghiepDaiHoc.value = null;
    xepLoaiTotNghiepDaiHoc.value = null;
    ngaySinh.value = null;
    ngayTotNghiepDaiHoc.value = null;
    dinhHuongChuyenSau.value = null;
    hocPhanDuocMien.value = null;
    nganhDaoTaoThacSi.value = null;
    mode = _FormMode.create;
  }

  void refresh() {
    notifyListeners();
  }

  Future<(int, String?)> themHocVien() async {
    // Validate
    if ((hoTen?.value ?? "") == "") {
      return (0, "Chưa điền họ tên");
    }
    if (ngaySinhDb == null) {
      return (0, "Chưa chọn ngày sinh");
    }
    final db = await openDatabase(databasePath);
    final numAffected = await db.insert(
      tables.hocVien,
      {
        "soHoSo": soHoSo.value,
        "hoTen": hoTen.value,
        "dienThoai": dienThoai.value,
        "noiSinh": noiSinh.value,
        "email": email.value,
        "gioiTinh": gioiTinh.value,
        "trangThai": "xt",
      },
    );
    await db.close();
    return (numAffected, null);
  }

  _FormState();
}

Future<List<HocVien>> getListCandidate() async {
  final db = await openDatabase(databasePath, readOnly: true);
  final rows = await db.query(
    "HocVien",
    where: "trangThai = ?",
    whereArgs: ["xt"],
  );
  final listHv = [
    for (final row in rows) HocVien.fromJson(row),
  ];
  await db.close();
  return listHv;
}

class _State extends ChangeNotifier {
  static _State of(BuildContext context, {bool listen = false}) {
    return Provider.of<_State>(context, listen: listen);
  }

  List<TieuBanXetTuyen> allTieuBanXetTuyen = [];
  List<HocVien> listCandidate = [];
  EzController<String> saveDirectory = EzController();
  EzController<TieuBanXetTuyen> tieuBanXetTuyen = EzController();
  Future<List<HocVien>> futureListCandidate = getListCandidate();

  _State() {
    tieuBanXetTuyen = EzController<TieuBanXetTuyen>(
      labelFormatter: (TieuBanXetTuyen? tb) {
        switch (tb) {
          case TieuBanXetTuyen t:
            return "Tiểu ban năm ${t.nam}";
          default:
            return "";
        }
      },
    );
    futureListCandidate.then((data) {
      listCandidate = data;
      notifyListeners();
    });
    Repository.allTieuBanXetTuyen().then((data) {
      allTieuBanXetTuyen = data;
      tieuBanXetTuyen.value = data.last;
      notifyListeners();
    });
  }

  setSaveDirectory(String dir) {
    saveDirectory.value = dir;
    notifyListeners();
  }

  Future<void> refresh() async {
    futureListCandidate = getListCandidate();
    listCandidate = await futureListCandidate;
    notifyListeners();
  }

  void pickSaveDirectory() async {
    notifyListeners();
  }
}
