import 'package:flutter/material.dart';
import '../widget/gen_qrcode_widget.dart';
import '../widget/home_widget.dart';
import '../widget/list_widget.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomeWidget(), GenQrcodeWidget(), ListWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF0E215A),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF0E215A)),
            label: "หน้าหลัก",
          ),
          BottomNavigationBarItem(
            icon: Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, 9), // ปรับค่า offset ตามต้องการ
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF0E215A),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.qr_code, color: Colors.white, size: 32),
                ),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Color(0xFF0E215A)),
            label: "รายการ",
          ),
        ],
      ),
    );
  }
}
