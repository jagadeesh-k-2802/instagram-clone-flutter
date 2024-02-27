import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetExplorePostsResponseData;

class Notifier extends PagedNotifier<int, Data> {
  Notifier()
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetExplorePostsResponse posts = await PostService.getExplorePosts(
              page: page,
              limit: limit,
            );

            return posts.data;
          },
        );
}

final explorePostsProvider =
    StateNotifierProvider.autoDispose<Notifier, PagedState<int, Data>>(
  (_) => Notifier(),
);
