import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/constants/constants.dart';
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

  Future<void> onFollow(String userId) async {
    final args = widget.args as FollowDetailScreenArgs;
    final profileId = args.userId ?? '';
    var followersNotifier = ref.read(userFollowersProvider(profileId).notifier);
    var followingNotifier = ref.read(userFollowingProvider(profileId).notifier);
    followersNotifier.updateFollow(userId, true);
    followingNotifier.updateFollow(userId, true);

    try {
      await UserService.followUser(userId: userId);
      ref.refresh(publicUserProvider(userId)).isRefreshing;
      ref.read(globalStateProvider.notifier).incrementFollowingCount();
    } catch (error) {
      followersNotifier.updateFollow(userId, false);
      followingNotifier.updateFollow(userId, false);
    }
  }

  Future<void> onUnFollow(String userId) async {
    final args = widget.args as FollowDetailScreenArgs;
    final profileId = args.userId ?? '';
    var followersNotifier = ref.read(userFollowersProvider(profileId).notifier);
    var followingNotifier = ref.read(userFollowingProvider(profileId).notifier);
    followersNotifier.updateFollow(userId, false);
    followingNotifier.updateFollow(userId, false);

    try {
      await UserService.unFollowUser(userId: userId);
      ref.refresh(publicUserProvider(args.userId ?? '')).isRefreshing;
      ref.read(globalStateProvider.notifier).decrementFollowingCount();
    } catch (error) {
      followersNotifier.updateFollow(userId, true);
      followingNotifier.updateFollow(userId, true);
    }
  }

  void openUserProfile(GetFollowOfUserResponseData item) {
    context.push(Routes.publicProfilePath(item.id), extra: (String action) {
      final args = widget.args as FollowDetailScreenArgs;
      final profile = args.userId ?? '';
      var followersNotifier = ref.read(userFollowersProvider(profile).notifier);
      var followingNotifier = ref.read(userFollowingProvider(profile).notifier);

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
  ) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isCurrentUser = user?.id == item.id;

    return InkWell(
      onTap: () => isCurrentUser ? null : openUserProfile(item),
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
                        onPressed: () => onUnFollow(item.id),
                        style: secondaryButtonStyle,
                        child: const Text('Unfollow'),
                      ),
                    )
                  : SizedBox(
                      height: 35,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () => onFollow(item.id),
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
                return buildListItem(item, user);
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
                return buildListItem(item, user);
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
