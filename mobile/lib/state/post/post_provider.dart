import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/post.dart';

typedef Data = GetFeedPostsResponseData;

final postProvider = FutureProvider.autoDispose.family<Data, String>(
  (ref, id) async {
    final response = await PostService.getPost(id: id);
    return response.data;
  },
);
