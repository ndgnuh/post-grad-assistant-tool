import 'package:flutter/material.dart';
import './domain_objects.dart';
import '../custom_widgets.dart';
import 'dart:async';

/// A class that edit all properties of [[GiangVien]] objects.
class GiangVienEditingController extends ChangeNotifier {
  final hoTen = TextEditingController();
  final maCanBo = TextEditingController();
  final donVi = TextEditingController();
  final chuyenNganh = TextEditingController();
  final sdt = TextEditingController();
  final email = TextEditingController();
  final cccd = TextEditingController();
  final stk = TextEditingController();
  final nganHang = TextEditingController();
  final mst = TextEditingController();
  final note = TextEditingController();

  // Control the state of buttons
  GiangVien? value;

  GiangVienEditingController() {
    value = null;
  }

  setValue(GiangVien? value) {
    this.value = value;
    hoTen.text = value?.hoTen ?? "";
    maCanBo.text = value?.maCanBo ?? "";
    donVi.text = value?.donVi ?? "";
    chuyenNganh.text = value?.chuyenNganh ?? "";
    sdt.text = value?.sdt ?? "";
    email.text = value?.email ?? "";
    cccd.text = value?.cccd ?? "";
    stk.text = value?.stk ?? "";
    nganHang.text = value?.nganHang ?? "";
    mst.text = value?.mst ?? "";
    note.text = value?.note ?? "";
  }
}

class DeTaiThsEditingController extends ChangeNotifier {
  int? id;
  final tenTiengViet = TextEditingController();
  final tenTiengAnh = TextEditingController();
  final hocVien = SearchChoiceController(
    nullable: true,
    searchFunction: HocVien.search,
    labelFormatter: (HocVien? hv) => switch (hv) {
      null => "Không",
      HocVien hv => "${hv.maHocVien} - ${hv.hoTen}",
    },
  );
  final giangVien = _sccGiangVien();
  final chuTich = _sccGiangVien();
  final phanBien1 = _sccGiangVien();
  final phanBien2 = _sccGiangVien();
  final uyVien = _sccGiangVien();
  final thuKy = _sccGiangVien();
  final ghiChu = TextEditingController();
  final soQdGiao = TextEditingController();
  final soQdBaoVe = TextEditingController();
  final ngayGiao = EzController<DateTime?>();
  final hanBaoVe = EzDateInputController();
  final ngayBaoVe = EzController<DateTime?>();
  final thanhToan = EzController<bool>();

  // Control the state of buttons
  final canUpdate = WidgetStatesController({WidgetState.disabled});
  final canCreate = WidgetStatesController();
  int? nam;

  static SearchChoiceController<GiangVien> _sccGiangVien() {
    labelFormatter(GiangVien? gv) {
      return switch (gv) {
        null => "Không",
        GiangVien gv => "${gv.hoTenChucDanh}, đơn vị: ${gv.donVi}",
      };
    }

    return SearchChoiceController(
      nullable: true,
      searchFunction: GiangVien.search,
      labelFormatter: labelFormatter,
    );
  }

  DeTaiThsEditingController() {
    value = null;
  }

  static String formatHocVien(HocVien? value) {
    return switch (value) {
      HocVien hv => "${hv.maHocVien} - ${hv.hoTen}",
      null => "(không)",
    };
  }

  DeTaiThacSi get value {
    return DeTaiThacSi(
      id: id,
      giangVien: giangVien.value,
      idGiangVien: giangVien.value?.id ?? -1,
      tenTiengViet: tenTiengViet.text,
      tenTiengAnh: tenTiengAnh.text,
      soQdGiao: soQdGiao.nonEmptyValue,
      soQdBaoVe: soQdBaoVe.nonEmptyValue,
      idHocVien: hocVien.value?.id,
      idChuTich: chuTich.value?.id,
      idThuKy: thuKy.value?.id,
      ghiChu: ghiChu.text,
      idPhanBien1: phanBien1.value?.id,
      idPhanBien2: phanBien2.value?.id,
      idUyVien: uyVien.value?.id,
      ngayGiao: ngayGiao.value,
      ngayBaoVe: ngayBaoVe.value,
      hanBaoVe: hanBaoVe.value,
      thanhToan: thanhToan.value ?? false,
    );
  }

  set value(value) => setValue(value);
  setValue(DeTaiThacSi? value) async {
    id = value?.id;
    giangVien.value = await value?.giangVien;
    tenTiengViet.text = value?.tenTiengViet ?? "";
    tenTiengAnh.text = value?.tenTiengAnh ?? "";
    ghiChu.text = value?.ghiChu ?? "";
    soQdGiao.text = value?.soQdGiao ?? "";
    soQdBaoVe.text = value?.soQdBaoVe ?? "";
    hocVien.value = await value?.hocVien;
    chuTich.value = await value?.chuTich;
    thuKy.value = await value?.thuKy;
    phanBien1.value = await value?.phanBien1;
    phanBien2.value = await value?.phanBien2;
    uyVien.value = await value?.uyVien;
    ngayGiao.value = value?.ngayGiao;
    ngayBaoVe.value = value?.ngayBaoVe;
    hanBaoVe.value = value?.hanBaoVe;
    thanhToan.value = value?.thanhToan;

    final disabled = value == null;
    canCreate.update(WidgetState.disabled, !disabled);
    canUpdate.update(WidgetState.disabled, disabled);
  }
}

