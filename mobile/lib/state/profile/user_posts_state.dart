import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetPostsResponseData;

class Notifier extends PagedNotifier<int, Data> {
  Notifier()
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetPostsResponse posts = await PostService.getMyPosts(
              page: page,
              limit: limit,
            );

            return posts.data;
          },
        );

  void invalidate() {
    state = const PagedState(records: [], nextPageKey: 1, previousPageKeys: []);
    load(1, 20);
  }
}

final userPostsProvider =
    StateNotifierProvider<Notifier, PagedState<int, Data>>(
  (_) => Notifier(),
);
