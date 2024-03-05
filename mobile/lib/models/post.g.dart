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

_$TaggedUserItemImpl _$$TaggedUserItemImplFromJson(Map<String, dynamic> json) =>
    _$TaggedUserItemImpl(
      id: json['_id'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$TaggedUserItemImplToJson(
        _$TaggedUserItemImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'username': instance.username,
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
      taggedUsers: (json['taggedUsers'] as List<dynamic>)
          .map((e) => TaggedUserItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      likeCount: json['likeCount'] as int,
      commentCount: json['commentCount'] as int,
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
      'taggedUsers': instance.taggedUsers,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
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
      id: json['_id'] as String,
      post: UserPostItem.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUsersPostResponseDataImplToJson(
        _$GetUsersPostResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'post': instance.post,
    };

_$UserPostItemImpl _$$UserPostItemImplFromJson(Map<String, dynamic> json) =>
    _$UserPostItemImpl(
      id: json['_id'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => PostAssetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserPostItemImplToJson(_$UserPostItemImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'assets': instance.assets,
    };

_$GetPostResponseImpl _$$GetPostResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPostResponseImpl(
      success: json['success'] as bool,
      data: GetFeedPostsResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetPostResponseImplToJson(
        _$GetPostResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetExplorePostsResponseImpl _$$GetExplorePostsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetExplorePostsResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetExplorePostsResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetExplorePostsResponseImplToJson(
        _$GetExplorePostsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetExplorePostsResponseDataImpl _$$GetExplorePostsResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetExplorePostsResponseDataImpl(
      id: json['_id'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => PostAssetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetExplorePostsResponseDataImplToJson(
        _$GetExplorePostsResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'assets': instance.assets,
    };

_$GetLikesUsersResponseImpl _$$GetLikesUsersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetLikesUsersResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetLikesUsersResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetLikesUsersResponseImplToJson(
        _$GetLikesUsersResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetLikesUsersResponseDataImpl _$$GetLikesUsersResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetLikesUsersResponseDataImpl(
      id: json['_id'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$GetLikesUsersResponseDataImplToJson(
        _$GetLikesUsersResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'username': instance.username,
    };
