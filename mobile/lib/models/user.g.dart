// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
