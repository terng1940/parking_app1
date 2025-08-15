import 'package:flutter/material.dart';
import 'register_screen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Info Step 1', style: TextStyle(fontSize: 24))),
    Center(child: Text('Info Step 2', style: TextStyle(fontSize: 24))),
    Center(child: Text('Info Step 3', style: TextStyle(fontSize: 24))),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // ถ้าเป็นหน้าสุดท้าย → ไปหน้า Register
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RegisterScreen()),
      );
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ข้อมูลเบื้องต้น')),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(), // ป้องกัน swipe
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: _nextPage,
            child: Text(_currentPage == _pages.length - 1 ? 'ไปหน้า Register' : 'Next'),
          ),
        ),
      ),
    );
  }
}
