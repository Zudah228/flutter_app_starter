import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/constants.dart';
import 'error_view.dart';

class AsyncValueSwitcher<T> extends StatelessWidget {
  const AsyncValueSwitcher({
    super.key,
    required this.asyncValue,
    required this.onData,
    this.onError,
    this.onLoading,
    this.skipLoadingOnReload = true,
    this.skipLoadingOnRefresh = true,
    this.skipError = false,
    this.duration = kDefaultAsyncSwitchDuration,
    required this.refresh,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(T data) onData;
  final Widget? onLoading;
  final Widget Function(Object, StackTrace)? onError;
  final FutureOr<void> Function()? refresh;
  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      child: asyncValue.when(
        skipLoadingOnReload: skipLoadingOnReload,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipError: skipError,
        data: onData,
        error: (e, s) {
          return onError?.call(e, s) ?? ErrorView(refresh: refresh);
        },
        loading: () => onLoading ?? const SizedBox.shrink(),
      ),
    );
  }
}

class SliverAsyncValueSwitcher<T> extends StatelessWidget {
  const SliverAsyncValueSwitcher({
    super.key,
    required this.asyncValue,
    required this.onData,
    this.onError,
    this.onLoading,
    this.skipLoadingOnReload = true,
    this.skipLoadingOnRefresh = true,
    this.skipError = false,
    this.duration = kDefaultAsyncSwitchDuration,
    required this.refresh,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(T data) onData;
  final Widget? onLoading;
  final Widget Function(Object, StackTrace)? onError;
  final VoidCallback? refresh;
  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    // TODO(tsuda): アニメーションの追加
    return asyncValue.when(
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipError: skipError,
      data: onData,
      error: (e, s) {
        return SliverToBoxAdapter(
          child: ErrorView(refresh: refresh),
        );
      },
      loading: () => onLoading ?? const SliverToBoxAdapter(),
    );
  }
}
