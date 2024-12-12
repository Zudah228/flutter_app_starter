import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_key.dart';

export 'shared_preferences_key.dart';

part 'shared_preferences.g.dart';

@Riverpod(keepAlive: false)
SharedPreferencesService sharedPreferencesService(Ref ref) {
  throw UnimplementedError();
}

class SharedPreferencesService {
  SharedPreferencesService(this._prefs);

  static Future<SharedPreferencesService> init() async {
    return SharedPreferencesService(await SharedPreferences.getInstance());
  }

  final SharedPreferences _prefs;

  Future<bool> save<T>(SharedPreferencesKey key, T value) async {
    final keyName = key.keyName;

    if (value is int) {
      return _prefs.setInt(keyName, value);
    }
    if (value is double) {
      return _prefs.setDouble(keyName, value);
    }
    if (value is bool) {
      return _prefs.setBool(keyName, value);
    }
    if (value is String) {
      return _prefs.setString(keyName, value);
    }
    if (value is Enum) {
      return _prefs.setString(keyName, value.name);
    }
    if (value is List<String>) {
      return _prefs.setStringList(keyName, value);
    }
    return false;
  }

  T? fetch<T>(SharedPreferencesKey key) {
    final keyName = key.keyName;

    if (T == int) {
      return _prefs.getInt(keyName) as T?;
    }
    if (T == double) {
      return _prefs.getDouble(keyName) as T?;
    }
    if (T == bool) {
      return _prefs.getBool(keyName) as T?;
    }
    if (T == String) {
      return _prefs.getString(keyName) as T?;
    }
    if (T == List<String>) {
      return _prefs.getStringList(keyName) as T?;
    }
    return null;
  }

  Future<bool> remove(SharedPreferencesKey key) => _prefs.remove(key.keyName);
}
