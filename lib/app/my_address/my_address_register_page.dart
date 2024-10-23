import 'package:flutter/material.dart';

class MyAddressRegisterPage extends StatelessWidget {
  const MyAddressRegisterPage._();

  static const routeName = '/my_address_register';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MyAddressRegisterPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('住所登録'),
      ),
      body: const Center(child: Text('MyAddressRegisterPage')),
    );
  }
}
