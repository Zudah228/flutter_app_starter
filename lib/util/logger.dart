import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:stack_trace/stack_trace.dart' show Trace;

final logger = AppLogger.instance;

const _kEnableLog = kDebugMode;

enum _Color {
  red,
  yellow,
  white,
  grey,
}

/// シングルトン
/// ログ表示はデバッグビルド時のみ有効
class AppLogger {
  AppLogger._();

  static AppLogger get instance => _instance;

  static final _instance = AppLogger._();

  final _prefix = <_Color, String>{
    _Color.red: '\x1B[31m',
    _Color.yellow: '\x1B[33m',
    _Color.white: '\x1B[37m',
    _Color.grey: '\x1B[90m',
  };

  final _suffix = '\x1B[0m';

  void _printLog(String message, _Color color, [StackTrace? stackTrace]) {
    final frames = Trace.current(1).frames;
    final frame = frames.length > 1 ? frames[1] : null;
    final output = '${_prefix[color]}$message$_suffix ${frame?.location ?? ''}';

    // iOSビルド時はログ出力にカラーが適用されないことへの対策として
    // developer.log()を使用している
    // Issue: https://github.com/flutter/flutter/issues/64491
    developer.log(
      output,
      stackTrace: stackTrace,
    );
  }

  String _format(dynamic message) {
    if (message is Function) {
      // ignore: avoid_dynamic_calls
      return message().toString();
    } else if (message is String) {
      return message;
    } else {
      return message.toString();
    }
  }

  void info(dynamic message) {
    if (_kEnableLog) {
      _printLog('💬 ${_format(message)}', _Color.white);
    }
  }

  void debug(dynamic message) {
    if (_kEnableLog) {
      _printLog('💬 ${_format(message)}', _Color.grey);
    }
  }

  void warning(dynamic message, [StackTrace? stackTrace]) {
    if (_kEnableLog) {
      _printLog('💣 ${_format(message)}', _Color.yellow, stackTrace);
    }
  }

  void shout(dynamic message, [StackTrace? stackTrace]) {
    if (_kEnableLog) {
      _printLog('💥 ${_format(message)}', _Color.red, stackTrace);
    }
  }
}
