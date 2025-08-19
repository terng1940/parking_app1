import 'package:flutter/material.dart';
import '../utils/storage_helper.dart';
import 'register_screen.dart';
import 'select_vehicle_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _errorMessage;
  bool _loading = false;

  void _login() async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    final userData = await StorageHelper.getUserData();
    print('User Data: $userData');

    if (userData == null) {
      setState(() {
        _errorMessage = "ยังไม่มีผู้ใช้ กรุณาสมัครก่อน";
        _loading = false;
      });
      return;
    }

    final savedEmail = userData["email"];
    final savedPassword = userData["password"]; 

    if (_emailController.text == savedEmail &&
        _passwordController.text == savedPassword) {

      await StorageHelper.saveSession(true);

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SelectVehicleScreen()),
      );
    } else {
      setState(() {
        _errorMessage = "อีเมลหรือรหัสผ่านไม่ถูกต้อง";
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("เข้าสู่ระบบ")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "อีเมล"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController, 
              obscureText: true,
              decoration: const InputDecoration(labelText: "รหัสผ่าน"),
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _login,
              child: _loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("เข้าสู่ระบบ"),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                // ไปหน้า Register
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                );
              },
              child: const Text("สมัครสมาชิก"),
            ),
          ],
        ),
      ),
    );
  }
}
