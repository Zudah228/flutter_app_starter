import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  T pageArgs<T extends Object?>() =>
      ModalRoute.of(this)!.settings.arguments as T;

  Color get scaffoldBackgroundColor =>
      Scaffold.of(this).widget.backgroundColor ??
      Theme.of(this).scaffoldBackgroundColor;
}
