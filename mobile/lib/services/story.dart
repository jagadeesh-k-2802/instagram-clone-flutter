import 'package:dio/dio.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/story.dart';
import 'package:instagram_clone/services/dio.dart';
import 'package:instagram_clone/models/common.dart';

class StoryService {
  static Future<MessageResponse> createStory({
    required String localFilePath,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/story/';

      FormData data = FormData.fromMap({
        'file': await MultipartFile.fromFile(localFilePath),
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

  static Future<GetFeedStoriesResponse> getFeedStories({
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/story/feed-stories';

      final response = await dio.get(url, queryParameters: {
        'page': page,
        'limit': limit,
      });

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetFeedStoriesResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> viewStory({
    required String storyId,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/story/view/$storyId';
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

  static Future<GetStoryViewersResponse> getViewers({
    required String storyId,
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/story/viewers/$storyId';

      final response = await dio.get(url, queryParameters: {
        'page': page,
        'limit': limit,
      });

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetStoryViewersResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> deleteStory({
    required String storyId,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/story/$storyId';
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
}
