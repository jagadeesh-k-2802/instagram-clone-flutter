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

_$StoryUserItemImpl _$$StoryUserItemImplFromJson(Map<String, dynamic> json) =>
    _$StoryUserItemImpl(
      name: json['name'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$$StoryUserItemImplToJson(_$StoryUserItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar': instance.avatar,
    };

_$StoryItemImpl _$$StoryItemImplFromJson(Map<String, dynamic> json) =>
    _$StoryItemImpl(
      asset: StoryAssetItem.fromJson(json['asset'] as Map<String, dynamic>),
      user: StoryUserItem.fromJson(json['user'] as Map<String, dynamic>),
      isViewed: json['isViewed'] as bool,
    );

Map<String, dynamic> _$$StoryItemImplToJson(_$StoryItemImpl instance) =>
    <String, dynamic>{
      'asset': instance.asset,
      'user': instance.user,
      'isViewed': instance.isViewed,
    };

_$GetFeedStoriesResponseDataImpl _$$GetFeedStoriesResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFeedStoriesResponseDataImpl(
      id: json['_id'] as String,
      stories: (json['stories'] as List<dynamic>)
          .map((e) => StoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasPending: json['hasPending'] as bool,
    );

Map<String, dynamic> _$$GetFeedStoriesResponseDataImplToJson(
        _$GetFeedStoriesResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'stories': instance.stories,
      'hasPending': instance.hasPending,
    };
