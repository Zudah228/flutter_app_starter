import 'package:flutter/material.dart';

import '../app_core/theme/theme.dart';
import 'home/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MainAppThemeData.light,
      darkTheme: MainAppThemeData.dark,
      home: const HomePage(),
    );
  }
}
