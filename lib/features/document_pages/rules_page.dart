import '../../custom_widgets.dart';
import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  static const String routeName = "/rules/current";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: Text("Quy định hiện hành"),
        ),
      ),
      body: ConstrainedBody(
        child: Center(
          child: Text("Working on it..."),
        ),
      ),
    );
  }
}
