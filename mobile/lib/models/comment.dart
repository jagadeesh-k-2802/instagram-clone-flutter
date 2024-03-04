import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/models/converters.dart';
part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class GetCommentsResponse with _$GetCommentsResponse {
  const factory GetCommentsResponse({
    required bool success,
    required List<GetCommentsResponseData> data,
  }) = _GetCommentsResponse;

  factory GetCommentsResponse.fromJson(Map<String, Object?> json) =>
      _$GetCommentsResponseFromJson(json);
}

@freezed
class GetCommentsResponseData with _$GetCommentsResponseData {
  const factory GetCommentsResponseData({
    @JsonKey(name: '_id') required String id,
    required String comment,
    required int likeCount,
    required bool isLiked,
    required CommentUser user,
    @DateTimeConvertor() required DateTime createdAt,
  }) = _GetCommentsResponseData;

  factory GetCommentsResponseData.fromJson(Map<String, Object?> json) =>
      _$GetCommentsResponseDataFromJson(json);
}

@freezed
class CommentUser with _$CommentUser {
  const factory CommentUser({
    @JsonKey(name: '_id') required String id,
    required String avatar,
    required String name,
    required String username,
  }) = _CommentUser;

  factory CommentUser.fromJson(Map<String, Object?> json) =>
      _$CommentUserFromJson(json);
}
