import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetFollowOfUserResponseData;

class FollowersNotifier extends PagedNotifier<int, Data> {
  String userId;

  FollowersNotifier({required this.userId})
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetFollowOfUserResponse users = await UserService.getFollowers(
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

final getUserFollowersProvider = StateNotifierProvider.family
    .autoDispose<FollowersNotifier, PagedState<int, Data>, String>(
  (ref, userId) => FollowersNotifier(userId: userId),
);
