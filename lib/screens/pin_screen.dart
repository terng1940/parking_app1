import 'package:flutter/material.dart';
import '../utils/storage_helper.dart';
import 'select_vehicle_screen.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController _pinController = TextEditingController();
  String? _savedPin;
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    _loadSavedPin();
  }

  void _loadSavedPin() async {
    final pin = await StorageHelper.getPin();
    setState(() {
      _savedPin = pin;
    });
  }

  void _checkPin() {
    if (_pinController.text == _savedPin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => SelectVehicleScreen()));
    } else {
      setState(() {
        _errorText = 'PIN ไม่ถูกต้อง';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('กรอก PIN')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'กรุณาใส่ PIN 4 หลัก',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _pinController,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 4,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '****',
                errorText: _errorText.isEmpty ? null : _errorText,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPin,
              child: const Text('เข้าสู่ระบบ'),
            ),
          ],
        ),
      ),
    );
  }
}
