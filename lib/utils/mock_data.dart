class MockData {
  static List<Map<String, String>> users = [
    {
      "name": "Test",
      "surname": "User01",
      "email": "test01@example.com",
      "phone": "0876543219",
      "idCard": "1234567890123",
      "password": "123456",
      "pin": "1234"
    },
    {
      "name": "Test",
      "surname": "User02",
      "email": "test02@example.com",
      "phone": "0987654321",
      "idCard": "1234567890123",
      "password": "123456",
      "pin": "5678"
    },
  ];
}

class Station {
  final String no;
  final String name;
  final String line; 
  final bool hasParking;
  final int availableSlots;

  Station({
    required this.no,
    required this.name,
    required this.line,
    required this.hasParking,
    required this.availableSlots,
  });
}

class MockStationData {
  static final List<Station> stations = [
    Station(
      no: "001",
      name: "หัวลำโพง",
      line: "blue",
      hasParking: true,
      availableSlots: 25,
    ),
    Station(
      no: "002",
      name: "สามย่าน",
      line: "blue",
      hasParking: false,
      availableSlots: 0,
    ),
    Station(
      no: "003",
      name: "ศูนย์วัฒนธรรมฯ",
      line: "blue",
      hasParking: true,
      availableSlots: 12,
    ),
    Station(
      no: "004",
      name: "พระราม 9",
      line: "blue",
      hasParking: true,
      availableSlots: 40,
    ),
    Station(
      no: "005",
      name: "สุขุมวิท",
      line: "blue",
      hasParking: false,
      availableSlots: 0,
    ),
    Station(
      no: "006",
      name: "บางซื่อ",
      line: "blue",
      hasParking: true,
      availableSlots: 8,
    ),
    Station(
      no: "007",
      name: "เตาปูน",
      line: "blue",
      hasParking: true,
      availableSlots: 18,
    ),
    Station(
      no: "008",
      name: "คลองบางไผ่",
      line: "purple",
      hasParking: true,
      availableSlots: 30,
    ),
    Station(
      no: "009",
      name: "บางใหญ่",
      line: "purple",
      hasParking: true,
      availableSlots: 15,
    ),
    Station(
      no: "010",
      name: "บางพลู",
      line: "purple",
      hasParking: false,
      availableSlots: 0,
    ),
  ];
}
