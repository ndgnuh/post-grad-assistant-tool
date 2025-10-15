import 'package:flutter/material.dart';
import '../../custom_widgets.dart';

class CreateDatabasePage extends StatelessWidget {
  const CreateDatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedScreen(
        child: AppBar(
          title: const Text('Tạo CSDL'),
        ),
      ),
      body: const Center(
        child: Text('Create Page'),
      ),
    );
  }
}
