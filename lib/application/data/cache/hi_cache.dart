import 'package:shared_preferences/shared_preferences.dart';

class HiCache {
  SharedPreferences? prefs;

  HiCache._() {
    init();
  }

  static HiCache? mInstance;

  HiCache._pre(SharedPreferences pref) {
    prefs = pref;
  }

  static Future<HiCache> preInit() async {
    if (mInstance == null) {
      var prefs = await SharedPreferences.getInstance();
      mInstance = HiCache._pre(prefs);
    }
    return mInstance!;
  }

  static HiCache getInstance() {
    mInstance ??= HiCache._();
    return mInstance!;
  }

  void init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return prefs?.getStringList(key);
  }

  Object? get(String key) {
    return prefs?.get(key);
  }

  Object? getWithDefault(String key, Object defaultValue) {
    return prefs?.get(key) ?? defaultValue;
  }
}
