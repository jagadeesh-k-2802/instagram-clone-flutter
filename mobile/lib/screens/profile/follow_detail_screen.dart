import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/profile/user_followers_provider.dart';
import 'package:instagram_clone/state/profile/user_following_provider.dart';
import 'package:instagram_clone/state/profile/user_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

@immutable
class FollowDetailScreenArgs {
  final String? userId;
  final String? username;
  final String? initialScreen;

  const FollowDetailScreenArgs({
    required this.userId,
    required this.username,
    required this.initialScreen,
  });
}

class FollowDetailScreen extends ConsumerStatefulWidget {
  final Object? args;

  const FollowDetailScreen({
    super.key,
    required this.args,
  });

  @override
  ConsumerState<FollowDetailScreen> createState() => _FollowDetailScreenState();
}

class _FollowDetailScreenState extends ConsumerState<FollowDetailScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.args is! FollowDetailScreenArgs) {
        throw Exception(
          'FollowDetailScreen: takes only FollowDetailScreenArgs as param',
        );
      }
    });
  }

  Future<void> onFollow(GetFollowOfUserResponseData user) async {
    final args = widget.args as FollowDetailScreenArgs;
    final profileId = args.userId ?? '';
    var followersNotifier = ref.read(userFollowersProvider(profileId).notifier);
    var followingNotifier = ref.read(userFollowingProvider(profileId).notifier);

    if (user.isPrivateAccount) {
      followersNotifier.updateFollowType(user.id, UserFollowType.requested);
      followingNotifier.updateFollowType(user.id, UserFollowType.requested);
    } else {
      followersNotifier.updateFollowType(user.id, UserFollowType.following);
      followingNotifier.updateFollowType(user.id, UserFollowType.following);
      ref.read(globalStateProvider.notifier).incrementFollowingCount();
    }

    try {
      await UserService.followUser(userId: user.id);
      ref.refresh(publicUserProvider(user.id)).isRefreshing;
    } catch (error) {
      followersNotifier.updateFollowType(user.id, null);
      followingNotifier.updateFollowType(user.id, null);
      ref.read(globalStateProvider.notifier).decrementFollowingCount();
    }
  }

  Future<void> onUnFollow(String userId) async {
    final args = widget.args as FollowDetailScreenArgs;
    final profileId = args.userId ?? '';
    var followersNotifier = ref.read(userFollowersProvider(profileId).notifier);
    var followingNotifier = ref.read(userFollowingProvider(profileId).notifier);
    followersNotifier.updateFollowType(userId, null);
    followingNotifier.updateFollowType(userId, null);

    try {
      await UserService.unFollowUser(userId: userId);
      ref.refresh(publicUserProvider(args.userId ?? '')).isRefreshing;
      ref.read(globalStateProvider.notifier).decrementFollowingCount();
    } catch (error) {
      followersNotifier.updateFollowType(userId, UserFollowType.following);
      followingNotifier.updateFollowType(userId, UserFollowType.following);
    }
  }

  Future<void> onRequestDelete(GetFollowOfUserResponseData user) async {
    final args = widget.args as FollowDetailScreenArgs;
    final profileId = args.userId ?? '';
    var followersNotifier = ref.read(userFollowersProvider(profileId).notifier);
    var followingNotifier = ref.read(userFollowingProvider(profileId).notifier);
    followersNotifier.updateFollowType(user.id, null);
    followingNotifier.updateFollowType(user.id, null);

    try {
      await UserService.unFollowUser(userId: user.id);
      ref.refresh(publicUserProvider(args.userId ?? '')).isRefreshing;
    } catch (error) {
      followersNotifier.updateFollowType(user.id, UserFollowType.requested);
      followingNotifier.updateFollowType(user.id, UserFollowType.requested);
    }
  }

  Future<void> onUserRemove(GetFollowOfUserResponseData user) async {
    final args = widget.args as FollowDetailScreenArgs;
    final profileId = args.userId ?? '';
    var followersNotifier = ref.read(userFollowersProvider(profileId).notifier);
    followersNotifier.removeFollower(user.id);
    setState(() {}); // To update changes

    try {
      await UserService.removeFollower(userId: user.id);
      ref.refresh(publicUserProvider(args.userId ?? '')).isRefreshing;
      ref.read(globalStateProvider.notifier).decrementFollowersCount();
    } catch (error) {
      followersNotifier.addFollower(user);
    }
  }

  void openUserProfile(GetFollowOfUserResponseData item) {
    context.push(Routes.publicProfilePath(item.id), extra: (String action) {
      final args = widget.args as FollowDetailScreenArgs;
      final profile = args.userId ?? '';
      var followersNotifier = ref.read(userFollowersProvider(profile).notifier);
      var followingNotifier = ref.read(userFollowingProvider(profile).notifier);

      if (action == 'follow') {
        followersNotifier.updateFollowType(item.id, UserFollowType.following);
        followingNotifier.updateFollowType(item.id, UserFollowType.following);
        ref.read(globalStateProvider.notifier).incrementFollowingCount();
      } else if (action == 'requested') {
        followersNotifier.updateFollowType(item.id, UserFollowType.requested);
        followingNotifier.updateFollowType(item.id, UserFollowType.requested);
      } else if (action == 'delete-requested') {
        followersNotifier.updateFollowType(item.id, null);
        followingNotifier.updateFollowType(item.id, null);
      } else {
        followingNotifier.updateFollowType(item.id, null);
        followersNotifier.updateFollowType(item.id, null);
        ref.read(globalStateProvider.notifier).decrementFollowingCount();
      }
    });
  }

  Widget buildListItem(
    GetFollowOfUserResponseData item,
    UserResponseData? user,
    String screen,
  ) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isCurrentUserItem = user?.id == item.id;
    bool isFollowersScreen = screen == 'followers';
    final args = widget.args as FollowDetailScreenArgs;
    bool isCurrentUserProfile = user?.id == args.userId;

    return InkWell(
      onTap: () => isCurrentUserItem ? null : openUserProfile(item),
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
              visible: isCurrentUserProfile && isFollowersScreen,
              child: SizedBox(
                height: 35,
                width: 120,
                child: ElevatedButton(
                  onPressed: () => onUserRemove(item),
                  style: secondaryButtonStyle,
                  child: const Text('Remove'),
                ),
              ),
            ),
            Visibility(
              visible: !isCurrentUserItem &&
                  (!isFollowersScreen || !isCurrentUserProfile),
              child: item.followType == UserFollowType.following
                  ? SizedBox(
                      height: 35,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () => onUnFollow(item.id),
                        style: secondaryButtonStyle,
                        child: const Text('Unfollow'),
                      ),
                    )
                  : item.followType == UserFollowType.requested
                      ? SizedBox(
                          height: 35,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () => onRequestDelete(item),
                            style: secondaryButtonStyle,
                            child: const Text('Requested'),
                          ),
                        )
                      : SizedBox(
                          height: 35,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () => onFollow(item),
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
    final args = widget.args as FollowDetailScreenArgs;

    return DefaultTabController(
      initialIndex: args.initialScreen == 'followers' ? 0 : 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.username ?? ''),
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
              provider: userFollowersProvider(args.userId ?? ''),
              itemBuilder: (context, item, index) {
                return buildListItem(item, user, 'followers');
              },
              noItemsFoundIndicatorBuilder: (context, controller) {
                return const Center(child: Text('No Followers'));
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
              provider: userFollowingProvider(args.userId ?? ''),
              itemBuilder: (context, item, index) {
                return buildListItem(item, user, 'following');
              },
              noItemsFoundIndicatorBuilder: (context, controller) {
                return const Center(child: Text('No Following'));
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
