// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageResponseImpl _$$MessageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$MessageResponseImplToJson(
        _$MessageResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };

_$ErrorResponseImpl _$$ErrorResponseImplFromJson(Map<String, dynamic> json) =>
    _$ErrorResponseImpl(
      success: json['success'] as bool,
      error: json['error'] as String,
    );

Map<String, dynamic> _$$ErrorResponseImplToJson(_$ErrorResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
    };
