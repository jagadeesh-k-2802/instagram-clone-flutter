import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/screens/profile/follow_detail_screen.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/post/user_posts_provider.dart';
import 'package:instagram_clone/state/profile/user_provider.dart';
import 'package:instagram_clone/state/post/user_tagged_posts_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/utils/stream_chat.dart';
import 'package:instagram_clone/widgets/post/post_grid_item.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class PublicProfileScreen extends ConsumerStatefulWidget {
  final String? profileId;
  final Object? onFollowChange;

  const PublicProfileScreen({
    super.key,
    required this.profileId,
    required this.onFollowChange,
  });

  @override
  ConsumerState<PublicProfileScreen> createState() =>
      _PublicProfileScreenState();
}

class _PublicProfileScreenState extends ConsumerState<PublicProfileScreen> {
  StreamChatClient client = StreamChatSingleton.instance!.client;

  Future<void> onFollow(GetUserResponseData user) async {
    if (!user.isPrivateAccount) {
      ref.read(globalStateProvider.notifier).incrementFollowingCount();

      if (widget.onFollowChange is Function) {
        (widget.onFollowChange as Function).call('follow');
      }
    } else {
      if (widget.onFollowChange is Function) {
        (widget.onFollowChange as Function).call('requested');
      }
    }

    try {
      await UserService.followUser(userId: user.id);
      ref.refresh(publicUserProvider(widget.profileId ?? '')).isRefreshing;
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onUnFollow(GetUserResponseData user) async {
    if (!user.isPrivateAccount) {
      ref.read(globalStateProvider.notifier).decrementFollowingCount();

      if (widget.onFollowChange is Function) {
        (widget.onFollowChange as Function).call('unfollow');
      }
    } else {
      if (widget.onFollowChange is Function) {
        (widget.onFollowChange as Function).call('delete-requested');
      }
    }

    try {
      await UserService.unFollowUser(userId: user.id);
      ref.refresh(publicUserProvider(widget.profileId ?? '')).isRefreshing;
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onMessage(GetUserResponseData otherUser) async {
    UserResponseData? user = ref.read(globalStateProvider).user;
    final filter = Filter.in_('members', [user!.id, otherUser.id]);
    final prevChannel = await client.queryChannels(filter: filter).last;

    // If already exists return it
    if (prevChannel.firstOrNull != null) {
      if (!mounted) return;
      context.push(Routes.messageDetailPath(prevChannel.first.id ?? ''));
      return;
    }

    // Create channel if not exists with user avatars with opposite ids (username)
    Channel channel = client.channel(
      'messaging',
      id: '${user.id}_${otherUser.id}',
      extraData: {
        'members': [user.id, otherUser.id],
        client.state.currentUser!.id: '$apiUrl/avatar/${otherUser.avatar}',
        otherUser.id: '$apiUrl/avatar/${user.avatar}',
        '${client.state.currentUser!.id}-name': otherUser.name,
        '${otherUser.id}-name': user.name,
      },
    );

    await channel.create();
    if (!mounted) return;
    context.push(Routes.messageDetailPath(channel.id ?? ''));
  }

  void navigateToFollowDetail(
    String userId,
    String username,
    String initialScreen,
  ) {
    context.pushNamed(
      Routes.followDetail,
      extra: FollowDetailScreenArgs(
        userId: userId,
        username: username,
        initialScreen: initialScreen,
      ),
    );
  }

  Widget buildProfileHeader({required GetUserResponseData user}) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 48.0,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: '$apiUrl/avatar/${user.avatar}',
                  ),
                ),
              ),
              SizedBox(
                width: 75,
                child: Column(
                  children: [
                    Text(
                      instagramNumberFormatter(user.postCount),
                      style: titleLargeBold(context),
                    ),
                    Text('Posts', style: textTheme.bodyMedium),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => user.followType != UserFollowType.following &&
                        user.isPrivateAccount
                    ? null
                    : navigateToFollowDetail(
                        user.id,
                        user.username,
                        'followers',
                      ),
                child: SizedBox(
                  width: 75,
                  child: Column(
                    children: [
                      Text(
                        instagramNumberFormatter(user.followersCount),
                        style: titleLargeBold(context),
                      ),
                      Text('Followers', style: textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => user.followType != UserFollowType.following &&
                        user.isPrivateAccount
                    ? null
                    : navigateToFollowDetail(
                        user.id,
                        user.username,
                        'following',
                      ),
                child: SizedBox(
                  width: 75,
                  child: Column(
                    children: [
                      Text(
                        instagramNumberFormatter(user.followingCount),
                        style: titleLargeBold(context),
                      ),
                      Text('Following', style: textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            user.name,
            style: bodyLargeBold(context),
          ),
          const SizedBox(height: 4.0),
          Visibility(
            visible: user.bio.isNotEmpty == true,
            child: Column(
              children: [
                Text(
                  user.bio,
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
          SizedBox(
            height: 36,
            child: Row(
              children: [
                Expanded(
                  child: user.followType == UserFollowType.following
                      ? ElevatedButton(
                          onPressed: () => onUnFollow(user),
                          style: secondaryButtonStyle,
                          child: const Text('Unfollow'),
                        )
                      : user.followType == UserFollowType.requested
                          ? ElevatedButton(
                              onPressed: () => onUnFollow(user),
                              style: secondaryButtonStyle,
                              child: const Text('Requested'),
                            )
                          : ElevatedButton(
                              onPressed: () => onFollow(user),
                              child: const Text('Follow'),
                            ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => onMessage(user),
                    style: secondaryButtonStyle,
                    child: const Text('Message'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showPostItem(GetUserPostsResponseData item) {
    context.push(Routes.postDetailPath(item.id));
  }

  Widget buildNoItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 150,
        horizontal: 32,
      ),
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.camera_alt, size: 80.0),
            const SizedBox(height: 8.0),
            Text('No Posts Yet', style: bodyLargeBold(context)),
          ],
        ),
      ),
    );
  }

  Widget buildPostsTab() {
    ScrollController outerController = ScrollController();

    return ListView(
      controller: outerController,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
                width: double.maxFinite,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  overlayColor: MaterialStatePropertyAll(lightGrayColor),
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.account_box)),
                  ],
                ),
              ),
              SizedBox(
                height: 50 * 10,
                width: double.maxFinite,
                child: TabBarView(
                  children: [
                    RiverPagedBuilder(
                      firstPageKey: 1,
                      limit: 20,
                      provider: userPostsProvider(widget.profileId ?? ''),
                      pullToRefresh: true,
                      newPageProgressIndicatorBuilder: (
                        context,
                        controller,
                      ) {
                        return Container();
                      },
                      itemBuilder: (context, item, index) {
                        return PostGridItem(
                          assetUrl: '$apiUrl/posts/${item.assets[0].url}',
                          assetsCount: item.assets.length,
                          onTap: () => showPostItem(item),
                        );
                      },
                      noItemsFoundIndicatorBuilder: (context, controller) {
                        return buildNoItems();
                      },
                      pagedBuilder: (controller, builder) => PagedGridView(
                        pagingController: controller,
                        builderDelegate: builder,
                        gridDelegate: photoGridDelegate,
                      ),
                    ),
                    RiverPagedBuilder(
                      firstPageKey: 1,
                      limit: 20,
                      provider: userTaggedPostsProvider(
                        widget.profileId ?? '',
                      ),
                      pullToRefresh: true,
                      newPageProgressIndicatorBuilder: (
                        context,
                        controller,
                      ) {
                        return Container();
                      },
                      itemBuilder: (context, item, index) {
                        return PostGridItem(
                          assetUrl: '$apiUrl/posts/${item.assets[0].url}',
                          assetsCount: item.assets.length,
                          onTap: () => showPostItem(item),
                        );
                      },
                      noItemsFoundIndicatorBuilder: (context, controller) {
                        return buildNoItems();
                      },
                      pagedBuilder: (controller, builder) => PagedGridView(
                        pagingController: controller,
                        builderDelegate: builder,
                        gridDelegate: photoGridDelegate,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPrivateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.lock_outline, size: 40.0),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This Account is Private', style: bodyLargeBold(context)),
            const Text('Follow this account to see their photos\nand videos.')
          ],
        )
      ],
    );
  }

  Widget buildData(GetUserResponseData data) {
    return Scaffold(
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return [
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text(data.username)],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(
                  data.bio.isNotEmpty == true ? 220 : 170,
                ),
                child: buildProfileHeader(user: data),
              ),
            )
          ];
        },
        body:
            data.followType != UserFollowType.following && data.isPrivateAccount
                ? buildPrivateAccount()
                : buildPostsTab(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(publicUserProvider(widget.profileId ?? ''));

    return provider.when(
      data: (data) {
        return buildData(data);
      },
      error: (error, stacktrace) {
        return Scaffold(
          appBar: AppBar(),
          body: const Center(child: Text('Something went wrong!')),
        );
      },
      loading: () {
        return Scaffold(
          appBar: AppBar(),
          body: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
