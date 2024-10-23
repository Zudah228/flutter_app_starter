import 'package:flutter/material.dart';

import 'color_scheme.dart';

abstract final class MainAppThemeData {
  const MainAppThemeData._();

  static ThemeData get light {
    return _base(
      MainAppColorScheme.light,
      const TextTheme(),
    );
  }

  static ThemeData get dark {
    return _base(
      MainAppColorScheme.dark,
      const TextTheme(),
    );
  }

  static ThemeData _base(ColorScheme colorScheme, TextTheme textTheme) {
    final foundation = ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
    );

    return foundation.copyWith(
      cardTheme: const CardTheme(
        clipBehavior: Clip.antiAlias,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainer,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
