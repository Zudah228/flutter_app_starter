import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'res/theme.dart';

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
