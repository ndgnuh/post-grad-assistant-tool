import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdfrx/pdfrx.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import '../../preferences.dart';
import 'widgets.dart';
import 'providers.dart';
import '../../business/pdfs/pdfs.dart' as pdfs;

final paymentStudentIdsProvider = AsyncNotifierProvider.family(
  (AdmissionCouncilData council) =>
      StudentIdsNotifier(admissionCouncil: council),
);

final paymentRequestPdfProvider = FutureProvider((ref) async {
  final myName = await ref.watch(myNameProvider.future);
  final myOrganization = await ref.watch(myDivisionProvider.future);
  final councilSelecionModel = await ref.watch(
    admissionCouncilSelectionProvider.future,
  );
  final council = councilSelecionModel.selected!;

  // Amount
  final ids = await ref.watch(
    paymentStudentIdsProvider(council).future,
  );
  print(council);
  print(ids);
  final amount = 320_000 * ids.length;

  final reason =
      "Thanh toán tiền bồi dưỡng tiểu ban xét tuyển thạc sĩ theo định hướng nghiên cứu năm ${council.year}";
  final pdf = pdfs.paymentRequestPdf(
    requesterName: myName!,
    requesterOrganization: myOrganization,
    paymentReason: reason,
    paymentAmount: amount,
  );
  return pdf;
});

class AdmissionPaymentPage extends StatelessWidget {
  static const routeName = "/admission/payment";

  const AdmissionPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text("Thanh toán xét tuyển"),
        ),
      ),
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CouncilSelector(),
              Text(
                "Trang quản lý các khoản thu xét tuyển.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Expanded(child: _SamplePdfViewer()),
            ],
          ),
        ),
      ),
    );
  }
}

class _SamplePdfViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, child) {
        final pdfAsync = ref.watch(paymentRequestPdfProvider);
        switch (pdfAsync) {
          case AsyncLoading():
            return const Center(child: CircularProgressIndicator());
          case AsyncError():
            return const Center(child: Text("Lỗi tải dữ liệu."));
          default:
        }

        final pdf = pdfAsync.value!;
        return PdfViewer.data(pdf, sourceName: "Yêu cầu thanh toán.pdf");
      },
    );
  }
}
