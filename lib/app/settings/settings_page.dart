import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_core/providers/locale/locale.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage._();

  static const routeName = '/settings';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SettingsPage._(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('言語'),
            trailing: Text(ref.watch(localeNotifierProvider).toLanguageTag()),
          ),
        ],
      ),
    );
  }
}
