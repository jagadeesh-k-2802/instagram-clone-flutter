import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/user.dart';

typedef Data = GetUserResponseData;

// Provides data caching
final getPublicUserProvider =
    FutureProvider.family<Data, String>((ref, id) async {
  final response = await UserService.getUser(id: id);
  return response.data;
});
