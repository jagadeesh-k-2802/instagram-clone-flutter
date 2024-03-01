// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserResponseImpl _$$GetUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserResponseImpl(
      success: json['success'] as bool,
      data: GetUserResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUserResponseImplToJson(
        _$GetUserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetUserResponseDataImpl _$$GetUserResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserResponseDataImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
      bio: json['bio'] as String,
      postCount: json['postCount'] as int,
      followersCount: json['followersCount'] as int,
      followingCount: json['followingCount'] as int,
      isPrivateAccount: json['isPrivateAccount'] as bool,
      followType:
          $enumDecodeNullable(_$UserFollowTypeEnumMap, json['followType']),
    );

Map<String, dynamic> _$$GetUserResponseDataImplToJson(
        _$GetUserResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'postCount': instance.postCount,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
      'isPrivateAccount': instance.isPrivateAccount,
      'followType': _$UserFollowTypeEnumMap[instance.followType],
    };

const _$UserFollowTypeEnumMap = {
  UserFollowType.following: 'following',
  UserFollowType.requested: 'requested',
};

_$GetUserPostsResponseImpl _$$GetUserPostsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserPostsResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetUserPostsResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetUserPostsResponseImplToJson(
        _$GetUserPostsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetUserPostsResponseDataImpl _$$GetUserPostsResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserPostsResponseDataImpl(
      id: json['id'] as String,
      caption: json['caption'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => PostAssetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetUserPostsResponseDataImplToJson(
        _$GetUserPostsResponseDataImpl instance) =>
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

_$SearchUsersResponseImpl _$$SearchUsersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchUsersResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              SearchUsersResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchUsersResponseImplToJson(
        _$SearchUsersResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$SearchUsersResponseDataImpl _$$SearchUsersResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchUsersResponseDataImpl(
      id: json['id'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$SearchUsersResponseDataImplToJson(
        _$SearchUsersResponseDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'username': instance.username,
    };

_$GetFollowOfUserResponseImpl _$$GetFollowOfUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFollowOfUserResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetFollowOfUserResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetFollowOfUserResponseImplToJson(
        _$GetFollowOfUserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetFollowOfUserResponseDataImpl _$$GetFollowOfUserResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFollowOfUserResponseDataImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
      isPrivateAccount: json['isPrivateAccount'] as bool,
      followType:
          $enumDecodeNullable(_$UserFollowTypeEnumMap, json['followType']),
    );

Map<String, dynamic> _$$GetFollowOfUserResponseDataImplToJson(
        _$GetFollowOfUserResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'avatar': instance.avatar,
      'isPrivateAccount': instance.isPrivateAccount,
      'followType': _$UserFollowTypeEnumMap[instance.followType],
    };
