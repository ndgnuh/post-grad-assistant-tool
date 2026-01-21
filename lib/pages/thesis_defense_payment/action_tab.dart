import '../../custom_widgets.dart';
import '../../utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../pages.dart';
import 'providers.dart';

class ActionTabView extends StatelessWidget {
  const ActionTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          CardSection(
            title: "Mẫu tài liệu",
            children: [
              ListTile(
                title: const Text("Giấy đề nghị thanh toán"),
                trailing: const Icon(Symbols.chevron_right),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Bản kê thanh toán"),
                trailing: const Icon(Symbols.chevron_right),
                onTap: () {},
                subtitle: const Text("Bảng 6649 và 6756"),
              ),
              ListTile(
                title: const Text("Bảng tổng hợp thanh toán"),
                trailing: const Icon(Symbols.chevron_right),
                subtitle: const Text("Bảng ATM, in 2 lần"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Bảng tổng hợp danh sách"),
                trailing: const Icon(Symbols.chevron_right),
                subtitle: const Text("Dùng để kiểm tra thanh toán"),
                enabled: false,
              ),
              ListTile(
                title: const Text("Quyết định trích tiền"),
                trailing: const Icon(Symbols.chevron_right),
                subtitle: const Text("Đăng BK Office để ký, sau đó in văn thư"),
                enabled: false,
              ),
            ],
          ),

          // Actions
          CardSection(
            title: "Lưu",
            children: [
              ListTile(
                title: DirectoryPicker(
                  name: "msc-thesis-defense-payment-save-directory",
                  labelText: "Chọn thư mục lưu file",
                  provider: saveDirectoryNotifier,
                ),
                leading: const Icon(Symbols.folder_open),
                trailing: const Icon(null),
              ),
              ListTile(
                title: const Text("Lưu hồ sơ"),
                trailing: const Icon(Symbols.chevron_right),
                onTap: () {},
              ),
            ],
          ),

          // Template
          CardSection(
            title: "Cập nhật",
            children: [
              ListTile(
                title: const Text("Đề nghị thanh toán"),
                trailing: const Icon(Symbols.chevron_right),
                subtitle: const Text("Cập nhật mẫu đề nghị thanh toán"),
                onTap: () {},
              ),

              ListTile(
                title: const Text("Quyết định trích tiền"),
                trailing: const Icon(Symbols.chevron_right),
                subtitle: const Text("Cập nhật mẫu quyết định trích tiền"),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ThesisItem extends ConsumerWidget {
  final int thesisId;
  const _ThesisItem(this.thesisId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thesisAsync = ref.watch(thesisViewModelProvider(thesisId));
    if (thesisAsync is AsyncLoading) {
      return const LinearProgressIndicator();
    } else if (thesisAsync is AsyncError) {
      return Text('Error loading thesis: ${thesisAsync.error}');
    }

    final model = thesisAsync.value!;
    final thesis = model.thesis;
    final student = model.student;

    final subtitles = [
      "Sinh viên: ${student.name}",
      "Ngày bảo vệ: ${thesis.defenseDate!.toDmy(separator: '/')}",
    ].join('\n');
    // Fetch thesis details using thesisId if needed
    return ListTile(
      title: Text(thesis.vietnameseTitle),
      subtitle: Text(subtitles),
      onTap: () {
        AppNavigator(context).toThesisDetailsPage(thesisId: thesisId);
      },
    );
  }
}

class _ThesisNeedPaymentListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idsAsync = ref.watch(paymentRequiredIdsProvider);
    switch (idsAsync) {
      case AsyncLoading():
        return const LinearProgressIndicator();
      case AsyncError(:final error, :final stackTrace):
        return Text('Error: $error\n$stackTrace');
      default:
    }

    final ids = idsAsync.value!;
    if (ids.isEmpty) {
      return const Text('Không có luận văn cần thanh toán');
    }

    return ListView.separated(
      itemBuilder: (context, i) {
        final id = ids[i];
        return _ThesisItem(id);
      },
      separatorBuilder: (_, i) => Divider(),
      itemCount: ids.length,
    );
  }
}
