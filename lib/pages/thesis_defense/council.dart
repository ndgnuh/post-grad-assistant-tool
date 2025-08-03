import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../business/domain_objects.dart';
import '../../business/domain_editors.dart';

class _State extends ChangeNotifier {
  final Thesis thesis;
  ValueNotifier<Teacher?> presidentObservable = ValueNotifier(null);
  ValueNotifier<Teacher?> reviewer1Observable = ValueNotifier(null);
  ValueNotifier<Teacher?> reviewer2Observable = ValueNotifier(null);
  ValueNotifier<Teacher?> secretaryObservable = ValueNotifier(null);
  ValueNotifier<Teacher?> memberObservable = ValueNotifier(null);

  Teacher? get president => presidentObservable.value;
  Teacher? get reviewer1 => reviewer1Observable.value;
  Teacher? get reviewer2 => reviewer2Observable.value;
  Teacher? get secretary => secretaryObservable.value;
  Teacher? get member => memberObservable.value;
  set president(Teacher? value) => presidentObservable.value = value;
  set reviewer1(Teacher? value) => reviewer1Observable.value = value;
  set reviewer2(Teacher? value) => reviewer2Observable.value = value;
  set secretary(Teacher? value) => secretaryObservable.value = value;
  set member(Teacher? value) => memberObservable.value = value;

  void fetchInfo() async {
    president = await thesis.chuTich;
    reviewer1 = await thesis.phanBien1;
    reviewer2 = await thesis.phanBien2;
    secretary = await thesis.thuKy;
    member = await thesis.uyVien;
  }

  _State({required this.thesis}) {
    fetchInfo();
  }
}

class Page extends StatelessWidget {
  final Thesis thesis;

  const Page({
    super.key,
    required this.thesis,
  });

  String formatTeacher(Teacher? teacher) {
    if (teacher == null) return "Chưa chọn";
    return "${teacher.hoTenChucDanh} - ${teacher.donVi}";
  }

  @override
  Widget build(BuildContext context) {
    final student = thesis.hocVien!;

    return ChangeNotifierProvider(
      create: (_) => Get.put(_State(thesis: thesis)),
      builder: (context, _) {
        final state = Provider.of<_State>(context, listen: false);
        final messager = ScaffoldMessenger.of(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('Xếp hội đồng'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Đề tài
                ListTile(
                  title: Text("Đề tài"),
                  subtitle: Text(thesis.tenTiengViet),
                ),

                // Học viên
                ListTile(
                  title: Text("Học viên"),
                  subtitle: Text("${student.maHocVien} - ${student.hoTen}"),
                ),

                // Chủ tịch hội đồng
                TeacherSearchTile(
                  label: "Chủ tịch",
                  valueNotifier: state.presidentObservable,
                  itemFormatter: formatTeacher,
                  onSelected: (Teacher? v) => thesis.updateChuTich(v?.id),
                ),

                TeacherSearchTile(
                  label: "Phản biện 1",
                  valueNotifier: state.reviewer1Observable,
                  itemFormatter: formatTeacher,
                  onSelected: (Teacher? v) => thesis.updatePhanBien1(v?.id),
                ),

                TeacherSearchTile(
                  label: "Phản biện 2",
                  valueNotifier: state.reviewer2Observable,
                  itemFormatter: formatTeacher,
                  onSelected: (Teacher? v) => thesis.updatePhanBien2(v?.id),
                ),

                TeacherSearchTile(
                  label: "Thư ký",
                  valueNotifier: state.secretaryObservable,
                  itemFormatter: formatTeacher,
                  onSelected: (Teacher? v) => thesis.updateThuKy(v?.id),
                ),

                TeacherSearchTile(
                  label: "Ủy viên",
                  valueNotifier: state.memberObservable,
                  itemFormatter: formatTeacher,
                  onSelected: (Teacher? v) => thesis.updateUyVien(v?.id),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
