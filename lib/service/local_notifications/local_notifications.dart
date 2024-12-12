import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../util/logger.dart';
import '../platform_permission/platform_permission.dart';

part 'local_notifications.g.dart';

@riverpod
LocalNotificationsService localNotificationsService(Ref ref) {
  final instance = LocalNotificationsService(
    ref,
    FlutterLocalNotificationsPlugin(),
  );

  ref.onDispose(instance.onDispose);

  return instance;
}

/// Android用の優先度の高い通知チャンネル
const _kAndroidChannel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.max,
);

class LocalNotificationsService {
  LocalNotificationsService(
    this._ref,
    this._flutterLocalNotificationsPlugin,
  );

  final Ref _ref;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final BehaviorSubject<Map<String, dynamic>> _onTapListener =
      BehaviorSubject<Map<String, dynamic>>();
  BehaviorSubject<Map<String, dynamic>> get onTapListener => _onTapListener;

  /// main内で呼ぶ FlutterLocalNotificationsPlugin の初期化メソッド
  Future<void> initialize() async {
    // v1 のローカルプッシュを解消するための cancel 実行
    // 本来、cancel(id) でキャンセルしたいが、id が固定値でなかったため、やむを得ず cancelAll を使っている
    await _flutterLocalNotificationsPlugin.cancelAll();

    final enable = await _ref
        .read(platformPermissionServiceProvider)
        .notification
        .enable();

    if (!enable) {
      return;
    }

    await onInit();
  }

  Future<void> onInit() async {
    await _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),

      /// the [onDidReceiveNotificationResponse] callback is fired when the user selects a notification or notification action that should show the application/user interface.
      onDidReceiveNotificationResponse: (event) {
        logger.info('Tap Notification ${event.payload}');

        if (event.payload case final payload?) {
          _onTapListener.add(jsonDecode(payload) as Map<String, dynamic>);
        }
      },
    );

    // Androidは優先度の高い通知チャンネルを使用しないとforeground時に通知が表示されない
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_kAndroidChannel);
  }

  /// foreground時に通知を表示するメソッド
  Future<void> notify({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    // Androidはあらかじめ定義した_kAndroidChannelを使用する
    await _flutterLocalNotificationsPlugin.show(
      hashCode,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _kAndroidChannel.id,
          _kAndroidChannel.name,
          icon: '@mipmap/ic_launcher',
          importance: Importance.max,
          priority: Priority.max,
        ),
      ),
      payload: payload,
    );
    return;
  }

  void onDispose() {
    if (!_onTapListener.isClosed) {
      _onTapListener.close();
    }
  }
}
