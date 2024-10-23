// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_code_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostCodeSearchResultImpl _$$PostCodeSearchResultImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PostCodeSearchResultImpl',
      json,
      ($checkedConvert) {
        final val = _$PostCodeSearchResultImpl(
          zipcode: $checkedConvert('zipcode', (v) => v as String),
          prefcode: $checkedConvert('prefcode', (v) => v as String),
          address1: $checkedConvert('address1', (v) => v as String),
          address2: $checkedConvert('address2', (v) => v as String),
          address3: $checkedConvert('address3', (v) => v as String),
          kana1: $checkedConvert('kana1', (v) => v as String),
          kana2: $checkedConvert('kana2', (v) => v as String),
          kana3: $checkedConvert('kana3', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$PostCodeSearchResultImplToJson(
        _$PostCodeSearchResultImpl instance) =>
    <String, dynamic>{
      'zipcode': instance.zipcode,
      'prefcode': instance.prefcode,
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'kana1': instance.kana1,
      'kana2': instance.kana2,
      'kana3': instance.kana3,
    };

_$ZipCloudResultImpl _$$ZipCloudResultImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ZipCloudResultImpl',
      json,
      ($checkedConvert) {
        final val = _$ZipCloudResultImpl(
          status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
          message: $checkedConvert('message', (v) => v as String?),
          results: $checkedConvert(
              'results',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => PostCodeSearchResult.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ZipCloudResultImplToJson(
        _$ZipCloudResultImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
