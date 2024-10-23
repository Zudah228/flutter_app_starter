import 'package:riverpod/riverpod.dart';

import '../infrastructure/shared_preferences/shared_preferences.dart';

abstract final class DIContainer {
  static Future<ProviderContainer> getContainer() async {
    late final SharedPreferencesInfra sharedPreferencesInfra;

    await Future.wait([
      Future(() async {
        sharedPreferencesInfra = await SharedPreferencesInfra.init();
      }),
    ]);

    return ProviderContainer(
      overrides: [
        sharedPreferencesInfraProvider.overrideWithValue(sharedPreferencesInfra)
      ],
    );
  }
}
