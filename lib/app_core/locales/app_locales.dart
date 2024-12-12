import 'dart:ui';

abstract final class MainAppLocales {
  const MainAppLocales._();

  static const defaultLocale = Locale('ja', 'JP');
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('ja', 'JP'),
  ];
}
