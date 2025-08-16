import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../drawer/station_detail_sheet.dart';
import '../utils/mock_data.dart';

class SelectStationScreen extends StatefulWidget {
  const SelectStationScreen({super.key});

  @override
  State<SelectStationScreen> createState() => _SelectStationScreenState();
}

class _SelectStationScreenState extends State<SelectStationScreen> {
  String searchText = '';
  String filterColor = 'all';
  Station? activeStation;
  String? activeStationNo;

  @override
  Widget build(BuildContext context) {
    List<Station> filtered = MockStationData.stations.where((station) {
      bool matchFilter = filterColor == 'all' || station.line == filterColor;
      bool matchSearch = station.name.toLowerCase().contains(
        searchText.toLowerCase(),
      );
      return matchFilter && matchSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("เลือกสถานี")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'ค้นหาสถานี',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) {
                setState(() {
                  searchText = val;
                });
              },
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        filterColor == 'all' ? Colors.black : Colors.white,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        filterColor == 'all' ? Colors.white : Colors.grey[400],
                      ),
                      side: MaterialStateProperty.all(
                        filterColor == 'all'
                            ? BorderSide.none
                            : BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    onPressed: () => setState(() => filterColor = 'all'),
                    child: const Text('ทั้งหมด'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        filterColor == 'blue'
                            ? const Color(0xFF0E215A)
                            : Colors.white,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        filterColor == 'blue' ? Colors.white : Colors.grey[400],
                      ),
                      side: MaterialStateProperty.all(
                        filterColor == 'blue'
                            ? BorderSide.none
                            : BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    onPressed: () => setState(() => filterColor = 'blue'),
                    child: const Text('สายสีน้ำเงิน'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        filterColor == 'purple'
                            ? Color(0xFF6A2E6E)
                            : Colors.white,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        filterColor == 'purple'
                            ? Colors.white
                            : Colors.grey[400],
                      ),
                      side: MaterialStateProperty.all(
                        filterColor == 'purple'
                            ? BorderSide.none
                            : BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    onPressed: () => setState(() => filterColor = 'purple'),
                    child: const Text('สายสีม่วง'),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final station = filtered[index];
                  bool isActive = activeStation == station;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (isActive) {
                          activeStation = null;
                        } else {
                          activeStation = station;
                        }
                      });

                      if (!isActive) {
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              StationDetailSheet(station: station),
                        ).then((_) {
                          setState(() {
                            activeStation = null;
                          });
                        });
                      }
                    },
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? const Color(0xFF0E215A)
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                station.no,
                                style: TextStyle(
                                  color: isActive ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    station.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    station.hasParking
                                        ? "ว่าง"
                                        : "ไม่ว่าง",
                                    style: TextStyle(
                                      color: station.hasParking
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
