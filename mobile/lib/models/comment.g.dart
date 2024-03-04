// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCommentsResponseImpl _$$GetCommentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCommentsResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetCommentsResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetCommentsResponseImplToJson(
        _$GetCommentsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetCommentsResponseDataImpl _$$GetCommentsResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCommentsResponseDataImpl(
      id: json['_id'] as String,
      comment: json['comment'] as String,
      likeCount: json['likeCount'] as int,
      isLiked: json['isLiked'] as bool,
      user: CommentUser.fromJson(json['user'] as Map<String, dynamic>),
      createdAt:
          const DateTimeConvertor().fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$GetCommentsResponseDataImplToJson(
        _$GetCommentsResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'comment': instance.comment,
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
      'user': instance.user,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
    };

_$CommentUserImpl _$$CommentUserImplFromJson(Map<String, dynamic> json) =>
    _$CommentUserImpl(
      id: json['_id'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$CommentUserImplToJson(_$CommentUserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'username': instance.username,
    };
