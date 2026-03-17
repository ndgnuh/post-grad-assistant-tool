import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../core/router.dart';
import '../../../shortcuts.dart';
import 'providers.dart';

class AdmissionCouncilListPage extends StatelessWidget {
  const AdmissionCouncilListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hội đồng tuyển sinh"),
        actions: [
          TextButton.icon(
            onPressed: () => AppRouter().msc.toAdmissionCouncilCreatePage(),
            icon: Icon(Symbols.add),
            label: Text("Tạo mới"),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(context.gutter),
        child: _CouncilList(),
      ),
    );
  }
}

class _CouncilList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final councils = ref.watch(councilsProvider);
    switch (councils) {
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return Center(child: Text("Error: $error"));
      case AsyncLoading():
        return Center(child: LinearProgressIndicator());
      case AsyncData(value: final councils):
        return ListView.separated(
          itemBuilder: (context, i) {
            final council = councils[i];
            return ListTile(
              title: Text("Hội đồng năm ${council.year}"),
              subtitle: Text("Click để xem"),
              leading: Icon(Symbols.group),
              trailing: Icon(Symbols.chevron_forward),
            );
          },
          separatorBuilder: (context, _) => Divider(),
          itemCount: councils.length,
        );
    }
  }
}
