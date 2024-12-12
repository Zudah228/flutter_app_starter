import 'package:riverpod/riverpod.dart' show Override;

import '../service/package_info/package_info.dart';
import '../service/shared_preferences/shared_preferences.dart';

abstract final class DependencyInjection {
  static Future<List<Override>> overrides() async {
    late final SharedPreferencesService sharedPreferencesService;
    late final PackageInfoService packageInfoService;

    await Future.wait([
      Future(() async {
        sharedPreferencesService = await SharedPreferencesService.init();
      }),
      Future(() async {
        packageInfoService = await PackageInfoService.init();
      }),
    ]);

    return [
      sharedPreferencesServiceProvider
          .overrideWithValue(sharedPreferencesService),
      packageInfoServiceProvider.overrideWithValue(packageInfoService),
    ];
  }
}
