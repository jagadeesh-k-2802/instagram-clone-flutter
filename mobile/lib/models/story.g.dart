// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetFeedStoriesResponseImpl _$$GetFeedStoriesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFeedStoriesResponseImpl(
      success: json['success'] as bool,
      data: FeedStories.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetFeedStoriesResponseImplToJson(
        _$GetFeedStoriesResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$FeedStoriesImpl _$$FeedStoriesImplFromJson(Map<String, dynamic> json) =>
    _$FeedStoriesImpl(
      currentUserStories: (json['currentUserStories'] as List<dynamic>)
          .map((e) =>
              GetFeedStoriesResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      otherUserStories: (json['otherUserStories'] as List<dynamic>)
          .map((e) =>
              GetFeedStoriesResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FeedStoriesImplToJson(_$FeedStoriesImpl instance) =>
    <String, dynamic>{
      'currentUserStories': instance.currentUserStories,
      'otherUserStories': instance.otherUserStories,
    };

_$StoryAssetItemImpl _$$StoryAssetItemImplFromJson(Map<String, dynamic> json) =>
    _$StoryAssetItemImpl(
      assetType: json['assetType'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$StoryAssetItemImplToJson(
        _$StoryAssetItemImpl instance) =>
    <String, dynamic>{
      'assetType': instance.assetType,
      'url': instance.url,
    };

_$StoryItemImpl _$$StoryItemImplFromJson(Map<String, dynamic> json) =>
    _$StoryItemImpl(
      id: json['_id'] as String,
      asset: StoryAssetItem.fromJson(json['asset'] as Map<String, dynamic>),
      isViewed: json['isViewed'] as bool,
      viewCount: json['viewCount'] as int?,
      createdAt:
          const DateTimeConvertor().fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$StoryItemImplToJson(_$StoryItemImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'asset': instance.asset,
      'isViewed': instance.isViewed,
      'viewCount': instance.viewCount,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
    };

_$GetFeedStoriesResponseDataImpl _$$GetFeedStoriesResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFeedStoriesResponseDataImpl(
      id: json['_id'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      stories: (json['stories'] as List<dynamic>)
          .map((e) => StoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasPending: json['hasPending'] as bool,
    );

Map<String, dynamic> _$$GetFeedStoriesResponseDataImplToJson(
        _$GetFeedStoriesResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'avatar': instance.avatar,
      'stories': instance.stories,
      'hasPending': instance.hasPending,
    };

_$GetStoryViewersResponseImpl _$$GetStoryViewersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetStoryViewersResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetStoryViewersResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetStoryViewersResponseImplToJson(
        _$GetStoryViewersResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetStoryViewersResponseDataImpl _$$GetStoryViewersResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetStoryViewersResponseDataImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$$GetStoryViewersResponseDataImplToJson(
        _$GetStoryViewersResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'avatar': instance.avatar,
    };
