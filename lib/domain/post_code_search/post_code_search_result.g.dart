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
          prefecture: $checkedConvert('address1', (v) => v as String),
          city: $checkedConvert('address2', (v) => v as String),
          address: $checkedConvert('address3', (v) => v as String),
          kana1: $checkedConvert('kana1', (v) => v as String),
          kana2: $checkedConvert('kana2', (v) => v as String),
          kana3: $checkedConvert('kana3', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'prefecture': 'address1',
        'city': 'address2',
        'address': 'address3'
      },
    );

Map<String, dynamic> _$$PostCodeSearchResultImplToJson(
        _$PostCodeSearchResultImpl instance) =>
    <String, dynamic>{
      'address1': instance.prefecture,
      'address2': instance.city,
      'address3': instance.address,
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
