import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  SharedPreferences? prefs;
  String todoData = "todoData";
  setObject(String key, dynamic value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(key, value);
  }

  Future getObject(String key) async {
    prefs = await SharedPreferences.getInstance();
    var data = prefs!.getString(key)!;
    return jsonDecode(data);
  }

  setString(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString(key, value);
  }

  Future<String> getString(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(key)!;
  }

  setBool(String key, bool value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(key)!;
  }

  setDouble(String key, double value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setDouble(key, value);
  }

  Future<double> getDouble(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getDouble(key)!;
  }

  setStringList(String key, List<String> value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setStringList(key, value);
  }

  Future<List<String>> getStringList(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getStringList(key)!;
  }

  Future<bool> containData(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.containsKey(key);
  }

  removeData(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.remove(key);
  }
}
