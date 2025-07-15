/// Trang để chọn niên khóa, có callback
import 'package:flutter/material.dart';
import 'dart:async';

import '../../business/domain_objects.dart';

class PageSelectClassOfArgs {
  final ValueChanged<NienKhoa?> onSelected;

  PageSelectClassOfArgs({required this.onSelected});
}

class PageSelectClassOf extends StatefulWidget {
  static const String routeName = '/select/class_of';

  final ValueChanged<NienKhoa?> onSelected;

  const PageSelectClassOf({
    super.key,
    required this.onSelected,
  });

  factory PageSelectClassOf.fromArgs(PageSelectClassOfArgs args) {
    return PageSelectClassOf(onSelected: args.onSelected);
  }

  @override
  State<PageSelectClassOf> createState() => _PageSelectClassOfState();
}

class _PageSelectClassOfState extends State<PageSelectClassOf> {
  late List<NienKhoa> listNienKhoa;

  @override
  initState() {
    super.initState();
    listNienKhoa = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn niên khóa'),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: SearchBar(
                autoFocus: true,
                hintText: "Tìm kiếm",
                onSubmitted: (String? query) async {
                  final listNienKhoa_ = await NienKhoa.search(query);
                  print(listNienKhoa_);
                  setState(() {
                    // Update the UI with the search results
                    listNienKhoa = listNienKhoa_;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listNienKhoa.length,
                itemBuilder: (context, index) {
                  final nienKhoa = listNienKhoa[index];
                  return ListTile(
                    title: Text(nienKhoa.nienKhoa),
                    onTap: () {
                      widget.onSelected(nienKhoa);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
