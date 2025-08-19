import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenQrcodeWidget extends StatelessWidget{
  final String data;
  const GenQrcodeWidget({super.key, this.data = "https://example.com"});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImageView(
          data: data,              // ข้อความที่จะแปลงเป็น QR
          version: QrVersions.auto, // เลือกขนาด QR อัตโนมัติ
          size: 200.0,             // กำหนดขนาด
          gapless: false,
        ),
      ),
    );
  }
}