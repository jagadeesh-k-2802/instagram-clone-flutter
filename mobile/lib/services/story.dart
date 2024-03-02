import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/story.dart';
import 'package:instagram_clone/services/dio.dart';
import 'package:instagram_clone/models/common.dart';

class StoryService {
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
}
