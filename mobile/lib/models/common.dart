import 'package:freezed_annotation/freezed_annotation.dart';
part 'common.freezed.dart';
part 'common.g.dart';

@freezed
class MessageResponse with _$MessageResponse {
  const factory MessageResponse({
    required bool success,
    required String message,
  }) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, Object?> json) =>
      _$MessageResponseFromJson(json);
}

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    required bool success,
    required String error,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, Object?> json) =>
      _$ErrorResponseFromJson(json);
}
