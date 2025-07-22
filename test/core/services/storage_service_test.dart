import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fittrack_pro/core/services/storage_service.dart';
import '../../mocks/mock_shared_preferences.dart';

void main() {
  late MockSharedPreferences mockPrefs;
  late SharedPreferenceService storageService;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    storageService = SharedPreferenceService(mockPrefs);
  });

  group('SharedPreferenceService ', () {
    test('store encodes and stores JSON', () {
      const key = 'user';
      final value = {'name': 'Alice'};

      storageService.store(key: key, value: value);

      final raw = mockPrefs.getString(key);
      expect(raw, json.encode(value));
    });

    test('retrieve decodes stored JSON', () {
      const key = 'user';
      final data = {'name': 'Bob'};
      mockPrefs.setString(key, json.encode(data));

      final result = storageService.retrieve(key: key);

      expect(result, isA<Map>());
      expect(result['name'], 'Bob');
    });

    test('storeList stores a list of strings', () {
      const key = 'list';
      final list = ['a', 'b', 'c'];

      storageService.storeList(key: key, value: list);

      expect(mockPrefs.getStringList(key), list);
    });

    test('retrieveList gets list of strings', () {
      const key = 'ids';
      final list = ['1', '2', '3'];
      mockPrefs.setStringList(key, list);

      final result = storageService.retrieveList(key: key);
      expect(result, list);
    });

    test('cleanStorage clears all keys', () async {
      mockPrefs.setString('foo', 'bar');
      mockPrefs.setStringList('list', ['a']);

      await storageService.cleanStorage();

      expect(mockPrefs.get('foo'), isNull);
      expect(mockPrefs.getStringList('list'), isNull);
    });
  });
}
