import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/models/converters.dart';
part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class GetFeedStoriesResponse with _$GetFeedStoriesResponse {
  const factory GetFeedStoriesResponse({
    required bool success,
    required FeedStories data,
  }) = _GetFeedStoriesResponse;

  factory GetFeedStoriesResponse.fromJson(Map<String, Object?> json) =>
      _$GetFeedStoriesResponseFromJson(json);
}

@freezed
class FeedStories with _$FeedStories {
  const factory FeedStories({
    required List<GetFeedStoriesResponseData> currentUserStories,
    required List<GetFeedStoriesResponseData> otherUserStories,
  }) = _FeedStories;

  factory FeedStories.fromJson(Map<String, Object?> json) =>
      _$FeedStoriesFromJson(json);
}

@freezed
class StoryAssetItem with _$StoryAssetItem {
  const factory StoryAssetItem({
    required String assetType,
    required String url,
  }) = _StoryAssetItem;

  factory StoryAssetItem.fromJson(Map<String, Object?> json) =>
      _$StoryAssetItemFromJson(json);
}

@freezed
class StoryItem with _$StoryItem {
  const factory StoryItem({
    @JsonKey(name: '_id') required String id,
    required StoryAssetItem asset,
    required bool isViewed,
    required int? viewCount,
    @DateTimeConvertor() required DateTime createdAt,
  }) = _StoryItem;

  factory StoryItem.fromJson(Map<String, Object?> json) =>
      _$StoryItemFromJson(json);
}

@freezed
class GetFeedStoriesResponseData with _$GetFeedStoriesResponseData {
  const factory GetFeedStoriesResponseData({
    @JsonKey(name: '_id') required String id,
    required String username,
    required String name,
    required String avatar,
    required List<StoryItem> stories,
    required bool hasPending,
  }) = _GetFeedStoriesResponseData;

  factory GetFeedStoriesResponseData.fromJson(Map<String, Object?> json) =>
      _$GetFeedStoriesResponseDataFromJson(json);
}

@freezed
class GetStoryViewersResponse with _$GetStoryViewersResponse {
  const factory GetStoryViewersResponse({
    required bool success,
    required List<GetStoryViewersResponseData> data,
  }) = _GetStoryViewersResponse;

  factory GetStoryViewersResponse.fromJson(Map<String, Object?> json) =>
      _$GetStoryViewersResponseFromJson(json);
}

@freezed
class GetStoryViewersResponseData with _$GetStoryViewersResponseData {
  const factory GetStoryViewersResponseData({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String username,
    required String avatar,
  }) = _GetStoryViewersResponseData;

  factory GetStoryViewersResponseData.fromJson(Map<String, Object?> json) =>
      _$GetStoryViewersResponseDataFromJson(json);
}
