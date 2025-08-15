import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static const _pinKey = 'user_pin';

  static Future<void> savePin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pinKey, pin);
  }

  static Future<String?> getPin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_pinKey);
  }
}
