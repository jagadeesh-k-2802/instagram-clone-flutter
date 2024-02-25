import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class GetPostsResponse with _$GetPostsResponse {
  const factory GetPostsResponse({
    required bool success,
    required List<GetPostsResponseData> data,
  }) = _GetPostsResponse;

  factory GetPostsResponse.fromJson(Map<String, Object?> json) =>
      _$GetPostsResponseFromJson(json);
}

@freezed
class GetPostsResponseData with _$GetPostsResponseData {
  const factory GetPostsResponseData({
    required String id,
    required String caption,
    required List<PostAssetItem> assets,
  }) = _GetPostsResponseData;

  factory GetPostsResponseData.fromJson(Map<String, Object?> json) =>
      _$GetPostsResponseDataFromJson(json);
}

@freezed
class PostAssetItem with _$PostAssetItem {
  const factory PostAssetItem({
    required String assetType,
    required String url,
  }) = _PostAssetItem;

  factory PostAssetItem.fromJson(Map<String, Object?> json) =>
      _$PostAssetItemFromJson(json);
}

@freezed
class GetFeedPostsResponse with _$GetFeedPostsResponse {
  const factory GetFeedPostsResponse({
    required bool success,
    required List<GetFeedPostsResponseData> data,
  }) = _GetFeedPostsResponse;

  factory GetFeedPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFeedPostsResponseFromJson(json);
}

@freezed
class GetFeedPostsResponseData with _$GetFeedPostsResponseData {
  const factory GetFeedPostsResponseData({
    @JsonKey(name: '_id') required String id,
    required String caption,
    required List<PostAssetItem> assets,
    required int likeCount,
    required PostUser user,
    required bool isLiked,
    required bool isSaved,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _GetFeedPostsResponseData;

  factory GetFeedPostsResponseData.fromJson(Map<String, dynamic> json) =>
      _$GetFeedPostsResponseDataFromJson(json);
}

@freezed
class PostUser with _$PostUser {
  const factory PostUser({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String avatar,
    required String username,
  }) = _PostUser;

  factory PostUser.fromJson(Map<String, Object?> json) =>
      _$PostUserFromJson(json);
}
