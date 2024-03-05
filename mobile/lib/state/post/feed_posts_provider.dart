import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetFeedPostsResponseData;

class Notifier extends PagedNotifier<int, Data> {
  Notifier()
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetFeedPostsResponse posts = await PostService.getFeedPosts(
              page: page,
              limit: limit,
            );

            if (page == 1) {
              // Temp item to show stories
              return [
                GetFeedPostsResponseData(
                  id: 'stories-list',
                  caption: '',
                  assets: [],
                  likeCount: 0,
                  commentCount: 0,
                  taggedUsers: [],
                  user: const PostUser(
                    id: '',
                    name: '',
                    avatar: '',
                    username: '',
                  ),
                  isLiked: false,
                  isSaved: false,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
                ...posts.data
              ];
            }

            return posts.data;
          },
        );

  void incrementCommentCount(String postId) {
    state = state.copyWith(
      records: state.records?.map((post) {
        return post.id == postId
            ? post.copyWith(commentCount: post.commentCount + 1)
            : post;
      }).toList(),
    );
  }

  void decrementCommentCount(String postId) {
    state = state.copyWith(
      records: state.records?.map((post) {
        return post.id == postId
            ? post.copyWith(commentCount: post.commentCount - 1)
            : post;
      }).toList(),
    );
  }

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

  void deletePost(String postId) {
    final newRecords = state.copyWith().records;
    newRecords?.removeWhere((post) => post.id == postId);
    state = state.copyWith(records: newRecords);
  }

  void invalidate() {
    state = state.copyWith(
      records: [],
      error: null,
      previousPageKeys: [],
      nextPageKey: 1,
    );

    load(1, 20);
  }
}

final feedPostsProvider =
    StateNotifierProvider.autoDispose<Notifier, PagedState<int, Data>>(
  (_) => Notifier(),
);
