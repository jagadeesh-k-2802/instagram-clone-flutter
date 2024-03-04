import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:instagram_clone/config/constants.dart';

Future<Dio> getDioClient() async {
  final dio = Dio();
  dio.options.validateStatus = (status) => status != null ? status < 500 : true;
  dio.options.baseUrl = apiUrl;

  const storage = FlutterSecureStorage();
  String? token = await storage.read(key: tokenKey);

  dio.options.headers = {
    'Authorization': 'Bearer $token',
  };

  return dio;
}
