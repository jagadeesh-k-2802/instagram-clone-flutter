import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/common.dart';
import 'package:instagram_clone/models/notification.dart';
import 'package:instagram_clone/services/dio.dart';

class NotificationService {
  static Future<GetNotificationsResponse> getNotifications({
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/notification/';

      final response = await dio.get(
        url,
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetNotificationsResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
