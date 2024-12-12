import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info.g.dart';

@riverpod
PackageInfoService packageInfoService(Ref ref) {
  throw UnimplementedError();
}

class PackageInfoService {
  const PackageInfoService(this._packageInfo);

  final PackageInfo _packageInfo;

  static Future<PackageInfoService> init() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return PackageInfoService(packageInfo);
  }

  String get version => _packageInfo.version;
}
