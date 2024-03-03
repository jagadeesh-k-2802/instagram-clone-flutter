// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetNotificationsResponseImpl _$$GetNotificationsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetNotificationsResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetNotificationsResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetNotificationsResponseImplToJson(
        _$GetNotificationsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$NotificationDataUserImpl _$$NotificationDataUserImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataUserImpl(
      id: json['id'] as String,
      avatar: json['avatar'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$NotificationDataUserImplToJson(
        _$NotificationDataUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'username': instance.username,
      'name': instance.name,
    };

_$NotificationDataImpl _$$NotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataImpl(
      user: json['user'] == null
          ? null
          : NotificationDataUser.fromJson(json['user'] as Map<String, dynamic>),
      post: json['post'] as String?,
    );

Map<String, dynamic> _$$NotificationDataImplToJson(
        _$NotificationDataImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'post': instance.post,
    };

_$GetNotificationsResponseDataImpl _$$GetNotificationsResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetNotificationsResponseDataImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      data: json['data'] == null
          ? null
          : NotificationData.fromJson(json['data'] as Map<String, dynamic>),
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      createdAt:
          const DateTimeConvertor().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeConvertor().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GetNotificationsResponseDataImplToJson(
        _$GetNotificationsResponseDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'data': instance.data,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
      'updatedAt': const DateTimeConvertor().toJson(instance.updatedAt),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.followRequest: 'follow-request',
  NotificationType.info: 'info',
};
