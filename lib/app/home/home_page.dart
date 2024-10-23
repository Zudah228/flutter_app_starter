import 'package:flutter/material.dart';

import '../../app_core/routes/no_animation_route.dart';
import '../my_address/my_address_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  static Route<void> route() {
    return NoAnimationRoute.route(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const _Card(
        title: Text('住所管理'),
        route: MyAddressPage.route,
      )
    ];

    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.paddingOf(context).bottom,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.route, required this.title});

  final Route<dynamic> Function() route;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.of(context).pushAndRemoveUntil(
        route(),
        (_) => false,
      );
    }

    return Card(
      margin: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: title,
          ),
        ),
      ),
    );
  }
}
