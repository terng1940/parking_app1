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
            'ยินดีต้อนรับสู่ระบบจอดรถ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'บริการจอดรถอัจฉริยะของเราออกแบบมาเพื่อให้คุณสะดวกสบายยิ่งขึ้น '
            'ด้วยระบบจัดการจอดรถแบบดิจิทัลที่ทันสมัย คุณสามารถใช้งานได้อย่างรวดเร็วและปลอดภัย',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 25),
          const Text(
            'วิธีการใช้งานเบื้องต้น:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _buildInfoRow('1. สร้าง QR Code สำหรับใช้จอดรถได้ง่ายๆ ผ่านแอปพลิเคชัน'),
          _buildInfoRow('2. นำ QR Code ไปสแกนที่เครื่องสแกนในลานจอดรถ'),
          _buildInfoRow('3. ระบบจะบันทึกเวลาการจอดรถของคุณโดยอัตโนมัติ'),
          _buildInfoRow('4. ชำระเงินได้อย่างสะดวกเมื่อคุณต้องการออกจากลานจอดรถ'),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'เริ่มต้นใช้งานวันนี้เพื่อประสบการณ์จอดรถที่ง่ายและสะดวกสบายยิ่งขึ้น!',
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
            'ประโยชน์ของการใช้ QR Code จอดรถ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildBenefitItem(
            Icons.qr_code,
            'ไม่ต้องใช้ตั๋วจอดรถ',
            'ลืมปัญหาตั๋วจอดรถหายหรือเสียหาย ด้วยระบบ QR Code ดิจิทัล'
          ),
          _buildBenefitItem(
            Icons.access_time,
            'บันทึกเวลาอัตโนมัติ',
            'ระบบจะคำนวณเวลาจอดรถโดยอัตโนมัติอย่างแม่นยำ'
          ),
          _buildBenefitItem(
            Icons.payment,
            'ชำระเงินง่ายดาย',
            'ชำระเงินผ่านแอปพลิเคชันได้หลายช่องทาง ไม่ต้องเตรียมเงินสด'
          ),
          _buildBenefitItem(
            Icons.security,
            'ปลอดภัยและน่าเชื่อถือ',
            'ข้อมูลการจอดรถของคุณจะถูกเก็บรักษาอย่างปลอดภัย'
          ),
          const SizedBox(height: 25),
          const Text(
            'วิธีการสร้าง QR Code:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            '1. ไปที่หน้าสร้าง QR Code ในแอปพลิเคชัน\n'
            '2. ระบบจะสร้างรหัสเฉพาะสำหรับคุณ\n'
            '3. QR Code จะแสดงบนหน้าจอพร้อมข้อมูลที่จำเป็น\n'
            '4. คุณสามารถใช้ QR Code นี้ได้ทันที',
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
            'ข้อกำหนดและเงื่อนไข',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'ก่อนเริ่มใช้งาน กรุณาอ่านและทำความเข้าใจข้อกำหนดต่อไปนี้:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          _buildTermItem(
            'QR Code แต่ละใบมีอายุการใช้งานจำกัดตามที่กำหนด'
          ),
          _buildTermItem(
            'ผู้ใช้ต้องรับผิดชอบในการรักษาความปลอดภัยของ QR Code'
          ),
          _buildTermItem(
            'การจอดรถต้องปฏิบัติตามกฎระเบียบของลานจอดรถแต่ละแห่ง'
          ),
          _buildTermItem(
            'ค่าบริการจะถูกคำนวณตามระยะเวลาการจอดรถจริง'
          ),
          _buildTermItem(
            'ในกรณีที่ QR Code ไม่ทำงาน กรุณาติดต่อเจ้าหน้าที่'
          ),
          const SizedBox(height: 25),
          const Text(
            'นโยบายการคำนวณค่าบริการ:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            '• ชั่วโมงแรก: 30 บาท\n'
            '• ชั่วโมงต่อไป: ชั่วโมงละ 20 บาท\n'
            '• สูงสุดต่อวัน: 250 บาท\n'
            '• การจอดรถเกินเวลาเกินกว่าที่กำหนดอาจมีค่าปรับเพิ่ม',
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
              'ขอบคุณที่เลือกใช้บริการของเรา หากมีคำถามหรือต้องการความช่วยเหลือ '
              'กรุณาติดต่อศูนย์บริการลูกค้าได้ตลอด 24 ชั่วโมง',
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