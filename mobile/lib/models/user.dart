import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

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
