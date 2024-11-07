import 'package:riverpod/riverpod.dart' show Override;

import '../infrastructure/shared_preferences/shared_preferences.dart';

abstract final class DependencyInjection {
  static Future<List<Override>> overrides() async {
    late final SharedPreferencesInfra sharedPreferencesInfra;

    await Future.wait([
      Future(() async {
        sharedPreferencesInfra = await SharedPreferencesInfra.init();
      }),
    ]);

    return [
      sharedPreferencesInfraProvider.overrideWithValue(sharedPreferencesInfra)
    ];
  }
}
