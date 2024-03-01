import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetLikesUsersResponseData;
typedef Provider = StateNotifierProvider<Notifier, PagedState<int, Data>>;

class Notifier extends PagedNotifier<int, Data> {
  final String id;

  Notifier({required this.id})
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (page, limit) async {
            GetLikesUsersResponse posts =
                await PostService.getLikedUsersForPost(
              id: id,
              page: page,
              limit: limit,
            );

            return posts.data;
          },
        );
}

final postLikeDetailProvider = StateNotifierProvider.family
    .autoDispose<Notifier, PagedState<int, Data>, String>(
  (ref, id) => Notifier(id: id),
);
