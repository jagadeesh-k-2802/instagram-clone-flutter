import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetFeedPostsResponseData;

class FeedNotifier extends PagedNotifier<int, Data> {
  FeedNotifier()
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetFeedPostsResponse posts = await PostService.getFeedPosts(
              page: page,
              limit: limit,
            );

            return posts.data;
          },
        );

  void likePost(String postId) {
    state = state.copyWith(
      records: state.records?.map((post) {
        return post.id == postId
            ? post.copyWith(likeCount: post.likeCount + 1, isLiked: true)
            : post;
      }).toList(),
    );
  }

  void unLikePost(String postId) {
    state = state.copyWith(
      records: state.records?.map((post) {
        return post.id == postId
            ? post.copyWith(likeCount: post.likeCount - 1, isLiked: false)
            : post;
      }).toList(),
    );
  }

  void savePost(String postId) {
    state = state.copyWith(
      records: state.records?.map((post) {
        return post.id == postId ? post.copyWith(isSaved: true) : post;
      }).toList(),
    );
  }

  void unSavePost(String postId) {
    state = state.copyWith(
      records: state.records?.map((post) {
        return post.id == postId ? post.copyWith(isSaved: false) : post;
      }).toList(),
    );
  }
}

final getFeedProvider =
    StateNotifierProvider.autoDispose<FeedNotifier, PagedState<int, Data>>(
  (_) => FeedNotifier(),
);
