import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../business/domain_objects.dart';

class Page extends StatelessWidget {
  final List<Thesis> theses;
  const Page({
    super.key,
    required this.theses,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Council Overview'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: theses.length,
            itemBuilder: (context, index) {
              final thesis = theses[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  // title: Text(thesis.hocVien!.hoTenChucDanh),
                  subtitle: Text('Thesis ID: ${thesis.id}'),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      Get.toNamed('/council/${thesis.id}');
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
