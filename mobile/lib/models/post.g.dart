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

_$GetFeedPostsResponseImpl _$$GetFeedPostsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFeedPostsResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetFeedPostsResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetFeedPostsResponseImplToJson(
        _$GetFeedPostsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetFeedPostsResponseDataImpl _$$GetFeedPostsResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFeedPostsResponseDataImpl(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => PostAssetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      likeCount: json['likeCount'] as int,
      user: PostUser.fromJson(json['user'] as Map<String, dynamic>),
      isLiked: json['isLiked'] as bool,
      isSaved: json['isSaved'] as bool,
      createdAt:
          const DateTimeConvertor().fromJson(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GetFeedPostsResponseDataImplToJson(
        _$GetFeedPostsResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'assets': instance.assets,
      'likeCount': instance.likeCount,
      'user': instance.user,
      'isLiked': instance.isLiked,
      'isSaved': instance.isSaved,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$PostUserImpl _$$PostUserImplFromJson(Map<String, dynamic> json) =>
    _$PostUserImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$PostUserImplToJson(_$PostUserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'username': instance.username,
    };

_$GetUsersPostResponseImpl _$$GetUsersPostResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUsersPostResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetUsersPostResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetUsersPostResponseImplToJson(
        _$GetUsersPostResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetUsersPostResponseDataImpl _$$GetUsersPostResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUsersPostResponseDataImpl(
      id: json['id'] as String,
      post: UserPostItem.fromJson(json['post'] as Map<String, dynamic>),
      createdAt:
          const DateTimeConvertor().fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$GetUsersPostResponseDataImplToJson(
        _$GetUsersPostResponseDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post': instance.post,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
    };

_$UserPostItemImpl _$$UserPostItemImplFromJson(Map<String, dynamic> json) =>
    _$UserPostItemImpl(
      id: json['id'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => PostAssetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserPostItemImplToJson(_$UserPostItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assets': instance.assets,
    };
