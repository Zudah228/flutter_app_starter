import 'package:riverpod/riverpod.dart';

import 'shared_preferences.dart';

/// SharedPreferences の基本的な CRUD を提供できる抽象クラス
abstract class BaseSharedPreferencesService<T> {
  const BaseSharedPreferencesService(this.ref);

  final Ref ref;

  SharedPreferencesKey get key;

  Future<void> save(T value) async {
    await ref.read(sharedPreferencesServiceProvider).save(key, value);
  }

  T? fetch() {
    return ref.read(sharedPreferencesServiceProvider).fetch(key);
  }

  Future<void> remove() async {
    await ref.read(sharedPreferencesServiceProvider).remove(key);
  }
}
