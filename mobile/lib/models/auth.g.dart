// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenResponseImpl _$$TokenResponseImplFromJson(Map<String, dynamic> json) =>
    _$TokenResponseImpl(
      success: json['success'] as bool,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$TokenResponseImplToJson(_$TokenResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
    };

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      success: json['success'] as bool,
      data: UserResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$UserResponseDataImpl _$$UserResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponseDataImpl(
      id: json['_id'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      bio: json['bio'] as String,
      phone: json['phone'] as String?,
      isPrivateAccount: json['isPrivateAccount'] as bool,
      unReadNotificationsCount: json['unReadNotificationsCount'] as int,
      fcmToken: json['fcmToken'] as String?,
      streamToken: json['streamToken'] as String?,
      postCount: json['postCount'] as int,
      followersCount: json['followersCount'] as int,
      followingCount: json['followingCount'] as int,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$UserResponseDataImplToJson(
        _$UserResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'gender': instance.gender,
      'bio': instance.bio,
      'phone': instance.phone,
      'isPrivateAccount': instance.isPrivateAccount,
      'unReadNotificationsCount': instance.unReadNotificationsCount,
      'fcmToken': instance.fcmToken,
      'streamToken': instance.streamToken,
      'postCount': instance.postCount,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
      'createdAt': instance.createdAt,
    };
