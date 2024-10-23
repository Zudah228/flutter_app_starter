import 'package:riverpod/riverpod.dart';

import '../shared_preferences.dart';

abstract class BaseSharedPreferencesRepository<T> {
  const BaseSharedPreferencesRepository(this.ref);

  final Ref ref;

  SharedPreferencesKey get key;

  Future<void> save(T value) async {
    await ref.read(sharedPreferencesInfraProvider).save(key, value);
  }

  Future<T?> fetch() async {
    return ref.read(sharedPreferencesInfraProvider).fetch(key);
  }

  Future<void> remove() async {
    await ref.read(sharedPreferencesInfraProvider).remove(key);
  }
}
