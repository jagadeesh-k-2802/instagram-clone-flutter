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
