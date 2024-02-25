import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/profile/user_followers_provider.dart';
import 'package:instagram_clone/state/profile/user_following_provider.dart';
import 'package:instagram_clone/state/public-profile/user_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class FollowDetailScreen extends ConsumerStatefulWidget {
  final String? userId;
  final String? username;
  final String? initialScreen;

  const FollowDetailScreen({
    super.key,
    required this.userId,
    required this.username,
    required this.initialScreen,
  });

  @override
  ConsumerState<FollowDetailScreen> createState() => _FollowDetailScreenState();
}

class _FollowDetailScreenState extends ConsumerState<FollowDetailScreen> {
  Future<void> onFollow(
    String userId,
    FollowingNotifier followingNotifier,
    FollowersNotifier followersNotifier,
  ) async {
    try {
      await UserService.followUser(userId: userId);
      ref.refresh(getPublicUserProvider(userId)).isRefreshing;
      followingNotifier.updateFollow(userId, true);
      followersNotifier.updateFollow(userId, true);
      ref.read(globalStateProvider.notifier).incrementFollowingCount();
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onUnFollow(
    String userId,
    FollowingNotifier followingNotifier,
    FollowersNotifier followersNotifier,
  ) async {
    try {
      await UserService.unFollowUser(userId: userId);
      ref.refresh(getPublicUserProvider(widget.userId ?? '')).isRefreshing;
      followingNotifier.updateFollow(userId, false);
      followersNotifier.updateFollow(userId, false);
      ref.read(globalStateProvider.notifier).decrementFollowingCount();
    } catch (error) {
      // Do Nothing
    }
  }

  void openUserProfile(
    GetFollowOfUserResponseData item,
    FollowingNotifier followingNotifier,
    FollowersNotifier followersNotifier,
  ) {
    context.push('/profile/${item.id}', extra: (String action) {
      if (action == 'follow') {
        followingNotifier.updateFollow(item.id, true);
        followersNotifier.updateFollow(item.id, true);
        ref.read(globalStateProvider.notifier).incrementFollowingCount();
      } else {
        followingNotifier.updateFollow(item.id, false);
        followersNotifier.updateFollow(item.id, false);
        ref.read(globalStateProvider.notifier).decrementFollowingCount();
      }
    });
  }

  Widget buildListItem(
    GetFollowOfUserResponseData item,
    UserResponseData? user,
    FollowingNotifier followingNotifier,
    FollowersNotifier followersNotifier,
  ) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isCurrentUser = user?.id == item.id;

    return InkWell(
      onTap: () => isCurrentUser
          ? null
          : openUserProfile(item, followingNotifier, followersNotifier),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPagePadding,
          vertical: 4.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 30.0,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: '$apiUrl/avatar/${item.avatar}',
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Column(
              children: [
                Text(item.name, style: textTheme.bodyLarge),
                Text(item.username, style: textTheme.bodyMedium),
              ],
            ),
            const Spacer(),
            Visibility(
              visible: !isCurrentUser,
              child: item.isFollowed
                  ? SizedBox(
                      height: 35,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () => onUnFollow(
                          item.id,
                          followingNotifier,
                          followersNotifier,
                        ),
                        style: secondaryButtonStyle,
                        child: const Text('Unfollow'),
                      ),
                    )
                  : SizedBox(
                      height: 35,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () => onFollow(
                          item.id,
                          followingNotifier,
                          followersNotifier,
                        ),
                        child: const Text('Follow'),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.read(globalStateProvider).user;
    final followersProvider = getUserFollowersProvider(widget.userId ?? '');
    final followersNotifier = ref.watch(followersProvider.notifier);
    final followingProvider = getUserFollowingProvider(widget.userId ?? '');
    final followingNotifier = ref.watch(followingProvider.notifier);

    return DefaultTabController(
      initialIndex: widget.initialScreen == 'followers' ? 0 : 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.username ?? ''),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            overlayColor: MaterialStatePropertyAll(lightGrayColor),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(text: 'Followers'),
              Tab(text: 'Following'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RiverPagedBuilder.autoDispose(
              firstPageKey: 1,
              limit: 20,
              provider: followersProvider,
              itemBuilder: (context, item, index) {
                return buildListItem(
                  item,
                  user,
                  followingNotifier,
                  followersNotifier,
                );
              },
              noItemsFoundIndicatorBuilder: (context, controller) {
                return const Center(
                  child: Text('No Followers'),
                );
              },
              pagedBuilder: (controller, builder) => PagedListView.separated(
                pagingController: controller,
                builderDelegate: builder,
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
            RiverPagedBuilder.autoDispose(
              firstPageKey: 1,
              limit: 20,
              provider: followingProvider,
              itemBuilder: (context, item, index) {
                return buildListItem(
                  item,
                  user,
                  followingNotifier,
                  followersNotifier,
                );
              },
              noItemsFoundIndicatorBuilder: (context, controller) {
                return const Center(
                  child: Text('No Following'),
                );
              },
              pagedBuilder: (controller, builder) => PagedListView.separated(
                pagingController: controller,
                builderDelegate: builder,
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
