import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: const Center(
        child: Text(
          'ยินดีต้อนรับสู่ Homepage!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
