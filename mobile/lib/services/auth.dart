import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/services/dio.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/common.dart';

class AuthService {
  static Future<TokenResponse> login({
    required String identifier,
    required String password,
    required String fcmToken,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/login';

      var data = {
        'identifier': identifier,
        'password': password,
        'fcmToken': fcmToken
      };

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      var tokenResponse = TokenResponse.fromJson(response.data);
      const storage = FlutterSecureStorage();
      await storage.write(key: tokenKey, value: tokenResponse.token);
      return tokenResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future<TokenResponse> register({
    required String name,
    required String username,
    required String birthday,
    required String email,
    required String? avatarPath,
    required String password,
    required String confirmationCode,
    required String fcmToken,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/register';

      FormData data = FormData.fromMap({
        'name': name,
        'email': email,
        'username': username,
        'birthday': birthday,
        'password': password,
        'fcmToken': fcmToken,
        'confirmationCode': confirmationCode,
        'avatar': avatarPath != null
            ? await MultipartFile.fromFile(avatarPath)
            : null,
      });

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      var tokenResponse = TokenResponse.fromJson(response.data);
      const storage = FlutterSecureStorage();
      await storage.write(key: tokenKey, value: tokenResponse.token);
      return tokenResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future<MessageResponse> verifyValidUsername({
    required String username,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/valid-username';
      var data = {'username': username};

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MessageResponse> sendConfirmationCode({
    required String email,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/send-confirmation';
      var data = {'email': email};

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MessageResponse> verifyConfirmationCode({
    required String email,
    required String code,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/verify-confirmation';
      var data = {'email': email, 'code': code};

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MessageResponse> logout() async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/logout';

      final response = await dio.get(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      const storage = FlutterSecureStorage();
      await storage.delete(key: tokenKey);
      return MessageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MessageResponse> updateUserDetails({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/update-details';

      var data = {
        'name': name,
        'email': email,
        'phone': phone,
      };

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<TokenResponse> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/update-password';

      var data = {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      var tokenResponse = TokenResponse.fromJson(response.data);
      const storage = FlutterSecureStorage();
      await storage.write(key: tokenKey, value: tokenResponse.token);
      return tokenResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future<MessageResponse> updateAvatar({
    required String localFilePath,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/update-avatar';

      FormData data = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(localFilePath),
      });

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MessageResponse> forgotPassword({
    required String email,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/forgot-password';
      var data = {'email': email};
      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MessageResponse> verifyForgotPasswordCode({
    required String email,
    required String code,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/verify-forgot-password';
      var data = {'email': email, 'code': code};

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MessageResponse> resetPassword({
    required String code,
    required String password,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/reset-password';
      var data = {'code': code, 'password': password};
      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserResponse> getMe() async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/me';
      final response = await dio.get(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return UserResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
