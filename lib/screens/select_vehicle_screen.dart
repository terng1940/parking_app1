import 'package:flutter/material.dart';
import 'homepage_screen.dart'; 

class SelectVehicleScreen extends StatelessWidget {
  SelectVehicleScreen({super.key});

  final List<Map<String, dynamic>> vehicles = [
    {"name": "รถเก๋ง", "icon": Icons.directions_car},
    {"name": "มอเตอร์ไซค์", "icon": Icons.motorcycle},
    {"name": "รถตู้", "icon": Icons.airport_shuttle},
    {"name": "รถบัส", "icon": Icons.directions_bus},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("เลือกประเภทรถ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1, 
          ),
          itemCount: vehicles.length,
          itemBuilder: (context, index) {
            final vehicle = vehicles[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomepageScreen()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(vehicle["icon"], size: 48),
                  const SizedBox(height: 12),
                  Text(
                    vehicle["name"],
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}