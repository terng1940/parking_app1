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

  final List<Widget> _pages = [
    _buildPage1(),
    _buildPage2(),
    _buildPage3(),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
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
        physics: const NeverScrollableScrollPhysics(), 
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

  static Widget _buildPage1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lorem Ipsum Dolor Sit Amet',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 25),
          const Text(
            'Duis Aute Irure:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _buildInfoRow('1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          _buildInfoRow('2. Sed do eiusmod tempor incididunt ut labore et dolore.'),
          _buildInfoRow('3. Magna aliqua ut enim ad minim veniam, quis nostrud.'),
          _buildInfoRow('4. Exercitation ullamco laboris nisi ut aliquip ex ea.'),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur!',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildPage2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Excepteur Sint Occaecat',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildBenefitItem(
            Icons.qr_code,
            'Cupidatat Non Proident',
            'Sunt in culpa qui officia deserunt mollit anim id est laborum.'
          ),
          _buildBenefitItem(
            Icons.access_time,
            'Tempor Incididunt',
            'Ut labore et dolore magna aliqua ut enim ad minim veniam.'
          ),
          _buildBenefitItem(
            Icons.payment,
            'Quis Nostrud',
            'Exercitation ullamco laboris nisi ut aliquip ex ea commodo.'
          ),
          _buildBenefitItem(
            Icons.security,
            'Consequat Duis',
            'Aute irure dolor in reprehenderit in voluptate velit esse.'
          ),
          const SizedBox(height: 25),
          const Text(
            'Sed Do Eiusmod:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            '1. Tempor incididunt ut labore et dolore magna aliqua.\n'
            '2. Ut enim ad minim veniam, quis nostrud exercitation.\n'
            '3. Ullamco laboris nisi ut aliquip ex ea commodo.\n'
            '4. Consequat duis aute irure dolor in reprehenderit.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }

  static Widget _buildPage3() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Velit Esse Cillum Dolore',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          _buildTermItem(
            'Sunt in culpa qui officia deserunt mollit anim id est laborum.'
          ),
          _buildTermItem(
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem.'
          ),
          _buildTermItem(
            'Accusantium doloremque laudantium totam rem aperiam.'
          ),
          _buildTermItem(
            'Eaque ipsa quae ab illo inventore veritatis et quasi architecto.'
          ),
          _buildTermItem(
            'Beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem.'
          ),
          const SizedBox(height: 25),
          const Text(
            'Quis Autem Vel Eum:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            '• Iure reprehenderit qui in ea voluptate velit: 30 BAHT\n'
            '• Quam nihil molestiae consequatur: 20 BAHT / HOUR\n'
            '• Vel illum qui dolorem eum fugiat quo: 250 BAHT / DAY\n'
            '• Voluptas nulla pariatur vero eos et accusamus: + FINE',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildInfoRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  static Widget _buildBenefitItem(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildTermItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}