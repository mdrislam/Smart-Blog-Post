import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static late SharedPreferences _prefs;
  static void init(SharedPreferences prefs) async {
    _prefs = prefs;
  }

  static void setString({String? key, dynamic value}) {
    _prefs.setString(key.toString(), value);
  }

  static void setInt({String? key, dynamic value}) {
    _prefs.setInt(key.toString(), value);
  }

  static void setBool({String? key, dynamic value}) {
    _prefs.setBool(key.toString(), value);
  }

  static void remove({String? key}) {
    _prefs.remove(key.toString());
  }

  static String? getString({String? key}) {
    return _prefs.getString(key.toString());
  }

  static int? getInt({String? key}) {
    return _prefs.getInt(key.toString());
  }

  static bool? getBool({String? key}) {
    return _prefs.getBool(key.toString());
  }

  static bool eraseAll() {
    _prefs.clear();
    return true;
  }
}
