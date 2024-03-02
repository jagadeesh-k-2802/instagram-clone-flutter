import 'package:freezed_annotation/freezed_annotation.dart';
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
class StoryUserItem with _$StoryUserItem {
  const factory StoryUserItem({
    required String name,
    required String username,
    required String avatar,
  }) = _StoryUserItem;

  factory StoryUserItem.fromJson(Map<String, Object?> json) =>
      _$StoryUserItemFromJson(json);
}

@freezed
class StoryItem with _$StoryItem {
  const factory StoryItem({
    required StoryAssetItem asset,
    required StoryUserItem user,
    required bool isViewed,
  }) = _StoryItem;

  factory StoryItem.fromJson(Map<String, Object?> json) =>
      _$StoryItemFromJson(json);
}

@freezed
class GetFeedStoriesResponseData with _$GetFeedStoriesResponseData {
  const factory GetFeedStoriesResponseData({
    @JsonKey(name: '_id') required String id,
    required List<StoryItem> stories,
    required bool hasPending,
  }) = _GetFeedStoriesResponseData;

  factory GetFeedStoriesResponseData.fromJson(Map<String, Object?> json) =>
      _$GetFeedStoriesResponseDataFromJson(json);
}
