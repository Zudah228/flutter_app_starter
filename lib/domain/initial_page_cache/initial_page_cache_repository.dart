import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infrastructure/shared_preferences/data_source/base_shared_preferences_repository.dart';
import '../../infrastructure/shared_preferences/shared_preferences_key.dart';

part 'initial_page_cache_repository.g.dart';

@riverpod
InitialPageCacheRepository initialPageCacheRepository(Ref ref) {
  return InitialPageCacheRepository(ref);
}

/// 初期表示ページのパスをキャッシュする
class InitialPageCacheRepository
    extends BaseSharedPreferencesRepository<String> {
  const InitialPageCacheRepository(super.ref);

  @override
  SharedPreferencesKey get key => SharedPreferencesKey.initial_page;
}
