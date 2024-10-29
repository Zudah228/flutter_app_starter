import 'package:flutter/material.dart';

import '../global_keys.dart';

enum _SnackBarMessageType {
  info,
  error,
  ;
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar({
  required String message,
  SnackBarAction? action,
  ScaffoldMessengerState? scaffoldMessengerState,

  /// SnackBar 表示前に、すでに表示されているものを非表示にする
  bool clearSnackBarsBeforeShow = false,
}) {
  return _show(
    message: message,
    messageType: _SnackBarMessageType.error,
    action: action,
    clearSnackBarsBeforeShow: clearSnackBarsBeforeShow,
    scaffoldMessengerState: scaffoldMessengerState,
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({
  required String message,
  SnackBarAction? action,
  ScaffoldMessengerState? scaffoldMessengerState,

  /// SnackBar 表示前に、すでに表示されているものを非表示にする
  bool clearSnackBarsBeforeShow = false,
}) {
  return _show(
    message: message,
    messageType: _SnackBarMessageType.info,
    action: action,
    clearSnackBarsBeforeShow: clearSnackBarsBeforeShow,
    scaffoldMessengerState: scaffoldMessengerState,
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _show({
  required String message,
  required _SnackBarMessageType messageType,
  SnackBarAction? action,
  ScaffoldMessengerState? scaffoldMessengerState,

  /// SnackBar 表示前に、すでに表示されているものを非表示にする
  bool clearSnackBarsBeforeShow = false,
}) {
  final state =
      scaffoldMessengerState ?? globalScaffoldMessengerKey.currentState!;

  if (clearSnackBarsBeforeShow) {
    state.clearSnackBars();
  }
  final context = scaffoldMessengerState?.context ??
      globalScaffoldMessengerKey.currentContext!;
  final colorScheme = Theme.of(context).colorScheme;

  Color? backgroundColor;
  Color? foregroundColor;

  switch (messageType) {
    case _SnackBarMessageType.info:
      break;
    case _SnackBarMessageType.error:
      backgroundColor = colorScheme.error;
      foregroundColor = colorScheme.onError;
  }

  return state.showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        message,
        style: TextStyle(color: foregroundColor),
      ),
      action: action,
    ),
  );
}
