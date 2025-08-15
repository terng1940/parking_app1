import 'package:flutter/material.dart';

class SelectVehicleScreen extends StatelessWidget {
  SelectVehicleScreen({super.key});

  final List<Map<String, dynamic>> vehicles = [
    {"name": "รถเก๋งธรรมดา", "icon": Icons.directions_car},
    {"name": "มอเตอร์ไซค์", "icon": Icons.motorcycle},
    {"name": "รถตู้", "icon": Icons.airport_shuttle},
    {"name": "รถบัส", "icon": Icons.directions_bus},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("เลือกประเภทรถ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: vehicles.length,
          itemBuilder: (context, index) {
            final vehicle = vehicles[index];
            return GestureDetector(
              onTap: () {
                // บันทึกค่าที่เลือก (ตอนนี้เก็บชั่วคราวก่อน)
                print("เลือก: ${vehicle['name']}");
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(vehicle['icon'], size: 50, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(
                      vehicle['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
