import 'package:fami_tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import 'widgets.dart';

class PhdAdmissionPaymentPage extends StatelessWidget {
  static const routeName = '/phd/admission-payment';
  const PhdAdmissionPaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: Text('Thanh toán chấm đề cương NCS'),
        ),
      ),
      body: ConstrainedBody(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            spacing: context.gutter,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CohortDropdown(),
              Expanded(child: PhdStudentListView()),
            ],
          ),
        ),
      ),
    );
  }
}
