import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/models/converters.dart';
part 'notification.freezed.dart';
part 'notification.g.dart';

enum NotificationType {
  @JsonValue('follow-request')
  followRequest,
  @JsonValue('info')
  info
}

@freezed
class GetNotificationsResponse with _$GetNotificationsResponse {
  const factory GetNotificationsResponse({
    required bool success,
    required List<GetNotificationsResponseData> data,
  }) = _GetNotificationsResponse;

  factory GetNotificationsResponse.fromJson(Map<String, Object?> json) =>
      _$GetNotificationsResponseFromJson(json);
}

@freezed
class NotificationDataUser with _$NotificationDataUser {
  const factory NotificationDataUser({
    required String id,
    required String avatar,
    required String username,
    required String name,
  }) = _NotificationDataUser;

  factory NotificationDataUser.fromJson(Map<String, Object?> json) =>
      _$NotificationDataUserFromJson(json);
}

@freezed
class NotificationData with _$NotificationData {
  const factory NotificationData({
    required NotificationDataUser? user,
    required String? post,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, Object?> json) =>
      _$NotificationDataFromJson(json);
}

@freezed
class GetNotificationsResponseData with _$GetNotificationsResponseData {
  const factory GetNotificationsResponseData({
    required String id,
    required String content,
    required NotificationData? data,
    required NotificationType type,
    @DateTimeConvertor() required DateTime createdAt,
    @DateTimeConvertor() required DateTime updatedAt,
  }) = _GetNotificationsResponseData;

  factory GetNotificationsResponseData.fromJson(Map<String, Object?> json) =>
      _$GetNotificationsResponseDataFromJson(json);
}
