import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

enum UserFollowType {
  @JsonValue('following')
  following,
  @JsonValue('requested')
  requested
}

@freezed
class GetUserResponse with _$GetUserResponse {
  const factory GetUserResponse({
    required bool success,
    required GetUserResponseData data,
  }) = _GetUserResponse;

  factory GetUserResponse.fromJson(Map<String, Object?> json) =>
      _$GetUserResponseFromJson(json);
}

@freezed
class GetUserResponseData with _$GetUserResponseData {
  const factory GetUserResponseData({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String username,
    required String avatar,
    required String bio,
    required int postCount,
    required int followersCount,
    required int followingCount,
    required bool isPrivateAccount,
    required UserFollowType? followType,
  }) = _GetUserResponseData;

  factory GetUserResponseData.fromJson(Map<String, Object?> json) =>
      _$GetUserResponseDataFromJson(json);
}

@freezed
class GetUserPostsResponse with _$GetUserPostsResponse {
  const factory GetUserPostsResponse({
    required bool success,
    required List<GetUserPostsResponseData> data,
  }) = _GetUserPostsResponse;

  factory GetUserPostsResponse.fromJson(Map<String, Object?> json) =>
      _$GetUserPostsResponseFromJson(json);
}

@freezed
class GetUserPostsResponseData with _$GetUserPostsResponseData {
  const factory GetUserPostsResponseData({
    required String id,
    required String caption,
    required List<PostAssetItem> assets,
  }) = _GetUserPostsResponseData;

  factory GetUserPostsResponseData.fromJson(Map<String, Object?> json) =>
      _$GetUserPostsResponseDataFromJson(json);
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
class SearchUsersResponse with _$SearchUsersResponse {
  const factory SearchUsersResponse({
    required bool success,
    required List<SearchUsersResponseData> data,
  }) = _SearchUsersResponse;

  factory SearchUsersResponse.fromJson(Map<String, Object?> json) =>
      _$SearchUsersResponseFromJson(json);
}

@freezed
class SearchUsersResponseData with _$SearchUsersResponseData {
  const factory SearchUsersResponseData({
    required String id,
    required String avatar,
    required String name,
    required String username,
  }) = _SearchUsersResponseData;

  factory SearchUsersResponseData.fromJson(Map<String, Object?> json) =>
      _$SearchUsersResponseDataFromJson(json);
}

@freezed
class GetFollowOfUserResponse with _$GetFollowOfUserResponse {
  const factory GetFollowOfUserResponse({
    required bool success,
    required List<GetFollowOfUserResponseData> data,
  }) = _GetFollowOfUserResponse;

  factory GetFollowOfUserResponse.fromJson(Map<String, Object?> json) =>
      _$GetFollowOfUserResponseFromJson(json);
}

@freezed
class GetFollowOfUserResponseData with _$GetFollowOfUserResponseData {
  const factory GetFollowOfUserResponseData({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String username,
    required String avatar,
    required bool isPrivateAccount,
    required UserFollowType? followType,
  }) = _GetFollowOfUserResponseData;

  factory GetFollowOfUserResponseData.fromJson(Map<String, Object?> json) =>
      _$GetFollowOfUserResponseDataFromJson(json);
}
