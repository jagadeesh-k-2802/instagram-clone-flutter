import 'package:dio/dio.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/dio.dart';
import 'package:instagram_clone/models/common.dart';

class PostService {
  static Future<GetPostsResponse> getMyPosts({
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/post/my-posts';

      final response = await dio.get(
        url,
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetPostsResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<GetPostsResponse> getTaggedPosts({
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/post/tagged-posts';

      final response = await dio.get(
        url,
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetPostsResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<GetFeedPostsResponse> getFeedPosts({
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/post/feed-posts';

      final response = await dio.get(
        url,
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetFeedPostsResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> likePost({
    required String postId,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/post/like/$postId';
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

  static Future<MessageResponse> unLikePost({
    required String postId,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/post/unlike/$postId';
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

  static Future<MessageResponse> savePost({
    required String postId,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/post/save/$postId';
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

  static Future<MessageResponse> unSavePost({
    required String postId,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/post/unsave/$postId';
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

  static Future<MessageResponse> createPost({
    required String caption,
    required List<String> taggedUsers,
    required List<String> localFilePaths,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/post/';
      List<MultipartFile> files = [];

      for (String path in localFilePaths) {
        files.add(await MultipartFile.fromFile(path));
      }

      FormData data = FormData.fromMap({
        'caption': caption,
        'taggedUsers': taggedUsers.join(' '),
        'files': files,
      });

      final response = await dio.post(url, data: data);

      if (response.statusCode != 201) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
