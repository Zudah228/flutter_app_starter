import 'package:flutter/material.dart';

abstract final class MainAppColorScheme {
  const MainAppColorScheme._();

  static const _seedColor = Colors.amber;

  static ColorScheme get light {
    return ColorScheme.fromSeed(seedColor: _seedColor);
  }

  static ColorScheme get dark {
    return ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    );
  }
}
