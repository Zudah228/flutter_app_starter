import 'package:flutter/material.dart';

import '../../settings/settings_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Rich Memo App')),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('設定'),
            onTap: () {
              Navigator.of(context).push(SettingsPage.route());
            },
          )
        ],
      ),
    );
  }
}
