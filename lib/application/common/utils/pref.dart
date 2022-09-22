import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Pref {
  Pref._internal();
  static final Pref _instance = Pref._internal();
  factory Pref() => _instance;

  /// ==========================组合函数=================================
  /// JSON
  Future<dynamic> getJSON(String key) async {
    String? jsonString = await getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setJSON(String key, dynamic jsonVal) async {
    String jsonString = jsonEncode(jsonVal);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, jsonString);
  }

  /// ==========================基础函数=================================
  /// 是否包含该Key
  Future<bool> containsKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<bool> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  /// String
  Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> setString(String key, String? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      return prefs.setString(key, value);
    }
    return prefs.remove(key);
  }

  /// Int
  Future<int?> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<bool> setInt(String key, int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      return prefs.setInt(key, value);
    }
    return prefs.remove(key);
  }

  /// Double
  Future<double?> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  Future<bool> setDouble(String key, double? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      return prefs.setDouble(key, value);
    }
    return prefs.remove(key);
  }

  /// Bool
  Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<bool> setBool(String key, bool? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      return prefs.setBool(key, value);
    }
    return prefs.remove(key);
  }
}
