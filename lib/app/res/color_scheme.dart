import 'package:flutter/material.dart';

abstract final class MainAppColorScheme {
  const MainAppColorScheme._();

  static ColorScheme get light {
    return const ColorScheme.light();
  }

  static ColorScheme get dark {
    return const ColorScheme.dark();
  }
}
