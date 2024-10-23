import 'package:flutter/material.dart';

import '../app_core/global_keys.dart';
import '../app_core/theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.home});

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      scaffoldMessengerKey: globalScaffoldMessengerKey,
      theme: MainAppThemeData.light,
      darkTheme: MainAppThemeData.dark,
      home: home,
    );
  }
}
