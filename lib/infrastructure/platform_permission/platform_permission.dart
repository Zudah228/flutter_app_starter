import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../util/logger.dart';

part 'platform_permission.g.dart';

@riverpod
PermissionInfrastructure platformPermissionInfrastructure(Ref ref) {
  return const PermissionInfrastructure();
}

class PermissionInfrastructure {
  const PermissionInfrastructure();

  PermissionRequestManager get notification {
    return PermissionRequestManager(Permission.notification);
  }
}

class PermissionRequestManager {
  PermissionRequestManager(this._permission);

  final Permission _permission;

  /// 単に権限の状態を確認する
  Future<bool> enable() async {
    final status = await _getStatus();

    switch (status) {
      // 許可している状態
      case PermissionStatus.granted:
      case PermissionStatus.limited:
      case PermissionStatus.provisional:
        return true;
      // 許可していない状態
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        return false;
    }
  }

  /// 権限の状態を始めに確認し、リクエスト可能なら行う
  Future<PermissionRequestResult> request({
    required Future<void> Function() whenFirstRequest,
  }) async {
    final status = await _getStatus();

    switch (status) {
      // 許可している状態
      case PermissionStatus.granted:
      case PermissionStatus.limited:
      case PermissionStatus.provisional:
        return PermissionRequestResult.alreadyAccepted;

      // リクエスト可能な状態
      case PermissionStatus.denied:
        await whenFirstRequest();
        final requestedStatus = await _permission.request();

        return _whenFirstRequest(requestedStatus);
      // リクエスト不可能な状態
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        return PermissionRequestResult.couldNotRequest;
    }
  }

  PermissionRequestResult _whenFirstRequest(PermissionStatus status) {
    switch (status) {
      // 許可している状態
      case PermissionStatus.granted:
      case PermissionStatus.limited:
      case PermissionStatus.provisional:
        return PermissionRequestResult.acceptRequest;
      // 許可していない状態
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        return PermissionRequestResult.denyRequest;
    }
  }

  Future<PermissionStatus> _getStatus() async {
    final status = await _permission.status;

    logger.info('$_permission: $status');

    return status;
  }
}

enum PermissionRequestResult {
  alreadyAccepted,
  acceptRequest,
  denyRequest,
  couldNotRequest,
  ;
}
