import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetUserPostsResponseData;
typedef Provider = StateNotifierProvider<Notifier, PagedState<int, Data>>;

class Notifier extends PagedNotifier<int, Data> {
  final String id;

  Notifier({required this.id})
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (page, limit) async {
            GetUserPostsResponse posts = await UserService.getUserPosts(
              id: id,
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
    StateNotifierProvider.family<Notifier, PagedState<int, Data>, String>(
  (ref, id) => Notifier(id: id),
);
