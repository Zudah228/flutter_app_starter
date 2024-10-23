import 'package:chopper/chopper.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'post_code_search_result.dart';

part 'post_code_search_repository.chopper.dart';
part 'post_code_search_repository.g.dart';

@riverpod
PostCodeSearchRepository postCodeSearchRepository(Ref ref) {
  return ChopperClient(
    baseUrl: Uri.parse('https://zipcloud.ibsnet.co.jp'),
    converter: const JsonConverter(),
    services: [
      _$PostCodeSearchRepository(),
    ],
    interceptors: [HttpLoggingInterceptor()],
  ).getService<PostCodeSearchRepository>();
}

@ChopperApi()
abstract class PostCodeSearchRepository extends ChopperService {
  static FutureOr<Response<PostCodeSearchResult>> _responseConverter(
    Response response,
  ) {
    return response.copyWith(body: PostCodeSearchResult.fromResponse(response));
  }

  @FactoryConverter(
    response: _responseConverter,
  )
  @Get(path: '/api/search')
  Future<PostCodeSearchResult> search(@Query() String zipcode);
}
