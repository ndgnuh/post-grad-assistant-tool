import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ft_export.dart';

class ExportPdfButton extends ConsumerWidget {
  final Widget Function(BuildContext, VoidCallback) builder;

  const ExportPdfButton({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    callback() async {
      final pdf = await ref.read(sampleThesesPdfProvider.future);

      final savePath = await FilePicker.platform.saveFile(
        dialogTitle: "Lưu danh sách đề tài",
        lockParentWindow: true,
        bytes: pdf,
        fileName: "DanhSach_DeTai_ThamKhao.pdf",
      );

      // On desktop, the file might need manual saving...
      if (savePath == null) return;
      if (Platform.isLinux || Platform.isWindows || Platform.isWindows) {
        final file = File(savePath);
        file.writeAsBytes(pdf);
      }
    }

    return builder(context, callback);
  }
}
