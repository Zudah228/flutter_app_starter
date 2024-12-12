// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_code_search_result.freezed.dart';
part 'post_code_search_result.g.dart';

@freezed
class PostCodeSearchResult with _$PostCodeSearchResult {
  const factory PostCodeSearchResult({
    @JsonKey(name: 'address1') required String prefecture,
    @JsonKey(name: 'address2') required String city,
    @JsonKey(name: 'address3') required String address,
    required String kana1,
    required String kana2,
    required String kana3,
  }) = _PostCodeSearchResult;

  const PostCodeSearchResult._();
  factory PostCodeSearchResult.fromJson(Map<String, Object?> json) =>
      _$PostCodeSearchResultFromJson(json);

  static PostCodeSearchResult? fromResponse(Response response) {
    final list = ZipCloudResult.fromJson(
        jsonDecode(response.body) as Map<String, Object?>);

    return list.results.firstOrNull;
  }
}

@freezed
class ZipCloudResult with _$ZipCloudResult {
  const factory ZipCloudResult({
    int? status,
    String? message,
    @Default([]) List<PostCodeSearchResult> results,
  }) = _ZipCloudResult;

  factory ZipCloudResult.fromJson(Map<String, Object?> json) =>
      _$ZipCloudResultFromJson(json);

  const ZipCloudResult._();
}
