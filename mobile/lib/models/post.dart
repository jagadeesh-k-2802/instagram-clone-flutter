import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/models/converters.dart';
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
class TaggedUserItem with _$TaggedUserItem {
  const factory TaggedUserItem({
    @JsonKey(name: '_id') required String id,
    required String avatar,
    required String name,
    required String username,
  }) = _TaggedUserItem;

  factory TaggedUserItem.fromJson(Map<String, Object?> json) =>
      _$TaggedUserItemFromJson(json);
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
    required List<TaggedUserItem> taggedUsers,
    required int likeCount,
    required int commentCount,
    required PostUser user,
    required bool isLiked,
    required bool isSaved,
    @DateTimeConvertor() required DateTime createdAt,
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

@freezed
class GetUsersPostResponse with _$GetUsersPostResponse {
  const factory GetUsersPostResponse({
    required bool success,
    required List<GetUsersPostResponseData> data,
  }) = _GetUsersPostResponse;

  factory GetUsersPostResponse.fromJson(Map<String, Object?> json) =>
      _$GetUsersPostResponseFromJson(json);
}

@freezed
class GetUsersPostResponseData with _$GetUsersPostResponseData {
  const factory GetUsersPostResponseData(
      {@JsonKey(name: '_id') required String id,
      required UserPostItem post}) = _GetUsersPostResponseData;

  factory GetUsersPostResponseData.fromJson(Map<String, Object?> json) =>
      _$GetUsersPostResponseDataFromJson(json);
}

@freezed
class UserPostItem with _$UserPostItem {
  const factory UserPostItem({
    @JsonKey(name: '_id') required String id,
    required List<PostAssetItem> assets,
  }) = _UserPostItem;

  factory UserPostItem.fromJson(Map<String, Object?> json) =>
      _$UserPostItemFromJson(json);
}

@freezed
class GetPostResponse with _$GetPostResponse {
  const factory GetPostResponse({
    required bool success,
    required GetFeedPostsResponseData data,
  }) = _GetPostResponse;

  factory GetPostResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPostResponseFromJson(json);
}

@freezed
class GetExplorePostsResponse with _$GetExplorePostsResponse {
  const factory GetExplorePostsResponse({
    required bool success,
    required List<GetExplorePostsResponseData> data,
  }) = _GetExplorePostsResponse;

  factory GetExplorePostsResponse.fromJson(Map<String, Object?> json) =>
      _$GetExplorePostsResponseFromJson(json);
}

@freezed
class GetExplorePostsResponseData with _$GetExplorePostsResponseData {
  const factory GetExplorePostsResponseData({
    @JsonKey(name: '_id') required String id,
    required List<PostAssetItem> assets,
  }) = _GetExplorePostsResponseData;

  factory GetExplorePostsResponseData.fromJson(Map<String, Object?> json) =>
      _$GetExplorePostsResponseDataFromJson(json);
}

@freezed
class GetLikesUsersResponse with _$GetLikesUsersResponse {
  const factory GetLikesUsersResponse({
    required bool success,
    required List<GetLikesUsersResponseData> data,
  }) = _GetLikesUsersResponse;

  factory GetLikesUsersResponse.fromJson(Map<String, Object?> json) =>
      _$GetLikesUsersResponseFromJson(json);
}

@freezed
class GetLikesUsersResponseData with _$GetLikesUsersResponseData {
  const factory GetLikesUsersResponseData({
    @JsonKey(name: '_id') required String id,
    required String avatar,
    required String name,
    required String username,
  }) = _GetLikesUsersResponseData;

  factory GetLikesUsersResponseData.fromJson(Map<String, Object?> json) =>
      _$GetLikesUsersResponseDataFromJson(json);
}
