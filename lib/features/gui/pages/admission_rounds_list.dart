import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../msc_admission/providers.dart';

/// Trang danh sách đợt tuyển sinh
class AdmissionRoundManagePage extends StatefulWidget {
  static const routeName = "xt-v2";
  const AdmissionRoundManagePage({super.key});

  @override
  State<AdmissionRoundManagePage> createState() =>
      _AdmissionRoundManagePageState();
}

class _AdmissionRoundManagePageState extends State<AdmissionRoundManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Đợt tuyển sinh")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.gutter),
        child: Column(
          children: [_YearFilter()],
        ),
      ),
    );
  }
}

class _YearFilter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(admissionYearSelectionProvider);

    return DropdownMenu<int?>(
      expandedInsets: EdgeInsets.zero,
      enabled: true,
      enableFilter: true,
      initialSelection: selection.selected,
      dropdownMenuEntries: [
        DropdownMenuEntry(label: "Tất cả", value: null),
        for (final option in selection.options)
          DropdownMenuEntry(label: "Năm $option", value: option),
      ],
      onSelected: (int? year) =>
          ref.read(admissionYearSelectionProvider.notifier).selectOrClear(year),
    );
  }
}
