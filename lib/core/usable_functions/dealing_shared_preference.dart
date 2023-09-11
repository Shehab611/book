// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:shared_preferences/shared_preferences.dart';
//all works done
abstract final class  CacheHelper {
  static SharedPreferences? sharedPreferences;

  static void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> saveData(
      {required String key,
      required dynamic value,
      bool override = false}) async {

    if (sharedPreferences!.containsKey(key) && !override) return false;

    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) async {
      if (!sharedPreferences!.containsKey(key)) return false;
    return await sharedPreferences!.remove(key);
  }
}
