import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infrastructure/shared_preferences/base_shared_preferences_service.dart';
import '../../infrastructure/shared_preferences/shared_preferences_key.dart';

part 'initial_page_cache_repository.g.dart';

@riverpod
InitialPageCacheRepository initialPageCacheRepository(Ref ref) {
  return InitialPageCacheRepository(ref);
}

/// 初期表示ページのパスをキャッシュする
class InitialPageCacheRepository extends BaseSharedPreferencesService<String> {
  const InitialPageCacheRepository(super.ref);

  @override
  SharedPreferencesKey get key => SharedPreferencesKey.initial_page;
}
