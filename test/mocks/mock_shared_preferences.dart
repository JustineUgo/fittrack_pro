import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences implements SharedPreferences {
  final Map<String, Object> _storage = {};

  @override
  dynamic get(String key) => _storage[key];

  @override
  Future<bool> setString(String key, String value) async {
    _storage[key] = value;
    return true;
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    _storage[key] = value;
    return true;
  }

  @override
  List<String>? getStringList(String key) {
    final value = _storage[key];
    return value is List<String> ? value : null;
  }

  @override
  Future<bool> clear() async {
    _storage.clear();
    return true;
  }

  @override
  String? getString(String key) => _storage[key] as String?;

  @override
  bool containsKey(String key) => _storage.containsKey(key);

  @override
  Set<String> getKeys() => _storage.keys.toSet();

  @override
  Future<bool> remove(String key) async {
    return _storage.remove(key) != null;
  }

  @override
  bool? getBool(String key) => throw UnimplementedError();

  @override
  double? getDouble(String key) => throw UnimplementedError();

  @override
  int? getInt(String key) => throw UnimplementedError();

  @override
  Future<bool> setBool(String key, bool value) => throw UnimplementedError();

  @override
  Future<bool> setDouble(String key, double value) =>
      throw UnimplementedError();

  @override
  Future<bool> setInt(String key, int value) => throw UnimplementedError();

  @override
  Future<bool> reload() async => true;

  @override
  Future<bool> commit() async {
    return true;
  }
}
