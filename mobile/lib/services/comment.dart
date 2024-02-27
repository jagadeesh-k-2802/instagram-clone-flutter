import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/comment.dart';
import 'package:instagram_clone/models/common.dart';
import 'package:instagram_clone/services/dio.dart';

class CommentService {
  static Future<GetCommentsResponse> getCommentsForPost({
    required String postId,
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/comment/$postId';

      final response = await dio.get(
        url,
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetCommentsResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> commentOnPost({
    required String postId,
    required String comment,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/comment/$postId';
      final response = await dio.post(url, data: {'comment': comment});

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> deleteComment({
    required String commentId,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/comment/$commentId';
      final response = await dio.delete(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> likeComment({
    required String commentId,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/comment/like/$commentId';
      final response = await dio.post(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> unLikeComment({
    required String commentId,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/comment/unlike/$commentId';
      final response = await dio.post(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
