import 'package:flutter/material.dart';
import '../utils/mock_data.dart';

class StationDetailSheet extends StatelessWidget {
  final Station station;

  const StationDetailSheet({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text("สาย: ${station.line}"),
            Text(station.hasParking
                ? "ที่จอดว่าง: ${station.availableSlots} ช่อง"
                : "ไม่มีที่จอด"),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey[300],
                  child: const Center(child: Text("Map / Location Placeholder")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
