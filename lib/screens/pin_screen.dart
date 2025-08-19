import 'package:flutter/material.dart';
import 'select_vehicle_screen.dart';
import '../utils/storage_helper.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String? _savedPin;
  String _enteredPin = '';
  bool isError = false;

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
    if (_enteredPin == _savedPin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SelectVehicleScreen()),
      );
    } else {
      setState(() {
        isError = true;
        _enteredPin = '';
      });
      
      _showErrorPopup();
    }
  }

  void _showErrorPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 48,
              ),
              SizedBox(height: 16),
              Text(
                'ขออภัย',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'รหัสผ่านไม่ถูกต้อง กรุณาใส่รหัสผ่านอีกครั้ง',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 4),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity, 
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF0E215A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('ตกลง'), 
              ),
            ),
          ],
        );
      },
    );
  }

  void _onKeyTap(String key) {
    setState(() {
      isError = false; 
      if (key == 'back') {
        if (_enteredPin.isNotEmpty) _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
      } else {
        if (_enteredPin.length < 4) _enteredPin += key;
      }

      if (_enteredPin.length == 4) {
        _checkPin();
      }
    });
  }

  Widget _buildPinIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        bool filled = index < _enteredPin.length;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: filled ? Colors.black : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget _buildKeypadButton(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () => _onKeyTap(label),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(22),
            shape: const CircleBorder(),
            backgroundColor: Colors.grey[200],
          ),
          child: Text(
            label == 'back' ? '⌫' : label,
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'กรุณาใส่ PIN 4 หลัก',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            _buildPinIndicator(),
            const SizedBox(height: 40),

            // Keypad
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  // แถว 1-3
                  for (var row in [
                    ['1', '2', '3'],
                    ['4', '5', '6'],
                    ['7', '8', '9'],
                  ])
                    Row(
                      children: row
                          .map((key) => _buildKeypadButton(key))
                          .toList(),
                    ),
                  
                  // แถวสุดท้าย (0 อยู่กลาง, back อยู่ขวา)
                  Row(
                    children: [
                      Expanded(child: Container()), // ปุ่มว่างทางซ้าย
                      _buildKeypadButton('0'), // ปุ่ม 0 อยู่กลาง
                      _buildKeypadButton('back'), // ปุ่ม back อยู่ขวา
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}