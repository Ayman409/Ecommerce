import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefHelper {
  static SharedPreferences? sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> setDataList(
      {required String key, required List<String> list}) async {
    return await sharedPreferences!.setStringList(key, list);
  }

  static Object? getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static List<String>? getListData({required String key}) {
    return sharedPreferences!.getStringList(key);
  }

  static Future<bool> clear(String key) async {
    return await sharedPreferences!.remove(key);
  }

  static bool containsKey(String key) {
    return sharedPreferences!.containsKey(key);
  }
}
