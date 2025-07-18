import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  
  static String themeModeKey = "_themeMode_";



  void store({required String key, required dynamic value});
  void storeList({required String key, required List value});
  dynamic retrieve({required String key});
  List<String>? retrieveList({required String key});
  Future cleanStorage();
}

class SharedPreferenceService implements StorageService {
  final SharedPreferences _prefs;

  SharedPreferenceService(this._prefs);

  @override
  dynamic retrieve({required String key}) {
    String? value = _prefs.get(key) as String?;
    return value == null ? null : json.decode(value);
  }

  @override
  List<String>? retrieveList({required String key}) {
    List<String>? value = _prefs.getStringList(key);
    return value;
  }

  @override
  void store({required String key, required value}) {
    _prefs.setString(key, json.encode(value));
  }

  @override
  void storeList({required String key, required List value}) {
    _prefs.setStringList(key, value.map((id) => id.toString()).toList());
  }

  @override
  Future cleanStorage() async {
    await _prefs.clear();
  }
}