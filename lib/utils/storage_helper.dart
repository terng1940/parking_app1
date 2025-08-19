import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  /// บันทึกข้อมูลผู้ใช้ (email, password, pin)
  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', json.encode(userData));
  }

  /// ดึงข้อมูลผู้ใช้
  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('user_data');
    return data != null ? json.decode(data) : null;
  }

  /// ดึง PIN ของผู้ใช้
  static Future<String?> getPin() async {
    final userData = await getUserData();
    return userData?['pin'];
  }

  /// ตรวจสอบว่า user มีข้อมูลอยู่หรือไม่
  static Future<bool> hasUser() async {
    final data = await getUserData();
    return data != null;
  }

  /// Session management

  /// บันทึก session ว่า login อยู่หรือไม่
  static Future<void> saveSession(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  /// ดึง session
  static Future<bool> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  /// ล้าง session (logout)
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  /// ใช้สำหรับ debug หรือ reset แอพจริง ๆ (ไม่ควรเรียกตอน logout)
  static Future<void> clearAllUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
    await prefs.remove('isLoggedIn');
  }
}
