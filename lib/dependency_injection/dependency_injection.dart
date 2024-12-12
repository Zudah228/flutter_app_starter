import 'package:riverpod/riverpod.dart' show Override;

import '../service/shared_preferences/shared_preferences.dart';

abstract final class DependencyInjection {
  static Future<List<Override>> overrides() async {
    late final SharedPreferencesService sharedPreferencesService;

    await Future.wait([
      Future(() async {
        sharedPreferencesService = await SharedPreferencesService.init();
      }),
    ]);

    return [
      sharedPreferencesServiceProvider.overrideWithValue(sharedPreferencesService)
    ];
  }
}
