import 'dart:async';
import '../utils/mock_data.dart';

class MockApiService {
  // จำลองการเช็คข้อมูลซ้ำเหมือนเรียก API จริง
  static Future<String?> checkDuplicateUser({
    required String email,
    required String idCard,
    required String phone,
  }) async {
    // จำลองการหน่วงเวลา API
    await Future.delayed(const Duration(seconds: 1));

    for (var user in MockData.users) {
      if (user["email"] == email) {
        return "อีเมลนี้มีผู้ใช้แล้ว";
      }
      if (user["idCard"] == idCard) {
        return "บัตรประชาชนนี้มีผู้ใช้แล้ว";
      }
      if (user["phone"] == phone) {
        return "เบอร์โทรนี้มีผู้ใช้แล้ว";
      }
    }
    return null; // ไม่มีข้อมูลซ้ำ
  }
}
