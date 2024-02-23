import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef PostData = GetPostsResponseData;

class UserPostsState extends PagedState<int, PostData> {
  const UserPostsState({
    super.records,
    String? super.error,
    super.nextPageKey,
    List<int>? previousPageKeys,
  });

  @override
  UserPostsState copyWith({
    String? search,
    List<PostData>? records,
    bool isEnd = false,
    dynamic error,
    dynamic nextPageKey,
    List<int>? previousPageKeys,
  }) {
    final sup = super.copyWith(
      records: records,
      error: error,
      nextPageKey: nextPageKey,
      previousPageKeys: previousPageKeys,
    );

    return UserPostsState(
      records: sup.records,
      error: sup.error,
      nextPageKey: sup.nextPageKey,
      previousPageKeys: sup.previousPageKeys,
    );
  }
}

class UserPostsNotififier extends StateNotifier<UserPostsState>
    with PagedNotifierMixin<int, PostData, UserPostsState> {
  UserPostsNotififier() : super(const UserPostsState());

  @override
  Future<List<PostData>?> load(int page, int limit) async {
    try {
      if (state.previousPageKeys.contains(page)) {
        return state.records;
      }

      GetPostsResponse posts = await PostService.getMyPosts(
        page: page,
        limit: limit,
      );

      state = state.copyWith(
        records: {...(state.records ?? []), ...posts.data}.toList(),
        nextPageKey: posts.data.isEmpty ? null : page + 1,
        previousPageKeys: {...state.previousPageKeys, page}.toList(),
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }

    return null;
  }

  void invalidate() {
    load(1, 20);
  }
}

final userPostsProvider =
    StateNotifierProvider<UserPostsNotififier, UserPostsState>(
  (_) => UserPostsNotififier(),
);
