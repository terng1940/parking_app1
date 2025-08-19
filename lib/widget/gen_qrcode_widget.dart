import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenQrcodeWidget extends StatelessWidget {
  final String data;
  const GenQrcodeWidget({super.key, this.data = "https://example.com"});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QR Code'),
          bottom: const TabBar(
            labelColor: Color(0xFF0E215A),
            indicatorColor : Color(0xFF0E215A),
            tabs: [
              Tab(text: 'รายวัน'),
              Tab(text: 'รายเดือน'),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildDailyTab(context), _buildMonthlyTab(context)],
        ),
      ),
    );
  }

  Widget _buildDailyTab(BuildContext context) {
    return Container(
      color: Color(0xFF0E215A),
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Card(
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'QR รายวันของคุณ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('เลขทะเบียน: -', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 16),
                const Text(
                  'สแกน QR Code เพื่อเข้าลานจอด',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'เมื่อสแกน QR code เรียบร้อยแล้ว ค่าบริการจะถูกนับ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ตั้งแต่เวลาเข้าจนถึงเวลาออกจากลานจอดรถ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                QrImageView(
                  data: data,
                  version: QrVersions.auto,
                  size: 200.0,
                  gapless: false,
                ),
                const SizedBox(height: 16),
                const Text(
                  'REF-20231015-001',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'รายละเอียดข้อกำหนดและเงื่อนไข',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMonthlyTab(BuildContext context) {
    return Container(
      color: Color(0xFF0E215A),
      padding: const EdgeInsets.all(16.0),
    );
  }
}
