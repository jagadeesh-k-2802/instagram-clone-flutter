import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef PostData = GetUserPostsResponseData;

class GetUserPostsState extends PagedState<int, PostData> {
  const GetUserPostsState({
    super.records,
    String? super.error,
    super.nextPageKey,
    List<int>? previousPageKeys,
  });

  @override
  GetUserPostsState copyWith({
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

    return GetUserPostsState(
      records: sup.records,
      error: sup.error,
      nextPageKey: sup.nextPageKey,
      previousPageKeys: sup.previousPageKeys,
    );
  }
}

class UserPostsNotififier extends StateNotifier<GetUserPostsState>
    with PagedNotifierMixin<int, PostData, GetUserPostsState> {
  final String id;

  UserPostsNotififier({required this.id}) : super(const GetUserPostsState());

  @override
  Future<List<PostData>?> load(int page, int limit) async {
    try {
      if (state.previousPageKeys.contains(page)) {
        return state.records;
      }

      GetUserPostsResponse posts = await UserService.getUserPosts(
        id: id,
        page: page,
        limit: limit,
      );

      state = state.copyWith(
        records:{...(state.records ?? []), ...posts.data}.toList(),
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

StateNotifierProvider<UserPostsNotififier, GetUserPostsState>
    getUserPostsProvider(String id) {
  return StateNotifierProvider<UserPostsNotififier, GetUserPostsState>(
    (_) => UserPostsNotififier(id: id),
  );
}
