import 'package:fami_tools/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages.dart';
import 'providers.dart';

class ListTabView extends StatelessWidget {
  const ListTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.gutter),

      child: _ThesisNeedPaymentListView(),
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
