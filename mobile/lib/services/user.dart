import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/dio.dart';
import 'package:instagram_clone/models/common.dart';

class UserService {
  static Future<GetUserResponse> getUser({
    required String id,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/user/$id';

      final response = await dio.get(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetUserResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<GetUserPostsResponse> getUserPosts({
    required String id,
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/user/posts/$id';

      final response = await dio.get(
        url,
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetUserPostsResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<GetUserPostsResponse> getTaggedPosts({
    required String id,
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/user/tagged-posts/$id';

      final response = await dio.get(
        url,
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetUserPostsResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<SearchUsersResponse> searchUsers({
    required String search,
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/user/search';

      final response = await dio.get(
        url,
        queryParameters: {'search': search, 'page': page, 'limit': limit},
      );

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return SearchUsersResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
