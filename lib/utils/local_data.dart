import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  SharedPreferences? prefs;
  String todoData = "todoData";
  setObject({required String key, required dynamic value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(key, value);
  }

  Future getObject({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    var data = prefs!.getString(key)!;
    return jsonDecode(data);
  }

  setString({required String key, required String value}) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString(key, value);
  }

  Future<String> getString({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(key)!;
  }

  setBool({required String key, required bool value}) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setBool(key, value);
  }

  Future<bool> getBool({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(key)!;
  }

  setDouble({required String key, required double value}) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setDouble(key, value);
  }

  Future<double> getDouble({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getDouble(key)!;
  }

  setStringList({required String key, required List<String> value}) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setStringList(key, value);
  }

  Future<List<String>> getStringList({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getStringList(key)!;
  }

  Future<bool> containData({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.containsKey(key);
  }

  removeData({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.remove(key);
  }
}
