import 'package:flutter/material.dart';

class PhdAdmissionPayment extends StatelessWidget {
  static const routeName = '/phd/admission-payment';
  const PhdAdmissionPayment({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán chấm đề cương NCS'),
      ),
      body: Center(
        child: Text(
          'Ph.D. Admission Payment Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
