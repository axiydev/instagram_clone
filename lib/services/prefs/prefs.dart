import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<bool?> saveDataToLocal(
      {required String? key, required String? data}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(key!, data!);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<String?> loadDataToLocal({required String? key}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key!);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
