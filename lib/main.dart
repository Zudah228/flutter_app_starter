import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/home/home_page.dart';
import 'app/my_address/my_address_page.dart';
import 'dependency_injection/di_container.dart';
import 'domain/initial_page_cache/initial_page_cache_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = await DIContainer.getContainer();

  final home = await _home(container);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MainApp(home: home),
    ),
  );
}

Future<Widget> _home(ProviderContainer container) async {
  final initialPageCache =
      await container.read(initialPageCacheRepositoryProvider).fetch();

  final Widget home;

  switch (initialPageCache) {
    case MyAddressPage.routeName:
      home = const MyAddressPage();
    default:
      home = const HomePage();
  }

  return home;
}
