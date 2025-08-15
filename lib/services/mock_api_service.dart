import 'dart:async';
import '../utils/mock_data.dart';

class MockApiService {
  static Future<String?> checkDuplicateUser({
    required String email,
    required String idCard,
    required String phone,
  }) async {
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
    return null;
  }

  static Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    for (var user in MockData.users) {
      if (user["email"] == email && user["password"] == password) {
        return true;
      }
    }
    return false;
  }
}
