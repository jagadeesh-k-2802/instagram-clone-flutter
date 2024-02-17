import 'package:freezed_annotation/freezed_annotation.dart';
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
    required String id,
    required String avatar,
    required String name,
    required String email,
    required String? phone,
    required String? fcmToken,
    required String createdAt,
  }) = _UserResponseData;

  factory UserResponseData.fromJson(Map<String, Object?> json) =>
      _$UserResponseDataFromJson(json);
}
