import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetFollowOfUserResponseData;

class FollowingNotifier extends PagedNotifier<int, Data> {
  String userId;

  FollowingNotifier({required this.userId})
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetFollowOfUserResponse users = await UserService.getFollowing(
              userId: userId,
              page: page,
              limit: limit,
            );

            return users.data;
          },
        );

  void updateFollow(String userId, bool isFollowed) {
    state = state.copyWith(
      records: state.records?.map((user) {
        return user.id == userId ? user.copyWith(isFollowed: isFollowed) : user;
      }).toList(),
    );
  }
}

final getUserFollowingProvider = StateNotifierProvider.family
    .autoDispose<FollowingNotifier, PagedState<int, Data>, String>(
  (ref, userId) => FollowingNotifier(userId: userId),
);
