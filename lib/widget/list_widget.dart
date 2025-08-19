import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ประวัติการทำรายการ'),
          bottom: const TabBar(
            indicatorColor: Color(0xFF0E215A),
            labelColor: Color(0xFF0E215A), // สีข้อความแท็บที่เลือก
            unselectedLabelColor: Color.fromARGB(104, 48, 46, 46), // สีข้อความแท็บที่ไม่เลือก
            tabs: [
              Tab(text: 'รายการที่ต้องชำระ'),
              Tab(text: 'ประวัติการชำระ'),
              Tab(text: 'ประวัติการจอดรถ'),
            ],
            labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                'คุณไม่มียอดชำระคงค้างอยู่ในระบบ',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Center(
              child: Text(
                'คุณยังไม่มีประวัติการชำระ',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Center(
              child: Text(
                'คุณยังไม่มีประวัติการจอดรถ',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
