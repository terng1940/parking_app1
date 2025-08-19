import 'package:flutter/material.dart';
import '../utils/storage_helper.dart';
import '../services/mock_api_service.dart';
import 'select_vehicle_screen.dart';

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

  bool _isValidIdCard(String idCard) {
    if (!RegExp(r'^[0-9]+$').hasMatch(idCard)) return false;

    if (!_validateIdCardChecksum(idCard)) return false;

    return true;
  }

  bool _validateIdCardChecksum(String id) {
    if (id.length != 13) return false;

    int sum = 0;
    for (int i = 0; i < 12; i++) {
      sum += int.parse(id[i]) * (13 - i);
    }

    int checkDigit = (11 - (sum % 11)) % 10;
    return checkDigit == int.parse(id[12]);
  }

  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

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

    final newUser = {
      "name": _nameController.text,
      "surname": _surnameController.text,
      "email": _emailController.text,
      "phone": _phoneController.text,
      "idCard": _idCardController.text,
      "password": _passwordController.text,
      "pin": _pinController.text,
    };

    await StorageHelper.saveUserData(newUser);

    setState(() {
      _loading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SelectVehicleScreen()),
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
                validator: (v) => v!.isEmpty ? "กรุณากรอกชื่อ" : null,
              ),
              TextFormField(
                controller: _surnameController,
                decoration: const InputDecoration(labelText: "Surname"),
                validator: (v) => v!.isEmpty ? "กรุณากรอกนามสกุล" : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (v) {
                  if (v!.isEmpty) return "กรุณากรอกอีเมล";
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                    return "รูปแบบอีเมลไม่ถูกต้อง";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                validator: (v) {
                  if (v!.isEmpty) return "กรุณากรอกเบอร์โทร";
                  if (!RegExp(r'^[0-9]+$').hasMatch(v)) return "ต้องเป็นตัวเลขเท่านั้น";
                  if (v.length != 10) return "ต้องมี 10 หลัก";
                  if (!v.startsWith('0')) return "ต้องขึ้นต้นด้วย 0";
                  return null;
                },
              ),
              TextFormField(
                controller: _idCardController,
                decoration: const InputDecoration(labelText: "ID Card"),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v!.isEmpty) return "กรุณากรอกบัตรประชาชน";
                  if (v.length != 13) return "ต้องมี 13 หลัก";
                  if (!RegExp(r'^[0-9]+$').hasMatch(v)) return "ต้องเป็นตัวเลขเท่านั้น";
                  if (!_isValidIdCard(v)) return "เลขบัตรประชาชนไม่ถูกต้อง";
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (v) {
                  if (v!.isEmpty) return "กรุณากรอกรหัสผ่าน";
                  if (v.length < 6) return "รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร";
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                ),
                obscureText: true,
                validator: (v) {
                  if (v != _passwordController.text) {
                    return "รหัสผ่านไม่ตรงกัน";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pinController,
                decoration: const InputDecoration(labelText: "PIN (4 หลัก)"),
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 4,
                validator: (v) {
                  if (v!.isEmpty) return "กรุณากรอก PIN";
                  if (v.length != 4) return "ต้องมี 4 หลัก";
                  if (!RegExp(r'^[0-9]+$').hasMatch(v))
                    return "ต้องเป็นตัวเลขเท่านั้น";
                  return null;
                },
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
