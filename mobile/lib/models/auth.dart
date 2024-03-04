import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/models/converters.dart';
part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    required bool success,
    required String token,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, Object?> json) =>
      _$TokenResponseFromJson(json);
}

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required bool success,
    required UserResponseData data,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, Object?> json) =>
      _$UserResponseFromJson(json);
}

@freezed
class UserResponseData with _$UserResponseData {
  const factory UserResponseData({
    @JsonKey(name: '_id') required String id,
    required String avatar,
    required String name,
    required String username,
    required String email,
    required String gender,
    required String bio,
    required String? phone,
    required bool isPrivateAccount,
    required int unReadNotificationsCount,
    required String? fcmToken,
    required String? streamToken,
    required int postCount,
    required int followersCount,
    required int followingCount,
    @DateTimeConvertor() required String createdAt,
  }) = _UserResponseData;

  factory UserResponseData.fromJson(Map<String, Object?> json) =>
      _$UserResponseDataFromJson(json);
}
