import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info.g.dart';

@riverpod
PackageInfoInfrastructure packageInfoInfrastructure(Ref ref) {
  throw UnimplementedError();
}

class PackageInfoInfrastructure {
  const PackageInfoInfrastructure(this._packageInfo);

  final PackageInfo _packageInfo;

  static Future<PackageInfoInfrastructure> init() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return PackageInfoInfrastructure(packageInfo);
  }

  String get version => _packageInfo.version;
}
