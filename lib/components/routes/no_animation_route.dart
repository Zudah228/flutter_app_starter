import 'package:flutter/material.dart';

abstract final class NoAnimationRoute {
  static Route<void> route<T>({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, __, ___) => builder(context),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      fullscreenDialog: fullscreenDialog,
      settings: settings,
    );
  }
}
