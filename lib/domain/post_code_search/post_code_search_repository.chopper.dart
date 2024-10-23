// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_code_search_repository.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$PostCodeSearchRepository extends PostCodeSearchRepository {
  _$PostCodeSearchRepository([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = PostCodeSearchRepository;

  @override
  Future<PostCodeSearchResult> search(String zipcode) async {
    final Uri $url = Uri.parse('/api/search');
    final Map<String, dynamic> $params = <String, dynamic>{'zipcode': zipcode};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    final Response $response =
        await client.send<PostCodeSearchResult, PostCodeSearchResult>(
      $request,
      responseConverter: PostCodeSearchRepository._responseConverter,
    );
    return $response.bodyOrThrow;
  }
}
