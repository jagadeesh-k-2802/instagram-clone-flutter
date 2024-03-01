import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetFollowOfUserResponseData;

class Notifier extends PagedNotifier<int, Data> {
  String userId;

  Notifier({required this.userId})
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

  void updateFollowType(String userId, UserFollowType? followType) {
    state = state.copyWith(
      records: state.records?.map((user) {
        return user.id == userId ? user.copyWith(followType: followType) : user;
      }).toList(),
    );
  }
}

final userFollowingProvider = StateNotifierProvider.family
    .autoDispose<Notifier, PagedState<int, Data>, String>(
  (ref, userId) => Notifier(userId: userId),
);
