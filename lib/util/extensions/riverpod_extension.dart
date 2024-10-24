import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AutoDispose の Provider を、一定時間破棄せずに保持するための拡張
///
/// ２回目以降の取得が早くなる便利な機能だが、
/// 再取得のためには invalidate を明示的に実行する必要があるのは注意。
///
/// https://riverpod.dev/docs/essentials/auto_dispose#example-keeping-state-alive-for-a-specific-amount-of-time
extension CacheForExtension on Ref<Object?> {
  void cacheFor([CacheDuration duration = CacheDuration.short]) {
    final link = keepAlive();
    final timer = Timer(duration.duration, link.close);

    onDispose(timer.cancel);
  }
}

/// キャッシュ期間を細かくカスタマイズする必要はないので、
/// 迷いを少なくして、仕様を単純にするためにパターン化する
enum CacheDuration {
  /// 最小値
  /// ほとんど使う機会はない
  min(duration: Duration(seconds: 5)),

  /// 少しの間保持する
  /// 多くの場合で使う
  short(duration: Duration(minutes: 5)),

  /// ずっと保持するものではないが、長い間保持したい場合に使う
  long(duration: Duration(hours: 1)),
  ;

  const CacheDuration({required this.duration});

  final Duration duration;
}
