import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Future<bool> saveString({required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<bool> saveMap({required String key, required Map<String, dynamic> value}) async {
    return saveString(key: key, value: jsonEncode(value));
  }

  static Future<String> getString(String key, [String defaultValue = '']) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultValue;
  }

  static Future<Map<String, dynamic>> getMap({required String key}) async {
    try {
      return jsonDecode(await getString(key));
    }catch(_) {
      return {};
    }
  }

  static Future<bool> remove({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}