class SearchChoiceController<T> extends ChangeNotifier {
  final formatController = SearchController();
  final FutureOr<List<T>> Function(String) searchFunction;
  final String Function(T?)? labelFormatter;
  final String nullName;
  final bool nullable;

  // Search and value tracking
  T? _value;
  String _lastQuery = "";
  List<T?> searchResults = [];

  SearchChoiceController({
    this.nullName = "N/A",
    required this.nullable,
    required this.searchFunction,
    required this.labelFormatter,
  });

  // The value get-setter
  get value => nullable ? _value : (_value as T);
  get valueOrNull => _value;
  set value(newValue) {
    _value = newValue;
    formatController.text = formatLabel(value);
    notifyListeners();
  }

  silentlySetValue(T? value) {
    _value = value;
  }

  // Search result + current value;
  List<T?> get values {
    // search results cannot contain null,
    // therefore this indicates _value is not null
    final finalValues = switch (searchResults.contains(_value)) {
      true => searchResults,
      false => [_value, ...searchResults],
    };

    // append null choice iff nullable
    if (nullable && finalValues.contains(null)) {
      return finalValues;
    } else {
      return [null, ...finalValues];
    }
  }

  // search and update, ignore if the last query is the same
  search(String query) async {
    if (_lastQuery == query) return;
    _lastQuery = query;
    searchResults = await searchFunction(query);
    notifyListeners();
  }

  // Format function
  String formatLabel(T? item) {
    return switch ((labelFormatter, item)) {
      (String Function(T?) f, _) => f(item),
      (String Function(T) f, T item) => f(item),
      (_, null) => nullName,
      _ => item.toString(),
    };
  }
}

class SearchChoice<T> extends StatefulWidget {
  final SearchChoiceController<T> controller;
  final String? label;
  final ValueChanged<T?>? onSelected;

  const SearchChoice({
    super.key,
    this.label,
    this.onSelected,
    required this.controller,
  });

  @override
  State<SearchChoice<T>> createState() => SearchChoiceState<T>();
}

class SearchChoiceState<T> extends State<SearchChoice<T>> {
  int? width;

  @override
  initState() {
    super.initState();
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final label = widget.label;
    // final constraint = (maxWidth: double.infinity);

    return SearchAnchor(
      searchController: controller.formatController,
      viewShape: RoundedRectangleBorder(),
      viewOnClose: () {
        controller.formatController.text =
            controller.formatLabel(controller.value);
      },
      builder: (context, searchController) {
        return TextFormField(
          controller: controller.formatController,
          onTap: () {
            searchController.openView();
            searchController.clear();
          },
          onChanged: (String text) {
            searchController.openView();
          },
          decoration: InputDecoration(
            labelText: label,
          ),
        );
      },
      viewHintText: label,
      suggestionsBuilder: (context, searchController) async {
        final query = searchController.text;
        try {
          await controller.search(query);
        } on Exception {
          return [];
        }

        return [
          for (final (value) in controller.values)
            ListTile(
              onTap: () {
                final text = controller.formatLabel(value);
                searchController.closeView(text);
                controller.value = value;
                switch (widget.onSelected) {
                  case ValueChanged<T?> f:
                    f(value);
                }
              },
              leading: switch (controller.value == value) {
                true => Icon(Icons.check),
                false => Icon(null),
              },
              title: Text(controller.formatLabel(value)),
            )
        ];
      },
    );

    return LayoutBuilder(
      builder: (context, constraint) {
        return DropdownMenu<T?>(
          width: constraint.maxWidth,
          closeBehavior: DropdownMenuCloseBehavior.all,
          requestFocusOnTap: true,
          controller: controller.formatController,
          initialSelection: controller.value,
          dropdownMenuEntries: [
            for (T? item in controller.values)
              DropdownMenuEntry<T?>(
                leadingIcon: switch (controller.value == item) {
                  true => Icon(Icons.check),
                  false => Icon(null),
                },
                value: item,
                label: controller.formatLabel(item),
              )
          ],
          onSelected: (T? value) {
            controller.value = value;
            switch (widget.onSelected) {
              case ValueChanged<T?> f:
                f(value);
            }
          },
          hintText: label,
          enableFilter: true,
          filterCallback: (entries, String query) {
            controller.search(query);
            return entries;
          },
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final controller = widget.controller;
  //   final label = widget.label;
  //   // final constraint = (maxWidth: double.infinity);

  //   return LayoutBuilder(
  //     builder: (context, constraint) {
  //       return DropdownMenu<T?>(
  //         width: constraint.maxWidth,
  //         closeBehavior: DropdownMenuCloseBehavior.all,
  //         requestFocusOnTap: true,
  //         controller: controller.formatController,
  //         initialSelection: controller.value,
  //         dropdownMenuEntries: [
  //           for (T? item in controller.values)
  //             DropdownMenuEntry<T?>(
  //               leadingIcon: switch (controller.value == item) {
  //                 true => Icon(Icons.check),
  //                 false => Icon(null),
  //               },
  //               value: item,
  //               label: controller.formatLabel(item),
  //             )
  //         ],
  //         onSelected: (T? value) {
  //           controller.value = value;
  //           switch (widget.onSelected) {
  //             case ValueChanged<T?> f:
  //               f(value);
  //           }
  //         },
  //         hintText: label,
  //         enableFilter: true,
  //         filterCallback: (entries, String query) {
  //           controller.search(query);
  //           return entries;
  //         },
  //       );
  //     },
  //   );
  // }
}
