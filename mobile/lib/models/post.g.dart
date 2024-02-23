// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPostsResponseImpl _$$GetPostsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPostsResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => GetPostsResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetPostsResponseImplToJson(
        _$GetPostsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetPostsResponseDataImpl _$$GetPostsResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPostsResponseDataImpl(
      id: json['id'] as String,
      caption: json['caption'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => PostAssetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetPostsResponseDataImplToJson(
        _$GetPostsResponseDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caption': instance.caption,
      'assets': instance.assets,
    };

_$PostAssetItemImpl _$$PostAssetItemImplFromJson(Map<String, dynamic> json) =>
    _$PostAssetItemImpl(
      assetType: json['assetType'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PostAssetItemImplToJson(_$PostAssetItemImpl instance) =>
    <String, dynamic>{
      'assetType': instance.assetType,
      'url': instance.url,
    };
