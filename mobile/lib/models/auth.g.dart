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
      id: json['id'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      fcmToken: json['fcmToken'] as String?,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$UserResponseDataImplToJson(
        _$UserResponseDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'fcmToken': instance.fcmToken,
      'createdAt': instance.createdAt,
    };
