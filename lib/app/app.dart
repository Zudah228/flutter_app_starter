import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_core/global_keys.dart';
import '../app_core/locales/app_locales.dart';
import '../app_core/providers/locale/locale.dart';
import '../app_core/providers/theme_mode/theme_mode.dart';
import '../app_core/theme/theme.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key, required this.home});

  final Widget home;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeNotifierProvider);
    final themeMode = ref.watch(themeModeNotifierProvider);

    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      scaffoldMessengerKey: globalScaffoldMessengerKey,
      themeMode: themeMode,
      theme: MainAppThemeData.light,
      darkTheme: MainAppThemeData.dark,
      home: home,
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: MainAppLocales.supportedLocales,
    );
  }
}
