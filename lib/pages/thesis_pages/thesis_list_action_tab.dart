import 'package:fami_tools/pages/theses/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import './ft_export.dart';

class ThesisListActionTab extends StatelessWidget {
  const ThesisListActionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.gutter),
      child: ListView(
        children: [
          Card(
            child: Column(
              children: [
                SizedBox(height: context.gutterSmall),
                ExportPdfButton(
                  builder: (context, export) => ListTile(
                    leading: Icon(Symbols.file_download),
                    title: Text('Xuất PDF tham khảo'),
                    subtitle: Text(
                      'Đề tài tham khảo cho học viên đăng ký',
                    ),
                    trailing: Icon(Symbols.chevron_right),
                    onTap: export,
                  ),
                ),
                Divider(),
                ExportPdfButton(
                  builder: (context, export) => ListTile(
                    leading: Icon(Symbols.file_download),
                    title: Text('Xuất PDF tình trạng'),
                    subtitle: Text(
                      'Danh mục đề tài cho giảng viên cập nhật',
                    ),
                    trailing: Icon(Symbols.chevron_right),
                    onTap: export,
                  ),
                ),
                SizedBox(height: context.gutterSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
