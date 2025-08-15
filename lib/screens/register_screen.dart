import 'package:flutter/material.dart';
import '../utils/storage_helper.dart';
import '../utils/mock_data.dart';
import '../services/mock_api_service.dart';
import 'homepage_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _idCardController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _pinController = TextEditingController();

  String? _errorMessage;
  bool _loading = false;

  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    // จำลองเรียก API
    final duplicateMsg = await MockApiService.checkDuplicateUser(
      email: _emailController.text,
      idCard: _idCardController.text,
      phone: _phoneController.text,
    );

    if (duplicateMsg != null) {
      setState(() {
        _errorMessage = duplicateMsg;
        _loading = false;
      });
      return;
    }

    // Save PIN
    await StorageHelper.savePin(_pinController.text);

    // Mock save user
    MockData.users.add({
      "email": _emailController.text,
      "idCard": _idCardController.text,
      "phone": _phoneController.text,
    });

    setState(() {
      _loading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomepageScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (v) => v!.isEmpty ? "กรอกชื่อ" : null,
              ),
              TextFormField(
                controller: _surnameController,
                decoration: const InputDecoration(labelText: "Surname"),
                validator: (v) => v!.isEmpty ? "กรอกนามสกุล" : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (v) => v!.isEmpty
                    ? "กรอกอีเมล"
                    : (!v.contains("@") ? "อีเมลไม่ถูกต้อง" : null),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
                keyboardType: TextInputType.phone,
                validator: (v) => v!.isEmpty ? "กรอกเบอร์โทร" : null,
              ),
              TextFormField(
                controller: _idCardController,
                decoration: const InputDecoration(labelText: "ID Card"),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty
                    ? "กรอกบัตรประชาชน"
                    : (v.length != 13 ? "ต้องมี 13 หลัก" : null),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (v) => v!.isEmpty ? "กรอกรหัสผ่าน" : null,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(labelText: "Confirm Password"),
                obscureText: true,
                validator: (v) =>
                    v != _passwordController.text ? "รหัสผ่านไม่ตรงกัน" : null,
              ),
              TextFormField(
                controller: _pinController,
                decoration: const InputDecoration(labelText: "PIN (4 หลัก)"),
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 4,
                validator: (v) => v!.length != 4 ? "ต้องมี 4 หลัก" : null,
              ),
              const SizedBox(height: 20),
              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _register,
                      child: const Text("Register"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
