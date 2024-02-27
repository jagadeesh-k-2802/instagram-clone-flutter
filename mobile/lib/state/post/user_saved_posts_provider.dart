import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetUsersPostResponseData;
typedef Provider = StateNotifierProvider<Notifier, PagedState<int, Data>>;

class Notifier extends PagedNotifier<int, Data> {
  Notifier()
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (page, limit) async {
            GetUsersPostResponse posts = await PostService.getSavedPosts(
              page: page,
              limit: limit,
            );

            return posts.data;
          },
        );
}

final userSavedPostsProvider =
    StateNotifierProvider.autoDispose<Notifier, PagedState<int, Data>>(
  (_) => Notifier(),
);
