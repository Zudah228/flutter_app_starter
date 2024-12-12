import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../locales/app_locales.dart';

part 'locale.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    const defaultLocale = MainAppLocales.defaultLocale;
    Intl.defaultLocale = defaultLocale.toLanguageTag();

    return defaultLocale;
  }

  @override
  set state(Locale value) {
    Intl.defaultLocale = value.toLanguageTag();
    super.state = value;
  }
}
