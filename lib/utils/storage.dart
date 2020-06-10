import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  // 设置布尔的值
  static setBoolItem(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  // 设置double的值
  static setDoubleItem(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  // 设置int的值
  static setIntItem(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  // 设置Sting的值
  static setStringItem(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // 设置StringList
  static setStringListItem(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  // 获取返回为bool的内容
  static getBoolItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key);
    return value;
  }

  // 获取返回为double的内容
  static getDoubleItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    double value = prefs.getDouble(key);
    return value;
  }

  // 获取返回为int的内容
  static getIntItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(key);
    return value;
  }

  // 获取返回为String的内容
  static getStringItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key);
    return value;
  }

  // 获取返回为StringList的内容
  static getStringListItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> value = prefs.getStringList(key);
    return value;
  }

  // 移除单个
  static remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // 清空所有的
  static clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

final String tokenKey = 'TOKEN';
