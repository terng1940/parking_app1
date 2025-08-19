import 'package:flutter/material.dart';
import '../screens/logout_screen.dart';
import '../screens/select_station_screen.dart';
import '../utils/storage_helper.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    final userData = await StorageHelper.getUserData();
    setState(() {
      _userData = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userName = _userData?['name'] ?? 'ผู้ใช้';
    final userSurname = _userData?['surname'] ?? '';

    return Scaffold(
      body: Container(
        color: Color(0xFF0E215A),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'สวัสดี,',
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'คุณ $userName $userSurname',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0E215A),
                        ),
                      ),
                    ],
                  ),
        
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LogoutScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "โปรไฟล์ >",
                      style: TextStyle(color: Color(0xFF0E215A), fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
        
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  ],
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SelectStationScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF0E215A),
                    side: BorderSide(color: Color(0xFF0E215A)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "เช็คข้อมูลสถานี",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
