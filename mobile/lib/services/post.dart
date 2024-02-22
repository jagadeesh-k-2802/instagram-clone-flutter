import 'package:dio/dio.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/services/dio.dart';
import 'package:instagram_clone/models/common.dart';

class PostService {
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
        'taggedUsers': taggedUsers,
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
