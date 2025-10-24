import 'package:fami_tools/custom_widgets.dart';
import 'package:flutter/material.dart';

class AdmissionPaymentPage extends StatelessWidget {
  static const routeName = "/admission/payment";

  const AdmissionPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: const Text("Xét tuyển"),
        ),
      ),
      body: ConstrainedBody(
        child: Text(""),
      ),
    );
  }
}
