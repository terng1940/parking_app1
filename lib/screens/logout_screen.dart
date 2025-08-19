import 'package:flutter/material.dart';
import '../utils/storage_helper.dart';
import 'login_screen.dart'; // ต้อง import LoginScreen ด้วย

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
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

  void _logout() async {
    await StorageHelper.clearSession();

    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false, 
    );
  }

  @override
  Widget build(BuildContext context) {
    final userName = _userData?['name'] ?? 'ผู้ใช้';
    final userSurname = _userData?['surname'] ?? '';
    final userEmail = _userData?['email'] ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text("โปรไฟล์")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(70, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      'คุณ $userName $userSurname',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E215A),
                      ),
                    ),
                    Text(
                      userEmail,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(101, 14, 33, 90),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _logout,
                  child: const Text(
                    "ออกจากระบบ",
                    style: TextStyle(color: Color(0xFF0E215A), fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
