import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/copy_pasta.dart';
import '../custom_widgets.dart';

class _State extends ChangeNotifier {
  List<CopyPasta> listCopyPasta = [];

  refresh() async {
    listCopyPasta = await loadCopyPasta();
    notifyListeners();
  }

  _State() {
    refresh();
  }
}

class _CopyPastaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_State>(context);
    final data = state.listCopyPasta;
    final sm = ScaffoldMessenger.of(context);
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        final copyPasta = data[i];
        return ListTile(
          title: Text(copyPasta.name),
          subtitle: Text(copyPasta.content),
          onTap: () async {
            await copyPasta.copyToClipboard();
            sm.showMessage("Đã copy ${copyPasta.name}");
          },
        );
      },
    );
  }
}

class PageCopyPasta extends StatelessWidget {
  static const routeName = "/copy-pasta";
  const PageCopyPasta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: Text("Copy pasta"),
        leading: BackButton(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => _State(),
        child: EzFlex(
          direction: Axis.horizontal,
          children: [
            _CopyPastaList(),
          ],
        ),
      ),
    );
  }
}
